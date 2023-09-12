create or replace view v_program_of_study as 
select program_code
			, program_title
			, program_of_study_sid
			, school_year
	from program_of_study;
	
grant select on edfidata.v_program_of_study to edfiapp;
create or replace synonym edfiapp.v_program_of_study for edfidata.v_program_of_study;
