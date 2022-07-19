create or replace force view edfidata.v_district_sat_data as
select "AI_CODE",
			 "LAST_NAME",
			 "FIRST_NAME",
			 "NAME_MI",
			 "BIRTH_DATE",
			 "LATEST_SAT_TOTAL",
			 "LATEST_SAT_EBRW",
			 "LATEST_SAT_MATH_SECTION",
			 "LATEST_REGISTRATION_NUM",
			 "LATEST_ASSESSMENT_DATE",
			 "LOADED_DATE",
			 "DISTRICT_ID",
			 "FILE_NAME",
			 "LINE_NUMBER",
			 "SECONDARY_ID",
			 ORIGINAL_FILE_NAME,
			STATUS,
			ERROR_MESSAGE,
			SCHOOL_YEAR_TO_LOAD,
			TSDS_STUDENT_UNIQUE_ID,
			LATEST_ASSESSMENT_DATE_STR,
			 rowid as ROW_ID
	from edfidata.district_sat_data;
grant select on EDFIDATA.V_DISTRICT_SAT_DATA to EDFIAPP;


