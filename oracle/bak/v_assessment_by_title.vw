create or replace force view edfidata.v_assessment_by_title as
select "STATS_DATE_TIME",
			 "DATABASE_NUMBER",
			 "CAMPUS",
			 "ASSESSMENT_TITLE",
			 "ADMINISTRATION_DATE",
			 "DISTINCT_STUDENTS",
			 "LEA",
			 "CAMPUS_CDC"
	from mv_assessment_by_title;
grant select on EDFIDATA.V_ASSESSMENT_BY_TITLE to EDFIAPP;


