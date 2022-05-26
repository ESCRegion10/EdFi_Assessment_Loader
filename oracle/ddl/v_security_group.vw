create or replace force view edfidata.v_security_group as
select "SECURITY_GROUP_SID","SECURITY_GROUP_NAME","SECURITY_GROUP_DESCRIPTION","ACTIVE_FLAG","UPDATED_BY","LAST_UPDATED_DATE"
from security_group
where security_group.active_flag = 'Y';
grant select on EDFIDATA.V_SECURITY_GROUP to EDFIAPP;


