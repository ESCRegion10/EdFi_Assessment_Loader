create or replace force view edfidata.v_district_db_link as
select district_id
		, db_link
		, created
		, target_db
from district_db_link;
grant select on EDFIDATA.V_DISTRICT_DB_LINK to EDFIAPP;


