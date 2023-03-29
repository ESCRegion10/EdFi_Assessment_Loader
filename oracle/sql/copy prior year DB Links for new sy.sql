--select t.*, t.rowid from DISTRICT_DB_LINK_SY t
insert into DISTRICT_DB_LINK_SY
select district_id
		, replace(db_link,'_2022','_2023') as db_link
		, sysdate as created
		, target_db
		, '2023' as school_year
	from district_db_link_sy
	where school_year = '2022'
	and district_id not in ('129902','057950','057909')
