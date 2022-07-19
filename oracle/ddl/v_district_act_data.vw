create or replace force view edfidata.v_district_act_data as
select "OTHER_ID",
			 "LINE_NUMBER",
			 "LAST_NAME",
			 "FIRST_NAME",
			 "MID_INIT",
			 "GENDER",
			 "BIRTH_DATE",
			 "ACT_SCALE_SCORES_COMPOSITE",
			 "ACT_SCALE_SCORES_ENGLISH",
			 "ACT_SCALE_SCORES_MATH",
			 "ACT_SCALE_SCORES_READING",
			 "ACT_SCALE_SCORES_SCIENCE",
			 "TEST_DATE_MONTH_AND_YEAR",
			 "GRADE_LEVEL",
			 "LOADED_DATE",
			 "DISTRICT_ID",
			 "FILE_NAME",
			 ORIGINAL_FILE_NAME,
			 STATUS,
			 ERROR_MESSAGE,
			 SCHOOL_YEAR_TO_LOAD,
		   TSDS_STUDENT_UNIQUE_ID,
			 rowid as ROW_ID
	from edfidata.district_act_data;
grant select on EDFIDATA.V_DISTRICT_ACT_DATA to EDFIAPP;


