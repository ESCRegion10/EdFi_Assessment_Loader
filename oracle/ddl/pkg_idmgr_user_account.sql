create or replace package edfidata.PKG_IDMGR_USER_ACCOUNT is


--------------------------------------------------------------
-- build MD5 function for table "USER_ACCOUNT
--------------------------------------------------------------
function FN_BUILD_USER_ACCOUNT_MD5 (
      P_USER_SID                 in number,
      P_DISTRICT_SID             in number,
      P_USER_ID                  in varchar2,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2  default null,
      P_CREATED_BY               in number    default null,
      P_CREATE_DATE              in date      default null,
      P_UPDATED_BY               in number    default null,
      P_UPDATE_DATE              in date      default null,
      P_ACCOUNT_LOCKED           in varchar2  default null,
      P_ACTIVE_ACCOUNT_FLAG      in varchar2  default null,
      P_LAST_LOGIN_DATE          in date      default null,
      P_FIRST_LOGIN_FLAG         in varchar2  default null,
      P_ATTEMPT_CTR              in number    default null,
      P_USER_SOURCE              in varchar2  default null,
      P_SUPER_USER               in varchar2,
      P_STAFF_TITLE_SID          in VARCHAR2  default null
   ) return varchar2;
--------------------------------------------------------------
-- FUNCTION: FN_GENERATE_PASSWORD
-- Purpose: Generates a 12 character strong password with
--          upper and lowercase alpha letters, 1 to 2 numbers,
--          and 1 special character
-- 07-10-13 CB orininal creation
--------------------------------------------------------------
  function FN_GENERATE_PASSWORD
    return varchar2;
--------------------------------------------------------------
-- create procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_INS_USER_ACCOUNT (
      P_DISTRICT_SID             in number,
      P_USER_ID                  in varchar2,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2,
      P_SUPER_USER               in varchar2  default 'N',
      P_STAFF_TITLE_SID          in varchar2  default null,
			P_NEW_LOGIN_USER           in varchar2  default 'Y'
   );
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_UPD_USER_ACCOUNT (
      P_USER_SID                 in number,
      P_DISTRICT_SID             in number,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2  default null,
      P_ACCOUNT_LOCKED           in varchar2  default null,
      P_ACTIVE_ACCOUNT_FLAG      in varchar2  default null,
      P_FIRST_LOGIN_FLAG         in varchar2  default null,
      P_USER_SOURCE              in varchar2  default null,
      P_SUPER_USER               in varchar2  default 'N',
      P_MD5                      in varchar2  default null,
      P_STAFF_TITLE_SID          in varchar2  default null
   );
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
-- Purpose: UPDATES THE USER ACCOUNT DUE TO A MISSED LOGIN ATTEMPT
---------------------------------------------------------------
   procedure PROC_UPD_USER_MISSED_LOGIN (
      P_USER_ID                  in varchar2
   );
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
-- Purpose: UPDATES THE last_login_date AND ATTEMPT_CTR FOR THE
--          USER THAT JUST LOGGED IN.
---------------------------------------------------------------
   procedure PROC_UPD_USER_ACCOUNT_LOGIN_DT (
      P_USER_SID                 in number);
--------------------------------------------------------------
-- delete procedure for table "USER_ACCOUNT
   procedure PROC_DEL_USER_ACCOUNT (
      P_USER_SID in number);
--------------------------------------------------------------
-- get procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_GET_USER_ACCOUNT (
      P_USER_SID                 in number,
      P_DISTRICT_SID             out number,
      P_USER_ID                  out varchar2,
      P_USER_FIRST_NAME          out varchar2,
      P_USER_LAST_NAME           out varchar2,
      P_EMAIL_ADDRESS            out varchar2,
      P_CREATED_BY               out varchar2,
      P_CREATE_DATE              out timestamp,
      P_UPDATED_BY               out varchar2,
      P_UPDATE_DATE              out timestamp,
      P_ACCOUNT_LOCKED           out varchar2,
      P_ACTIVE_ACCOUNT_FLAG      out varchar2,
      P_LAST_LOGIN_DATE          out timestamp,
      P_FIRST_LOGIN_FLAG         out varchar2,
      P_ATTEMPT_CTR              out number,
      P_USER_SOURCE              out varchar2,
      P_SUPER_USER               out varchar2,
      P_STAFF_TITLE_SID          out VARCHAR2,
      P_MD5                      out varchar2
   );
--------------------------------------------------------------
-- Function: returns the USER_CAMPUS LIST FROM SHUTTLE COMPONENT
-- Description: This function outputs a ":" dilimited list
--------------------------------------------------------------
   function FN_GET_USER_CAMPUS_SHUTTLE(
       P_USER_SID    in number
   ) return varchar2;
--------------------------------------------------------------
-- Procedure: PROCESS USER_CAMPUS LIST FROM SHUTTLE COMPONENT
-- Description: This proc takes in a ":" dilimited list of
--              campus_master sids and a user_sid.  Since the
--              shuttle selections represent the new state of selections
--              for the users, we need only delete the current rows
--              and insert these new values.
--------------------------------------------------------------
   procedure PROC_USER_CAMPUS_SHUTTLE(
      P_USER_SID                 in number,
      P_CAMPUS_LIST              in varchar2
   );
--------------------------------------------------------------
-- Function: returns the USER_SECURITY_GROUP LIST FROM SHUTTLE COMPONENT
-- Description: This function outputs a ":" dilimited list
--------------------------------------------------------------
   function FN_GET_USER_SEC_GRP_SHUTTLE(
       P_USER_SID    in number
   ) return varchar2;
--------------------------------------------------------------
-- Procedure: PROCESS USER_SEC_GROUP LIST FROM SHUTTLE COMPONENT
-- Description: This proc takes in a ":" dilimited list of
--              SECURITY_GROUP_SIDs and a user_sid.  Since the
--              shuttle selections represent the new state of selections
--              for the user, we need only delete the current rows
--              and insert these new values.
--------------------------------------------------------------
   procedure PROC_USER_SEC_GRP_SHUTTLE(
      P_USER_SID    in number
      ,P_GROUP_LIST in varchar2
   );
end PKG_IDMGR_USER_ACCOUNT;
/
grant execute on EDFIDATA.PKG_IDMGR_USER_ACCOUNT to EDFIAPP;


create or replace package body edfidata.PKG_IDMGR_USER_ACCOUNT is
--------------------------------------------------------------
-- build MD5 function for table "USER_ACCOUNT
--------------------------------------------------------------
   function FN_BUILD_USER_ACCOUNT_MD5 (
      P_USER_SID                 in number,
      P_DISTRICT_SID             in number,
      P_USER_ID                  in varchar2,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2  default null,
      P_CREATED_BY               in number    default null,
      P_CREATE_DATE              in date      default null,
      P_UPDATED_BY               in number    default null,
      P_UPDATE_DATE              in date      default null,
      P_ACCOUNT_LOCKED           in varchar2  default null,
      P_ACTIVE_ACCOUNT_FLAG      in varchar2  default null,
      P_LAST_LOGIN_DATE          in date      default null,
      P_FIRST_LOGIN_FLAG         in varchar2  default null,
      P_ATTEMPT_CTR              in number    default null,
      P_USER_SOURCE              in varchar2  default null,
      P_SUPER_USER               in varchar2,
      P_STAFF_TITLE_SID          in VARCHAR2  default null
   ) return varchar2 is

   begin

      return apex_util.get_hash(apex_t_varchar2(
         P_USER_SID           ,
         P_DISTRICT_SID       ,
         P_USER_ID            ,
         P_USER_FIRST_NAME    ,
         P_USER_LAST_NAME     ,
         P_EMAIL_ADDRESS      ,
         P_CREATED_BY         ,
         P_CREATE_DATE        ,
         P_UPDATED_BY         ,
         P_UPDATE_DATE        ,
         P_ACCOUNT_LOCKED     ,
         P_ACTIVE_ACCOUNT_FLAG,
         P_LAST_LOGIN_DATE    ,
         P_FIRST_LOGIN_FLAG   ,
         P_ATTEMPT_CTR        ,
         P_SUPER_USER         ,
         P_USER_SOURCE        ,
         P_STAFF_TITLE_SID));

   end FN_BUILD_USER_ACCOUNT_MD5;
--------------------------------------------------------------
-- FUNCTION: FN_GENERATE_PASSWORD
-- Purpose: Generates a 12 character strong password with
--          upper and lowercase alpha letters, 1 to 2 numbers,
--          and 1 special character
-- 07-10-13 CB orininal creation
--------------------------------------------------------------
  function FN_GENERATE_PASSWORD
    return varchar2 is
    v_num VARCHAR2(60) := '23456789';
    v_spc VARCHAR2(60) := '!$%&?+*#-@:<>()_';
    v_pwd VARCHAR2(30);
    v_pull_pos int;
    v_put_pos int;
    v_error boolean := true;
    v_min_password_length number;
    BEGIN
      --PKG_IDMGR_DISTRICT.PROC_MIN_LENGTH (P_PASSWORD_MINIMUM_LENGTH  => v_min_password_length);
      while v_error -- loop through the passwords until a valid one is generated --
      loop
        v_pwd := DBMS_RANDOM.STRING('A',v_min_password_length);
        FOR x IN 1..trunc(DBMS_RANDOM.value(low => 1, high => 3)) LOOP
          v_put_pos := trunc(DBMS_RANDOM.value(low => 2, high => v_min_password_length));
          v_pull_pos := trunc(DBMS_RANDOM.value(low => 1, high => 9));
          v_pwd := substr(v_pwd,1,v_put_pos-1)||substr(v_num,v_pull_pos,1)||substr(v_pwd,v_put_pos+1);
        END LOOP;
        FOR x IN 1..trunc(DBMS_RANDOM.value(low => 1, high => 2)) LOOP
          v_put_pos := trunc(DBMS_RANDOM.value(low => 2, high => v_min_password_length));
          v_pull_pos := trunc(DBMS_RANDOM.value(low => 1, high => 17));
          v_pwd := substr(v_pwd,1,v_put_pos-1)||substr(v_spc,v_pull_pos,1)||substr(v_pwd,v_put_pos+1);
        END LOOP;
        -- Check if password is in a valid format --
        -- Password must be min v_min_password_length characters  --
        -- with at least 1 upper case, 1 lower case, 1 number, and 1 special character !$%&?+*#-@:<>()_ --
          case
            when length(v_pwd) < v_min_password_length then v_error := true;
            when not regexp_like(v_pwd,'[abcdefghijklmnopqrstuvwxyz]+') then v_error := true;
            when not regexp_like(v_pwd,'[ABCDEFGHIJKLMNOPQRSTUVWXYZ]+') then v_error := true;
            when not regexp_like(v_pwd,'[0123456789]+') then v_error := true;
            when not regexp_like(v_pwd,'[!$%&?+*#-@:<>()_]+') then v_error := true;
            else v_error := false;
          end case;
      end loop;
      return v_pwd;
  END FN_GENERATE_PASSWORD;

--------------------------------------------------------------
-- create procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_INS_USER_ACCOUNT (
      P_DISTRICT_SID             in number,
      P_USER_ID                  in varchar2,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2,
      P_SUPER_USER               in varchar2  default 'N',
      P_STAFF_TITLE_SID          in varchar2  default null,
			P_NEW_LOGIN_USER           in varchar2  default 'Y'
   ) is

   V_USER_SID                  NUMBER := NULL;  -- created/updated by user --
   V_NEW_USER_SID              NUMBER;  -- SID OF THE NEWLY CREATED USER --
   V_DISTRICT_SID              NUMBER;
	 V_ACCOUNT_LOCKED            VARCHAR2 (2) := 'Y';
   L_EMAIL_TO                  VARCHAR2 (90);
   L_EMAIL_FROM                VARCHAR2 (90);
   L_EMAIL_SUBJECT             VARCHAR2 (90);
   L_EMAIL_APPLICATION_LINK    VARCHAR2 (400);
   L_EMAIL_SALUTATION          VARCHAR2 (400);
   L_BODY                      CLOB;
   L_BODY_HTML                 CLOB;

   begin

    -- RETRIEVE THE CONTEXT USER AS THE CREATE/UPDATE BY USER --
    if P_NEW_LOGIN_USER = 'N' then
      select USER_ACCOUNT.USER_SID
      into V_USER_SID
      from USER_ACCOUNT
      where USER_ACCOUNT.USER_ID = v('APP_USER');
			-- don't lock the account
			v_account_locked := 'N';
    end if;

    -- GET THE SID FOR THE NEW USER --
    V_NEW_USER_SID := SID_SEQUENCE.NEXTVAL;

    -- set the district sid to unknown if parm is null
    if P_DISTRICT_SID is null then
      v_district_sid := -1;
    else
      v_district_sid := P_DISTRICT_SID;
    end if;

    insert into USER_ACCOUNT (
       USER_SID,
       DISTRICT_SID,
       USER_ID,
       PASSWORD,
       USER_FIRST_NAME,
       USER_LAST_NAME,
       EMAIL_ADDRESS,
       CREATED_BY,
       CREATE_DATE,
       UPDATED_BY,
       UPDATE_DATE,
       ACCOUNT_LOCKED,
       ACTIVE_ACCOUNT_FLAG,
       LAST_LOGIN_DATE,
       FIRST_LOGIN_FLAG,
       ATTEMPT_CTR,
       USER_SOURCE,
       SUPER_USER,
       STAFF_TITLE_SID,
       FULL_NAME
    ) values (
       V_NEW_USER_SID,
       v_district_sid,
       UPPER(P_USER_ID),
       'None',
       P_USER_FIRST_NAME,
       P_USER_LAST_NAME,
       P_USER_ID, 
       V_USER_SID,
       SYSDATE,
       V_USER_SID,
       SYSDATE,
       V_ACCOUNT_LOCKED,
       'Y',
       Sysdate,
       'Y',
       0,
       'Active Directory',
       P_SUPER_USER,
       P_STAFF_TITLE_SID,
       initcap(P_USER_LAST_NAME)||', '||initcap(P_USER_FIRST_NAME)
    );

    commit;

    IF P_NEW_LOGIN_USER = 'N' THEN
      -- THE NEW USER SID IN SESSION STATE --
      APEX_UTIL.set_session_state('P6_USER_SID',V_NEW_USER_SID);

      -- GET THE EMAIL AND BUILD IT --
      SELECT  EMAIL_SUBJECT, EMAIL_BODY, APPLICATION_LINK,SALUTATION
       INTO  L_EMAIL_SUBJECT, L_BODY_HTML, L_EMAIL_APPLICATION_LINK,L_EMAIL_SALUTATION
       FROM  EMAIL_SPECIFICATION
       WHERE EMAIL_TYPE_SID = 1;

     L_BODY_HTML := L_BODY_HTML || L_EMAIL_APPLICATION_LINK || L_EMAIL_SALUTATION;
     L_BODY_HTML := replace(L_BODY_HTML,'#USER-NAME#',UPPER(P_USER_ID));
     L_BODY  := 'To view the content of this message, please use an HTML enabled mail client.'||UTL_TCP.CRLF;

     L_EMAIL_TO := P_EMAIL_ADDRESS;
     L_EMAIL_FROM := 'reveal@region10.org';


    ELSE
      -- GET THE EMAIL AND BUILD IT --
      SELECT  EMAIL_SUBJECT, EMAIL_BODY, APPLICATION_LINK,SALUTATION
       INTO  L_EMAIL_SUBJECT, L_BODY_HTML, L_EMAIL_APPLICATION_LINK,L_EMAIL_SALUTATION
       FROM  EMAIL_SPECIFICATION
       WHERE EMAIL_TYPE_SID = 6;
      -- replace the user email address in the l_body_html
			L_BODY_HTML := replace(L_BODY_HTML,'#USER-NAME#',P_USER_ID);
      -- Send email to Admin for a new active directory user.
      L_BODY_HTML := L_BODY_HTML || L_EMAIL_APPLICATION_LINK || L_EMAIL_SALUTATION;
      
      L_BODY  := 'To view the content of this message, please use an HTML enabled mail client.'||UTL_TCP.CRLF;
      -- get the notification email address from the system config table.
      select notification_email_address
      into L_EMAIL_TO
      from system_config
      where system_config_sid = 1;

      L_EMAIL_FROM := 'reveal@region10.org';
    END IF;


     --SEND THE EMAIL

     APEX_MAIL.SEND(
      P_TO        => L_EMAIL_TO,
      P_FROM      => L_EMAIL_FROM,
      P_BODY      => L_BODY,
      P_BODY_HTML => L_BODY_HTML,
      P_SUBJ      => L_EMAIL_SUBJECT   );

     PKG_SV_ACCT_MGMT.PROC_PUSH_EMAIL_QUEUE;

    -- log the update to the user --
    pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => V_USER_SID,
        p_user_id => 'SYSTEM',
        p_log_message => 'Inserted User having ID: '||P_USER_ID,
        p_action_type => 'Insert User',
        p_action_result => 'Successful',
        p_attempts => 1,
        p_user_ip_address => null,
        p_browser => null);

   end PROC_INS_USER_ACCOUNT;
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_UPD_USER_ACCOUNT (
      P_USER_SID                 in number,
      P_DISTRICT_SID             in number,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2  default null,
      P_ACCOUNT_LOCKED           in varchar2  default null,
      P_ACTIVE_ACCOUNT_FLAG      in varchar2  default null,
      P_FIRST_LOGIN_FLAG         in varchar2  default null,
      P_USER_SOURCE              in varchar2  default null,
      P_SUPER_USER               in varchar2  default 'N',
      P_MD5                      in varchar2  default null,
      P_STAFF_TITLE_SID          in varchar2  default null
   ) is

      L_MD5 varchar2(32767) := null;
      V_USER_SID number;  -- updated by user --
      V_UPDATED_USER_ID VARCHAR2(100); -- id of the user being updated --
      V_ATTEMPT_CTR NUMBER := 0; -- in case the number of attempts needs to be reset --

   begin
      -- RETRIEVE THE CONTEXT USER AS THE UPDATE BY USER --
      select USER_ACCOUNT.USER_SID
      into V_USER_SID
      from USER_ACCOUNT
      where USER_ACCOUNT.USER_ID = v('APP_USER');

      if P_MD5 is not null then
         for c1 in (
            select * from USER_ACCOUNT
            where USER_SID = P_USER_SID FOR UPDATE
         ) loop

            L_MD5 := FN_BUILD_USER_ACCOUNT_MD5(
               c1.USER_SID,
               c1.DISTRICT_SID,
               c1.USER_ID,
               c1.USER_FIRST_NAME,
               c1.USER_LAST_NAME,
               c1.EMAIL_ADDRESS,
               c1.CREATED_BY,
               c1.CREATE_DATE,
               c1.UPDATED_BY,
               c1.UPDATE_DATE,
               c1.ACCOUNT_LOCKED,
               c1.ACTIVE_ACCOUNT_FLAG,
               c1.LAST_LOGIN_DATE,
               c1.FIRST_LOGIN_FLAG,
               c1.ATTEMPT_CTR,
               c1.USER_SOURCE,
               c1.SUPER_USER,
               c1.STAFF_TITLE_SID
            );

            V_UPDATED_USER_ID := c1.USER_ID;

            if c1.ACCOUNT_LOCKED <> P_ACCOUNT_LOCKED
               AND P_ACCOUNT_LOCKED = 'N' THEN
               V_ATTEMPT_CTR     := 0;
            else
               V_ATTEMPT_CTR     := c1.ATTEMPT_CTR;
            end if;

         end loop;

      end if;

      if (P_MD5 is null) or (L_MD5 = P_MD5) then
         update USER_ACCOUNT set
            DISTRICT_SID               = P_DISTRICT_SID,
            USER_FIRST_NAME            = P_USER_FIRST_NAME,
            USER_LAST_NAME             = P_USER_LAST_NAME,
            EMAIL_ADDRESS              = P_EMAIL_ADDRESS,
            UPDATED_BY                 = V_USER_SID,
            UPDATE_DATE                = SYSDATE,
            ACCOUNT_LOCKED             = P_ACCOUNT_LOCKED,
            ACTIVE_ACCOUNT_FLAG        = P_ACTIVE_ACCOUNT_FLAG,
            FIRST_LOGIN_FLAG           = P_FIRST_LOGIN_FLAG,
            USER_SOURCE                = P_USER_SOURCE,
            SUPER_USER                 = P_SUPER_USER,
            ATTEMPT_CTR                = V_ATTEMPT_CTR,
            STAFF_TITLE_SID            = P_STAFF_TITLE_SID,
            FULL_NAME                  = initcap(P_USER_LAST_NAME)||', '||initcap(P_USER_FIRST_NAME)
         where USER_SID = P_USER_SID;

         -- log the update to the user --
         pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => V_USER_SID,
              p_user_id => v('APP_USER'),
              p_log_message => 'Updated User having SID/ID: '||P_USER_SID||'/'||V_UPDATED_USER_ID,
              p_action_type => 'Updated User',
              p_action_result => 'Successful',
              p_attempts => 1,
              p_user_ip_address => null,
              p_browser => null);
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');
      end if;

   end PROC_UPD_USER_ACCOUNT;
--------------------------------------------------------------
-- update procedure for table PROC_UPD_MY_PROFILE
-- purpose: allows the user to update their own profile data
--------------------------------------------------------------
   procedure PROC_UPD_MY_PROFILE (
      P_USER_SID in number,
      P_USER_FIRST_NAME          in varchar2  default null,
      P_USER_LAST_NAME           in varchar2  default null,
      P_EMAIL_ADDRESS            in varchar2  default null,
      P_FIRST_LOGIN_FLAG         in varchar2  default null,
      P_MD5                      in varchar2  default null
   ) is

      L_MD5 varchar2(32767) := null;
      V_USER_SID number;  -- updated by user --
      V_UPDATED_USER_ID VARCHAR2(100); -- id of the user being updated --

   begin
      -- RETRIEVE THE CONTEXT USER AS THE UPDATE BY USER --
      select USER_ACCOUNT.USER_SID
      into V_USER_SID
      from USER_ACCOUNT
      where USER_ACCOUNT.USER_ID = v('APP_USER');--SYS_CONTEXT('REVEAL_CTX', 'USER_NAME');

      if P_MD5 is not null then
         for c1 in (
            select * from USER_ACCOUNT
            where USER_SID = P_USER_SID FOR UPDATE
         ) loop

            L_MD5 := FN_BUILD_USER_ACCOUNT_MD5(
               c1.USER_SID,
               c1.DISTRICT_SID,
               c1.USER_ID,
               c1.USER_FIRST_NAME,
               c1.USER_LAST_NAME,
               c1.EMAIL_ADDRESS,
               c1.CREATED_BY,
               c1.CREATE_DATE,
               c1.UPDATED_BY,
               c1.UPDATE_DATE,
               c1.ACCOUNT_LOCKED,
               c1.ACTIVE_ACCOUNT_FLAG,
               c1.LAST_LOGIN_DATE,
               c1.FIRST_LOGIN_FLAG,
               c1.ATTEMPT_CTR,
               c1.USER_SOURCE,
               c1.SUPER_USER,
               c1.STAFF_TITLE_SID
            );

            V_UPDATED_USER_ID := c1.USER_ID;

         end loop;

      end if;

      if (P_MD5 is null) or (L_MD5 = P_MD5) then
         update USER_ACCOUNT set
            USER_FIRST_NAME            = P_USER_FIRST_NAME,
            USER_LAST_NAME             = P_USER_LAST_NAME,
            EMAIL_ADDRESS              = P_EMAIL_ADDRESS,
            UPDATED_BY                 = V_USER_SID,
            UPDATE_DATE                = SYSDATE,
            FIRST_LOGIN_FLAG           = P_FIRST_LOGIN_FLAG
         where USER_SID = P_USER_SID;

         -- log the update to the user --
         pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => V_USER_SID,
              p_user_id => v('APP_USER'),--SYS_CONTEXT('REVEAL_CTX', 'USER_NAME'),
              p_log_message => 'User Updated their profile having SID/ID: '||P_USER_SID||'/'||V_UPDATED_USER_ID,
              p_action_type => 'Updated User Profile',
              p_action_result => 'Successful',
              p_attempts => 1,
              p_user_ip_address => null,
              p_browser => null);
      else
         raise_application_error (-20001,'Current version of data in database has changed since user initiated update process. current checksum = '||L_MD5||', item checksum = '||P_MD5||'.');
      end if;

   end PROC_UPD_MY_PROFILE;
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
-- Purpose: UPDATES THE USER ACCOUNT DUE TO A MISSED LOGIN ATTEMPT
---------------------------------------------------------------
   procedure PROC_UPD_USER_MISSED_LOGIN (
      P_USER_ID                  in varchar2
   ) is

   V_USER_SID         NUMBER;
   V_ATTEMPT_CTR      NUMBER;
   V_ACCOUNT_LOCKED   CHAR := 'N';
   V_PASSWORD_MAX_ATTEMPTS NUMBER := '0';

   begin
     -- check if a user record exist --
     select USER_ACCOUNT.USER_SID
           ,USER_ACCOUNT.ATTEMPT_CTR
       into V_USER_SID
           ,V_ATTEMPT_CTR
       from USER_ACCOUNT
      where UPPER(USER_ID) = UPPER(P_USER_ID);

     SELECT password_max_attempts
       INTO V_PASSWORD_MAX_ATTEMPTS
       FROM system_config
      WHERE system_config_sid = 1;

     IF V_ATTEMPT_CTR > V_PASSWORD_MAX_ATTEMPTS THEN
       V_ACCOUNT_LOCKED := 'Y';
     END IF;

     update USER_ACCOUNT set
        UPDATED_BY                 = V_USER_SID,
        UPDATE_DATE                = SYSDATE,
        ACCOUNT_LOCKED             = V_ACCOUNT_LOCKED,
        ATTEMPT_CTR                = ATTEMPT_CTR + 1
     where USER_SID = V_USER_SID;
   exception
     when no_data_found then
       NULL; -- do nothing, the user does not exist
   end PROC_UPD_USER_MISSED_LOGIN;
--------------------------------------------------------------
-- update procedure for table "USER_ACCOUNT
-- Purpose: UPDATES THE last_login_date AND ATTEMPT_CTR FOR THE
--          USER THAT JUST LOGGED IN.
---------------------------------------------------------------
   procedure PROC_UPD_USER_ACCOUNT_LOGIN_DT (
      P_USER_SID                 in number
   ) is

   begin

     update USER_ACCOUNT set
         LAST_LOGIN_DATE    = sysdate,
         ATTEMPT_CTR        = 0
     where USER_SID = P_USER_SID;

   end PROC_UPD_USER_ACCOUNT_LOGIN_DT;
--------------------------------------------------------------
-- delete procedure for table "USER_ACCOUNT
-- 20140130 CBull fixed bug, deletes with v_user_id were not surrounded with quotes. Caused invalid id error.
--------------------------------------------------------------
   procedure PROC_DEL_USER_ACCOUNT (
      P_USER_SID in number
   ) is

   v_user_id varchar2(50); -- ID of the user being deleted --
   v_user_sid number;  -- sid of the user performing the delete --

   begin
     -- RETRIEVE THE CONTEXT USER FOR LOGGING --
      select USER_ACCOUNT.USER_SID
      into v_user_sid
      from USER_ACCOUNT
      where USER_ID = v('APP_USER');--SYS_CONTEXT('REVEAL_CTX', 'USER_NAME');
      -- RETRIEVE THE ID OF THE USER TO DELETE --
      select user_account.user_id
      into v_user_id
      from user_account
      where user_account.user_sid = P_USER_SID;

      delete from user_campus
      where user_campus.user_sid = P_USER_SID;

      delete from user_group
      where user_group.user_sid = P_USER_SID;

      delete from user_account
      where user_account.user_sid = P_USER_SID;

      COMMIT;
      -- log the deletion of the user --
      pkg_sv_acct_mgmt.proc_log_trans(p_user_sid => V_USER_SID,
              p_user_id => v('APP_USER'),--SYS_CONTEXT('REVEAL_CTX', 'USER_NAME'),
              p_log_message => 'Deleted User having SID/ID: '||P_USER_SID||'/'||v_user_id,
              p_action_type => 'Delete User',
              p_action_result => 'Successful',
              p_attempts => 1,
              p_user_ip_address => null,
              p_browser => null);

   end PROC_DEL_USER_ACCOUNT;
--------------------------------------------------------------
-- get procedure for table "USER_ACCOUNT
--------------------------------------------------------------
   procedure PROC_GET_USER_ACCOUNT (
      P_USER_SID                 in number,
      P_DISTRICT_SID             out number,
      P_USER_ID                  out varchar2,
      P_USER_FIRST_NAME          out varchar2,
      P_USER_LAST_NAME           out varchar2,
      P_EMAIL_ADDRESS            out varchar2,
      P_CREATED_BY               out varchar2,
      P_CREATE_DATE              out timestamp,
      P_UPDATED_BY               out varchar2,
      P_UPDATE_DATE              out timestamp,
      P_ACCOUNT_LOCKED           out varchar2,
      P_ACTIVE_ACCOUNT_FLAG      out varchar2,
      P_LAST_LOGIN_DATE          out timestamp,
      P_FIRST_LOGIN_FLAG         out varchar2,
      P_ATTEMPT_CTR              out number,
      P_USER_SOURCE              out varchar2,
      P_SUPER_USER               out varchar2,
      P_STAFF_TITLE_SID          out VARCHAR2,
      P_MD5                      out varchar2
   ) is

   begin

      for c1 in (
         select USER_ACCOUNT.*
               ,CREATE_USER_ACCT.USER_ID AS CREATE_USER_ID
               ,UPDATE_USER_ACCT.USER_ID AS UPDATE_USER_ID
            from USER_ACCOUNT
            left join USER_ACCOUNT CREATE_USER_ACCT ON CREATE_USER_ACCT.USER_SID = USER_ACCOUNT.CREATED_BY
            left join USER_ACCOUNT UPDATE_USER_ACCT ON UPDATE_USER_ACCT.USER_SID = USER_ACCOUNT.UPDATED_BY
            where USER_ACCOUNT.USER_SID = P_USER_SID
      ) loop
         P_DISTRICT_SID             := c1.DISTRICT_SID;
         P_USER_ID                  := c1.USER_ID;
         P_USER_FIRST_NAME          := c1.USER_FIRST_NAME;
         P_USER_LAST_NAME           := c1.USER_LAST_NAME;
         P_EMAIL_ADDRESS            := c1.EMAIL_ADDRESS;
         P_CREATED_BY               := c1.CREATE_USER_ID;
         P_CREATE_DATE              := c1.CREATE_DATE;
         P_UPDATED_BY               := c1.UPDATE_USER_ID;
         P_UPDATE_DATE              := c1.UPDATE_DATE;
         P_ACCOUNT_LOCKED           := c1.ACCOUNT_LOCKED;
         P_ACTIVE_ACCOUNT_FLAG      := c1.ACTIVE_ACCOUNT_FLAG;
         P_LAST_LOGIN_DATE          := c1.LAST_LOGIN_DATE;
         P_FIRST_LOGIN_FLAG         := c1.FIRST_LOGIN_FLAG;
         P_ATTEMPT_CTR              := c1.ATTEMPT_CTR;
         P_USER_SOURCE              := c1.USER_SOURCE;
         P_SUPER_USER               := c1.SUPER_USER;
         P_STAFF_TITLE_SID          := c1.STAFF_TITLE_SID;

         P_MD5 := FN_BUILD_USER_ACCOUNT_MD5(
            P_USER_SID,
            c1.DISTRICT_SID,
            c1.USER_ID,
            c1.USER_FIRST_NAME,
            c1.USER_LAST_NAME,
            c1.EMAIL_ADDRESS,
            c1.CREATED_BY,
            c1.CREATE_DATE,
            c1.UPDATED_BY,
            c1.UPDATE_DATE,
            c1.ACCOUNT_LOCKED,
            c1.ACTIVE_ACCOUNT_FLAG,
            c1.LAST_LOGIN_DATE,
            c1.FIRST_LOGIN_FLAG,
            c1.ATTEMPT_CTR,
            c1.USER_SOURCE,
            c1.SUPER_USER,
            c1.STAFF_TITLE_SID
         );
      end loop;

   end PROC_GET_USER_ACCOUNT;
--------------------------------------------------------------
-- Function: returns the USER_CAMPUS LIST FROM SHUTTLE COMPONENT
-- Description: This function outputs a ":" dilimited list
--------------------------------------------------------------
   function FN_GET_USER_CAMPUS_SHUTTLE(
       P_USER_SID    in number
   ) return varchar2 is
		campus_list apex_t_varchar2; 
		begin 
			select campus_sid  
			  bulk collect into campus_list
			  from V_IDMGR_USER_CAMPUS 
			 where USER_SID = P_USER_SID;
			  
	    return APEX_STRING.join(campus_list , ':' ); 
		
   exception
     when NO_DATA_FOUND then
        return null;

   end FN_GET_USER_CAMPUS_SHUTTLE;
--------------------------------------------------------------
-- Procedure: PROCESS USER_CAMPUS LIST FROM SHUTTLE COMPONENT
-- Description: This proc takes in a ":" dilimited list of
--              campus_master sids and a user_sid.  Since the
--              shuttle selections represent the new state of selections
--              for the users, we need only delete the current rows
--              and insert these new values.
--------------------------------------------------------------
   procedure PROC_USER_CAMPUS_SHUTTLE(
      P_USER_SID    in number
      ,P_CAMPUS_LIST in varchar2
   ) is

     V_NEW_USER_CAMPUS_LIST apex_t_varchar2;
--		 APEX_APPLICATION_GLOBAL.VC_ARR2;

   begin
     -- convert the delimited list from a string into a table
		 V_NEW_USER_CAMPUS_LIST := apex_string.split(P_CAMPUS_LIST,':');
     --V_NEW_USER_CAMPUS_LIST := APEX_UTIL.STRING_TO_TABLE(P_CAMPUS_LIST);
     -- delete the current rows from USER_CAMPUS for the specified user
     delete from USER_CAMPUS where USER_CAMPUS.USER_SID = P_USER_SID;
     -- insert the new user_campus rows --
     forall I in 1 .. V_NEW_USER_CAMPUS_LIST.COUNT
       insert into USER_CAMPUS (
           USER_CAMPUS_SID,
           USER_SID,
           CAMPUS_SID
        ) values (
           SID_SEQUENCE.NEXTVAL,
           P_USER_SID,
           to_number(V_NEW_USER_CAMPUS_LIST(I))
        );
     commit;

   end PROC_USER_CAMPUS_SHUTTLE;
--------------------------------------------------------------
-- Function: returns the USER_SECURITY_GROUP LIST FROM SHUTTLE COMPONENT
-- Description: This function outputs a ":" dilimited list
--------------------------------------------------------------
   function FN_GET_USER_SEC_GRP_SHUTTLE(
       P_USER_SID    in number
   ) return varchar2 is
	 
		sec_grp_list apex_t_varchar2; 
		
		begin 
			select security_group_sid  
			  bulk collect into sec_grp_list
			  from V_USER_SECURITY_GROUP 
		   where USER_SID = P_USER_SID;
			  
	    return APEX_STRING.join(sec_grp_list , ':' ); 
		
   exception
     when NO_DATA_FOUND then
        return null;

   end FN_GET_USER_SEC_GRP_SHUTTLE;
--------------------------------------------------------------
-- Procedure: PROCESS USER_SEC_GROUP LIST FROM SHUTTLE COMPONENT
-- Description: This proc takes in a ":" dilimited list of
--              SECURITY_GROUP_SIDs and a user_sid.  Since the
--              shuttle selections represent the new state of selections
--              for the user, we need only delete the current rows
--              and insert these new values.
--------------------------------------------------------------
   procedure PROC_USER_SEC_GRP_SHUTTLE(
      P_USER_SID    in number
      ,P_GROUP_LIST in varchar2
   ) is

     V_NEW_USER_GROUP_LIST apex_t_varchar2;

   begin
     -- convert the delimited list from a string into a table
     V_NEW_USER_GROUP_LIST := APEX_STRING.SPLIT(P_GROUP_LIST,':');
     -- delete the current rows from USER_GROUP for the specified user
     delete from USER_GROUP where USER_GROUP.USER_SID = P_USER_SID;
     -- insert the new user_GROUP rows --
     forall I in 1 .. V_NEW_USER_GROUP_LIST.COUNT
       insert into USER_GROUP
         (USER_SID
         ,SECURITY_GROUP_SID)
       values
         (P_USER_SID
         ,to_number(V_NEW_USER_GROUP_LIST(I)));
     commit;

   end PROC_USER_SEC_GRP_SHUTTLE;

--------------------------------------------------------------
end PKG_IDMGR_USER_ACCOUNT;
/
grant execute on EDFIDATA.PKG_IDMGR_USER_ACCOUNT to EDFIAPP;


