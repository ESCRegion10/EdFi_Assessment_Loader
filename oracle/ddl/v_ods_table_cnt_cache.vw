create or replace force view edfidata.v_ods_table_cnt_cache as
select "SESSION_ID","CREATE_TS","SCHEMA_NAME","TABLE_NAME","ROW_COUNT"
from ODS_TABLE_CNT_CACHE;
grant select on EDFIDATA.V_ODS_TABLE_CNT_CACHE to EDFIAPP;


