create or replace force view edfidata.v_campus as
select CAMPUS_SID
      ,org_sid as DISTRICT_SID
			,DISTRICT_ID
			,district_name
			,campus_cdc as CAMPUS_ID
      ,CAMPUS_NAME
      ,ACTIVE
  from r10intdata.CAMPUS_dim;
grant select on EDFIDATA.V_CAMPUS to EDFIAPP;


