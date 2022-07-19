create or replace force view edfidata.v_assessment_summary as
select "STATS_DATE_TIME",
			 "DATABASE_NUMBER",
			 "CAMPUS",
			 "DISTINCT_STUDENTS",
			 "ACT",
			 "TSI",
			 "SAT",
			 "AP",
			 "DIFFERENT_AP_SUBJECTS",
			 "IB",
			 "DIFFERENT_IB_SUBJECTS",
			 "CAMPUS_CDC"
	from mv_assessment_summary;
grant select on EDFIDATA.V_ASSESSMENT_SUMMARY to EDFIAPP;


