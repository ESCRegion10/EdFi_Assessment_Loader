create or replace view V_STUDENT_CERTS_RPT as
select C.DISTRICT_ID
      ,C.last_surname
      ,C.first_name
      ,C.birth_date
      ,C.student_unique_id
      ,C.local_code
      ,C.school_year
      ,CERT.SCHOOL_YEAR as CERT_SCHOOL_YEAR
			,CERT.TERM as CERT_term
			,CERT.ACHIEVEMENT_TITLE
			,CERT.CRITERIA
      ,CERT.AWARD_DATE
      ,CERT.CERT_TYPE
from district_student_cache C 
left join EDFI_STUDENT_CERTS CERT on CERT.DISTRICT_ID = C.DISTRICT_ID
                            and CERT.STUDENT_UNIQUE_ID = C.STUDENT_UNIQUE_ID;
														
/*where C.DISTRICT_ID = '057916'
  and c.SCHOOL_YEAR = '2023'*/
grant select on edfidata.V_STUDENT_CERTS_RPT to edfiapp;
create or replace synonym edfiapp.V_STUDENT_CERTS_RPT for edfidata.V_STUDENT_CERTS_RPT;
