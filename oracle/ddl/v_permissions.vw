create or replace force view edfidata.v_permissions as
select
application_permission.permission_sid
,application_permission.permission_name
,application_permission.permission_description
from application_permission;
grant select on EDFIDATA.V_PERMISSIONS to EDFIAPP;


