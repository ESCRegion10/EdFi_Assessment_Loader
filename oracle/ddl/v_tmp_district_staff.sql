create or replace view v_tmp_district_staff as
select   district_id,
				 create_ts,
				 staff_unique_id,
				 last_surname,
				 first_name,
				 electronic_mail_address,
				 staff_classification,
				 email_type,
				 assigned_org
		from district_staff_cache;
