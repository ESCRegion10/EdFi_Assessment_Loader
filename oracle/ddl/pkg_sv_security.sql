CREATE OR REPLACE PACKAGE "PKG_SV_SECURITY"
AS
FUNCTION ldap_auth(
  p_username IN VARCHAR2,
  p_password IN VARCHAR2
)
RETURN boolean;
END pkg_sv_security ;
/
CREATE OR REPLACE PACKAGE BODY pkg_sv_security
as
type t_resultArray is table of varchar2(255) index by varchar2(75); 

  c_ldap_host                   varchar2(256);
  c_ldap_port                   number;
  c_ldap_port_global            number;
  c_ldap_base_appauth           varchar2(256);
  c_ldap_base_r10               varchar2(256);
  c_sa_name                     varchar2(256);
  c_sa_pw                       varchar2(256);
  c_wallet_dir                  varchar2(256);  
  c_wallet_pass                 varchar2(20);


-- open a secure session to active directory
-- the port type indicates wether to use the appauth directory(L) or the 
-- global directory(G). the global directory is used for R10 employees
function fn_ldap_connect (P_PORT_TYPE char default 'L')
  return DBMS_LDAP.session as
  
l_retval        PLS_INTEGER;
l_session       DBMS_LDAP.session;
l_port          number;
begin
  
  -- Choose to raise exceptions.
  DBMS_LDAP.use_exception := TRUE;
  
  --set the port based on the port type
  case P_PORT_TYPE
    when 'L' then l_port := c_ldap_port;
    when 'G' then l_port := c_ldap_port_global;
  end case;
  --dbms_output.put_line('before init: '||c_ldap_host||' port: '||l_port);
  -- Connect to the LDAP server.
  l_session := DBMS_LDAP.init(hostname => c_ldap_host,
                              portnum  => l_port);
	dbms_output.put_line('after init: ');
  if l_port in (636,3269) then
    -- open ssl connection for secure communications
		--dbms_output.put_line('before ssl dir: '||c_wallet_dir||' pass: '||c_wallet_pass);
    l_retval := DBMS_LDAP.open_ssl(l_session,c_wallet_dir,c_wallet_pass,2);
  end if;
  
  -- bind the service account
  l_retval := DBMS_LDAP.simple_bind_s(ld     => l_session,
                                      dn     => c_sa_name,
                                      passwd => c_sa_pw);
  return l_session;
  
end fn_ldap_connect;

-- disconnect from active directory
function fn_ldap_disconnect (
  P_SESSION       in DBMS_LDAP.session
  )  return PLS_INTEGER as
  
l_retval        PLS_INTEGER;
l_session       DBMS_LDAP.session := P_SESSION;
begin
  
  -- Unbind the session as it is not needed anymore
  l_retval := DBMS_LDAP.unbind_s(ld => l_session);
  
  return l_retval;
  
end fn_ldap_disconnect;
/* ***************************************************************
retrieve ALL ATTRIBUTES based on the email address

LDAP to ORacle mapping:
----------------------
Column                  Ldap-Display-Name
----------------------  ----------------------------
USER_SID                [NOT STORED IN ldap]
CAMPUS_SID              company
POSITION_TITLE_SID      title
USER_ID                 mail
TEMP_PASSWORD_CODE      [NOT STORED IN ldap]
FIRST_NAME              givenName
LAST_NAME               sn
FULL_NAME               cn
SECONDARY_EMAIL_ADDRESS otherMailbox
MIDDLE_INITIAL          middleName
SALUTATION              personalTitle
WORK_PHONE              telephoneNumber
MOBILE_PHONE            mobile
ADDRESS                 streetAddress
CITY                    l [this is the letter L]
STATE                   st
ZIP                     postalCode
COUNTY                  division
LDAP_DN                 distinguishedName
SPECIAL_ACCOMMODATIONS  info
CREATE_DATE             whenCreated
UPDATE_DATE             WhenChanged
ACCOUNT_LOCKED          userAccountControl
LAST_LOGIN_DATE         lastLogonTimestamp
[SECURITY_QUEST_ANSWER]  comment
[SECURITY_QUESTION_NAME] postalAddress

***************************************************************** */
procedure ldap_search_email (
  P_SESSION                 in DBMS_LDAP.session,
  P_LDAP_BASE               in varchar2,
  P_USERNAME                in varchar2,
  P_SEARCH_ATTRS            in DBMS_LDAP.string_collection,
  P_SEARCH_RESULT           out t_resultArray
  ) as
  
  l_retval        PLS_INTEGER;
  l_attrs         DBMS_LDAP.string_collection;
  l_message       DBMS_LDAP.message;
  l_entry         DBMS_LDAP.message;
  l_attr_name     VARCHAR2(256);
  l_ber_element   DBMS_LDAP.ber_element;
  l_vals          DBMS_LDAP.string_collection;
  l_idx           VARCHAR2(256);
  
  begin
    dbms_output.put_line('**************Start Search**********');

    -- attributes TO SEARCH
    if P_SEARCH_ATTRS is null 
      or P_SEARCH_ATTRS.COUNT = 0 then 
      l_attrs(1) := '*'; 
    else 
      l_attrs := P_SEARCH_ATTRS;
    end if;
    
    l_retval := DBMS_LDAP.search_s(ld       => P_session,
                                   base     => P_ldap_base,
                                   scope    => DBMS_LDAP.SCOPE_SUBTREE,
                                   filter   => 'mail=' ||p_username,
                                   attrs    => l_attrs,
                                   attronly => 0,
                                   res      => l_message);

    IF DBMS_LDAP.count_entries(ld => P_SESSION, msg => l_message) > 0 THEN
      -- Get all the entries returned by our search.
      l_entry := DBMS_LDAP.first_entry(ld  => P_SESSION,
                                       msg => l_message);

      << entry_loop >>
      WHILE l_entry IS NOT NULL LOOP
        -- Get all the attributes for this entry.

        l_attr_name := DBMS_LDAP.first_attribute(ld        => P_SESSION,
                                                 ldapentry => l_entry,
                                                 ber_elem  => l_ber_element);
        << attributes_loop >>
        WHILE l_attr_name IS NOT NULL LOOP
          -- Get all the values for this attribute.
          if l_attr_name not in ('objectGUID','objectSid') then -- get_values can't handle these 2.
            l_vals := DBMS_LDAP.get_values (ld        => P_SESSION,
                                            ldapentry => l_entry,
                                            attr      => l_attr_name);
            << values_loop >>
            FOR i IN l_vals.FIRST .. l_vals.LAST LOOP
              --DBMS_OUTPUT.PUT_LINE('ATTIBUTE_NAME: ' || l_attr_name || ' = ' || SUBSTR(l_vals(i),1,200));
              
              P_SEARCH_RESULT(l_attr_name) := l_vals(i);
              
            END LOOP values_loop;
          end if;
          -- get next attribute
          l_attr_name := DBMS_LDAP.next_attribute(ld        => P_SESSION,
                                                  ldapentry => l_entry,
                                                  ber_elem  => l_ber_element);
        END LOOP attibutes_loop;
        -- get next entry
        l_entry := DBMS_LDAP.next_entry(ld  => P_SESSION,
                                        msg => l_entry);
      END LOOP entry_loop;
      if l_attrs(1) = '*' then
        -- we need to pad the attr result list with any missing attributes when the search attribute = '*'
        if not P_SEARCH_RESULT.EXISTS('personalTitle')          then P_SEARCH_RESULT('personalTitle')         := null; end if;
        if not P_SEARCH_RESULT.EXISTS('givenName')              then P_SEARCH_RESULT('givenName')             := null; end if;
        if not P_SEARCH_RESULT.EXISTS('middleName') 
            or P_SEARCH_RESULT('middleName') = ' '              then P_SEARCH_RESULT('middleName')            := null; end if;
        if not P_SEARCH_RESULT.EXISTS('sn')                     then P_SEARCH_RESULT('sn')                    := null; end if;
        if not P_SEARCH_RESULT.EXISTS('otherMailbox')  
            or P_SEARCH_RESULT('otherMailbox') = ' '            then P_SEARCH_RESULT('otherMailbox')          := null; end if;
        if not P_SEARCH_RESULT.EXISTS('telephoneNumber')        then P_SEARCH_RESULT('telephoneNumber')       := null; end if;
        if not P_SEARCH_RESULT.EXISTS('mobile')                 then P_SEARCH_RESULT('mobile')                := null; end if;
        if not P_SEARCH_RESULT.EXISTS('streetAddress')          then P_SEARCH_RESULT('streetAddress')         := null; end if;
        if not P_SEARCH_RESULT.EXISTS('l')                      then P_SEARCH_RESULT('l')                     := null; end if;
        if not P_SEARCH_RESULT.EXISTS('st')                     then P_SEARCH_RESULT('st')                    := null; end if;
        if not P_SEARCH_RESULT.EXISTS('postalCode')             then P_SEARCH_RESULT('postalCode')            := null; end if;
        if not P_SEARCH_RESULT.EXISTS('division')  /*county*/   then P_SEARCH_RESULT('division')              := null; end if;
        if not P_SEARCH_RESULT.EXISTS('comment') /*securityQuestionAnswer*/ then P_SEARCH_RESULT('comment')   := null; end if;
        if not P_SEARCH_RESULT.EXISTS('postalAddress') /*securityQuestion*/ then P_SEARCH_RESULT('postalAddress') := null; end if;
        if not P_SEARCH_RESULT.EXISTS('info') /*specialAccomodations*/ 
            or P_SEARCH_RESULT('info') = ' '                    then P_SEARCH_RESULT('info')      := null; end if;
        if not P_SEARCH_RESULT.EXISTS('title')                  then P_SEARCH_RESULT('title')                 := null; end if;
        if not P_SEARCH_RESULT.EXISTS('company')                then P_SEARCH_RESULT('company')               := null; end if;
        if not P_SEARCH_RESULT.EXISTS('userAccountControl')     then P_SEARCH_RESULT('userAccountControl')    := null; end if;
        if not P_SEARCH_RESULT.EXISTS('whenCreated')            then P_SEARCH_RESULT('whenCreated')           := null; end if;
      end if;

      -- debug: output the results of the search
      l_idx := P_SEARCH_RESULT.first;
      while (l_idx is not null)
       loop
          dbms_output.put_line(l_idx||' = '|| P_SEARCH_RESULT(l_idx) );
          l_idx := P_SEARCH_RESULT.next(l_idx);
      end loop;

    End if;
  dbms_output.put_line('**************End Search**********');
  end ldap_search_email;

FUNCTION ldap_auth(
  p_username IN VARCHAR2,
  p_password IN VARCHAR2
)
RETURN BOOLEAN IS

  l_ldap_base                   varchar2(256);
  l_user_sid                    number;
  l_campus_sid                  number;
  l_account_locked              char;
  l_security_question_sid       number;
  l_position_sid                number;
  l_user_md5                    varchar2(32767);
  l_account_verified            char;
  l_change_password             char;
  l_temp_password               varchar(15);
  l_temp_password_expire        date;
  l_user_dn                     varchar2(200);
  l_port_type                   char := 'L';
  l_attrs                       DBMS_LDAP.string_collection;

  l_retval                      pls_integer;
  l_session                     DBMS_LDAP.session;
  l_search_result               t_resultArray;

BEGIN
  -- Verify that the user password/id are not null.  A null Password or user DN will not result in an exception
  -- and gives the appearance that the bind succeeded.
  IF p_username is null or p_password is null THEN
    APEX_UTIL.set_custom_auth_status(p_status => 'User ID/Password Required');
    APEX_UTIL.SET_AUTHENTICATION_RESULT(1);
    RETURN FALSE;
  END IF;
  
  -- check to see if the user is in the contacts table and retrieve the SID and acct INFO.
  -- if the account VERIFIED is 'N' redirect to the verification page
  -- or if the CHANGE_PASSWORD is 'Y', then they used the forgot password process so redirect to forgot password login.
  /*begin
    select USER_SID
           ,ACCOUNT_LOCKED
           ,ACCOUNT_VERIFIED_FLAG
           ,CHANGE_PASSWORD_FLAG
           ,TEMP_PASSWORD_CODE
           ,TEMP_PASSWORD_EXPIRE
           ,LDAP_DN
           ,MD5
      into l_user_sid
          ,l_account_locked
          ,l_account_verified
          ,l_change_password
          ,l_temp_password
          ,l_temp_password_expire
          ,l_user_dn
          ,l_user_md5
      from v_user_account
     where UPPER(USER_ID) = upper(P_USERNAME);
  exception 
    when NO_DATA_FOUND then
      l_user_sid := null;
  end;*/
  
  
  -- determine if the user is internal or external to region10 and set base DN for search.
  IF upper(substr(p_username,instr(p_username,'@',1)+1)) = 'REGION10.ORG' THEN
      l_ldap_base  := c_ldap_base_r10;
			c_ldap_host  := 'ldap.region10.org';--r10-dc1.region10.esc10.org';
      l_port_type  := 'G';
  else
    --l_ldap_base  := 'ou=Test'||c_ldap_base_appauth; -- for the test ou
      l_ldap_base  := 'ou='||Upper(substr(p_username,1,1))||c_ldap_base_appauth;
      l_port_type  := 'L';
  END IF;

  -- Connect to the LDAP server.
  l_session := fn_ldap_connect(l_port_type);

  /********************************************
   issue the search for the DN and attributes based on the email address
  ********************************************/
  l_attrs(1) := '*';   
  ldap_search_email ( P_SESSION        => l_session,
                      P_LDAP_BASE      => l_ldap_base,
                      P_USERNAME       => P_USERNAME,
                      P_SEARCH_ATTRS   => l_attrs,
                      P_SEARCH_RESULT  => l_search_result
                      );
    
  if l_search_result.count = 0 then
    --DBMS_OUTPUT.PUT_LINE('Search for Email returned zero results');
    APEX_UTIL.set_custom_auth_status(p_status => 'Invalid User Id/Password');
    APEX_UTIL.SET_AUTHENTICATION_RESULT(1);
    return false; -- the user email was not found during the search.
  end if;
  /********************************************
     Auth with the users DN and Password
   ********************************************/
  -- attempt to bind with user DN and Password
  l_retval := DBMS_LDAP.simple_bind_s(ld     => l_session,
                                      dn     => l_search_result('distinguishedName'),
                                      passwd => p_password);
  -- Unbind the session as it is not needed anymore
  l_retval := fn_ldap_disconnect(l_session);

  -- if we got this far then the user was authenticated, update the user record based on successful login.

  -- !!!!!!!!!! No exceptions means you are authenticated. !!!!!!!!!!!!
  RETURN TRUE; -- indicates that the user is authenticated

/*EXCEPTION
  WHEN DBMS_LDAP.init_failed THEN
    DBMS_OUTPUT.PUT_LINE(RPAD('simple_bind_s Returns ',25,' ') || ': Unable to connect to LDAP Server');
    pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'LDAP Connection Failed',
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
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
      -- log the failed login
      pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => null,
                                          p_user_id => p_username,
                                          p_log_message => 'Incorrect username and/or password',
                                          p_action_type => 'Login',
                                          p_action_result => 'Failed',
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
                                          p_user_ip_address => null,
                                          p_browser => null);
      RAISE;
    END IF;
    Return FALSE;
  WHEN OTHERS THEN
    -- An unknown error occured, re-raise the exception
    APEX_DEBUG_MESSAGE.message(DBMS_UTILITY.FORMAT_ERROR_STACK());
    APEX_DEBUG_MESSAGE.message(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE());
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
                                          p_user_ip_address => null,
                                          p_browser => null);
    RAISE;*/
END ldap_auth;

/*************************************************************************
  this is the code section of the package. it sets the constants for the
  ldap connection.
**************************************************************************/
begin
  -- set the LDAP constants from the database
  select SYSTEM_CONFIG.LDAP_HOST,
         SYSTEM_CONFIG.LDAP_PORT,
         SYSTEM_CONFIG.LDAP_BASE_APPAUTH,
         SYSTEM_CONFIG.LDAP_BASE_R10,
         SYSTEM_CONFIG.SERVICE_ACCOUNT_DN,
         SYSTEM_CONFIG.SERVICE_ACCOUNT_PASSWORD,
         SYSTEM_CONFIG.WALLET_DIRECTORY,
         SYSTEM_CONFIG.WALLET_PASSWORD,
         SYSTEM_CONFIG.LDAP_GLOBAL_PORT
  into c_ldap_host,
       c_ldap_port,
       c_ldap_base_appauth,
       c_ldap_base_r10,
       c_sa_name,
       c_sa_pw,
       c_wallet_dir,
       c_wallet_pass,
       c_ldap_port_global
  from SYSTEM_CONFIG;


END pkg_sv_security;
/
