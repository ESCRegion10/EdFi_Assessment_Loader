declare
l_student_id varchar(20);
begin
	for rec in (select d.*,d.rowid
                from DISTRICT_TSI2_DATA d
								where d.FILE_NAME = '057916_TSI2_2023_20221012.csv'
								 and d.STUDENT_ID = '1246592835')
  loop
		dbms_output.put_line( 'before: '||rec.student_id);
		dbms_output.put_line(replace(trim(upper(rec.FIRST_NAME) || upper(rec.LAST_NAME) || to_char(to_date(rec.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', ''));
		select c.STUDENT_UNIQUE_ID
									into l_student_id
									from district_student_cache c
								 where district_ID = '057916'
									 and school_year = '2023'
									 and (rec.supplemental_id = c.student_unique_id
										or rec.student_id = c.student_unique_id
										or rec.student_id = c.local_code
										or replace(trim(upper(c.FIRST_NAME) || upper(c.LAST_SURNAME) || to_char(to_date(c.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
									 = replace(trim(upper(rec.FIRST_NAME) || upper(rec.LAST_NAME) || to_char(to_date(rec.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
									 
									 );
	  dbms_output.put_line( 'after: '||l_student_id);
	end loop;
	
end;
/*select *  from DISTRICT_STUDENT_CACHE
		          where district_ID = '0579216'
							 and school_year = '2023'*/
