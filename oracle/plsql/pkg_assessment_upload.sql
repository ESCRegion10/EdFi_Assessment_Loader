create or replace package pkg_assessment_upload 
as

  /*---------------------------------------------------------------------
  - 
  - Package:      pkg_assessment_upload 
  -
  - Purpose:      code for Assessment Upload APEX web application
  -
  - App ID:       130
  -
  - Version History:
  - Author        Date                Remarks
  - T. Esposito   10/02/20            original beta version
  -
  ----------------------------------------------------------------------*/
  
  -- global variable - for debugging
  gn_debug_on number := 0;   -- 0 = debugging OFF, 1 = debugging level 1 ON (no other debugging levels available at this time)
   
  -- functions used for testing procedures
  function fun_check_file_name_format (v_district_id varchar2, v_test_type varchar2, v_file varchar2, v_user_id varchar2) return varchar2;
  function fun_get_output_directory (v_district_id varchar2, v_test_type varchar2, v_user_id varchar2) return varchar2;
  function fun_get_database_dblink (v_district_id varchar2, v_link_target_db varchar2, v_user_id varchar2) return varchar2;
  
  -- procedures used in main processing
  procedure prc_load_stu_id_mismatch (v_district_id varchar2, v_db_link varchar2, v_test_type varchar2, v_file varchar2, v_user_id varchar2);
  procedure prc_log_status (v_status_message varchar2, v_status_type varchar2, v_user_id varchar2);  
  procedure prc_check_file_name_format (v_district_id varchar2, v_test_type varchar2, v_file varchar2, v_user_id varchar2);
  procedure prc_check_file_header_format (v_district_id varchar2, v_test_type varchar2, v_file varchar2, v_fullpath_file varchar2, v_out_test_type out varchar2, v_file_processed out varchar2, v_user_id varchar2);
  procedure prc_upload_test_data (v_district_id varchar2, v_test_type varchar2, v_file varchar2, v_fullpath_file varchar2, v_user_id varchar2);
  procedure prc_get_output_directory (v_district_id varchar2, v_test_type varchar2, v_output_directory out varchar2, v_user_id varchar2);
  procedure prc_get_database_dblink (v_district_id varchar2, v_db_link out varchar2, v_link_target_db varchar2, v_user_id varchar2);
  procedure prc_get_and_output_file_data (v_test_type varchar2, v_db_link varchar2, v_file varchar2, n_rows_with_stu_id out number, v_output_directory varchar2, v_user_id varchar2);
  procedure prc_reset_and_run_import_agent (v_db_link varchar2, v_user_id varchar2);
  procedure prc_delete_old_imported_files (v_district_id varchar2, v_output_directory varchar2, v_user_id varchar2);
  procedure prc_uploaded_vs_imported_rows (v_test_type varchar2, v_district_id varchar2, n_rows_with_stu_id number, v_user_id varchar2, v_file varchar2);
  procedure prc_load_importer_logs (v_district_id varchar2, v_user_id varchar2);
  
  -- procedures as utilities
  procedure prc_clear_stu_id_mismatch (v_district_id varchar2, v_test_type varchar2, v_user_id varchar2);
  
  -- private procedures (do not uncomment any procedures or functions below this line)
  --==================================================================================
  -- procedure prc_process_sat_data_output (v_db_link, v_file, n_rows_with_stu_id, v_output_directory, v_user_id);
  -- procedure prc_process_tsi_data_output (v_db_link, v_file, n_rows_with_stu_id, v_output_directory, v_user_id);
  -- procedure prc_process_ap_data_output (v_db_link, v_file, n_rows_with_stu_id, v_output_directory, v_user_id);
  -- procedure prc_process_act_data_output (v_db_link, v_file, n_rows_with_stu_id, v_output_directory, v_user_id);
  -- procedure prc_process_ib_data_output (v_db_link, v_file, n_rows_with_stu_id, v_output_directory, v_user_id);
 
end pkg_assessment_upload;
/

create or replace package body pkg_assessment_upload as

  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_clear_stu_id_mismatch 
  - Purpose:      clear assessment_stu_id_mismatch table (stu id mismatches)
  -
  ---------------------------------------------------------------------*/

  procedure prc_clear_stu_id_mismatch (v_district_id varchar2, v_test_type varchar2, v_user_id varchar2)
  is
  begin
    
    delete assessment_stu_id_mismatch 
    where district_id = v_district_id
    and assessment_type = v_test_type;
    
    commit;
    
    exception      
      when others then
        prc_log_status('prc_clear_stu_id_mismatch(): Error occurred clearing student id mismatch : ' || sqlerrm, 'ERROR-01', v_user_id);
        apex_error.add_error(p_message          => 'Error occurred clearing student id mismatch : ' || sqlerrm,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                     
 
  end prc_clear_stu_id_mismatch;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_load_stu_id_mismatch 
  - Purpose:      load assessment_stu_id_mismatch table (stu id mismatches)
  -
  ---------------------------------------------------------------------*/

  procedure prc_load_stu_id_mismatch (v_district_id varchar2, v_db_link varchar2, v_test_type varchar2, v_file varchar2, v_user_id varchar2)
  is
    s_sql_insert_data varchar2(4000);
    s_sql_close_db_link varchar2(200);
    n_minimal_sat_used number := 0;
    e_unknown_test_type exception;
  begin
    
    delete assessment_stu_id_mismatch 
    where district_id = v_district_id  
    and file_name =  v_file 
    and assessment_type = v_test_type;
      
    commit;   
    
    begin
          
      select parameter_value
      into n_minimal_sat_used
      from assessment_config
      where parameter_name = 'minimal_sat_used'
      and parameter_district_id = v_district_id;
        
      exception 
        when no_data_found then
          prc_log_status('prc_load_stu_id_mismatch(): District ' || v_district_id || ' not enabled to use minimal SAT format', 'WARN-02', v_user_id); 
              
    end;                             
 
    if v_test_type = 'IB' then                                 -- IB tests can do student mismatch by district student id within assessment file
      
      s_sql_insert_data := 'insert into assessment_stu_id_mismatch
                            select distinct
                              null         -- no last name 
                             ,null         -- no first name
                             ,null         -- no birth date
                             ,loaded_date
                             ,district_id
                             , ''' || v_file || '''
                             , ''' || v_test_type || '''
                             ,student_id 
                            from edfidata.district_' || v_test_type ||'_data 
                            where student_id not in (select "LocalCode"
                                                     from edfi.v_StudentIds@' || v_db_link ||')
                            and file_name = ''' || v_file || ''''; 
                            
    elsif n_minimal_sat_used = 1 and v_test_type = 'SAT' then  -- SAT tests from districts that use a modified SAT format
                                                               -- which can do a student mismatch lookup by student id 
                                                               -- using the secondary id column (which contains the student id)
                                                               -- within the assessment file.  See the assessment_config table, 
                                                               -- parameter_name = 'minimal_sat_used', for districts that use this format
     
      s_sql_insert_data := 'insert into assessment_stu_id_mismatch
                            select distinct
                              upper(last_name)
                             ,upper(first_name)
                             ,birth_date
                             ,loaded_date
                             ,district_id
                             , ''' || v_file || '''
                             , ''' || v_test_type || '''
                             ,secondary_id   -- district_stu_id
                            from edfidata.district_' || v_test_type ||'_data 
                            where secondary_id not in 
                                      (select "LocalCode" as district_stu_id
                                       from edfi.v_StudentIds@' || v_db_link ||')
                            and file_name = ''' || v_file || '''';        
            
    elsif v_test_type in ('AP', 'ACT', 'TSI', 'SAT') then      -- SAT tests do student mismatch by student first, last name and DOB
        
      s_sql_insert_data := 'insert into assessment_stu_id_mismatch
                            select distinct
                              upper(last_name)
                             ,upper(first_name)
                             ,birth_date
                             ,loaded_date
                             ,district_id
                             , ''' || v_file || '''
                             , ''' || v_test_type || '''
                             ,null         -- no student id
                            from edfidata.district_' || v_test_type ||'_data 
                            where replace(trim(upper(first_name) || upper(last_name) || to_char(to_date(birth_date,''MM/DD/YYYY''),''MM/DD/YYYY'')),'' '', '''') not in 
                                      (select distinct replace(trim(upper("FirstName") || upper("LastSurname") || to_char("BirthDate", ''MM/DD/YYYY'')),'' '', '''') as name
                                       from edfi.v_StudentIds@' || v_db_link ||')
                            and file_name = ''' || v_file || '''';                           
   
    else
      raise e_unknown_test_type;
    end if;
    
    execute immediate s_sql_insert_data;                       
    commit; 
    
    s_sql_close_db_link :=  'alter session close database link ' || v_db_link;
    execute immediate s_sql_close_db_link;
    
    exception
      when e_unknown_test_type then
        prc_log_status('prc_load_stu_id_mismatch(): Test type ' || v_test_type || ' is invalid ' || v_file, 'ERROR-02', v_user_id);
        apex_error.add_error(p_message          => 'Test type ' || v_test_type || ' is invalid ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                          
      when others then
        prc_log_status('prc_load_stu_id_mismatch(): Error occurred during loading of student id mismatch for file : ' || v_file, 'ERROR-03', v_user_id);
        apex_error.add_error(p_message          => 'Error occurred during loading of student id mismatch for file : ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                            
 
  end prc_load_stu_id_mismatch;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_log_status 
  - Purpose:      load assessment_status_log table (app log table)
  -
  ---------------------------------------------------------------------*/

  procedure prc_log_status (v_status_message varchar2, v_status_type varchar2, v_user_id varchar2) 
  is 
    pragma autonomous_transaction; 
    n_code number := sqlcode; 
    e_invalid_log_status_type exception;
  begin 
    
    if v_status_type like 'INFO%' then
      
      insert into assessment_status_log (created, created_by, statuscode, callstack, errorstack, backtrace, status_message, status_type, user_id) 
      values (systimestamp, user, 0, 'None', 'None', 'None', v_status_message, v_status_type, v_user_id);
      
    elsif v_status_type like 'WARN%' then
    
      insert into assessment_status_log (created, created_by, statuscode, callstack, errorstack, backtrace, status_message, status_type, user_id) 
      values (systimestamp, user, 1, 'None', 'None', 'None', v_status_message, v_status_type, v_user_id);
    
    elsif v_status_type like 'ERROR%' then
        
      insert into assessment_status_log (created, created_by, statuscode, callstack, errorstack, backtrace, status_message, status_type, user_id)   
      values (systimestamp, user, n_code, dbms_utility.format_call_stack, dbms_utility.format_error_stack, dbms_utility.format_error_backtrace, v_status_message, v_status_type, v_user_id);
    
    else
      raise e_invalid_log_status_type;
    end if; 
      
    commit; 
    
    exception
      when e_invalid_log_status_type then
        apex_error.add_error(p_message          => 'Invalid log status type during logging process : ' || sqlerrm,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                          
      when others then
        apex_error.add_error(p_message          => 'Error occurred during logging process : ' || sqlerrm,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                          
        
  end prc_log_status;
  
  /*---------------------------------------------------------------------
  - 
  - Function:     fun_check_file_name_format 
  - Purpose:      function to call prc_check_file_name_format (for testing)
  -
  ---------------------------------------------------------------------*/ 
 
  function fun_check_file_name_format (v_district_id varchar2, v_test_type varchar2, v_file varchar2, v_user_id varchar2)
  return varchar2
  is
  begin  
    
    prc_check_file_name_format (v_district_id, v_test_type, v_file, v_user_id);
    return 'Success';
    
    exception
      when others then
        return 'Fail';
        
  end fun_check_file_name_format;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_check_file_name_format
  - Purpose:      check format of file(s) to be uploaded
  -
  ---------------------------------------------------------------------*/  

  procedure prc_check_file_name_format (v_district_id varchar2, v_test_type varchar2, v_file varchar2, v_user_id varchar2)
  is
    n_district_cdc_cnt number;
    n_assessment_cdc_cnt number;
    e_district_file_format_error exception;
    e_assessment_file_format_error exception;
  begin
    -- verify file name has correct district id
    select count(*)
    into n_district_cdc_cnt
    from districts
    where substr(v_file,INSTR(v_file,'/',-1)+1,6) = v_district_id;
   
    if n_district_cdc_cnt = 0 then
      raise e_district_file_format_error;
    end if;
    
    -- verify file name has correct assessment type
    -- handle upper or lower case in file name for assessment type
    if v_test_type in ('AP', 'IB') then
     
      select count(*)
      into n_assessment_cdc_cnt
      from dual
      where upper(substr(v_file,INSTR(v_file,'/',-1)+8,2)) = v_test_type;
      
    elsif v_test_type in ('ACT', 'TSI', 'SAT') then 
    
      select count(*)
      into n_assessment_cdc_cnt
      from dual
      where upper(substr(v_file,INSTR(v_file,'/',-1)+8,3)) = v_test_type;   
      
    else
      raise e_assessment_file_format_error;  
    end if;  
                                                                      
    if n_assessment_cdc_cnt = 0 then
      raise e_assessment_file_format_error;
    end if;  
        
    exception
      when e_district_file_format_error then
        prc_log_status('prc_check_file_name_format(): File format has invalid district id ' || v_file, 'ERROR-04', v_user_id);
        apex_error.add_error(p_message          => 'File format has invalid district id ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                      
      when e_assessment_file_format_error then 
        prc_log_status('prc_check_file_name_format(): File format has invalid assessment type ' || v_file, 'ERROR-05', v_user_id);                     
        apex_error.add_error(p_message          => 'File format has invalid assessment type ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                       
      when others then
        prc_log_status('prc_check_file_name_format(): File upload error with file ' || sqlerrm || ' ' || v_file, 'ERROR-06', v_user_id);
        apex_error.add_error(p_message          => 'File upload error with file ' || sqlerrm || ' ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                      
 
  end prc_check_file_name_format;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_check_file_header_format
  - Purpose:      check header (1st row) of file(s) to be uploaded
  -
  ---------------------------------------------------------------------*/  
    
  procedure prc_check_file_header_format (v_district_id varchar2, v_test_type varchar2, v_file varchar2, v_fullpath_file varchar2, v_out_test_type out varchar2, v_file_processed out varchar2, v_user_id varchar2)
  is
    type r_field_type is record (
      column_position edfidata.assessment_std_file_format.column_position%type, 
      column_name edfidata.assessment_std_file_format.column_name%type
    );
    type tbl_field_table is table of r_field_type index by binary_integer;
    t_field_results tbl_field_table;
    t_empty_field_results tbl_field_table;
    n_minimal_sat_used number := 0;
    e_file_header_format_error exception;
  begin
   
     begin
          
        select parameter_value
        into n_minimal_sat_used
        from assessment_config
        where parameter_name = 'minimal_sat_used'
        and parameter_district_id = v_district_id;
        
        exception 
          when no_data_found then
             prc_log_status('prc_check_file_header_format(): District ' || v_district_id || ' not enabled to use minimal SAT format', 'WARN-03', v_user_id); 
    
      end;

    if v_test_type = 'ACT' then                                -- ACT raw file has no header
      v_file_processed := null;
      v_out_test_type  := null;
      t_field_results := t_empty_field_results;
      
    elsif n_minimal_sat_used = 1 and v_test_type = 'SAT' then  -- SAT file with minimal headers, do not check header
      v_file_processed := null;
      v_out_test_type  := null;
      t_field_results := t_empty_field_results; 
       
    else
      
      delete edfidata.district_assessment_header
      where filename = v_file
      and assessment_type = v_test_type
      and district_id = v_district_id; 

      -- see table edfidata.assessment_std_file_format where
      -- for SAT, column position (1,6,7,8,23,26,42,47,48,49)
      -- for TSI, column position (1,2,3,5,6,10,11,12,13)
      -- for AP, column position (2,3,4,14,59,60,61,65,66,67,71,72,73,77,78,79,83,84,85,89,90,91,95,96,97,101,102,103,107,108,109,113,114,115)
      -- for IB, column position (1,2,3,4,5,6,7)
      insert into edfidata.district_assessment_header 
        select distinct
          column_position,
          column_name,
          data_type,
          format_mask,   
          sysdate,
          v_district_id,
          v_file,
          v_test_type
          from
            apex_application_temp_files f, 
            table(
               apex_data_parser.get_columns(
                   apex_data_parser.discover(
                       p_content => f.blob_content,
                       p_file_name=> f.filename  
                   )
               )
              ) p
          where f.name = v_fullpath_file
          and column_position in (select column_position    
                                from edfidata.assessment_std_file_format
                                where standard_type = v_test_type)  
          order by column_position;
    
      commit;    
    
      -- for debugging only 
      if gn_debug_on = 1 then 
     
        delete edfidata.district_assessment_header; 
         
        -- for troubleshooting, store and look at assessment header that is being read from file
        insert into edfidata.debug_assessment_header
        select * from edfidata.district_assessment_header;     
      
        commit;  
      
      end if;  
    
      -- NOTE: No matter how the columns appear in the assessment file, all column names,
      --       when read into the edfidata.district_assessment_header table, will have any
      --       spaces replaced with an underscore ('_').  E.g. if the assessment file has
      --       a column name of FIRST NAME it will be converted to FIRST_NAME.  This is due 
      --       to the way the apex_data_parser procedure works.  
      
      if v_test_type = 'TSI' then -- for any TSI test type
        
        select column_position, upper(column_name) as column_name 
          bulk collect 
          into t_field_results
        from
          (select column_position, upper(column_name) as column_name 
           from edfidata.district_assessment_header  
           where filename = v_file
           and assessment_type = v_test_type
           and district_id = v_district_id
             minus 
           select column_position, upper(column_name) as column_name 
           from edfidata.assessment_std_file_format
           where standard_type = v_test_type
             minus
           select column_position, upper(column_name) as column_name 
           from edfidata.assessment_std_file_format
           where standard_type = 'TSI2'  
          );
            
      else   -- all other test types
         
        select column_position, upper(column_name) as column_name 
          bulk collect 
          into t_field_results
        from
          (select column_position, upper(column_name) as column_name 
           from edfidata.district_assessment_header  
           where filename = v_file
           and assessment_type = v_test_type
           and district_id = v_district_id
             minus 
           select column_position, upper(column_name) as column_name 
           from edfidata.assessment_std_file_format
           where standard_type = v_test_type
          )
         union all
          (select column_position, upper(column_name) as column_name 
           from edfidata.assessment_std_file_format 
           where standard_type = v_test_type
             minus 
           select column_position, upper(column_name) as column_name  
           from edfidata.district_assessment_header 
           where filename = v_file 
           and assessment_type = v_test_type
           and district_id = v_district_id
          );
        
      end if;
  
      if t_field_results.COUNT > 0 then 
        v_file_processed := v_file;
        v_out_test_type  := v_test_type;
        t_field_results := t_empty_field_results; 
        raise e_file_header_format_error;
      else
        v_file_processed := null;
        v_out_test_type  := null;
        t_field_results := t_empty_field_results; 
      end if;
      
    end if;
           
    exception
      when e_file_header_format_error then
        prc_log_status('prc_check_file_header_format(): File header format error with file ' || v_file, 'ERROR-07', v_user_id);
        apex_error.add_error(p_message          => 'File header format error with file ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                     
      when others then
        prc_log_status('prc_check_file_header_format(): File upload error with file ' || sqlerrm || ' ' || v_file, 'ERROR-08', v_user_id);
        apex_error.add_error(p_message          => 'File upload error with file ' || sqlerrm || ' ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                      
      
  end prc_check_file_header_format;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_upload_test_data
  - Purpose:      upload assessment test data to table based on assessment type
  -
  ---------------------------------------------------------------------*/  
  
  procedure prc_upload_test_data (v_district_id varchar2, v_test_type varchar2, v_file varchar2, v_fullpath_file varchar2, v_user_id varchar2)
  is
    type r_act_data is record (
      other_id                    edfidata.district_act_data.other_id%type,   -- High School code, position 205, 6 chars long, 205-210
      line_number                 edfidata.district_act_data.line_number%type,
      last_name                   edfidata.district_act_data.last_name%type,
      first_name                  edfidata.district_act_data.first_name%type,
      mid_init                    edfidata.district_act_data.mid_init%type,
      gender                      edfidata.district_act_data.gender%type,
      birth_date                  edfidata.district_act_data.birth_date%type,
      act_scale_scores_composite  edfidata.district_act_data.act_scale_scores_composite%type,
      act_scale_scores_english    edfidata.district_act_data.act_scale_scores_english%type,
      act_scale_scores_math       edfidata.district_act_data.act_scale_scores_math%type,
      act_scale_scores_reading    edfidata.district_act_data.act_scale_scores_reading%type,
      act_scale_scores_science    edfidata.district_act_data.act_scale_scores_science%type,
      test_date_month_and_year    edfidata.district_act_data.test_date_month_and_year%type,
      grade_level                 edfidata.district_act_data.grade_level%type,
      loaded_date                 edfidata.district_act_data.loaded_date%type,
      district_id                 edfidata.district_act_data.district_id%type,
      file_name                   edfidata.district_act_data.file_name%type
    );
    type tbl_act_data is table of r_act_data index by pls_integer;
    t_act_data tbl_act_data;
    t_empty_act_data tbl_act_data;
    v_file_type varchar2(10);
    idx1 number;
    c_act_row_clob clob;
    n_clob_length number;
    n_act_csv_rec_len number;
    n_minimal_sat_used number := 0;    -- flag for district using minimal fields for SAT
    n_minimal_ap_used number := 0;     -- flag for district using minimal fields for AP
    e_unknown_test_type exception;
  begin
    
    if v_test_type = 'SAT' then
      
      delete edfidata.district_sat_data
      where district_id = v_district_id  
      and file_name = v_file; 
       
      begin
          
        select parameter_value
        into n_minimal_sat_used
        from assessment_config
        where parameter_name = 'minimal_sat_used'
        and parameter_district_id = v_district_id;
        
        exception 
          when no_data_found then
             prc_log_status('prc_upload_test_data(): District ' || v_district_id || ' not enabled to use minimal SAT format', 'WARN-04', v_user_id); 
              
      end;
            
      if n_minimal_sat_used = 1 then       -- district is using minimal fields for SAT
        
        insert into edfidata.district_sat_data
        select 
          col001,  -- ai_code
          col002,  -- name_last
          col003,  -- name_first
          substr(col004,1,1),  -- name_mi
          case 
            -- when instr(col023, '-') > 0 then substr(col023,6,2) ||'/'|| substr(col023,9,2) ||'/'|| substr(col023,1,4)
            when instr(col005, '-') > 0 then to_char(to_date(col005,'YYYY-MM-DD'),'MM/DD/YYYY') -- handles leading zeroes issue
            when instr(col005, '/') > 0 then to_char(to_date(col005,'MM/DD/YYYY'),'MM/DD/YYYY') -- handles leading zeroes issue
            else col005
          end,     -- birth_date  (MM/DD/YYYY)
          col006,  -- latest_sat_total
          col007,  -- latest_sat_ebrw
          col008,  -- latest_sat_math_section
          col009,  -- latest_registration_num
          case 
            when instr(col010, '/') > 0 then to_date(col010, 'MM/DD/YYYY')
            else to_date(col010, 'YYYY-MM-DD')
          end,     -- latest_sat_date - assessment test date                          
          sysdate, -- loaded date
          v_district_id, --- district id
          v_file,  -- file name only
          line_number, -- file line number (line number after file header)
          col011   -- secondary_id - district student id
        from
          apex_application_temp_files f, 
        table
          (
            apex_data_parser.parse
            (
              p_content                     => f.blob_content,
              p_add_headers_row             => 'Y',
              p_max_rows                    => 20000,
              p_skip_rows                   => 1,
              p_store_profile_to_collection => 'FILE_PARSER_COLLECTION',
              p_file_name                   => f.filename 
            ) 
          ) p
        where f.name = v_fullpath_file;   -- fullpath file name here!
      
      else  
      
        insert into edfidata.district_sat_data
        select 
          col001,  -- ai_code
          col006,  -- name_last
          col007,  -- name_first
          substr(col008,1,1),  -- name_mi
          case 
            -- when instr(col023, '-') > 0 then substr(col023,6,2) ||'/'|| substr(col023,9,2) ||'/'|| substr(col023,1,4)
            when instr(col023, '-') > 0 then to_char(to_date(col023,'YYYY-MM-DD'),'MM/DD/YYYY') -- handles leading zeroes issue
            when instr(col023, '/') > 0 then to_char(to_date(col023,'MM/DD/YYYY'),'MM/DD/YYYY') -- handles leading zeroes issue
            else col023
          end,     -- birth_date  (MM/DD/YYYY)
          col047,  -- latest_sat_total
          col048,  -- latest_sat_ebrw
          col049,  -- latest_sat_math_section
          col042,  -- latest_registration_num
          case 
            when instr(col044, '/') > 0 then to_date(col044, 'MM/DD/YYYY')
            else to_date(col044, 'YYYY-MM-DD')
          end,     -- assessment or test date
          sysdate, -- loaded date
          v_district_id, --- district id
          v_file,  -- file name only
          line_number, -- file line number (line number after file header)
          substr(col026,1,15) -- secondary_id
        from
          apex_application_temp_files f, 
          table
            (
              apex_data_parser.parse
              (
                p_content                     => f.blob_content,
                p_add_headers_row             => 'Y',
                p_max_rows                    => 20000,
                p_skip_rows                   => 1,
                p_store_profile_to_collection => 'FILE_PARSER_COLLECTION',
                p_file_name                   => f.filename 
              ) 
            ) p
          where f.name = v_fullpath_file;   -- fullpath file name here!
      
      end if;    
      
    elsif v_test_type = 'TSI' then
    
      delete edfidata.district_tsi_data
      where district_id = v_district_id  
      and file_name = v_file; 
  
      insert into edfidata.district_tsi_data
      select 
        line_number,
        to_date(col001,'MM/DD/YYYY'), -- Test Date
        col002, -- Last Name
        col003, -- First Name
        substr(col004,1,1),  -- Middle Initial
        substr(col005,1,10), -- State Assigned Number -> STUDENT_ID
        case 
          when instr(col006, '-') > 0 then to_char(to_date(col006,'YYYY-MM-DD'),'MM/DD/YYYY') -- handles leading zeroes issue
          when instr(col006, '/') > 0 and length(col006) <= 8 then to_char(to_date(col006,'MM/DD/YY'),'MM/DD/YYYY') -- no century and handles leading zeroes issue     
          when instr(col006, '/') > 0 then to_char(to_date(col006,'MM/DD/YYYY'),'MM/DD/YYYY') -- handles leading zeroes issue 
          else col006
        end,    -- Date of Birth 
        col007, -- Test Site Code -> SITE_ID
        col008, -- Test Site Location -> INST_ID
        col010, -- TSI Math 
        col011, -- TSI Reading
        col012, -- TSI Writing
        col013, -- TSI Write Placer
        null,   -- table column -> ABE_MATHEMATICS_DIAGNOSTICS 
        null,   -- table column -> ABE_WRITING_DIAGNOSTICS
        null,   -- table column -> ABE_READING_DIAGNOSTICS   
        v_district_id,  -- district id
        v_file, -- input file (file name only)
        sysdate -- loaded date
      from
        apex_application_temp_files f, 
      table
        (
          apex_data_parser.parse
          (
            p_content                     => f.blob_content,
            p_add_headers_row             => 'Y',
            p_max_rows                    => 20000,
            p_skip_rows                   => 1,  
            p_store_profile_to_collection => 'FILE_PARSER_COLLECTION',
            p_file_name                   => f.filename 
          ) 
        ) p
      where
        f.name = v_fullpath_file;     -- fullpath file name here!
        
    elsif v_test_type = 'IB' then
      
      delete edfidata.district_ib_data
      where district_id = v_district_id  
      and file_name = v_file;
        
      insert into edfidata.district_ib_data
      select 
        line_number,
        col001,  -- year
        col002,  -- student id
        col003,  -- district id
        case
          when col004 = 'Fall' then '1-Fall'
          when col004 = 'Spring' then '2-Spring'
          when col004 = 'Summer' then '3-Summer'
        end,     -- session
        col005,  -- subject
        col006,  -- exam grade
        col007,  -- predicted grade
        sysdate,  
        v_file  
      from
        apex_application_temp_files f, 
      table
        (
          apex_data_parser.parse
          (
            p_content                     => f.blob_content,
            p_add_headers_row             => 'Y',
            p_max_rows                    => 20000,
            p_skip_rows 		              => 1,
            p_store_profile_to_collection => 'FILE_PARSER_COLLECTION',
            p_file_name                   => f.filename 
          ) 
        ) p
      where
        f.name = v_fullpath_file;     -- fullpath file name here!
        
    elsif v_test_type = 'AP' then
      
      delete edfidata.district_ap_data
      where district_id = v_district_id  
      and file_name = v_file;  
      
      begin
          
        select parameter_value
        into n_minimal_ap_used
        from assessment_config
        where parameter_name = 'minimal_ap_used'
        and parameter_district_id = v_district_id;
        
        exception 
          when no_data_found then
             prc_log_status('prc_upload_test_data(): District ' || v_district_id || ' not enabled to use minimal AP format', 'WARN-05', v_user_id); 
              
      end;
            
      if n_minimal_ap_used = 1 then       -- district is using minimal fields for AP
        
        insert into edfidata.district_ap_data
        select 
          line_number,
          col002, -- last name
          col003, -- first name
          substr(col004,1,1), -- middle initial
          case 
            when instr(col005, '-') > 0 then to_char(to_date(col005,'YYYY-MM-DD'),'MM/DD/YYYY') -- handles leading zeroes issue
            when instr(col005, '/') > 0 and length(col005) <= 8 then to_char(to_date(col005,'MM/DD/YY'),'MM/DD/YYYY') -- no century and handles leading zeroes issue     
            when instr(col005, '/') > 0 then to_char(to_date(col005,'MM/DD/YYYY'),'MM/DD/YYYY') -- handles leading zeroes issue 
            when length(col005) = 5 then to_char(to_date(replace('0' || col005,'"',''),'MMDDYY'),'MM/DD/YYYY') -- handles leading zeroes issue 
            else to_char(to_date(col005,'MMDDYY'),'MM/DD/YYYY') -- no leading zeroes issue exists so do this
          end,    -- DOB   
          case when length(trim(col006)) > 0 then to_date('20'||trim(col006)||'-05-01', 'YYYY-MM-DD') else null end, 
          col007, -- code01
          col008, -- grade01
          case when length(trim(col009)) > 0 then to_date('20'||trim(col009)||'-05-01', 'YYYY-MM-DD') else null end,  
          col010, -- code02
          col011, -- grade02
          case when length(trim(col012)) > 0 then to_date('20'||trim(col012)||'-05-01', 'YYYY-MM-DD') else null end,  
          col013, -- code03
          col014, -- grade03
          case when length(trim(col015)) > 0 then to_date('20'||trim(col015)||'-05-01', 'YYYY-MM-DD') else null end,   
          col016, -- code04
          col017, -- grade04
          case when length(trim(col018)) > 0 then to_date('20'||trim(col018)||'-05-01', 'YYYY-MM-DD') else null end,   
          col019, -- code05
          col020, -- grade05
          case when length(trim(col021)) > 0 then to_date('20'||trim(col021)||'-05-01', 'YYYY-MM-DD') else null end,  
          col022, -- code06
          col023, -- grade06
          case when length(trim(col024)) > 0 then to_date('20'||trim(col024)||'-05-01', 'YYYY-MM-DD') else null end,   
          col025, -- code07
          col026, -- grade07
          case when length(trim(col027)) > 0 then to_date('20'||trim(col027)||'-05-01', 'YYYY-MM-DD') else null end,     
          col028, -- code08
          col029, -- grade08
          case when length(trim(col030)) > 0 then to_date('20'||trim(col030)||'-05-01', 'YYYY-MM-DD') else null end,         
          col031, -- code09
          col032, -- grade09
          case when length(trim(col033)) > 0 then to_date('20'||trim(col033)||'-05-01', 'YYYY-MM-DD') else null end,       
          col034, -- code10
          col035, -- grade10  
          sysdate,  -- loaded_date
          v_district_id,
          v_file  -- file name only
        from
          apex_application_temp_files f, 
        table
          (
            apex_data_parser.parse
            (
              p_content                     => f.blob_content,
              p_add_headers_row             => 'Y',
              p_max_rows                    => 20000,
              p_skip_rows                   => 1,  
              p_store_profile_to_collection => 'FILE_PARSER_COLLECTION',
              p_file_name                   => f.filename 
            ) 
          ) p
        where
          f.name = v_fullpath_file;     -- fullpath file name here!
 
      else   
         
        insert into edfidata.district_ap_data
        select 
          line_number,
          replace(col002,'"',''), -- last name
          replace(col003,'"',''), -- first name
          replace(substr(col004,1,1),'"',''), -- middle initial
          case 
            when instr(replace(col014,'"',''), '-') > 0 then to_char(to_date(replace(col014,'"',''),'YYYY-MM-DD'),'MM/DD/YYYY') -- handles leading zeroes issue
            when instr(replace(col014,'"',''), '/') > 0 and length(replace(col014,'"','')) <= 8 then to_char(to_date(replace(col014,'"',''),'MM/DD/YY'),'MM/DD/YYYY') -- no century and handles leading zeroes issue     
            when instr(replace(col014,'"',''), '/') > 0 then to_char(to_date(replace(col014,'"',''),'MM/DD/YYYY'),'MM/DD/YYYY') -- handles leading zeroes issue 
            when length(col014) = 5 then to_char(to_date(replace('0' || col014,'"',''),'MMDDYY'),'MM/DD/YYYY') -- handles leading zeroes issue 
            else to_char(to_date(replace(col014,'"',''),'MMDDYY'),'MM/DD/YYYY') -- no leading zeroes issue exists so do this
          end,  -- DOB  
          case when length(trim(replace(col059,'"',''))) > 0 then to_date('20'||trim(replace(col059,'"',''))||'-05-01', 'YYYY-MM-DD') else null end, 
          replace(col060,'"',''), -- code01
          replace(col061,'"',''), -- grade01
          case when length(trim(replace(col065,'"',''))) > 0 then to_date('20'||trim(replace(col065,'"',''))||'-05-01', 'YYYY-MM-DD') else null end,  
          replace(col066,'"',''), -- code02
          replace(col067,'"',''), -- grade02
          case when length(trim(replace(col071,'"',''))) > 0 then to_date('20'||trim(replace(col071,'"',''))||'-05-01', 'YYYY-MM-DD') else null end,  
          replace(col072,'"',''), -- code03
          replace(col073,'"',''), -- grade03
          case when length(trim(replace(col077,'"',''))) > 0 then to_date('20'||trim(replace(col077,'"',''))||'-05-01', 'YYYY-MM-DD') else null end,   
          replace(col078,'"',''), -- code04
          replace(col079,'"',''), -- grade04
          case when length(trim(replace(col083,'"',''))) > 0 then to_date('20'||trim(replace(col083,'"',''))||'-05-01', 'YYYY-MM-DD') else null end,   
          replace(col084,'"',''), -- code05
          replace(col085,'"',''), -- grade05
          case when length(trim(replace(col089,'"',''))) > 0 then to_date('20'||trim(replace(col089,'"',''))||'-05-01', 'YYYY-MM-DD') else null end,  
          replace(col090,'"',''), -- code06
          replace(col091,'"',''), -- grade06
          case when length(trim(replace(col095,'"',''))) > 0 then to_date('20'||trim(replace(col095,'"',''))||'-05-01', 'YYYY-MM-DD') else null end,   
          replace(col096,'"',''), -- code07
          replace(col097,'"',''), -- grade07
          case when length(trim(replace(col101,'"',''))) > 0 then to_date('20'||trim(replace(col101,'"',''))||'-05-01', 'YYYY-MM-DD') else null end,     
          replace(col102,'"',''), -- code08
          replace(col103,'"',''), -- grade08
          case when length(trim(replace(col107,'"',''))) > 0 then to_date('20'||trim(replace(col107,'"',''))||'-05-01', 'YYYY-MM-DD') else null end,         
          replace(col108,'"',''), -- code09
          replace(col109,'"',''), -- grade09
          case when length(trim(replace(col113,'"',''))) > 0 then to_date('20'||trim(replace(col113,'"',''))||'-05-01', 'YYYY-MM-DD') else null end,       
          replace(col114,'"',''), -- code10
          replace(col115,'"',''), -- grade10  
          sysdate,  -- loaded_date
          v_district_id,
          v_file  -- file name only
        from
          apex_application_temp_files f, 
        table
          (
            apex_data_parser.parse
            (
              p_content                     => f.blob_content,
              p_add_headers_row             => 'Y',
              p_max_rows                    => 20000,
              p_skip_rows                   => 1,  
              p_store_profile_to_collection => 'FILE_PARSER_COLLECTION',
              p_file_name                   => f.filename 
            ) 
          ) p
        where
          f.name = v_fullpath_file;     -- fullpath file name here!
        
      end if;  
  
    elsif v_test_type = 'ACT' then
      
      delete edfidata.district_temp_act_data
      where district_id = v_district_id  
      and file_name = v_file; 
        
      delete edfidata.district_act_data
      where district_id = v_district_id  
      and file_name = v_file; 

      insert into edfidata.district_temp_act_data
      select 
        col001, 
        sysdate,  
        v_district_id,
        v_file,  -- file name only
        line_number
      from
        apex_application_temp_files f, 
      table
        (
          apex_data_parser.parse
          (
            p_content                     => f.blob_content,
            p_add_headers_row             => 'Y',
            p_max_rows                    => 20000,
            p_skip_rows                   => 0,        -- no header in ACT so do not skip first record as in other tests
            p_store_profile_to_collection => 'FILE_PARSER_COLLECTION',
            p_file_name                   => f.filename 
          ) 
        ) p
      where f.name = v_fullpath_file;   -- fullpath file name here!
       
      -- determine ACT fixed-width or ACT CSV file
      select data_record
      into c_act_row_clob
      from edfidata.district_temp_act_data
      where file_name = v_file
      and rownum = 1; 
       
      n_clob_length := dbms_lob.getlength(c_act_row_clob);
      
      select parameter_value
      into n_act_csv_rec_len
      from assessment_config
      where parameter_name = 'act_csv_rec_len';  
      
      if gn_debug_on = 1 then       -- is global debug variable set?
        prc_log_status('prc_upload_test_data(): ACT file header length for first column is ' || n_clob_length, 'INFO-03', v_user_id);     
      end if;
        
      if n_clob_length > n_act_csv_rec_len then   -- ACT fixed-width file
    
        -- parse CLOB column to get field data
        idx1 := 1;
        for tmptbl in (select data_record, line_number, loaded_date, district_id, file_name 
                       from edfidata.district_temp_act_data
                       where file_name = v_file)
        loop
            t_act_data(idx1).line_number := tmptbl.line_number;
            t_act_data(idx1).other_id := dbms_lob.substr(tmptbl.data_record, 6, 205);      -- High School code, position 205, 6 chars long, 205-210
            t_act_data(idx1).last_name := replace(dbms_lob.substr(tmptbl.data_record, 25, 3),' ','');                
            t_act_data(idx1).first_name := replace(dbms_lob.substr(tmptbl.data_record, 16, 28),' ','');
            t_act_data(idx1).mid_init := dbms_lob.substr(tmptbl.data_record, 1, 44);
            t_act_data(idx1).gender := dbms_lob.substr(tmptbl.data_record, 1, 88);
            t_act_data(idx1).birth_date := substr(dbms_lob.substr(tmptbl.data_record, 6, 101),1,2) || '/' || substr(dbms_lob.substr(tmptbl.data_record, 6, 101),3,2) || '/20' || substr(dbms_lob.substr(tmptbl.data_record, 6, 101),5,2);                  
            t_act_data(idx1).act_scale_scores_composite := dbms_lob.substr(tmptbl.data_record, 2, 269);     
            t_act_data(idx1).act_scale_scores_english := dbms_lob.substr(tmptbl.data_record, 2, 261);       
            t_act_data(idx1).act_scale_scores_math := dbms_lob.substr(tmptbl.data_record, 2, 263);         
            t_act_data(idx1).act_scale_scores_reading := dbms_lob.substr(tmptbl.data_record, 2, 265);      
            t_act_data(idx1).act_scale_scores_science := dbms_lob.substr(tmptbl.data_record, 2, 267);
            t_act_data(idx1).test_date_month_and_year := substr(dbms_lob.substr(tmptbl.data_record, 4, 233),1,2) || '/01/20' || substr(dbms_lob.substr(tmptbl.data_record, 4, 233),3,2);      
            t_act_data(idx1).grade_level := dbms_lob.substr(tmptbl.data_record, 2, 89);
            t_act_data(idx1).loaded_date := tmptbl.loaded_date;
            t_act_data(idx1).district_id := tmptbl.district_id;
            t_act_data(idx1).file_name := tmptbl.file_name;
      
            idx1 := idx1 + 1;
        end loop;
       
        forall idx2 in t_act_data.first..t_act_data.last
          insert into edfidata.district_act_data values t_act_data(idx2);
          
      elsif n_clob_length = 6 then              -- new (as of school year 2021) ACT CSV format, first column header is 8 chars ("ACT ID")
                                                -- ACT CSV created by Assessment Loader is 10 chars ("Other Id")                                    
        insert into edfidata.district_act_data
        select 
          replace(col001,'"',''),                -- other_id
          line_number,                           -- line_number
          replace(col002,'"',''),                -- last_name
          replace(col003,'"',''),                -- first_name
          substr(replace(col004,'"',''),1,1),    -- mid_init
          substr(replace(col008,'"',''),1,1),    -- gender
          to_char(to_date(replace(col006,'"',''),'MM/DD/YYYY'),'MM/DD/YYYY'), -- birth_date or DOB and handles leading zeroes issue
          replace(col009,'"',''),                -- act_scale_scores_composite
          replace(col012,'"',''),                -- act_scale_scores_english 
          replace(col010,'"',''),                -- act_scale_scores_math
          replace(col013,'"',''),                -- act_scale_scores_reading
          replace(col011,'"',''),                -- act_scale_scores_science
          case                                   -- test_date_month_and_year - comes from file in a format like December 2020 or Dec-20
            when substr(replace(col005,'"',''),1,3) = 'Jan' then '01/01/20' || substr(replace(col005,'"',''),-2,2)
            when substr(replace(col005,'"',''),1,3) = 'Feb' then '02/01/20' || substr(replace(col005,'"',''),-2,2)
            when substr(replace(col005,'"',''),1,3) = 'Mar' then '03/01/20' || substr(replace(col005,'"',''),-2,2)
            when substr(replace(col005,'"',''),1,3) = 'Apr' then '04/01/20' || substr(replace(col005,'"',''),-2,2)
            when substr(replace(col005,'"',''),1,3) = 'May' then '05/01/20' || substr(replace(col005,'"',''),-2,2)
            when substr(replace(col005,'"',''),1,3) = 'Jun' then '06/01/20' || substr(replace(col005,'"',''),-2,2)
            when substr(replace(col005,'"',''),1,3) = 'Jul' then '07/01/20' || substr(replace(col005,'"',''),-2,2)           
            when substr(replace(col005,'"',''),1,3) = 'Aug' then '08/01/20' || substr(replace(col005,'"',''),-2,2)
            when substr(replace(col005,'"',''),1,3) = 'Sep' then '09/01/20' || substr(replace(col005,'"',''),-2,2)
            when substr(replace(col005,'"',''),1,3) = 'Oct' then '10/01/20' || substr(replace(col005,'"',''),-2,2)
            when substr(replace(col005,'"',''),1,3) = 'Nov' then '11/01/20' || substr(replace(col005,'"',''),-2,2)
            when substr(replace(col005,'"',''),1,3) = 'Dec' then '12/01/20' || substr(replace(col005,'"',''),-2,2)
          end,               
          substr(replace(col007,'"',''),1,2),    -- grade_level
          sysdate,                               -- loaded_date
          v_district_id,                         -- district_id
          v_file                                 -- file_name
        from
          apex_application_temp_files f, 
        table
          (
            apex_data_parser.parse
            (
              p_content                     => f.blob_content,
              p_add_headers_row             => 'Y',
              p_max_rows                    => 20000,
              p_skip_rows                   => 1,        -- skip first row on ACT CSV file as it has a header
              p_csv_col_delimiter           => ',',
              p_store_profile_to_collection => 'FILE_PARSER_COLLECTION',
              p_file_name                   => f.filename 
            ) 
          ) p
        where f.name = v_fullpath_file;   -- fullpath file name here!
              
      else   -- ACT CSV file
         
        insert into edfidata.district_act_data
        select 
          replace(col001,'"',''),  -- other_id
          line_number,             -- line_number
          replace(col002,'"',''),  -- last_name
          replace(col003,'"',''),  -- first_name
          substr(replace(col004,'"',''),1,1),  -- mid_init
          replace(col005,'"',''),  -- gender
          to_char(to_date(replace(col006,'"',''),'MM/DD/YYYY'),'MM/DD/YYYY'), -- birth_date or DOB and handles leading zeroes issue
          replace(col007,'"',''),  -- act_scale_scores_composite
          replace(col008,'"',''),  -- act_scale_scores_english 
          replace(col009,'"',''),  -- act_scale_scores_math
          replace(col010,'"',''),  -- act_scale_scores_reading
          replace(col011,'"',''),  -- act_scale_scores_science
          replace(col012,'"',''),  -- test_date_month_and_year
          replace(col013,'"',''),  -- grade_level
          sysdate,                 -- loaded_date
          v_district_id,           -- district_id
          v_file                   -- file_name
        from
          apex_application_temp_files f, 
        table
          (
            apex_data_parser.parse
            (
              p_content                     => f.blob_content,
              p_add_headers_row             => 'Y',
              p_max_rows                    => 20000,
              p_skip_rows                   => 1,        -- skip first row on ACT CSV file as it has a header
              p_csv_col_delimiter           => ',',
              p_store_profile_to_collection => 'FILE_PARSER_COLLECTION',
              p_file_name                   => f.filename 
            ) 
          ) p
        where f.name = v_fullpath_file;   -- fullpath file name here!

      end if;    -- end of ACT file type check base on clob length
    
    else 
      raise e_unknown_test_type;
    end if;   -- end of selection of test type
    
    commit;   
   
    exception
        when e_unknown_test_type then
          prc_log_status('prc_upload_test_data(): Test type ' || v_test_type || ' is invalid ' || v_file, 'ERROR-09', v_user_id);  
          apex_error.add_error(p_message          => 'Test type ' || v_test_type || ' is invalid ' || v_file,
                               p_additional_info  => substr(sqlerrm, 1, 200),
                               p_display_location => apex_error.c_inline_with_field_and_notif,
                               p_page_item_name   => '');
          raise;   
        when no_data_found then
          prc_log_status('prc_upload_test_data(): No data found during file upload of file ' || v_file, 'ERROR-10', v_user_id);  
          apex_error.add_error(p_message          => 'No data found during file upload error of file ' || v_file,
                               p_additional_info  => substr(sqlerrm, 1, 200),
                               p_display_location => apex_error.c_inline_with_field_and_notif,
                               p_page_item_name   => '');
          raise;                                  
        when others then
          prc_log_status('prc_upload_test_data(): File upload error with file ' || v_file, 'ERROR-11', v_user_id);  
          apex_error.add_error(p_message          => 'File upload error with file ' || v_file,
                               p_additional_info  => substr(sqlerrm, 1, 200),
                               p_display_location => apex_error.c_inline_with_field_and_notif,
                               p_page_item_name   => '');
          raise;                      
  
  end prc_upload_test_data; 
 
  /*---------------------------------------------------------------------
  - 
  - Function:     fun_get_output_directory
  - Purpose:      function to call prc_get_output_directory (for testing)
  -
  ---------------------------------------------------------------------*/ 

  function fun_get_output_directory (v_district_id varchar2, v_test_type varchar2, v_user_id varchar2)
  return varchar2
  is
    v_output_directory varchar2(100) := 'Not Defined';
  begin  
    
    prc_get_output_directory (v_district_id, v_test_type, v_output_directory, v_user_id);
    return v_output_directory;
    
    exception
      when others then
        return v_output_directory;
        
  end fun_get_output_directory; 
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_get_output_directory
  - Purpose:      get output directory on server for assessment data based 
  -               on assessment type
  -
  ---------------------------------------------------------------------*/  
  
  procedure prc_get_output_directory (v_district_id varchar2, v_test_type varchar2, v_output_directory out varchar2, v_user_id varchar2)
  is 
  begin  
  
    select output_directory
    into v_output_directory
    from edfidata.district_output_dir
    where district_id = v_district_id
    and test_type = v_test_type;
    
    exception 
      when no_data_found then
        prc_log_status('prc_get_output_directory(): No output directory defined for district ' || v_district_id, 'ERROR-12', v_user_id);  
        apex_error.add_error(p_message          => 'No output directory defined for district ' || v_district_id,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                      
      when others then
        prc_log_status('prc_get_output_directory(): Get output directory error for district ' || v_district_id, 'ERROR-13', v_user_id);  
        apex_error.add_error(p_message          => 'Get output directory error for district ' || v_district_id,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                      
            
  end prc_get_output_directory;
  
  /*---------------------------------------------------------------------
  - 
  - Function:     fun_get_database_dblink
  - Purpose:      function to call prc_get_database_dblink (for testing)
  -
  ---------------------------------------------------------------------*/ 
  
  function fun_get_database_dblink (v_district_id varchar2, v_link_target_db varchar2, v_user_id varchar2) 
  return varchar2
  is
    v_db_link varchar2(100) := 'Not Defined';
  begin  
    
    prc_get_database_dblink (v_district_id, v_db_link, v_link_target_db, v_user_id);
    return v_db_link;
    
    exception
      when others then
        return v_db_link;
 
  end fun_get_database_dblink;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_get_database_dblink
  - Purpose:      get dblink to SQL Server database(s) based on district
  -
  ---------------------------------------------------------------------*/  
  
  procedure prc_get_database_dblink (v_district_id varchar2, v_db_link out varchar2, v_link_target_db varchar2, v_user_id varchar2)
  is 
    e_invalid_target_db exception;
  begin  
  
    if v_link_target_db not in ('ODS', 'IMPORT') then
      raise e_invalid_target_db;
    end if;
    
    select trim(db_link)
    into v_db_link
    from edfidata.district_db_link
    where district_id = v_district_id
    and target_db = v_link_target_db;
 
    exception 
      when no_data_found then
        prc_log_status('prc_get_database_dblink(): No dblink defined for ' || v_link_target_db || ' for district ' || v_district_id, 'ERROR-14', v_user_id);  
        apex_error.add_error(p_message          => 'No dblink defined for ' || v_link_target_db || ' for district ' || v_district_id,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise; 
      when e_invalid_target_db then
        prc_log_status('prc_get_database_dblink(): Invalid target dblink ' || v_link_target_db || ' for district ' || v_district_id, 'ERROR-23', v_user_id);  
        apex_error.add_error(p_message          => 'Invalid target dblink ' || v_link_target_db || ' for district ' || v_district_id,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                           
      when others then
        prc_log_status('prc_get_database_dblink(): Get dblink error for ' || v_link_target_db || ' for district ' || v_district_id, 'ERROR-15', v_user_id);
        apex_error.add_error(p_message          => 'Get dblink error for ' || v_link_target_db || ' for district ' || v_district_id,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                      
                       
  end prc_get_database_dblink;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_process_sat_data_output
  - Purpose:      retrieve, modify and output SAT data to server file
  -
  ---------------------------------------------------------------------*/  
  
  procedure prc_process_sat_data_output (v_db_link varchar2, v_file varchar2, n_rows_with_stu_id out number, v_output_directory varchar2, v_user_id varchar2)
  is
    type r_sat_data is record (
      StudentUniqueId           varchar2(10),
      ai_code                   edfidata.district_sat_data.ai_code%type,
      latest_assessment_date    edfidata.district_sat_data.latest_assessment_date%type,
      latest_sat_total          edfidata.district_sat_data.latest_sat_total%type,
      latest_sat_math_section   edfidata.district_sat_data.latest_sat_math_section%type,
      latest_sat_ebrw           edfidata.district_sat_data.latest_sat_ebrw%type
    );
    type tbl_sat_data is table of r_sat_data index by pls_integer;
    t_sat_data tbl_sat_data;
    t_empty_sat_data tbl_sat_data;
    s_sql_select_data varchar2(1000);
    s_sql_close_db_link varchar2(200);
    f_output utl_file.file_type;
    n_minimal_sat_used number := 0;
    e_zero_rows exception;
  begin 
    
    begin
          
      select parameter_value
      into n_minimal_sat_used
      from assessment_config
      where parameter_name = 'minimal_sat_used'
      and parameter_district_id = substr(v_file,1,6);
        
      exception 
        when no_data_found then
           prc_log_status('prc_process_sat_data_output: District ' || substr(v_file,1,6) || ' not enabled to use minimal SAT format', 'WARN-06', v_user_id); 
              
    end;
   
    if n_minimal_sat_used = 1 then
      
      s_sql_select_data := 'select distinct 
         stu."StudentUniqueId"
         ,ai_code
         ,latest_assessment_date
         ,latest_sat_total
         ,latest_sat_math_section
         ,latest_sat_ebrw
        from edfidata.district_sat_data s join edfi.v_StudentIds@' || v_db_link || ' stu ' ||
      ' on s.file_name = ' || '''' || v_file || '''' ||
      ' and s.secondary_id = stu."LocalCode"'; -- handles leading zeroes issue    
    
    else
      
      s_sql_select_data := 'select distinct 
         stu."StudentUniqueId"
         ,ai_code
         ,latest_assessment_date
         ,latest_sat_total
         ,latest_sat_math_section
         ,latest_sat_ebrw
        from edfidata.district_sat_data s join edfi.v_StudentIds@' || v_db_link || ' stu ' ||
      ' on s.file_name = ' || '''' || v_file || '''' ||
      ' and upper(s.first_name) = upper(stu."FirstName")
      and upper(s.last_name) = upper(stu."LastSurname")
      and to_char(to_date(s.birth_date,''MM/DD/YYYY''),''MM/DD/YYYY'') = to_char(stu."BirthDate", ''MM/DD/YYYY'')'; -- handles leading zeroes issue    
    
    end if;
            
    execute immediate s_sql_select_data bulk collect into t_sat_data;
    commit;    -- due to distributed transaction over dblink
      
    s_sql_close_db_link :=  'alter session close database link ' || v_db_link;
    execute immediate s_sql_close_db_link;
 
    -- test for 0 rows found for students in ODS and raise exception if 0,
    -- otherwise, save count of rows with student ids found
    if t_sat_data.count = 0 then  
      raise e_zero_rows;
    else
      n_rows_with_stu_id := t_sat_data.count; 
    end if;
   
    -- open output file
    f_output := utl_file.fopen(v_output_directory, v_file, 'w');
    -- write file header to server (maybe get column names from ASSESSMENT_STANDARD_FORMAT table?) 
    utl_file.put_line(f_output,'StudentID,AI_Code,LATEST_ASSESSMENT_DATE,LATEST_SAT_TOTAL,LATEST_SAT_MATH_SECTION,LATEST_SAT_EBRW');
  
    -- write contents from table to file on server
    for i in 1 .. t_sat_data.count loop
      utl_file.put(f_output,t_sat_data(i).StudentUniqueId || ',');                       
      utl_file.put(f_output,t_sat_data(i).ai_code || ',');
      if instr(t_sat_data(i).latest_assessment_date, '/') > 0 then
        utl_file.put(f_output,t_sat_data(i).latest_assessment_date || ',');       
      else
        utl_file.put(f_output,to_char(to_date(t_sat_data(i).latest_assessment_date,'DD-MON-YY'),'MM/DD/YYYY') || ',');
      end if;  
      utl_file.put(f_output,t_sat_data(i).latest_sat_total || ',');
      utl_file.put(f_output,t_sat_data(i).latest_sat_math_section || ',');
      utl_file.put(f_output,t_sat_data(i).latest_sat_ebrw);
      utl_file.put(f_output,chr(10));
      utl_file.fflush(f_output);
    end loop;  -- end output to file loop
      
    t_sat_data := t_empty_sat_data;
    utl_file.fflush(f_output);
    utl_file.fclose(f_output);
    commit;    -- due to distributed transaction over dblink  

    exception
      when e_zero_rows then
        prc_log_status('prc_process_sat_data_output(): Zero matching student records found in ODS for file ' || v_file, 'ERROR-30', v_user_id); 
        apex_error.add_error(p_message          => 'Zero matching student records found in ODS for file ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise; 
      when others then
        prc_log_status('prc_process_sat_data_output(): Unkwown error with data in file ' || v_file, 'ERROR-31', v_user_id);
        apex_error.add_error(p_message          => 'Unkwown error with data in file ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;         
             
  end prc_process_sat_data_output;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_process_tsi_data_output
  - Purpose:      retrieve, modify and output TSI data to server file
  -
  ---------------------------------------------------------------------*/ 
  
  procedure prc_process_tsi_data_output (v_db_link varchar2, v_file varchar2, n_rows_with_stu_id out number, v_output_directory varchar2, v_user_id varchar2)
  is
    type r_tsi_data is record (
      StudentUniqueId           varchar2(10),
      test_start                edfidata.district_tsi_data.test_start%type,
      tsi_mathematics_placement edfidata.district_tsi_data.tsi_mathematics_placement%type,
      tsi_reading_placement     edfidata.district_tsi_data.tsi_reading_placement%type,
      tsi_writing_placement     edfidata.district_tsi_data.tsi_writing_placement%type,
      tsi_writeplacer           edfidata.district_tsi_data.tsi_writeplacer%type
    );
    type tbl_tsi_data is table of r_tsi_data index by pls_integer;
    t_tsi_data tbl_tsi_data;
    t_empty_tsi_data tbl_tsi_data;
    s_sql_select_data varchar2(4000);
    s_sql_count_stu_ids varchar2(4000);
    s_sql_close_db_link varchar2(200);
    f_output utl_file.file_type;
    e_zero_rows exception;
  begin  
    s_sql_select_data := 'select 
       stu."StudentUniqueId"
       ,test_start
       ,tsi_mathematics_placement
       ,tsi_reading_placement
       ,tsi_writing_placement
       ,tsi_writeplacer
      from edfidata.district_tsi_data s join edfi.v_StudentIds@' || v_db_link || ' stu ' ||
      ' on file_name = ' || '''' || v_file || '''' ||
      ' and coalesce(s.student_id, ''0'') = stu."StudentUniqueId"
      union
      select 
       stu."StudentUniqueId"
       ,test_start
       ,tsi_mathematics_placement
       ,tsi_reading_placement
       ,tsi_writing_placement
       ,tsi_writeplacer
      from edfidata.district_tsi_data s join edfi.v_StudentIds@' || v_db_link || ' stu ' ||
      ' on file_name = ' || '''' || v_file || '''' ||
      ' and (upper(s.first_name) = upper(stu."FirstName")
      and upper(s.last_name) = upper(substr(stu."LastSurname",1,length(s.last_name))) 
      and to_char(to_date(s.birth_date,''MM/DD/YYYY''),''MM/DD/YYYY'') = to_char(stu."BirthDate", ''MM/DD/YYYY''))'; -- handles leading zeroes issue 
            
    execute immediate s_sql_select_data bulk collect into t_tsi_data;
    commit;    -- due to distributed transaction over dblink
      
    s_sql_close_db_link :=  'alter session close database link ' || v_db_link;
    execute immediate s_sql_close_db_link;
   
    -- test for 0 rows found for students in ODS and raise exception if 0,
    -- otherwise, save count of rows with student ids found
    if t_tsi_data.count = 0 then
      raise e_zero_rows;
    else
        s_sql_count_stu_ids := 'select count(distinct("StudentUniqueId")) 
        from (select 
        stu."StudentUniqueId"
       ,test_start
       ,tsi_mathematics_placement
       ,tsi_reading_placement
       ,tsi_writing_placement
       ,tsi_writeplacer
      from edfidata.district_tsi_data s join edfi.v_StudentIds@' || v_db_link || ' stu ' ||
      ' on file_name = ' || '''' || v_file || '''' ||
      ' and coalesce(s.student_id, ''0'') = stu."StudentUniqueId"
      union
      select 
       stu."StudentUniqueId"
       ,test_start
       ,tsi_mathematics_placement
       ,tsi_reading_placement
       ,tsi_writing_placement
       ,tsi_writeplacer
      from edfidata.district_tsi_data s join edfi.v_StudentIds@' || v_db_link || ' stu ' ||
      ' on file_name = ' || '''' || v_file || '''' ||
      ' and (upper(s.first_name) = upper(stu."FirstName")
      and upper(s.last_name) = upper(substr(stu."LastSurname",1,length(s.last_name))) 
      and to_char(to_date(s.birth_date,''MM/DD/YYYY''),''MM/DD/YYYY'') = to_char(stu."BirthDate", ''MM/DD/YYYY'')))';
    
      execute immediate s_sql_count_stu_ids into n_rows_with_stu_id;
      commit;    -- due to distributed transaction over dblink
      
      execute immediate s_sql_close_db_link;
    end if;
   
    -- open output file
    f_output := utl_file.fopen(v_output_directory, v_file, 'w');
    -- write file header to server (maybe get column names from ASSESSMENT_STANDARD_FORMAT table?)  
    utl_file.put_line(f_output,'Student_ID,Administration_Date,TSI_Mathematics_Placement,TSI_Reading_Placement,TSI_Writing_Placement,TSI_Essay_Placement');
  
    -- write contents from table to file on server
    for i in 1 .. t_tsi_data.count loop 
      utl_file.put(f_output,t_tsi_data(i).StudentUniqueId || ','); 
      if instr(t_tsi_data(i).test_start, '/') > 0 then
        utl_file.put(f_output,t_tsi_data(i).test_start || ',');       
      else
        utl_file.put(f_output,to_char(to_date(t_tsi_data(i).test_start,'DD-MON-YY'),'MM/DD/YYYY') || ',');
      end if;                       
      utl_file.put(f_output,t_tsi_data(i).tsi_mathematics_placement || ',');
      utl_file.put(f_output,t_tsi_data(i).tsi_reading_placement || ',');
      utl_file.put(f_output,t_tsi_data(i).tsi_writing_placement || ',');
      utl_file.put(f_output,t_tsi_data(i).tsi_writeplacer);
      utl_file.put(f_output,chr(10));
      utl_file.fflush(f_output);     -- add flush to ensure all recs written
    end loop;  -- end output to file loop
      
    t_tsi_data := t_empty_tsi_data;
    utl_file.fflush(f_output);       -- add flush to ensure all recs written
    utl_file.fclose(f_output);
    commit;  -- due to distributed transaction over dblink 
    
    exception
      when e_zero_rows then
        prc_log_status('prc_process_tsi_data_output(): Zero matching student records found in ODS for file ' || v_file, 'ERROR-32', v_user_id); 
        apex_error.add_error(p_message          => 'Zero matching student records found in ODS for file ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise; 
      when others then
        prc_log_status('prc_process_tsi_data_output(): Unkwown error with data in file ' || v_file, 'ERROR-33', v_user_id);
        apex_error.add_error(p_message          => 'Unkwown error with data in file ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise; 
     
  end prc_process_tsi_data_output;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_process_act_data_output
  - Purpose:      retrieve, modify and output ACT data to server file
  -
  ---------------------------------------------------------------------*/ 
  
  procedure prc_process_act_data_output (v_db_link varchar2, v_file varchar2, n_rows_with_stu_id out number, v_output_directory varchar2, v_user_id varchar2)
  is
    type r_act_data is record (
      StudentUniqueId             varchar2(10),
      other_id                    edfidata.district_act_data.other_id%type,   -- High School code, position 205, 6 chars long, 205-210
      last_name                   edfidata.district_act_data.last_name%type,
      first_name                  edfidata.district_act_data.first_name%type,
      mid_init                    edfidata.district_act_data.mid_init%type,
      gender                      edfidata.district_act_data.gender%type,
      birth_date                  edfidata.district_act_data.birth_date%type,
      act_scale_scores_composite  edfidata.district_act_data.act_scale_scores_composite%type,
      act_scale_scores_english    edfidata.district_act_data.act_scale_scores_english%type,
      act_scale_scores_math       edfidata.district_act_data.act_scale_scores_math%type,
      act_scale_scores_reading    edfidata.district_act_data.act_scale_scores_reading%type,
      act_scale_scores_science    edfidata.district_act_data.act_scale_scores_science%type,
      test_date_month_and_year    edfidata.district_act_data.test_date_month_and_year%type,
      grade_level                 edfidata.district_act_data.grade_level%type
    );
    type tbl_act_data is table of r_act_data index by pls_integer;
    t_act_data tbl_act_data;
    t_empty_act_data tbl_act_data;
    s_sql_select_data varchar2(1000);
    s_sql_close_db_link varchar2(200);
    f_output utl_file.file_type;
    e_zero_rows exception;
  begin  
    s_sql_select_data := 'select distinct
       stu."StudentUniqueId"
       ,s.other_id 
       ,s.last_name
       ,s.first_name
       ,s.mid_init
       ,s.gender
       ,s.birth_date
       ,s.act_scale_scores_composite
       ,s.act_scale_scores_english
       ,s.act_scale_scores_math
       ,s.act_scale_scores_reading
       ,s.act_scale_scores_science
       ,s.test_date_month_and_year
       ,s.grade_level       
      from edfidata.district_act_data s join edfi.v_StudentIds@' || v_db_link || ' stu ' ||
      ' on file_name = ' || '''' || v_file || '''' ||
      ' and trim(upper(s.first_name)) = upper(stu."FirstName")
      and trim(upper(s.last_name)) = upper(stu."LastSurname")
      and trim(s.birth_date) = to_char(stu."BirthDate", ''MM/DD/YYYY'')';     
            
    execute immediate s_sql_select_data bulk collect into t_act_data;
    commit;    -- due to distributed transaction over dblink
      
    s_sql_close_db_link :=  'alter session close database link ' || v_db_link;
    execute immediate s_sql_close_db_link;
  
    -- test for 0 rows found for students in ODS and raise exception if 0,
    -- otherwise, save count of rows with student ids found
    if t_act_data.count = 0 then
      raise e_zero_rows;
    else
      n_rows_with_stu_id := t_act_data.count;
    end if;
   
    -- open output file
    f_output := utl_file.fopen(v_output_directory, v_file, 'w');
    -- write file header to server (NOTE: there is no file header in the ACT raw data file)  
    utl_file.put_line(f_output,'TX_Unique_Student_ID,Other_ID,Last,First,Mid_Init,Gender,Date_of_Birth,File,ACT_Scale_Scores_Composite,ACT_Scale_Scores_English,ACT_Scale_Scores_Math,ACT_Scale_Scores_Reading,ACT_Scale_Scores_Science,Test_Date_Month_and_Year,Grade_Level');
  
    -- write contents from table to file on server
    for i in 1 .. t_act_data.count loop
      utl_file.put(f_output,t_act_data(i).StudentUniqueId || ','); 
      utl_file.put(f_output,t_act_data(i).other_id || ',');                 -- High School code, position 205, 6 chars long, 205-210
      utl_file.put(f_output,t_act_data(i).last_name || ','); 
      utl_file.put(f_output,t_act_data(i).first_name || ',');
      utl_file.put(f_output,t_act_data(i).mid_init || ','); 
      utl_file.put(f_output,t_act_data(i).gender || ',');
      utl_file.put(f_output,t_act_data(i).birth_date || ','); 
      utl_file.put(f_output,'act,'); 
      utl_file.put(f_output,t_act_data(i).act_scale_scores_composite || ',');
      utl_file.put(f_output,t_act_data(i).act_scale_scores_english || ',');
      utl_file.put(f_output,t_act_data(i).act_scale_scores_math || ',');
      utl_file.put(f_output,t_act_data(i).act_scale_scores_reading || ',');
      utl_file.put(f_output,t_act_data(i).act_scale_scores_science || ',');
      utl_file.put(f_output,t_act_data(i).test_date_month_and_year || ',');
      utl_file.put(f_output,t_act_data(i).grade_level);
      utl_file.put(f_output,chr(10));
      utl_file.fflush(f_output);     -- add flush to ensure all recs written
    end loop;  -- end output to file loop
      
    t_act_data := t_empty_act_data;
    utl_file.fflush(f_output);
    utl_file.fclose(f_output);
    commit;  -- due to distributed transaction over dblink 
    
    exception
      when e_zero_rows then
        prc_log_status('prc_process_act_data_output(): Zero matching student records found in ODS for file ' || v_file, 'ERROR-34', v_user_id); 
        apex_error.add_error(p_message          => 'Zero matching student records found in ODS for file ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise; 
      when others then
        prc_log_status('prc_process_act_data_output(): Unkwown error with data in file ' || v_file, 'ERROR-35', v_user_id);
        apex_error.add_error(p_message          => 'Unkwown error with data in file ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise; 
      
  end prc_process_act_data_output;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_process_ap_data_output
  - Purpose:      retrieve, modify and output AP data to server file
  -
  ---------------------------------------------------------------------*/ 
  
  procedure prc_process_ap_data_output (v_db_link varchar2, v_file varchar2, n_rows_with_stu_id out number, v_output_directory varchar2, v_user_id varchar2)
  is
    type r_ap_data is record (
      StudentUniqueId  varchar2(10),
      year        edfidata.district_ap_data.admin_year_01%type,
      code        edfidata.district_ap_data.exam_code_01%type,
      score       edfidata.district_ap_data.exam_score_01%type
    );
    type tbl_ap_data is table of r_ap_data index by pls_integer;
    t_ap_data tbl_ap_data;
    t_empty_ap_data tbl_ap_data;
    s_sql_select_data varchar2(2000);
    s_sql_count_stu_ids varchar2(1000);
    s_sql_close_db_link varchar2(200);
    f_output utl_file.file_type;
    e_zero_rows exception;
  begin  
    -- since AP is pivoted, there is 1 row per student   
    s_sql_select_data := 'select distinct stu."StudentUniqueId", year, code, score
                          from (select last_name, first_name, birth_date, year, code, score
                                from edfidata.district_ap_data
                                unpivot exclude nulls ((year,code,score)
                                for ap_recs in (
                                  (admin_year_01, exam_code_01, exam_score_01) as ''test1'',
                                  (admin_year_02, exam_code_02, exam_score_02) as ''test2'', 
                                  (admin_year_03, exam_code_03, exam_score_03) as ''test3'',
                                  (admin_year_04, exam_code_04, exam_score_04) as ''test4'',
                                  (admin_year_05, exam_code_05, exam_score_05) as ''test5'',
                                  (admin_year_06, exam_code_06, exam_score_06) as ''test6'', 
                                  (admin_year_07, exam_code_07, exam_score_07) as ''test7'',
                                  (admin_year_08, exam_code_08, exam_score_08) as ''test8'',
                                  (admin_year_09, exam_code_09, exam_score_09) as ''test9'',
                                  (admin_year_10, exam_code_10, exam_score_10) as ''test10''
                                )) where file_name = ' || '''' || v_file || '''' ||') s, edfi.v_StudentIds@' || v_db_link || ' stu ' ||
                                ' where upper(s.first_name) = upper(stu."FirstName")
                                  and upper(s.last_name) = upper(stu."LastSurname")
                                  and s.birth_date = to_char(stu."BirthDate", ''MM/DD/YYYY'')';     
            
    execute immediate s_sql_select_data bulk collect into t_ap_data;
    commit;    -- due to distributed transaction over dblink
      
    s_sql_close_db_link :=  'alter session close database link ' || v_db_link;
    execute immediate s_sql_close_db_link;
   
    -- test for 0 rows found for students in ODS and raise exception if 0,
    -- otherwise, save count of rows with student ids found
    if t_ap_data.count = 0 then
      raise e_zero_rows;
    else
      s_sql_count_stu_ids := 'select count(distinct stu."StudentUniqueId")
                              from (select last_name, first_name, birth_date, year, code, score
                                    from edfidata.district_ap_data
                                    unpivot exclude nulls ((year,code,score)
                                    for ap_recs in ((admin_year_01, exam_code_01, exam_score_01) as ''test1'')) 
                                      where file_name = ' || '''' || v_file || '''' ||') s, edfi.v_StudentIds@' || v_db_link || ' stu ' || '
                               where upper(s.first_name) = upper(stu."FirstName")
                               and upper(s.last_name) = upper(stu."LastSurname")
                               and s.birth_date = to_char(stu."BirthDate", ''MM/DD/YYYY'')';     
            
      execute immediate s_sql_count_stu_ids into n_rows_with_stu_id;
      commit;    -- due to distributed transaction over dblink
      
      execute immediate s_sql_close_db_link;
    
    end if;
   
    -- open output file
    f_output := utl_file.fopen(v_output_directory, v_file, 'w');
    -- write file header to server (maybe get column names from ASSESSMENT_STANDARD_FORMAT table?)  
    utl_file.put_line(f_output,'Student_ID,Administration_Date,code,score');
  
    -- write contents from table to file on server
    for i in 1 .. t_ap_data.count loop
      utl_file.put(f_output,t_ap_data(i).StudentUniqueId || ','); 
      utl_file.put(f_output,to_char(t_ap_data(i).year, 'MM/DD/YYYY') || ',');         
      utl_file.put(f_output,ltrim(t_ap_data(i).code,'0') || ',');
      utl_file.put(f_output,t_ap_data(i).score);
      utl_file.put(f_output,chr(10));
      utl_file.fflush(f_output);     -- add flush to ensure all recs written
    end loop;  -- end output to file loop
      
    t_ap_data := t_empty_ap_data;
    utl_file.fflush(f_output);
    utl_file.fclose(f_output);
    commit;    -- due to distributed transaction over dblink 
    
    exception
      when e_zero_rows then
        prc_log_status('prc_process_ap_data_output(): Zero matching student records found in ODS for file ' || v_file, 'ERROR-36', v_user_id); 
        apex_error.add_error(p_message          => 'Zero matching student records found in ODS for file ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise; 
      when others then
        prc_log_status('prc_process_ap_data_output(): Unkwown error with data in file ' || v_file, 'ERROR-37', v_user_id);
        apex_error.add_error(p_message          => 'Unkwown error with data in file ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise; 
     
  end prc_process_ap_data_output;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_process_ib_data_output
  - Purpose:      retrieve, modify and output IB data to server file
  -
  ---------------------------------------------------------------------*/ 
  
  procedure prc_process_ib_data_output (v_db_link varchar2, v_file varchar2, n_rows_with_stu_id out number, v_output_directory varchar2, v_user_id varchar2)
  is
    type r_ib_data is record (
      StudentUniqueId           varchar2(10),
      admin_year                edfidata.district_ib_data.year%type,
      subject                   edfidata.district_ib_data.subject%type,
      exam_grade                edfidata.district_ib_data.subject%type
    );
    type tbl_ib_data is table of r_ib_data index by pls_integer;
    t_ib_data tbl_ib_data;
    t_empty_ib_data tbl_ib_data;
    s_sql_select_data varchar2(1000);
    s_sql_close_db_link varchar2(200);
    f_output utl_file.file_type;
    e_zero_rows exception;
  begin  
    s_sql_select_data := 'select distinct 
         stu."StudentUniqueId"
         ,year
         ,subject
         ,exam_grade
      from edfidata.district_ib_data s join edfi.v_StudentIds@' || v_db_link || ' stu ' ||
      ' on file_name = ' || '''' || v_file || '''' ||
      ' and s.student_id = stu."LocalCode"';     
            
    execute immediate s_sql_select_data bulk collect into t_ib_data;
    commit;    -- due to distributed transaction over dblink
      
    s_sql_close_db_link :=  'alter session close database link ' || v_db_link;
    execute immediate s_sql_close_db_link;
   
    -- test for 0 rows found for students in ODS and raise exception if 0,
    -- otherwise, save count of rows with student ids found
    if t_ib_data.count = 0 then
      raise e_zero_rows;
    else
      n_rows_with_stu_id := t_ib_data.count;
    end if;
   
    -- open output file
    f_output := utl_file.fopen(v_output_directory, v_file, 'w');
    -- write file header to server (maybe get column names from ASSESSMENT_STANDARD_FORMAT table?)  
    utl_file.put_line(f_output,'Student_ID,Administration_Date,Subject,Exam_Grade');
  
    -- write contents from table to file on server
    for i in 1 .. t_ib_data.count loop
      utl_file.put(f_output,t_ib_data(i).StudentUniqueId || ','); 
      utl_file.put(f_output,'04/01/' || t_ib_data(i).admin_year || ',');
      utl_file.put(f_output,t_ib_data(i).subject || ',');
      utl_file.put(f_output,t_ib_data(i).exam_grade);
      utl_file.put(f_output,chr(10));
      utl_file.fflush(f_output);     -- add flush to ensure all recs written
    end loop;  -- end output to file loop
      
    t_ib_data := t_empty_ib_data;
    utl_file.fflush(f_output);
    utl_file.fclose(f_output);
    commit;    -- due to distributed transaction over dblink 
    
    exception
      when e_zero_rows then
        prc_log_status('prc_process_ib_data_output(): Zero matching student records found in ODS for file ' || v_file, 'ERROR-38', v_user_id); 
        apex_error.add_error(p_message          => 'Zero matching student records found in ODS for file ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise; 
      when others then
        prc_log_status('prc_process_ib_data_output(): Unkwown error with data in file ' || v_file, 'ERROR-39', v_user_id);
        apex_error.add_error(p_message          => 'Unkwown error with data in file ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise; 
     
  end prc_process_ib_data_output;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_get_and_output_file_data
  - Purpose:      call data-to-file processing procedure based on assesssment type
  -
  ---------------------------------------------------------------------*/ 
 
  procedure prc_get_and_output_file_data (v_test_type varchar2, v_db_link varchar2, v_file varchar2, n_rows_with_stu_id out number, v_output_directory varchar2, v_user_id varchar2)
  is
    s_sql_select_data varchar2(1000);
    s_sql_close_db_link varchar2(200);
    f_output utl_file.file_type;
    e_unknown_test_type exception;
  begin 
    
    if v_test_type = 'SAT' then
      prc_process_sat_data_output (v_db_link, v_file, n_rows_with_stu_id, v_output_directory, v_user_id);
    elsif v_test_type = 'TSI' then
      prc_process_tsi_data_output (v_db_link, v_file, n_rows_with_stu_id, v_output_directory, v_user_id);
    elsif v_test_type = 'IB' then
      prc_process_ib_data_output (v_db_link, v_file, n_rows_with_stu_id, v_output_directory, v_user_id); 
    elsif v_test_type = 'AP' then
      prc_process_ap_data_output (v_db_link, v_file, n_rows_with_stu_id, v_output_directory, v_user_id);
    elsif v_test_type = 'ACT' then
      prc_process_act_data_output (v_db_link, v_file, n_rows_with_stu_id, v_output_directory, v_user_id);
    else
      raise e_unknown_test_type;
    end if;
        
    exception
      when e_unknown_test_type then
        prc_log_status('prc_get_and_output_file_data(): Test type ' || v_test_type || ' is invalid for file ' || v_file, 'ERROR-17', v_user_id); 
        apex_error.add_error(p_message          => 'Test type ' || v_test_type || ' is invalid for file ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                      
      when others then
        utl_file.fclose(f_output);
        prc_log_status('prc_get_and_output_file_data(): Get output data file error for file ' || v_file || ', assessment type ' || v_test_type, 'ERROR-19', v_user_id); 
        apex_error.add_error(p_message          => 'Get output data file error for file ' || v_file || ', assessment type ' || v_test_type,
                             p_additional_info  => substr(sqlerrm, 1, 200),      
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');    
        raise;                      
 
  end prc_get_and_output_file_data;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_reset_and_run_import_agent
  - Purpose:      reset and run data importer agent on ODS Import server
  -
  - NOTE:         running data importer agent on-demand is not enabled
  -               data importer agent is run via scheduler on ODS Import server
  -
  ---------------------------------------------------------------------*/ 
  
  procedure prc_reset_and_run_import_agent (v_db_link varchar2, v_user_id varchar2)
  is
     s_sql_call_reset_agent varchar2(200);
     s_sql_close_db_link varchar2(200);
  begin
    
    -- reset data import agent via Agents table by setting last_execution column to NULL, choose correct dblink for district
    -- (a) added commit at end of anonymous block that calls sp_reset_agent -- TE 12/17/20
    -- (b) don't know for certain why but I need to do this call more than once to reset the agent,
    --     possibly a lock conflict with SQL Server -- TE 12/17/20
    for n_counter in 1..5
    loop
      s_sql_call_reset_agent := 'declare retcode number(8); begin retcode := dbms_hs_passthrough.execute_immediate@' || v_db_link || '(''exec sp_reset_agent''); commit; end;';
      execute immediate s_sql_call_reset_agent;  
      commit;   -- due to distributed transaction over dblink, releases lock on SQL Server table dbo.Agents
    end loop;
             
    -- start import (NOT ENABLED AT THIS TIME -- using Task Scheduler on EdFi Data Import Windows Server)
    -- n_rtn_code := dbms_hs_passthrough.execute_immediate@edfi_garland_import.region10.org('exec sp_run_agent');
    -- commit;
    
    -- close dblink 
    -- NOTE: active dblinks are limited by a system parameter and failure to close the dblinks will increase the probability of 
    -- the app throwing the error ORA-00604: error occurred at recursive SQL level 3 ORA-02020: too many database links in use 
    s_sql_close_db_link :=  'alter session close database link ' ||  v_db_link;
    execute immediate s_sql_close_db_link;
    
    exception
      when others then
        prc_log_status('prc_reset_and_run_import_agent(): Error with import agent reset or run', 'ERROR-20', v_user_id);
        apex_error.add_error(p_message          => 'Error with import agent reset or run',
                             p_additional_info  => substr(sqlerrm, 1, 200),   
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                           
 
  end prc_reset_and_run_import_agent;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_delete_old_imported_files
  - Purpose:      delete files from server based on retention period
  -
  ---------------------------------------------------------------------*/  
  
  procedure prc_delete_old_imported_files (v_district_id varchar2, v_output_directory varchar2, v_user_id varchar2)
  is
    type r_filename_data is record (
      filename varchar2(100)
    );  
    type tbl_filename_data is table of r_filename_data index by pls_integer;
    t_filename_data tbl_filename_data;
    n_file_days_old number(8);
    s_sql_files_to_delete varchar2(1000);
    l_file_exists boolean;
    l_file_len number(10);
    l_byte_size number(10);
    v_db_link varchar2(100);
  begin
    
    begin
      begin
        select parameter_value
        into n_file_days_old
        from assessment_config
        where parameter_name = 'file_days_old';
        
        exception
          when no_data_found then   -- use default of 30 days
            prc_log_status('prc_delete_old_imported_files(): File_days_old config parameter not set, using default of 30 days', 'WARN-01', v_user_id); 
            n_file_days_old := 30;
      end;  
      
      prc_get_database_dblink (v_district_id, v_db_link, 'IMPORT', v_user_id);  
    
      -- "loaded" greater than assessment_config.file_days_old ago (n_file_days_old)
      -- successful "loaded" status code from ODS Import database
      s_sql_files_to_delete := 'select trim("FileName")
                                from v_Files@' || v_db_link || '
                                where trim("FileName") like ' || '''' || v_district_id || '_%' || '''' || '
                                and "CreateDate" < to_char((sysdate - ' || n_file_days_old || '), ''YYYY-MM-DD HH:MI:SS'')  
                                and "Status" = 4';            
      
      execute immediate s_sql_files_to_delete bulk collect into t_filename_data;
      
      exception
        when no_data_found then     -- no files to delete
          prc_log_status('prc_delete_old_imported_files(): No files to delete', 'INFO-02', v_user_id); 
                
    end;                         
      
    -- loop through t_filename_data and delete loaded files (within threshold) from server filesystem, if they exist
    for indx in 1 .. t_filename_data.count
    loop
        utl_file.fgetattr(upper(v_output_directory), t_filename_data(indx).filename, l_file_exists, l_file_len, l_byte_size);
        if l_file_exists then
          utl_file.fremove(v_output_directory, t_filename_data(indx).filename);
        end if;
    end loop;     -- end of remove file loop
    
    exception
      when others then
      prc_log_status('prc_delete_old_imported_files(): Error deleting old files', 'ERROR-20', v_user_id); 
      apex_error.add_error(p_message          => 'Error deleting old files',
                           p_additional_info  => substr(sqlerrm, 1, 200),
                           p_display_location => apex_error.c_inline_with_field_and_notif,
                           p_page_item_name   => ''); 
      raise;                           

  end prc_delete_old_imported_files;
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_uploaded_vs_imported_rows
  - Purpose:      compare uploaded rows to rows with student ids (to be imported)
  -
  ---------------------------------------------------------------------*/    
  
  procedure prc_uploaded_vs_imported_rows (v_test_type varchar2, v_district_id varchar2, n_rows_with_stu_id number, v_user_id varchar2, v_file varchar2)
  is
    n_rows_with_no_stu_id number(8) := 0;
    n_rows_total_students_uploaded number(8) := 0;
    s_sql_uploaded_data varchar2(1000);
    v_table_name varchar2(40);
    e_unknown_test_type exception;
  begin
   
    -- calculate total mismatched rows
    s_sql_uploaded_data := 'select count(distinct upper(first_name) || upper(last_name) || to_char(to_date(birth_date,''MM/DD/YYYY''),''MM/DD/YYYY''))
                             from assessment_stu_id_mismatch 
                             where loaded_date = (select max(loaded_date) 
                                                  from assessment_stu_id_mismatch)
                             and district_id = ' || v_district_id || '
                             and file_name = ''' || v_file || '''';        
   
    execute immediate s_sql_uploaded_data into n_rows_with_no_stu_id;
    
    n_rows_total_students_uploaded := n_rows_with_stu_id + n_rows_with_no_stu_id;
    
    if n_rows_with_no_stu_id > 0 then
   --   apex_application.g_print_success_message := 'Load successful with a <span style="color: yellow;">warning:</span> some test data rows out of the total of '
   --    || n_rows_loaded || ' rows uploaded had no valid student id found in the ODS.  These rows without valid student ids <span style="color: yellow;">will not</span> be imported into your ODS.
   --     Please review the Student Id Mismatch report to resolve this issue'; 
      apex_application.g_print_success_message := 'Load successful with a <span style="color: yellow;">warning:</span> There are<span style="color: yellow;"> ' || n_rows_with_no_stu_id || '</span> students out of<span style="color: yellow;"> '
        || n_rows_total_students_uploaded || '</span> total uploaded students that had no valid student id found in the ODS.  These students without a valid student id <span style="color: yellow;">will not</span> be imported into your ODS.
        Please review the Student Id Mismatch report to resolve this issue';     
    else
      apex_application.g_print_success_message := 'Load successful without warnings for : ' || v_file || ' with ' || n_rows_with_stu_id || ' rows uploaded.';
    end if;
    
    exception
      when e_unknown_test_type then
        prc_log_status('prc_uploaded_vs_imported_rows(): Test type ' || v_test_type || ' is invalid for file ' || v_file, 'ERROR-21', v_user_id); 
        apex_error.add_error(p_message          => 'Test type ' || v_test_type || ' is invalid for file',
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;                       
      when others then
        prc_log_status('prc_uploaded_vs_imported_rows(): Error calculating uploaded vs imported rows ' || v_file, 'ERROR-22', v_user_id); 
        apex_error.add_error(p_message          => 'Error calculating uploaded vs imported rows',
                             p_additional_info  => substr(sqlerrm, 1, 200), 
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => ''); 
        raise;                           
  
  end prc_uploaded_vs_imported_rows;  
  
  /*---------------------------------------------------------------------
  - 
  - Procedure:    prc_load_importer_logs
  - Purpose:      locally load logs from importer database for district
  -
  ---------------------------------------------------------------------*/
    
  procedure prc_load_importer_logs (v_district_id varchar2, v_user_id varchar2)
  is
    sql_load_files_log varchar2(2000);
    sql_load_ingestion_log varchar2(2000);
    s_sql_close_db_link varchar2(200);
    v_db_link varchar2(100);
  begin
    
    prc_get_database_dblink (v_district_id, v_db_link, 'IMPORT', v_user_id);
    
    delete edfidata.importer_files_log where substr("FileName",instr("FileName",'/',-1)+1,6) = v_district_id;
    delete edfidata.importer_ingestion_log where substr("FileName",instr("FileName",'/',-1)+1,6) = v_district_id;
    
    sql_load_files_log := 'insert into edfidata.importer_files_log
                           select "Id",
                                  "AgentId",
                                  "FileName",
                                  "Status",
                                  "Message",
                                  "Rows",
                                  "CreateDate"
                           from v_Files@' || v_db_link;
     
    sql_load_ingestion_log := 'insert into edfidata.importer_ingestion_log
                               select "AgentId",
                                      "FileName",
                                      "Date",
                                      "RowNumber",
                                      "HttpStatusCode",
                                      "OdsResponse"
                               from v_IngestionLogs@' || v_db_link;
                              
    execute immediate sql_load_files_log;   
    execute immediate sql_load_ingestion_log;
    commit;    
    
    s_sql_close_db_link :=  'alter session close database link ' || v_db_link;
    execute immediate s_sql_close_db_link;

    exception
      when others then
        prc_log_status('prc_load_importer_logs(): Error loading importer logs', 'ERROR-24', v_user_id); 
        apex_error.add_error(p_message          => 'Error loading importer logs',
                             p_additional_info  => substr(sqlerrm, 1, 200), 
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => ''); 
        raise;                                                    
  
  end prc_load_importer_logs;  
  
end pkg_assessment_upload;
/ 
