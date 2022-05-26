create or replace package edfidata.PKG_UPDATE_STUDENT_ATTRIBUTES is

  -- Author  : CHRIS.BULL
  -- Created : 8/20/2020 10:00:10 AM
  -- Purpose : 
  
  TYPE t_STU_LIST_row is record (
    "LastSurname"            varchar2(100), 
    "FirstName"              varchar2(100), 
    "BirthDate"              varchar2(100), 
		"StudentUniqueId"        varchar2(20), 
		"LocalCode"              varchar2(20)
	);
	
	TYPE t_STU_LIST_tab IS TABLE OF t_STU_LIST_row;
	
  TYPE t_STU_INDUSTRY_CERT_row is record (
	     "StudentUniqueId"                varchar2(20), 
			 "SchoolYear"                     varchar2(4), 
			 "TermDescriptor"                 varchar2(50), 
			 "AcademicHonorCategoryType"      varchar2(50), 
			 "AchievementCategory"            varchar2(50), 
			 "AchievementTitle"	              varchar2(200)
	);
	
	TYPE t_STU_INDUSTRY_CERT_tab IS TABLE OF t_STU_INDUSTRY_CERT_row;
	
	TYPE t_STU_LEVEL12_CERT_row is record (
	     "StudentUniqueId"                varchar2(20), 
			 "SchoolYear"                     varchar2(4), 
			 "TermDescriptor"                 varchar2(50), 
			 "RecognitionAwardDate"           date, 
			 "AchievementTitle"	              varchar2(200), 
			 "Criteria"                       varchar2(50)
	);
	
	TYPE t_STU_LEVEL12_CERT_tab IS TABLE OF t_STU_LEVEL12_CERT_row;
	
	TYPE t_COURSE_CHAR_row is record (
	     "CourseCode"                      varchar2(60), 
			 "CourseTitle"                     varchar2(60), 
			 "AcademicSubjectDescriptor"       varchar2(50), 
			 "CourseLevelCharacteristic"	     varchar2(50)
	);
	
	TYPE t_COURSE_CHAR_tab IS TABLE OF t_COURSE_CHAR_row;
	
	TYPE t_STU_ATTR_row is record ( 
			 "CodeValue"                      varchar2(60), 
			 "BeginDate"                      date
	);
	
	TYPE t_STU_ATTR_tab IS TABLE OF t_STU_ATTR_row;

	TYPE t_STU_PS_EVENT_row is record ( 
			 "CodeValue"                      varchar2(60), 
			 "BeginDate"                      date
	);
	
	TYPE t_STU_PS_EVENT_tab IS TABLE OF t_STU_PS_EVENT_row;

	TYPE t_STAFF_row is record ( 
			 "StaffUSI"                      varchar2(60), 
			 "StaffUniqueId"                 varchar2(32),
			 "LastSurname"                   varchar2(75),
			 "FirstName"                     varchar2(75),
			 "ElectronicMailAddress"         varchar2(128),
			 "StaffClassification"           varchar2(50)
	);
	
	TYPE t_STAFF_tab IS TABLE OF t_STAFF_row;
	
	TYPE t_CAMPUS_SUMMARY_row is record ( 
			 "STATS_DATE_TIME"               date,
			 "DATABASE_NUMBER"               varchar2(10),
			 "LEA"                           varchar2(75),
			 "CAMPUS"                        varchar2(100),
			 "TOTAL_STUDENT_COUNT"           number,
			 "ENROLLED_STUDENT_COUNT"        number,
			 "ENROLLED_SENIORS"              number,
			 "ENROLLED_ECON"                 number,
			 "ENROLLED_SPED"                 number,
			 "LAST_STUDENT_SCHOOL_UPDATED"   date,
			 "LAST_STUDENT_UPDATED"          date,
			 "STUDENTS_WITH_CERTIFICATES"    number,
			 "STUDENTS_WITH_DUAL_CR"         number,
			 "STUDENTS_WITH_ON_RAMP_CR"      number,
			 "LEA_CDN"                       varchar2(10),
			 "CAMPUS_CDC"                    varchar2(10)
	);
	
	TYPE t_CAMPUS_SUMMARY_tab IS TABLE OF t_CAMPUS_SUMMARY_row;
	
  function FN_GET_AUTH_TOKEN_25
	        (P_DB_NUMBER in varchar2) 
  return varchar2;
	
	function FN_GET_AUTH_TOKEN_35 
		      (P_DB_NUMBER in varchar2) 
  return varchar2;
	
  procedure PROC_PUT_STU_CHAR_25 
		      (p_student_unique_id      in varchar2,
					 p_ASVAB_date             in date,
					 p_Military_date          in date,
					 p_Meningitis_date        in date,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2);
  -- verify that a student is in the ods
	function FN_CHECK_STU_IN_ODS 
		         (P_STUDENT_UNIQUE_ID      in varchar2,
						  P_DISTRICT_ID            in varchar2)
		return boolean;
	-- This function returns a list of the students characteristics
	procedure PROC_GET_STU_CHARACTERISTICS 
		         (P_STUDENT_UNIQUE_ID      in varchar2,
						  P_DISTRICT_ID            in varchar2,
							p_ASVAB_date             out date,
						  p_Military_date          out date,
							p_Meningitis_date        out date);
	--
	-- THis procedure inserts a student POST SECONDARY EVENT(Associates degree,college app,financial app) for ed-fi 2.5
	-- you must pull the student POST SECONDARY EVENT record back and add to the JSON the new values
  procedure PROC_PUT_POST_SEC_EVENTS_25 
		      (p_student_unique_id      in varchar2,
					 p_associates_degree_date in date,
					 p_college_app_flag       in varchar2,
					 p_financial_app_flag     in varchar2,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2);

	---------------------------------------------------------------------------------
	-- This function returns post secondary events for a student
	procedure PROC_GET_POST_SEC_EVENTS 
					 (P_STUDENT_UNIQUE_ID      in varchar2,
						P_DISTRICT_ID            in varchar2,
						P_ODS_NUMBER             in varchar2,
						p_associates_degree_date out date,
						p_college_app_flag       out varchar2,
						p_financial_app_flag     out varchar2);

--
-- THis procedure UPDATES student academic recordS FOR INDUSTRY CERTIFICATIONS for ed-fi 2.5
-- you must pull the student record back and add to the JSON the new values
  procedure PROC_PUT_STU_IND_CERTS_25 
		      (p_student_unique_id      in varchar2,
					 p_district_id            in varchar2,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2,
					 p_school_year            in varchar2,
					 p_term                   in varchar2,
					 p_achievement_title      in varchar2,
					 p_old_achievement_title  in varchar2   default null,
					 p_transaction_type       in varchar2);
--
-- THis procedure UPDATES student academic recordS FOR Level 1 and 2 CERTIFICATIONS for ed-fi 2.5
-- you must pull the student academic record back and add to the JSON the new values
	procedure PROC_PUT_STU_LVL12_CERTS_25 
						(p_student_unique_id      in varchar2,
						 p_district_id            in varchar2,
						 p_database_number        in varchar2,
						 p_auth_token             in varchar2,
						 p_school_year            in varchar2,
						 p_term                   in varchar2,
						 p_achievement_title      in varchar2,
						 p_old_achievement_title  in varchar2   default null,
						 P_CRITERIA               in varchar2,
						 P_AWARD_DATE             in date,
						 p_transaction_type       in varchar2);	
-- this function returns the rows for the student list report	
	FUNCTION FN_GET_STUDENT_LIST (
				 P_SEARCH IN varchar2,
				 P_DISTRICT_ID in varchar2
		) return t_STU_LIST_tab pipelined;	
		--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
FUNCTION FN_GET_STU_ATTRS (
			 P_DISTRICT_ID       in varchar2,
			 P_STUDENT_UNIQUE_ID in varchar2
  ) return t_STU_ATTR_tab pipelined;
	FUNCTION FN_GET_STU_PS_EVENTS (
			 P_DISTRICT_ID       in varchar2,
			 P_STUDENT_UNIQUE_ID in varchar2
  ) return t_STU_PS_EVENT_tab pipelined;
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- this function returns the rows for the industry certification report	
	FUNCTION FN_GET_INDUSTRY_CERT_LIST (
       P_STUDENT_UNIQUE_ID IN varchar2,
			 P_DISTRICT_ID in varchar2
  ) return t_STU_INDUSTRY_CERT_tab pipelined;
-- this function returns the rows for the Level 1/2 certification report	
	FUNCTION FN_GET_LEVEL12_CERT_LIST (
       P_STUDENT_UNIQUE_ID IN varchar2,
			 P_DISTRICT_ID       in varchar2
  ) return t_STU_LEVEL12_CERT_tab PIPELINED;
-- pipelined table function to return COURSE list.
  FUNCTION FN_GET_COURSES_LIST (
			 P_DISTRICT_ID       in varchar2
  ) return t_COURSE_CHAR_tab pipelined;
-- PROCEDURE to pull the STUDENTS from the ods and load into DISTRICT_STUDENT_CACHE based on ods number.
procedure PROC_INSERT_STUDENT_LIST (
			 P_ODS_NUMBER       in varchar2
  );
-- PROCEDURE to pull the STUDENTS CERTS from the ods and load into district_student_certs_cache based on ods number.
  procedure PROC_INSERT_STU_CERTS_CACHE (
       P_STUDENT_UNIQUE_ID IN varchar2,
			 P_ODS_NUMBER       in varchar2
  );
-- PROCEDURE to pull the staff from the ods and load into TMP_DISTRICT_STAFF based on ods number.
  procedure PROC_INSERT_STAFF_LIST (
			 P_ODS_NUMBER       in varchar2
  );
-- Clear the cache tables periodically
  procedure PROC_CLEAR_CACHE_TABLES;
-- THis procedure inserts a student characteristic for ed-fi 3.5
  procedure PROC_PUT_STU_CHAR_35 
		      (p_student_unique_id      in varchar2,
					 p_ASVAB_date             in date,
					 p_Military_date          in date,
					 p_Meningitis_date        in date,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2);
--
-- THis procedure inserts a student POST SECONDARY EVENT(Associates degree,college app,financial app) for ed-fi 3.5
-- you must pull the student POST SECONDARY EVENT record back and add to the JSON the new values
  procedure PROC_PUT_POST_SEC_EVENTS_35 
		      (p_student_unique_id      in varchar2,
					 p_associates_degree_date in date,
					 p_college_app_flag       in varchar2,
					 p_financial_app_flag     in varchar2,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2); 
--
-- THis procedure UPDATES student academic recordS FOR INDUSTRY CERTIFICATIONS for ed-fi 3.5
-- you must pull the student academic record back and add to the JSON the new values
  procedure PROC_PUT_STU_IND_CERTS_35 
		      (p_student_unique_id      in varchar2,
					 p_district_id            in varchar2,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2,
					 p_school_year            in varchar2,
					 p_term                   in varchar2,
					 p_achievement_title      in varchar2,
					 p_old_achievement_title  in varchar2   default null,
					 p_transaction_type       in varchar2);
--
-- THis procedure UPDATES student academic recordS FOR Level 1 and 2 CERTIFICATIONS for ed-fi 3.5
-- you must pull the student academic record back and add to the JSON the new values
  procedure PROC_PUT_STU_LVL12_CERTS_35 
		      (p_student_unique_id      in varchar2,
					 p_district_id            in varchar2,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2,
					 p_school_year            in varchar2,
					 p_term                   in varchar2,
					 p_achievement_title      in varchar2,
					 p_old_achievement_title  in varchar2   default null,
					 P_CRITERIA               in varchar2,
					 P_AWARD_DATE             in date,
					 p_transaction_type       in varchar2);
--
-- THis procedure UPDATES COURSES TO ADD OR REMOVE THE DUAL CREDITS COURSE LEVEL CHARACTERISTIC for ed-fi 3.5
-- you must pull the COURSE record back and add to the JSON the new values
  procedure PROC_PUT_CRS_DUAL_CR_35 
		      (p_course_code            in varchar2,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2,
					 p_transaction_type       in varchar2);
--------------------------------------------------------------
-- insert procedure for table EDFI_STUDENT_DATA
   procedure PROC_EDFI_STUDENT_DATA (
      P_DISTRICT_ID            in varchar2,
      P_DISTRICT_ODS_NUMBER    in varchar2                        default null,
      P_STUDENT_UNIQUE_ID      in varchar2,
      P_ASVAB_DATE             in date                            default null,
      P_MILITARY_DATE          in date                            default null,
      P_MENINGITIS_DATE        in date                            default null,
      P_ASSOCIATES_DEGREE_DATE in date                            default null,
      P_COLLEGE_APP_FLAG       in varchar2                        default null,
      P_FINANCIAL_APP_FLAG     in varchar2                        default null,
      P_SOURCE                 in varchar2                        default null
   );
--------------------------------------------------------------
-- create procedure for table EDFI_STUDENT_CERTS
   procedure PROC_EDFI_STUDENT_CERTS (
      P_DISTRICT_ID         in varchar2,
      P_DISTRICT_ODS_NUMBER in varchar2                        default null,
      P_STUDENT_UNIQUE_ID   in varchar2,
      P_SCHOOL_YEAR         in varchar2,
      P_TERM                in varchar2,
      P_ACHIEVEMENT_TITLE   in varchar2,
			P_OLD_ACHIEVEMENT_TITLE in varchar2,
      P_CRITERIA            in varchar2                        default null,
      P_AWARD_DATE          in date                            default null,
      P_CERT_TYPE           in varchar2                        default null
   );
--------------------------------------------------------------
-- delete procedure for table EDFI_STUDENT_CERTS
	 procedure PROC_DEL_EDFI_STUDENT_CERTS(
		  p_district_id       in varchar2
		 ,p_student_unique_id in varchar2
		 ,p_school_year       in varchar2
		 ,p_term              in varchar2
		 ,p_achievement_title in varchar2);
		 
procedure PROC_EDFI_COURSE_DUAL_CR (
      P_DISTRICT_ID         in varchar2,
      P_DISTRICT_ODS_NUMBER in varchar2                        default null,
      P_COURSE_CODE         in varchar2
   );
--------------------------------------------------------------
-- delete procedure for table EDFI_COURSE_DUAL_CR
   procedure PROC_DEL_EDFI_COURSE_DUAL_CR (
      P_DISTRICT_ID in varchar2,
			P_COURSE_CODE in varchar2
   );
--------------------------------------------------------------
-- Refresh the ODS's with the data in oracle if it is not the same
--------------------------------------------------------------
   procedure PROC_REFRESH_ODS_UPDATES;
--------------------------------------------------------------
-- function to validate student id exists.
--------------------------------------------------------------
  FUNCTION FN_VALIDATE_STUDENT_UNIQUE_ID (
       P_STUDENT_UNIQUE_ID IN varchar2,
			 P_DISTRICT_ID in varchar2
  ) return boolean;
--------------------------------------------------------------
-- validation for stu_attr file import
--------------------------------------------------------------
    procedure PROC_VAL_STU_ATTR_IMPORT (
			P_DISTRICT_ID              varchar2
			);
--------------------------------------------------------------
-- load for stu_attr file import
--------------------------------------------------------------
    procedure PROC_LOAD_STU_ATTR_IMPORT (
			   P_DISTRICT_ID                                in varchar2,
				 P_DISTRICT_ODS_NUMBER                        in varchar2,
			   P_INSERT_COUNT                               out integer
		); 
--------------------------------------------------------------
-- validation for stu certifications file import
--------------------------------------------------------------
    procedure PROC_VAL_STU_CERT_IMPORT (
			P_DISTRICT_ID            in varchar2,
			P_DATABASE_NUMBER        in varchar2,
			P_EDFI_VERSION           in varchar2
			);
--------------------------------------------------------------
-- load for stu certifications file import from apex
--------------------------------------------------------------
    procedure PROC_LOAD_STU_CERT_IMPORT (
			   P_DISTRICT_ID                                in varchar2,
				 P_DISTRICT_ODS_NUMBER                        in varchar2,
			   P_INSERT_COUNT                               out integer
		);	
--------------------------------------------------------------
-- insert for stu_attr file import from apply texas via talend
--------------------------------------------------------------
    procedure PROC_INSERT_STU_ATTR_IMPORT (
			   P_DISTRICT_ID                                in varchar2,
			   P_STUDENT_UNIQUE_ID                          in varchar2,
				 P_ASVAB_DATE                                 in varchar2,
				 P_MILITARY_DATE                              in varchar2,
				 P_MENINGITIS_DATE                            in varchar2,
				 P_ASSOCIATES_DEGREE_DATE                     in varchar2,
				 P_COLLEGE_APP_FLAG                           in varchar2,
				 P_FINANCIAL_APP_FLAG                         in varchar2
					 
		);
--------------------------------------------------------------
-- Refresh mvs from sql server for the admin dashboard 
--------------------------------------------------------------
   procedure REFRESH_MV_EDFI_STATS;
	 			 
end PKG_UPDATE_STUDENT_ATTRIBUTES;
/
grant execute on EDFIDATA.PKG_UPDATE_STUDENT_ATTRIBUTES to EDFIAPP;


create or replace package body edfidata.PKG_UPDATE_STUDENT_ATTRIBUTES is

	c_api_base varchar2(100);
  c_api_data varchar2(100);

-- this proc sets the global variables for the api urls
  procedure PROC_SET_API_URL (
		P_DISTRICT_ID            in varchar2  default null,
		P_DB_NUMBER              in varchar2  default null
		) as
		
		l_edfi_version              varchar2(5);
		l_mass_send_flag            varchar2(3);
		l_school_year               varchar2(4);
		l_db_number                 varchar2(10);
		l_proxy_district_name       varchar2(50);
		l_api_dns                   varchar2(200);
		l_api_base                  varchar2(200);
		l_api_data                  varchar2(200);
		
		begin
			select 
			   d.EDFI_VERSION
				 ,d.MASS_SEND_FLAG
				 ,d.SCHOOL_YEAR
				 ,case when d.MASS_SEND_FLAG = 'Y' then ec.MASS_SEND_DNS else ec.CHANGE_DATA_DNS end as api_dns
				 ,ec.API_BASE
				 ,ec.API_DATA
				 ,d.DISTRICT_DB_NUMBER
				 ,d.PROXY_DISTRICT_NAME
			into l_edfi_version, l_mass_send_flag, l_school_year, l_api_dns, l_api_base, l_api_data, l_db_number, l_proxy_district_name
			from DISTRICTS d
			join EDFI_CONFIG ec on ec.EDFI_VERSION = d.EDFI_VERSION
			where d.DISTRICT_DB_NUMBER = P_DB_NUMBER
			   or d.DISTRICT_CDC = P_DISTRICT_ID;
				 
			if l_edfi_version = '2.5' then
				c_api_base := replace(l_api_base,'#IP_DNS#',l_api_dns);
				-- for 2.5 the db_number is part of the url
				c_api_data := replace(l_api_data,'#DB_NBR#',l_db_number);
			end if;
			
			if l_edfi_version = '3.5' then
				-- FOR 3.5 The DNS, proxy name and the SCHOOL YEAR need to be replaced
				c_api_base := replace(replace(l_api_base,'#IP_DNS#',l_api_dns),'#SCHOOL_YEAR#',l_school_year);
				c_api_data := l_api_data;
				
				if l_mass_send_flag = 'Y' then
					-- proxy name is not used for mass update so remove the place holder and the "/" on the end
					c_api_base := replace(c_api_base,'#PROXY_NAME#/','');
				else
					-- must be proxy/change data
					-- proxy name is required for nginx so replace name
					c_api_base := replace(c_api_base,'#PROXY_NAME#',l_proxy_district_name);
				end if;
				
			end if;
				-- http://#IP_DNS#/#PROXY_NAME#/ods-#SCHOOL_YEAR#/
		end PROC_SET_API_URL;
--
-- This function returns the oauth code for ed-fi 2.5
--
  function FN_GET_AUTH_CODE_25 
		(p_client_id varchar2) 
	return varchar2 is
    req utl_http.req;
		res utl_http.resp;
		url varchar2(4000) := c_api_base||'oauth/authorize?Client_id='||p_client_id||'&Response_type=code';
		buffer varchar2(32767);
		l_code varchar2(200);
		l_error varchar2(200);
		e_http_error exception;
		PRAGMA EXCEPTION_INIT (e_http_error, -20009);
		
		BEGIN
			--utl_http.set_wallet('file:${ORACLE_BASE}/admin/${ORACLE_SID}/wallet', null);
			  --utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
			req  := UTL_HTTP.begin_request(url, 'GET');
			
			res := utl_http.get_response(req);
			-- process the response from the HTTP call
			begin
				--loop
					utl_http.read_text(res, buffer,32767);
					--dbms_output.put_line(buffer);
				--end loop;
				utl_http.end_response(res);
				-- Parse of the code from the JSON
				select json_value(buffer, '$.code') into l_code from dual;
				if l_code is null then
					 -- there was an error, code was not returned
					 select json_value(buffer, '$.error') into l_error from dual;
					 raise_application_error(-20009,l_error);
				else
					 -- send back the code
				   return l_code;
				end if;
			exception
				when utl_http.end_of_body
				then
					utl_http.end_response(res);
					return 'ERROR';
			end;
		END FN_GET_AUTH_CODE_25;
--
-- THis function returns the oauth token for ed-fi 2.5
--
  function FN_GET_AUTH_TOKEN_25 
		      (P_DB_NUMBER in varchar2) 
  return varchar2 is
		----------  ED_FI 2.5 oauth token
    req utl_http.req;
		res utl_http.resp;
		--url varchar2(4000) := 'http://ods.region10.org/EdFi.Ods.WebApi/oauth/authorize?Client_id=DuncanvilleISD&Response_type=code';
		url varchar2(4000);
		buffer varchar2(32767);
		l_token varchar2(200);
		l_client_id varchar2(200);
		l_client_secret varchar2(200);
		content varchar2(8000);
    l_error varchar2(200);
		e_http_error exception;
		PRAGMA EXCEPTION_INIT (e_http_error, -20009);
		
		begin
			-- set the url
			PROC_SET_API_URL(P_DB_NUMBER => P_DB_NUMBER);
			url := c_api_base||'oauth/token';
			
			-- get the key and secret for the users DB
			select 
			   d.API_KEY
				 ,d.API_SECRET
			into l_client_id, l_client_secret
			from DISTRICTS d
			where d.DISTRICT_DB_NUMBER = P_DB_NUMBER;
			-- SET THE REQUEST CONTENT
			content := 'client_id='||l_client_id||'&client_secret='||l_client_secret||'&code='||PKG_UPDATE_STUDENT_ATTRIBUTES.FN_GET_AUTH_CODE_25(p_client_id => l_client_id)||'&grant_type=authorization_code';
			--dbms_output.put_line(content);
			--utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
			req  := UTL_HTTP.begin_request(url, 'POST');
			--utl_http.set_header(req, 'Authorization', 'Basic f24iYsBpdGVzdDp3ZWJhcGl0ZXN0');
			utl_http.set_header(req, 'Content-Type', 'application/x-www-form-urlencoded');
			utl_http.set_header(req, 'Content-Length', length(content));
			utl_http.write_text(req, content);
		 
			res := utl_http.get_response(req);
			-- process the response from the HTTP call
			begin
				utl_http.read_text(res, buffer,32767);
				--dbms_output.put_line(buffer);

				utl_http.end_response(res);
				select json_value(buffer, '$.access_token') into l_token from dual;
				if l_token is null then
					 select json_value(buffer, '$.error') into l_error from dual;
					 raise_application_error(-20009,l_error);
				else
				   return l_token;
				end if;
				
			exception
				when utl_http.end_of_body
				then
					utl_http.end_response(res);
					return 'ERROR';
			end;
		END FN_GET_AUTH_TOKEN_25;
		
-- function returns the auth token for 3.5
  function FN_GET_AUTH_TOKEN_35 
		      (P_DB_NUMBER in varchar2) 
  return varchar2 is
		----------  ED_FI 3.5 oauth token  !!! no need to get the code separately
    req utl_http.req;
		res utl_http.resp;
		url varchar2(4000);
		buffer varchar2(32767);
		l_token varchar2(200);
		l_client_id varchar2(200);
		l_client_secret varchar2(200);
		content varchar2(8000);
    l_error varchar2(200);
		e_http_error exception;
		PRAGMA EXCEPTION_INIT (e_http_error, -20009);
		
		begin
			-- set the url
			PROC_SET_API_URL(P_DB_NUMBER => P_DB_NUMBER);
			url := c_api_base||'oauth/token';
			--dbms_output.put_line(url);
			-- get the key and secret for the users DB
			select 
			   d.API_KEY
				 ,d.API_SECRET
			into l_client_id, l_client_secret
			from DISTRICTS d
			where d.DISTRICT_DB_NUMBER = P_DB_NUMBER;
			-- SET THE REQUEST CONTENT
			content := 'client_id='||l_client_id||'&client_secret='||l_client_secret||'&grant_type=client_credentials';
			--dbms_output.put_line(content);
			--utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
			req  := UTL_HTTP.begin_request(url, 'POST');
			utl_http.set_header(req, 'Content-Type', 'application/x-www-form-urlencoded');
			utl_http.set_header(req, 'Content-Length', length(content));
			utl_http.write_text(req, content);
		 
			res := utl_http.get_response(req);
			-- process the response from the HTTP call
			begin
				utl_http.read_text(res, buffer,32767);
				--dbms_output.put_line(buffer);

				utl_http.end_response(res);
				select json_value(buffer, '$.access_token') into l_token from dual;
				if l_token is null then
					 select json_value(buffer, '$.error') into l_error from dual;
					 raise_application_error(-20009,l_error);
				else
				   return l_token;
				end if;
				
			exception
				when utl_http.end_of_body
				then
					utl_http.end_response(res);
					return 'ERROR';
			end;
		END FN_GET_AUTH_TOKEN_35;
		
-- THis procedure inserts a student characteristic for ed-fi 2.5
-- you must pull the student record back and add to the JSON the new values
  procedure PROC_PUT_STU_CHAR_25 
		      (p_student_unique_id      in varchar2,
					 p_ASVAB_date             in date,
					 p_Military_date          in date,
					 p_Meningitis_date        in date,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2) 
  is
    req                 utl_http.req;
		res                 utl_http.resp;
		url                 varchar2(4000);
		buffer              varchar2(32767);
		l_json_doc          VARCHAR2(32767);
		l_characteristics   VARCHAR2(32767);
    l_new_characteristics VARCHAR2(32767);
    l_error             varchar2(200);
		l_warning           varchar2(200);
		e_http_error        exception;
		PRAGMA EXCEPTION_INIT (e_http_error, -20009);
		
		begin
			-- set the url
			PROC_SET_API_URL(P_DB_NUMBER => p_database_number);
			url := c_api_base||c_api_data||'students';
			
			-- get the student record via the api and the student unique id
			req  := UTL_HTTP.begin_request(url||'?studentUniqueId='||p_student_unique_id, 'GET');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
		  -- submit request
			res := utl_http.get_response(req);
			--DBMS_OUTPUT.put_line('resp code : ' || res.status_code || ' msg: '||res.reason_phrase);
			if res.status_code = utl_http.HTTP_OK then
				-- get the response from the rest call
				utl_http.read_text(res, l_json_doc,32767);
				--DBMS_OUTPUT.put_line('before : ' || l_json_doc);
				-- remove the resource id ("id") from the response.
				l_json_doc := REGEXP_REPLACE(l_json_doc, '"id":.*','',1,1,'i');
				-- add characteristics from ':' delimitied list
				select JSON_QUERY(l_json_doc, '$.characteristics')
					into l_characteristics
					from dual;
				--DBMS_OUTPUT.put_line('charac : ' || l_characteristics);	
				-- prime l_new_characteristics
				l_new_characteristics := l_characteristics;
				
				if p_ASVAB_date is not null then 
					-- characteristic was added to the student
					if l_new_characteristics = '[]' then
						l_new_characteristics := '[ { "descriptor": "ASVAB", "beginDate": "'||to_char(p_ASVAB_date,'YYYY-MM-DD')||'" } ]';
					else
						if instr(l_characteristics,'ASVAB') > 0 then
							-- there is already an entry so remove it in favor of the new one.
							l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,'(,|){"descriptor":"ASVAB".*?}','',1,1,'in');
				    end if;
					  -- add the new asvab with new date
						l_new_characteristics := replace(l_new_characteristics,']',',{ "descriptor": "ASVAB", "beginDate": "'||to_char(p_ASVAB_date,'YYYY-MM-DD')||'" } ]');
					end if;
					DBMS_OUTPUT.put_line('updated w asvab : ' || l_new_characteristics);
				elsif p_ASVAB_date is null
					and instr(l_characteristics,'ASVAB') > 0 then
					-- the characteristic was removed from the student
					l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,',{"descriptor":"ASVAB".*?}','',1,1,'in');
				end if;
				
				if p_Military_date is not null then 
					if l_new_characteristics = '[]' then
						l_new_characteristics := '[ { "descriptor": "Military Enlistment", "beginDate": "'||to_char(p_Military_date,'YYYY-MM-DD')||'" } ]';
					else
						if instr(l_characteristics,'Military Enlistment') > 0 then
							-- there is already an entry so remove it in favor of the new one.
							l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,'(,|){"descriptor":"Military Enlistment".*?}','',1,1,'in');
				    end if;
						l_new_characteristics := replace(l_new_characteristics,']',',{ "descriptor": "Military Enlistment", "beginDate": "'||to_char(p_Military_date,'YYYY-MM-DD')||'" } ]');
					end if;
				elsif p_Military_date is null
					and instr(l_characteristics,'Military Enlistment') > 0 then
					-- the characteristic was removed from the student
					l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,',{"descriptor":"Military Enlistment".*?}','',1,1,'in');
				end if;
				
				if p_Meningitis_date is not null then 
					if l_new_characteristics = '[]' then
						l_new_characteristics := '[ { "descriptor": "Meningitis Vaccine", "beginDate": "'||to_char(p_Meningitis_date,'YYYY-MM-DD')||'" } ]';
					else
						if instr(l_characteristics,'Meningitis Vaccine') > 0 then
							-- there is already an entry so remove it in favor of the new one.
							l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,'(,|){"descriptor":"Meningitis Vaccine".*?}','',1,1,'in');
				    end if;
						l_new_characteristics := replace(l_new_characteristics,']',',{ "descriptor": "Meningitis Vaccine", "beginDate": "'||to_char(p_Meningitis_date,'YYYY-MM-DD')||'" } ]');
					end if;
				elsif p_Meningitis_date is null
					and instr(l_characteristics,'Meningitis Vaccine') > 0 then
					-- the characteristic was removed from the student
					l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,',{"descriptor":"Meningitis Vaccine".*?}','',1,1,'in');
				end if;
				
				-- add to jason doc
				l_json_doc := REGEXP_REPLACE(l_json_doc, '"characteristics":.*?]', '"characteristics": '||l_new_characteristics,1,1,'in');
			  DBMS_OUTPUT.put_line('After : ' || l_json_doc);
			else 
				-- bad response code so raise error
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			
      utl_http.end_response(res);
      
			-- Update the student data in the ODS
			--utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
			req  := UTL_HTTP.begin_request(url, 'POST');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
			utl_http.set_header(req, 'Content-Type', 'application/json');
			utl_http.set_header(req, 'Content-Length', length(l_json_doc));
			utl_http.write_text(req, l_json_doc);
		 
			res := utl_http.get_response(req);
			dbms_output.put_line(res.status_code);
			
			if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
				 utl_http.read_text(res, buffer,32767);
				 dbms_output.put_line(buffer);
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			utl_http.end_response(res);
			
		END PROC_PUT_STU_CHAR_25;
		
		-- This procedure returns the list of the students characteristics
		function FN_CHECK_STU_IN_ODS 
		         (P_STUDENT_UNIQUE_ID      in varchar2,
						  P_DISTRICT_ID            in varchar2)
		return boolean
		as
	
		l_db_link varchar2(100);
		l_student_id   varchar2(20);
		l_sql varchar2(2000);
    begin
 
			select DB_LINK
				into l_db_link
				from DISTRICT_DB_LINK
			 where DISTRICT_ID = P_DISTRICT_ID
				 and TARGET_DB = 'ODS';

			l_sql :=  'SELECT "StudentUniqueId"
										FROM "edfi"."v_StudentIds"@'||l_db_link||' s
										where s."StudentUniqueId" ='||''''||P_STUDENT_UNIQUE_ID||'''';
			
			execute immediate l_sql into l_student_id;
       
			commit;
      execute immediate 'alter session close database link ' || l_db_link;
			return true;
    exception
     when NO_DATA_FOUND then
        commit;
        execute immediate 'alter session close database link ' || l_db_link;
			  return false;
		end FN_CHECK_STU_IN_ODS;		
		-- This procedure returns the list of the students characteristics
		procedure PROC_GET_STU_CHARACTERISTICS 
		         (P_STUDENT_UNIQUE_ID      in varchar2,
						  P_DISTRICT_ID            in varchar2,
							p_ASVAB_date             out date,
						  p_Military_date          out date,
							p_Meningitis_date        out date)
		is
		
		TYPE stu_chars_rt IS RECORD (
      CodeValue     VARCHAR2 (200),
      BeginDate     date
   );
 
    l_record   stu_chars_rt;
		l_db_link varchar2(100);
		l_cursor   SYS_REFCURSOR;
    begin
 
			select DB_LINK
				into l_db_link
				from DISTRICT_DB_LINK
			 where DISTRICT_ID = P_DISTRICT_ID
				 and TARGET_DB = 'ODS';

			OPEN l_cursor for 'SELECT to_char(s."CodeValue"), s."BeginDate"
										FROM "edfi"."v_StudentCharacteristics"@'||l_db_link||' s
										where s."StudentUniqueId" ='||''''||P_STUDENT_UNIQUE_ID||''''||'
										  and s."CodeValue" in (''ASVAB'',''Military Enlistment'',''Meningitis Vaccine'')
										order by s."CodeValue"';
			 LOOP
					FETCH l_cursor INTO l_record;

					EXIT WHEN l_cursor%NOTFOUND;
		      case
						when l_record.CodeValue = 'ASVAB' then p_ASVAB_date := l_record.BeginDate;
						when l_record.CodeValue = 'Military Enlistment' then p_Military_date := l_record.BeginDate;
						when l_record.CodeValue = 'Meningitis Vaccine'  then p_Meningitis_date := l_record.BeginDate;
					end case;
					DBMS_OUTPUT.put_line (l_record.CodeValue||' '||l_record.BeginDate);
			 END LOOP;
		 
			 CLOSE l_cursor;		
			 
			commit;
      execute immediate 'alter session close database link ' || l_db_link;
			
    exception
     when NO_DATA_FOUND then
        commit;
        execute immediate 'alter session close database link ' || l_db_link;
			
		end PROC_GET_STU_CHARACTERISTICS;
--
-- THis procedure inserts a student POST SECONDARY EVENT(Associates degree,college app,financial app) for ed-fi 2.5
-- you must pull the student POST SECONDARY EVENT record back and add to the JSON the new values
  procedure PROC_PUT_POST_SEC_EVENTS_25 
		      (p_student_unique_id      in varchar2,
					 p_associates_degree_date in date,
					 p_college_app_flag       in varchar2,
					 p_financial_app_flag     in varchar2,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2) 
  is
    req                 utl_http.req;
		res                 utl_http.resp;
		url                 varchar2(4000);
		buffer              varchar2(32767);
		l_json_doc          varchar2(32767);
		l_sql               varchar2(32767);
		l_events            varchar2(32767);
		l_pse_template      varchar2(4000);
		pse_elements        apex_t_varchar2 := apex_t_varchar2();
		pse_deletes         apex_t_varchar2 := apex_t_varchar2();
		l_index             varchar2(40);
		l_college_degree_found int;
		l_college_app_found    int;
		l_financial_app_found  int;
    l_error             varchar2(200);
		l_warning           varchar2(200);
		e_http_error        exception;
		PRAGMA EXCEPTION_INIT (e_http_error, -20009);
		
		begin
			-- set the url
			PROC_SET_API_URL(P_DB_NUMBER => p_database_number);
			url := c_api_base||c_api_data||'postSecondaryEvents';
			
			-- get the student record via the api and the student unique id
			req  := UTL_HTTP.begin_request(url||'?studentUniqueId='||p_student_unique_id, 'GET');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
		  -- submit request
			res := utl_http.get_response(req);
			--DBMS_OUTPUT.put_line('resp code : ' || res.status_code || ' msg: '||res.reason_phrase);
			if res.status_code = utl_http.HTTP_OK then
				
				-- get the response from the rest call
				utl_http.read_text(res, l_json_doc,32767);
				--DBMS_OUTPUT.put_line('ORIGINAL : ' || l_json_doc);
				
				-- create template for new json entries
				l_pse_template := '{ "studentReference": {
																	"studentUniqueId": "'||p_student_unique_id||'",
																	"link": {
																			"rel": "Student",
																			"href": "/students?studentUniqueId='||p_student_unique_id||'"
																	}
															},
															"eventDate": "#EVENTDATE#",
															"categoryType": "#CATEGORY#"
													}';
				
				-- process the json into an array
				if l_json_doc != '[]' then
					for i in 0..1000
						loop
							-- the json_query function requires a string literal for the path so we have to use dynamic sql to process it.
							l_index := '''$['||i||']''';
							l_sql := 'select JSON_query('''||l_json_doc||''','||l_index||' ) from dual';
							execute immediate l_sql into l_events;
							if l_events is null then
								-- ran out so exit the loop
								exit;
							end if;
							--DBMS_OUTPUT.put_line('item : ' || l_events);
							-- add element to the array, ignore anything that is not these three.
							if instr(l_events,'College Degree Received') > 0
								or instr(l_events,'College Application')   > 0
								or instr(l_events,'FAFSA Application')     > 0 then
								pse_elements.extend;
								pse_elements(i+1) := l_events;
								case 
									when instr(l_events,'College Degree Received') > 0 then l_college_degree_found := i+1;
									when instr(l_events,'College Application')     > 0 then l_college_app_found := i+1;
									when instr(l_events,'FAFSA Application')       > 0 then l_financial_app_found := i+1;
								end case;
							end if;
							l_events := null;
						end loop;	
				end if;
				
				-- add or remove the entered items from the page
				if p_associates_degree_date is not null
					and l_college_degree_found is null then 
					-- degree was added to the student
					pse_elements.extend;
					pse_elements(pse_elements.last) := l_pse_template;
					pse_elements(pse_elements.last) := replace(pse_elements(pse_elements.last),'#CATEGORY#','College Degree Received');
					pse_elements(pse_elements.last) := replace(pse_elements(pse_elements.last),'#EVENTDATE#',to_char(p_associates_degree_date,'YYYY-MM-DD'));
					--DBMS_OUTPUT.put_line('updated College Degree Received : ' || pse_elements(pse_elements.last));
				elsif p_associates_degree_date is null
					and l_college_degree_found > 0 then
					-- the Degree was removed from the student so add resource id to delete collection
					pse_deletes.extend;
					select JSON_VALUE(pse_elements(l_college_degree_found),'$.id' ) 
						into pse_deletes(pse_deletes.LAST)
						from dual;
					-- remove from the add list pse_elements
					pse_elements.DELETE(l_college_degree_found);
				elsif l_college_degree_found > 0 then
					-- need to delete the old record as this will create a new one if the date is different
					pse_deletes.extend;
					select JSON_VALUE(pse_elements(l_college_degree_found),'$.id' ) 
						into pse_deletes(pse_deletes.LAST)
						from dual;
					-- not an add and not to be deleted then update with new date
					pse_elements(l_college_degree_found) := l_pse_template;
					pse_elements(l_college_degree_found) := replace(pse_elements(l_college_degree_found),'#CATEGORY#','College Degree Received');
					pse_elements(l_college_degree_found) := replace(pse_elements(l_college_degree_found),'#EVENTDATE#',to_char(p_associates_degree_date,'YYYY-MM-DD'));
					--DBMS_OUTPUT.put_line('updated College Degree Received : ' || pse_elements(l_college_degree_found));
				end if;
				
				if p_college_app_flag = 'Y'
					and l_college_app_found is null then 
					-- degree was added to the student
					pse_elements.extend;
					pse_elements(pse_elements.last) := l_pse_template;
					pse_elements(pse_elements.last) := replace(pse_elements(pse_elements.last),'#CATEGORY#','College Application');
					pse_elements(pse_elements.last) := replace(pse_elements(pse_elements.last),'#EVENTDATE#',to_char(sysdate,'YYYY-MM-DD'));
					--DBMS_OUTPUT.put_line('updated college_app : ' || pse_elements(pse_elements.last));
				elsif p_college_app_flag is null
					and l_college_app_found > 0 then
					-- the college app was removed from the student
					pse_deletes.extend;
					select JSON_VALUE(pse_elements(l_college_app_found),'$.id' ) 
						into pse_deletes(pse_deletes.LAST)
						from dual;
				-- remove from the add list pse_elements
					pse_elements.DELETE(l_college_app_found);
				elsif l_college_app_found > 0 then
					-- not an add and not to be deleted no need to update with new date so remove from add list
					--DBMS_OUTPUT.put_line('college app already exists : ' || pse_elements(l_college_app_found));
				  pse_elements.DELETE(l_college_app_found);
				end if;
				
				if p_financial_app_flag = 'Y'
					and l_financial_app_found is null then 
					-- degree was added to the student
					pse_elements.extend;
					pse_elements(pse_elements.last) := l_events;
					pse_elements(pse_elements.last) := l_pse_template;
					pse_elements(pse_elements.last) := replace(pse_elements(pse_elements.last),'#CATEGORY#','FAFSA Application');
					pse_elements(pse_elements.last) := replace(pse_elements(pse_elements.last),'#EVENTDATE#',to_char(sysdate,'YYYY-MM-DD'));
					--DBMS_OUTPUT.put_line('updated financial_app : ' || pse_elements(pse_elements.last));
				elsif p_financial_app_flag is null
					and l_financial_app_found > 0 then
					-- the college app was removed from the student
					pse_deletes.extend;
					select JSON_VALUE(pse_elements(l_financial_app_found),'$.id' ) 
						into pse_deletes(pse_deletes.LAST)
						from dual;
					-- remove from the add list pse_elements
					pse_elements.DELETE(l_financial_app_found);
				elsif l_financial_app_found > 0 then
					-- not an add and not to be deleted no need to update with new date so remove from add list
					--DBMS_OUTPUT.put_line('financial app already exists : ' || pse_elements(l_financial_app_found));
				  pse_elements.DELETE(l_financial_app_found);
				end if;
			else 
				-- bad response code so raise error
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			
      utl_http.end_response(res);
			utl_http.end_request(req);
			
      -- Add the post secondary events to the ODS
			if pse_elements.COUNT > 0 then
				for x in pse_elements.first..pse_elements.last
					loop
						--DBMS_OUTPUT.put_line('x= ' || x);
						if pse_elements.EXISTS(x) = false then
							continue;
						end if;
						
						--DBMS_OUTPUT.put_line('el to add : ' || pse_elements(x));
						-- remove the resource id, this will cause an error if included
						pse_elements(x) := REGEXP_REPLACE(pse_elements(x), '"id".*?,','',1,0,'i');
						--utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
						req  := UTL_HTTP.begin_request(url, 'POST');
						utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
						utl_http.set_header(req, 'Content-Type', 'application/json');
						utl_http.set_header(req, 'Content-Length', length(pse_elements(x)));
						utl_http.write_text(req, pse_elements(x));
					 
						res := utl_http.get_response(req);
						--dbms_output.put_line(res.status_code);
						
						if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
							 utl_http.read_text(res, buffer,32767);
							 dbms_output.put_line(buffer);
							 select json_value(buffer, '$.error') into l_error from dual;
							 select json_value(buffer, '$.message') into l_warning from dual;
							 utl_http.end_response(res);
							 utl_http.end_request(req);
							 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
						end if;
						utl_http.end_response(res);
						utl_http.end_request(req);
					end loop;
			end if;	
			-- delete the post secondary events that were removed by the user
			if pse_deletes.COUNT > 0 then
				for x in pse_deletes.first..pse_deletes.last
					loop
						--DBMS_OUTPUT.put_line('el to delete : ' || pse_deletes(x));
						--utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
						req  := UTL_HTTP.begin_request(url||'?id='||pse_deletes(x), 'DELETE');
						utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
					 
						res := utl_http.get_response(req);
						--dbms_output.put_line(res.status_code);
						
						if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED,utl_http.HTTP_NO_CONTENT) then
							 utl_http.read_text(res, buffer,32767);
							 dbms_output.put_line(buffer);
							 select json_value(buffer, '$.error') into l_error from dual;
							 select json_value(buffer, '$.message') into l_warning from dual;
							 utl_http.end_response(res);
							 utl_http.end_request(req);
							 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
						end if;
						utl_http.end_response(res);
						utl_http.end_request(req);
					end loop;
			end if;
		END PROC_PUT_POST_SEC_EVENTS_25;
		
		---------------------------------------------------------------------------------
		-- This function returns post secondary events for a student
		procedure PROC_GET_POST_SEC_EVENTS 
		         (P_STUDENT_UNIQUE_ID      in varchar2,
						  P_DISTRICT_ID            in varchar2,
							P_ODS_NUMBER             in varchar2,
							p_associates_degree_date out date,
					    p_college_app_flag       out varchar2,
					    p_financial_app_flag     out varchar2)
		is
		
		TYPE stu_chars_rt IS RECORD (
      CodeValue     VARCHAR2 (200),
      EventDate     date);
 
    l_record   stu_chars_rt;
		l_db_link varchar2(100);
		l_cursor   SYS_REFCURSOR;
    begin
 
			select DB_LINK
				into l_db_link
				from DISTRICT_DB_LINK
			 where DISTRICT_ID = P_DISTRICT_ID
				 and TARGET_DB = 'ODS';

			OPEN l_cursor for 'SELECT to_char(s."CodeValue"), s."EventDate"
										FROM "edfi"."v_StudentPostSecondaryEvent"@'||l_db_link||' s
										where s."StudentUniqueId" ='||''''||P_STUDENT_UNIQUE_ID||''''||'
										order by s."CodeValue"';
			 LOOP
					FETCH l_cursor INTO l_record;
		 
					EXIT WHEN l_cursor%NOTFOUND;
		      case
						when l_record.CodeValue = 'College Degree Received' then p_associates_degree_date := l_record.EventDate;
						when l_record.CodeValue = 'College Application' then p_college_app_flag := 'Y';
						when l_record.CodeValue = 'FAFSA Application'  then p_financial_app_flag := 'Y';
					end case;
					DBMS_OUTPUT.put_line (l_record.CodeValue||' '||l_record.EventDate);
			 END LOOP;
		 
			 CLOSE l_cursor;
			commit;
      execute immediate 'alter session close database link ' || l_db_link;							

    exception
     when NO_DATA_FOUND then
        commit;
        execute immediate 'alter session close database link ' || l_db_link;
			
		end PROC_GET_POST_SEC_EVENTS;
--
-- THis procedure UPDATES student academic recordS FOR INDUSTRY CERTIFICATIONS for ed-fi 2.5
-- you must pull the student academic record back and add to the JSON the new values
  procedure PROC_PUT_STU_IND_CERTS_25 
		      (p_student_unique_id      in varchar2,
					 p_district_id            in varchar2,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2,
					 p_school_year            in varchar2,
					 p_term                   in varchar2,
					 p_achievement_title      in varchar2,
					 p_old_achievement_title  in varchar2   default null,
					 p_transaction_type       in varchar2) -- ADD,UPDATE, OR DELETE
  is
    req                   utl_http.req;
		res                   utl_http.resp;
		url                   varchar2(4000) := c_api_base||c_api_data||p_database_number||'/studentAcademicRecords';
		buffer                varchar2(32767);
		l_json_doc            VARCHAR2(32767);
		l_academic_honors     VARCHAR2(32767);
    l_new_academic_honors VARCHAR2(32767);
		l_title               int;
    l_end_position        int;
    l_start_position      int;
    l_error               varchar2(200);
		l_warning             varchar2(200);
		e_http_error          exception;
		PRAGMA EXCEPTION_INIT (e_http_error, -20009);
		
		l_sar_template        varchar2(32767) := ' {
        "educationOrganizationReference": {
            "educationOrganizationId": #DISTRICT_ID#
        },
        "schoolYearTypeReference": {
            "schoolYear": #SCHOOL_YEAR#
        },
        "studentReference": {
            "studentUniqueId": "#STUDENT_UNIQUE_ID#"
        },
        "termDescriptor": "'||p_term||'",
        "academicHonors": [],
        "diplomas": [],
        "recognitions": [],
        "reportCards": []
    }';
		
		begin
			-- set the url
			PROC_SET_API_URL(P_DB_NUMBER => p_database_number);
			url := c_api_base||c_api_data||'studentAcademicRecords';
			
			-- get the student record via the api and the student unique id
			req  := UTL_HTTP.begin_request(url||'?studentUniqueId='||p_student_unique_id||'&schoolYear='||p_school_year||'&termDescriptor='||APEX_UTIL.URL_ENCODE(p_term), 'GET');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
		  -- submit request
			res := utl_http.get_response(req);
			
			if res.status_code = utl_http.HTTP_OK then
				-- get the response from the rest call
				utl_http.read_text(res, l_json_doc,32767);
				DBMS_OUTPUT.put_line('JSON before : ' || l_json_doc);
				
				if l_json_doc = '[]' then
					-- stu academic rec was not found, use template to create a new one
					l_json_doc := replace(l_sar_template,'#DISTRICT_ID#',to_number(p_district_id));
					l_json_doc := replace(l_json_doc,'#SCHOOL_YEAR#',p_school_year);
					l_json_doc := replace(l_json_doc,'#STUDENT_UNIQUE_ID#',p_student_unique_id);
				end if;
				APEX_DEBUG.message('>>>>>>>>>> template: '||l_json_doc);
				-- PULL ACADEMIC HONORS from response
				select JSON_QUERY(l_json_doc, '$.academicHonors')
					into l_academic_honors
					from dual;
				DBMS_OUTPUT.put_line('certs : ' || l_academic_honors);	
				-- prime l_new_characteristics
				l_new_academic_honors := l_academic_honors;
				
				if p_transaction_type = 'ADD' then 
					-- cert was added to the student
					DBMS_OUTPUT.put_line('add found : ' || p_achievement_title);
					if l_new_academic_honors = '[]' then
						l_new_academic_honors := '[ { "academicHonorCategoryType": "Certificate","achievementCategoryDescriptor":"Certificate Earned","achievementTitle": "'||p_achievement_title||'" } ]';
					else
						l_new_academic_honors := replace(l_new_academic_honors,']',',{ "academicHonorCategoryType": "Certificate","achievementCategoryDescriptor":"Certificate Earned","achievementTitle": "'||p_achievement_title||'" }]');
					end if;
					DBMS_OUTPUT.put_line('add inserted : ' || l_new_academic_honors);
				end if;
				
				if p_transaction_type = 'UPDATE' then 
					-- they can only upate the title so replace the title of the first occurence of the old title
					l_new_academic_honors := REGEXP_REPLACE(l_new_academic_honors,'"achievementTitle":".*?"','"achievementTitle":"'||p_achievement_title||'"',1,1,'in');
				end if;
				
				if p_transaction_type = 'DELETE' then 
					-- REMOVE THE ENTRY TO BE DELETED
					l_title := instr(l_new_academic_honors,p_achievement_title,1,1);
					l_end_position := instr(l_new_academic_honors,'}',l_title,1);
					for i in REVERSE 1..l_title-1
						loop
							if substr(l_new_academic_honors,i,1) = '{' then
								if substr(l_new_academic_honors,i-1,1) = ',' then
									l_start_position := i-1;
								elsif substr(l_new_academic_honors,i-1,1) = '[' 
									and substr(l_new_academic_honors,l_end_position+1,1) = ',' then
									l_end_position := l_end_position + 1;
									l_start_position := i;
								else
									l_start_position := i;
								end if;
								exit;
							end if;
						end loop;	
					l_new_academic_honors :=  replace(l_new_academic_honors,substr(l_new_academic_honors,l_start_position,l_end_position-l_start_position+1),'');
				  dbms_output.put_line('After Delete: '||l_new_academic_honors);
				end if;
				
				-- add to jason doc
				l_json_doc := REGEXP_REPLACE(l_json_doc, '"academicHonors":.*?]', '"academicHonors": '||l_new_academic_honors,1,1,'in');
			  DBMS_OUTPUT.put_line('After : ' || l_json_doc);
			else 
				-- bad response code so raise error
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			
      utl_http.end_response(res);
			utl_http.end_request(req);
			
			-- update the student academic record
			-- remove the resource id ("id") from the response.
			l_json_doc := REGEXP_REPLACE(l_json_doc, '"id":.*','',1,1,'i');
			-- remove the [] as the post is for a single studentAcademicRecord
	    l_json_doc := regexp_replace(l_json_doc,'^\[','',1,1,'i');
			l_json_doc := regexp_replace(l_json_doc,'\]$','',1,1,'i');
	    DBMS_OUTPUT.put_line('before submit : ' || l_json_doc);  
			-- add/Update the student data in the ODS
			--utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
			req  := UTL_HTTP.begin_request(url, 'POST');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
			utl_http.set_header(req, 'Content-Type', 'application/json');
			utl_http.set_header(req, 'Content-Length', length(l_json_doc));
			utl_http.write_text(req, l_json_doc);

			res := utl_http.get_response(req);
			dbms_output.put_line(res.status_code);
			
			if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
				 utl_http.read_text(res, buffer,32767);
				 dbms_output.put_line(buffer);
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			utl_http.end_response(res);
			utl_http.end_request(req);
		END PROC_PUT_STU_IND_CERTS_25;
--
-- THis procedure UPDATES student academic recordS FOR Level 1 and 2 CERTIFICATIONS for ed-fi 2.5
-- you must pull the student academic record back and add to the JSON the new values
  procedure PROC_PUT_STU_LVL12_CERTS_25 
		      (p_student_unique_id      in varchar2,
					 p_district_id            in varchar2,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2,
					 p_school_year            in varchar2,
					 p_term                   in varchar2,
					 p_achievement_title      in varchar2,
					 p_old_achievement_title  in varchar2   default null,
					 P_CRITERIA               in varchar2,
					 P_AWARD_DATE             in date,
					 p_transaction_type       in varchar2) -- ADD,UPDATE, OR DELETE
  is
    req                   utl_http.req;
		res                   utl_http.resp;
		url                   varchar2(4000) := c_api_base||c_api_data||p_database_number||'/studentAcademicRecords';
		buffer                varchar2(32767);
		l_json_doc            VARCHAR2(32767);
		l_recognitions        VARCHAR2(32767);
    l_new_recognitions    VARCHAR2(32767);
		l_title               int;
    l_end_position        int;
    l_start_position      int;
    l_error               varchar2(200);
		l_warning             varchar2(200);
		e_http_error          exception;
		PRAGMA EXCEPTION_INIT (e_http_error, -20009);
		
		l_sar_template        varchar2(32767) := ' {
        "educationOrganizationReference": {
            "educationOrganizationId": #DISTRICT_ID#
        },
        "schoolYearTypeReference": {
            "schoolYear": #SCHOOL_YEAR#
        },
        "studentReference": {
            "studentUniqueId": "#STUDENT_UNIQUE_ID#"
        },
        "termDescriptor": "'||p_term||'",
        "academicHonors": [],
        "diplomas": [],
        "recognitions": [],
        "reportCards": []
    }';
		
		begin
			-- set the url
			PROC_SET_API_URL(P_DB_NUMBER => p_database_number);
			url := c_api_base||c_api_data||'studentAcademicRecords';
			
			-- get the student record via the api and the student unique id
			req  := UTL_HTTP.begin_request(url||'?studentUniqueId='||p_student_unique_id||'&schoolYear='||p_school_year||'&termDescriptor='||APEX_UTIL.URL_ENCODE(p_term), 'GET');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
		  -- submit request
			res := utl_http.get_response(req);
			
			if res.status_code = utl_http.HTTP_OK then
				-- get the response from the rest call
				utl_http.read_text(res, l_json_doc,32767);
				DBMS_OUTPUT.put_line('JSON before : ' || l_json_doc);
				
				if l_json_doc = '[]' then
					-- rec was not found, use template to create a new one
					l_json_doc := replace(l_sar_template,'#DISTRICT_ID#',to_number(p_district_id));
					l_json_doc := replace(l_json_doc,'#SCHOOL_YEAR#',p_school_year);
					l_json_doc := replace(l_json_doc,'#STUDENT_UNIQUE_ID#',p_student_unique_id);
				end if;
				
				-- PULL RECOGNITIONS from response
				select JSON_QUERY(l_json_doc, '$.recognitions')
					into l_recognitions
					from dual;
				DBMS_OUTPUT.put_line('certs : ' || l_recognitions);	
				-- prime l_new_characteristics
				l_new_recognitions := l_recognitions;
				
				if p_transaction_type = 'ADD' then 
					-- cert was added to the student
					DBMS_OUTPUT.put_line('add found : ' || p_achievement_title);
					l_new_recognitions := '[ { "recognitionType": "Certificate","criteria": "'||P_CRITERIA||'","achievementTitle": "'||p_achievement_title||'","recognitionAwardDate": "'||to_char(P_AWARD_DATE,'YYYY-MM-DD')||'" } ]';
					DBMS_OUTPUT.put_line('add inserted : ' || l_new_recognitions);
				end if;
				
				if p_transaction_type = 'UPDATE' then 
					-- replace the title of the first occurence of the old title
					l_new_recognitions := REGEXP_REPLACE(l_new_recognitions,'"achievementTitle":".*?"','"achievementTitle":"'||p_achievement_title||'"',1,1,'in');
				  l_new_recognitions := REGEXP_REPLACE(l_new_recognitions,'"recognitionAwardDate":".*?"','"recognitionAwardDate":"'||to_char(P_AWARD_DATE,'YYYY-MM-DD')||'"',1,1,'in');
				  l_new_recognitions := REGEXP_REPLACE(l_new_recognitions,'"criteria":".*?"','"criteria":"'||P_CRITERIA||'"',1,1,'in');
				end if;
				
				if p_transaction_type = 'DELETE' then 
					-- REMOVE THE ENTRY TO BE DELETED
					l_title := instr(l_new_recognitions,p_achievement_title,1,1);
					l_end_position := instr(l_new_recognitions,'}',l_title,1);
					for i in REVERSE 1..l_title-1
						loop
							if substr(l_new_recognitions,i,1) = '{' then
								if substr(l_new_recognitions,i-1,1) = ',' then
									l_start_position := i-1;
								elsif substr(l_new_recognitions,i-1,1) = '[' 
									and substr(l_new_recognitions,l_end_position+1,1) = ',' then
									l_end_position := l_end_position + 1;
									l_start_position := i;
								else
									l_start_position := i;
								end if;
								exit;
							end if;
						end loop;	
					l_new_recognitions :=  replace(l_new_recognitions,substr(l_new_recognitions,l_start_position,l_end_position-l_start_position+1),'');
				  dbms_output.put_line('After Delete: '||l_new_recognitions);
				end if;
				
				-- add to jason doc
				l_json_doc := REGEXP_REPLACE(l_json_doc, '"recognitions":.*?]', '"recognitions": '||l_new_recognitions,1,1,'in');
			  DBMS_OUTPUT.put_line('After : ' || l_json_doc);
			else 
				-- bad response code so raise error
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			
      utl_http.end_response(res);
			utl_http.end_request(req);
			
			-- update the student academic record
			-- remove the resource id ("id") from the response.
			l_json_doc := REGEXP_REPLACE(l_json_doc, '"id":.*','',1,1,'i');
			-- remove the [] as the post is for a single studentAcademicRecord
	    l_json_doc := regexp_replace(l_json_doc,'^\[','',1,1,'i');
			l_json_doc := regexp_replace(l_json_doc,'\]$','',1,1,'i');
	    DBMS_OUTPUT.put_line('before submit : ' || l_json_doc);  
			-- add/Update the student data in the ODS
			--utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
			req  := UTL_HTTP.begin_request(url, 'POST');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
			utl_http.set_header(req, 'Content-Type', 'application/json');
			utl_http.set_header(req, 'Content-Length', length(l_json_doc));
			utl_http.write_text(req, l_json_doc);

			res := utl_http.get_response(req);
			dbms_output.put_line(res.status_code);
			
			if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
				 utl_http.read_text(res, buffer,32767);
				 dbms_output.put_line(buffer);
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			utl_http.end_response(res);
			utl_http.end_request(req);
		END PROC_PUT_STU_LVL12_CERTS_25;
		
-- pipelined table function to return student list.
  FUNCTION FN_GET_STUDENT_LIST (
       P_SEARCH IN varchar2,
			 P_DISTRICT_ID in varchar2
  ) return t_STU_LIST_tab PIPELINED as
	
    l_record  t_STU_LIST_row;
		l_db_link varchar2(100);
    l_sql     varchar2(1000);
		l_cursor  sys_refcursor;
  begin
		select DB_LINK
				into l_db_link
				from DISTRICT_DB_LINK
			 where DISTRICT_ID = P_DISTRICT_ID
				 and TARGET_DB = 'ODS';
				 
  OPEN l_cursor for 'select "LastSurname", "FirstName", "BirthDate", "StudentUniqueId", "LocalCode" 
												from edfi.v_StudentIds@'||l_db_link||' 
											 where instr(lower("LastSurname"),lower('''||P_SEARCH||''')) > 0
													or instr(lower("FirstName"),lower('''||P_SEARCH||''')) > 0
											or instr(lower("BirthDate"),lower('''||P_SEARCH||''')) > 0
											or instr(lower("StudentUniqueId"),lower('''||P_SEARCH||''')) > 0
											or instr(lower("LocalCode"),lower('''||P_SEARCH||''')) > 0
											or "StudentUniqueId" = nvl('''||P_SEARCH||''',"StudentUniqueId")';
		 LOOP
				FETCH l_cursor INTO l_record;
		 
				EXIT WHEN l_cursor%NOTFOUND;
				
				PIPE ROW(l_record);
		 END loop;

		 CLOSE l_cursor;
  execute immediate 'alter session close database link ' || l_db_link;
  RETURN;
  end FN_GET_STUDENT_LIST;
-- pipelined table function to return STUDENT ATTRIBUTES list.  NOT USED
  FUNCTION FN_GET_STU_ATTRS (
			 P_DISTRICT_ID       in varchar2,
			 P_STUDENT_UNIQUE_ID in varchar2
  ) return t_STU_ATTR_tab PIPELINED as
	
    l_record  t_STU_ATTR_row;
		l_db_link varchar2(100);
    l_sql     varchar2(1000);
		l_cursor  sys_refcursor;
  begin
		select DB_LINK
				into l_db_link
				from DISTRICT_DB_LINK
			 where DISTRICT_ID = P_DISTRICT_ID
				 and TARGET_DB = 'ODS';
	l_sql := 'SELECT to_char(s."CodeValue") as "CodeValue", s."BeginDate"
										FROM "edfi"."v_StudentCharacteristics"@'||l_db_link||' s
										where s."StudentUniqueId" ='||''''||P_STUDENT_UNIQUE_ID||''''||'
										  and s."CodeValue" in (''ASVAB'',''Military Enlistment'',''Meningitis Vaccine'')
										order by s."CodeValue"';
	DBMS_OUTPUT.PUT_LINE(l_sql);			 
  open l_cursor for l_sql;
	LOOP
		FETCH l_cursor INTO l_record;
			 
		EXIT WHEN l_cursor%NOTFOUND;
					
		PIPE ROW(l_record);
	END loop;

	CLOSE l_cursor;		
  execute immediate 'alter session close database link ' || l_db_link;	

  RETURN;
  end FN_GET_STU_ATTRS;
-- pipelined table function to return STUDENT POST SECONDARY EVENTS list.  NOT USED
  FUNCTION FN_GET_STU_PS_EVENTS (
			 P_DISTRICT_ID       in varchar2,
			 P_STUDENT_UNIQUE_ID in varchar2
  ) return t_STU_PS_EVENT_tab PIPELINED as
	
    l_record  t_STU_PS_EVENT_row;
		l_db_link varchar2(100);
    l_sql     varchar2(1000);
		l_cursor  sys_refcursor;
  begin
		select DB_LINK
				into l_db_link
				from DISTRICT_DB_LINK
			 where DISTRICT_ID = P_DISTRICT_ID
				 and TARGET_DB = 'ODS';
	l_sql := 'SELECT to_char(s."CodeValue"), s."EventDate"
										FROM "edfi"."v_StudentPostSecondaryEvent"@'||l_db_link||' s
										where s."StudentUniqueId" ='||''''||P_STUDENT_UNIQUE_ID||''''||'
										order by s."CodeValue"';
	DBMS_OUTPUT.PUT_LINE(l_sql);			 
  open l_cursor for l_sql;
	LOOP
		FETCH l_cursor INTO l_record;
			 
		EXIT WHEN l_cursor%NOTFOUND;
					
		PIPE ROW(l_record);
	END loop;

	CLOSE l_cursor;			
  execute immediate 'alter session close database link ' || l_db_link;
  RETURN;
  end FN_GET_STU_PS_EVENTS;
------------------------------------------------------
-- pipelined table function to return student list.
  FUNCTION FN_GET_INDUSTRY_CERT_LIST (
       P_STUDENT_UNIQUE_ID IN varchar2,
			 P_DISTRICT_ID in varchar2
  ) return t_STU_INDUSTRY_CERT_tab PIPELINED as
	
    l_record  t_STU_INDUSTRY_CERT_row;
		l_db_link varchar2(100);
    l_sql     varchar2(1000);
		l_cursor  sys_refcursor;
  begin
		select DB_LINK
				into l_db_link
				from DISTRICT_DB_LINK
			 where DISTRICT_ID = P_DISTRICT_ID
				 and TARGET_DB = 'ODS';
	l_sql := 'select "StudentUniqueId"
												, "SchoolYear"
												, "TermDescriptor"
												, "AcademicHonorCategoryType"
												, "AchievementCategory"
												, "AchievementTitle"
											from edfi.v_StudentIndustryCert@'||l_db_link||' 
										 where "StudentUniqueId" = '''||P_student_unique_id||'''';
	DBMS_OUTPUT.PUT_LINE(l_sql);
  OPEN l_cursor for l_sql;
		 LOOP
				FETCH l_cursor INTO l_record;
		    
				EXIT WHEN l_cursor%NOTFOUND;
				DBMS_OUTPUT.PUT_LINE('rowcount:'||l_cursor%ROWCOUNT);
				DBMS_OUTPUT.PUT_LINE('StudentUniqueId: '||l_record."StudentUniqueId");
				DBMS_OUTPUT.PUT_LINE('SchoolYear: '||l_record."SchoolYear");
				DBMS_OUTPUT.PUT_LINE('SchoolYear: '||l_record."AchievementTitle");
				PIPE ROW(l_record);
		 END loop;

		 CLOSE l_cursor;
  execute immediate 'alter session close database link ' || l_db_link;	
		 
  RETURN;
  end FN_GET_INDUSTRY_CERT_LIST;
-- pipelined table function to return student list.
  FUNCTION FN_GET_LEVEL12_CERT_LIST (
       P_STUDENT_UNIQUE_ID IN varchar2,
			 P_DISTRICT_ID       in varchar2
  ) return t_STU_LEVEL12_CERT_tab PIPELINED as
	
    l_record  t_STU_LEVEL12_CERT_row;
		l_db_link varchar2(100);
    l_sql     varchar2(1000);
		l_cursor  sys_refcursor;
  begin
		select DB_LINK
				into l_db_link
				from DISTRICT_DB_LINK
			 where DISTRICT_ID = P_DISTRICT_ID
				 and TARGET_DB = 'ODS';
	l_sql := 'select "StudentUniqueId"
												, "SchoolYear"
												, "TermDescriptor"
												, "RecognitionAwardDate"
												, "AchievementTitle"
												, "Criteria"
											from edfi.v_StudentLevel12Cert@'||l_db_link||' 
										 where "StudentUniqueId" = '''||P_student_unique_id||'''';
	DBMS_OUTPUT.PUT_LINE(l_sql);			 
  open l_cursor for l_sql;
		 LOOP
				FETCH l_cursor INTO l_record;
		 
				EXIT WHEN l_cursor%NOTFOUND;
				
				PIPE ROW(l_record);
		 END loop;

		 CLOSE l_cursor;	
  execute immediate 'alter session close database link ' || l_db_link;		

  RETURN;
  end FN_GET_LEVEL12_CERT_LIST;

-- pipelined table function to return COURSE list.
  FUNCTION FN_GET_COURSES_LIST (
			 P_DISTRICT_ID       in varchar2
  ) return t_COURSE_CHAR_tab PIPELINED as
	
    l_record  t_COURSE_CHAR_row;
		l_db_link varchar2(100);
    l_sql     varchar2(1000);
		l_cursor  sys_refcursor;
  begin
		select DB_LINK
				into l_db_link
				from DISTRICT_DB_LINK
			 where DISTRICT_ID = P_DISTRICT_ID
				 and TARGET_DB = 'ODS';
	l_sql := 'select "CourseCode"
									,"CourseTitle"
									,"AcademicSubjectDescriptor"
									,"CourseLevelCharacteristic"
							from "edfi"."v_Courses"@'||l_db_link;
	DBMS_OUTPUT.PUT_LINE(l_sql);			 
  open l_cursor for l_sql;
	LOOP
		FETCH l_cursor INTO l_record;
			 
		EXIT WHEN l_cursor%NOTFOUND;
					
		PIPE ROW(l_record);
	END loop;

	CLOSE l_cursor;	
  execute immediate 'alter session close database link ' || l_db_link;		

  RETURN;
  end FN_GET_COURSES_LIST;
-- PROCEDURE to pull the STUDENTS from the ods and load into DISTRICT_STUDENT_CACHE based on ods number.
  procedure PROC_INSERT_STUDENT_LIST (
			 P_ODS_NUMBER       in varchar2
  ) as
		l_db_link varchar2(100);
    l_sql     varchar2(1000);
		l_found   char;
  begin
		-- Check if the cache is already loaded
		begin
			select 'Y'
				into l_found
				from district_student_cache
				where session_id = nv('APP_SESSION')
				  and rownum = 1;
			-- cache is already loaded so update the timestamp
			update district_student_cache
		     set create_ts = systimestamp
			 where session_id = nv('APP_SESSION');
		exception when no_data_found then
			l_found := 'N';
		end;
		-- if the cache is not loaded then load it.
		if l_found = 'N' then 
			-- CLEAR THE TMP TABLE
			/*delete from DISTRICT_STUDENT_CACHE
				where session_id = nv('APP_SESSION');*/
			-- GET DB LINK
			select DB_LINK
					into l_db_link
					from DISTRICT_DB_LINK L
					join DISTRICTS D on D.DISTRICT_CDC = L.DISTRICT_ID
				 where D.DISTRICT_DB_NUMBER = P_ODS_NUMBER
					 and L.TARGET_DB = 'ODS';
			-- BUILD SQL STMT
			l_sql := 'insert into DISTRICT_STUDENT_CACHE 
											 SELECT 
													'||nv('APP_SESSION')||',
													systimestamp,
													"LastSurname", 
													"FirstName", 
													"BirthDate", 
													"StudentUniqueId", 
													 "LocalCode" 
												from edfi.v_StudentIds@'||l_db_link;
			--apex_debug.message(l_sql);
			--DBMS_OUTPUT.PUT_LINE(l_sql);
			-- RUN SQL			 
			execute immediate l_sql;
			-- COMMIT THE INSERT AND COMMIT THE DB_LINK
			commit;
			-- CLOSE THE DB_LINK
			execute immediate 'alter session close database link ' || l_db_link;
		end if;
	exception
		when others then
			begin
			   -- COMMIT THE INSERT AND COMMIT THE DB_LINK
				 commit;
				 -- CLOSE THE DB_LINK
				 execute immediate 'alter session close database link ' || l_db_link;
			 exception when others then
				 -- do nothing as it is not open
				 null; 
			 end;
			 -- re-raise the error
			 raise;
  end PROC_INSERT_STUDENT_LIST;
-- PROCEDURE to pull the STUDENTS CERTS from the ods and load into district_student_certs_cache based on ods number.
  procedure PROC_INSERT_STU_CERTS_CACHE (
       P_STUDENT_UNIQUE_ID IN varchar2,
			 P_ODS_NUMBER       in varchar2
  ) as
		l_db_link varchar2(100);
    l_sql     varchar2(4000);
  begin
		-- CLEAR THE TMP TABLE
		delete from district_student_certs_cache
		  where session_id = nv('APP_SESSION');
		-- GET DB LINK
		select DB_LINK
				into l_db_link
				from DISTRICT_DB_LINK L
				join DISTRICTS D on D.DISTRICT_CDC = L.DISTRICT_ID
			 where D.DISTRICT_DB_NUMBER = P_ODS_NUMBER
				 and L.TARGET_DB = 'ODS';
		-- BUILD SQL STMT
		l_sql := 'insert into district_student_certs_cache
		            SELECT 
										'||nv('APP_SESSION')||',
										systimestamp,
										"StudentUniqueId", 
										"SchoolYear", 
										"TermDescriptor", 
										"AchievementTitle",
										null as criteria,
										null as award_date,
										''INDUSTRY'' AS cert_type,
										"AcademicHonorCategoryType",
										"AchievementCategory"
									from "edfi"."v_StudentIndustryCert"@'||l_db_link||' 
									where "StudentUniqueId" = '''||P_student_unique_id||'''
									union
									SELECT 
										'||nv('APP_SESSION')||',
										systimestamp,
										"StudentUniqueId", 
										"SchoolYear", 
										"TermDescriptor", 
										"AchievementTitle",
										"Criteria" as criteria,
										"RecognitionAwardDate" as award_date,
										''LEVEL1_2'' AS cert_type,
										null as "AcademicHonorCategoryType",
										null as "AchievementCategory"
									from "edfi"."v_StudentLevel12Cert"@'||l_db_link||' 
								 where "StudentUniqueId" = '''||P_student_unique_id||'''';
		--apex_debug.message(l_sql);
		DBMS_OUTPUT.PUT_LINE(l_sql);
		-- RUN SQL			 
		execute immediate l_sql;
		-- COMMIT THE INSERT AND COMMIT THE DB_LINK
		commit;
		-- CLOSE THE DB_LINK
		execute immediate 'alter session close database link ' || l_db_link;
	exception
		when others then
			begin
			   -- COMMIT THE INSERT AND COMMIT THE DB_LINK
				 commit;
				 -- CLOSE THE DB_LINK
				 execute immediate 'alter session close database link ' || l_db_link;
			 exception when others then
				 -- do nothing as it is not open
				 null; 
			 end;
			 -- re-raise the error
			 raise;
  end PROC_INSERT_STU_CERTS_CACHE;
	
-- PROCEDURE to pull the staff from the ods and load into TMP_DISTRICT_STAFF based on ods number.
  procedure PROC_INSERT_STAFF_LIST (
			 P_ODS_NUMBER       in varchar2
  ) as
		l_db_link varchar2(100);
    l_sql     varchar2(1000);
  begin
		-- CLEAR THE TMP TABLE
		delete from DISTRICT_STAFF_CACHE
		  where session_id = nv('APP_SESSION');
		-- GET DB LINK
		select DB_LINK
				into l_db_link
				from DISTRICT_DB_LINK L
				join DISTRICTS D on D.DISTRICT_CDC = L.DISTRICT_ID
			 where D.DISTRICT_DB_NUMBER = P_ODS_NUMBER
				 and L.TARGET_DB = 'ODS';
		-- BUILD SQL STMT
		l_sql := 'insert into DISTRICT_STAFF_CACHE 
		                 SELECT 
										  '||nv('APP_SESSION')||',
											systimestamp,
		                  "StaffUSI", 
											"StaffUniqueId", 
											"LastSurname", 
											"FirstName", 
											"ElectronicMailAddress", 
											"StaffClassification"
											FROM "edfi"."v_Staff"@'||l_db_link;
		--apex_debug.message(l_sql);
		-- RUN SQL			 
		execute immediate l_sql;
		-- COMMIT THE INSERT AND COMMIT THE DB_LINK
		commit;
		-- CLOSE THE DB_LINK
		execute immediate 'alter session close database link ' || l_db_link;
	exception
		when no_data_found then
			begin -- make sure db link is closed
			   -- COMMIT THE INSERT AND COMMIT THE DB_LINK
				 commit;
				 -- CLOSE THE DB_LINK
				 execute immediate 'alter session close database link ' || l_db_link;
			 exception when others then
				 -- do nothing as it is not open
				 null; 
			 end;
			 -- do not re-raise the error as there is no data to show.
		when others then
			begin
			   -- COMMIT THE INSERT AND COMMIT THE DB_LINK
				 commit;
				 -- CLOSE THE DB_LINK
				 execute immediate 'alter session close database link ' || l_db_link;
			 exception when others then
				 -- do nothing as it is not open
				 null; 
			 end;
			 -- re-raise the error
			 raise;
  end PROC_INSERT_STAFF_LIST;
-- Clear the cache tables periodically
  procedure PROC_CLEAR_CACHE_TABLES
	is
	begin
		-- CLEAR THE STAFF CACHE
		delete from district_staff_cache
		 where CREATE_TS < sysdate  - INTERVAL '30' MINUTE;
		-- CLEAR THE student CACHE
		delete from district_student_cache
		 where CREATE_TS < sysdate  - INTERVAL '30' MINUTE;
		commit;
	end; 
-- THis procedure inserts a student characteristic for ed-fi 3.5
-- you must pull the student record back and add to the JSON the new values
  procedure PROC_PUT_STU_CHAR_35 
		      (p_student_unique_id      in varchar2,
					 p_ASVAB_date             in date,
					 p_Military_date          in date,
					 p_Meningitis_date        in date,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2) 
  is
    req                 utl_http.req;
		res                 utl_http.resp;
		url                 varchar2(4000);
		buffer              varchar2(32767);
		l_json_doc          VARCHAR2(32767);
		l_characteristics   VARCHAR2(32767);
    l_new_characteristics VARCHAR2(32767);
    l_error             varchar2(200);
		l_warning           varchar2(200);
		e_http_error        exception;
		PRAGMA EXCEPTION_INIT (e_http_error, -20009);
		
		begin
			-- set the url
			PROC_SET_API_URL(P_DB_NUMBER => p_database_number);
			url := c_api_base||c_api_data||'studentEducationOrganizationAssociations';
			
			-- get the student record via the api and the student unique id
			req  := UTL_HTTP.begin_request(url||'?studentUniqueId='||p_student_unique_id, 'GET');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
		  -- submit request
			res := utl_http.get_response(req);
			--DBMS_OUTPUT.put_line('resp code : ' || res.status_code || ' msg: '||res.reason_phrase);
			if res.status_code = utl_http.HTTP_OK then
				-- get the response from the rest call
				utl_http.read_text(res, l_json_doc,32767);
				--DBMS_OUTPUT.put_line('before : ' || l_json_doc);
				-- remove the resource id ("id") from the response.
				l_json_doc := REGEXP_REPLACE(l_json_doc, '"id":.*','',1,1,'i');
				-- add characteristics from ':' delimitied list
				select JSON_QUERY(l_json_doc, '$.studentCharacteristics')
					into l_characteristics
					from dual;
				--DBMS_OUTPUT.put_line('charac : ' || l_characteristics);	
				-- prime l_new_characteristics
				l_new_characteristics := l_characteristics;
				apex_debug.message('>>>> asvab dt: '||p_ASVAB_date);
				if p_ASVAB_date is not null then 
					-- characteristic was added to the student
					if l_new_characteristics = '[]' then
						apex_debug.message('>>>> no chars: '||p_ASVAB_date);
						l_new_characteristics := '[{"studentCharacteristicDescriptor": "uri://ed-fi.org/StudentCharacteristicDescriptor#ASVAB","periods": [{"beginDate": "'||to_char(p_ASVAB_date,'YYYY-MM-DD')||'"}]}]';
					else
						if instr(l_characteristics,'ASVAB') > 0 then
							-- there is already an entry so remove it in favor of the new one.
							apex_debug.message('>>>> already an asvab dt: '||p_ASVAB_date);
							l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,'(,|){"studentCharacteristicDescriptor":"uri:\/\/ed-fi.org\/StudentCharacteristicDescriptor\#ASVAB".*?(}\]},|}\]}|\[\]},|\[\]})','',1,1,'in');
				    end if;
						if l_new_characteristics = '[]' then
							-- collection is empty so add with out comma at the begining
							l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,']$','{"studentCharacteristicDescriptor": "uri://ed-fi.org/StudentCharacteristicDescriptor#ASVAB","periods": [{"beginDate": "'||to_char(p_ASVAB_date,'YYYY-MM-DD')||'"}]}]',1,1,'in');
						  apex_debug.message('>>>> add to empty asvab dt: '||l_new_characteristics);
						else
							-- append the new asvab with new date
							l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,']$',',{"studentCharacteristicDescriptor": "uri://ed-fi.org/StudentCharacteristicDescriptor#ASVAB","periods": [{"beginDate": "'||to_char(p_ASVAB_date,'YYYY-MM-DD')||'"}]}]',1,1,'in');
						  apex_debug.message('>>>> append asvab dt: '||l_new_characteristics);
						end if;
					end if;
				elsif p_ASVAB_date is null
					and instr(l_characteristics,'ASVAB') > 0 then
					apex_debug.message('>>>> was null remove it asvab dt: '||p_ASVAB_date);
					-- the characteristic was removed from the student
					l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,'(,|){"studentCharacteristicDescriptor":"uri:\/\/ed-fi.org\/StudentCharacteristicDescriptor\#ASVAB".*?(}\]},|}\]}|\[\]},|\[\]})','',1,1,'in');
				end if;
				
				if p_Military_date is not null then 
					if l_new_characteristics = '[]' then
						l_new_characteristics := '[{"studentCharacteristicDescriptor": "uri://ed-fi.org/StudentCharacteristicDescriptor#Military Enlistment","periods": [{"beginDate": "'||to_char(p_Military_date,'YYYY-MM-DD')||'"}]}]';
					else
						if instr(l_characteristics,'Military Enlistment') > 0 then
							-- there is already an entry so remove it in favor of the new one.
							l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,'(,|){"studentCharacteristicDescriptor":"uri:\/\/ed-fi.org\/StudentCharacteristicDescriptor\#Military\ Enlistment".*?(}\]},|}\]}|\[\]},|\[\]})','',1,1,'in');
				    end if;
						if l_new_characteristics = '[]' then
							-- collection is empty so add with out comma at the begining
							l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,']$','{"studentCharacteristicDescriptor": "uri://ed-fi.org/StudentCharacteristicDescriptor#Military Enlistment","periods": [{"beginDate": "'||to_char(p_Military_date,'YYYY-MM-DD')||'"}]}]',1,1,'in');
						else
							-- append the new asvab with new date
							l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,']$',',{"studentCharacteristicDescriptor": "uri://ed-fi.org/StudentCharacteristicDescriptor#Military Enlistment","periods": [{"beginDate": "'||to_char(p_Military_date,'YYYY-MM-DD')||'"}]}]',1,1,'in');
						end if;
					end if;
				elsif p_Military_date is null
					and instr(l_characteristics,'Military Enlistment') > 0 then
					-- the characteristic was removed from the student
					l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,'(,|){"studentCharacteristicDescriptor":"uri:\/\/ed-fi.org\/StudentCharacteristicDescriptor\#Military\ Enlistment".*?(}\]},|}\]}|\[\]},|\[\]})','',1,1,'in');
		    end if;
				
				if p_Meningitis_date is not null then 
					if l_new_characteristics = '[]' then
						l_new_characteristics := '[{"studentCharacteristicDescriptor": "uri://ed-fi.org/StudentCharacteristicDescriptor#Meningitis Vaccine","periods": [{"beginDate": "'||to_char(p_Meningitis_date,'YYYY-MM-DD')||'"}]}]';
					else
						if instr(l_characteristics,'Meningitis Vaccine') > 0 then
							-- there is already an entry so remove it in favor of the new one.
							l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,'(,|){"studentCharacteristicDescriptor":"uri:\/\/ed-fi.org\/StudentCharacteristicDescriptor\#Meningitis\ Vaccine".*?(}\]},|}\]}|\[\]},|\[\]})','',1,1,'in');
				    end if;
						if l_new_characteristics = '[]' then
							-- collection is empty so add with out comma at the begining
							l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,']$','{"studentCharacteristicDescriptor": "uri://ed-fi.org/StudentCharacteristicDescriptor#Meningitis Vaccine","periods": [{"beginDate": "'||to_char(p_Meningitis_date,'YYYY-MM-DD')||'"}]}]',1,1,'in');
						else
							-- append the new asvab with new date
							l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,']$',',{"studentCharacteristicDescriptor": "uri://ed-fi.org/StudentCharacteristicDescriptor#Meningitis Vaccine","periods": [{"beginDate": "'||to_char(p_Meningitis_date,'YYYY-MM-DD')||'"}]}]',1,1,'in');
						end if;
					end if;
				elsif p_Meningitis_date is null
					and instr(l_characteristics,'Meningitis Vaccine') > 0 then
					-- the characteristic was removed from the student
					l_new_characteristics := REGEXP_REPLACE(l_new_characteristics,'(,|){"studentCharacteristicDescriptor":"uri:\/\/ed-fi.org\/StudentCharacteristicDescriptor\#Meningitis\ Vaccine".*?(}\]},|}\]}|\[\]},|\[\]})','',1,1,'in');
				end if;
				
				-- sometimes when there are pre-existing characteristics a comma may be missing.  replace }{ with },{
				l_new_characteristics := replace(l_new_characteristics,'}{','},{');
				apex_debug.message('>>>> l_new_characteristics: '||l_new_characteristics);
				--DBMS_OUTPUT.put_line('updated : ' || l_new_characteristics);
				-- replace the studentCharacteristics in the jason doc
				l_json_doc := REGEXP_REPLACE(l_json_doc, '"studentCharacteristics":.*?],.*"studentIdentificationCodes"', '"studentCharacteristics": '||l_new_characteristics||', "studentIdentificationCodes"',1,1,'in');
			  apex_debug.message('>>>> l_json_doc: '||l_json_doc);
				--DBMS_OUTPUT.put_line('After studentCharacteristics replace: ' || l_json_doc);
				
			else 
				-- bad response code so raise error
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			
      utl_http.end_response(res);
      
			-- Update the student data in the ODS
			-- remove the [] as the post is for a single Record
	    l_json_doc := regexp_replace(l_json_doc,'^\[','',1,1,'i');
			l_json_doc := regexp_replace(l_json_doc,'\]$','',1,1,'i');
			--apex_debug.message('>>>>>>>>>>>>>request body: '||l_json_doc);
			--utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
			req  := UTL_HTTP.begin_request(url, 'POST');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
			utl_http.set_header(req, 'Content-Type', 'application/json');
			utl_http.set_header(req, 'Content-Length', length(l_json_doc));
			utl_http.write_text(req, l_json_doc);
		 
			res := utl_http.get_response(req);
			--dbms_output.put_line(res.status_code);
			
			if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
				 utl_http.read_text(res, buffer,32767);
				 dbms_output.put_line(buffer);
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			utl_http.end_response(res);
			
		END PROC_PUT_STU_CHAR_35;
--
-- THis procedure inserts a student POST SECONDARY EVENT(Associates degree,college app,financial app) for ed-fi 3.5
-- you must pull the student POST SECONDARY EVENT record back and add to the JSON the new values
  procedure PROC_PUT_POST_SEC_EVENTS_35 
		      (p_student_unique_id      in varchar2,
					 p_associates_degree_date in date,
					 p_college_app_flag       in varchar2,
					 p_financial_app_flag     in varchar2,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2) 
  is
    req                 utl_http.req;
		res                 utl_http.resp;
		url                 varchar2(4000);
		buffer              varchar2(32767);
		l_json_doc          varchar2(32767);
		l_sql               varchar2(32767);
		l_events            varchar2(32767);
		l_pse_template      varchar2(4000);
		pse_elements        apex_t_varchar2 := apex_t_varchar2();
		pse_deletes         apex_t_varchar2 := apex_t_varchar2();
		l_index             varchar2(40);
		l_college_degree_found int;
		l_college_app_found    int;
		l_financial_app_found  int;
    l_error             varchar2(200);
		l_warning           varchar2(200);
		e_http_error        exception;
		PRAGMA EXCEPTION_INIT (e_http_error, -20009);
		
		begin
			-- set the url
			PROC_SET_API_URL(P_DB_NUMBER => p_database_number);
			url := c_api_base||c_api_data||'postSecondaryEvents';
			
			-- get the student record via the api and the student unique id
			req  := UTL_HTTP.begin_request(url||'?studentUniqueId='||p_student_unique_id, 'GET');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
		  -- submit request
			res := utl_http.get_response(req);
			--DBMS_OUTPUT.put_line('resp code : ' || res.status_code || ' msg: '||res.reason_phrase);
			if res.status_code = utl_http.HTTP_OK then
				
				-- get the response from the rest call
				utl_http.read_text(res, l_json_doc,32767);
				--DBMS_OUTPUT.put_line('ORIGINAL : ' || l_json_doc);
				
				-- create template for new json entries
				l_pse_template := '{ "studentReference": {
																	"studentUniqueId": "'||p_student_unique_id||'"
															},
															"eventDate": "#EVENTDATE#",
															"postSecondaryEventCategoryDescriptor": "uri://ed-fi.org/PostSecondaryEventCategoryDescriptor##CATEGORY#"
													}';
				
				-- process the json into an array
				if l_json_doc != '[]' then
					for i in 0..1000
						loop
							-- the json_query function requires a string literal for the path so we have to use dynamic sql to process it.
							l_index := '''$['||i||']''';
							l_sql := 'select JSON_query('''||l_json_doc||''','||l_index||' ) from dual';
							execute immediate l_sql into l_events;
							if l_events is null then
								-- ran out so exit the loop
								exit;
							end if;
							DBMS_OUTPUT.put_line('item : ' || l_events);
							-- add element to the array, ignore anything that is not these three.
							if instr(l_events,'College Degree Received') > 0
								or instr(l_events,'College Application')   > 0
								or instr(l_events,'FAFSA Application')     > 0 then
								pse_elements.extend;
								pse_elements(i+1) := l_events;
								case 
									when instr(l_events,'College Degree Received') > 0 then l_college_degree_found := i+1;
									when instr(l_events,'College Application')     > 0 then l_college_app_found := i+1;
									when instr(l_events,'FAFSA Application')       > 0 then l_financial_app_found := i+1;
								end case;
							end if;
							l_events := null;
						end loop;	
				end if;
				
				-- add or remove the entered items from the page
				if p_associates_degree_date is not null
					and l_college_degree_found is null then 
					-- degree was added to the student
					pse_elements.extend;
					pse_elements(pse_elements.last) := l_pse_template;
					pse_elements(pse_elements.last) := replace(pse_elements(pse_elements.last),'#CATEGORY#','College Degree Received');
					pse_elements(pse_elements.last) := replace(pse_elements(pse_elements.last),'#EVENTDATE#',to_char(p_associates_degree_date,'YYYY-MM-DD'));
					--DBMS_OUTPUT.put_line('updated College Degree Received : ' || pse_elements(pse_elements.last));
				elsif p_associates_degree_date is null
					and l_college_degree_found > 0 then
					-- the Degree was removed from the student so add resource id to delete collection
					pse_deletes.extend;
					select JSON_VALUE(pse_elements(l_college_degree_found),'$.id' ) 
						into pse_deletes(pse_deletes.LAST)
						from dual;
					-- remove from the add list pse_elements
					pse_elements.DELETE(l_college_degree_found);
				elsif l_college_degree_found > 0 then
					if instr(pse_elements(l_college_degree_found),to_char(p_associates_degree_date,'YYYY-MM-DD')) = 0 then
						-- the date is NOT the same and the entered date
						-- need to delete the old record as this will create a new one if the date is different
						pse_deletes.extend;
						select JSON_VALUE(pse_elements(l_college_degree_found),'$.id' ) 
							into pse_deletes(pse_deletes.LAST)
							from dual;
						-- not an add and not to be deleted then replace it with new date
						pse_elements(l_college_degree_found) := l_pse_template;
						pse_elements(l_college_degree_found) := replace(pse_elements(l_college_degree_found),'#CATEGORY#','College Degree Received');
						pse_elements(l_college_degree_found) := replace(pse_elements(l_college_degree_found),'#EVENTDATE#',to_char(p_associates_degree_date,'YYYY-MM-DD'));
					  DBMS_OUTPUT.put_line('replace College Degree Received : ' || pse_elements(l_college_degree_found));
					else
					  -- if the date is the same then we don't need to do anything but remove it from the list
						DBMS_OUTPUT.put_line('Found College Degree Received : ' || pse_elements(l_college_degree_found));
						pse_elements.DELETE(l_college_degree_found);
					end if;
				end if;
				
				if p_college_app_flag = 'Y'
					and l_college_app_found is null then 
					-- degree was added to the student
					pse_elements.extend;
					pse_elements(pse_elements.last) := l_pse_template;
					pse_elements(pse_elements.last) := replace(pse_elements(pse_elements.last),'#CATEGORY#','College Application');
					pse_elements(pse_elements.last) := replace(pse_elements(pse_elements.last),'#EVENTDATE#',to_char(sysdate,'YYYY-MM-DD'));
					DBMS_OUTPUT.put_line('updated college_app : ' || pse_elements(pse_elements.last));
				elsif p_college_app_flag is null
					and l_college_app_found > 0 then
					-- the college app was removed from the student
					pse_deletes.extend;
					select JSON_VALUE(pse_elements(l_college_app_found),'$.id' ) 
						into pse_deletes(pse_deletes.LAST)
						from dual;
				-- remove from the add list pse_elements
					pse_elements.DELETE(l_college_app_found);
				elsif l_college_app_found > 0 then
					-- not an add and not to be deleted no need to update with new date so remove from add list
					DBMS_OUTPUT.put_line('college app already exists : ' || pse_elements(l_college_app_found));
				  pse_elements.DELETE(l_college_app_found);
				end if;
				
				if p_financial_app_flag = 'Y'
					and l_financial_app_found is null then 
					-- degree was added to the student
					pse_elements.extend;
					pse_elements(pse_elements.last) := l_events;
					pse_elements(pse_elements.last) := l_pse_template;
					pse_elements(pse_elements.last) := replace(pse_elements(pse_elements.last),'#CATEGORY#','FAFSA Application');
					pse_elements(pse_elements.last) := replace(pse_elements(pse_elements.last),'#EVENTDATE#',to_char(sysdate,'YYYY-MM-DD'));
					DBMS_OUTPUT.put_line('updated financial_app : ' || pse_elements(pse_elements.last));
				elsif p_financial_app_flag is null
					and l_financial_app_found > 0 then
					-- the college app was removed from the student
					pse_deletes.extend;
					select JSON_VALUE(pse_elements(l_financial_app_found),'$.id' ) 
						into pse_deletes(pse_deletes.LAST)
						from dual;
					-- remove from the add list pse_elements
					pse_elements.DELETE(l_financial_app_found);
				elsif l_financial_app_found > 0 then
					-- not an add and not to be deleted no need to update with new date so remove from add list
					DBMS_OUTPUT.put_line('financial app already exists : ' || pse_elements(l_financial_app_found));
				  pse_elements.DELETE(l_financial_app_found);
				end if;
			else 
				-- bad response code so raise error
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			
      utl_http.end_response(res);
			utl_http.end_request(req);
			
			-- delete the post secondary events that were removed by the user
			if pse_deletes.COUNT > 0 then
				for x in pse_deletes.first..pse_deletes.last
					loop
						DBMS_OUTPUT.put_line('el to delete : ' || pse_deletes(x));
						--utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
						req  := UTL_HTTP.begin_request(url||'?id='||pse_deletes(x), 'DELETE');
						utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
					 
						res := utl_http.get_response(req);
						dbms_output.put_line(res.status_code);
						
						if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED,utl_http.HTTP_NO_CONTENT) then
							 utl_http.read_text(res, buffer,32767);
							 dbms_output.put_line(buffer);
							 select json_value(buffer, '$.error') into l_error from dual;
							 select json_value(buffer, '$.message') into l_warning from dual;
							 utl_http.end_response(res);
							 utl_http.end_request(req);
							 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
						end if;
						utl_http.end_response(res);
						utl_http.end_request(req);
					end loop;
			end if;
			
      -- Add the post secondary events to the ODS
			if pse_elements.COUNT > 0 then
				for x in pse_elements.first..pse_elements.last
					loop
						--DBMS_OUTPUT.put_line('x= ' || x);
						if pse_elements.EXISTS(x) = false then
							continue;
						end if;
						
						DBMS_OUTPUT.put_line('el to add : ' || pse_elements(x));
						-- remove the resource id, this will cause an error if included
						pse_elements(x) := REGEXP_REPLACE(pse_elements(x), '"id".*?,','',1,0,'i');
						--utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
						req  := UTL_HTTP.begin_request(url, 'POST');
						utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
						utl_http.set_header(req, 'Content-Type', 'application/json');
						utl_http.set_header(req, 'Content-Length', length(pse_elements(x)));
						utl_http.write_text(req, pse_elements(x));
					 
						res := utl_http.get_response(req);
						dbms_output.put_line(res.status_code);
						
						if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
							 utl_http.read_text(res, buffer,32767);
							 dbms_output.put_line(buffer);
							 select json_value(buffer, '$.error') into l_error from dual;
							 select json_value(buffer, '$.message') into l_warning from dual;
							 utl_http.end_response(res);
							 utl_http.end_request(req);
							 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
						end if;
						utl_http.end_response(res);
						utl_http.end_request(req);
					end loop;
			end if;	
			
		END PROC_PUT_POST_SEC_EVENTS_35;
--
-- THis procedure UPDATES student academic recordS FOR INDUSTRY CERTIFICATIONS for ed-fi 3.5
-- you must pull the student academic record back and add to the JSON the new values
  procedure PROC_PUT_STU_IND_CERTS_35 
		      (p_student_unique_id      in varchar2,
					 p_district_id            in varchar2,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2,
					 p_school_year            in varchar2,
					 p_term                   in varchar2,
					 p_achievement_title      in varchar2,
					 p_old_achievement_title  in varchar2   default null,
					 p_transaction_type       in varchar2) -- ADD,UPDATE, OR DELETE
  is
    req                   utl_http.req;
		res                   utl_http.resp;
		url                   varchar2(4000) := c_api_base||c_api_data||p_database_number||'/studentAcademicRecords';
		buffer                varchar2(32767);
		l_json_doc            VARCHAR2(32767);
		l_academic_honors     VARCHAR2(32767);
    l_new_academic_honors VARCHAR2(32767);
		l_title               int;
    l_end_position        int;
    l_start_position      int;
    l_error               varchar2(200);
		l_warning             varchar2(200);
		e_http_error          exception;
		PRAGMA EXCEPTION_INIT (e_http_error, -20009);
		
		l_sar_template        varchar2(32767) := ' {
        "educationOrganizationReference": {
            "educationOrganizationId": #DISTRICT_ID#
        },
        "schoolYearTypeReference": {
            "schoolYear": #SCHOOL_YEAR#
        },
        "studentReference": {
            "studentUniqueId": "#STUDENT_UNIQUE_ID#"
        },
        "termDescriptor": "uri://ed-fi.org/TermDescriptor#'||p_term||'",
        "academicHonors": [],
        "diplomas": [],
        "recognitions": [],
        "reportCards": []
    }';
		
		begin
			-- set the url
			PROC_SET_API_URL(P_DB_NUMBER => p_database_number);
			url := c_api_base||c_api_data||'studentAcademicRecords';
			
			-- get the student record via the api and the student unique id
			req  := UTL_HTTP.begin_request(url||'?studentUniqueId='||p_student_unique_id||'&schoolYear='||p_school_year||'&termDescriptor=uri://ed-fi.org/TermDescriptor%23'||APEX_UTIL.URL_ENCODE(p_term), 'GET');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
		  -- submit request
			res := utl_http.get_response(req);
			
			if res.status_code = utl_http.HTTP_OK then
				-- get the response from the rest call
				utl_http.read_text(res, l_json_doc,32767);
				DBMS_OUTPUT.put_line('JSON before : ' || l_json_doc);
				
				if l_json_doc = '[]' then
					-- stu academic rec was not found, use template to create a new one
					l_json_doc := replace(l_sar_template,'#DISTRICT_ID#',to_number(p_district_id));
					l_json_doc := replace(l_json_doc,'#SCHOOL_YEAR#',p_school_year);
					l_json_doc := replace(l_json_doc,'#STUDENT_UNIQUE_ID#',p_student_unique_id);
				end if;
				APEX_DEBUG.message('>>>>>>>>>> template: '||l_json_doc);
				-- PULL ACADEMIC HONORS from response
				select JSON_QUERY(l_json_doc, '$.academicHonors')
					into l_academic_honors
					from dual;
				DBMS_OUTPUT.put_line('certs : ' || l_academic_honors);	
				-- prime l_new_characteristics
				l_new_academic_honors := l_academic_honors;
				
				if p_transaction_type = 'ADD' then 
					-- cert was added to the student
					DBMS_OUTPUT.put_line('add found : ' || p_achievement_title);
					if l_new_academic_honors = '[]' then
						l_new_academic_honors := '[ { "academicHonorCategoryDescriptor": "uri://ed-fi.org/AcademicHonorCategoryDescriptor#Certificate","achievementCategoryDescriptor":"uri://ed-fi.org/AchievementCategoryDescriptor#Certificate Earned","achievementTitle": "'||p_achievement_title||'","honorDescription": "'||p_achievement_title||'" } ]';
					else
						l_new_academic_honors := replace(l_new_academic_honors,']',',{ "academicHonorCategoryDescriptor": "uri://ed-fi.org/AcademicHonorCategoryDescriptor#Certificate","achievementCategoryDescriptor":"uri://ed-fi.org/AchievementCategoryDescriptor#Certificate Earned","achievementTitle": "'||p_achievement_title||'","honorDescription": "'||p_achievement_title||'" }]');
					end if;
					DBMS_OUTPUT.put_line('add inserted : ' || l_new_academic_honors);
				end if;
				
				if p_transaction_type = 'UPDATE' then 
					-- they can only upate the title so replace the title of the first occurence of the old title
					l_new_academic_honors := REGEXP_REPLACE(l_new_academic_honors,'"achievementTitle":"'||p_old_achievement_title||'"','"achievementTitle":"'||p_achievement_title||'"',1,1,'in');
          l_new_academic_honors := REGEXP_REPLACE(l_new_academic_honors,'"honorDescription":"'||p_old_achievement_title||'"','"honorDescription":"'||p_achievement_title||'"',1,1,'in');
				end if;
				
				if p_transaction_type = 'DELETE' then 
					-- REMOVE THE ENTRY TO BE DELETED
					l_title := instr(l_new_academic_honors,p_achievement_title,1,1);
					l_end_position := instr(l_new_academic_honors,'}',l_title,1);
					for i in REVERSE 1..l_title-1
						loop
							if substr(l_new_academic_honors,i,1) = '{' then
								if substr(l_new_academic_honors,i-1,1) = ',' then
									l_start_position := i-1;
								elsif substr(l_new_academic_honors,i-1,1) = '[' 
									and substr(l_new_academic_honors,l_end_position+1,1) = ',' then
									l_end_position := l_end_position + 1;
									l_start_position := i;
								else
									l_start_position := i;
								end if;
								exit;
							end if;
						end loop;	
					l_new_academic_honors :=  replace(l_new_academic_honors,substr(l_new_academic_honors,l_start_position,l_end_position-l_start_position+1),'');
				  dbms_output.put_line('After Delete: '||l_new_academic_honors);
				end if;
				
				-- add to jason doc
				l_json_doc := REGEXP_REPLACE(l_json_doc, '"academicHonors":.*?]', '"academicHonors": '||l_new_academic_honors,1,1,'in');
			  DBMS_OUTPUT.put_line('After : ' || l_json_doc);
			else 
				-- bad response code so raise error
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			
      utl_http.end_response(res);
			utl_http.end_request(req);
			
			-- update the student academic record
			-- remove the resource id ("id") from the response.
			l_json_doc := REGEXP_REPLACE(l_json_doc, '"id":.*','',1,1,'i');
			-- remove the [] as the post is for a single studentAcademicRecord
	    l_json_doc := regexp_replace(l_json_doc,'^\[','',1,1,'i');
			l_json_doc := regexp_replace(l_json_doc,'\]$','',1,1,'i');
	    DBMS_OUTPUT.put_line('before submit : ' || l_json_doc);  
			-- add/Update the student data in the ODS
			--utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
			req  := UTL_HTTP.begin_request(url, 'POST');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
			utl_http.set_header(req, 'Content-Type', 'application/json');
			utl_http.set_header(req, 'Content-Length', length(l_json_doc));
			utl_http.write_text(req, l_json_doc);

			res := utl_http.get_response(req);
			dbms_output.put_line(res.status_code);
			
			if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
				 utl_http.read_text(res, buffer,32767);
				 dbms_output.put_line(buffer);
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			utl_http.end_response(res);
			utl_http.end_request(req);
		END PROC_PUT_STU_IND_CERTS_35;
--
-- THis procedure UPDATES student academic recordS FOR Level 1 and 2 CERTIFICATIONS for ed-fi 3.5
-- you must pull the student academic record back and add to the JSON the new values
  procedure PROC_PUT_STU_LVL12_CERTS_35 
		      (p_student_unique_id      in varchar2,
					 p_district_id            in varchar2,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2,
					 p_school_year            in varchar2,
					 p_term                   in varchar2,
					 p_achievement_title      in varchar2,
					 p_old_achievement_title  in varchar2   default null,
					 P_CRITERIA               in varchar2,
					 P_AWARD_DATE             in date,
					 p_transaction_type       in varchar2) -- ADD,UPDATE, OR DELETE
  is
    req                   utl_http.req;
		res                   utl_http.resp;
		url                   varchar2(4000) := c_api_base||c_api_data||p_database_number||'/studentAcademicRecords';
		buffer                varchar2(32767);
		l_json_doc            VARCHAR2(32767);
		l_recognitions        VARCHAR2(32767);
    l_new_recognitions    VARCHAR2(32767);
		l_title               int;
    l_end_position        int;
    l_start_position      int;
    l_error               varchar2(200);
		l_warning             varchar2(200);
		e_http_error          exception;
		PRAGMA EXCEPTION_INIT (e_http_error, -20009);
		
		l_sar_template        varchar2(32767) := ' {
        "educationOrganizationReference": {
            "educationOrganizationId": #DISTRICT_ID#
        },
        "schoolYearTypeReference": {
            "schoolYear": #SCHOOL_YEAR#
        },
        "studentReference": {
            "studentUniqueId": "#STUDENT_UNIQUE_ID#"
        },
        "termDescriptor": "uri://ed-fi.org/TermDescriptor#'||p_term||'",
        "academicHonors": [],
        "diplomas": [],
        "recognitions": [],
        "reportCards": []
    }';
		
		begin
			-- set the url
			PROC_SET_API_URL(P_DB_NUMBER => p_database_number);
			url := c_api_base||c_api_data||'studentAcademicRecords';
			
			-- get the student record via the api and the student unique id
			req  := UTL_HTTP.begin_request(url||'?studentUniqueId='||p_student_unique_id||'&schoolYear='||p_school_year||'&termDescriptor=uri://ed-fi.org/TermDescriptor%23'||APEX_UTIL.URL_ENCODE(p_term), 'GET');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
		  -- submit request
			res := utl_http.get_response(req);
			
			if res.status_code = utl_http.HTTP_OK then
				-- get the response from the rest call
				utl_http.read_text(res, l_json_doc,32767);
				DBMS_OUTPUT.put_line('JSON before : ' || l_json_doc);
				
				if l_json_doc = '[]' then
					-- stu academic rec was not found, use template to create a new one
					l_json_doc := replace(l_sar_template,'#DISTRICT_ID#',to_number(p_district_id));
					l_json_doc := replace(l_json_doc,'#SCHOOL_YEAR#',p_school_year);
					l_json_doc := replace(l_json_doc,'#STUDENT_UNIQUE_ID#',p_student_unique_id);
				end if;
				
				-- PULL RECOGNITIONS from response
				select JSON_QUERY(l_json_doc, '$.recognitions')
					into l_recognitions
					from dual;
				DBMS_OUTPUT.put_line('certs : ' || l_recognitions);	
				-- prime l_new_characteristics
				l_new_recognitions := l_recognitions;
				
				if p_transaction_type = 'ADD' then 
					-- cert was added to the student
					-- you can't have more than one cert per term on an ADD just replace what was there
					l_new_recognitions := '[ { "recognitionTypeDescriptor": "uri://ed-fi.org/RecognitionTypeDescriptor#Certificate","criteria": "'||P_CRITERIA||'","achievementTitle": "'||p_achievement_title||'","recognitionAwardDate": "'||to_char(P_AWARD_DATE,'YYYY-MM-DD')||'" } ]';
					DBMS_OUTPUT.put_line('add found : ' || p_achievement_title);
					/*if l_new_recognitions = '[]' then
						l_new_recognitions := '[ { "recognitionTypeDescriptor": "uri://ed-fi.org/RecognitionTypeDescriptor#Certificate","criteria": "'||P_CRITERIA||'","achievementTitle": "'||p_achievement_title||'","recognitionAwardDate": "'||to_char(P_AWARD_DATE,'YYYY-MM-DD')||'" } ]';
					else
						l_new_recognitions := replace(l_new_recognitions,']',',{ "recognitionTypeDescriptor": "uri://ed-fi.org/RecognitionTypeDescriptor#Certificate","criteria": "'||P_CRITERIA||'","achievementTitle": "'||p_achievement_title||'","recognitionAwardDate": "'||to_char(P_AWARD_DATE,'YYYY-MM-DD')||'" } ]');
					end if;*/
					DBMS_OUTPUT.put_line('add inserted : ' || l_new_recognitions);
				end if;
				
				if p_transaction_type = 'UPDATE' then 
					-- replace the title of the first occurence of the old title
					l_new_recognitions := REGEXP_REPLACE(l_new_recognitions,'"achievementTitle":".*?"','"achievementTitle":"'||p_achievement_title||'"',1,1,'in');
				  l_new_recognitions := REGEXP_REPLACE(l_new_recognitions,'"recognitionAwardDate":".*?"','"recognitionAwardDate":"'||to_char(P_AWARD_DATE,'YYYY-MM-DD')||'"',1,1,'in');
				  l_new_recognitions := REGEXP_REPLACE(l_new_recognitions,'"criteria":".*?"','"criteria":"'||P_CRITERIA||'"',1,1,'in');
				end if;
				
				if p_transaction_type = 'DELETE' then 
					-- REMOVE THE ENTRY TO BE DELETED
					l_title := instr(l_new_recognitions,p_achievement_title,1,1);
					l_end_position := instr(l_new_recognitions,'}',l_title,1);
					for i in REVERSE 1..l_title-1
						loop
							if substr(l_new_recognitions,i,1) = '{' then
								if substr(l_new_recognitions,i-1,1) = ',' then
									l_start_position := i-1;
								elsif substr(l_new_recognitions,i-1,1) = '[' 
									and substr(l_new_recognitions,l_end_position+1,1) = ',' then
									l_end_position := l_end_position + 1;
									l_start_position := i;
								else
									l_start_position := i;
								end if;
								exit;
							end if;
						end loop;	
					l_new_recognitions :=  replace(l_new_recognitions,substr(l_new_recognitions,l_start_position,l_end_position-l_start_position+1),'');
				  dbms_output.put_line('After Delete: '||l_new_recognitions);
				end if;
				
				-- add to jason doc
				l_json_doc := REGEXP_REPLACE(l_json_doc, '"recognitions":.*?]', '"recognitions": '||l_new_recognitions,1,1,'in');
			  DBMS_OUTPUT.put_line('After : ' || l_json_doc);
			else 
				-- bad response code so raise error
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			
      utl_http.end_response(res);
			utl_http.end_request(req);
			
			-- update the student academic record
			-- remove the resource id ("id") from the response.
			l_json_doc := REGEXP_REPLACE(l_json_doc, '"id":.*','',1,1,'i');
			-- remove the [] as the post is for a single studentAcademicRecord
	    l_json_doc := regexp_replace(l_json_doc,'^\[','',1,1,'i');
			l_json_doc := regexp_replace(l_json_doc,'\]$','',1,1,'i');
	    DBMS_OUTPUT.put_line('before submit : ' || l_json_doc);  
			-- add/Update the student data in the ODS
			--utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
			req  := UTL_HTTP.begin_request(url, 'POST');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
			utl_http.set_header(req, 'Content-Type', 'application/json');
			utl_http.set_header(req, 'Content-Length', length(l_json_doc));
			utl_http.write_text(req, l_json_doc);

			res := utl_http.get_response(req);
			dbms_output.put_line(res.status_code);
			
			if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
				 utl_http.read_text(res, buffer,32767);
				 dbms_output.put_line(buffer);
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			utl_http.end_response(res);
			utl_http.end_request(req);
		END PROC_PUT_STU_LVL12_CERTS_35;
		
--
-- THis procedure UPDATES COURSES TO ADD OR REMOVE THE DUAL CREDITS COURSE LEVEL CHARACTERISTIC for ed-fi 3.5
-- you must pull the COURSE record back and add to the JSON the new values
  procedure PROC_PUT_CRS_DUAL_CR_35 
		      (p_course_code            in varchar2,
					 p_database_number        in varchar2,
					 p_auth_token             in varchar2,
					 p_transaction_type       in varchar2) -- ADD OR DELETE
  is
    req                   utl_http.req;
		res                   utl_http.resp;
		url                   varchar2(4000);
		buffer                varchar2(32767);
		l_json_doc            VARCHAR2(32767);
		l_characteristics     VARCHAR2(32767);
    l_new_characteristics VARCHAR2(32767);
		l_skip_processing     boolean := false;
		l_title               int;
    l_end_position        int;
    l_start_position      int;
    l_error               varchar2(200);
		l_warning             varchar2(200);
		e_http_error          exception;
		PRAGMA EXCEPTION_INIT (e_http_error, -20009);
		
		begin
			-- set the url
			PROC_SET_API_URL(P_DB_NUMBER => p_database_number);
			url := c_api_base||c_api_data||'courses';
			
			-- get the COURSE via the api and the COURSE CODE
			req  := UTL_HTTP.begin_request(url||'?courseCode='||APEX_UTIL.URL_ENCODE(p_course_code), 'GET');
			utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
		  -- submit request
			res := utl_http.get_response(req);
			
			if res.status_code = utl_http.HTTP_OK then
				-- get the response from the rest call
				utl_http.read_text(res, l_json_doc,32767);
				DBMS_OUTPUT.put_line('JSON before : ' || l_json_doc);
				
				if l_json_doc = '[]' then
					-- course rec was not found
					utl_http.end_response(res);
					utl_http.end_request(req);
				  raise_application_error(-20009,'Course was not found');
				end if;
				
				-- PULL level characteristics from response
				select JSON_QUERY(l_json_doc, '$.levelCharacteristics')
					into l_characteristics
					from dual;
				DBMS_OUTPUT.put_line('chars : ' || l_characteristics);	
				-- prime l_new_characteristics
				l_new_characteristics := l_characteristics;
				
				if p_transaction_type = 'ADD' 
					 and instr(l_json_doc,'Dual Credit',1) = 0 then 
					-- DUAL CRs was added to the COURSE
					DBMS_OUTPUT.put_line('add found : ' || p_course_code);
					if l_new_characteristics = '[]' then
						l_new_characteristics := '[ { "courseLevelCharacteristicDescriptor": "uri://ed-fi.org/CourseLevelCharacteristicDescriptor#Dual Credit" } ]';
					else
						l_new_characteristics := replace(l_new_characteristics,']',',{ "courseLevelCharacteristicDescriptor": "uri://ed-fi.org/CourseLevelCharacteristicDescriptor#Dual Credit" } ]');
					end if;
					DBMS_OUTPUT.put_line('add inserted : ' || l_new_characteristics);
				elsif p_transaction_type = 'ADD' 
					 and instr(l_json_doc,'Dual Credit',1) > 0 then
					 -- ADD was requested but it already exist so do nothing
					 l_skip_processing := true;
				end if;
				
				if p_transaction_type = 'DELETE' 
					 and instr(l_json_doc,'Dual Credit',1) > 0 then 
					-- REMOVE THE ENTRY TO BE DELETED
					l_title := instr(l_new_characteristics,'Dual Credit',1,1);
					l_end_position := instr(l_new_characteristics,'}',l_title,1);
					for i in REVERSE 1..l_title-1
						loop
							if substr(l_new_characteristics,i,1) = '{' then
								if substr(l_new_characteristics,i-1,1) = ',' then
									l_start_position := i-1;
								elsif substr(l_new_characteristics,i-1,1) = '[' 
									and substr(l_new_characteristics,l_end_position+1,1) = ',' then
									l_end_position := l_end_position + 1;
									l_start_position := i;
								else
									l_start_position := i;
								end if;
								exit;
							end if;
						end loop;	
					l_new_characteristics :=  replace(l_new_characteristics,substr(l_new_characteristics,l_start_position,l_end_position-l_start_position+1),'');
				  dbms_output.put_line('After Delete: '||l_new_characteristics);
				elsif p_transaction_type = 'DELETE' 
					 and instr(l_json_doc,'Dual Credit',1) = 0 then
					 -- delete was requested but it is not found so do nothing
					 l_skip_processing := true;
				end if;
				
				-- add to jason doc
				l_json_doc := REGEXP_REPLACE(l_json_doc, '"levelCharacteristics":.*?]', '"levelCharacteristics": '||l_new_characteristics,1,1,'in');
			  DBMS_OUTPUT.put_line('After : ' || l_json_doc);
			else 
				-- bad response code so raise error
				 select json_value(buffer, '$.error') into l_error from dual;
				 select json_value(buffer, '$.message') into l_warning from dual;
				 utl_http.end_response(res);
				 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
			end if;
			
      utl_http.end_response(res);
			utl_http.end_request(req);
			
			if not l_skip_processing then 
				-- update the COURSE record
				-- remove the resource id ("id") from the response.
				l_json_doc := REGEXP_REPLACE(l_json_doc, '"id":.*','',1,1,'i');
				-- remove the [] as the post is for a single COURSE
				l_json_doc := regexp_replace(l_json_doc,'^\[','',1,1,'i');
				l_json_doc := regexp_replace(l_json_doc,'\]$','',1,1,'i');
				DBMS_OUTPUT.put_line('before submit : ' || l_json_doc);  
				-- add/Update the COURSE data in the ODS
				--utl_http.set_wallet('file:/u01/app/oracle/12.1/db_1/wallet', 'Spock1234');
				req  := UTL_HTTP.begin_request(url, 'POST');
				utl_http.set_header(req, 'Authorization', 'Bearer '||p_auth_token);
				utl_http.set_header(req, 'Content-Type', 'application/json');
				utl_http.set_header(req, 'Content-Length', length(l_json_doc));
				utl_http.write_text(req, l_json_doc);

				res := utl_http.get_response(req);
				dbms_output.put_line(res.status_code);
				
				if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
					 utl_http.read_text(res, buffer,32767);
					 dbms_output.put_line(buffer);
					 select json_value(buffer, '$.error') into l_error from dual;
					 select json_value(buffer, '$.message') into l_warning from dual;
					 utl_http.end_response(res);
					 raise_application_error(-20009,'http status: '||res.status_code||': '||l_error||' '||l_warning);
				end if;
				utl_http.end_response(res);
				utl_http.end_request(req);
			end if;
		END PROC_PUT_CRS_DUAL_CR_35;
--------------------------------------------------------------
-- insert procedure for table EDFI_STUDENT_DATA
   procedure PROC_EDFI_STUDENT_DATA (
      P_DISTRICT_ID            in varchar2,
      P_DISTRICT_ODS_NUMBER    in varchar2                        default null,
      P_STUDENT_UNIQUE_ID      in varchar2,
      P_ASVAB_DATE             in date                            default null,
      P_MILITARY_DATE          in date                            default null,
      P_MENINGITIS_DATE        in date                            default null,
      P_ASSOCIATES_DEGREE_DATE in date                            default null,
      P_COLLEGE_APP_FLAG       in varchar2                        default null,
      P_FINANCIAL_APP_FLAG     in varchar2                        default null,
      P_SOURCE                 in varchar2                        default null
   ) is 
   l_found char;
   begin
		 
      -- CHECK TO SEE IF A RECORD ALREADY EXISTS
			select 'Y'
			  into l_found
			  from edfi_student_data
			 where district_id = P_DISTRICT_ID
			   and student_unique_id = P_STUDENT_UNIQUE_ID;
			
			if 	  P_ASVAB_DATE is null
        and P_MILITARY_DATE is null
        and P_MENINGITIS_DATE is null
        and P_ASSOCIATES_DEGREE_DATE is null
        and P_COLLEGE_APP_FLAG is null
        and P_FINANCIAL_APP_FLAG is null then
			  -- delete the row because there is no data in it.
				delete from edfi_student_data
				 where district_id = P_DISTRICT_ID
			     and student_unique_id = P_STUDENT_UNIQUE_ID;
			else
				--record exists SO update with new values
				update EDFI_STUDENT_DATA set
							ASVAB_DATE               = P_ASVAB_DATE,
							MILITARY_DATE            = P_MILITARY_DATE,
							MENINGITIS_DATE          = P_MENINGITIS_DATE,
							ASSOCIATES_DEGREE_DATE   = P_ASSOCIATES_DEGREE_DATE,
							COLLEGE_APP_FLAG         = P_COLLEGE_APP_FLAG,
							FINANCIAL_APP_FLAG       = P_FINANCIAL_APP_FLAG,
							SOURCE                   = P_SOURCE,
							LAST_UPDATE_DATE         = sysdate
					 where DISTRICT_ID = P_DISTRICT_ID and STUDENT_UNIQUE_ID = P_STUDENT_UNIQUE_ID;
			end if;
	  exception
		 when no_data_found then
			-- NO RECORD SO INSERT
      insert into EDFI_STUDENT_DATA (
         DISTRICT_ID,
         DISTRICT_ODS_NUMBER,
         STUDENT_UNIQUE_ID,
         ASVAB_DATE,
         MILITARY_DATE,
         MENINGITIS_DATE,
         ASSOCIATES_DEGREE_DATE,
         COLLEGE_APP_FLAG,
         FINANCIAL_APP_FLAG,
         source
      ) values ( 
         P_DISTRICT_ID,
         P_DISTRICT_ODS_NUMBER,
         P_STUDENT_UNIQUE_ID,
         P_ASVAB_DATE,
         P_MILITARY_DATE,
         P_MENINGITIS_DATE,
         P_ASSOCIATES_DEGREE_DATE,
         P_COLLEGE_APP_FLAG,
         P_FINANCIAL_APP_FLAG,
         P_SOURCE
      );
 
   end PROC_EDFI_STUDENT_DATA;
--------------------------------------------------------------
-- create procedure for table EDFI_STUDENT_CERTS
   procedure PROC_EDFI_STUDENT_CERTS (
      P_DISTRICT_ID         in varchar2,
      P_DISTRICT_ODS_NUMBER in varchar2                        default null,
      P_STUDENT_UNIQUE_ID   in varchar2,
      P_SCHOOL_YEAR         in varchar2,
      P_TERM                in varchar2,
      P_ACHIEVEMENT_TITLE   in varchar2,
			P_OLD_ACHIEVEMENT_TITLE in varchar2,
      P_CRITERIA            in varchar2                        default null,
      P_AWARD_DATE          in date                            default null,
      P_CERT_TYPE           in varchar2                        default null
   ) is 
   l_found char;
   begin
		 apex_debug.message('>>>>>>>>>>>>>>>>>');
		 apex_debug.message('district id='||P_DISTRICT_ID);
		 apex_debug.message('stu id='||P_STUDENT_UNIQUE_ID);
		 apex_debug.message('term='||P_TERM);
		 apex_debug.message('title='||P_ACHIEVEMENT_TITLE);
		 apex_debug.message('old title='||P_OLD_ACHIEVEMENT_TITLE);
      -- CHECK TO SEE IF A RECORD ALREADY EXISTS
			select 'Y'
			  into l_found
			  from edfi_student_certs
			 where district_id = P_DISTRICT_ID
			   and student_unique_id = P_STUDENT_UNIQUE_ID
				 and school_year = P_SCHOOL_YEAR
				 and term = P_TERM
				 and achievement_title = P_OLD_ACHIEVEMENT_TITLE;
			-- found a record so update
			update EDFI_STUDENT_CERTS set
            ACHIEVEMENT_TITLE     = P_ACHIEVEMENT_TITLE,
            CRITERIA              = P_CRITERIA,
            AWARD_DATE            = P_AWARD_DATE,
            CERT_TYPE             = P_CERT_TYPE
         where DISTRICT_ID = P_DISTRICT_ID 
				   and STUDENT_UNIQUE_ID = P_STUDENT_UNIQUE_ID 
					 and SCHOOL_YEAR = P_SCHOOL_YEAR 
					 and TERM = P_TERM 
					 and ACHIEVEMENT_TITLE = P_OLD_ACHIEVEMENT_TITLE;
   exception
		 when no_data_found then
			--record exists SO update with new values
      insert into EDFI_STUDENT_CERTS (
         DISTRICT_ID,
         DISTRICT_ODS_NUMBER,
         STUDENT_UNIQUE_ID,
         SCHOOL_YEAR,
         TERM,
         ACHIEVEMENT_TITLE,
         CRITERIA,
         AWARD_DATE,
         CERT_TYPE
      ) values ( 
         P_DISTRICT_ID,
         P_DISTRICT_ODS_NUMBER,
         P_STUDENT_UNIQUE_ID,
         P_SCHOOL_YEAR,
         P_TERM,
         P_ACHIEVEMENT_TITLE,
         P_CRITERIA,
         P_AWARD_DATE,
         P_CERT_TYPE
      );
 
   end PROC_EDFI_STUDENT_CERTS;
--------------------------------------------------------------
-- delete procedure for table EDFI_STUDENT_CERTS
	 procedure PROC_DEL_EDFI_STUDENT_CERTS(
		  p_district_id       in varchar2
		 ,p_student_unique_id in varchar2
		 ,p_school_year       in varchar2
		 ,p_term              in varchar2
		 ,p_achievement_title in varchar2) is
	 
	 begin
	 
		 delete from edfi_student_certs
			where district_id = p_district_id
				and student_unique_id = p_student_unique_id
				and school_year = p_school_year
				and term = p_term
				and achievement_title = p_achievement_title;
	 
	 end PROC_DEL_EDFI_STUDENT_CERTS;
--------------------------------------------------------------
-- create procedure for table EDFI_COURSE_DUAL_CR
   procedure PROC_EDFI_COURSE_DUAL_CR (
      P_DISTRICT_ID         in varchar2,
      P_DISTRICT_ODS_NUMBER in varchar2                        default null,
      P_COURSE_CODE         in varchar2
   ) is 
 
   l_found char;
   begin
      -- CHECK TO SEE IF A RECORD ALREADY EXISTS
			select 'Y'
			  into l_found
			  from edfi_course_dual_cr
			 where district_id = P_DISTRICT_ID
			   and course_code = P_COURSE_CODE;
			-- found a record so do nothing
   exception
		 when no_data_found then
      insert into EDFI_COURSE_DUAL_CR (
         DISTRICT_ID,
         DISTRICT_ODS_NUMBER,
         COURSE_CODE,
         CREATE_DATE
      ) values ( 
         P_DISTRICT_ID,
         P_DISTRICT_ODS_NUMBER,
         P_COURSE_CODE,
         sysdate
      );
 
   end PROC_EDFI_COURSE_DUAL_CR;
--------------------------------------------------------------
-- delete procedure for table EDFI_COURSE_DUAL_CR
   procedure PROC_DEL_EDFI_COURSE_DUAL_CR (
      P_DISTRICT_ID in varchar2,
			P_COURSE_CODE in varchar2
   ) is 
 
   begin
 
      delete from EDFI_COURSE_DUAL_CR 
      where DISTRICT_ID = P_DISTRICT_ID and COURSE_CODE = P_COURSE_CODE;
 
   end PROC_DEL_EDFI_COURSE_DUAL_CR;
--------------------------------------------------------------
-- Refresh the ODS's with the data in oracle if it is not the same
--------------------------------------------------------------
   procedure PROC_REFRESH_ODS_UPDATES 
			is 
   l_update_stu_attrs     boolean := false;
	 l_update_stu_ps_events boolean := false;
	 l_rows_found           boolean := true;
	 l_token                varchar2(200);
	 l_ASVAB_dt             date;
   l_military_enlist_date date;
   l_meningitis_date      date;
	 l_college_app_flag     char;  
   l_fafsa_app_flag       char;
   l_college_degree_dt    date;
	 l_found                char;
	 l_current_stu_id       varchar2(50);
   begin
		  -- apex session to cache the ods data
			apex_session.create_session (
					p_app_id   => 130,
					p_page_id  => 2000,
					p_username => 'EDFI' );
			DBMS_OUTPUT.put_line('SESSION= '||nv('APP_SESSION'));
      -- loop thru active districts 
			for district in (select district_cdc,
															 district_name,
															 district_db_number,
															 api_key,
															 api_secret,
															 edfi_version,
															 school_year,
															 db.DB_LINK
													from districts 
													left join district_db_link db on db.DISTRICT_ID = districts.DISTRICT_CDC
																												and db.TARGET_DB = 'ODS'
												 where 	active = 'Y'
												 and (exists (select edfi_student_certs.DISTRICT_ID
												                            from edfi_student_certs
																										where edfi_student_certs.DISTRICT_ID = districts.DISTRICT_CDC )
												 or exists (select edfi_student_data.DISTRICT_ID
												                            from edfi_student_data
																										where edfi_student_data.DISTRICT_ID = districts.DISTRICT_CDC )))
			  loop
					-- get a token for this district
					if DISTRICT.EDFI_VERSION = '2.5' then
						l_token := FN_GET_AUTH_TOKEN_25(P_DB_NUMBER => district.DISTRICT_DB_NUMBER);
					else
						l_token := FN_GET_AUTH_TOKEN_35(P_DB_NUMBER => district.DISTRICT_DB_NUMBER);
					end if;
					-------------------------------------
					-- Student Attributes/characteristics
					-------------------------------------
					l_rows_found := false;
					-- get stu chars from oracle
					for stu_attr in (select district_id
																, student_unique_id
																, asvab_date
																, military_date
																, meningitis_date
																, associates_degree_date
																, college_app_flag
																, financial_app_flag
					                   from edfi_student_data
														 where district_id =  district.DISTRICT_CDC
														   and student_unique_id is not null
															 and student_unique_id != '0')
					  loop
							-- make sure student is in ODS, if not continue to next rec in loop
							continue when not PKG_UPDATE_STUDENT_ATTRIBUTES.FN_CHECK_STU_IN_ODS(p_student_unique_id => stu_attr.STUDENT_UNIQUE_ID,
                                                                                  p_district_id => stu_attr.DISTRICT_ID);
							-- pull ODS values for stu attrs
							--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
							PROC_GET_STU_CHARACTERISTICS(P_STUDENT_UNIQUE_ID => stu_attr.STUDENT_UNIQUE_ID,
																		 P_DISTRICT_ID       => stu_attr.DISTRICT_ID,
																		 p_ASVAB_date        => l_ASVAB_dt,
																		 p_Military_date     => l_military_enlist_date,
																		 p_Meningitis_date   => l_meningitis_date);
									
								if l_ASVAB_dt is not null
									or l_military_enlist_date is not null
									or l_meningitis_date  is not null then
									l_rows_found := true;
								end if;

								-- compare oracle values to ODS values to see if attrs changed
								if not l_rows_found
									and (stu_attr.ASVAB_DATE is not null
									or stu_attr.MILITARY_DATE is not null
									or stu_attr.MENINGITIS_DATE is not null) then
									l_update_stu_attrs := true;
								end if;
									
								if l_rows_found
									and (l_ASVAB_dt != stu_attr.ASVAB_DATE
									or l_military_enlist_date != stu_attr.MILITARY_DATE
									or l_meningitis_date != stu_attr.MENINGITIS_DATE) then
									l_update_stu_attrs := true;
								end if;
								
								if l_update_stu_attrs then
									-- update the stu_attrs
									if district.EDFI_VERSION = '2.5' then
									  PROC_PUT_STU_CHAR_25(p_student_unique_id => stu_attr.STUDENT_UNIQUE_ID,
                                p_ASVAB_date        => stu_attr.ASVAB_DATE,
                                p_Military_date     => stu_attr.MILITARY_DATE,
                                p_Meningitis_date   => stu_attr.MENINGITIS_DATE,
                                p_database_number   => district.DISTRICT_DB_NUMBER,
                                p_auth_token        => l_token);
									else
										PROC_PUT_STU_CHAR_35(p_student_unique_id => stu_attr.STUDENT_UNIQUE_ID,
                               p_ASVAB_date        => stu_attr.ASVAB_DATE,
                               p_Military_date     => stu_attr.MILITARY_DATE,
                               p_Meningitis_date   => stu_attr.MENINGITIS_DATE,
                               p_database_number   => district.DISTRICT_DB_NUMBER,
                               p_auth_token        => l_token);
									end if;
								  l_update_stu_attrs := false;
								end if;
								
							----------------------------------------------------------
							-- process post secondary events
							----------------------------------------------------------
							l_rows_found := false;
							
							PROC_GET_POST_SEC_EVENTS(P_STUDENT_UNIQUE_ID      => stu_attr.STUDENT_UNIQUE_ID,
															P_DISTRICT_ID            => stu_attr.DISTRICT_ID,
															P_ODS_NUMBER             => district.DISTRICT_DB_NUMBER,
															p_associates_degree_date => l_college_degree_dt,
															p_college_app_flag       => l_college_app_flag,
															p_financial_app_flag     => l_fafsa_app_flag);
									
							if l_college_app_flag        = 'Y'
									or l_fafsa_app_flag      = 'Y'
									or l_college_degree_dt   is not null then
									l_rows_found := true;
							end if;
							---------- now to compare what's in ods vs oracle
							if not l_rows_found
								and (stu_attr.COLLEGE_APP_FLAG = 'Y'
								or stu_attr.FINANCIAL_APP_FLAG = 'Y'
								or stu_attr.ASSOCIATES_DEGREE_DATE is not null) then
								l_update_stu_ps_events := true;
							end if;
									
							if l_rows_found
								and (l_college_app_flag != stu_attr.COLLEGE_APP_FLAG
								or nvl(l_college_degree_dt,to_date('99991231','YYYYMMDD')) != nvl(stu_attr.ASSOCIATES_DEGREE_DATE,to_date('99991231','YYYYMMDD'))
								or l_fafsa_app_flag != stu_attr.FINANCIAL_APP_FLAG) then
								l_update_stu_ps_events := true;
							end if;
								
							if l_update_stu_ps_events then
								-- update the stu_attrs
								if district.EDFI_VERSION = '2.5' then
									PROC_PUT_POST_SEC_EVENTS_25(p_student_unique_id      => stu_attr.STUDENT_UNIQUE_ID,
																							p_associates_degree_date => stu_attr.ASSOCIATES_DEGREE_DATE,
																							p_college_app_flag       => stu_attr.COLLEGE_APP_FLAG,
																							p_financial_app_flag     => stu_attr.FINANCIAL_APP_FLAG,
																							p_database_number        => district.DISTRICT_DB_NUMBER,
																							p_auth_token             => l_token);
								else
									PROC_PUT_POST_SEC_EVENTS_35(p_student_unique_id      => stu_attr.STUDENT_UNIQUE_ID,
																							p_associates_degree_date => stu_attr.ASSOCIATES_DEGREE_DATE,
																							p_college_app_flag       => stu_attr.COLLEGE_APP_FLAG,
																							p_financial_app_flag     => stu_attr.FINANCIAL_APP_FLAG,
																							p_database_number        => district.DISTRICT_DB_NUMBER,
																							p_auth_token             => l_token);
								end if;
								l_update_stu_ps_events := false;
							end if;
								
						end loop stu_attr;
						----------------------------
            -- industry and level 1 2 certifications
						----------------------------
						l_current_stu_id := '999999999999';
						l_found := 'N';
						for stu_industry_certs in (select district_id
																						, district_ods_number
																						, student_unique_id
																						, school_year
																						, term
																						, achievement_title
																						, criteria
																						, award_date
																						, cert_type
																						from edfi_student_certs
																						where district_id = district.DISTRICT_CDC)
							loop
								-- make sure student is in ODS, if not continue to next rec in loop
								 continue when not PKG_UPDATE_STUDENT_ATTRIBUTES.FN_CHECK_STU_IN_ODS(p_student_unique_id => stu_industry_certs.STUDENT_UNIQUE_ID,
                                                              P_DISTRICT_ID => stu_industry_certs.DISTRICT_ID); 
								-- check for stu change
								if l_current_stu_id != stu_industry_certs.STUDENT_UNIQUE_ID then
									-- load the certs cache which contains both industry and level 1 2 certs
									PROC_INSERT_STU_CERTS_CACHE(P_STUDENT_UNIQUE_ID => stu_industry_certs.STUDENT_UNIQUE_ID
																								, P_ODS_NUMBER => stu_industry_certs.district_ods_number);
									l_current_stu_id := stu_industry_certs.STUDENT_UNIQUE_ID;
								end if; 
								begin
									select 'Y' 
									into l_found
									from v_district_stu_certs_cache
									where session_id = nv('APP_SESSION')
									  and student_unique_id           = stu_industry_certs.STUDENT_UNIQUE_ID
										and school_year                 = stu_industry_certs.SCHOOL_YEAR
										and Term                        = stu_industry_certs.TERM
										and achievement_title           = stu_industry_certs.ACHIEVEMENT_TITLE
										and (cert_type                   = 'INDUSTRY'
										or (criteria                    = stu_industry_certs.CRITERIA
										and award_date                  = stu_industry_certs.AWARD_DATE
										and cert_type                   = 'LEVEL1_2'));
									-- found a match so do nothing
								exception
								  when no_data_found then
										-- it is missing so add it back
										if stu_industry_certs.CERT_TYPE = 'INDUSTRY' then
											if district.EDFI_VERSION = 2.5 then
												PKG_UPDATE_STUDENT_ATTRIBUTES.PROC_PUT_STU_IND_CERTS_25(p_student_unique_id     => stu_industry_certs.STUDENT_UNIQUE_ID,
																																			p_district_id           => stu_industry_certs.DISTRICT_ID,
																																			p_database_number       => stu_industry_certs.DISTRICT_ODS_NUMBER,
																																			p_auth_token            => l_token,
																																			p_school_year           => stu_industry_certs.SCHOOL_YEAR,
																																			p_term                  => stu_industry_certs.TERM,
																																			p_achievement_title     => stu_industry_certs.ACHIEVEMENT_TITLE,
																																			p_old_achievement_title => null,
																																			p_transaction_type      => 'ADD');
											else 
												PKG_UPDATE_STUDENT_ATTRIBUTES.PROC_PUT_STU_IND_CERTS_35(p_student_unique_id     => stu_industry_certs.STUDENT_UNIQUE_ID,
																																			p_district_id           => stu_industry_certs.DISTRICT_ID,
																																			p_database_number       => stu_industry_certs.DISTRICT_ODS_NUMBER,
																																			p_auth_token            => l_token,
																																			p_school_year           => stu_industry_certs.SCHOOL_YEAR,
																																			p_term                  => stu_industry_certs.TERM,
																																			p_achievement_title     => stu_industry_certs.ACHIEVEMENT_TITLE,
																																			p_old_achievement_title => null,
																																			p_transaction_type      => 'ADD');
											end if;
										else
											if district.EDFI_VERSION = 2.5 then
											PKG_UPDATE_STUDENT_ATTRIBUTES.PROC_PUT_STU_LVL12_CERTS_25(p_student_unique_id     => stu_industry_certs.STUDENT_UNIQUE_ID,
																																		p_district_id           => stu_industry_certs.DISTRICT_ID,
																																		p_database_number       => stu_industry_certs.DISTRICT_ODS_NUMBER,
																																		p_auth_token            => l_token,
																																		p_school_year           => stu_industry_certs.SCHOOL_YEAR,
																																		p_term                  => stu_industry_certs.TERM,
																																		p_achievement_title     => stu_industry_certs.ACHIEVEMENT_TITLE,
																																		p_old_achievement_title => null,
																																		P_CRITERIA              => stu_industry_certs.CRITERIA,
                                                                    P_AWARD_DATE            => stu_industry_certs.AWARD_DATE,
																																		p_transaction_type      => 'ADD');
										else 
											PKG_UPDATE_STUDENT_ATTRIBUTES.PROC_PUT_STU_LVL12_CERTS_35(p_student_unique_id     => stu_industry_certs.STUDENT_UNIQUE_ID,
																																		p_district_id           => stu_industry_certs.DISTRICT_ID,
																																		p_database_number       => stu_industry_certs.DISTRICT_ODS_NUMBER,
																																		p_auth_token            => l_token,
																																		p_school_year           => stu_industry_certs.SCHOOL_YEAR,
																																		p_term                  => stu_industry_certs.TERM,
																																		p_achievement_title     => stu_industry_certs.ACHIEVEMENT_TITLE,
																																		p_old_achievement_title => null,
																																		P_CRITERIA              => stu_industry_certs.CRITERIA,
                                                                    P_AWARD_DATE            => stu_industry_certs.AWARD_DATE,
																																		p_transaction_type      => 'ADD');
										end if;
								end if;
							end;
							end loop stu_industry_certs;
						----------------------------
            -- Level I/II certifications
						----------------------------
						/*for stu_level12_certs in (select district_id
																						, district_ods_number
																						, student_unique_id
																						, school_year
																						, term
																						, achievement_title
																						, criteria
																						, award_date
																						from edfi_student_certs
																						where district_id = district.DISTRICT_CDC
																						  and cert_type = 'LEVEL1_2')
							loop
								begin
									select 'Y' 
									into l_found
									from table(PKG_UPDATE_STUDENT_ATTRIBUTES.FN_GET_LEVEL12_CERT_LIST(P_DISTRICT_ID => stu_level12_certs.DISTRICT_ID,
																																										p_student_unique_id => stu_level12_certs.STUDENT_UNIQUE_ID))
									where "SchoolYear"                 = stu_level12_certs.SCHOOL_YEAR
										and "TermDescriptor"             = stu_level12_certs.TERM
										and "AchievementTitle"           = stu_level12_certs.ACHIEVEMENT_TITLE
										and "RecognitionAwardDate"       = stu_level12_certs.AWARD_DATE
										and "Criteria"                   = stu_level12_certs.CRITERIA;
									-- found a match so do nothing
								exception
								  when no_data_found then
										-- it is missing so add it back
										if district.EDFI_VERSION = 2.5 then
											PKG_UPDATE_STUDENT_ATTRIBUTES.PROC_PUT_STU_LVL12_CERTS_25(p_student_unique_id     => stu_level12_certs.STUDENT_UNIQUE_ID,
																																		p_district_id           => stu_level12_certs.DISTRICT_ID,
																																		p_database_number       => stu_level12_certs.DISTRICT_ODS_NUMBER,
																																		p_auth_token            => l_token,
																																		p_school_year           => stu_level12_certs.SCHOOL_YEAR,
																																		p_term                  => stu_level12_certs.TERM,
																																		p_achievement_title     => stu_level12_certs.ACHIEVEMENT_TITLE,
																																		p_old_achievement_title => null,
																																		P_CRITERIA              => stu_level12_certs.CRITERIA,
                                                                    P_AWARD_DATE            => stu_level12_certs.AWARD_DATE,
																																		p_transaction_type      => 'ADD');
										else 
											PKG_UPDATE_STUDENT_ATTRIBUTES.PROC_PUT_STU_LVL12_CERTS_35(p_student_unique_id     => stu_level12_certs.STUDENT_UNIQUE_ID,
																																		p_district_id           => stu_level12_certs.DISTRICT_ID,
																																		p_database_number       => stu_level12_certs.DISTRICT_ODS_NUMBER,
																																		p_auth_token            => l_token,
																																		p_school_year           => stu_level12_certs.SCHOOL_YEAR,
																																		p_term                  => stu_level12_certs.TERM,
																																		p_achievement_title     => stu_level12_certs.ACHIEVEMENT_TITLE,
																																		p_old_achievement_title => null,
																																		P_CRITERIA              => stu_level12_certs.CRITERIA,
                                                                    P_AWARD_DATE            => stu_level12_certs.AWARD_DATE,
																																		p_transaction_type      => 'ADD');
										end if;
								end;
							end loop;*/
						----------------------------
            -- course dual credits
						----------------------------
						/*for course_dual_cr in (select district_id, 
																					district_ods_number, 
																					course_code
																		from edfi_course_dual_cr
																		where district_id = district.DISTRICT_CDC)
							loop
								begin
									select 'Y' 
									into l_found
									from table(PKG_UPDATE_STUDENT_ATTRIBUTES.FN_GET_COURSES_LIST(P_DISTRICT_ID => course_dual_cr.DISTRICT_ID))
									where "CourseCode"                 = course_dual_cr.COURSE_CODE
										and "CourseLevelCharacteristic"  = 'Dual Credit';
									-- found a match so do nothing
								exception
								  when no_data_found then
										-- it is missing so add it back
										if district.EDFI_VERSION = '3.5' then
											PKG_UPDATE_STUDENT_ATTRIBUTES.PROC_PUT_CRS_DUAL_CR_35(p_course_code      => course_dual_cr.COURSE_CODE,
                                                                 p_database_number  => course_dual_cr.DISTRICT_ODS_NUMBER,
                                                                 p_auth_token       => l_token,
                                                                 p_transaction_type => 'ADD');
										else 
											-- haven't done a 2.5 course update proc
											null;
										end if;
								end;
							end loop;*/
							
						
        end loop districts;
        -- close the apex session
				apex_session.delete_session (p_session_id => v('APP_SESSION') );
				
   end PROC_REFRESH_ODS_UPDATES;
-- function to validate student id exists.
  FUNCTION FN_VALIDATE_STUDENT_UNIQUE_ID (
       P_STUDENT_UNIQUE_ID IN varchar2,
			 P_DISTRICT_ID in varchar2
  ) return boolean as
	  l_found   boolean := false;
    l_stu_id  varchar2(100);
		l_db_link varchar2(100);
		l_cursor  sys_refcursor;
  begin
		select DB_LINK
				into l_db_link
				from DISTRICT_DB_LINK
			 where DISTRICT_ID = P_DISTRICT_ID
				 and TARGET_DB = 'ODS';
				 
		OPEN l_cursor for 'select "StudentUniqueId" 
													from edfi.v_StudentIds@'||l_db_link||' 
												 where "StudentUniqueId" = '''||P_STUDENT_UNIQUE_ID||'''';
			 LOOP
					FETCH l_cursor INTO l_stu_id;
			 
					EXIT WHEN l_cursor%NOTFOUND;
					
					l_found := true;
			 END loop;

			 CLOSE l_cursor;
		commit;
		execute immediate 'alter session close database link ' || l_db_link;
		return l_found;
  end FN_VALIDATE_STUDENT_UNIQUE_ID;
--------------------------------------------------------------
-- validation for stu_attr file import
--------------------------------------------------------------
    procedure PROC_VAL_STU_ATTR_IMPORT (
			P_DISTRICT_ID              varchar2
			)
    is
		l_error_message varchar(4000);
		l_date          date;
		l_found         char;
    begin
			if APEX_COLLECTION.collection_exists(p_collection_name => 'LOAD_CONTENT') then
        for r in (select seq_id,
											 c001 as STUDENT_UNIQUE_ID, 
											 c002 as ASVAB_DATE, 
											 c003 as MILITARY_DATE,
											 c004 as MENINGITIS_DATE, 
											 c005 as ASSOCIATES_DEGREE_DATE, 
											 c006 as COLLEGE_APP_FLAG,
											 c007 as FINANCIAL_APP_FLAG, 
										   c048 as ERROR_MESSAGE
									from apex_collections
								 where collection_name = 'LOAD_CONTENT'
								 order by seq_id)
					loop
						-- clear the error message
						l_error_message := null;
						-- validate the STUDENT ids
						if not FN_VALIDATE_STUDENT_UNIQUE_ID(P_STUDENT_UNIQUE_ID => r.STUDENT_UNIQUE_ID
						                                , P_DISTRICT_ID => P_DISTRICT_ID) then
							l_error_message := l_error_message||' | Student Unique ID is not Found';
						end if;
						-- validate the asvab date
						begin
							if r.ASVAB_DATE is not null then
							   l_date := to_date(r.ASVAB_DATE, 'MM/DD/YYYY');
							end if;
							-- date is ok, do nothing
						exception
							when others then -- Using a when others since date format could also be invalid
								l_error_message := l_error_message||' | ASVAB Date Invalid Format is MM/DD/YYYY';
						end;
						-- validate the military enlistment date
						begin
							if r.MILITARY_DATE is not null then
							   l_date := to_date(r.MILITARY_DATE, 'MM/DD/YYYY');
							end if;
							-- date is ok, do nothing
						exception
							when others then -- Using a when others since date format could also be invalid
								l_error_message := l_error_message||' | Military Enlistment Date Invalid Format is MM/DD/YYYY';
						end;
						-- validate the meningitis vaccination date
						begin
							if r.MENINGITIS_DATE is not null then
							   l_date := to_date(r.MENINGITIS_DATE, 'MM/DD/YYYY');
							end if;
							-- date is ok, do nothing
						exception
							when others then -- Using a when others since date format could also be invalid
								l_error_message := l_error_message||' | Meningitis Vaccination Date Invalid Format is MM/DD/YYYY';
						end;
						-- validate the Associates Degree date
						begin
							if r.ASSOCIATES_DEGREE_DATE is not null then
							   l_date := to_date(r.ASSOCIATES_DEGREE_DATE, 'MM/DD/YYYY');
							end if;
							-- date is ok, do nothing
						exception
							when others then -- Using a when others since date format could also be invalid
								l_error_message := l_error_message||' | Military Enlistment Date Invalid Format is MM/DD/YYYY';
						end;
						-- validate the College Application Flag
						if r.COLLEGE_APP_FLAG not in ('Y','N','y','n') 
							 and R.COLLEGE_APP_FLAG is not null then
							l_error_message := l_error_message||' | College Application Flag must be either "Y" or "N"';
						end if;
						-- validate the Financial Application Flag
						if r.FINANCIAL_APP_FLAG not in ('Y','N','y','n') 
							 and R.FINANCIAL_APP_FLAG is not null then
							l_error_message := l_error_message||' | Financial Application Flag must be either "Y" or "N"';
						end if;
						
						-- update the collection member with the error message.
						if l_error_message is not null then
							APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (
									p_collection_name => 'LOAD_CONTENT',
									p_seq => r.SEQ_ID,
									p_attr_number => '48',
									p_attr_value => R.ERROR_MESSAGE||' Validation Errors: ' ||l_error_message);
							APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (
									p_collection_name => 'LOAD_CONTENT',
									p_seq => r.SEQ_ID,
									p_attr_number => '49',
									p_attr_value => 'FAILED');
						end if;
					end loop;
			end if;
    end PROC_VAL_STU_ATTR_IMPORT;
--------------------------------------------------------------
-- load for stu_attr file import
--------------------------------------------------------------
    procedure PROC_LOAD_STU_ATTR_IMPORT (
			   P_DISTRICT_ID                                in varchar2,
				 P_DISTRICT_ODS_NUMBER                        in varchar2,
			   P_INSERT_COUNT                               out integer
		)
    is
			l_asvab_date              date;
			l_military_date           date;
			l_meningitis_date         date;
			l_associates_degree_date  date;
			l_college_app_flag        char;
			l_financial_app_flag      char;

    begin
			if APEX_COLLECTION.collection_exists(p_collection_name => 'LOAD_CONTENT') then
        for r in (select seq_id,
											 c001 as STUDENT_UNIQUE_ID, 
											 c002 as ASVAB_DATE, 
											 c003 as MILITARY_DATE,
											 c004 as MENINGITIS_DATE, 
											 c005 as ASSOCIATES_DEGREE_DATE, 
											 c006 as COLLEGE_APP_FLAG,
											 c007 as FINANCIAL_APP_FLAG,
											 c048 as ERROR_MESSAGE
									from apex_collections
								 where collection_name = 'LOAD_CONTENT'
								   and c001 is not null
								 order by seq_id)
					loop
						-- CHECK TO SEE IF A RECORD ALREADY EXISTS
						begin
							select asvab_date,
										 military_date,
										 meningitis_date,
										 associates_degree_date,
										 college_app_flag,
										 financial_app_flag
								into l_asvab_date,
										 l_military_date,
										 l_meningitis_date,
										 l_associates_degree_date,
										 l_college_app_flag,
										 l_financial_app_flag
								from edfi_student_data
							 where district_id = P_DISTRICT_ID
								 and student_unique_id = r.STUDENT_UNIQUE_ID;
							
							if (l_asvab_date is null and r.ASVAB_DATE is not null)
								or (l_asvab_date is not null and r.ASVAB_DATE is not null
								and l_asvab_date != to_date(r.ASVAB_DATE,'MM/DD/YYYY')) then
								-- reset the item to the new value
								l_asvab_date := to_date(r.ASVAB_DATE,'MM/DD/YYYY');
							end if;
							if (l_military_date is null and r.MILITARY_DATE is not null)
								or (l_military_date is not null and r.MILITARY_DATE is not null
								and l_military_date != to_date(r.MILITARY_DATE,'MM/DD/YYYY')) then
								-- reset the item to the new value
								l_military_date := to_date(r.MILITARY_DATE,'MM/DD/YYYY');
							end if;
							if (l_meningitis_date is null and r.MENINGITIS_DATE is not null)
								or (l_meningitis_date is not null and r.MENINGITIS_DATE is not null
								and l_meningitis_date != to_date(r.MENINGITIS_DATE,'MM/DD/YYYY')) then
								-- reset the item to the new value
								l_meningitis_date := to_date(r.MENINGITIS_DATE,'MM/DD/YYYY');
							end if;
							if (l_associates_degree_date is null and r.ASSOCIATES_DEGREE_DATE is not null)
								or (l_associates_degree_date is not null and r.ASSOCIATES_DEGREE_DATE is not null
								and l_associates_degree_date != to_date(r.ASSOCIATES_DEGREE_DATE,'MM/DD/YYYY')) then
								-- reset the item to the new value
								l_associates_degree_date := to_date(r.ASSOCIATES_DEGREE_DATE,'MM/DD/YYYY');
							end if;
							if (l_college_app_flag is null and r.COLLEGE_APP_FLAG is not null)
								or (l_college_app_flag is not null and r.COLLEGE_APP_FLAG is not null
								and l_college_app_flag != upper(r.COLLEGE_APP_FLAG)) then
								-- reset the item to the new value
								l_college_app_flag := upper(r.COLLEGE_APP_FLAG);
							end if;
							if (l_financial_app_flag is null and r.FINANCIAL_APP_FLAG is not null)
								or (l_financial_app_flag is not null and r.FINANCIAL_APP_FLAG is not null
								and l_financial_app_flag != upper(r.FINANCIAL_APP_FLAG)) then
								-- reset the item to the new value
								l_financial_app_flag := upper(r.FINANCIAL_APP_FLAG);
							end if;
							--record exists SO update with new values
							update EDFI_STUDENT_DATA set
										ASVAB_DATE               = l_asvab_date,
										MILITARY_DATE            = l_military_date,
										MENINGITIS_DATE          = l_meningitis_date,
										ASSOCIATES_DEGREE_DATE   = l_associates_degree_date,
										COLLEGE_APP_FLAG         = l_college_app_flag,
										FINANCIAL_APP_FLAG       = l_financial_app_flag,
										SOURCE                   = 'CsvUpload',
										LAST_UPDATE_DATE         = sysdate
								 where DISTRICT_ID = P_DISTRICT_ID and STUDENT_UNIQUE_ID = r.STUDENT_UNIQUE_ID;
							
						exception
						 when no_data_found then
							-- NO RECORD SO INSERT
							insert into EDFI_STUDENT_DATA (
								 DISTRICT_ID,
								 DISTRICT_ODS_NUMBER,
								 STUDENT_UNIQUE_ID,
								 ASVAB_DATE,
								 MILITARY_DATE,
								 MENINGITIS_DATE,
								 ASSOCIATES_DEGREE_DATE,
								 COLLEGE_APP_FLAG,
								 FINANCIAL_APP_FLAG,
								 source
							) values ( 
								 P_DISTRICT_ID,
								 P_DISTRICT_ODS_NUMBER,
								 r.STUDENT_UNIQUE_ID,
								 to_date(r.ASVAB_DATE,'MM/DD/YYYY'),
								 to_date(r.MILITARY_DATE,'MM/DD/YYYY'),
								 to_date(r.MENINGITIS_DATE,'MM/DD/YYYY'),
								 to_date(r.ASSOCIATES_DEGREE_DATE,'MM/DD/YYYY'),
								 upper(r.COLLEGE_APP_FLAG),
								 upper(r.FINANCIAL_APP_FLAG),
								 'CsvUpload'
							);
					  end;
				  end loop;
				P_INSERT_COUNT := APEX_COLLECTION.collection_member_count(p_collection_name => 'LOAD_CONTENT');
      end if;
    end PROC_LOAD_STU_ATTR_IMPORT;	
--------------------------------------------------------------
-- validation for stu certifications file import
--------------------------------------------------------------
    procedure PROC_VAL_STU_CERT_IMPORT (
			P_DISTRICT_ID            in varchar2,
			P_DATABASE_NUMBER        in varchar2,
			P_EDFI_VERSION           in varchar2
			)
    is
		l_error_message varchar(4000);
		l_date          date;
		l_found         char;
    begin
			if APEX_COLLECTION.collection_exists(p_collection_name => 'LOAD_CONTENT') then
        for r in (select seq_id,
											 c001 as STUDENT_UNIQUE_ID, 
											 c002 as SCHOOL_YEAR, 
											 c003 as TERM,
											 c004 as ACHIEVEMENT_TITLE, 
											 c005 as CRITERIA, 
											 c006 as AWARD_DATE,
											 c007 as CERT_TYPE, 
										   c048 as ERROR_MESSAGE
									from apex_collections
								 where collection_name = 'LOAD_CONTENT'
								 order by seq_id)
					loop
						-- clear the error message
						l_error_message := null;
						-- validate the STUDENT ids
						if not FN_VALIDATE_STUDENT_UNIQUE_ID(P_STUDENT_UNIQUE_ID => r.STUDENT_UNIQUE_ID
						                                , P_DISTRICT_ID => P_DISTRICT_ID) then
							l_error_message := l_error_message||' | Student Unique ID is not Found';
						end if;
						-- validate the AWARD_DATE date
						begin
							if r.AWARD_DATE is not null then
							   l_date := to_date(r.AWARD_DATE, 'MM/DD/YYYY');
							end if;
							-- date is ok, do nothing
						exception
							when others then -- Using a when others since date format could also be invalid
								l_error_message := l_error_message||' | AWARD_DATE Date Invalid, Format is MM/DD/YYYY';
						end;
						-- validate the SCHOOL_YEAR
						begin
							if to_number(r.SCHOOL_YEAR) not between 2018 and 2030 then
								 l_error_message := l_error_message||' | SCHOOL_YEAR out of range, 2018 to 2030';
							end if;
						exception
							when others then -- Using a when others since date format could also be invalid
								l_error_message := l_error_message||' | SCHOOL_YEAR is not a valid number';
						end;
            -- validate the term
						if r.TERM not in ('Fall Semester',
															'Spring Semester',
															'Summer Semester',
															'First Quarter',
															'Second Quarter',
															'Third Quarter',
															'Fourth Quarter',
															'First Trimester',
															'Second Trimester',
															'Third Trimester',
															'MiniTerm',
															'Year Round',
															'Other') then
							 l_error_message := l_error_message||' | TERM is invalid, check instructions for valid values';
						end if;
						-- validate the ACHIEVEMENT_TITLE
						if r.ACHIEVEMENT_TITLE is null then
							l_error_message := l_error_message||' | ACHIEVEMENT_TITLE is required';
						end if;
						-- validate the CRITERIA
						if r.CRITERIA not in ('CERT1','CERT2') 
							 and R.CRITERIA is not null then
							l_error_message := l_error_message||' | CRITERIA is invalid, must be "CERT1" or "CERT2"';
						end if;
						-- validate the CERT_TYPE
						if r.CERT_TYPE not in ('INDUSTRY','LEVEL1_2') 
							 and R.CERT_TYPE is not null then
							l_error_message := l_error_message||' | CERT_TYPE is invalid, must be "INDUSTRY" or "LEVEL1_2"';
						end if;
						-- criteria and award date are required to "LEVEL1_2" CERT_TYPE
						if (r.CRITERIA is null
							 or r.AWARD_DATE is null)
							 and r.CERT_TYPE = 'LEVEL1_2'then
							l_error_message := l_error_message||' | CRITERIA and AWARD_DATE are required when CERT_TYPE="LEVEL1_2"';
						end if;
						-- update the collection member with the error message.
						if l_error_message is not null then
							APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (
									p_collection_name => 'LOAD_CONTENT',
									p_seq => r.SEQ_ID,
									p_attr_number => '48',
									p_attr_value => R.ERROR_MESSAGE||' Validation Errors: ' ||l_error_message);
							APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE (
									p_collection_name => 'LOAD_CONTENT',
									p_seq => r.SEQ_ID,
									p_attr_number => '49',
									p_attr_value => 'FAILED');
						end if;
					end loop;
			end if;
    end PROC_VAL_STU_CERT_IMPORT;
--------------------------------------------------------------
-- load for stu certifications file import
--------------------------------------------------------------
    procedure PROC_LOAD_STU_CERT_IMPORT (
			   P_DISTRICT_ID                                in varchar2,
				 P_DISTRICT_ODS_NUMBER                        in varchar2,
			   P_INSERT_COUNT                               out integer
		)
    is

    begin
			if APEX_COLLECTION.collection_exists(p_collection_name => 'LOAD_CONTENT') then
        for r in (select seq_id,
											 c001 as STUDENT_UNIQUE_ID, 
											 c002 as SCHOOL_YEAR, 
											 c003 as TERM,
											 c004 as ACHIEVEMENT_TITLE, 
											 c005 as CRITERIA, 
											 c006 as AWARD_DATE,
											 c007 as CERT_TYPE, 
											 c048 as ERROR_MESSAGE
									from apex_collections
								 where collection_name = 'LOAD_CONTENT'
								   and c001 is not null
								 order by seq_id)
					loop
						-- insert stu attrs to the edfi_student_data table
						PROC_EDFI_STUDENT_CERTS(P_DISTRICT_ID           => P_DISTRICT_ID,
                              P_DISTRICT_ODS_NUMBER   => P_DISTRICT_ODS_NUMBER,
                              P_STUDENT_UNIQUE_ID     => r.STUDENT_UNIQUE_ID,
                              P_SCHOOL_YEAR           => r.SCHOOL_YEAR,
                              P_TERM                  => r.TERM,
                              P_ACHIEVEMENT_TITLE     => r.ACHIEVEMENT_TITLE,
                              P_OLD_ACHIEVEMENT_TITLE => r.ACHIEVEMENT_TITLE,
                              P_CRITERIA              => r.CRITERIA,
                              P_AWARD_DATE            => to_date(r.AWARD_DATE,'MM/DD/YYYY'),
                              P_CERT_TYPE             => r.CERT_TYPE);
				    end loop;
					P_INSERT_COUNT := APEX_COLLECTION.collection_member_count(p_collection_name => 'LOAD_CONTENT');
			end if;
    end PROC_LOAD_STU_CERT_IMPORT;
--------------------------------------------------------------
-- insert for stu_attr file import from apply texas via talend
--------------------------------------------------------------
    procedure PROC_INSERT_STU_ATTR_IMPORT (
			   P_DISTRICT_ID                                in varchar2,
			   P_STUDENT_UNIQUE_ID                          in varchar2,
				 P_ASVAB_DATE                                 in varchar2,
				 P_MILITARY_DATE                              in varchar2,
				 P_MENINGITIS_DATE                            in varchar2,
				 P_ASSOCIATES_DEGREE_DATE                     in varchar2,
				 P_COLLEGE_APP_FLAG                           in varchar2,
				 P_FINANCIAL_APP_FLAG                         in varchar2
					 
		)
    is
			l_asvab_date              date;
			l_military_date           date;
			l_meningitis_date         date;
			l_associates_degree_date  date;
			l_college_app_flag        char;
			l_financial_app_flag      char;
			l_district_ods_number     varchar2(20);

    begin
			-- get the ODS number for the district
			select districts.DISTRICT_DB_NUMBER
			into l_district_ods_number
			from districts
			where districts.DISTRICT_CDC = P_DISTRICT_ID;
			
			-- CHECK TO SEE IF A RECORD ALREADY EXISTS
			begin
				select asvab_date,
							 military_date,
							 meningitis_date,
							 associates_degree_date,
							 college_app_flag,
							 financial_app_flag
					into l_asvab_date,
							 l_military_date,
							 l_meningitis_date,
							 l_associates_degree_date,
							 l_college_app_flag,
							 l_financial_app_flag
					from edfi_student_data
				 where district_id = P_DISTRICT_ID
					 and student_unique_id = P_STUDENT_UNIQUE_ID;
							
				if (l_asvab_date is null and P_ASVAB_DATE is not null)
					or (l_asvab_date is not null and P_ASVAB_DATE is not null
					and l_asvab_date != to_date(P_ASVAB_DATE,'MM/DD/YYYY')) then
					-- reset the item to the new value
					l_asvab_date := to_date(P_ASVAB_DATE,'MM/DD/YYYY');
				end if;
				if (l_military_date is null and P_MILITARY_DATE is not null)
					or (l_military_date is not null and P_MILITARY_DATE is not null
					and l_military_date != to_date(P_MILITARY_DATE,'MM/DD/YYYY')) then
					-- reset the item to the new value
					l_military_date := to_date(P_MILITARY_DATE,'MM/DD/YYYY');
				end if;
				if (l_meningitis_date is null and P_MENINGITIS_DATE is not null)
					or (l_meningitis_date is not null and P_MENINGITIS_DATE is not null
					and l_meningitis_date != to_date(P_MENINGITIS_DATE,'MM/DD/YYYY')) then
					-- reset the item to the new value
					l_meningitis_date := to_date(P_MENINGITIS_DATE,'MM/DD/YYYY');
				end if;
				if (l_associates_degree_date is null and P_ASSOCIATES_DEGREE_DATE is not null)
					or (l_associates_degree_date is not null and P_ASSOCIATES_DEGREE_DATE is not null
					and l_associates_degree_date != to_date(P_ASSOCIATES_DEGREE_DATE,'MM/DD/YYYY')) then
					-- reset the item to the new value
					l_associates_degree_date := to_date(P_ASSOCIATES_DEGREE_DATE,'MM/DD/YYYY');
				end if;
				if (l_college_app_flag is null and P_COLLEGE_APP_FLAG is not null)
					or (l_college_app_flag is not null and P_COLLEGE_APP_FLAG is not null
					and l_college_app_flag != upper(P_COLLEGE_APP_FLAG)) then
					-- reset the item to the new value
					l_college_app_flag := upper(P_COLLEGE_APP_FLAG);
				end if;
				if (l_financial_app_flag is null and P_FINANCIAL_APP_FLAG is not null)
					or (l_financial_app_flag is not null and P_FINANCIAL_APP_FLAG is not null
					and l_financial_app_flag != upper(P_FINANCIAL_APP_FLAG)) then
					-- reset the item to the new value
					l_financial_app_flag := upper(P_FINANCIAL_APP_FLAG);
				end if;
				--record exists SO update with new values
				update EDFI_STUDENT_DATA set
							ASVAB_DATE               = l_asvab_date,
							MILITARY_DATE            = l_military_date,
							MENINGITIS_DATE          = l_meningitis_date,
							ASSOCIATES_DEGREE_DATE   = l_associates_degree_date,
							COLLEGE_APP_FLAG         = l_college_app_flag,
							FINANCIAL_APP_FLAG       = l_financial_app_flag,
							SOURCE                   = 'Talend',
							LAST_UPDATE_DATE         = sysdate
					 where DISTRICT_ID = P_DISTRICT_ID and STUDENT_UNIQUE_ID = P_STUDENT_UNIQUE_ID;
							
			exception
			 when no_data_found then
				-- NO EXISTING RECORD SO INSERT
				insert into EDFI_STUDENT_DATA (
					 DISTRICT_ID,
					 DISTRICT_ODS_NUMBER,
					 STUDENT_UNIQUE_ID,
					 ASVAB_DATE,
					 MILITARY_DATE,
					 MENINGITIS_DATE,
					 ASSOCIATES_DEGREE_DATE,
					 COLLEGE_APP_FLAG,
					 FINANCIAL_APP_FLAG,
					 source
				) values ( 
					 P_DISTRICT_ID,
					 l_district_ods_number,
					 P_STUDENT_UNIQUE_ID,
					 to_date(P_ASVAB_DATE,'MM/DD/YYYY'),
					 to_date(P_MILITARY_DATE,'MM/DD/YYYY'),
					 to_date(P_MENINGITIS_DATE,'MM/DD/YYYY'),
					 to_date(P_ASSOCIATES_DEGREE_DATE,'MM/DD/YYYY'),
					 upper(P_COLLEGE_APP_FLAG),
					 upper(P_FINANCIAL_APP_FLAG),
					 'Talend'
				);
			end;
    end PROC_INSERT_STU_ATTR_IMPORT;
	 --------------------------------------------------------------
   -- Refresh mvs from sql server for the admin dashboard 
   --------------------------------------------------------------
   procedure REFRESH_MV_EDFI_STATS  is
   begin
		 -- REFRESH MV_ASSESSMENT_BY_TITLE
		 -- REMOVE ANY NULL CONSTRAINTS
     for x in (select constraint_name
                from all_constraints
                where table_name='MV_ASSESSMENT_BY_TITLE'
                and constraint_type='C')
        loop
          execute immediate
          'alter table MV_ASSESSMENT_BY_TITLE drop CONSTRAINT '||x.constraint_name;
        end loop;
				
     -- REFESH THE MV
		 DBMS_MVIEW.refresh('MV_ASSESSMENT_BY_TITLE', method => 'C', atomic_refresh=>false);
		 
		 -- REFRESH MV_ASSESSMENT_SUMMARY
		 -- REMOVE ANY NULL CONSTRAINTS
     for x in (select constraint_name
                from all_constraints
                where table_name='MV_ASSESSMENT_SUMMARY'
                and constraint_type='C')
        loop
          execute immediate
          'alter table MV_ASSESSMENT_SUMMARY drop CONSTRAINT '||x.constraint_name;
        end loop;
				
     -- REFESH THE MV
		 DBMS_MVIEW.refresh('MV_ASSESSMENT_SUMMARY', method => 'C', atomic_refresh=>false);
		 
		 -- REFRESH MV_CAMPUS_SUMMARY
		 -- REMOVE ANY NULL CONSTRAINTS
     for x in (select constraint_name
                from all_constraints
                where table_name='MV_CAMPUS_SUMMARY'
                and constraint_type='C')
        loop
          execute immediate
          'alter table MV_CAMPUS_SUMMARY drop CONSTRAINT '||x.constraint_name;
        end loop;
				
     -- REFESH THE MV
		 DBMS_MVIEW.refresh('MV_CAMPUS_SUMMARY', method => 'C', atomic_refresh=>false);
		 
   end REFRESH_MV_EDFI_STATS;		 
end PKG_UPDATE_STUDENT_ATTRIBUTES;
/
grant execute on EDFIDATA.PKG_UPDATE_STUDENT_ATTRIBUTES to EDFIAPP;


