create or replace force view edfidata.v_district_assessment_header as
select "COLUMN_POSITION","COLUMN_NAME","DATA_TYPE","FORMAT_MASK","CREATED","DISTRICT_ID","FILENAME","ASSESSMENT_TYPE" from edfidata.district_assessment_header;
grant select on EDFIDATA.V_DISTRICT_ASSESSMENT_HEADER to EDFIAPP;


