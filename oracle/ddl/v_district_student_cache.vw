create or replace force view edfidata.v_district_student_cache as
select DISTRICT_ID,
			 CREATE_TS,
			 LAST_SURNAME,
			 FIRST_NAME,
			 BIRTH_DATE,
			 STUDENT_UNIQUE_ID,
			 LOCAL_CODE,
			 SCHOOL_YEAR
	from district_student_cache;
grant select on EDFIDATA.V_DISTRICT_STUDENT_CACHE to EDFIAPP;


