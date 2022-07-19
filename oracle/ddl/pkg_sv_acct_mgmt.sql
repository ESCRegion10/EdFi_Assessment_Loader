CREATE OR REPLACE PACKAGE EDFIDATA.pkg_sv_acct_mgmt
AS

PROCEDURE proc_reset_email
          (  p_user_sid     IN number
            ,p_workspace_id IN number default null) ;

PROCEDURE proc_forgot_password
          (  p_user_id      IN varchar2
            ,p_workspace_id IN number);

PROCEDURE proc_send_email
          (  p_email_to IN VARCHAR2
            ,p_email_from IN VARCHAR2
            ,p_type IN VARCHAR2   ) ;

PROCEDURE proc_log_trans
   (  p_USER_SID				IN NUMBER
			,p_USER_ID				IN VARCHAR2
			,p_LOG_MESSAGE			IN VARCHAR2
			,p_ACTION_TYPE			IN VARCHAR2
			,p_ACTION_RESULT		IN VARCHAR2
			,p_ATTEMPTS				IN NUMBER
			,p_USER_IP_ADDRESS		IN VARCHAR2
      ,p_BROWSER		IN VARCHAR2 DEFAULT NULL );


PROCEDURE proc_good_login
          (  p_USER_SID        IN number   ) ;


PROCEDURE proc_disable_account
          (  p_USER_SID				IN number   ) ;

 FUNCTION fn_attempt_login  (p_USER_SID IN number   )
    RETURN number ;

PROCEDURE proc_push_email_queue ;

END pkg_sv_acct_mgmt ;
/
grant execute on EDFIDATA.PKG_SV_ACCT_MGMT to EDFIAPP;


CREATE OR REPLACE PACKAGE BODY EDFIDATA.pkg_sv_acct_mgmt
AS
PROCEDURE proc_reset_email
          (  p_user_sid IN number
            ,p_workspace_id IN number default null)

IS
    l_email_subject             VARCHAR2 (90);
    l_email_application_link    VARCHAR2 (400);
    l_email_salutation          VARCHAR2 (400);
    l_body                      CLOB;
    l_body_html                 CLOB;
    l_temp_pw                   varchar2(20)  := 'default' ;
    l_user_sid                  number;
    l_user_id                   varchar2(90);
    l_email_address             varchar2(90);
    l_update_user_sid           number;
    l_update_user_id            user_account.user_id%TYPE;

BEGIN

  /* Generate new PW */
     l_temp_pw := pkg_idmgr_user_account.fn_generate_password;

   /* get the user_id and email_address */
   select USER_ID
         ,EMAIL_ADDRESS
     into L_USER_ID
         ,L_EMAIL_ADDRESS
     from USER_ACCOUNT
    where USER_SID = P_USER_SID;

    /* Get the user_sid of the update user. it is possible that there is no logged in
       user as this is a forgot password reset, so we will use the id of the user
       we are updating since they are updating themselves.*/
   begin
     select USER_SID
           ,USER_ID
       into L_UPDATE_USER_SID
           ,L_UPDATE_USER_ID
       from USER_ACCOUNT
      where USER_ID = SYS_CONTEXT('REVEAL_CTX','USER_NAME');
      exception
        when no_data_found then
          select USER_SID
                 ,USER_ID
             into L_UPDATE_USER_SID
                 ,L_UPDATE_USER_ID
             from USER_ACCOUNT
            where USER_SID = P_USER_SID;
          -- since this is a forgot password the user is not logged in so we
          -- have to set the security group which is the workspace id.
          apex_util.set_security_group_id(p_security_group_id => p_workspace_id);
    end;

    /* UPDATE THE USER PASSWORD AND INFO */
    update  user_account
       set  password_expiration_date = sysdate - 1,
            password  =  'none',-- pkg_sv_security.fn_get_hash(l_user_id, l_temp_pw),
            password_update_date = sysdate,
            attempt_ctr = 0,
            account_locked = 'N',
            update_date = sysdate,
            updated_by = l_update_user_sid
    where user_sid = p_user_sid;
    commit;

   /* Get the email */
   /*select  email_subject, email_body, application_link,salutation
     into  l_email_subject, l_body_html, l_email_application_link,l_email_salutation
     from  email_specification
     where email_type_sid = '4';*/

    l_body_html := l_body_html || l_temp_pw || l_email_application_link || l_email_salutation;
    l_body  := 'To view the content of this message, please use an HTML enabled mail client.'||utl_tcp.crlf;

  /* Send the email */
   apex_mail.send(
    p_to        => l_email_address,
    p_from      => 'donotreply@region10.org',
    p_body      => l_body,
    p_body_html => l_body_html,
    p_subj      => l_email_subject   );

    APEX_MAIL.PUSH_QUEUE;

  /* LOG THE CHANGE */
  pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => l_user_sid,
            p_user_id => l_update_user_id,
            p_log_message => 'Reset User Password: '||l_user_id,
            p_action_type => 'Password Reset',
            p_action_result => 'Successfully Reset User Password, Email Sent',
            p_attempts => 1,
            p_user_ip_address => OWA_UTIL.get_cgi_env ('REMOTE_ADDR'),
            p_browser => OWA_UTIL.GET_CGI_ENV('HTTP_USER_AGENT'));

exception
  when others then
    pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => l_user_sid,
            p_user_id => l_update_user_id,
            p_log_message => DBMS_UTILITY.FORMAT_ERROR_BACKTRACE,
            p_action_type => 'Password Reset',
            p_action_result => sqlerrm(sqlcode),
            p_attempts => 1,
            p_user_ip_address => OWA_UTIL.get_cgi_env ('REMOTE_ADDR'),
            p_browser => OWA_UTIL.GET_CGI_ENV('HTTP_USER_AGENT'));

END  proc_reset_email ;
/************************************************
procedure: proc_reset_email
Purpose:   overloads the proc so that it can be called
           with a user ID istead of a sid.  Mainly for use by the
           forgot password on the login page.
Log:
08-26-13 CB Original Creation
*****************************************************/
PROCEDURE proc_forgot_password
          (  p_user_id IN varchar2
            ,p_workspace_id IN number)
IS
v_user_sid number;
BEGIN
  select user_account.user_sid
    into v_user_sid
    from user_account
   where user_account.user_id = p_user_id;

  proc_reset_email(p_user_sid     => v_user_sid
                  ,p_workspace_id => p_workspace_id);

END  proc_forgot_password ;

PROCEDURE proc_send_email
          (  p_email_to IN VARCHAR2
            ,p_email_from IN VARCHAR2
            ,p_type IN VARCHAR2   )

IS
    l_email_subject             VARCHAR2 (90);
    l_email_application_link    VARCHAR2 (400);
    l_email_salutation          VARCHAR2 (400);
    l_body                      CLOB;
    l_body_html                 CLOB;
    l_user_sid number;
    l_user_id varchar2(90);
    l_password_expiration_date date;
    l_user_first_name varchar2(50);
    l_user_last_name varchar2(50);
    l_email_address varchar2(90);
    l_account_locked varchar2(1);
    l_active_account_flag varchar2(1);
    l_district_sid number;
    l_attempt_ctr number;
    l_last_login_date date;
    l_first_login_flag varchar2(1);

BEGIN

   /* Get the user info */

   select user_sid,   user_id,    password_expiration_date,  user_first_name,   user_last_name,    email_address, account_locked,  active_account_flag, district_sid, attempt_ctr, last_login_date , first_login_flag
    into l_user_sid, l_user_id, l_password_expiration_date,  l_user_first_name, l_user_last_name, l_email_address, l_account_locked, l_active_account_flag, l_district_sid, l_attempt_ctr, l_last_login_date, l_first_login_flag
    from user_account
   where upper(user_id)  = upper( p_email_to)  ;


   /* Get the email */

 /*  select  email_subject, email_body, application_link,salutation
     into  l_email_subject, l_body_html, l_email_application_link,l_email_salutation
     from  email_specification
     where email_type_sid = p_type;*/

 ---   l_body_html :=  ' Attn: ' || l_user_first_name || ' ' || l_user_last_name  || l_body_html ;
    l_body_html := l_body_html   || l_email_application_link || l_email_salutation;
    l_body  := 'To view the content of this message, please use an HTML enabled mail client.'||utl_tcp.crlf;

  /* Send the email */
   apex_mail.send(
    p_to        => p_email_to,
    p_from      => p_email_from,
    p_body      => l_body,
    p_body_html => l_body_html,
    p_subj      => l_email_subject   );

    APEX_MAIL.PUSH_QUEUE;

END  proc_send_email ;

/* Populate Transaction Log
20130603    T. Esposito     proc adds browswer info to transaction log
*/

PROCEDURE proc_log_trans
   ( p_USER_SID				IN NUMBER
		,p_USER_ID				IN VARCHAR2
		,p_LOG_MESSAGE			IN VARCHAR2
		,p_ACTION_TYPE			IN VARCHAR2
		,p_ACTION_RESULT		IN VARCHAR2
		,p_ATTEMPTS				IN NUMBER
		,p_USER_IP_ADDRESS		IN VARCHAR2
    ,p_BROWSER		IN VARCHAR2 DEFAULT NULL)
IS
l_user_sid number;
BEGIN
  begin
    select user_sid
    into l_user_sid
    from user_account
    where user_account.user_id = p_USER_ID;
    exception
      when no_data_found then
        l_user_sid := null;
  end;
  insert into security_transaction_log
  (security_transaction_sid, user_sid, user_id, transaction_date,
    log_message, action_type, action_result, attempts, user_ip_address, browser)
values
  ( SID_SEQUENCE.NEXTVAL  , l_user_sid, p_user_id, sysdate  ,
    p_log_message, p_action_type, p_action_result, p_attempts, p_user_ip_address, substr(p_browser,1,200));
	commit;

END  proc_log_trans ;

PROCEDURE proc_good_login
          (  p_USER_SID				IN number   )
IS
  l_date date  := sysdate;

BEGIN
  update user_account
     set attempt_ctr = 0,
         last_login_date =  l_date,
         first_login_flag = 'N'
   where user_sid = p_USER_SID;
	commit;

END  proc_good_login  ;


PROCEDURE proc_disable_account
          (  p_USER_SID				IN number   )
IS
     l_date date  := sysdate;
BEGIN
   update  user_account
       set  password_expiration_date = l_date,
            password  =   'LOCKED',
            password_update_date =  l_date ,
            account_locked = 'Y',
            active_account_flag = 'N'
    where user_sid = p_USER_SID;
    commit;

END  proc_disable_account  ;

FUNCTION fn_attempt_login  (p_USER_SID IN number   )
RETURN number
AS
 l_date date  := sysdate;
 return_attempts number  ;
BEGIN
   update user_account
      set attempt_ctr = attempt_ctr + 1,
          last_login_date =  l_date
    where user_sid = p_USER_SID;
   commit;

	select attempt_ctr into  return_attempts
	  from user_account
	 where user_sid = p_USER_SID;

RETURN return_attempts ;
EXCEPTION
when NO_DATA_FOUND
   then return 329;
 when others
    then raise_application_error(-329,'Unknown Exception in fn_set_role Function');
END fn_attempt_login ;

PROCEDURE proc_push_email_queue
IS
   PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
   EXECUTE IMMEDIATE 'BEGIN APEX_MAIL.PUSH_QUEUE;  COMMIT;   END; ';
END  proc_push_email_queue ;

END pkg_sv_acct_mgmt;
/
grant execute on EDFIDATA.PKG_SV_ACCT_MGMT to EDFIAPP;


