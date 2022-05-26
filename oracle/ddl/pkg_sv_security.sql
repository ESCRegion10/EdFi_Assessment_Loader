CREATE OR REPLACE PACKAGE EDFIDATA."PKG_SV_SECURITY"
AS

/* ***********************************************************************************
Purpose:    This Procedure Performs an LDAP look up on email address and then attempts to
            bind the distinguished name and users password for authentication.

07/20/15 CBull  Original Creation
*********************************************************************************** */
FUNCTION ldap_auth
         (
          p_username IN VARCHAR2,
          p_password IN VARCHAR2
          )
          RETURN BOOLEAN;
/* ***********************************************************************************
Purpose:    This Procedure checks to see if the user is a member of a security group.
 returns: BOOLEAN
04/28/16 CBull  Original Creation
*********************************************************************************** */
FUNCTION group_check (
      p_user_sid     IN NUMBER,
      p_group        IN VARCHAR2
  ) RETURN boolean;
/* ***********************************************************************************
Purpose:    This Procedure checks to see if the user is a member of a security group.
 returns: Y/N
04/28/16 CBull  Original Creation
*********************************************************************************** */
FUNCTION group_check_YN (
      p_user_sid     IN NUMBER,
      p_group        IN VARCHAR2
  ) return varchar2;
/* ***********************************************************************************
Purpose:    This Procedure checks to see if the user has a specified permission to
            perform an action within the headstart application.

08/27/15 CBull  Original Creation
*********************************************************************************** */
FUNCTION permission_check (
      p_user_sid     IN NUMBER,
      p_permission   IN VARCHAR2
  ) RETURN BOOLEAN;
/* ***********************************************************************************
Purpose:    This Procedure checks to see if the user has a specified permission to
            perform an action within the headstart application.
 returns: varchar2 of Y or N
11/18/15 CBull  Original Creation
*********************************************************************************** */
FUNCTION permission_check2 (
      p_user_sid     IN NUMBER,
      p_permission   IN VARCHAR2
  ) RETURN varchar2;
/* ***********************************************************************************
Purpose:    This Procedure checks to see if a specified permission is included in a group

08/27/15 CBull  Original Creation
*********************************************************************************** */
FUNCTION fn_group_permission_check (
      p_group_sid   IN number
     ,p_permission  IN VARCHAR2
  ) RETURN BOOLEAN;

END pkg_sv_security ;
/
grant execute on EDFIDATA.PKG_SV_SECURITY to EDFIAPP;


CREATE OR REPLACE PACKAGE BODY EDFIDATA.pkg_sv_security
AS
/* ***********************************************************************************
Purpose:    This Procedure Performs an LDAP look up on email address and then attempts to
            bind the distinguished name and users password for authentication.

07/20/15 CBull  Original Creation
*********************************************************************************** */
FUNCTION ldap_auth(
  p_username IN VARCHAR2,
  p_password IN VARCHAR2
)
RETURN BOOLEAN IS
  l_ldap_host     VARCHAR2(256) := 'ldap.region10.org'; --'appauth.esc10.org';
 -- l_ldap_port     NUMBER        := 3268;
  l_ldap_port     NUMBER        := 3269;
  l_ldap_base     VARCHAR2(256);
  l_sa_name       VARCHAR2(256) := 'CN=ADBind,CN=Managed Service Accounts,DC=REGION10,DC=ESC10,DC=ORG';
  l_sa_pw         VARCHAR2(256) := 'S7uckH3r3!';
--  l_wallet_dir    VARCHAR2(256) := 'file:/u01/app/oracle/product/11.2.0/xe/wallet';  -- old
  l_wallet_dir    VARCHAR2(256) := 'file:/u01/app/oracle/12.1/db_1/wallet';
  l_user_dn       VARCHAR2(256) := NULL;
  l_user_sid      NUMBER;
  l_account_locked CHAR;
  l_new_user_flag  CHAR := 'N';

  l_retval        PLS_INTEGER;
  l_session       DBMS_LDAP.session;
  l_attrs         DBMS_LDAP.string_collection;
  l_message       DBMS_LDAP.message;
  l_entry         DBMS_LDAP.message;
  l_attr_name     VARCHAR2(256);
  l_ber_element   DBMS_LDAP.ber_element;
  l_vals          DBMS_LDAP.string_collection;

BEGIN
  -- Verify that the user password/id are not null.  A null Password will not result in an exception
  -- and gives the appearance that the bind succeeded.
  IF p_username is null or p_password is null THEN
    APEX_UTIL.set_custom_auth_status(p_status => 'User ID/Password Required');
    APEX_UTIL.SET_AUTHENTICATION_RESULT(1);
    pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'User ID/Password Required',
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
    RETURN FALSE;
  END IF;

  -- determine if the user is internal or external to region10 and set connection info.
  IF upper(substr(p_username,instr(p_username,'@',1)+1)) = 'REGION10.ORG' THEN
      l_ldap_base  := 'dc=region10,dc=esc10,dc=org';
  ELSE
      l_ldap_base  := 'ou='||Upper(substr(p_username,1,1))||',dc=appauth,dc=esc10,dc=org';
  END IF;
  -- Choose to raise exceptions.
  DBMS_LDAP.use_exception := TRUE;

  -- Connect to the LDAP server.
  l_session := DBMS_LDAP.init(hostname => l_ldap_host,
                              portnum  => l_ldap_port);

  -- open ssl connection for secure communications
  l_retval := DBMS_LDAP.open_ssl(l_session,l_wallet_dir,'Spock1234',2);

  -- bind the service account
  l_retval := DBMS_LDAP.simple_bind_s(ld     => l_session,
                                      dn     => l_sa_name,
                                      passwd => l_sa_pw);

   /********************************************
     issue the search for the DN based on the email address
   ********************************************/
  l_attrs(1) := 'DistinguishedName'; -- retrieve distinguished name based on the email address
  l_retval := DBMS_LDAP.search_s(ld       => l_session,
                                 base     => l_ldap_base,
                                 scope    => DBMS_LDAP.SCOPE_SUBTREE,
                                 filter   => 'mail='||p_username,
                                 attrs    => l_attrs,
                                 attronly => 0,
                                 res      => l_message);

  IF DBMS_LDAP.count_entries(ld => l_session, msg => l_message) > 0 THEN
    -- Get all the entries returned by our search.
    l_entry := DBMS_LDAP.first_entry(ld  => l_session,
                                     msg => l_message);

    << entry_loop >>
    WHILE l_entry IS NOT NULL LOOP
      -- Get all the attributes for this entry.

      l_attr_name := DBMS_LDAP.first_attribute(ld        => l_session,
                                               ldapentry => l_entry,
                                               ber_elem  => l_ber_element);
      << attributes_loop >>
      WHILE l_attr_name IS NOT NULL LOOP
        -- Get all the values for this attribute.
        l_vals := DBMS_LDAP.get_values (ld        => l_session,
                                        ldapentry => l_entry,
                                        attr      => l_attr_name);
        << values_loop >>
        FOR i IN l_vals.FIRST .. l_vals.LAST LOOP
          --DBMS_OUTPUT.PUT_LINE('ATTIBUTE_NAME: ' || l_attr_name || ' = ' || SUBSTR(l_vals(i),1,200));
          l_user_dn := l_vals(i);
        END LOOP values_loop;
        l_attr_name := DBMS_LDAP.next_attribute(ld        => l_session,
                                                ldapentry => l_entry,
                                                ber_elem  => l_ber_element);
      END LOOP attibutes_loop;
      l_entry := DBMS_LDAP.next_entry(ld  => l_session,
                                      msg => l_entry);
    END LOOP entry_loop;
  ELSE
    --DBMS_OUTPUT.PUT_LINE('Search for Email returned zero results');
    APEX_UTIL.set_custom_auth_status(p_status => 'Invalid User Id/Password');
    APEX_UTIL.SET_AUTHENTICATION_RESULT(1);
    pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'User name(email) not found',
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
    Return FALSE;
  END IF;
  /********************************************
     Auth with the users DN and Password
   ********************************************/
  -- end the previous session --
  DBMS_LDAP.use_exception := TRUE;
  l_retval := DBMS_LDAP.unbind_s(ld => l_session);
  -- Connect to the LDAP server.
  l_session := DBMS_LDAP.init(hostname => l_ldap_host,
                            portnum  => l_ldap_port);
  -- open ssl connection
  l_retval := DBMS_LDAP.open_ssl(l_session,l_wallet_dir,'Spock1234',2);

  -- attempt to bind with user DN and Password
  l_retval := DBMS_LDAP.simple_bind_s(ld     => l_session,
                                    dn     => l_user_dn,
                                    passwd => p_password);
  -- Unbind the session as it is not needed anymore
  l_retval := DBMS_LDAP.unbind_s(ld => l_session);

  -- if we got this far then the user was authenticated, update the user record based on successful login.
  -- or insert the user if they don't exist.
  begin
  Select user_account.user_sid
        ,user_account.account_locked
    into l_user_sid
        ,l_account_locked
    from user_account
   where user_account.user_id = upper(p_username);
   -- update the user account if not locked, if locked return FALSE
   IF l_account_locked = 'Y' THEN
     APEX_UTIL.set_custom_auth_status(p_status => 'Your User Account is locked, Please contact the Ed-Fi CCMR Admin');
     APEX_UTIL.SET_AUTHENTICATION_RESULT(2);
     pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'Login Rejected - Account Locked',
                                          p_action_type => 'Login',
                                          p_action_result => 'Rejected',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
     Return FALSE;
   ELSE
     PKG_IDMGR_USER_ACCOUNT.PROC_UPD_USER_ACCOUNT_LOGIN_DT (P_USER_SID => l_user_sid);
     APEX_UTIL.SET_AUTHENTICATION_RESULT(0);
     -- Get and set the users default application
     APEX_UTIL.SET_SESSION_STATE('FSP_AFTER_LOGIN_URL',APEX_UTIL.PREPARE_URL(
        p_url => 'f?p='||V('APP_ID')||':HOME:'||V('APP_SESSION')||':::&c='||V('G_WORKSPACE'),
        p_checksum_type => 'SESSION'));
   END IF;
  exception
    when no_data_found then
      -- insert a record into the user_account Table
      PKG_IDMGR_USER_ACCOUNT.PROC_INS_USER_ACCOUNT (
                              P_DISTRICT_SID             => -1,
                              P_USER_ID                  => p_username,
                              P_USER_FIRST_NAME          => null,
                              P_USER_LAST_NAME           => null,
                              P_EMAIL_ADDRESS            => p_username,
                              P_SUPER_USER               => 'N',
                              P_NEW_LOGIN_USER            => 'Y');
       l_new_user_flag := 'Y';
       APEX_UTIL.SET_SESSION_STATE('FSP_AFTER_LOGIN_URL',APEX_UTIL.PREPARE_URL(
        p_url => 'f?p='||V('APP_ID')||':WELCOME:'||V('APP_SESSION')||':::&c='||V('G_WORKSPACE'),
        p_checksum_type => 'SESSION'));
  END;
  -- log the successfull login
  pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'Login Authenticated',
                                          p_action_type => 'Login',
                                          p_action_result => 'Success',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);


  -- !!!!!!!!!! No exceptions mean you are authenticated. !!!!!!!!!!!!
  -- determine where to send the user, either the welcome page or their default app
  IF l_new_user_flag = 'N' THEN
    APEX_UTIL.SET_SESSION_STATE('FSP_AFTER_LOGIN_URL',APEX_UTIL.PREPARE_URL(
        p_url => 'f?p='||V('APP_ID')||':HOME:'||V('APP_SESSION')||':::&c='||V('G_WORKSPACE'),
        p_checksum_type => 'SESSION'));
  END IF;

  RETURN TRUE;

EXCEPTION
  WHEN DBMS_LDAP.init_failed THEN
    DBMS_OUTPUT.PUT_LINE(RPAD('simple_bind_s Returns ',25,' ') || ': Unable to connect to LDAP Server');
    pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'LDAP Connection Failed',
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
    RAISE;
  WHEN DBMS_LDAP.GENERAL_ERROR THEN
    -- the general error will be raised for many different problems. One of which is "Invalid credentials",
    -- so if the this one is raised then simply return false.  Any other errors, re-raise the exception.
    IF INSTR(SQLERRM,'Invalid credentials',1) > 0 THEN
      DBMS_OUTPUT.PUT_LINE('Incorrect username and/or password ');
      APEX_UTIL.set_custom_auth_status(p_status => 'Invalid Username/Password');
      APEX_UTIL.SET_AUTHENTICATION_RESULT(1);
      -- Increment the attempt counter if the user exists.
      PKG_IDMGR_USER_ACCOUNT.PROC_UPD_USER_MISSED_LOGIN (
                                          P_USER_ID  => UPPER(p_username));
      -- log the failed login
      pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'Incorrect username and/or password',
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
    ELSE
      DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK());
      DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE());
      APEX_UTIL.set_custom_auth_status(p_status => 'An error occurred in the login process. Try again or contact the system administrator.');
      APEX_UTIL.SET_AUTHENTICATION_RESULT(3);
      pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => SQLCODE||': '||SUBSTR(SQLERRM,1,200),
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
      RAISE;
    END IF;
    Return FALSE;
  WHEN OTHERS THEN
    -- An unknown error occured, re-raise the exception
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK());
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE());
    l_retval := DBMS_LDAP.unbind_s(ld => l_session);
    APEX_UTIL.set_custom_auth_status(p_status => 'An error occurred in the login process. Try again or contact the system administrator.');
    APEX_UTIL.SET_AUTHENTICATION_RESULT(3);
    pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => SQLCODE||': '||SUBSTR(SQLERRM,1,200),
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
                                          p_attempts => 0,
                                          p_user_ip_address => null,
                                          p_browser => null);
    RAISE;
END ldap_auth;
/* ***********************************************************************************
Purpose:    This Procedure checks to see if the user is a member of a security group.
 returns: BOOLEAN
04/28/16 CBull  Original Creation
*********************************************************************************** */
FUNCTION group_check (
      p_user_sid     IN NUMBER,
      p_group        IN VARCHAR2
  ) RETURN BOOLEAN IS

  l_found char := 'N';
begin

  select distinct 'Y'
  into l_found
  from user_group
  join SECURITY_GROUP on SECURITY_GROUP.SECURITY_GROUP_SID = USER_GROUP.SECURITY_GROUP_SID
  where user_group.user_sid = P_USER_SID
    and upper(SECURITY_GROUP.SECURITY_GROUP_NAME) = upper(p_group);

  return true;

  exception
    when no_data_found then
      return false;

end group_check;
/* ***********************************************************************************
Purpose:    This Procedure checks to see if the user is a member of a security group.
 returns: Y/N
04/28/16 CBull  Original Creation
*********************************************************************************** */
FUNCTION group_check_YN (
      p_user_sid     IN NUMBER,
      p_group        IN VARCHAR2
  ) RETURN VARCHAR2 IS

  l_found char := 'N';
begin

  select distinct 'Y'
  into l_found
  from user_group
  join SECURITY_GROUP on SECURITY_GROUP.SECURITY_GROUP_SID = USER_GROUP.SECURITY_GROUP_SID
  where user_group.user_sid = P_USER_SID
    and upper(SECURITY_GROUP.SECURITY_GROUP_NAME) = upper(p_group);

  return l_found;

  exception
    when no_data_found then
      return l_found;

end group_check_YN;
/* ***********************************************************************************
Purpose:    This Procedure checks to see if the user has a specified permission to
            perform an action within the headstart application.
 returns: BOOLEAN
08/27/15 CBull  Original Creation
*********************************************************************************** */
FUNCTION permission_check (
      p_user_sid     IN NUMBER,
      p_permission   IN VARCHAR2
  ) RETURN BOOLEAN IS

  l_found char := 'N';
begin

  select distinct 'Y'
  into l_found
  from user_group
  join security_group_permission on security_group_permission.security_group_sid = user_group.security_group_sid
  join application_permission on application_permission.permission_sid = security_group_permission.permission_sid
  where user_group.user_sid = P_USER_SID
    and upper(application_permission.permission_name) = upper(P_PERMISSION);

  return true;

  exception
    when no_data_found then
      return false;

end permission_check;
/* ***********************************************************************************
Purpose:    This Procedure checks to see if the user has a specified permission to
            perform an action within the headstart application.
 returns: varchar2 of Y or N
11/18/15 CBull  Original Creation
*********************************************************************************** */
FUNCTION permission_check2 (
      p_user_sid     IN NUMBER,
      p_permission   IN VARCHAR2
  ) RETURN VARCHAR2 IS

  l_found char := 'N';
begin

  select distinct 'Y'
  into l_found
  from user_group
  join security_group_permission on security_group_permission.security_group_sid = user_group.security_group_sid
  join application_permission on application_permission.permission_sid = security_group_permission.permission_sid
  where user_group.user_sid = P_USER_SID
    and upper(application_permission.permission_name) = upper(P_PERMISSION);

  return l_found;

  exception
    when no_data_found then
      return l_found;

end permission_check2;
/* ***********************************************************************************
Purpose:    This Function checks to see if a specified permission is included in a group

08/27/15 CBull  Original Creation
*********************************************************************************** */
FUNCTION fn_group_permission_check (
      p_group_sid   IN number
     ,p_permission  IN VARCHAR2
  ) RETURN BOOLEAN IS

  l_found char := 'N';
begin

  select 'Y'
  into l_found
  from security_group_permission
  join application_permission on application_permission.permission_sid = security_group_permission.permission_sid
  where security_group_permission.security_group_sid = P_GROUP_SID
    and upper(application_permission.permission_name) = upper(P_PERMISSION);

  return true;

  exception
    when no_data_found then
      return false;

end fn_group_permission_check;

END pkg_sv_security;
/
grant execute on EDFIDATA.PKG_SV_SECURITY to EDFIAPP;


