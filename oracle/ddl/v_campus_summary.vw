create or replace force view edfidata.v_campus_summary as
select "STATS_DATE_TIME",
			 "DATABASE_NUMBER",
			 "LEA",
			 "CAMPUS",
			 "TOTAL_STUDENT_COUNT",
			 "ENROLLED_STUDENT_COUNT",
			 "ENROLLED_SENIORS",
			 "ENROLLED_ECON",
			 "ENROLLED_SPED",
			 "LAST_STUDENT_SCHOOL_UPDATED",
			 "LAST_STUDENT_UPDATED",
			 "STUDENTS_WITH_CERTIFICATES",
			 "STUDENTS_WITH_DUAL_CR",
			 "STUDENTS_WITH_ON_RAMP_CR",
			 "LEA_CDN",
			 "CAMPUS_CDC"
	from mv_campus_summary;
grant select on EDFIDATA.V_CAMPUS_SUMMARY to EDFIAPP;


