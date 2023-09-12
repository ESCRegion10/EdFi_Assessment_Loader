create or replace view v_district_program_of_study as 
select dps.district_sid
       , d.DISTRICT_CDC
       , dps.program_of_study_sid 
from district_program_of_study dps
join DISTRICTS d  on d.DISTRICT_SID = dps.DISTRICT_SID;

grant select on edfidata.v_district_program_of_study to edfiapp;
create or replace synonym edfiapp.v_district_program_of_study for edfidata.v_district_program_of_study;
