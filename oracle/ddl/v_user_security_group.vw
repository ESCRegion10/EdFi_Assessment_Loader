create or replace force view edfidata.v_user_security_group as
select "USER_SID","SECURITY_GROUP_SID"
from user_group;
grant select on EDFIDATA.V_USER_SECURITY_GROUP to EDFIAPP;


