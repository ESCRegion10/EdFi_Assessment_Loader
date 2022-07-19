create or replace force view edfidata.v_staff_title as
select STAFF_TITLE_SID
      ,STAFF_TITLE_NAME
  from STAFF_TITLE;
grant select on EDFIDATA.V_STAFF_TITLE to EDFIAPP;


