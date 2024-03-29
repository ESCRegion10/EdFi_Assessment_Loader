select t.*, t.rowid from DISTRICTS t
insert into districts 
select district_cdc,
			 district_name,
			 district_db_number,
			 'P' as active,
			 SID_SEQUENCE.NEXTVAL as district_sid,
			 api_key,
			 api_secret,
			 edfi_version,
			 mass_send_flag,
			 asvab_flag,
			 military_enlistment_flag,
			 meningitis_vaccination_flag,
			 associates_degree_flag,
			 college_app_flag,
			 financial_app_flag,
			 level_1_2_cert_flag,
			 industry_cert_flag,
			 dual_cr_course_flag,
			 '2021' as school_year,
			 proxy_district_name,
			 'N' as primary_school_year
	from districts
