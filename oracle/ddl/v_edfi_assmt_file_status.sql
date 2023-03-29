create or replace view v_edfi_assmt_file_status 
as
select file_name_school_year,
			 test_type,
			 processing_status,
			 status_update_ts
	from edfi_assmt_file_status;
	
grant select on edfidata.v_edfi_assmt_file_status to edfiapp;

create or replace synonym edfiapp.v_edfi_assmt_file_status for edfidata.v_edfi_assmt_file_status;
