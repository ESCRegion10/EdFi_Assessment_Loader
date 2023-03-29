create or replace view v_campus as
select CAMPUS_SID
      ,org_sid as DISTRICT_SID
      ,DISTRICT_ID
      ,district_name
      ,campus_cdc as CAMPUS_ID
      ,CAMPUS_NAME
      ,ACTIVE
			,lea_type
  from CAMPUS_dim;
