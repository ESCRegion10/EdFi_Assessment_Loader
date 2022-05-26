create or replace force view edfidata.v_districts as
select t."DISTRICT_CDC",
			 t."DISTRICT_NAME",
			 t."DISTRICT_DB_NUMBER",
			 t."ACTIVE",
			 t."DISTRICT_SID",
			 t.api_key,
			 t.api_secret,
			 t.edfi_version,
			 t.mass_send_flag,
			 t.asvab_flag,
			 t.military_enlistment_flag,
			 t.meningitis_vaccination_flag,
			 t.associates_degree_flag,
			 t.college_app_flag,
			 t.financial_app_flag,
			 t.level_1_2_cert_flag,
			 t.industry_cert_flag,
			 t.dual_cr_course_flag,
			 t.school_year,
			 t.PROXY_DISTRICT_NAME,
			 pkg_districts.build_districts_md5(p_district_sid       => district_sid
																				,p_district_cdc       => district_cdc
																				,p_district_name      => district_name
																				,p_district_db_number => district_db_number
																				,p_active             => active
																				,p_api_key            => api_key
																				,p_api_secret         => api_secret) as md5
  from DISTRICTS t;
grant select on EDFIDATA.V_DISTRICTS to EDFIAPP;


