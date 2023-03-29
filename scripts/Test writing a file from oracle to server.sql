declare
f_output utl_file.file_type;
v_output_directory varchar2(100);
begin
	v_output_directory := pkg_assessment_upload.fun_get_output_directory(v_district_id => '057916',
																								 v_test_type   => 'ACT',
																								 v_user_id     => 'TESTUSER');
	DBMS_OUTPUT.PUT_LINE(v_output_directory);

	f_output := utl_file.fopen(v_output_directory, 'TEST_FILE', 'w');

	utl_file.put_line(f_output,'TX_Unique_Student_ID,Other_ID,Last,First,Mid_Init,Gender,Date_of_Birth,File,ACT_Scale_Scores_Composite,ACT_Scale_Scores_English,ACT_Scale_Scores_Math,ACT_Scale_Scores_Reading,ACT_Scale_Scores_Science,Test_Date_Month_and_Year,Grade_Level,Student_Assessment_Identifier');

	utl_file.fflush(f_output);
	utl_file.fclose(f_output);
end;

--RICHARDSON_ACT_OUT_DIR
--SELECT * FROM ALL_DIRECTORIES

/*select * from all_tab_privs
where  table_name = 'RICHARDSON_ACT_OUT_DIR'
and    grantee = user
and    privilege = 'WRITE';*/
