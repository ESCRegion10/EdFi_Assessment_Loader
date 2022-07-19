create or replace force view edfidata.v_district_ib_data as
select "LINE_NUMBER","YEAR","STUDENT_ID","DISTRICT_ID","SCHOOL_SESSION","SUBJECT","EXAM_GRADE","PREDICTED_GRADE","LOADED_DATE","FILE_NAME" from edfidata.district_ib_data;
grant select on EDFIDATA.V_DISTRICT_IB_DATA to EDFIAPP;


