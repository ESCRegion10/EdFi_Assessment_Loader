create or replace force view edfidata.v_district_stu_certs_cache as
select "SESSION_ID","CREATE_TS","STUDENT_UNIQUE_ID","SCHOOL_YEAR","TERM","ACHIEVEMENT_TITLE","CRITERIA","AWARD_DATE","CERT_TYPE" from DISTRICT_STUDENT_CERTS_CACHE;
grant select on EDFIDATA.V_DISTRICT_STU_CERTS_CACHE to EDFIAPP;


