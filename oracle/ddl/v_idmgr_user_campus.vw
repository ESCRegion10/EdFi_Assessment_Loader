create or replace force view edfidata.v_idmgr_user_campus as
select
 USER_SID
,CAMPUS_SID
from USER_CAMPUS
/*=====================================================
Purpose: this view returns all users selected campuses.
         It is used on page 6 to retrieve the campuses
         for the selected user, not the logged in user.
=======================================================*/;
grant select on EDFIDATA.V_IDMGR_USER_CAMPUS to EDFIAPP;


