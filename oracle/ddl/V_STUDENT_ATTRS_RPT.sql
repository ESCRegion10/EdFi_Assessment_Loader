create or replace view V_STUDENT_ATTRS_RPT as
select C.DISTRICT_ID
      ,C.last_surname
      ,C.first_name
      ,C.birth_date
      ,C.student_unique_id
      ,C.local_code
      ,C.school_year
      ,asvab_date
			,military_date
			,meningitis_date
			,associates_degree_date
			,college_app_flag
			,financial_app_flag
			,last_update_date
from district_student_cache C 
left join edfi_student_data ATTR on ATTR.DISTRICT_ID = C.DISTRICT_ID
                            and ATTR.STUDENT_UNIQUE_ID = C.STUDENT_UNIQUE_ID;
                            
/*where C.DISTRICT_ID = '057916'
  and c.SCHOOL_YEAR = '2023'*/
grant select on edfidata.V_STUDENT_ATTRS_RPT to edfiapp;
create or replace synonym edfiapp.V_STUDENT_ATTRS_RPT for edfidata.V_STUDENT_ATTRS_RPT;
