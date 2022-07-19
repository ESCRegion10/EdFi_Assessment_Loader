create or replace force view edfidata.v_assessment_stu_id_mismatch as
select "LAST_NAME","FIRST_NAME","BIRTH_DATE","LOADED_DATE","DISTRICT_ID","FILE_NAME","ASSESSMENT_TYPE","STUDENT_ID" from edfidata.assessment_stu_id_mismatch;
grant select on EDFIDATA.V_ASSESSMENT_STU_ID_MISMATCH to EDFIAPP;


