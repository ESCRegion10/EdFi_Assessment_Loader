create or replace force view edfidata.v_assessment_std_file_format as
select "COLUMN_POSITION","COLUMN_NAME","STANDARD_TYPE","CREATED" from edfidata.assessment_std_file_format;
grant select on EDFIDATA.V_ASSESSMENT_STD_FILE_FORMAT to EDFIAPP;


