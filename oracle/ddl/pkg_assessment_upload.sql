create or replace package pkg_assessment_upload as

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
  - C. Bull       5/01/22             rewrite
	- C. Bull       2/22/23             rewrite to send data directly to API
  ----------------------------------------------------------------------*/

  type t_students is table of o_student;
	
  -- global variable - for debugging
  gn_debug_on number := 0; -- 0 = debugging OFF, 1 = debugging level 1 ON (no other debugging levels available at this time)

  function is_number(p_str in varchar2) return boolean deterministic;
  function is_date(p_str         in varchar2
                  ,p_date_format in varchar2) return boolean deterministic;
  function is_date_varchar(p_str         in varchar2
                          ,p_date_format in varchar2) return varchar2 deterministic;

  -- functions used for testing procedures
  function fun_check_file_name_format(v_district_id varchar2
                                     ,v_test_type   varchar2
                                     ,v_file        varchar2
                                     ,v_user_id     varchar2) return varchar2;

  procedure prc_log_status(v_status_message varchar2
                          ,v_status_type    varchar2
                          ,v_user_id        varchar2);

  procedure prc_check_file_name_format(v_district_id varchar2
                                      ,v_test_type   varchar2
                                      ,v_file        varchar2
                                      ,v_user_id     varchar2);
  /*---------------------------------------------------------------------
  -
  - Procedure:    fun_check_file_header_format
  - Purpose:      check header (1st row) of file(s) to be uploaded
  - Return:
  ---------------------------------------------------------------------*/

  function fun_check_file_header_format(v_district_id   varchar2
                                       ,v_test_type     varchar2
                                       ,v_fullpath_file varchar2
                                       ,v_user_id       varchar2)
    return varchar2;

  procedure prc_check_file_header_format(v_district_id   varchar2
                                        ,v_test_type     varchar2
                                        ,v_file          varchar2
                                        ,v_fullpath_file varchar2
                                        ,v_user_id       varchar2);

  procedure prc_upload_test_data(v_district_id           varchar2
                                ,v_test_type             varchar2
                                ,v_file                  varchar2 -- original file name
                                ,v_fullpath_file         varchar2 -- original file name with directory path
                                ,v_user_id               varchar2
                                ,v_school_year           varchar2 -- school year to load associated file to
                                ,v_file_name_school_year varchar2 -- original file name no directory path, school year added after test type
                                 );

  /*---------------------------------------------------------------------
  - Procedure:    prc_ignore_all_errors
  - Purpose:      updates all the error rows for a file to IGNORE
  ---------------------------------------------------------------------*/
  procedure prc_ignore_all_errors (p_file_name_school_year varchar2
                                  ,p_test_type             varchar2);
  --------------------------------------------------------------
  -- update procedure for table DISTRICT_ACT_DATA
  --------------------------------------------------------------
  procedure prc_upd_district_act_data(p_last_name                  in varchar2
                                     ,p_first_name                 in varchar2
                                     ,p_mid_init                   in varchar2 default null
                                     ,p_birth_date                 in varchar2
                                     ,p_act_scale_scores_composite in varchar2 default null
                                     ,p_act_scale_scores_english   in varchar2 default null
                                     ,p_act_scale_scores_math      in varchar2 default null
                                     ,p_act_scale_scores_reading   in varchar2 default null
                                     ,p_act_scale_scores_science   in varchar2 default null
                                     ,p_test_date_month_and_year   in varchar2 default null
                                     ,p_status                     in varchar2 default null
                                     ,p_school_year_to_load        in varchar2 default null
                                     ,p_tsds_student_unique_id     in varchar2 default null
                                     ,p_row_id                     in varchar2);
  --------------------------------------------------------------
  -- update procedure for table DISTRICT_AP_DATA
  procedure prc_upd_district_ap_data(p_last_name              in varchar2
                                    ,p_first_name             in varchar2
                                    ,p_middle_initial         in varchar2 default null
                                    ,p_birth_date             in varchar2
                                    ,p_admin_year_01_str      in varchar2 default null
                                    ,p_exam_code_01           in varchar2 default null
                                    ,p_exam_score_01          in varchar2 default null
                                    ,p_admin_year_02_str      in varchar2 default null
                                    ,p_exam_code_02           in varchar2 default null
                                    ,p_exam_score_02          in varchar2 default null
                                    ,p_admin_year_03_str      in varchar2 default null
                                    ,p_exam_code_03           in varchar2 default null
                                    ,p_exam_score_03          in varchar2 default null
                                    ,p_admin_year_04_str      in varchar2 default null
                                    ,p_exam_code_04           in varchar2 default null
                                    ,p_exam_score_04          in varchar2 default null
                                    ,p_admin_year_05_str      in varchar2 default null
                                    ,p_exam_code_05           in varchar2 default null
                                    ,p_exam_score_05          in varchar2 default null
                                    ,p_admin_year_06_str      in varchar2 default null
                                    ,p_exam_code_06           in varchar2 default null
                                    ,p_exam_score_06          in varchar2 default null
                                    ,p_admin_year_07_str      in varchar2 default null
                                    ,p_exam_code_07           in varchar2 default null
                                    ,p_exam_score_07          in varchar2 default null
                                    ,p_admin_year_08_str      in varchar2 default null
                                    ,p_exam_code_08           in varchar2 default null
                                    ,p_exam_score_08          in varchar2 default null
                                    ,p_admin_year_09_str      in varchar2 default null
                                    ,p_exam_code_09           in varchar2 default null
                                    ,p_exam_score_09          in varchar2 default null
                                    ,p_admin_year_10_str      in varchar2 default null
                                    ,p_exam_code_10           in varchar2 default null
                                    ,p_exam_score_10          in varchar2 default null
                                    ,p_status                 in varchar2 default null
                                    ,p_school_year_to_load    in varchar2 default null
                                    ,p_tsds_student_unique_id in varchar2 default null
                                    ,p_row_id                 in varchar2);
  --------------------------------------------------------------
  -- update procedure for table DISTRICT_IB_DATA
  procedure prc_upd_district_ib_data(p_year                   in number default null
                                    ,p_student_id             in varchar2 default null
                                    ,p_school_session         in varchar2 default null
                                    ,p_subject                in varchar2 default null
                                    ,p_exam_grade             in varchar2 default null
                                    ,p_predicted_grade        in varchar2 default null
                                    ,p_status                 in varchar2 default null
                                    ,p_school_year_to_load    in varchar2 default null
                                    ,p_tsds_student_unique_id in varchar2 default null
                                    ,p_row_id                 in varchar2);
  --------------------------------------------------------------
  -- update procedure for table DISTRICT_SAT_DATA
  procedure prc_upd_district_sat_data(p_ai_code                    in varchar2
                                     ,p_last_name                  in varchar2
                                     ,p_first_name                 in varchar2
                                     ,p_name_mi                    in varchar2 default null
                                     ,p_birth_date                 in varchar2
                                     ,p_latest_sat_total           in varchar2 default null
                                     ,p_latest_sat_ebrw            in varchar2 default null
                                     ,p_latest_sat_math_section    in varchar2 default null
                                     ,p_latest_registration_num    in varchar2 default null
                                     ,p_latest_assessment_date_str in varchar2 default null
                                     ,p_secondary_id               in varchar2 default null
                                     ,p_status                     in varchar2 default null
                                     ,p_school_year_to_load        in varchar2 default null
                                     ,p_tsds_student_unique_id     in varchar2 default null
                                     ,p_row_id                     in varchar2);
  --------------------------------------------------------------
  -- update procedure for table DISTRICT_TSI_DATA
  procedure prc_upd_district_tsi_data(p_test_start_str              in varchar2 default null
                                     ,p_last_name                   in varchar2 default null
                                     ,p_first_name                  in varchar2 default null
                                     ,p_middle_initial              in varchar2 default null
                                     ,p_student_id                  in varchar2 default null
                                     ,p_birth_date                  in varchar2 default null
                                     ,p_tsi_mathematics_placement   in varchar2 default null
                                     ,p_tsi_reading_placement       in varchar2 default null
                                     ,p_tsi_writing_placement       in varchar2 default null
                                     ,p_tsi_writeplacer             in varchar2 default null
                                     ,p_abe_mathematics_diagnostics in varchar2 default null
                                     ,p_abe_writing_diagnostics     in varchar2 default null
                                     ,p_abe_reading_diagnostics     in varchar2 default null
                                     ,p_status                      in varchar2 default null
                                     ,p_school_year_to_load         in varchar2 default null
                                     ,p_tsds_student_unique_id      in varchar2 default null
                                     ,p_row_id                      in varchar2);
  --------------------------------------------------------------
  -- update procedure for table DISTRICT_TSI2_DATA
  procedure prc_upd_district_tsi2_data(p_test_start_str       in varchar2
                                      ,p_last_name            in varchar2
                                      ,p_first_name           in varchar2
                                      ,p_middle_initial       in varchar2 default null
                                      ,p_student_id           in varchar2 default null
                                      ,p_birth_date           in varchar2
                                      ,p_tsi2_math_readiness  in varchar2 default null
                                      ,p_tsi2_math_diagnostic in varchar2 default null
                                      ,p_tsi2_elar_readiness  in varchar2 default null
                                      ,p_tsi2_elar_diagnostic in varchar2 default null
                                      ,p_tsi2_elar_essay      in varchar2 default null
                                      ,p_supplemental_id      in varchar2 default null
                                      ,p_status               in varchar2 default null
                                      ,p_school_year_to_load  in varchar2 default null
                                      ,p_row_id               in varchar2);
	procedure prc_process_sat_data_api (p_district_id      varchar2,
                                      p_school_year      varchar2,
																			p_file_name_school_year varchar2,
																			p_status           varchar2 default 'PENDING');
  procedure prc_process_tsi_data_api(p_district_id      varchar2,
                                     p_school_year      varchar2,
																		 p_file_name_school_year varchar2,
																		 p_status           varchar2 default 'PENDING');
	procedure prc_process_tsi2_data_api(p_district_id      varchar2,
                                     p_school_year      varchar2,
																		 p_file_name_school_year varchar2,
																		 p_status           varchar2 default 'PENDING');
	procedure prc_process_act_data_api(p_district_id      varchar2,
                                     p_school_year      varchar2,
																		 p_file_name_school_year varchar2,
																		 p_status           varchar2 default 'PENDING');
	procedure prc_process_ap_data_api(p_district_id      varchar2,
                                     p_school_year      varchar2,
																		 p_file_name_school_year varchar2,
																		 p_status           varchar2 default 'PENDING');
	procedure prc_process_ib_data_api(p_district_id      varchar2,
                                     p_school_year      varchar2,
																		 p_file_name_school_year varchar2,
																		 p_status           varchar2 default 'PENDING');

  /*---------------------------------------------------------------------
  - Procedure:    prc_process_asmt_files
  - Purpose:      this procedure orchestrates the processing of assessment files uploaded by the district
  ---------------------------------------------------------------------*/
  procedure prc_process_asmt_files(p_district_id     varchar2
                                  ,p_user_id         varchar2
                                  ,p_test_type       varchar2
                                  ,p_files_to_upload varchar2
                                  ,p_school_years    varchar2);

/*---------------------------------------------------------------------
- Procedure:    prc_process_asmt_files
- Purpose:      this procedure orchestrates the processing of assessment error records being resent by the district
---------------------------------------------------------------------*/
procedure prc_process_asmt_resend (p_district_id          varchar2);

--------------------------------------------------------------------------------------------------------
-- PROCEDURE to pull the STUDENTS from the ods and load into DISTRICT_STUDENT_CACHE for each active or prior year active districts and school years.
--------------------------------------------------------------------------------------------------------
  procedure proc_cache_students_api;
	
---------------------------------------------------------------------------------------------------
-- PROCEDURE to load the assessments and objective assessments into the district ODS'.  This should
-- only be run once into a new ods or if changes were made to the bootstrap data.
---------------------------------------------------------------------------------------------------
  procedure proc_load_assessment_bootstrap ( P_DISTRICT_ID varchar2 default 'ALL');


procedure prc_validate_ap_data(p_file_name_school_year varchar2
                                 ,p_school_year           varchar2
                                 ,p_district_id           varchar2);
																 
end pkg_assessment_upload;
/
create or replace package body pkg_assessment_upload as

  c_api_base varchar2(100);
  c_api_data varchar2(100);

-- this proc sets the global variables for the api urls
  procedure PROC_SET_API_URL (
    P_DISTRICT_ID            in varchar2  default null,
    P_DB_NUMBER              in varchar2  default null
    ) as

    l_edfi_version              varchar2(5);
    l_mass_send_flag            varchar2(3);
    l_school_year               varchar2(4);
    l_db_number                 varchar2(10);
    l_proxy_district_name       varchar2(50);
    l_api_dns                   varchar2(200);
    l_api_base                  varchar2(200);
    l_api_data                  varchar2(200);

    begin
      select
         d.EDFI_VERSION
         ,d.MASS_SEND_FLAG
         ,d.SCHOOL_YEAR
         ,case when d.MASS_SEND_FLAG = 'Y' then ec.MASS_SEND_DNS else ec.CHANGE_DATA_DNS end as api_dns
         ,ec.API_BASE
         ,ec.API_DATA
         ,d.DISTRICT_DB_NUMBER
         ,d.PROXY_DISTRICT_NAME
      into l_edfi_version, l_mass_send_flag, l_school_year, l_api_dns, l_api_base, l_api_data, l_db_number, l_proxy_district_name
      from DISTRICTS d
      join EDFI_CONFIG ec on ec.EDFI_VERSION = d.EDFI_VERSION
      where d.PRIMARY_SCHOOL_YEAR = 'Y'
         and (d.DISTRICT_DB_NUMBER = P_DB_NUMBER
         or d.DISTRICT_CDC = P_DISTRICT_ID);

      if l_edfi_version = '3.5' then
        -- FOR 3.5 The DNS, proxy name and the SCHOOL YEAR need to be replaced
        c_api_base := replace(replace(l_api_base,'#IP_DNS#',l_api_dns),'#SCHOOL_YEAR#',l_school_year);
        c_api_data := l_api_data;

        if l_mass_send_flag = 'Y' then
          -- proxy name is not used for mass update so remove the place holder and the "/" on the end
          c_api_base := replace(c_api_base,'#PROXY_NAME#/','');
        else
          -- must be proxy/change data
          -- proxy name is required for nginx so replace name
          c_api_base := replace(c_api_base,'#PROXY_NAME#',l_proxy_district_name);
        end if;

      end if;
        -- http://#IP_DNS#/#PROXY_NAME#/ods-#SCHOOL_YEAR#/
		end PROC_SET_API_URL;
		
  /* check if a string is numeric */
  function is_number(p_str in varchar2)
    return boolean
    deterministic
  as
    l_num number;
  begin
    l_num := to_number(p_str);
    return true;
  exception
    when value_error then
      return false;
  end is_number;
  /***********************************
   * Checks if string is a valid date
   ***********************************/
  function is_date(
    p_str in varchar2,
    p_date_format in varchar2)
    return boolean
    deterministic
  as
    l_date date;
  begin
    l_date := to_date(p_str, p_date_format);
   -- dbms_output.put_line(l_date);
   -- dbms_output.put_line(to_char(l_date,'MM/DD/YYYY'));
    return true;
  exception
    when others then -- Using a when others since date format could also be invalid
      return false;
  end is_date;
  /***********************************
   * Checks if string is a valid date returning a varchar
   ***********************************/
  function is_date_varchar(
    p_str in varchar2,
    p_date_format in varchar2)
    return varchar2
    deterministic
  as
    l_date date;
  begin
    l_date := to_date(p_str, p_date_format);
    return 'T';
  exception
    when others then -- Using a when others since date format could also be invalid
      return 'F';
  end is_date_varchar;

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

    if v_status_type like 'INFO%' or v_status_type like 'DEBUG%' then

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
        apex_error.add_error(p_message          => 'Error occurred during logging process : ' || sqlerrm || ' : ' || dbms_utility.format_error_stack,
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
    l_file varchar2(300);
    l_error varchar(2000) := '';
  begin
    -- remove the directory, c:/xyxz/jfjf, from file name
    l_file := upper(substr(v_file,INSTR(v_file,'/',-1)+1));

    -- verify file name has correct district id
    if upper(substr(l_file,1,6)) != v_district_id then
       l_error := 'File Name has an invalid district id ' || l_file;
       prc_log_status('prc_check_file_name_format(): File Name has an invalid district id ' || l_file, 'ERROR-04', v_user_id);
    end if;

    -- verify file name has correct assessment type
    -- handle upper or lower case in file name for assessment type
    if instr(substr(upper(l_file),1,15),'_'||v_test_type||'_',1,1) = 0 then
       l_error := case when l_error = '' or l_error is null then ''
              else l_error||' >>> ' end || 'File Name has an invalid assessment type, file name should be in 123456_SAT_Results.csv format ' || l_file;
       prc_log_status('prc_check_file_name_format(): File Name has an invalid assessment type ' || l_file, 'ERROR-05', v_user_id);
    end if;

    return l_error;

    exception
      when others then
        prc_log_status('prc_check_file_name_format(): Unknown error checking the name of the file ' || sqlerrm || ' ' || l_file, 'ERROR-06', v_user_id);
        l_error := 'Unknown error checking the name of the file ' || sqlerrm || ' ' || l_file || ' : ' || dbms_utility.format_error_stack;
        return l_error;

  end fun_check_file_name_format;

  /*---------------------------------------------------------------------
  -
  - Procedure:    prc_check_file_name_format
  - Purpose:      check format of file(s) to be uploaded
  -
  ---------------------------------------------------------------------*/

  procedure prc_check_file_name_format (v_district_id varchar2, v_test_type varchar2, v_file varchar2, v_user_id varchar2)
  is
    l_file varchar2(300);
    e_district_file_format_error exception;
    e_assessment_file_format_error exception;
  begin
    -- remove the directory, c:/xyxz/jfjf, from file name
    l_file := upper(substr(v_file,INSTR(v_file,'/',-1)+1));
    -- verify file name has correct district id
    if upper(substr(l_file,1,6)) != v_district_id then
       raise e_district_file_format_error;
    end if;

    -- verify file name has correct assessment type
    -- handle upper or lower case in file name for assessment type
    if instr(l_file,'_'||v_test_type||'_',1,1) between 1 and 12 then
      raise e_assessment_file_format_error;
    end if;

    exception
      when e_district_file_format_error then
        prc_log_status('prc_check_file_name_format(): File Name has invalid district id ' || v_file, 'ERROR-04', v_user_id);
        apex_error.add_error(p_message          => 'File Name has invalid district id ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;
      when e_assessment_file_format_error then
        prc_log_status('prc_check_file_name_format(): File Name has an invalid assessment type ' || v_file, 'ERROR-05', v_user_id);
        apex_error.add_error(p_message          => 'File Name has an invalid assessment type, file name should be in 123456_SAT_Results.csv format ' || v_file,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;
      when others then
        prc_log_status('prc_check_file_name_format(): Unknown error checking the name of the file ' || sqlerrm || ' ' || v_file, 'ERROR-06', v_user_id);
        apex_error.add_error(p_message          => 'Unknown error checking the name of the file ' || sqlerrm || ' ' || v_file || ' : ' || dbms_utility.format_error_stack,
                             p_additional_info  => substr(sqlerrm, 1, 200),
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;

  end prc_check_file_name_format;
  /*---------------------------------------------------------------------
  -
  - Procedure:    fun_check_file_header_format
  - Purpose:      check header (1st row) of file(s) to be uploaded
  - Return:
  ---------------------------------------------------------------------*/

  function fun_check_file_header_format(v_district_id    varchar2
                                        ,v_test_type      varchar2
                                        ,v_fullpath_file  varchar2
                                        ,v_user_id        varchar2)
  return varchar2
  as
    type r_field_type is record (
      column_position edfidata.assessment_std_file_format.column_position%type,
      column_name edfidata.assessment_std_file_format.column_name%type
    );
    type tbl_field_table is table of r_field_type index by binary_integer;
    t_field_results tbl_field_table;
    n_minimal_sat_used number := 0;
    v_file           varchar2(200);
  begin
    -- remove the directory, c:/xyxz/jfjf, from file name
    v_file := upper(substr(v_fullpath_file,INSTR(v_fullpath_file,'/',-1)+1));

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
      return 'PASSED';
    elsif n_minimal_sat_used = 1 and v_test_type = 'SAT' then  -- SAT file with minimal headers, do not check header
      return 'PASSED';
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
      -- for TSI2 column position (1-14)
      insert into edfidata.district_assessment_header
        select distinct
          column_position,
          regexp_replace(column_name,'^C\_','',1,1,'') column_name, -- patch to remove any "C_" that apex parser prepends to col name
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
      -- if you leave the global flag 'on' (gn_debug_on = 1) then the header format logic may not work properly,
      -- so turn the global flag 'off' (gn_debug_on = 0) before going to production
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
           /*  minus
           select column_position, upper(column_name) as column_name
           from edfidata.assessment_std_file_format
           where standard_type = 'TSI2' -- took out due to TSI2 changes AW 7/14/21 */
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
        prc_log_status('prc_check_file_header_format(): File header format error with file ' || v_file, 'ERROR-07', v_user_id);
        return 'The Columns Headers are incorrect for file ' || v_file||' please refer to user documentation for required column header';
      else
        return 'PASSED';
      end if;

    end if;

    exception
      when others then
        prc_log_status('prc_check_file_header_format(): File upload error with file ' || sqlerrm || ' ' || v_file, 'ERROR-08', v_user_id);
       return 'File upload error with file ' || sqlerrm || ' ' || v_file || ' : ' || dbms_utility.format_error_stack;

  end fun_check_file_header_format;
  /*---------------------------------------------------------------------
  -
  - Procedure:    prc_check_file_header_format
  - Purpose:      check header (1st row) of file(s) to be uploaded
  -
  ---------------------------------------------------------------------*/

  procedure prc_check_file_header_format(v_district_id    varchar2
                                        ,v_test_type      varchar2
                                        ,v_file           varchar2
                                        ,v_fullpath_file  varchar2
                                        ,v_user_id        varchar2)
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
      t_field_results := t_empty_field_results;

    elsif n_minimal_sat_used = 1 and v_test_type = 'SAT' then  -- SAT file with minimal headers, do not check header
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
      -- for TSI2 column position (1-14)
      insert into edfidata.district_assessment_header
        select distinct
          column_position,
          regexp_replace(column_name,'^C\_','',1,1,'') column_name, -- patch to remove any "C_" that apex parser prepends to col name
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
      -- if you leave the global flag 'on' (gn_debug_on = 1) then the header format logic may not work properly,
      -- so turn the global flag 'off' (gn_debug_on = 0) before going to production
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
           /*  minus
           select column_position, upper(column_name) as column_name
           from edfidata.assessment_std_file_format
           where standard_type = 'TSI2' -- took out due to TSI2 changes AW 7/14/21 */
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
        t_field_results := t_empty_field_results;
        raise e_file_header_format_error;
      else
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
        apex_error.add_error(p_message          => 'File upload error with file ' || sqlerrm || ' ' || v_file || ' : ' || dbms_utility.format_error_stack,
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

  procedure prc_upload_test_data(v_district_id   varchar2
                                ,v_test_type     varchar2
                                ,v_file          varchar2 -- original file name
                                ,v_fullpath_file varchar2 -- original file name with directory path
                                ,v_user_id       varchar2
                                ,v_school_year   varchar2 -- school year to load associated file to
                                ,v_file_name_school_year varchar2 -- original file name no directory path, school year added after test type
                                )
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
      file_name                   edfidata.district_act_data.file_name%type,
      original_file_name          edfidata.district_act_data.original_file_name%type,
      status                      edfidata.district_act_data.STATUS%type,
      error_message               edfidata.district_act_data.ERROR_MESSAGE%type,
      school_year_to_load         edfidata.district_act_data.SCHOOL_YEAR_TO_LOAD%type,
      tsds_student_unique_id      edfidata.district_act_data.TSDS_STUDENT_UNIQUE_ID%type,
			json_data                   edfidata.district_act_data.JSON_DATA%type
    );
    type tbl_act_data is table of r_act_data index by pls_integer;
    t_act_data tbl_act_data;
    type tbl_school_year is table of varchar2(4) index by pls_integer;

    v_file_type varchar2(10);
    idx1 number;
    c_act_row_clob clob;
    n_clob_length number := 0;         -- reset ACT CLOB to 0 on each pass
    n_act_csv_rec_len number;
    n_minimal_sat_used number := 0;    -- flag for district using minimal fields for SAT
    n_minimal_ap_used number := 0;     -- flag for district using minimal fields for AP
    e_unknown_test_type exception;
  begin

    --********  SAT  ********
    if v_test_type = 'SAT' then

      delete edfidata.district_sat_data
      where district_id = v_district_id
      and file_name = v_file_name_school_year;

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
    --***********************
    --********  SAT  ********
    --***********************
      if n_minimal_sat_used = 1 then       -- district is using minimal fields for SAT

        insert into edfidata.district_sat_data
        select
          col001,  -- ai_code
          col002,  -- name_last
          col003,  -- name_first
          substr(col004,1,1),  -- name_mi
          col005, -- birth_date  (MM/DD/YYYY)
          col006,  -- latest_sat_total
          col007,  -- latest_sat_ebrw
          col008,  -- latest_sat_math_section
          col009,  -- latest_registration_num
          case
            when is_date_varchar(col010, 'MM/DD/YYYY') = 'T' then to_date(col010, 'MM/DD/YYYY')
            when is_date_varchar(col010, 'YYYY-MM-DD') = 'T' then to_date(col010, 'YYYY-MM-DD')
            else null
          end,     -- latest_sat_date - assessment test date
          sysdate, -- loaded date
          v_district_id, --- district id
          v_file_name_school_year,  -- file name with school year only
          line_number, -- file line number (line number after file header)
          col011,   -- secondary_id - district student id
          v_file, -- original file name
          'PENDING', -- STATUS
          null, -- ERROR MESSAGE
          v_school_year, -- SCHOOL YEAR TO LOAD
          null,  -- student TSDS unique id
          col010, -- lastest_sat_date_str
					null -- JSON_DATA
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
          col023, -- birth_date  (MM/DD/YYYY)
          col047,  -- latest_sat_total
          col048,  -- latest_sat_ebrw
          col049,  -- latest_sat_math_section
          col042,  -- latest_registration_num
          case
            when is_date_varchar(col044, 'MM/DD/YYYY') = 'T' then to_date(col044, 'MM/DD/YYYY')
            when is_date_varchar(col044, 'YYYY-MM-DD') = 'T' then to_date(col044, 'YYYY-MM-DD')
            else null
          end,     -- latest_sat_date - assessment test date
          sysdate, -- loaded date
          v_district_id, --- district id
          v_file_name_school_year,  -- file name with school year only
          line_number, -- file line number (line number after file header)
          substr(col026,1,15),   -- secondary_id - district student id
          v_file, -- original file name
          'PENDING', -- STATUS
          null, -- ERROR MESSAGE
          v_school_year, -- SCHOOL YEAR TO LOAD
          null,  -- student TSDS unique id
          col044, -- lastest_sat_date_str
					null -- json_data
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
    --***********************
    --********  TSI  ********
    --***********************
      delete edfidata.district_tsi_data
      where district_id = v_district_id
      and file_name = v_file_name_school_year;

      insert into edfidata.district_tsi_data
      select
        line_number,
        case when is_date_varchar(col001,'MM/DD/YYYY') = 'T' then  to_date(col001,'MM/DD/YYYY')
             else null end, -- Test Date
        col002, -- Last Name
        col003, -- First Name
        substr(col004,1,1),  -- Middle Initial
        substr(col005,1,10), -- State Assigned Number -> STUDENT_ID
        col006, -- Date of Birth
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
        v_file_name_school_year,  -- file name with school year only
        sysdate, -- loaded date
        v_file, -- original file name
        'PENDING', -- STATUS
        null, -- ERROR MESSAGE
        v_school_year, -- SCHOOL YEAR TO LOAD
        null, -- tsds student unique id
        col001, -- TEST_START_STR,
				null -- json_data
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

    elsif v_test_type = 'TSI2' then
    --***********************
    --********  TSI2  ********
    --***********************
      delete edfidata.district_tsi2_data
      where district_id = v_district_id
      and file_name = v_file_name_school_year;

      insert into edfidata.district_tsi2_data
      (line_number,
      test_start,
      last_name,
      first_name,
      middle_initial,
      student_id,
      supplemental_id,
      birth_date,
      site_id,
      inst_id,
      tsi2_math_readiness,
      tsi2_math_diagnostic,
      tsi2_elar_readiness,
      tsi2_elar_diagnostic,
      tsi2_elar_essay,
      district_id,
      file_name,
      loaded_date,
      original_file_name,
      status,
      error_message,
      school_year_to_load,
      test_start_str
      )
      select
        line_number,
        case when is_date_varchar(col001,'MM/DD/YYYY') = 'T' then  to_date(col001,'MM/DD/YYYY')
             else null end, -- Test Date
        col002, -- Last Name -> LAST_NAME
        col003, -- First Name -> FIRST_NAME
        substr(col004,1,1),  -- Middle Initial -> MIDDLE_INITIAL
        substr(col005,1,10), -- Local student ID -> STUDENT_ID
        substr(col006,1,10), -- State Assigned Number -> SUPPLEMENTAL_ID
        case
          when instr(col007, '-') > 0 then to_char(to_date(col007,'YYYY-MM-DD'),'MM/DD/YYYY') -- handles leading zeroes issue
          when instr(col007, '/') > 0 and length(col007) <= 8 then to_char(to_date(col007,'MM/DD/YY'),'MM/DD/YYYY') -- no century and handles leading zeroes issue
          when instr(col007, '/') > 0 then to_char(to_date(col007,'MM/DD/YYYY'),'MM/DD/YYYY') -- handles leading zeroes issue
          else col007
        end,    -- Date of Birth -> BIRTH_DATE
        col008, -- Test Site Code -> SITE_ID
        col009, -- Test Site Location -> INST_ID
        col010, -- TSIA2 Mathematics College and Career Readiness -> TSI2_MATH_READINESS
        col011, -- TSIA2 Mathematics Diagnostic -> TSI2_MATH_DIAGNOSTIC
        col012, -- TSIA2 English Language Arts and Reading College and Career Readiness -> TSI2_ELAR_READINESS
        col013, -- TSIA2 English Language Arts and Reading Diagnostic -> TSI2_ELAR_DIAGNOSTIC
        col014, -- TSIA2 WritePlacer -> TSI2_ELAR_ESSAY
        v_district_id,  -- district id
        v_file_name_school_year,  -- file name with school year only
        sysdate, -- loaded date
        v_file, -- original file name
        'PENDING', -- STATUS
        null, -- ERROR MESSAGE
        v_school_year, -- SCHOOL YEAR TO LOAD
        col001 -- TEST_START_STR
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
    --***********************
    --********  IB   ********
    --***********************
      delete edfidata.district_ib_data
      where district_id = v_district_id
      and file_name = v_file_name_school_year;

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
          else col004
        end,     -- session
        col005,  -- subject
        col006,  -- exam grade
        col007,  -- predicted grade
        sysdate, -- loaded_date
        v_file_name_school_year,  -- file name with school year only
        v_file, -- original file name
        'PENDING', -- STATUS
        null, -- ERROR MESSAGE
        v_school_year, -- SCHOOL YEAR TO LOAD
        null, -- tsds student unique id
				null -- json data
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

    elsif v_test_type = 'AP' then
    --***********************
    --********  AP   ********
    --***********************
      delete edfidata.district_ap_data
      where district_id = v_district_id
      and file_name = v_file_name_school_year;

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
          case when length(trim(col006)) = 2 then to_date('20'||trim(col006)||'-05-01', 'YYYY-MM-DD')
               when length(trim(col006)) = 4 then to_date(trim(col006)||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_01
          col007, -- code01
          col008, -- grade01
          case when length(trim(col009)) = 2 then to_date('20'||trim(col009)||'-05-01', 'YYYY-MM-DD')
               when length(trim(col009)) = 4 then to_date(trim(col009)||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_02
          col010, -- code02
          col011, -- grade02
          case when length(trim(col012)) = 2 then to_date('20'||trim(col012)||'-05-01', 'YYYY-MM-DD')
               when length(trim(col012)) = 4 then to_date(trim(col012)||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_03
          col013, -- code03
          col014, -- grade03
          case when length(trim(col015)) = 2 then to_date('20'||trim(col015)||'-05-01', 'YYYY-MM-DD')
               when length(trim(col015)) = 4 then to_date(trim(col015)||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_04
          col016, -- code04
          col017, -- grade04
          case when length(trim(col018)) = 2 then to_date('20'||trim(col018)||'-05-01', 'YYYY-MM-DD')
               when length(trim(col018)) = 4 then to_date(trim(col018)||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_05
          col019, -- code05
          col020, -- grade05
          case when length(trim(col021)) = 2 then to_date('20'||trim(col021)||'-05-01', 'YYYY-MM-DD')
               when length(trim(col021)) = 4 then to_date(trim(col021)||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_06
          col022, -- code06
          col023, -- grade06
          case when length(trim(col024)) = 2 then to_date('20'||trim(col024)||'-05-01', 'YYYY-MM-DD')
               when length(trim(col024)) = 4 then to_date(trim(col024)||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_07
          col025, -- code07
          col026, -- grade07
          case when length(trim(col027)) = 2 then to_date('20'||trim(col027)||'-05-01', 'YYYY-MM-DD')
               when length(trim(col027)) = 4 then to_date(trim(col027)||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_08
          col028, -- code08
          col029, -- grade08
          case when length(trim(col030)) = 2 then to_date('20'||trim(col030)||'-05-01', 'YYYY-MM-DD')
               when length(trim(col030)) = 4 then to_date(trim(col030)||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_09
          col031, -- code09
          col032, -- grade09
          case when length(trim(col033)) = 2 then to_date('20'||trim(col033)||'-05-01', 'YYYY-MM-DD')
               when length(trim(col033)) = 4 then to_date(trim(col033)||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_10
          col034, -- code10
          col035, -- grade10
          sysdate,  -- loaded_date
          v_district_id,
          v_file_name_school_year,  -- file name with school year only
          v_file, -- original file name
          'PENDING', -- STATUS
          null, -- ERROR MESSAGE
          v_school_year, -- SCHOOL YEAR TO LOAD
          null, -- tsds student unique id
          col006, --admin_year_01_str
          col009, --admin_year_02_str
          col012, --admin_year_03_str
          col015, --admin_year_04_str
          col018, --admin_year_05_str
          col021, --admin_year_06_str
          col024, --admin_year_07_str
          col027, --admin_year_08_str
          col030, --admin_year_09_str
          col033,  --admin_year_10_str
					null -- json_data
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
          case when length(trim(replace(col059,'"',''))) = 2 then to_date('20'||trim(replace(col059,'"',''))||'-05-01', 'YYYY-MM-DD')
               when length(trim(replace(col059,'"',''))) = 4 then to_date(trim(replace(col059,'"',''))||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_01
          replace(col060,'"',''), -- code01
          replace(col061,'"',''), -- grade01
          case when length(trim(replace(col065,'"',''))) = 2 then to_date('20'||trim(replace(col065,'"',''))||'-05-01', 'YYYY-MM-DD')
               when length(trim(replace(col065,'"',''))) = 4 then to_date(trim(replace(col065,'"',''))||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_02
          replace(col066,'"',''), -- code02
          replace(col067,'"',''), -- grade02
          case when length(trim(replace(col071,'"',''))) = 2 then to_date('20'||trim(replace(col071,'"',''))||'-05-01', 'YYYY-MM-DD')
               when length(trim(replace(col071,'"',''))) = 4 then to_date(trim(replace(col071,'"',''))||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_03
          replace(col072,'"',''), -- code03
          replace(col073,'"',''), -- grade03
          case when length(trim(replace(col077,'"',''))) = 2 then to_date('20'||trim(replace(col077,'"',''))||'-05-01', 'YYYY-MM-DD')
               when length(trim(replace(col077,'"',''))) = 4 then to_date(trim(replace(col077,'"',''))||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_04
          replace(col078,'"',''), -- code04
          replace(col079,'"',''), -- grade04
          case when length(trim(replace(col083,'"',''))) = 2 then to_date('20'||trim(replace(col083,'"',''))||'-05-01', 'YYYY-MM-DD')
               when length(trim(replace(col083,'"',''))) = 4 then to_date(trim(replace(col083,'"',''))||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_05
          replace(col084,'"',''), -- code05
          replace(col085,'"',''), -- grade05
          case when length(trim(replace(col089,'"',''))) = 2 then to_date('20'||trim(replace(col089,'"',''))||'-05-01', 'YYYY-MM-DD')
               when length(trim(replace(col089,'"',''))) = 4 then to_date(trim(replace(col089,'"',''))||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_06
          replace(col090,'"',''), -- code06
          replace(col091,'"',''), -- grade06
          case when length(trim(replace(col095,'"',''))) = 2 then to_date('20'||trim(replace(col095,'"',''))||'-05-01', 'YYYY-MM-DD')
               when length(trim(replace(col095,'"',''))) = 4 then to_date(trim(replace(col095,'"',''))||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_07
          replace(col096,'"',''), -- code07
          replace(col097,'"',''), -- grade07
          case when length(trim(replace(col101,'"',''))) = 2 then to_date('20'||trim(replace(col101,'"',''))||'-05-01', 'YYYY-MM-DD')
               when length(trim(replace(col101,'"',''))) = 4 then to_date(trim(replace(col101,'"',''))||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_08
          replace(col102,'"',''), -- code08
          replace(col103,'"',''), -- grade08
          case when length(trim(replace(col107,'"',''))) = 2 then to_date('20'||trim(replace(col107,'"',''))||'-05-01', 'YYYY-MM-DD')
               when length(trim(replace(col107,'"',''))) = 4 then to_date(trim(replace(col107,'"',''))||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_09
          replace(col108,'"',''), -- code09
          replace(col109,'"',''), -- grade09
          case when length(trim(replace(col113,'"',''))) = 2 then to_date('20'||trim(replace(col113,'"',''))||'-05-01', 'YYYY-MM-DD')
               when length(trim(replace(col113,'"',''))) = 4 then to_date(trim(replace(col113,'"',''))||'-05-01', 'YYYY-MM-DD')
               else null end, --admin_year_10
          replace(col114,'"',''), -- code10
          replace(col115,'"',''), -- grade10
          sysdate,  -- loaded_date
          v_district_id,
          v_file_name_school_year,  -- file name with school year only
          v_file, -- original file name
          'PENDING', -- STATUS
          null, -- ERROR MESSAGE
          v_school_year, -- SCHOOL YEAR TO LOAD
          null, -- tsds student unique id
          col059, --admin_year_01_str
          col065, --admin_year_02_str
          col071, --admin_year_03_str
          col077, --admin_year_04_str
          col083, --admin_year_05_str
          col089, --admin_year_06_str
          col095, --admin_year_07_str
          col101, --admin_year_08_str
          col107, --admin_year_09_str
          col113,  --admin_year_10_str
					null -- json_data
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
    --***********************
    --********  ACT  ********
    --***********************
      delete edfidata.district_temp_act_data
      where district_id = v_district_id
      and file_name = v_file_name_school_year;

      delete edfidata.district_act_data
      where district_id = v_district_id
      and file_name = v_file_name_school_year;

      insert into edfidata.district_temp_act_data
      select
        col001,
        sysdate,
        v_district_id,
        v_file_name_school_year,  -- file name with school year only
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
      where file_name = v_file_name_school_year
      and line_number = 1;

      n_clob_length := dbms_lob.getlength(c_act_row_clob);

      select parameter_value
      into n_act_csv_rec_len
      from assessment_config
      where parameter_name = 'act_csv_rec_len';

      if gn_debug_on = 1 then       -- is global debug variable set?
        prc_log_status('prc_upload_test_data(): ACT file header length for first column is ' || n_clob_length, 'DEBUG-01', v_user_id);
      end if;

      if n_clob_length > n_act_csv_rec_len then   -- ACT fixed-width file

        -- parse CLOB column to get field data
        idx1 := 1;
        for tmptbl in (select data_record, line_number, loaded_date, district_id, file_name
                       from edfidata.district_temp_act_data
                       where file_name = v_file_name_school_year)
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
            t_act_data(idx1).original_file_name := v_file;
            t_act_data(idx1).status := 'PENDING';
            t_act_data(idx1).error_message := null;
            t_act_data(idx1).school_year_to_load := v_school_year;
            t_act_data(idx1).tsds_student_unique_id := null;
            idx1 := idx1 + 1;
        end loop;

        forall idx2 in t_act_data.first..t_act_data.last
          insert into edfidata.district_act_data values t_act_data(idx2);

      elsif n_clob_length between 6 and 8 then   -- new (as of school year 2021) ACT CSV format, first column header is 8 chars ("ACT ID")
                                                 -- could also be 6 chars if no double qoutes are used in first column header (ACT ID)
                                                 -- ACT CSV created by Assessment Loader is 10 chars ("Other Id")

        insert into edfidata.district_act_data
        select
          replace(col001,'"',''),                -- other_id
          line_number,                           -- line_number
          replace(col002,'"',''),                -- last_name
          replace(col003,'"',''),                -- first_name
          substr(replace(col004,'"',''),1,1),    -- mid_init
          substr(replace(col008,'"',''),1,1),    -- gender
          case when is_date_varchar(replace(col006,'"',''),'MM/DD/YYYY') = 'T'
             then to_char(to_date(replace(col006,'"',''),'MM/DD/YYYY'),'MM/DD/YYYY')
             else replace(col006,'"','') end, -- birth_date or DOB and handles leading zeroes issue
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
            else replace(col005,'"','')
          end,
          substr(replace(col007,'"',''),1,2),    -- grade_level
          sysdate,                               -- loaded_date
          v_district_id,                         -- district_id
          v_file_name_school_year,  -- file name with school year only
          v_file, -- original file name
          'PENDING', -- STATUS
          null, -- ERROR MESSAGE
          v_school_year, -- SCHOOL YEAR TO LOAD
          null, -- tsds student unique id
					null -- json_data
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

/*      else   -- ACT CSV file

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
          v_file_name_school_year, -- file name with school year only
          v_file,                  -- original file name
          'PENDING',               -- STATUS
          null,                    -- ERROR MESSAGE
          v_school_year,           -- SCHOOL YEAR TO LOAD
          null                     -- tsds_student_unique_id
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
*/
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
          apex_error.add_error(p_message          => 'File upload error with file ' || v_file || ' : ' || dbms_utility.format_error_stack,
                               p_additional_info  => substr(sqlerrm, 1, 200),
                               p_display_location => apex_error.c_inline_with_field_and_notif,
                               p_page_item_name   => '');
          raise;

  end prc_upload_test_data;

  /*---------------------------------------------------------------------
  -
  - Procedure:    prc_validate_sat_data
  - Purpose:      validate the SAT data and update status for error rows
  -
  ---------------------------------------------------------------------*/
  procedure prc_validate_sat_data(p_file_name_school_year varchar2
                                 ,p_school_year           varchar2
                                 ,p_district_id           varchar2)
  is
  l_error_msg   varchar2(2000);
  l_student_id  varchar2(20);
  l_birth_date  varchar2(20);
  l_test_date   date;
  begin
    -- loop through the rows
    for rec in (select d.*,d.rowid
                from DISTRICT_SAT_DATA d
                where d.FILE_NAME = p_file_name_school_year)
      loop
        l_error_msg := null;
        l_student_id := null;
        l_birth_date := null;
        l_test_date  := null;

        if rec.FIRST_NAME is null then
          l_error_msg := 'Student First Name is missing';
        end if;

        if rec.LAST_NAME is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Last Name is missing';
        end if;

        if rec.BIRTH_DATE is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Birth Date is missing';
        else
          if is_date(rec.BIRTH_DATE,'MM/DD/YYYY') then
            l_birth_date := to_char(to_date(rec.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY');
          elsif is_date(rec.BIRTH_DATE,'YYYY-MM-DD')  then
            l_birth_date := to_char(to_date(rec.BIRTH_DATE,'YYYY-MM-DD'),'MM/DD/YYYY');
          else
            l_birth_date := rec.BIRTH_DATE;
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Birth Date Format is incorrect - MM/DD/YYYY or YYYY-MM-DD';
          end if;
        end if;

        if rec.LATEST_ASSESSMENT_DATE is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Latest Assessment Date is missing';
        else
          if is_date(rec.LATEST_ASSESSMENT_DATE_STR,'MM/DD/YYYY') then
            l_test_date := to_date(rec.LATEST_ASSESSMENT_DATE_STR,'MM/DD/YYYY');
          elsif is_date(rec.LATEST_ASSESSMENT_DATE_STR,'YYYY-MM-DD')  then
            l_test_date := to_date(rec.LATEST_ASSESSMENT_DATE_STR,'YYYY-MM-DD');
          else
            l_test_date := null;
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Latest Assessment Date Format is incorrect - MM/DD/YYYY or YYYY-MM-DD';
          end if;
        end if;

        if rec.LATEST_SAT_TOTAL is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Latest SAT Total is missing';
        elsif not is_number(rec.LATEST_SAT_TOTAL)
           or rec.LATEST_SAT_TOTAL not between 400 and 1600 then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Latest SAT Total must be between 400 and 1600';
        end if;

        if rec.LATEST_SAT_EBRW is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Latest SAT EBRW is missing';
        elsif not is_number(rec.LATEST_SAT_EBRW)
           or to_number(rec.LATEST_SAT_EBRW) not between 200 and 800 then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Latest SAT EBRW must be between 200 and 800';
        end if;

        if rec.LATEST_SAT_MATH_SECTION is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Latest SAT Math is missing';
        elsif not is_number(rec.LATEST_SAT_MATH_SECTION)
           or to_number(rec.LATEST_SAT_MATH_SECTION) not between 200 and 800 then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Latest SAT Math must be between 200 and 800';
        end if;

        if is_date(l_birth_date,'MM/DD/YYYY') then -- sql will crash if birth date invalid
          -- check for student id, if found then add the id to the record else report an error.
          begin
            select c.STUDENT_UNIQUE_ID
              into l_student_id
              from district_student_cache c
             where district_ID = p_district_id
               and school_year = p_school_year
               and replace(trim(upper(c.FIRST_NAME) || upper(c.LAST_SURNAME) || to_char(to_date(c.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
                   = replace(trim(upper(rec.FIRST_NAME) || upper(rec.LAST_NAME) || l_birth_date),' ', '');
          exception
            when no_data_found then
                 begin
										select c.STUDENT_UNIQUE_ID
											into l_student_id
											from district_student_cache c
										 where district_ID = p_district_id
											 and replace(trim(upper(c.FIRST_NAME) || upper(c.LAST_SURNAME) || to_char(to_date(c.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
													 = replace(trim(upper(rec.FIRST_NAME) || upper(rec.LAST_NAME) || l_birth_date),' ', '')
											 and rownum = 1;
										-- student was found in a prior school year
										l_student_id := null;
										l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id was found in a prior school year but not in'||p_school_year;
									exception
										when no_data_found then
											   -- student was not foiund at all
												 l_student_id := null;
												 l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id could not be found';
									end;
          end;
        else
          -- birth date is not valid so stu id will not be found.
          l_student_id := null;
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id could not be found';
        end if;
      -- update the record with the error msg, status, and student unique id.
      APEX_DEBUG.message('>>>>>>>>>>>>>>>>>>>>update for stu id: '||l_student_id);
      APEX_DEBUG.message('>>>>>>>>>>>>>>>>>>>>update error msg: '||l_error_msg);
      update district_sat_data
         set status = case when l_error_msg is not null then 'ERROR' else status end,
             error_message = l_error_msg,
             tsds_student_unique_id = l_student_id,
             birth_date = l_birth_date,
             latest_assessment_date = l_test_date
        where rowid = rec.ROWID;
      end loop;

  end prc_validate_sat_data;
  /*---------------------------------------------------------------------
  -
  - Procedure:    prc_validate_tsi_data
  - Purpose:      validate the TSI data and update status for error rows
  -
  ---------------------------------------------------------------------*/
  procedure prc_validate_tsi_data(p_file_name_school_year varchar2
                                 ,p_school_year           varchar2
                                 ,p_district_id           varchar2)
  is
  l_error_msg   varchar2(2000);
  l_student_id  varchar2(20);
  l_birth_date  date;
  begin
    -- loop through the rows
    for rec in (select d.*,d.rowid
                from DISTRICT_TSI_DATA d
                where d.FILE_NAME = p_file_name_school_year)
      loop
        l_error_msg := null;
        l_student_id := null;
        l_birth_date := null;

        if rec.FIRST_NAME is null then
          l_error_msg := 'Student First Name is missing';
        end if;

        if rec.LAST_NAME is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Last Name is missing';
        end if;

        if rec.BIRTH_DATE is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Birth Date is missing';
        else
          if is_date(rec.BIRTH_DATE,'MM/DD/YYYY') then
            l_birth_date := to_date(rec.BIRTH_DATE,'MM/DD/YYYY');
          elsif is_date(rec.BIRTH_DATE,'YYYY-MM-DD')  then
            l_birth_date := to_date(rec.BIRTH_DATE,'YYYY-MM-DD');
          else
            l_birth_date := null;
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Birth Date Format is incorrect - MM/DD/YYYY or YYYY-MM-DD';
          end if;
        end if;

        if rec.TEST_START_STR is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Start Date is missing';
        end if;

        if rec.TEST_START is null
          and rec.TEST_START_STR is not null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Start Date Format is incorrect - MM/DD/YYYY';
        end if;

        if rec.TSI_MATHEMATICS_PLACEMENT is not null
          and (not is_number(rec.TSI_MATHEMATICS_PLACEMENT)
          or to_number(rec.TSI_MATHEMATICS_PLACEMENT) > 390) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Mathematics Placement score > 390';
        end if;

        if rec.TSI_READING_PLACEMENT is not null
          and (not is_number(rec.TSI_READING_PLACEMENT)
          or to_number(rec.TSI_READING_PLACEMENT) > 390) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Reading Placement score > 390';
        end if;

        if rec.TSI_WRITEPLACER is not null
          and (not is_number(rec.TSI_WRITEPLACER)
          or to_number(rec.TSI_WRITEPLACER) > 8) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'WritePlacer score > 8';
        end if;

        if rec.TSI_WRITING_PLACEMENT is not null
          and (not is_number(rec.TSI_WRITING_PLACEMENT)
          or to_number(rec.TSI_WRITING_PLACEMENT) > 390) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Writing Placement score > 390';
        end if;

        if is_date(rec.BIRTH_DATE,'MM/DD/YYYY') then -- sql will crash if birth date invalid
          -- check for student id, if found then add the id to the record else report an error.
          begin
            select c.STUDENT_UNIQUE_ID
              into l_student_id
              from district_student_cache c
             where district_ID = p_district_id
               and school_year = p_school_year
               and replace(trim(upper(c.FIRST_NAME) || upper(c.LAST_SURNAME) || to_char(to_date(c.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
                   = replace(trim(upper(rec.FIRST_NAME) || upper(rec.LAST_NAME) || to_char(to_date(rec.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '');
          exception
            when no_data_found then
                 begin
										select c.STUDENT_UNIQUE_ID
											into l_student_id
											from district_student_cache c
										 where district_ID = p_district_id
											 and replace(trim(upper(c.FIRST_NAME) || upper(c.LAST_SURNAME) || to_char(to_date(c.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
									         = replace(trim(upper(rec.FIRST_NAME) || upper(rec.LAST_NAME) || to_char(to_date(rec.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
											 and rownum = 1;
										-- student was found in a prior school year
										l_student_id := null;
										l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id was found in a prior school year but not in'||p_school_year;
									exception
										when no_data_found then
											   -- student was not foiund at all
												 l_student_id := null;
												 l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id could not be found';
									end;
            when too_many_rows then
								 l_student_id := null;
								 l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Multiple Students found, Verify Student Unique Id is correct';
				 end;
        else
          -- birth date is not valid so stu id will not be found.
          l_student_id := null;
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id could not be found';
        end if;
      -- update the record with the error msg, status, and student unique id.
      update district_tsi_data
         set status = case when l_error_msg is not null then 'ERROR' else status end,
             error_message = l_error_msg,
             tsds_student_unique_id = l_student_id,
             birth_date = l_birth_date
        where rowid = rec.ROWID;
      end loop;

  end prc_validate_tsi_data;
  /*---------------------------------------------------------------------
  -
  - Procedure:    prc_validate_tsi_data
  - Purpose:      validate the TSI2 data and update status for error rows
  -
  ---------------------------------------------------------------------*/
  procedure prc_validate_tsi2_data(p_file_name_school_year varchar2
                                 ,p_school_year           varchar2
                                 ,p_district_id           varchar2)
  is
  l_error_msg   varchar2(2000);
  l_student_id  varchar2(20);
  l_birth_date  varchar2(20);
  begin
    -- loop through the rows
    for rec in (select d.*,d.rowid
                from DISTRICT_TSI2_DATA d
                where d.FILE_NAME = p_file_name_school_year)
      loop
        l_error_msg := null;
        l_student_id := null;
        l_birth_date := null;

        if rec.FIRST_NAME is null then
          l_error_msg := 'Student First Name is missing';
        end if;

        if rec.LAST_NAME is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Last Name is missing';
        end if;

        if rec.BIRTH_DATE is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Birth Date is missing';
        else
          if is_date(rec.BIRTH_DATE,'MM/DD/YYYY') then
            l_birth_date := to_char(to_date(rec.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY');
          elsif is_date(rec.BIRTH_DATE,'YYYY-MM-DD')  then
            l_birth_date := to_char(to_date(rec.BIRTH_DATE,'YYYY-MM-DD'),'MM/DD/YYYY');
          else
            l_birth_date := null;
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Birth Date Format is incorrect - MM/DD/YYYY or YYYY-MM-DD';
          end if;
        end if;

        if rec.TEST_START_STR is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Start Date is missing';
        end if;

        if rec.TEST_START is null
          and rec.TEST_START_STR is not null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Start Date Format is incorrect - MM/DD/YYYY';
        end if;

        if rec.TSI2_ELAR_DIAGNOSTIC is not null
          and (not is_number(rec.TSI2_ELAR_DIAGNOSTIC)
          or to_number(rec.TSI2_ELAR_DIAGNOSTIC) not between 1 and 6) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'ELAR Diagnostic score not between 1 and 6 or invalid';
        end if;

        if rec.TSI2_ELAR_ESSAY is not null
          and (not is_number(rec.TSI2_ELAR_ESSAY)
          or to_number(rec.TSI2_ELAR_ESSAY) not between 1 and 8) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'ELAR Essay score not between 1 and 8 or invalid';
        end if;

        if rec.TSI2_ELAR_READINESS is not null
          and (not is_number(rec.TSI2_ELAR_READINESS)
          or to_number(rec.TSI2_ELAR_READINESS) not between 910 and 990) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'ELAR Readiness score not between 910 and 990 or invalid';
        end if;

        if rec.TSI2_MATH_DIAGNOSTIC is not null
          and (not is_number(rec.TSI2_MATH_DIAGNOSTIC)
          or to_number(rec.TSI2_MATH_DIAGNOSTIC) not between 1 and 6) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Math Diagnostic score not between 1 and 6 or invalid';
        end if;

        if rec.TSI2_MATH_READINESS is not null
          and (not is_number(rec.TSI2_MATH_READINESS)
          or to_number(rec.TSI2_MATH_READINESS) not between 910 and 990) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Math Readiness score not between 910 and 990 or invalid';
        end if;

        if is_date(rec.BIRTH_DATE,'MM/DD/YYYY') then -- sql will crash if birth date invalid
        -- check for student id, if found then add the id to the record else report an error.
          begin
            select c.STUDENT_UNIQUE_ID
              into l_student_id
              from district_student_cache c
             where district_ID = p_district_id
               and school_year = p_school_year
               and (rec.supplemental_id = c.student_unique_id
                or rec.student_id = c.student_unique_id
                or rec.student_id = c.local_code
                or replace(trim(upper(c.FIRST_NAME) || upper(c.LAST_SURNAME) || to_char(to_date(c.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
                   = replace(trim(upper(rec.FIRST_NAME) || upper(rec.LAST_NAME) || to_char(to_date(rec.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', ''));
          exception
            when no_data_found then
                 begin
										select c.STUDENT_UNIQUE_ID
											into l_student_id
											from district_student_cache c
										 where district_ID = p_district_id
											 and replace(trim(upper(c.FIRST_NAME) || upper(c.LAST_SURNAME) || to_char(to_date(c.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
									         = replace(trim(upper(rec.FIRST_NAME) || upper(rec.LAST_NAME) || to_char(to_date(rec.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
											 and rownum = 1;
										-- student was found in a prior school year
										l_student_id := null;
										l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id was found in a prior school year but not in'||p_school_year;
									exception
										when no_data_found then
											   -- student was not foiund at all
												 l_student_id := null;
												 l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id could not be found';
									end;
            when too_many_rows then
								 l_student_id := null;
								 l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Multiple Students found, Verify Student Unique Id is correct';
					end;
        else
          -- birth date is not valid so stu id will not be found.
          l_student_id := null;
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id could not be found';
        end if;

        -- update the record with the error msg, status, and student unique id.
        update district_tsi2_data
         set status = case when l_error_msg is not null then 'ERROR' else status end,
             error_message = l_error_msg,
             supplemental_id = l_student_id,
             birth_date = l_birth_date
        where rowid = rec.ROWID;
      end loop;

  end prc_validate_tsi2_data;

  /*---------------------------------------------------------------------
  -
  - Procedure:    prc_validate_act_data
  - Purpose:      validate the ACT data and update status for error rows
  -
  ---------------------------------------------------------------------*/
  procedure prc_validate_act_data(p_file_name_school_year varchar2
                                 ,p_school_year           varchar2
                                 ,p_district_id           varchar2)
  is
  l_error_msg   varchar2(2000);
  l_student_id  varchar2(20);
  begin
    -- loop through the rows
    for rec in (select d.*,d.rowid
                from DISTRICT_ACT_DATA d
                where d.FILE_NAME = p_file_name_school_year)
      loop
        l_error_msg := null;
        l_student_id := null;

        if rec.FIRST_NAME is null then
          l_error_msg := 'Student First Name is missing';
        end if;

        if rec.LAST_NAME is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Last Name is missing';
        end if;

        if rec.BIRTH_DATE is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Birth Date is missing';
        elsif not is_date(rec.BIRTH_DATE,'MM/DD/YYYY') then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Birth Date Format is incorrect - MM/DD/YYYY';
        end if;

        if rec.TEST_DATE_MONTH_AND_YEAR is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date is missing';
        elsif not is_date(rec.TEST_DATE_MONTH_AND_YEAR,'MM/DD/YYYY') then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date Format is incorrect - MM/DD/YYYY';
        end if;

        if not ((rec.ACT_SCALE_SCORES_COMPOSITE is null or rec.ACT_SCALE_SCORES_COMPOSITE = '--' )
							 or (pkg_assessment_upload.is_number(rec.ACT_SCALE_SCORES_COMPOSITE)
									and to_number(rec.ACT_SCALE_SCORES_COMPOSITE) between 1 and 36)) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Composite score not between 1 and 36 or invalid';
        end if;

        if not ((rec.ACT_SCALE_SCORES_ENGLISH is null or rec.ACT_SCALE_SCORES_ENGLISH = '--' )
							 or (pkg_assessment_upload.is_number(rec.ACT_SCALE_SCORES_ENGLISH)
									and to_number(rec.ACT_SCALE_SCORES_ENGLISH) between 1 and 36)) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'English score not between 1 and 36 or invalid';
        end if;

        if not ((rec.ACT_SCALE_SCORES_MATH is null or rec.ACT_SCALE_SCORES_MATH = '--' )
							 or (pkg_assessment_upload.is_number(rec.ACT_SCALE_SCORES_MATH)
									and to_number(rec.ACT_SCALE_SCORES_MATH) between 1 and 36)) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Math score not between 1 and 36 or invalid';
        end if;

        if not ((rec.ACT_SCALE_SCORES_READING is null or rec.ACT_SCALE_SCORES_READING = '--' )
							 or (pkg_assessment_upload.is_number(rec.ACT_SCALE_SCORES_READING)
									and to_number(rec.ACT_SCALE_SCORES_READING) between 1 and 36)) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Reading score not between 1 and 36 or invalid';
        end if;

        if not ((rec.ACT_SCALE_SCORES_SCIENCE is null or rec.ACT_SCALE_SCORES_SCIENCE = '--' )
							 or (pkg_assessment_upload.is_number(rec.ACT_SCALE_SCORES_SCIENCE)
									and to_number(rec.ACT_SCALE_SCORES_SCIENCE) between 1 and 36)) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Science score not between 1 and 36 or invalid';
        end if;

        --apex_debug.message('>>>>>>>>>>>> DOB: ' || rec.BIRTH_DATE);
        --apex_debug.message('>>>>>>>>>>>> error: ' || l_error_msg);
        if is_date(rec.BIRTH_DATE,'MM/DD/YYYY') then -- sql will crash if birth date invalid
          -- check for student id, if found then add the id to the record else report an error.
          begin
            select c.STUDENT_UNIQUE_ID
              into l_student_id
              from district_student_cache c
             where district_ID = p_district_id
               and school_year = p_school_year
               and replace(trim(upper(c.FIRST_NAME) || upper(c.LAST_SURNAME) || to_char(to_date(c.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
                   = replace(trim(upper(rec.FIRST_NAME) || upper(rec.LAST_NAME) || to_char(to_date(rec.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '');
          exception
            when no_data_found then
                 begin
									select c.STUDENT_UNIQUE_ID
										into l_student_id
										from district_student_cache c
									 where district_ID = p_district_id
										 and replace(trim(upper(c.FIRST_NAME) || upper(c.LAST_SURNAME) || to_char(to_date(c.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
												 = replace(trim(upper(rec.FIRST_NAME) || upper(rec.LAST_NAME) || to_char(to_date(rec.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
										 and rownum = 1;
									-- student was found in a prior school year
									l_student_id := null;
									l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id was found in a prior school year but not in'||p_school_year;
								exception
									when no_data_found then
											 -- student was not foiund at all
											 l_student_id := null;
											 l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id could not be found';
								end;
          end;
        else
          -- birth date is not valid so stu id will not be found.
          l_student_id := null;
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id could not be found';
        end if;
        apex_debug.message('>>>>>>>>>>>> error: ' || l_error_msg);
      -- update the record with the error msg, status, and student unique id.
      update district_act_data
         set status = case when l_error_msg is not null then 'ERROR' else status end,
             error_message = l_error_msg,
             tsds_student_unique_id = l_student_id
        where rec.ROWID = rowid;
      end loop;

  end prc_validate_act_data;
  /*---------------------------------------------------------------------
  -
  - Procedure:    prc_validate_ap_data
  - Purpose:      validate the AP data and update status for error rows
  -
  ---------------------------------------------------------------------*/
  procedure prc_validate_ap_data(p_file_name_school_year varchar2
                                 ,p_school_year           varchar2
                                 ,p_district_id           varchar2)
  is
  l_error_msg   varchar2(2000);
  l_student_id  varchar2(20);
  l_birth_date  varchar2(20);
  begin
    -- loop through the rows
    for rec in (select d.*,d.rowid
                from DISTRICT_AP_DATA d
                where d.FILE_NAME = p_file_name_school_year)
      loop
        l_error_msg := null;
        l_student_id := null;
        l_birth_date := null;
/***********************
ADD RANGE CHECK ON SCORE
***********************/
        if rec.FIRST_NAME is null then
          l_error_msg := 'Student First Name is missing';
        end if;

        if rec.LAST_NAME is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Last Name is missing';
        end if;

        if rec.BIRTH_DATE is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Birth Date is missing';
        else
          if is_date(rec.BIRTH_DATE,'MM/DD/YYYY') then
            l_birth_date := to_char(to_date(rec.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY');
          elsif is_date(rec.BIRTH_DATE,'YYYY-MM-DD')  then
            l_birth_date := to_char(to_date(rec.BIRTH_DATE,'YYYY-MM-DD'),'MM/DD/YYYY');
          else
            l_birth_date := null;
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Birth Date Format is incorrect - MM/DD/YYYY or YYYY-MM-DD';
          end if;
        end if;

        if rec.ADMIN_YEAR_01_STR is null
          and rec.exam_code_01 is null
          and rec.exam_score_01 is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student has no test scores, Admin year 01 required';
        end if;

        if rec.ADMIN_YEAR_01 is null
          and rec.ADMIN_YEAR_01_STR is not null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 01 Format is incorrect - must be year in YY or YYYY format';
        end if;

        if rec.admin_year_01 is not null
          and (rec.exam_code_01 is null
               or rec.exam_score_01 is null) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student has missing test code or test score for Exam Year 01';
        end if;

        if rec.admin_year_01 is not null
          and rec.admin_year_02 is not null
          and (rec.exam_code_02 is null
               or rec.exam_score_02 is null) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student has missing test code or test score for Exam Year 02';
        end if;

        if rec.ADMIN_YEAR_02 is null
          and rec.ADMIN_YEAR_02_STR is not null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 02 Format is incorrect - must be year in YY or YYYY format';
        end if;

        if rec.ADMIN_YEAR_02 is not null
          and rec.ADMIN_YEAR_02 < add_months( trunc(sysdate), -12*10 ) then -- within last 10 years so good
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 02 is out of range, Be sure it is within 10 years';
        end if;

        if rec.ADMIN_YEAR_02 is not null
           and pkg_assessment_upload.is_number(p_str => rec.exam_score_02)
           and rec.exam_score_02  between 1 and 5 then
            null;  -- score is present and in range so it is good
        else
          if (rec.ADMIN_YEAR_02 is null
            and rec.exam_code_02 is null
            and rec.exam_score_02 is null) then
            null; -- all fields are blank
          else
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student exam score for Exam Year 02 is out of range.  Must be between 1 and 5';
          end if;
        end if;

        if rec.admin_year_01 is not null
          and rec.admin_year_03 is not null
          and (rec.exam_code_03 is null
               or rec.exam_score_03 is null) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student has missing test code or test score for Exam Year 03';
        end if;

        if rec.ADMIN_YEAR_03 is null
          and rec.ADMIN_YEAR_03_STR is not null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 03 Format is incorrect - must be year in YY or YYYY format';
        end if;

        if rec.ADMIN_YEAR_03 is not null
          and rec.ADMIN_YEAR_03 < add_months( trunc(sysdate), -12*10 ) then -- within last 10 years so good
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 03 is out of range, Be sure it is within 10 years';
        end if;

        if rec.ADMIN_YEAR_03 is not null
           and pkg_assessment_upload.is_number(p_str => rec.exam_score_03)
           and rec.exam_score_03  between 1 and 5 then
            null;  -- score is present and in range so it is good
        else
          if (rec.ADMIN_YEAR_03 is null
            and rec.exam_code_03 is null
            and rec.exam_score_03 is null) then
            null; -- all fields are blank ignore
          else
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student exam score for Exam Year 03 is out of range.  Must be between 1 and 5';
          end if;
        end if;

        if rec.admin_year_01 is not null
          and rec.admin_year_04 is not null
          and (rec.exam_code_04 is null
               or rec.exam_score_04 is null) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student has missing test code or test score for Exam Year 04';
        end if;

        if rec.ADMIN_YEAR_04 is null
          and rec.ADMIN_YEAR_04_STR is not null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 04 Format is incorrect - must be year in YY or YYYY format';
        end if;

        if rec.ADMIN_YEAR_04 is not null
          and rec.ADMIN_YEAR_04 < add_months( trunc(sysdate), -12*10 ) then -- within last 10 years so good
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 04 is out of range, Be sure it is within 10 years';
        end if;

        if rec.ADMIN_YEAR_04 is not null
           and pkg_assessment_upload.is_number(p_str => rec.exam_score_04)
           and rec.exam_score_04  between 1 and 5 then
            null;  -- score is present and in range so it is good
        else
          if (rec.ADMIN_YEAR_04 is null
            and rec.exam_code_04 is null
            and rec.exam_score_04 is null) then
            null; -- all fields are blank ignore
          else
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student exam score for Exam Year 04 is out of range.  Must be between 1 and 5';
          end if;
        end if;

        if rec.admin_year_01 is not null
          and rec.admin_year_05 is not null
          and (rec.exam_code_05 is null
               or rec.exam_score_05 is null) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student has missing test code or test score for Exam Year 05';
        end if;

        if rec.ADMIN_YEAR_05 is null
          and rec.ADMIN_YEAR_05_STR is not null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 05 Format is incorrect - must be year in YY or YYYY format';
        end if;

        if rec.ADMIN_YEAR_05 is not null
          and rec.ADMIN_YEAR_05 < add_months( trunc(sysdate), -12*10 ) then -- within last 10 years so good
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 05 is out of range, Be sure it is within 10 years';
        end if;

        if rec.ADMIN_YEAR_05 is not null
           and pkg_assessment_upload.is_number(p_str => rec.exam_score_05)
           and rec.exam_score_05  between 1 and 5 then
            null;  -- score is present and in range so it is good
        else
          if (rec.ADMIN_YEAR_05 is null
            and rec.exam_code_05 is null
            and rec.exam_score_05 is null) then
            null; -- all fields are blank ignore
          else
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student exam score for Exam Year 05 is out of range.  Must be between 1 and 5';
          end if;
        end if;

        if rec.admin_year_01 is not null
          and rec.admin_year_06 is not null
          and (rec.exam_code_06 is null
               or rec.exam_score_06 is null) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student has missing test code or test score for Exam Year 06';
        end if;

        if rec.ADMIN_YEAR_06 is null
          and rec.ADMIN_YEAR_06_STR is not null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 06 Format is incorrect - must be year in YY or YYYY format';
        end if;

        if rec.ADMIN_YEAR_06 is not null
          and rec.ADMIN_YEAR_06 < add_months( trunc(sysdate), -12*10 ) then -- within last 10 years so good
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 06 is out of range, Be sure it is within 10 years';
        end if;

        if rec.ADMIN_YEAR_06 is not null
           and pkg_assessment_upload.is_number(p_str => rec.exam_score_06)
           and rec.exam_score_06  between 1 and 5 then
            null;  -- score is present and in range so it is good
        else
          if (rec.ADMIN_YEAR_06 is null
            and rec.exam_code_06 is null
            and rec.exam_score_06 is null) then
            null; -- all fields are blank ignore
          else
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student exam score for Exam Year 06 is out of range.  Must be between 1 and 5';
          end if;
        end if;

        if rec.admin_year_01 is not null
          and rec.admin_year_07 is not null
          and (rec.exam_code_07 is null
               or rec.exam_score_07 is null) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student has missing test code or test score for Exam Year 07';
        end if;

        if rec.ADMIN_YEAR_07 is null
          and rec.ADMIN_YEAR_07_STR is not null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 07 Format is incorrect - must be year in YY or YYYY format';
        end if;

        if rec.ADMIN_YEAR_07 is not null
          and rec.ADMIN_YEAR_07 < add_months( trunc(sysdate), -12*10 ) then -- within last 10 years so good
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 07 is out of range, Be sure it is within 10 years';
        end if;

        if rec.ADMIN_YEAR_07 is not null
           and pkg_assessment_upload.is_number(p_str => rec.exam_score_07)
           and rec.exam_score_07  between 1 and 5 then
            null;  -- score is present and in range so it is good
        else
          if (rec.ADMIN_YEAR_07 is null
            and rec.exam_code_07 is null
            and rec.exam_score_07 is null) then
            null; -- all fields are blank ignore
          else
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student exam score for Exam Year 07 is out of range.  Must be between 1 and 5';
          end if;
        end if;

        if rec.admin_year_01 is not null
          and rec.admin_year_08 is not null
          and (rec.exam_code_08 is null
               or rec.exam_score_08 is null) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student has missing test code or test score for Exam Year 08';
        end if;

        if rec.ADMIN_YEAR_08 is null
          and rec.ADMIN_YEAR_08_STR is not null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 08 Format is incorrect - must be year in YY or YYYY format';
        end if;

        if rec.ADMIN_YEAR_08 is not null
          and rec.ADMIN_YEAR_08 < add_months( trunc(sysdate), -12*10 ) then -- within last 10 years so good
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 08 is out of range, Be sure it is within 10 years';
        end if;

        if rec.ADMIN_YEAR_08 is not null
           and pkg_assessment_upload.is_number(p_str => rec.exam_score_08)
           and rec.exam_score_08  between 1 and 5 then
            null;  -- score is present and in range so it is good
        else
          if (rec.ADMIN_YEAR_08 is null
            and rec.exam_code_08 is null
            and rec.exam_score_08 is null) then
            null; -- all fields are blank ignore
          else
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student exam score for Exam Year 08 is out of range.  Must be between 1 and 5';
          end if;
        end if;

        if rec.admin_year_01 is not null
          and rec.admin_year_09 is not null
          and (rec.exam_code_09 is null
               or rec.exam_score_09 is null) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student has missing test code or test score for Exam Year 09';
        end if;

        if rec.ADMIN_YEAR_09 is null
          and rec.ADMIN_YEAR_09_STR is not null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 09 Format is incorrect - must be year in YY or YYYY format';
        end if;

        if rec.ADMIN_YEAR_09 is not null
          and rec.ADMIN_YEAR_09 < add_months( trunc(sysdate), -12*10 ) then -- within last 10 years so good
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 09 is out of range, Be sure it is within 10 years';
        end if;

        if rec.ADMIN_YEAR_09 is not null
           and pkg_assessment_upload.is_number(p_str => rec.exam_score_09)
           and rec.exam_score_09  between 1 and 5 then
            null;  -- score is present and in range so it is good
        else
          if (rec.ADMIN_YEAR_09 is null
            and rec.exam_code_09 is null
            and rec.exam_score_09 is null) then
            null; -- all fields are blank ignore
          else
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student exam score for Exam Year 09 is out of range.  Must be between 1 and 5';
          end if;
        end if;

        if rec.admin_year_01 is not null
          and rec.admin_year_10 is not null
          and (rec.exam_code_10 is null
               or rec.exam_score_10 is null) then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student has missing test code or test score for Exam Year 10';
        end if;

        if rec.ADMIN_YEAR_10 is null
          and rec.ADMIN_YEAR_10_STR is not null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 10 Format is incorrect - must be year in YY or YYYY format';
        end if;

        if rec.ADMIN_YEAR_10 is not null
          and rec.ADMIN_YEAR_10 < add_months( trunc(sysdate), -12*10 ) then -- within last 10 years so good
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Test Date 10 is out of range, Be sure it is within 10 years';
        end if;

        if rec.ADMIN_YEAR_10 is not null
           and pkg_assessment_upload.is_number(p_str => rec.exam_score_10)
           and rec.exam_score_10  between 1 and 5 then
            null;  -- score is present and in range so it is good
        else
          if (rec.ADMIN_YEAR_10 is null
            and rec.exam_code_10 is null
            and rec.exam_score_10 is null) then
            null; -- all fields are blank ignore
          else
            l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student exam score for Exam Year 10 is out of range.  Must be between 1 and 5';
          end if;
        end if;

        if is_date(rec.BIRTH_DATE,'MM/DD/YYYY') then -- sql will crash if birth date invalid
          -- check for student id, if found then add the id to the record else report an error.
					--dbms_output.put_line('name: '||rec.FIRST_NAME||' ' ||rec.LAST_NAME||' DOB: '||rec.BIRTH_DATE);
          begin
            select c.STUDENT_UNIQUE_ID
              into l_student_id
              from district_student_cache c
             where district_ID = p_district_id
               and school_year = p_school_year
               and replace(trim(upper(c.FIRST_NAME) || upper(c.LAST_SURNAME) || to_char(to_date(c.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
                   = replace(trim(upper(rec.FIRST_NAME) || upper(rec.LAST_NAME) || to_char(to_date(rec.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '');
          exception
            when no_data_found then
                begin
										select c.STUDENT_UNIQUE_ID
											into l_student_id
											from district_student_cache c
										 where district_ID = p_district_id
											 and replace(trim(upper(c.FIRST_NAME) || upper(c.LAST_SURNAME) || to_char(to_date(c.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
									         = replace(trim(upper(rec.FIRST_NAME) || upper(rec.LAST_NAME) || to_char(to_date(rec.BIRTH_DATE,'MM/DD/YYYY'),'MM/DD/YYYY')),' ', '')
											 and rownum = 1;
										-- student was found in a prior school year
										l_student_id := null;
										l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id was found in a prior school year but not in'||p_school_year;
									exception
										when no_data_found then
											   -- student was not foiund at all
												 l_student_id := null;
												 l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id could not be found';
                  end;
					 when too_many_rows then
								 l_student_id := null;
								 l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Multiple Students found, Verify Student Unique Id is correct';
									
          end;
        else
          -- birth date is not valid so stu id will not be found.
          l_student_id := null;
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id could not be found';
        end if;
        -- update the record with the error msg, status, and student unique id.
        update district_ap_data
         set status = case when l_error_msg is not null then 'ERROR' else status end,
             error_message = l_error_msg,
             tsds_student_unique_id = l_student_id,
             birth_date = l_birth_date
        where rowid = rec.ROWID;
      end loop;

  end prc_validate_ap_data;
  /*---------------------------------------------------------------------
  -
  - Procedure:    prc_validate_ib_data
  - Purpose:      validate the ib data and update status for error rows
  -
  ---------------------------------------------------------------------*/
  procedure prc_validate_ib_data(p_file_name_school_year varchar2
                                 ,p_school_year           varchar2
                                 ,p_district_id           varchar2)
  is
  l_error_msg   varchar2(2000);
  l_student_id  varchar2(20);
  begin
    -- loop through the rows
    for rec in (select d.*,d.rowid
                from DISTRICT_IB_DATA d
                where d.FILE_NAME = p_file_name_school_year)
      loop
        l_error_msg := null;
        l_student_id := null;

        if rec.STUDENT_ID is null then
          l_error_msg := 'Student ID is missing';
        end if;

        if rec.YEAR is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Admin Year is missing';
        elsif not is_number(rec.YEAR)
         or to_number(rec.YEAR) not between 2018 and 2040 then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Admin Year is not a valid number or out of range';
        end if;

        if rec.SUBJECT is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Subject is missing';
        end if;

        if rec.EXAM_GRADE is null then
          l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Exam Grade is missing';
        end if;

        -- check for student id, if found then add the id to the record else report an error.
        begin
          select c.STUDENT_UNIQUE_ID
            into l_student_id
            from district_student_cache c
           where district_ID = p_district_id
             and school_year = p_school_year
             and (rec.student_id = c.student_unique_id
              or rec.student_id = c.local_code);

        exception
          when no_data_found then
              begin
										select c.STUDENT_UNIQUE_ID
											into l_student_id
											from district_student_cache c
										 where district_ID = p_district_id
											 and (rec.student_id = c.student_unique_id
							            or rec.student_id = c.local_code)
											 and rownum = 1;
										-- student was found in a prior school year
										l_student_id := null;
										l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id was found in a prior school year but not in'||p_school_year;
									exception
										when no_data_found then
											   -- student was not foiund at all
												 l_student_id := null;
												 l_error_msg := l_error_msg || case when l_error_msg is not null then '; ' else '' end || 'Student Unique Id could not be found';
									end;
        end;
      -- update the record with the error msg, status, and student unique id.
      update district_ib_data
         set status = case when l_error_msg is not null then 'ERROR' else status end,
             error_message = l_error_msg,
             tsds_student_unique_id = l_student_id
        where rowid = rec.ROWID;
      end loop;

  end prc_validate_ib_data;

  /*---------------------------------------------------------------------
  -
  - Procedure:    prc_ignore_all_errors
  - Purpose:      updates all the error rows for a file to IGNORE
  -
  ---------------------------------------------------------------------*/
  procedure prc_ignore_all_errors (p_file_name_school_year varchar2
                                  ,p_test_type             varchar2)
  is
  l_error_msg   varchar2(2000);
  l_student_id  varchar2(20);
  begin
    case p_test_type
      when 'IB' then
        update district_IB_data
           set status = 'IGNORE'
          where file_name = p_file_name_school_year
            and status = 'ERROR';
      when 'ACT' then
        update district_ACT_data
           set status = 'IGNORE'
          where file_name = p_file_name_school_year
            and status = 'ERROR';
      when 'AP' then
        update district_AP_data
           set status = 'IGNORE'
          where file_name = p_file_name_school_year
            and status = 'ERROR';
      when 'SAT' then
        update district_SAT_data
           set status = 'IGNORE'
          where file_name = p_file_name_school_year
            and status = 'ERROR';
      when 'TSI' then
        update district_TSI_data
           set status = 'IGNORE'
          where file_name = p_file_name_school_year
            and status = 'ERROR';
      when 'TSI2' then
        update district_TSI2_data
           set status = 'IGNORE'
          where file_name = p_file_name_school_year
            and status = 'ERROR';
      else
        apex_error.add_error(p_message          => 'There was a problem ignoring the errors in the file: ' || p_file_name_school_year ,
                             p_display_location => apex_error.c_inline_in_notification,
                             p_page_item_name   => '');
      end case;

  end prc_ignore_all_errors;

--------------------------------------------------------------
-- update procedure for table DISTRICT_ACT_DATA
   procedure prc_upd_district_act_data (
      P_LAST_NAME                  in varchar2,
      P_FIRST_NAME                 in varchar2,
      P_MID_INIT                   in varchar2                        default null,
      P_BIRTH_DATE                 in varchar2,
      P_ACT_SCALE_SCORES_COMPOSITE in varchar2                        default null,
      P_ACT_SCALE_SCORES_ENGLISH   in varchar2                        default null,
      P_ACT_SCALE_SCORES_MATH      in varchar2                        default null,
      P_ACT_SCALE_SCORES_READING   in varchar2                        default null,
      P_ACT_SCALE_SCORES_SCIENCE   in varchar2                        default null,
      P_TEST_DATE_MONTH_AND_YEAR   in varchar2                        default null,
      P_STATUS                     in varchar2                        default null,
      P_SCHOOL_YEAR_TO_LOAD        in varchar2                        default null,
      P_TSDS_STUDENT_UNIQUE_ID     in varchar2                        default null,
      P_ROW_ID                     in varchar2
   ) is

   begin

         update DISTRICT_ACT_DATA set
            LAST_NAME                    = P_LAST_NAME,
            FIRST_NAME                   = P_FIRST_NAME,
            MID_INIT                     = P_MID_INIT,
            BIRTH_DATE                   = P_BIRTH_DATE,
            ACT_SCALE_SCORES_COMPOSITE   = P_ACT_SCALE_SCORES_COMPOSITE,
            ACT_SCALE_SCORES_ENGLISH     = P_ACT_SCALE_SCORES_ENGLISH,
            ACT_SCALE_SCORES_MATH        = P_ACT_SCALE_SCORES_MATH,
            ACT_SCALE_SCORES_READING     = P_ACT_SCALE_SCORES_READING,
            ACT_SCALE_SCORES_SCIENCE     = P_ACT_SCALE_SCORES_SCIENCE,
            TEST_DATE_MONTH_AND_YEAR     = P_TEST_DATE_MONTH_AND_YEAR,
            STATUS                       = P_STATUS,
            SCHOOL_YEAR_TO_LOAD          = P_SCHOOL_YEAR_TO_LOAD,
            TSDS_STUDENT_UNIQUE_ID       = P_TSDS_STUDENT_UNIQUE_ID
         where rowid = P_ROW_ID;

   end prc_upd_district_act_data;
--------------------------------------------------------------
-- update procedure for table DISTRICT_AP_DATA
   procedure prc_upd_district_ap_data (
      P_LAST_NAME              in varchar2,
      P_FIRST_NAME             in varchar2,
      P_MIDDLE_INITIAL         in varchar2                        default null,
      P_BIRTH_DATE             in varchar2,
      P_ADMIN_YEAR_01_STR      in varchar2                        default null,
      P_EXAM_CODE_01           in varchar2                        default null,
      P_EXAM_SCORE_01          in varchar2                        default null,
      P_ADMIN_YEAR_02_STR      in varchar2                        default null,
      P_EXAM_CODE_02           in varchar2                        default null,
      P_EXAM_SCORE_02          in varchar2                        default null,
      P_ADMIN_YEAR_03_STR      in varchar2                        default null,
      P_EXAM_CODE_03           in varchar2                        default null,
      P_EXAM_SCORE_03          in varchar2                        default null,
      P_ADMIN_YEAR_04_STR      in varchar2                        default null,
      P_EXAM_CODE_04           in varchar2                        default null,
      P_EXAM_SCORE_04          in varchar2                        default null,
      P_ADMIN_YEAR_05_STR      in varchar2                        default null,
      P_EXAM_CODE_05           in varchar2                        default null,
      P_EXAM_SCORE_05          in varchar2                        default null,
      P_ADMIN_YEAR_06_STR      in varchar2                        default null,
      P_EXAM_CODE_06           in varchar2                        default null,
      P_EXAM_SCORE_06          in varchar2                        default null,
      P_ADMIN_YEAR_07_STR      in varchar2                        default null,
      P_EXAM_CODE_07           in varchar2                        default null,
      P_EXAM_SCORE_07          in varchar2                        default null,
      P_ADMIN_YEAR_08_STR      in varchar2                        default null,
      P_EXAM_CODE_08           in varchar2                        default null,
      P_EXAM_SCORE_08          in varchar2                        default null,
      P_ADMIN_YEAR_09_STR      in varchar2                        default null,
      P_EXAM_CODE_09           in varchar2                        default null,
      P_EXAM_SCORE_09          in varchar2                        default null,
      P_ADMIN_YEAR_10_STR      in varchar2                        default null,
      P_EXAM_CODE_10           in varchar2                        default null,
      P_EXAM_SCORE_10          in varchar2                        default null,
      P_STATUS                 in varchar2                        default null,
      P_SCHOOL_YEAR_TO_LOAD    in varchar2                        default null,
      P_TSDS_STUDENT_UNIQUE_ID in varchar2                        default null,
      P_ROW_ID                 in varchar2
   ) is

   begin

     update DISTRICT_AP_DATA set
            LAST_NAME                = P_LAST_NAME,
            FIRST_NAME               = P_FIRST_NAME,
            MIDDLE_INITIAL           = P_MIDDLE_INITIAL,
            BIRTH_DATE               = P_BIRTH_DATE,
            ADMIN_YEAR_01_STR        = P_ADMIN_YEAR_01_STR,
            ADMIN_YEAR_01            = case when length(trim(P_ADMIN_YEAR_01_STR)) = 2 then to_date('20'||trim(P_ADMIN_YEAR_01_STR)||'-05-01', 'YYYY-MM-DD')
                                            when length(trim(P_ADMIN_YEAR_01_STR)) = 4 then to_date(trim(P_ADMIN_YEAR_01_STR)||'-05-01', 'YYYY-MM-DD')
                                            else null end,
            EXAM_CODE_01             = P_EXAM_CODE_01,
            EXAM_SCORE_01            = P_EXAM_SCORE_01,
            ADMIN_YEAR_02_STR        = P_ADMIN_YEAR_02_STR,
            ADMIN_YEAR_02            = case when length(trim(P_ADMIN_YEAR_02_STR)) = 2 then to_date('20'||trim(P_ADMIN_YEAR_02_STR)||'-05-01', 'YYYY-MM-DD')
                                            when length(trim(P_ADMIN_YEAR_02_STR)) = 4 then to_date(trim(P_ADMIN_YEAR_02_STR)||'-05-01', 'YYYY-MM-DD')
                                            else null end,
            EXAM_CODE_02             = P_EXAM_CODE_02,
            EXAM_SCORE_02            = P_EXAM_SCORE_02,
            ADMIN_YEAR_03_STR        = P_ADMIN_YEAR_03_STR,
            ADMIN_YEAR_03            = case when length(trim(P_ADMIN_YEAR_03_STR)) = 2 then to_date('20'||trim(P_ADMIN_YEAR_03_STR)||'-05-01', 'YYYY-MM-DD')
                                            when length(trim(P_ADMIN_YEAR_03_STR)) = 4 then to_date(trim(P_ADMIN_YEAR_03_STR)||'-05-01', 'YYYY-MM-DD')
                                            else null end,
            EXAM_CODE_03             = P_EXAM_CODE_03,
            EXAM_SCORE_03            = P_EXAM_SCORE_03,
            ADMIN_YEAR_04_STR        = P_ADMIN_YEAR_04_STR,
            ADMIN_YEAR_04            = case when length(trim(P_ADMIN_YEAR_04_STR)) = 2 then to_date('20'||trim(P_ADMIN_YEAR_04_STR)||'-05-01', 'YYYY-MM-DD')
                                            when length(trim(P_ADMIN_YEAR_04_STR)) = 4 then to_date(trim(P_ADMIN_YEAR_04_STR)||'-05-01', 'YYYY-MM-DD')
                                            else null end,
            EXAM_CODE_04             = P_EXAM_CODE_04,
            EXAM_SCORE_04            = P_EXAM_SCORE_04,
            ADMIN_YEAR_05_STR        = P_ADMIN_YEAR_05_STR,
            ADMIN_YEAR_05            = case when length(trim(P_ADMIN_YEAR_05_STR)) = 2 then to_date('20'||trim(P_ADMIN_YEAR_05_STR)||'-05-01', 'YYYY-MM-DD')
                                            when length(trim(P_ADMIN_YEAR_05_STR)) = 4 then to_date(trim(P_ADMIN_YEAR_05_STR)||'-05-01', 'YYYY-MM-DD')
                                            else null end,
            EXAM_CODE_05             = P_EXAM_CODE_05,
            EXAM_SCORE_05            = P_EXAM_SCORE_05,
            ADMIN_YEAR_06_STR        = P_ADMIN_YEAR_06_STR,
            ADMIN_YEAR_06            = case when length(trim(P_ADMIN_YEAR_06_STR)) = 2 then to_date('20'||trim(P_ADMIN_YEAR_06_STR)||'-05-01', 'YYYY-MM-DD')
                                            when length(trim(P_ADMIN_YEAR_06_STR)) = 4 then to_date(trim(P_ADMIN_YEAR_06_STR)||'-05-01', 'YYYY-MM-DD')
                                            else null end,
            EXAM_CODE_06             = P_EXAM_CODE_06,
            EXAM_SCORE_06            = P_EXAM_SCORE_06,
            ADMIN_YEAR_07_STR        = P_ADMIN_YEAR_07_STR,
            ADMIN_YEAR_07            = case when length(trim(P_ADMIN_YEAR_07_STR)) = 2 then to_date('20'||trim(P_ADMIN_YEAR_07_STR)||'-05-01', 'YYYY-MM-DD')
                                            when length(trim(P_ADMIN_YEAR_07_STR)) = 4 then to_date(trim(P_ADMIN_YEAR_07_STR)||'-05-01', 'YYYY-MM-DD')
                                            else null end,
            EXAM_CODE_07             = P_EXAM_CODE_07,
            EXAM_SCORE_07            = P_EXAM_SCORE_07,
            ADMIN_YEAR_08_STR        = P_ADMIN_YEAR_08_STR,
            ADMIN_YEAR_08            = case when length(trim(P_ADMIN_YEAR_08_STR)) = 2 then to_date('20'||trim(P_ADMIN_YEAR_08_STR)||'-05-01', 'YYYY-MM-DD')
                                            when length(trim(P_ADMIN_YEAR_08_STR)) = 4 then to_date(trim(P_ADMIN_YEAR_08_STR)||'-05-01', 'YYYY-MM-DD')
                                            else null end,
            EXAM_CODE_08             = P_EXAM_CODE_08,
            EXAM_SCORE_08            = P_EXAM_SCORE_08,
            ADMIN_YEAR_09_STR        = P_ADMIN_YEAR_09_STR,
            ADMIN_YEAR_09            = case when length(trim(P_ADMIN_YEAR_09_STR)) = 2 then to_date('20'||trim(P_ADMIN_YEAR_09_STR)||'-05-01', 'YYYY-MM-DD')
                                            when length(trim(P_ADMIN_YEAR_09_STR)) = 4 then to_date(trim(P_ADMIN_YEAR_09_STR)||'-05-01', 'YYYY-MM-DD')
                                            else null end,
            EXAM_CODE_09             = P_EXAM_CODE_09,
            EXAM_SCORE_09            = P_EXAM_SCORE_09,
            ADMIN_YEAR_10_STR        = P_ADMIN_YEAR_10_STR,
            ADMIN_YEAR_10            = case when length(trim(P_ADMIN_YEAR_10_STR)) = 2 then to_date('20'||trim(P_ADMIN_YEAR_10_STR)||'-05-01', 'YYYY-MM-DD')
                                            when length(trim(P_ADMIN_YEAR_10_STR)) = 4 then to_date(trim(P_ADMIN_YEAR_10_STR)||'-05-01', 'YYYY-MM-DD')
                                            else null end,
            EXAM_CODE_10             = P_EXAM_CODE_10,
            EXAM_SCORE_10            = P_EXAM_SCORE_10,
            STATUS                   = P_STATUS,
            SCHOOL_YEAR_TO_LOAD      = P_SCHOOL_YEAR_TO_LOAD,
            TSDS_STUDENT_UNIQUE_ID   = P_TSDS_STUDENT_UNIQUE_ID
         where rowid = P_ROW_ID;

   end prc_upd_district_ap_data;
--------------------------------------------------------------
-- update procedure for table DISTRICT_IB_DATA
   procedure prc_upd_district_ib_data (
      P_YEAR                   in number                          default null,
      P_STUDENT_ID             in varchar2                        default null,
      P_SCHOOL_SESSION         in varchar2                        default null,
      P_SUBJECT                in varchar2                        default null,
      P_EXAM_GRADE             in varchar2                        default null,
      P_PREDICTED_GRADE        in varchar2                        default null,
      P_STATUS                 in varchar2                        default null,
      P_SCHOOL_YEAR_TO_LOAD    in varchar2                        default null,
      P_TSDS_STUDENT_UNIQUE_ID in varchar2                        default null,
      P_ROW_ID                 in varchar2
   ) is

   begin

         update DISTRICT_IB_DATA set
            YEAR                     = P_YEAR,
            STUDENT_ID               = P_STUDENT_ID,
            SCHOOL_SESSION           = P_SCHOOL_SESSION,
            SUBJECT                  = P_SUBJECT,
            EXAM_GRADE               = P_EXAM_GRADE,
            PREDICTED_GRADE          = P_PREDICTED_GRADE,
            STATUS                   = P_STATUS,
            SCHOOL_YEAR_TO_LOAD      = P_SCHOOL_YEAR_TO_LOAD,
            TSDS_STUDENT_UNIQUE_ID   = P_TSDS_STUDENT_UNIQUE_ID
         where rowid = P_ROW_ID;

   end prc_upd_district_ib_data;
--------------------------------------------------------------
-- update procedure for table DISTRICT_SAT_DATA
   procedure prc_upd_district_sat_data (
      P_AI_CODE                    in varchar2,
      P_LAST_NAME                  in varchar2,
      P_FIRST_NAME                 in varchar2,
      P_NAME_MI                    in varchar2                        default null,
      P_BIRTH_DATE                 in varchar2,
      P_LATEST_SAT_TOTAL           in varchar2                        default null,
      P_LATEST_SAT_EBRW            in varchar2                        default null,
      P_LATEST_SAT_MATH_SECTION    in varchar2                        default null,
      P_LATEST_REGISTRATION_NUM    in varchar2                        default null,
      P_LATEST_ASSESSMENT_DATE_STR in varchar2                        default null,
      P_SECONDARY_ID               in varchar2                        default null,
      P_STATUS                     in varchar2                        default null,
      P_SCHOOL_YEAR_TO_LOAD        in varchar2                        default null,
      P_TSDS_STUDENT_UNIQUE_ID     in varchar2                        default null,
      P_ROW_ID                     in varchar2
   ) is

   begin

      update DISTRICT_SAT_DATA set
            AI_CODE                      = P_AI_CODE,
            LAST_NAME                    = P_LAST_NAME,
            FIRST_NAME                   = P_FIRST_NAME,
            NAME_MI                      = P_NAME_MI,
            BIRTH_DATE                   = P_BIRTH_DATE,
            LATEST_SAT_TOTAL             = P_LATEST_SAT_TOTAL,
            LATEST_SAT_EBRW              = P_LATEST_SAT_EBRW,
            LATEST_SAT_MATH_SECTION      = P_LATEST_SAT_MATH_SECTION,
            LATEST_REGISTRATION_NUM      = P_LATEST_REGISTRATION_NUM,
            LATEST_ASSESSMENT_DATE_STR   = P_LATEST_ASSESSMENT_DATE_STR,
            LATEST_ASSESSMENT_DATE       = to_date(P_LATEST_ASSESSMENT_DATE_STR,'MM/DD/YYYY'),
            SECONDARY_ID                 = P_SECONDARY_ID,
            STATUS                       = P_STATUS,
            SCHOOL_YEAR_TO_LOAD          = P_SCHOOL_YEAR_TO_LOAD,
            TSDS_STUDENT_UNIQUE_ID       = P_TSDS_STUDENT_UNIQUE_ID
         where rowid = P_ROW_ID;

   end prc_upd_district_sat_data;
--------------------------------------------------------------
-- update procedure for table DISTRICT_TSI_DATA
   procedure prc_upd_district_tsi_data (
      P_TEST_START_STR              in varchar2                        default null,
      P_LAST_NAME                   in varchar2                        default null,
      P_FIRST_NAME                  in varchar2                        default null,
      P_MIDDLE_INITIAL              in varchar2                        default null,
      P_STUDENT_ID                  in varchar2                        default null,
      P_BIRTH_DATE                  in varchar2                        default null,
      P_TSI_MATHEMATICS_PLACEMENT   in varchar2                        default null,
      P_TSI_READING_PLACEMENT       in varchar2                        default null,
      P_TSI_WRITING_PLACEMENT       in varchar2                        default null,
      P_TSI_WRITEPLACER             in varchar2                        default null,
      P_ABE_MATHEMATICS_DIAGNOSTICS in varchar2                        default null,
      P_ABE_WRITING_DIAGNOSTICS     in varchar2                        default null,
      P_ABE_READING_DIAGNOSTICS     in varchar2                        default null,
      P_STATUS                      in varchar2                        default null,
      P_SCHOOL_YEAR_TO_LOAD         in varchar2                        default null,
      P_TSDS_STUDENT_UNIQUE_ID      in varchar2                        default null,
      P_ROW_ID                     in varchar2
   ) is

   begin

      update DISTRICT_TSI_DATA set
            TEST_START_STR                = P_TEST_START_STR,
            TEST_START                    = to_date(P_TEST_START_STR,'MM/DD/YYYY'),
            LAST_NAME                     = P_LAST_NAME,
            FIRST_NAME                    = P_FIRST_NAME,
            MIDDLE_INITIAL                = P_MIDDLE_INITIAL,
            STUDENT_ID                    = P_STUDENT_ID,
            BIRTH_DATE                    = P_BIRTH_DATE,
            TSI_MATHEMATICS_PLACEMENT     = P_TSI_MATHEMATICS_PLACEMENT,
            TSI_READING_PLACEMENT         = P_TSI_READING_PLACEMENT,
            TSI_WRITING_PLACEMENT         = P_TSI_WRITING_PLACEMENT,
            TSI_WRITEPLACER               = P_TSI_WRITEPLACER,
            ABE_MATHEMATICS_DIAGNOSTICS   = P_ABE_MATHEMATICS_DIAGNOSTICS,
            ABE_WRITING_DIAGNOSTICS       = P_ABE_WRITING_DIAGNOSTICS,
            ABE_READING_DIAGNOSTICS       = P_ABE_READING_DIAGNOSTICS,
            STATUS                        = P_STATUS,
            SCHOOL_YEAR_TO_LOAD           = P_SCHOOL_YEAR_TO_LOAD,
            TSDS_STUDENT_UNIQUE_ID        = P_TSDS_STUDENT_UNIQUE_ID
         where rowid = P_ROW_ID;


   end prc_upd_district_tsi_data;
--------------------------------------------------------------
-- update procedure for table DISTRICT_TSI2_DATA
   procedure prc_upd_district_tsi2_data (
      P_TEST_START_STR       in varchar2,
      P_LAST_NAME            in varchar2,
      P_FIRST_NAME           in varchar2,
      P_MIDDLE_INITIAL       in varchar2                        default null,
      P_STUDENT_ID           in varchar2                        default null,
      P_BIRTH_DATE           in varchar2,
      P_TSI2_MATH_READINESS  in varchar2                        default null,
      P_TSI2_MATH_DIAGNOSTIC in varchar2                        default null,
      P_TSI2_ELAR_READINESS  in varchar2                        default null,
      P_TSI2_ELAR_DIAGNOSTIC in varchar2                        default null,
      P_TSI2_ELAR_ESSAY      in varchar2                        default null,
      P_SUPPLEMENTAL_ID      in varchar2                        default null,
      P_STATUS               in varchar2                        default null,
      P_SCHOOL_YEAR_TO_LOAD  in varchar2                        default null,
      P_ROW_ID               in varchar2
   ) is
 begin

      update DISTRICT_TSI2_DATA set
            TEST_START_STR         = P_TEST_START_STR,
            TEST_START             = to_date(P_TEST_START_STR,'MM/DD/YYYY'),
            LAST_NAME              = P_LAST_NAME,
            FIRST_NAME             = P_FIRST_NAME,
            MIDDLE_INITIAL         = P_MIDDLE_INITIAL,
            STUDENT_ID             = P_STUDENT_ID,
            BIRTH_DATE             = P_BIRTH_DATE,
            TSI2_MATH_READINESS    = P_TSI2_MATH_READINESS,
            TSI2_MATH_DIAGNOSTIC   = P_TSI2_MATH_DIAGNOSTIC,
            TSI2_ELAR_READINESS    = P_TSI2_ELAR_READINESS,
            TSI2_ELAR_DIAGNOSTIC   = P_TSI2_ELAR_DIAGNOSTIC,
            TSI2_ELAR_ESSAY        = P_TSI2_ELAR_ESSAY,
            SUPPLEMENTAL_ID        = P_SUPPLEMENTAL_ID,
            STATUS                 = P_STATUS,
            SCHOOL_YEAR_TO_LOAD    = P_SCHOOL_YEAR_TO_LOAD
         where rowid = P_ROW_ID;

   end prc_upd_district_tsi2_data;

  /*---------------------------------------------------------------------
  -
  - Procedure:    prc_process_asmt_files
  - Purpose:      this procedure orchestrates the processing of assessment files uploaded by the district
  -
  ---------------------------------------------------------------------*/
  procedure prc_process_asmt_files(p_district_id          varchar2
                                  ,p_user_id              varchar2
                                  ,p_test_type            varchar2
                                  ,p_files_to_upload      varchar2
                                  ,p_school_years         varchar2
                                  )
  is
    l_files                 apex_t_varchar2;
    l_file_name             varchar2(400);
    l_file_name_school_year varchar2(400);
    l_db_link               varchar2(400);
    l_output_directory      varchar2(100);
    l_rows_with_stu_id      number;
    t_school_year           apex_t_varchar2;
  begin
    pkg_assessment_upload.prc_log_status ('Main: Start of processing ' ||  p_test_type || ' test(s) for ' || p_district_id, 'INFO-90', p_user_id);

    -- split out the file names as user may have select multiple
    l_files := apex_string.split(p_str => p_files_to_upload, p_sep => ':');

    for indx in 1 .. l_files.count
    loop
      -- Remove directory path info leaving just the file name
      l_file_name := substr(l_files(indx),INSTR(l_files(indx),'/',-1)+1);
      APEX_DEBUG_MESSAGE.message('>>>>>>>>> File Name = '||l_file_name);
      -- split out the selected school years, Users can choose to apply a file to multiple school years.
      t_school_year := APEX_STRING.split(p_school_years,':');

      -- loop through the school year(s) and replace the test type in the file name with the test type and the school year
      -- ex: 057950_ACT_ver12345.csv ==> 057950_ACT_2022_ver12345.csv
      -- the data will be entered into the test type for each school year selected.
      for x in t_school_year.first..t_school_year.last
        loop
          -- set the file name with the school year in it.
          l_file_name_school_year := regexp_replace(l_file_name,'_','_'||t_school_year(x)||'_',1,2,'i');
          APEX_DEBUG_MESSAGE.message('>>>>>>>>> File Name with sy = '||l_file_name_school_year);
					-- SET THE PROCESSING STATUS
					begin
						insert into edfi_assmt_file_status
							(file_name_school_year,
							 test_type,
							 processing_status,
							 status_update_ts)
						values
							(l_file_name_school_year,
							 P_TEST_TYPE,
							 'Uploading',
							 systimestamp);      
					exception
						when DUP_VAL_ON_INDEX then
							-- there is already an entry for this file so update it for the new run.
							update edfi_assmt_file_status
									set processing_status = 'Uploading',
											status_update_ts = systimestamp
								where file_name_school_year = l_file_name_school_year;
					end;
          -- load the data from the temp table to the schema table based on test type
          pkg_assessment_upload.prc_upload_test_data(v_district_id           => p_district_id,
                                                     v_test_type             => p_test_type,
                                                     v_file                  => l_file_name,
                                                     v_fullpath_file         => l_files(indx),
                                                     v_user_id               => p_user_id,
                                                     v_school_year           => t_school_year(x),
                                                     v_file_name_school_year => l_file_name_school_year);
           
					-- Loading is completed so update the status to Validating
					update edfi_assmt_file_status
							set processing_status = 'Validating',
									status_update_ts = systimestamp
						where file_name_school_year = l_file_name_school_year;
								
          -- Validate the Data and flag the error rows
          case
            when p_test_type = 'SAT' then
              prc_validate_sat_data(P_FILE_NAME_SCHOOL_YEAR => l_file_name_school_year,
                                    P_SCHOOL_YEAR => t_school_year(x),
                                    P_DISTRICT_ID => p_district_id);
            when p_test_type = 'TSI' then
              prc_validate_tsi_data(P_FILE_NAME_SCHOOL_YEAR => l_file_name_school_year,
                                    P_SCHOOL_YEAR => t_school_year(x),
                                    P_DISTRICT_ID => p_district_id);
            when p_test_type = 'TSI2' then
              prc_validate_TSI2_data(P_FILE_NAME_SCHOOL_YEAR => l_file_name_school_year,
                                    P_SCHOOL_YEAR => t_school_year(x),
                                    P_DISTRICT_ID => p_district_id);
            when p_test_type = 'ACT' then
              prc_validate_ACT_data(P_FILE_NAME_SCHOOL_YEAR => l_file_name_school_year,
                                    P_SCHOOL_YEAR => t_school_year(x),
                                    P_DISTRICT_ID => p_district_id);
            when p_test_type = 'AP' then
              prc_validate_AP_data(P_FILE_NAME_SCHOOL_YEAR => l_file_name_school_year,
                                    P_SCHOOL_YEAR => t_school_year(x),
                                    P_DISTRICT_ID => p_district_id);
            when p_test_type = 'IB' then
              prc_validate_ib_data(P_FILE_NAME_SCHOOL_YEAR => l_file_name_school_year,
                                    P_SCHOOL_YEAR => t_school_year(x),
                                    P_DISTRICT_ID => p_district_id);
          end case;

          -- Validating is completed so update the status to Loading ODS
					update edfi_assmt_file_status
							set processing_status = 'Loading ODS',
									status_update_ts = systimestamp
						where file_name_school_year = l_file_name_school_year;
 
          -- Kick of an asynchronous job to load the data to the ODS via the API
          if p_test_type = 'SAT' then
						dbms_scheduler.create_job (
													 job_name   =>  DBMS_SCHEDULER.GENERATE_JOB_NAME (prefix => 'D'||p_district_id||'SAT_'),
													 job_type   => 'PLSQL_BLOCK',
													 job_action =>
														 'BEGIN
																pkg_assessment_upload.prc_process_sat_data_api(p_district_id => '''||p_district_id||''',
                                                 p_school_year => '''||t_school_year(x)||''',
                                                 p_file_name_school_year => '''||l_file_name_school_year||''',
                                                 p_status => ''PENDING'');
															END;',
													 enabled   =>  TRUE,
													 auto_drop =>  TRUE,
													 comments  =>  'Processing for: '||l_file_name_school_year);
          elsif p_test_type = 'TSI' then
						dbms_scheduler.create_job (
													 job_name   =>  DBMS_SCHEDULER.GENERATE_JOB_NAME (prefix => 'D'||p_district_id||'TSI_'),
													 job_type   => 'PLSQL_BLOCK',
													 job_action =>
														 'BEGIN
																pkg_assessment_upload.prc_process_tsi_data_api(p_district_id => '''||p_district_id||''',
                                                 p_school_year => '''||t_school_year(x)||''',
                                                 p_file_name_school_year => '''||l_file_name_school_year||''',
                                                 p_status => ''PENDING'');
															END;',
													 enabled   =>  TRUE,
													 auto_drop =>  TRUE,
													 comments  =>  'Processing for: '||l_file_name_school_year);
          elsif p_test_type = 'IB' then
						dbms_scheduler.create_job (
													 job_name   =>  DBMS_SCHEDULER.GENERATE_JOB_NAME (prefix => 'D'||p_district_id||'IB_'),
													 job_type   => 'PLSQL_BLOCK',
													 job_action =>
														 'BEGIN
																pkg_assessment_upload.prc_process_ib_data_api(p_district_id => '''||p_district_id||''',
                                                 p_school_year => '''||t_school_year(x)||''',
                                                 p_file_name_school_year => '''||l_file_name_school_year||''',
                                                 p_status => ''PENDING'');
															END;',
													 enabled   =>  TRUE,
													 auto_drop =>  TRUE,
													 comments  =>  'Processing for: '||l_file_name_school_year);
          elsif p_test_type = 'AP' then
						dbms_scheduler.create_job (
													 job_name   =>  DBMS_SCHEDULER.GENERATE_JOB_NAME (prefix => 'D'||p_district_id||'AP_'),
													 job_type   => 'PLSQL_BLOCK',
													 job_action =>
														 'BEGIN
																pkg_assessment_upload.prc_process_ap_data_api(p_district_id => '''||p_district_id||''',
                                                 p_school_year => '''||t_school_year(x)||''',
                                                 p_file_name_school_year => '''||l_file_name_school_year||''',
                                                 p_status => ''PENDING'');
															END;',
													 enabled   =>  TRUE,
													 auto_drop =>  TRUE,
													 comments  =>  'Processing for: '||l_file_name_school_year);
          elsif p_test_type = 'ACT' then
						dbms_scheduler.create_job (
													 job_name   =>  DBMS_SCHEDULER.GENERATE_JOB_NAME (prefix => 'D'||p_district_id||'ACT_'),
													 job_type   => 'PLSQL_BLOCK',
													 job_action =>
														 'BEGIN
																pkg_assessment_upload.prc_process_act_data_api(p_district_id => '''||p_district_id||''',
                                                 p_school_year => '''||t_school_year(x)||''',
                                                 p_file_name_school_year => '''||l_file_name_school_year||''',
                                                 p_status => ''PENDING'');
															END;',
													 enabled   =>  TRUE,
													 auto_drop =>  TRUE,
													 comments  =>  'Processing for: '||l_file_name_school_year);
          elsif p_test_type = 'TSI2' then
						dbms_scheduler.create_job (
													 job_name   =>  DBMS_SCHEDULER.GENERATE_JOB_NAME (prefix => 'D'||p_district_id||'TSI2_'),
													 job_type   => 'PLSQL_BLOCK',
													 job_action =>
														 'BEGIN
																pkg_assessment_upload.prc_process_tsi2_data_api(p_district_id => '''||p_district_id||''',
                                                 p_school_year => '''||t_school_year(x)||''',
                                                 p_file_name_school_year => '''||l_file_name_school_year||''',
                                                 p_status => ''PENDING'');
															END;',
													 enabled   =>  TRUE,
													 auto_drop =>  TRUE,
													 comments  =>  'Processing for: '||l_file_name_school_year);
          end if;
					
          -- send email if a prior year upload
					for i in (
						select d.PRIMARY_SCHOOL_YEAR,
									 d.DISTRICT_NAME
							from V_DISTRICTS d
							where d.DISTRICT_CDC = p_district_id
							and  d.school_year = t_school_year(x)
							and d.PRIMARY_SCHOOL_YEAR = 'N') loop

						apex_mail.send(
								p_to        => 'chris.bull@region10.org,jeff.pendill@region10.org,garett.jaeckel@region10.org',
								p_from      => 'info@region10.org',
								p_body      => p_district_id||' '||i.DISTRICT_NAME||' uploaded '||p_test_type ||' assessments for school year '||t_school_year(x) ,
								p_subj      => i.DISTRICT_NAME||' Prior Year Assessment Uploaded' );

						APEX_MAIL.PUSH_QUEUE;
					end loop;
					
        end loop; -- end of school year loop
    end loop;  -- end files to process loop
		
		-- log it
    pkg_assessment_upload.prc_log_status ('Main: End of processing ' ||  p_test_type || ' test(s) for ' || p_district_id, 'INFO-91', p_user_id);

  end;

 /*---------------------------------------------------------------------
  -
  - Procedure:    prc_process_sat_data_api
  - Purpose:      retrieve, modify and output SAT data to the edfi api
  -
  ---------------------------------------------------------------------*/

  procedure prc_process_sat_data_api (p_district_id      varchar2,
                                      p_school_year      varchar2,
																			p_file_name_school_year varchar2,
																			p_status           varchar2 default 'PENDING')  is
    type r_sat_data is record (
      StudentUniqueId           varchar2(10),
      first_name                edfidata.district_sat_data.first_name%type,
      last_name                 edfidata.district_sat_data.last_name%type,
      birth_date                edfidata.district_sat_data.birth_date%type,
      ai_code                   edfidata.district_sat_data.ai_code%type,
      latest_assessment_date    edfidata.district_sat_data.latest_assessment_date%type,
      latest_sat_total          edfidata.district_sat_data.latest_sat_total%type,
      latest_sat_math_section   edfidata.district_sat_data.latest_sat_math_section%type,
      latest_sat_ebrw           edfidata.district_sat_data.latest_sat_ebrw%type,
      row_id                    urowid
    );
    type tbl_sat_data is table of r_sat_data index by pls_integer;
    t_sat_data                 tbl_sat_data;
    s_sat_total                varchar2(20);
    s_sat_ebrw                 varchar2(20);
    s_sat_math                 varchar2(20);
		e_zero_rows                exception;
		-- api request
		l_token             varchar2(200);
		req                 utl_http.req;
		res                 utl_http.resp;
		url                 varchar2(4000);
		buffer              varchar2(32767);
		l_error             varchar2(200);
		l_warning           varchar2(200);
		-- for building JSON for the request body
		l_studentAssessments                       JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_assessmentReference                      JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_studentReference                         JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_scoreResults                             JSON_ARRAY_T  := JSON_ARRAY_T('[]');
		l_scoreResultsArrayItem                    JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_studentObjectiveAssessments              JSON_ARRAY_T  := JSON_ARRAY_T('[]');
		l_studentObjectiveAssessmentsArrayItem     JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_objectiveAssessmentReference             JSON_OBJECT_T := JSON_OBJECT_T('{}');
		
		l_json_string                              varchar2(4000);
  begin
		-- get the url for the edfi api
    PROC_SET_API_URL(P_DB_NUMBER => ltrim(p_district_id,'0'));
		if instr(c_api_base,p_school_year) = 0 then
			-- loading to a prior year the prev proc returns url with primary school year.
			c_api_base := regexp_replace(c_api_base,'ods-[0-9]{4}','ods-'||p_school_year,1,1);
		end if;
	  url := c_api_base||c_api_data||'studentAssessments';
		-- get api token
		l_token := PKG_UPDATE_STUDENT_ATTRIBUTES.FN_GET_AUTH_TOKEN_35(P_DB_NUMBER => ltrim(p_district_id,'0'));
		-- select the SAT data to be loaded.
    select distinct
         s.TSDS_STUDENT_UNIQUE_ID
         ,s.first_name
         ,s.last_name
         ,s.birth_date
         ,ai_code
         ,latest_assessment_date
         ,latest_sat_total
         ,latest_sat_math_section
         ,latest_sat_ebrw
         ,rowid
        bulk collect into t_sat_data
        from edfidata.district_sat_data s
        where s.DISTRICT_ID = p_district_id
          and s.SCHOOL_YEAR_TO_LOAD = p_school_year
					and s.FILE_NAME = p_file_name_school_year
          and status = p_status;
    -- test for 0 rows found for students in ODS and raise exception if 0
    if t_sat_data.count = 0 then
			-- update the status to no data found to Load ODS
			update edfi_assmt_file_status
					set processing_status = 'No records Found to load to ODS',
							status_update_ts = systimestamp
				where file_name_school_year = p_file_name_school_year;
				commit;
      raise e_zero_rows;
    end if;
    --Check for higher scores in previously loaded files
    for i in 1 .. t_sat_data.count loop
      begin
        select
           max(s.LATEST_SAT_TOTAL)          as sat_total,
           max(s.LATEST_SAT_EBRW)           as sat_ebrw,
           max(s.LATEST_SAT_MATH_SECTION)   as sat_math
           into s_sat_total,
                s_sat_ebrw,
                s_sat_math
          from edfidata.DISTRICT_SAT_DATA s
         where s.LATEST_ASSESSMENT_DATE = t_sat_data(i).latest_assessment_date
				  and S.STATUS in ('PENDING','SENT')
          and (s.SECONDARY_ID = t_sat_data(i).StudentUniqueId
             or s.TSDS_STUDENT_UNIQUE_ID = t_sat_data(i).StudentUniqueId
             or (upper(s.first_name) = upper(t_sat_data(i).first_name)
             and upper(s.last_name) = upper(substr(t_sat_data(i).last_name,1,length(s.last_name)))
             and to_char(to_date(s.birth_date,'MM/DD/YYYY'),'MM/DD/YYYY') = to_char(to_date(t_sat_data(i).birth_date,'MM/DD/YYYY'),'MM/DD/YYYY')));

         -- found an other record. Compare and take highest scores
         if trim(s_sat_total) > trim(t_sat_data(i).latest_sat_total) then
           t_sat_data(i).latest_sat_total := trim(s_sat_total);
         end if;
         if trim(s_sat_ebrw) > trim(t_sat_data(i).latest_sat_ebrw) then
           t_sat_data(i).latest_sat_ebrw := trim(s_sat_ebrw);
         end if;
         if trim(s_sat_math) > trim(t_sat_data(i).latest_sat_math_section) then
           t_sat_data(i).latest_sat_math_section := trim(s_sat_math);
         end if;

       exception
         when no_data_found then
              continue; -- no records found so go to next one.
       end;
    end loop;  -- end higher score lookup loop
		
		for i in 1 .. t_sat_data.count loop
	  -- build JSON for Student assessment to send to the api
	  -- set the Assessment Reference, student reference, student assessemnt identifier, administration date
		l_scoreResults := json_array_t();
		l_studentObjectiveAssessments := json_array_t();
		
		l_assessmentReference.put('assessmentIdentifier','CB-SAT-2018');
		l_assessmentReference.put('namespace','uri://ed-fi.org/Assessment');
		l_studentAssessments.put('assessmentReference',l_assessmentReference);
		
		l_studentAssessments.put('studentAssessmentIdentifier',t_sat_data(i).StudentUniqueId || '-' || 'SAT' || '-' || to_char(t_sat_data(i).latest_assessment_date,'MM/DD/YYYY'));
		l_studentReference.put('studentUniqueId',t_sat_data(i).StudentUniqueId);
		l_studentAssessments.put('studentReference',l_studentReference);
		
		l_studentAssessments.put('administrationDate',to_char(t_sat_data(i).latest_assessment_date,'MM/DD/YYYY'));
		
		-- score result for tests like SAT
		l_scoreResultsArrayItem.put('assessmentReportingMethodDescriptor','uri://ed-fi.org/AssessmentReportingMethodDescriptor#Scale score');
		l_scoreResultsArrayItem.put('resultDatatypeTypeDescriptor','uri://ed-fi.org/ResultDatatypeTypeDescriptor#Integer');
		l_scoreResultsArrayItem.put('result',t_sat_data(i).latest_sat_total);
		l_scoreResults.append(l_scoreResultsArrayItem);
		l_studentAssessments.put('scoreResults',l_scoreResults);
		
		-- objective assessments
		l_objectiveAssessmentReference.put('identificationCode','Math');
		l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);
		
		l_scoreResults := json_array_t(); -- reset the object
		l_scoreResultsArrayItem.put('assessmentReportingMethodDescriptor','uri://ed-fi.org/AssessmentReportingMethodDescriptor#Number score');
		l_scoreResultsArrayItem.put('resultDatatypeTypeDescriptor','uri://ed-fi.org/ResultDatatypeTypeDescriptor#Integer');
		l_scoreResultsArrayItem.put('result',t_sat_data(i).latest_sat_math_section);
		l_scoreResults.append(l_scoreResultsArrayItem);
		l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
		l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
		-- because the json object work by reference, to avoid changing previous entries we need to clone the objects
		l_objectiveAssessmentReference := l_objectiveAssessmentReference.clone();  
		l_objectiveAssessmentReference.put('identificationCode','English');
		l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);

		l_scoreResultsArrayItem := l_scoreResultsArrayItem.clone();
		l_scoreResults := l_scoreResults.clone(); --clone it first
		l_scoreResults := json_array_t(); -- then clear it
		l_scoreResultsArrayItem.put('result',t_sat_data(i).latest_sat_ebrw);
		l_scoreResults.append(l_scoreResultsArrayItem);
		l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
		l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
		l_studentAssessments.put('studentObjectiveAssessments',l_studentObjectiveAssessments);
		
		l_json_string := l_studentAssessments.to_string;
		DBMS_OUTPUT.put_line(l_studentAssessments.to_clob);
		DBMS_OUTPUT.put_line(l_json_string);
		
		req  := UTL_HTTP.begin_request(url, 'POST');
						utl_http.set_header(req, 'Authorization', 'Bearer '||l_token);
						utl_http.set_header(req, 'Content-Type', 'application/json');
						utl_http.set_header(req, 'Content-Length', length(l_studentAssessments.to_string()));
						utl_http.write_text(req, l_studentAssessments.to_string());

						res := utl_http.get_response(req);
						dbms_output.put_line(res.status_code);

						if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
							 utl_http.read_text(res, buffer,32767);
							 dbms_output.put_line(buffer);
							 select json_value(buffer, '$.error') into l_error from dual;
							 select json_value(buffer, '$.message') into l_warning from dual;
							 utl_http.end_response(res);
							 utl_http.end_request(req);
							 -- update sat rec with error, json and set status to ERROR
							 update edfidata.district_sat_data s
									 set status = 'ERROR'
											 ,error_message = l_error||': '||l_warning
											 ,json_data = l_json_string
								where rowid = t_sat_data(i).row_id
									and tsds_student_unique_id = t_sat_data(i).StudentUniqueId;
						else
							  -- update sat rec with json and set status to SENT
								update edfidata.district_sat_data s
									 set status = 'SENT'
									     ,error_message = null
											 ,json_data = l_json_string
								where rowid = t_sat_data(i).row_id
									and tsds_student_unique_id = t_sat_data(i).StudentUniqueId;
						end if;
						utl_http.end_response(res);
						utl_http.end_request(req);
	end loop;
  -- Loading ODS is completed so update the status to COMPLETE
	update edfi_assmt_file_status
			set processing_status = 'Complete',
					status_update_ts = systimestamp
		where file_name_school_year = p_file_name_school_year;
    commit;
	exception
		when e_zero_rows then
			prc_log_status('prc_process_sat_data_api: Zero matching student records found to send to the API ', 'ERROR-32', v('APP_USER'));
      apex_error.add_error(p_message          => 'No records were found to send to the API',
                             p_additional_info  => 'Check for validation errors',
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
			raise;
  end prc_process_sat_data_api;
	
 /*---------------------------------------------------------------------
  - Procedure:    prc_process_tsi_data_api
  - Purpose:      retrieve, modify and output TSI data to the edfi api
  ---------------------------------------------------------------------*/

  procedure prc_process_tsi_data_api(p_district_id      varchar2,
                                     p_school_year      varchar2,
																		 p_file_name_school_year varchar2,
																		 p_status           varchar2 default 'PENDING')  is
    type r_tsi_data is record (
      StudentUniqueId           varchar2(10),
      first_name                edfidata.district_tsi_data.FIRST_NAME%type,
      last_name                 edfidata.district_tsi_data.LAST_NAME%type,
      birth_date                edfidata.district_tsi_data.BIRTH_DATE%type,
      test_start                edfidata.district_tsi_data.test_start%type,
      tsi_mathematics_placement edfidata.district_tsi_data.tsi_mathematics_placement%type,
      tsi_reading_placement     edfidata.district_tsi_data.tsi_reading_placement%type,
      tsi_writing_placement     edfidata.district_tsi_data.tsi_writing_placement%type,
      tsi_writeplacer           edfidata.district_tsi_data.tsi_writeplacer%type
    );
    type tbl_tsi_data is table of r_tsi_data index by pls_integer;
    t_tsi_data                    tbl_tsi_data;
    s_tsi_mathematics_placement   varchar2(20);
    s_tsi_reading_placement       varchar2(20);
    s_tsi_writing_placement       varchar2(20);
    s_tsi_writeplacer             varchar2(20);
    e_zero_rows                   exception;
    -- api request
		l_token             varchar2(200);
		req                 utl_http.req;
		res                 utl_http.resp;
		url                 varchar2(4000);
		buffer              varchar2(32767);
		l_error             varchar2(2000);
		l_warning           varchar2(2000);
		-- for building JSON for the request body
		l_studentAssessments                       JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_assessmentReference                      JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_studentReference                         JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_scoreResults                             JSON_ARRAY_T  := JSON_ARRAY_T('[]');
		l_scoreResultsArrayItem                    JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_studentObjectiveAssessments              JSON_ARRAY_T  := JSON_ARRAY_T('[]');
		l_studentObjectiveAssessmentsArrayItem     JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_objectiveAssessmentReference             JSON_OBJECT_T := JSON_OBJECT_T('{}');
		
		l_json_string                              varchar2(4000);
  begin
		-- get the url for the edfi api
    PROC_SET_API_URL(P_DB_NUMBER => ltrim(p_district_id,'0'));
		if instr(c_api_base,p_school_year) = 0 then
			-- loading to a prior year the prev proc returns url with primary school year.
			c_api_base := regexp_replace(c_api_base,'ods-[0-9]{4}','ods-'||p_school_year,1,1);
		end if;
	  url := c_api_base||c_api_data||'studentAssessments';
		-- get api token
		l_token := PKG_UPDATE_STUDENT_ATTRIBUTES.FN_GET_AUTH_TOKEN_35(P_DB_NUMBER => ltrim(p_district_id,'0'));
		-- get tsi records to load
    select
       s.tsds_student_unique_id,
       s.FIRST_NAME,
       s.LAST_NAME,
       s.BIRTH_DATE,
       s.test_start,
       max(s.tsi_mathematics_placement) as tsi_mathematics_placement,
       max(s.tsi_reading_placement) as tsi_reading_placement,
       max(s.tsi_writing_placement) as tsi_writing_placement,
       max(s.tsi_writeplacer) as tsi_writeplacer
       bulk collect into t_tsi_data
       from edfidata.district_tsi_data s
       where district_id = p_district_id
			 and s.SCHOOL_YEAR_TO_LOAD = p_school_year
				and s.FILE_NAME = p_file_name_school_year
				and status = p_status
       group by s.tsds_student_unique_id, s.FIRST_NAME, s.LAST_NAME, s.BIRTH_DATE, test_start;

    -- test for 0 rows found for students in ODS and raise exception if 0,
    -- otherwise, save count of rows with student ids found
    if t_tsi_data.count = 0 then
			-- update the status to no data found to Load ODS
			update edfi_assmt_file_status
					set processing_status = 'No records Found to load to ODS',
							status_update_ts = systimestamp
				where file_name_school_year = p_file_name_school_year;
				commit;
      raise e_zero_rows;
    end if;

    --Check for higher scores in previously loaded files
    for i in 1 .. t_tsi_data.count loop
      begin
        select
           max(s.tsi_mathematics_placement) as tsi_mathematics_placement,
           max(s.tsi_reading_placement) as tsi_reading_placement,
           max(s.tsi_writing_placement) as tsi_writing_placement,
           max(s.tsi_writeplacer) as tsi_writeplacer
           into s_tsi_mathematics_placement,
                s_tsi_reading_placement,
                s_tsi_writing_placement,
                s_tsi_writeplacer
          from edfidata.district_tsi_data s
         where S.STATUS in ('PENDING','SENT')
           and district_id = p_district_id
           and s.test_start = t_tsi_data(i).test_start
           and (s.TSDS_STUDENT_UNIQUE_ID = t_tsi_data(i).StudentUniqueId
             or s.STUDENT_ID = t_tsi_data(i).StudentUniqueId
             or (upper(s.first_name) = upper(t_tsi_data(i).first_name)
             and upper(s.last_name) = upper(substr(t_tsi_data(i).last_name,1,length(s.last_name)))
             and to_char(to_date(s.birth_date,'MM/DD/YYYY'),'MM/DD/YYYY') = to_char(to_date(t_tsi_data(i).birth_date,'MM/DD/YYYY'),'MM/DD/YYYY')));

         -- found another record. Compare and take highest scores
         if trim(s_tsi_mathematics_placement) > trim(t_tsi_data(i).tsi_mathematics_placement) then
           t_tsi_data(i).tsi_mathematics_placement := trim(s_tsi_mathematics_placement);
         end if;
         if trim(s_tsi_reading_placement) > trim(t_tsi_data(i).tsi_reading_placement) then
           t_tsi_data(i).tsi_reading_placement := trim(s_tsi_reading_placement);
         end if;
         if trim(s_tsi_writing_placement) > trim(t_tsi_data(i).tsi_writing_placement) then
           t_tsi_data(i).tsi_writing_placement := trim(s_tsi_writing_placement);
         end if;
         if trim(s_tsi_writeplacer) > trim(t_tsi_data(i).tsi_writeplacer) then
           t_tsi_data(i).tsi_writeplacer := trim(s_tsi_writeplacer);
         end if;

       exception
         when no_data_found then
              continue; -- no records found so go to next one.
       end;
    end loop;  -- end higher score lookup loop

		for i in 1 .. t_tsi_data.count loop
			-- build JSON for Student assessment to send to the api
			-- set the Assessment Reference, student reference, student assessemnt identifier, administration date
			l_scoreResults := json_array_t();
			l_studentObjectiveAssessments := json_array_t();
			
			l_assessmentReference.put('assessmentIdentifier','TSI-2018');
			l_assessmentReference.put('namespace','uri://ed-fi.org/Assessment');
			l_studentAssessments.put('assessmentReference',l_assessmentReference);
			
			l_studentAssessments.put('studentAssessmentIdentifier',t_tsi_data(i).StudentUniqueId || '-' || 'TSI' || '-' || to_char(t_tsi_data(i).test_start,'MM/DD/YYYY'));
			l_studentReference.put('studentUniqueId',t_tsi_data(i).StudentUniqueId);
			l_studentAssessments.put('studentReference',l_studentReference);
			
			l_studentAssessments.put('administrationDate',to_char(t_tsi_data(i).test_start,'MM/DD/YYYY'));
			
			-- objective assessments
			l_objectiveAssessmentReference.put('identificationCode','TSI Math');
			l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);
			
			l_scoreResults := json_array_t(); -- reset the object
			l_scoreResultsArrayItem.put('assessmentReportingMethodDescriptor','uri://ed-fi.org/AssessmentReportingMethodDescriptor#Number score');
			l_scoreResultsArrayItem.put('resultDatatypeTypeDescriptor','uri://ed-fi.org/ResultDatatypeTypeDescriptor#Integer');
			l_scoreResultsArrayItem.put('result',nvl(t_tsi_data(i).tsi_mathematics_placement,'N/A') );
			l_scoreResults.append(l_scoreResultsArrayItem);
			l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
			l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
			-- because the json object work by reference, to avoid changing previous entries we need to clone the objects
			l_objectiveAssessmentReference := l_objectiveAssessmentReference.clone();  
			l_objectiveAssessmentReference.put('identificationCode','TSI Reading');
			l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);

			l_scoreResultsArrayItem := l_scoreResultsArrayItem.clone();
			l_scoreResults := l_scoreResults.clone(); --clone it first
			l_scoreResults := json_array_t(); -- then clear it
			l_scoreResultsArrayItem.put('result',nvl(t_tsi_data(i).TSI_Reading_Placement,'N/A'));
			l_scoreResults.append(l_scoreResultsArrayItem);
			l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
			l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
			l_studentAssessments.put('studentObjectiveAssessments',l_studentObjectiveAssessments);
			
			-- because the json object work by reference, to avoid changing previous entries we need to clone the objects
			l_objectiveAssessmentReference := l_objectiveAssessmentReference.clone();  
			l_objectiveAssessmentReference.put('identificationCode','TSI Writing');
			l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);

			l_scoreResultsArrayItem := l_scoreResultsArrayItem.clone();
			l_scoreResults := l_scoreResults.clone(); --clone it first
			l_scoreResults := json_array_t(); -- then clear it
			l_scoreResultsArrayItem.put('result',nvl(t_tsi_data(i).TSI_Writing_Placement,'N/A'));
			l_scoreResults.append(l_scoreResultsArrayItem);
			l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
			l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
			l_studentAssessments.put('studentObjectiveAssessments',l_studentObjectiveAssessments);
			
			-- because the json object work by reference, to avoid changing previous entries we need to clone the objects
			l_objectiveAssessmentReference := l_objectiveAssessmentReference.clone();  
			l_objectiveAssessmentReference.put('identificationCode','TSI Essay');
			l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);

			l_scoreResultsArrayItem := l_scoreResultsArrayItem.clone();
			l_scoreResults := l_scoreResults.clone(); --clone it first
			l_scoreResults := json_array_t(); -- then clear it
			l_scoreResultsArrayItem.put('result',nvl(t_tsi_data(i).tsi_writeplacer,'N/A'));
			l_scoreResults.append(l_scoreResultsArrayItem);
			l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
			l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
			l_studentAssessments.put('studentObjectiveAssessments',l_studentObjectiveAssessments);
			
			l_json_string := l_studentAssessments.to_string;
			DBMS_OUTPUT.put_line(l_studentAssessments.to_clob);
			DBMS_OUTPUT.put_line(l_json_string);
			
			req  := UTL_HTTP.begin_request(url, 'POST');
							utl_http.set_header(req, 'Authorization', 'Bearer '||l_token);
							utl_http.set_header(req, 'Content-Type', 'application/json');
							utl_http.set_header(req, 'Content-Length', length(l_studentAssessments.to_string()));
							utl_http.write_text(req, l_studentAssessments.to_string());

							res := utl_http.get_response(req);
							dbms_output.put_line(res.status_code);

							if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
								 utl_http.read_text(res, buffer,32767);
								 dbms_output.put_line(buffer);
								 select json_value(buffer, '$.error') into l_error from dual;
								 select json_value(buffer, '$.message') into l_warning from dual;
								 utl_http.end_response(res);
								 utl_http.end_request(req);
								 -- update tsi rec with error, json and set status to ERROR
								 update edfidata.district_tsi_data s
										 set status = 'ERROR',
												 error_message = l_error||': '||l_warning
												 ,json_data = l_json_string
									where test_start = t_tsi_data(i).test_start
										and tsds_student_unique_id = t_tsi_data(i).StudentUniqueId
										and s.status = p_status;
							else
									-- update tsi rec with json and set status to SENT
									update edfidata.district_tsi_data s
										 set status = 'SENT'
												 ,error_message = null
												 ,json_data = l_json_string
									where test_start = t_tsi_data(i).test_start
										and tsds_student_unique_id = t_tsi_data(i).StudentUniqueId
										and s.status = p_status;
							end if;
							utl_http.end_response(res);
							utl_http.end_request(req);
	end loop;
  -- Loading ODS is completed so update the status to COMPLETE
	update edfi_assmt_file_status
			set processing_status = 'Complete',
					status_update_ts = systimestamp
		where file_name_school_year = p_file_name_school_year;
		
  commit;

  exception
      when e_zero_rows then
        prc_log_status('prc_process_tsi_data_api: Zero matching student records found to send to the API ', 'ERROR-32', V('APP_USER'));
        apex_error.add_error(p_message          => 'No records were found to send to the API',
                             p_additional_info  => 'Check for validation/load errors',
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');

  end prc_process_tsi_data_api;
   /*---------------------------------------------------------------------
  - Procedure:    prc_process_tsi2_data_api
  - Purpose:      retrieve, modify and output TSI2 data to edfi api
  ---------------------------------------------------------------------*/

  procedure prc_process_tsi2_data_api(p_district_id      varchar2,
                                     p_school_year      varchar2,
																		 p_file_name_school_year varchar2,
																		 p_status           varchar2 default 'PENDING')  is
    type r_tsi2_data is record (
      StudentUniqueId           varchar2(10),
      first_name                edfidata.district_tsi2_data.FIRST_NAME%type,
      last_name                 edfidata.district_tsi2_data.LAST_NAME%type,
      birth_date                edfidata.district_tsi2_data.BIRTH_DATE%type,
      test_start                edfidata.district_tsi2_data.test_start%type,
      tsi2_math_readiness       edfidata.district_tsi2_data.tsi2_math_readiness%type,
      tsi2_math_diagnostic      edfidata.district_tsi2_data.tsi2_math_diagnostic%type,
      tsi2_elar_readiness       edfidata.district_tsi2_data.tsi2_elar_readiness%type,
      tsi2_elar_diagnostic      edfidata.district_tsi2_data.tsi2_elar_diagnostic%type,
      tsi2_elar_essay           edfidata.district_tsi2_data.tsi2_elar_essay%type
    );
    type tbl_tsi2_data is table of r_tsi2_data index by pls_integer;
    t_tsi2_data                   tbl_tsi2_data;
    s_tsi2_math_readiness         varchar2(20);
    s_tsi2_math_diagnostic        varchar2(20);
    s_tsi2_elar_readiness         varchar2(20);
    s_tsi2_elar_diagnostic        varchar2(20);
    s_tsi2_elar_essay             varchar2(20);
    e_zero_rows                   exception;
		-- api request
		l_token             varchar2(200);
		req                 utl_http.req;
		res                 utl_http.resp;
		url                 varchar2(4000);
		buffer              varchar2(32767);
		l_error             varchar2(200);
		l_warning           varchar2(200);
		-- for building JSON for the request body
		l_studentAssessments                       JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_assessmentReference                      JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_studentReference                         JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_scoreResults                             JSON_ARRAY_T  := JSON_ARRAY_T('[]');
		l_scoreResultsArrayItem                    JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_studentObjectiveAssessments              JSON_ARRAY_T  := JSON_ARRAY_T('[]');
		l_studentObjectiveAssessmentsArrayItem     JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_objectiveAssessmentReference             JSON_OBJECT_T := JSON_OBJECT_T('{}');
		
		l_json_string                              varchar2(4000);
  begin
		-- get the url for the edfi api
    PROC_SET_API_URL(P_DB_NUMBER => ltrim(p_district_id,'0'));
		if instr(c_api_base,p_school_year) = 0 then
			-- loading to a prior year the prev proc returns url with primary school year.
			c_api_base := regexp_replace(c_api_base,'ods-[0-9]{4}','ods-'||p_school_year,1,1);
		end if;
	  url := c_api_base||c_api_data||'studentAssessments';
		-- get api token
		l_token := PKG_UPDATE_STUDENT_ATTRIBUTES.FN_GET_AUTH_TOKEN_35(P_DB_NUMBER => ltrim(p_district_id,'0'));
		-- get tsi records to load
    select
       s.SUPPLEMENTAL_ID
       ,s.FIRST_NAME
       ,s.LAST_NAME
       ,s.BIRTH_DATE
       ,test_start
       ,max(s.tsi2_math_readiness) as tsi2_math_readiness
       ,max(s.tsi2_math_diagnostic) as tsi2_math_diagnostic
       ,max(s.tsi2_elar_readiness) as tsi2_elar_readiness
       ,max(s.tsi2_elar_diagnostic) as tsi2_elar_diagnostic
       ,max(s.tsi2_elar_essay) as tsi2_elar_essay
      bulk collect into t_tsi2_data
      from edfidata.district_tsi2_data s
      where district_id = p_district_id
			  and s.SCHOOL_YEAR_TO_LOAD = p_school_year
				and s.FILE_NAME = p_file_name_school_year
        and status = p_status
      group by s.SUPPLEMENTAL_ID,s.FIRST_NAME,s.LAST_NAME,s.BIRTH_DATE, test_start;

    -- test for 0 rows found for students in ODS and raise exception if 0
    if t_tsi2_data.count = 0 then
			-- update the status to no data found to Load ODS
			update edfi_assmt_file_status
					set processing_status = 'No records Found to load to ODS',
							status_update_ts = systimestamp
				where file_name_school_year = p_file_name_school_year;
				commit;
      raise e_zero_rows;
    end if;
    --Check for higher scores in previously loaded files
    for i in 1 .. t_tsi2_data.count loop
      begin
        select
           max(s.TSI2_MATH_READINESS)  as TSI2_MATH_READINESS,
           max(s.TSI2_MATH_DIAGNOSTIC) as TSI2_MATH_DIAGNOSTIC,
           max(s.TSI2_ELAR_READINESS)  as TSI2_ELAR_READINESS,
           max(s.TSI2_ELAR_DIAGNOSTIC) as TSI2_ELAR_DIAGNOSTIC,
           max(s.TSI2_ELAR_ESSAY)      as TSI2_ELAR_ESSAY
           into s_tsi2_math_readiness,
                s_tsi2_math_diagnostic,
                s_tsi2_elar_readiness,
                s_tsi2_elar_diagnostic,
                s_tsi2_elar_essay
          from edfidata.district_tsi2_data s
         where district_id = p_district_id
           and S.STATUS in ('PENDING','SENT')
           and s.test_start = t_tsi2_data(i).test_start
           and (s.SUPPLEMENTAL_ID = t_tsi2_data(i).StudentUniqueId
             or (upper(s.first_name) = upper(t_tsi2_data(i).first_name)
             and upper(s.last_name) = upper(substr(t_tsi2_data(i).last_name,1,length(s.last_name)))
             and to_char(to_date(s.birth_date,'MM/DD/YYYY'),'MM/DD/YYYY') = to_char(to_date(t_tsi2_data(i).birth_date,'MM/DD/YYYY'),'MM/DD/YYYY')));

         -- found an other record. Compare and take highest scores
         if trim(s_tsi2_math_readiness) > trim(t_tsi2_data(i).tsi2_math_readiness) then
           t_tsi2_data(i).tsi2_math_readiness := trim(s_tsi2_math_readiness);
         end if;
         if trim(s_tsi2_math_diagnostic) > trim(t_tsi2_data(i).tsi2_math_diagnostic) then
           t_tsi2_data(i).tsi2_math_diagnostic := trim(s_tsi2_math_diagnostic);
         end if;
         if trim(s_tsi2_elar_readiness) > trim(t_tsi2_data(i).tsi2_elar_readiness) then
           t_tsi2_data(i).tsi2_elar_readiness := trim(s_tsi2_elar_readiness);
         end if;
         if trim(s_tsi2_elar_diagnostic) > trim(t_tsi2_data(i).tsi2_elar_diagnostic) then
           t_tsi2_data(i).tsi2_elar_diagnostic := trim(s_tsi2_elar_diagnostic);
         end if;
         if trim(s_tsi2_elar_essay) > trim(t_tsi2_data(i).tsi2_elar_essay) then
           t_tsi2_data(i).tsi2_elar_essay := trim(s_tsi2_elar_essay);
         end if;

       exception
         when no_data_found then
              continue; -- no records found so go to next one.
       end;
    end loop;  -- end higher score lookup loop
		
		for i in 1 .. t_tsi2_data.count loop
			-- build JSON for Student assessment to send to the api
			-- set the Assessment Reference, student reference, student assessemnt identifier, administration date
			l_scoreResults := json_array_t();
			l_studentObjectiveAssessments := json_array_t();
			
			l_assessmentReference.put('assessmentIdentifier','TSI2-2021');
			l_assessmentReference.put('namespace','uri://ed-fi.org/Assessment');
			l_studentAssessments.put('assessmentReference',l_assessmentReference);
			
			l_studentAssessments.put('studentAssessmentIdentifier',t_tsi2_data(i).StudentUniqueId || '-' || 'TSI2' || '-' || to_char(t_tsi2_data(i).test_start,'MM/DD/YYYY'));
			l_studentReference.put('studentUniqueId',t_tsi2_data(i).StudentUniqueId);
			l_studentAssessments.put('studentReference',l_studentReference);
			
			l_studentAssessments.put('administrationDate',to_char(t_tsi2_data(i).test_start,'MM/DD/YYYY'));
			
			-- objective assessments
			l_objectiveAssessmentReference.put('identificationCode','TSI2_MATH_READINESS');
			l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);
			
			l_scoreResults := json_array_t(); -- reset the object
			l_scoreResultsArrayItem.put('assessmentReportingMethodDescriptor','uri://ed-fi.org/AssessmentReportingMethodDescriptor#Number score');
			l_scoreResultsArrayItem.put('resultDatatypeTypeDescriptor','uri://ed-fi.org/ResultDatatypeTypeDescriptor#Integer');
			l_scoreResultsArrayItem.put('result',nvl(t_tsi2_data(i).tsi2_math_readiness,'N/A') );
			l_scoreResults.append(l_scoreResultsArrayItem);
			l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
			l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
			
			-- because the json object work by reference, to avoid changing previous entries we need to clone the objects
			l_objectiveAssessmentReference := l_objectiveAssessmentReference.clone();  
			l_objectiveAssessmentReference.put('identificationCode','TSI2_MATH_DIAGNOSTIC');
			l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);

			l_scoreResultsArrayItem := l_scoreResultsArrayItem.clone();
			l_scoreResults := l_scoreResults.clone(); --clone it first
			l_scoreResults := json_array_t(); -- then clear it
			l_scoreResultsArrayItem.put('result',nvl(t_tsi2_data(i).tsi2_math_diagnostic,'N/A'));
			l_scoreResults.append(l_scoreResultsArrayItem);
			l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
			l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
			l_studentAssessments.put('studentObjectiveAssessments',l_studentObjectiveAssessments);
			
			-- because the json object work by reference, to avoid changing previous entries we need to clone the objects
			l_objectiveAssessmentReference := l_objectiveAssessmentReference.clone();  
			l_objectiveAssessmentReference.put('identificationCode','TSI2_ELAR_READINESS');
			l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);

			l_scoreResultsArrayItem := l_scoreResultsArrayItem.clone();
			l_scoreResults := l_scoreResults.clone(); --clone it first
			l_scoreResults := json_array_t(); -- then clear it
			l_scoreResultsArrayItem.put('result',nvl(t_tsi2_data(i).tsi2_elar_readiness,'N/A'));
			l_scoreResults.append(l_scoreResultsArrayItem);
			l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
			l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
			l_studentAssessments.put('studentObjectiveAssessments',l_studentObjectiveAssessments);
			
			-- because the json object work by reference, to avoid changing previous entries we need to clone the objects
			l_objectiveAssessmentReference := l_objectiveAssessmentReference.clone();  
			l_objectiveAssessmentReference.put('identificationCode','TSI2_ELAR_DIAGNOSTIC');
			l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);

			l_scoreResultsArrayItem := l_scoreResultsArrayItem.clone();
			l_scoreResults := l_scoreResults.clone(); --clone it first
			l_scoreResults := json_array_t(); -- then clear it
			l_scoreResultsArrayItem.put('result',nvl(t_tsi2_data(i).tsi2_elar_diagnostic,'N/A'));
			l_scoreResults.append(l_scoreResultsArrayItem);
			l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
			l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
			l_studentAssessments.put('studentObjectiveAssessments',l_studentObjectiveAssessments);
			
			-- because the json object work by reference, to avoid changing previous entries we need to clone the objects
			l_objectiveAssessmentReference := l_objectiveAssessmentReference.clone();  
			l_objectiveAssessmentReference.put('identificationCode','TSI2_ELAR_ESSAY');
			l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);

			l_scoreResultsArrayItem := l_scoreResultsArrayItem.clone();
			l_scoreResults := l_scoreResults.clone(); --clone it first
			l_scoreResults := json_array_t(); -- then clear it
			l_scoreResultsArrayItem.put('result',nvl(t_tsi2_data(i).tsi2_elar_essay,'N/A'));
			l_scoreResults.append(l_scoreResultsArrayItem);
			l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
			l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
			l_studentAssessments.put('studentObjectiveAssessments',l_studentObjectiveAssessments);
			
			l_json_string := l_studentAssessments.to_string;
			--DBMS_OUTPUT.put_line(l_studentAssessments.to_clob);
			DBMS_OUTPUT.put_line(l_json_string);
			DBMS_OUTPUT.put_line(url);
			req  := UTL_HTTP.begin_request(url, 'POST');
							utl_http.set_header(req, 'Authorization', 'Bearer '||l_token);
							utl_http.set_header(req, 'Content-Type', 'application/json');
							utl_http.set_header(req, 'Content-Length', length(l_studentAssessments.to_string()));
							utl_http.write_text(req, l_studentAssessments.to_string());

							res := utl_http.get_response(req);
							dbms_output.put_line(res.status_code);

							if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
								 utl_http.read_text(res, buffer,32767);
								 dbms_output.put_line(buffer);
								 select json_value(buffer, '$.error') into l_error from dual;
								 select json_value(buffer, '$.message') into l_warning from dual;
								 utl_http.end_response(res);
								 utl_http.end_request(req);
								 -- update tsi rec with error, json and set status to ERROR
								 update edfidata.district_tsi2_data s
										 set status = 'ERROR',
												 error_message = l_error||': '||l_warning
												 ,json_data = l_json_string
									where test_start = t_tsi2_data(i).test_start
										and supplemental_id = t_tsi2_data(i).StudentUniqueId
										and s.status = p_status;
							else
									-- update tsi rec with json and set status to SENT
									update edfidata.district_tsi2_data s
										 set status = 'SENT'
												 ,error_message = null
												 ,json_data = l_json_string
									where test_start = t_tsi2_data(i).test_start
										and supplemental_id = t_tsi2_data(i).StudentUniqueId
										and s.status = p_status;
							end if;
							utl_http.end_response(res);
							utl_http.end_request(req);
	    end loop;
    commit;
    -- Loading ODS is completed so update the status to COMPLETE
		update edfi_assmt_file_status
				set processing_status = 'Complete',
						status_update_ts = systimestamp
			where file_name_school_year = p_file_name_school_year;
  exception
      when e_zero_rows then
        prc_log_status('prc_process_tsi2_data_api: Zero matching student records found to send to the API ', 'ERROR-32', V('APP_USER'));
        apex_error.add_error(p_message          => 'No records were found to send to the API',
                             p_additional_info  => 'Check for validation/load errors',
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');


  end prc_process_tsi2_data_api;

  /*---------------------------------------------------------------------
  -
  - Procedure:    prc_process_act_data_api
  - Purpose:      retrieve, modify and output ACT data to edfi api
  -
  ---------------------------------------------------------------------*/

  procedure prc_process_act_data_api(p_district_id      varchar2,
                                     p_school_year      varchar2,
																		 p_file_name_school_year varchar2,
																		 p_status           varchar2 default 'PENDING')  is
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
      grade_level                 edfidata.district_act_data.grade_level%type,
			row_id                      urowid
    );
    type tbl_act_data is table of r_act_data index by pls_integer;
    t_act_data                    tbl_act_data;
    s_act_scale_scores_composite  varchar2(2);
    s_act_scale_scores_english    varchar2(2);
    s_act_scale_scores_math       varchar2(2);
    s_act_scale_scores_reading    varchar2(2);
    s_act_scale_scores_science    varchar2(2);
    e_zero_rows exception;
		-- api request
		l_token             varchar2(200);
		req                 utl_http.req;
		res                 utl_http.resp;
		url                 varchar2(4000);
		buffer              varchar2(32767);
		l_error             varchar2(200);
		l_warning           varchar2(200);
		-- for building JSON for the request body
		l_studentAssessments                       JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_assessmentReference                      JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_studentReference                         JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_scoreResults                             JSON_ARRAY_T  := JSON_ARRAY_T('[]');
		l_scoreResultsArrayItem                    JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_studentObjectiveAssessments              JSON_ARRAY_T  := JSON_ARRAY_T('[]');
		l_studentObjectiveAssessmentsArrayItem     JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_objectiveAssessmentReference             JSON_OBJECT_T := JSON_OBJECT_T('{}');
		
		l_json_string                              varchar2(4000);
  begin
		-- get the url for the edfi api
    PROC_SET_API_URL(P_DB_NUMBER => ltrim(p_district_id,'0'));
		if instr(c_api_base,p_school_year) = 0 then
			-- loading to a prior year the prev proc returns url with primary school year.
			c_api_base := regexp_replace(c_api_base,'ods-[0-9]{4}','ods-'||p_school_year,1,1);
		end if;
	  url := c_api_base||c_api_data||'studentAssessments';
		dbms_output.put_line('url'||url);
		-- get api token
		l_token := PKG_UPDATE_STUDENT_ATTRIBUTES.FN_GET_AUTH_TOKEN_35(P_DB_NUMBER => ltrim(p_district_id,'0'));
		-- get act records to load
    select distinct
       s.TSDS_STUDENT_UNIQUE_ID
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
			 ,rowid
       bulk collect into t_act_data
      from edfidata.district_act_data s
      where district_id = p_district_id
			  and s.SCHOOL_YEAR_TO_LOAD = p_school_year
				and s.FILE_NAME = p_file_name_school_year
        and status = p_status;

    -- test for 0 rows found for students in ODS and raise exception if 0
    if t_act_data.count = 0 then
			-- update the status to no data found to Load ODS
			update edfi_assmt_file_status
					set processing_status = 'No records Found to load to ODS',
							status_update_ts = systimestamp
				where file_name_school_year = p_file_name_school_year;
				commit;
      raise e_zero_rows;
    end if;

    -- look for higher scores in previous loads
    for i in 1 .. t_act_data.count loop
      begin
        select
           max(case when s.ACT_SCALE_SCORES_COMPOSITE = '--' then null else s.ACT_SCALE_SCORES_COMPOSITE end)  as ACT_SCALE_SCORES_COMPOSITE,
           max(case when s.ACT_SCALE_SCORES_ENGLISH   = '--' then null else s.ACT_SCALE_SCORES_ENGLISH end)    as ACT_SCALE_SCORES_ENGLISH,
           max(case when s.ACT_SCALE_SCORES_MATH      = '--' then null else s.ACT_SCALE_SCORES_MATH end)       as ACT_SCALE_SCORES_MATH,
           max(case when s.ACT_SCALE_SCORES_READING   = '--' then null else s.ACT_SCALE_SCORES_READING end)    as ACT_SCALE_SCORES_READING,
           max(case when s.ACT_SCALE_SCORES_SCIENCE   = '--' then null else s.ACT_SCALE_SCORES_SCIENCE end)    as ACT_SCALE_SCORES_SCIENCE
           into s_act_scale_scores_composite,
                s_act_scale_scores_english,
                s_act_scale_scores_math,
                s_act_scale_scores_reading,
                s_act_scale_scores_science
          from edfidata.district_act_data s
         where S.STATUS in ('PENDING','SENT')
           and s.TEST_DATE_MONTH_AND_YEAR = t_act_data(i).test_date_month_and_year
           and (s.TSDS_STUDENT_UNIQUE_ID = t_act_data(i).StudentUniqueId
             or s.OTHER_ID = t_act_data(i).StudentUniqueId
             or (upper(s.first_name) = upper(t_act_data(i).first_name)
             and upper(s.last_name) = upper(substr(t_act_data(i).last_name,1,length(s.last_name)))
             and to_char(to_date(s.birth_date,'MM/DD/YYYY'),'MM/DD/YYYY') = to_char(to_date(t_act_data(i).birth_date,'MM/DD/YYYY'),'MM/DD/YYYY')));

         -- found another record. Compare and take highest scores
         if trim(s_act_scale_scores_composite) > trim(t_act_data(i).act_scale_scores_composite) then
           t_act_data(i).act_scale_scores_composite := trim(s_act_scale_scores_composite);
         end if;
         if trim(s_act_scale_scores_english) > trim(t_act_data(i).act_scale_scores_english) then
           t_act_data(i).act_scale_scores_english := trim(s_act_scale_scores_english);
         end if;
         if trim(s_act_scale_scores_math) > trim(t_act_data(i).act_scale_scores_math) then
           t_act_data(i).act_scale_scores_math := trim(s_act_scale_scores_math);
         end if;
         if trim(s_act_scale_scores_reading) > trim(t_act_data(i).act_scale_scores_reading) then
           t_act_data(i).act_scale_scores_reading := trim(s_act_scale_scores_reading);
         end if;
         if trim(s_act_scale_scores_science) > trim(t_act_data(i).act_scale_scores_science) then
           t_act_data(i).act_scale_scores_science := trim(s_act_scale_scores_science);
         end if;

       exception
         when no_data_found then
              continue; -- no records found so go to next one.
       end;
    end loop;  -- end higher score lookup loop

		for i in 1 .. t_act_data.count loop
			-- build JSON for Student assessment to send to the api
			-- set the Assessment Reference, student reference, student assessemnt identifier, administration date
			l_scoreResults := json_array_t();
			l_studentObjectiveAssessments := json_array_t();
			
			l_assessmentReference.put('assessmentIdentifier','ACT-2018');
			l_assessmentReference.put('namespace','uri://ed-fi.org/Assessment');
			l_studentAssessments.put('assessmentReference',l_assessmentReference);
			
			l_studentAssessments.put('studentAssessmentIdentifier',t_act_data(i).StudentUniqueId || '-' || 'ACT' || '-' || t_act_data(i).test_date_month_and_year );
			l_studentReference.put('studentUniqueId',t_act_data(i).StudentUniqueId);
			l_studentAssessments.put('studentReference',l_studentReference);
			
			l_studentAssessments.put('administrationDate',t_act_data(i).test_date_month_and_year);
			
			-- score result for tests like SAT & ACT
			if t_act_data(i).act_scale_scores_composite is not null
				and t_act_data(i).act_scale_scores_composite != '--' then
				l_scoreResultsArrayItem.put('assessmentReportingMethodDescriptor','uri://ed-fi.org/AssessmentReportingMethodDescriptor#Scale score');
				l_scoreResultsArrayItem.put('resultDatatypeTypeDescriptor','uri://ed-fi.org/ResultDatatypeTypeDescriptor#Integer');
				l_scoreResultsArrayItem.put('result',nvl(t_act_data(i).act_scale_scores_composite,'N/A'));
				l_scoreResults.append(l_scoreResultsArrayItem);
				l_studentAssessments.put('scoreResults',l_scoreResults);
			end if;
			
			-- objective assessments
			-- Math
			if t_act_data(i).act_scale_scores_math is not null
				and t_act_data(i).act_scale_scores_math != '--' then
				l_objectiveAssessmentReference.put('identificationCode','Math');
				l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);
				
				l_scoreResults := json_array_t(); -- reset the object
				l_scoreResultsArrayItem.put('assessmentReportingMethodDescriptor','uri://ed-fi.org/AssessmentReportingMethodDescriptor#Number score');
				l_scoreResultsArrayItem.put('resultDatatypeTypeDescriptor','uri://ed-fi.org/ResultDatatypeTypeDescriptor#Integer');
				l_scoreResultsArrayItem.put('result',nvl(t_act_data(i).act_scale_scores_math,'N/A') );
				l_scoreResults.append(l_scoreResultsArrayItem);
				l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
				l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
			end if;
			-- because the json object work by reference, to avoid changing previous entries we need to clone the objects
			-- English
			if t_act_data(i).act_scale_scores_english is not null
				and t_act_data(i).act_scale_scores_english != '--' then
				l_objectiveAssessmentReference := l_objectiveAssessmentReference.clone();  
				l_objectiveAssessmentReference.put('identificationCode','English');
				l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);

				l_scoreResultsArrayItem := l_scoreResultsArrayItem.clone();
				l_scoreResultsArrayItem.put('assessmentReportingMethodDescriptor','uri://ed-fi.org/AssessmentReportingMethodDescriptor#Scale score');
				l_scoreResultsArrayItem.put('resultDatatypeTypeDescriptor','uri://ed-fi.org/ResultDatatypeTypeDescriptor#Integer');
				l_scoreResults := l_scoreResults.clone(); --clone it first
				l_scoreResults := json_array_t(); -- then clear it
				l_scoreResultsArrayItem.put('result',nvl(t_act_data(i).act_scale_scores_english,'N/A'));
				l_scoreResults.append(l_scoreResultsArrayItem);
				l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
				l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
			end if;
			-- because the json object work by reference, to avoid changing previous entries we need to clone the objects
			-- reading
			if t_act_data(i).act_scale_scores_reading is not null
				and t_act_data(i).act_scale_scores_reading != '--' then
				l_objectiveAssessmentReference := l_objectiveAssessmentReference.clone();  
				l_objectiveAssessmentReference.put('identificationCode','Reading');
				l_studentObjectiveAssessmentsArrayItem.put('objectiveAssessmentReference',l_objectiveAssessmentReference);

				l_scoreResultsArrayItem := l_scoreResultsArrayItem.clone();
				l_scoreResultsArrayItem.put('assessmentReportingMethodDescriptor','uri://ed-fi.org/AssessmentReportingMethodDescriptor#Scale score');
				l_scoreResultsArrayItem.put('resultDatatypeTypeDescriptor','uri://ed-fi.org/ResultDatatypeTypeDescriptor#Integer');
				l_scoreResults := l_scoreResults.clone(); --clone it first
				l_scoreResults := json_array_t(); -- then clear it
				l_scoreResultsArrayItem.put('result',nvl(t_act_data(i).act_scale_scores_reading,'N/A'));
				l_scoreResults.append(l_scoreResultsArrayItem);
				l_studentObjectiveAssessmentsArrayItem.put('scoreResults',l_scoreResults);
				l_studentObjectiveAssessments.append(l_studentObjectiveAssessmentsArrayItem);
			end if ;
			
			l_studentAssessments.put('studentObjectiveAssessments',l_studentObjectiveAssessments);
			
			l_json_string := l_studentAssessments.to_string;
			--DBMS_OUTPUT.put_line(l_studentAssessments.to_clob);
			DBMS_OUTPUT.put_line(l_json_string);
			
			req  := UTL_HTTP.begin_request(url, 'POST');
							utl_http.set_header(req, 'Authorization', 'Bearer '||l_token);
							utl_http.set_header(req, 'Content-Type', 'application/json');
							utl_http.set_header(req, 'Content-Length', length(l_studentAssessments.to_string()));
							utl_http.write_text(req, l_studentAssessments.to_string());

							res := utl_http.get_response(req);
							dbms_output.put_line(res.status_code);

							if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
								 utl_http.read_text(res, buffer,32767);
								 dbms_output.put_line(buffer);
								 select json_value(buffer, '$.error') into l_error from dual;
								 select json_value(buffer, '$.message') into l_warning from dual;
								 utl_http.end_response(res);
								 utl_http.end_request(req);
								 -- update  rec with error, json and set status to ERROR
								 update edfidata.district_act_data s
										 set status = 'ERROR',
												 error_message = l_error||': '||l_warning
												 ,json_data = l_json_string
									where rowid = t_act_data(i).row_id
										and tsds_student_unique_id = t_act_data(i).StudentUniqueId;
							else
									-- update  rec with json and set status to SENT
									update edfidata.district_act_data s
										 set status = 'SENT'
												 ,error_message = null
												 ,json_data = l_json_string
									where rowid = t_act_data(i).row_id
										and tsds_student_unique_id = t_act_data(i).StudentUniqueId;
							end if;
							utl_http.end_response(res);
							utl_http.end_request(req);
	    end loop;
    -- Loading ODS is completed so update the status to COMPLETE
		update edfi_assmt_file_status
				set processing_status = 'Complete',
						status_update_ts = systimestamp
			where file_name_school_year = p_file_name_school_year;
			  
    commit;  -- due to distributed transaction over dblink

  exception
      when e_zero_rows then
        prc_log_status('prc_process_act_data_api: Zero matching student records found to send to the API ', 'ERROR-32', V('APP_USER'));
        apex_error.add_error(p_message          => 'No records were found to send to the API',
                             p_additional_info  => 'Check for validation/load errors',
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');


  end prc_process_act_data_api;
	
  /*---------------------------------------------------------------------
  -
  - Procedure:    prc_process_ap_data_api
  - Purpose:      retrieve, modify and output AP data to edfi api
  -
  ---------------------------------------------------------------------*/

  procedure prc_process_ap_data_api(p_district_id      varchar2,
                                     p_school_year      varchar2,
																		 p_file_name_school_year varchar2,
																		 p_status           varchar2 default 'PENDING')  is
    type r_ap_data is record (
      StudentUniqueId  varchar2(10),
      year             edfidata.district_ap_data.admin_year_01%type,
      assessment_name  varchar2(75),
      score            edfidata.district_ap_data.exam_score_01%type,
			file_name        varchar2(100)
    );
    type tbl_ap_data is table of r_ap_data index by pls_integer;
    t_ap_data           tbl_ap_data;
    e_zero_rows         exception;
		-- api request
		l_token             varchar2(200);
		req                 utl_http.req;
		res                 utl_http.resp;
		url                 varchar2(4000);
		buffer              varchar2(32767);
		l_error             varchar2(2000);
		l_warning           varchar2(2000);
		-- for building JSON for the request body
		l_studentAssessments                       JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_assessmentReference                      JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_studentReference                         JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_scoreResults                             JSON_ARRAY_T  := JSON_ARRAY_T('[]');
		l_scoreResultsArrayItem                    JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_studentObjectiveAssessments              JSON_ARRAY_T  := JSON_ARRAY_T('[]');
		l_studentObjectiveAssessmentsArrayItem     JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_objectiveAssessmentReference             JSON_OBJECT_T := JSON_OBJECT_T('{}');
		
		l_json_string                              varchar2(4000);
  begin
		-- get the url for the edfi api
    PROC_SET_API_URL(P_DB_NUMBER => ltrim(p_district_id,'0'));
		if instr(c_api_base,p_school_year) = 0 then
			-- loading to a prior year the prev proc returns url with primary school year.
			c_api_base := regexp_replace(c_api_base,'ods-[0-9]{4}','ods-'||p_school_year,1,1);
		end if;
	  url := c_api_base||c_api_data||'studentAssessments';
		-- get api token
		l_token := PKG_UPDATE_STUDENT_ATTRIBUTES.FN_GET_AUTH_TOKEN_35(P_DB_NUMBER => ltrim(p_district_id,'0'));
		-- get ap records to load
    -- since AP is pivoted, there is 1 row per student
    select distinct TSDS_STUDENT_UNIQUE_ID, year, ASSESSMENT_NAME, score, file_name
      bulk collect into t_ap_data
      from (select TSDS_STUDENT_UNIQUE_ID,last_name, first_name, birth_date, year, code, score, l.ASSESSMENT_NAME, file_name
             from(select TSDS_STUDENT_UNIQUE_ID,last_name, first_name, birth_date, year, code, score, file_name
            from edfidata.district_ap_data 
            unpivot exclude nulls ((year,code,score)
            for ap_recs in (
              (admin_year_01, exam_code_01, exam_score_01) as 'test1',
              (admin_year_02, exam_code_02, exam_score_02) as 'test2',
              (admin_year_03, exam_code_03, exam_score_03) as 'test3',
              (admin_year_04, exam_code_04, exam_score_04) as 'test4',
              (admin_year_05, exam_code_05, exam_score_05) as 'test5',
              (admin_year_06, exam_code_06, exam_score_06) as 'test6',
              (admin_year_07, exam_code_07, exam_score_07) as 'test7',
              (admin_year_08, exam_code_08, exam_score_08) as 'test8',
              (admin_year_09, exam_code_09, exam_score_09) as 'test9',
              (admin_year_10, exam_code_10, exam_score_10) as 'test10'
            )) where district_id = p_district_id
                  and SCHOOL_YEAR_TO_LOAD = p_school_year
									and FILE_NAME = p_file_name_school_year
                  and status = p_status
            ) a
      join edfi_ap_ib_test l on l.ASSESSMENT_TYPE = 'AP' and l.ASSESSMENT_CODE = a.code);

    -- test for 0 rows found for students in ODS and raise exception if 0
    if t_ap_data.count = 0 then
			-- update the status to no data found to Load ODS
			update edfi_assmt_file_status
					set processing_status = 'No records Found to load to ODS',
							status_update_ts = systimestamp
				where file_name_school_year = p_file_name_school_year;
				commit;
      raise e_zero_rows;
    end if;
		
		for i in 1 .. t_ap_data.count loop
			-- build JSON for Student assessment to send to the api
			-- set the Assessment Reference, student reference, student assessemnt identifier, administration date
			l_scoreResults := json_array_t();
			l_studentObjectiveAssessments := json_array_t();
			
			l_assessmentReference.put('assessmentIdentifier',t_ap_data(i).assessment_name);
			l_assessmentReference.put('namespace','uri://ed-fi.org/Assessment');
			l_studentAssessments.put('assessmentReference',l_assessmentReference);
			
			l_studentAssessments.put('studentAssessmentIdentifier',t_ap_data(i).StudentUniqueId || '-' || substr(t_ap_data(i).assessment_name,1,38) || '-' || to_char(t_ap_data(i).year,'MM/DD/YYYY'));
			l_studentReference.put('studentUniqueId',t_ap_data(i).StudentUniqueId);
			l_studentAssessments.put('studentReference',l_studentReference);
			
			l_studentAssessments.put('administrationDate',to_char(t_ap_data(i).year,'MM/DD/YYYY'));
			
			-- score result for tests like SAT & ACT
			l_scoreResultsArrayItem.put('assessmentReportingMethodDescriptor','uri://ed-fi.org/AssessmentReportingMethodDescriptor#Scale score');
			l_scoreResultsArrayItem.put('resultDatatypeTypeDescriptor','uri://ed-fi.org/ResultDatatypeTypeDescriptor#Integer');
			l_scoreResultsArrayItem.put('result',t_ap_data(i).score);
			l_scoreResults.append(l_scoreResultsArrayItem);
			l_studentAssessments.put('scoreResults',l_scoreResults);

			l_json_string := l_studentAssessments.to_string;
			--DBMS_OUTPUT.put_line(l_studentAssessments.to_clob);
			DBMS_OUTPUT.put_line(l_json_string);
			
			req  := UTL_HTTP.begin_request(url, 'POST');
							utl_http.set_header(req, 'Authorization', 'Bearer '||l_token);
							utl_http.set_header(req, 'Content-Type', 'application/json');
							utl_http.set_header(req, 'Content-Length', length(l_studentAssessments.to_string()));
							utl_http.write_text(req, l_studentAssessments.to_string());

							res := utl_http.get_response(req);
							dbms_output.put_line(res.status_code);

							if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
								 utl_http.read_text(res, buffer,32767);
								 dbms_output.put_line(buffer);
								 select json_value(buffer, '$.error') into l_error from dual;
								 select json_value(buffer, '$.message') into l_warning from dual;
								 utl_http.end_response(res);
								 utl_http.end_request(req);
								 -- update  rec with error, json and set status to ERROR
								 update edfidata.district_ap_data s
										 set status = 'ERROR',
												 error_message = l_error||': '||l_warning
												 ,json_data = l_json_string
									where file_name = t_ap_data(i).file_name
									and tsds_student_unique_id = t_ap_data(i).StudentUniqueId
									and district_id = p_district_id;
							else
									-- update  rec with json and set status to SENT
									update edfidata.district_ap_data s
										 set status = 'SENT'
												 ,error_message = null
												 ,json_data = l_json_string
									where file_name = t_ap_data(i).file_name
									and tsds_student_unique_id = t_ap_data(i).StudentUniqueId
									and district_id = p_district_id;
							end if;
							utl_http.end_response(res);
							utl_http.end_request(req);
	    end loop;
    -- Loading ODS is completed so update the status to COMPLETE
		update edfi_assmt_file_status
				set processing_status = 'Complete',
						status_update_ts = systimestamp
			where file_name_school_year = p_file_name_school_year;  
    commit;
	
	exception
      when e_zero_rows then
        prc_log_status('prc_process_ap_data_api: Zero matching student records found to send to the API ', 'ERROR-32', V('APP_USER'));
        apex_error.add_error(p_message          => 'No records were found to send to the API',
                             p_additional_info  => 'Check for validation/load errors',
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;

  end prc_process_ap_data_api;

  /*---------------------------------------------------------------------
  -
  - Procedure:    prc_process_ib_data_api
  - Purpose:      retrieve, modify and output IB data to edfi api
  -
  ---------------------------------------------------------------------*/

  procedure prc_process_ib_data_api(p_district_id      varchar2,
                                     p_school_year      varchar2,
																		 p_file_name_school_year varchar2,
																		 p_status           varchar2 default 'PENDING')  is
    type r_ib_data is record (
      StudentUniqueId           varchar2(10),
      admin_year                edfidata.district_ib_data.year%type,
      subject                   edfidata.district_ib_data.subject%type,
      exam_grade                edfidata.district_ib_data.subject%type,
			row_id                    urowid
    );
    type tbl_ib_data is table of r_ib_data index by pls_integer;
    t_ib_data tbl_ib_data;
    e_zero_rows exception;
		-- api request
		l_token             varchar2(200);
		req                 utl_http.req;
		res                 utl_http.resp;
		url                 varchar2(4000);
		buffer              varchar2(32767);
		l_error             varchar2(200);
		l_warning           varchar2(200);
		-- for building JSON for the request body
		l_studentAssessments                       JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_assessmentReference                      JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_studentReference                         JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_scoreResults                             JSON_ARRAY_T  := JSON_ARRAY_T('[]');
		l_scoreResultsArrayItem                    JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_studentObjectiveAssessments              JSON_ARRAY_T  := JSON_ARRAY_T('[]');
		l_studentObjectiveAssessmentsArrayItem     JSON_OBJECT_T := JSON_OBJECT_T('{}');
		l_objectiveAssessmentReference             JSON_OBJECT_T := JSON_OBJECT_T('{}');
		
		l_json_string                              varchar2(4000);
  begin
		-- get the url for the edfi api
    PROC_SET_API_URL(P_DB_NUMBER => ltrim(p_district_id,'0'));
		if instr(c_api_base,p_school_year) = 0 then
			-- loading to a prior year the prev proc returns url with primary school year.
			c_api_base := regexp_replace(c_api_base,'ods-[0-9]{4}','ods-'||p_school_year,1,1);
		end if;
	  url := c_api_base||c_api_data||'studentAssessments';
		-- get api token
		l_token := PKG_UPDATE_STUDENT_ATTRIBUTES.FN_GET_AUTH_TOKEN_35(P_DB_NUMBER => ltrim(p_district_id,'0'));
		-- get IB records to load
    select distinct
         S.TSDS_STUDENT_UNIQUE_ID
         ,year
         ,l.ASSESSMENT_NAME
         ,exam_grade
				 ,s.rowid
     bulk collect into t_ib_data
     from district_ib_data s
		 join edfi_ap_ib_test l on l.ASSESSMENT_TYPE = 'IB' and l.ASSESSMENT_CODE = s.SUBJECT
       where district_id = p_district_id
				and SCHOOL_YEAR_TO_LOAD = p_school_year
				and s.FILE_NAME = p_file_name_school_year
				and status = p_status;

    -- test for 0 rows found for students in ODS and raise exception if 0
    if t_ib_data.count = 0 then
			-- update the status to no data found to Load ODS
			update edfi_assmt_file_status
					set processing_status = 'No records Found to load to ODS',
							status_update_ts = systimestamp
				where file_name_school_year = p_file_name_school_year;
				commit;
      raise e_zero_rows;
    end if;
		
		for i in 1 .. t_ib_data.count loop
			-- build JSON for Student assessment to send to the api
			-- set the Assessment Reference, student reference, student assessemnt identifier, administration date
			l_scoreResults := json_array_t();
			l_studentObjectiveAssessments := json_array_t();
			
			l_assessmentReference.put('assessmentIdentifier',t_ib_data(i).subject);
			l_assessmentReference.put('namespace','uri://ed-fi.org/Assessment');
			l_studentAssessments.put('assessmentReference',l_assessmentReference);
			
			l_studentAssessments.put('studentAssessmentIdentifier',t_ib_data(i).StudentUniqueId || '-' || t_ib_data(i).subject || '-' || '04/01/' || t_ib_data(i).admin_year);
			l_studentReference.put('studentUniqueId',t_ib_data(i).StudentUniqueId);
			l_studentAssessments.put('studentReference',l_studentReference);
			
			l_studentAssessments.put('administrationDate','04/01/' || t_ib_data(i).admin_year);
			
			-- score result for tests like SAT & ACT
			l_scoreResultsArrayItem.put('assessmentReportingMethodDescriptor','uri://ed-fi.org/AssessmentReportingMethodDescriptor#Scale score');
			l_scoreResultsArrayItem.put('resultDatatypeTypeDescriptor','uri://ed-fi.org/ResultDatatypeTypeDescriptor#Integer');
			l_scoreResultsArrayItem.put('result',t_ib_data(i).exam_grade);
			l_scoreResults.append(l_scoreResultsArrayItem);
			l_studentAssessments.put('scoreResults',l_scoreResults);

			l_json_string := l_studentAssessments.to_string;
			DBMS_OUTPUT.put_line(l_studentAssessments.to_clob);
			DBMS_OUTPUT.put_line(l_json_string);
			
			req  := UTL_HTTP.begin_request(url, 'POST');
							utl_http.set_header(req, 'Authorization', 'Bearer '||l_token);
							utl_http.set_header(req, 'Content-Type', 'application/json');
							utl_http.set_header(req, 'Content-Length', length(l_studentAssessments.to_string()));
							utl_http.write_text(req, l_studentAssessments.to_string());

							res := utl_http.get_response(req);
							dbms_output.put_line(res.status_code);

							if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
								 utl_http.read_text(res, buffer,32767);
								 dbms_output.put_line(buffer);
								 select json_value(buffer, '$.error') into l_error from dual;
								 select json_value(buffer, '$.message') into l_warning from dual;
								 utl_http.end_response(res);
								 utl_http.end_request(req);
								 -- update  rec with error, json and set status to ERROR
								 update edfidata.district_ib_data s
										 set status = 'ERROR',
												 error_message = l_error||': '||l_warning
												 ,json_data = l_json_string
									where rowid = t_ib_data(i).row_id
										and tsds_student_unique_id = t_ib_data(i).StudentUniqueId;
							else
									-- update  rec with json and set status to SENT
									update edfidata.district_ib_data s
										 set status = 'SENT'
												 ,error_message = null
												 ,json_data = l_json_string
									where rowid = t_ib_data(i).row_id
										and tsds_student_unique_id = t_ib_data(i).StudentUniqueId;
							end if;
							utl_http.end_response(res);
							utl_http.end_request(req);
	    end loop;
			
    -- Loading ODS is completed so update the status to COMPLETE 
		update edfi_assmt_file_status
				set processing_status = 'Complete',
						status_update_ts = systimestamp
			where file_name_school_year = p_file_name_school_year;  
			
    commit;

  exception
      when e_zero_rows then
        prc_log_status('prc_process_IB_data_api: Zero matching student records found to send to the API ', 'ERROR-32', V('APP_USER'));
        apex_error.add_error(p_message          => 'No records were found to send to the API',
                             p_additional_info  => 'Check for validation/load errors',
                             p_display_location => apex_error.c_inline_with_field_and_notif,
                             p_page_item_name   => '');
        raise;

  end prc_process_ib_data_api;
   /*---------------------------------------------------------------------
  -
  - Procedure:    prc_process_asmt_files
  - Purpose:      this procedure orchestrates the processing of assessment error records being resent by the district
  -
  ---------------------------------------------------------------------*/
  procedure prc_process_asmt_resend (p_district_id          varchar2)
  is
		l_file                  varchar2(100);
  begin
    pkg_assessment_upload.prc_log_status ('Main: Start of processing re-send of assessments for ' || p_district_id, 'INFO-90', V('APP_USER'));

    for rec in (select distinct 'ACT' as Test_type, school_year_to_load from v_district_act_data where status = 'RESEND' and district_id = p_district_id
                union
                select distinct 'AP' as Test_type, school_year_to_load from v_district_ap_data where status = 'RESEND' and district_id = p_district_id
                union
                select distinct 'SAT' as Test_type, school_year_to_load from v_district_sat_data where status = 'RESEND' and district_id = p_district_id
                union
                select distinct 'IB' as Test_type, school_year_to_load from v_district_ib_data where status = 'RESEND' and district_id = p_district_id
                union
                select distinct 'TSI' as Test_type, school_year_to_load from v_district_tsi_data where status = 'RESEND' and district_id = p_district_id
                union
                select distinct 'TSI2' as Test_type, school_year_to_load from v_district_tsi2_data where status = 'RESEND' and district_id = p_district_id)
    loop

          -- output the data to the output file
          if rec.TEST_TYPE = 'SAT' then
						 -- SET FILE NAME
             l_file := p_district_id ||'_SAT_' || rec.SCHOOL_YEAR_TO_LOAD ||'_RESEND_'||to_char(systimestamp,'YYYYMMDDHHMISSFF3')||'.csv';
						 
						 -- update the resend records with new file name
								 update district_sat_data
										set file_name = l_file
									where school_year_to_load = rec.SCHOOL_YEAR_TO_LOAD
										and district_id = p_district_id
										and status = 'RESEND';
										
						 -- SET THE PROCESSING STATUS
						 begin
							 insert into edfi_assmt_file_status
										(file_name_school_year,
										 test_type,
										 processing_status,
										 status_update_ts)
									values
										(l_file,
										 REC.TEST_TYPE,
										 'Loading ODS',
										 systimestamp);      
						 exception
								when DUP_VAL_ON_INDEX then
									-- there is already an entry for this file so update it for the new run.
									update edfi_assmt_file_status
											set processing_status = 'Loading ODS',
													status_update_ts = systimestamp
										where file_name_school_year = l_file;
							end;
						 
						-- call the api to send the rows
						pkg_assessment_upload.prc_process_sat_data_api(p_district_id           => p_district_id,
																													 p_school_year           => rec.SCHOOL_YEAR_TO_LOAD,
																													 p_file_name_school_year => l_file,
																													 p_status                => 'RESEND');
            
          elsif rec.TEST_TYPE = 'TSI' then
            -- SET FILE NAME
             l_file := p_district_id ||'_TSI_' || rec.SCHOOL_YEAR_TO_LOAD ||'_RESEND_'||to_char(systimestamp,'YYYYMMDDHHMISSFF3')||'.csv';
						 
						 -- update the resend records with new file name
								 update district_TSI_data
										set file_name = l_file
									where school_year_to_load = rec.SCHOOL_YEAR_TO_LOAD
										and district_id = p_district_id
										and status = 'RESEND';
										
						 -- SET THE PROCESSING STATUS
						 begin
							 insert into edfi_assmt_file_status
										(file_name_school_year,
										 test_type,
										 processing_status,
										 status_update_ts)
									values
										(l_file,
										 REC.TEST_TYPE,
										 'Loading ODS',
										 systimestamp);      
						 exception
								when DUP_VAL_ON_INDEX then
									-- there is already an entry for this file so update it for the new run.
									update edfi_assmt_file_status
											set processing_status = 'Loading ODS',
													status_update_ts = systimestamp
										where file_name_school_year = l_file;
							end;
						 
						-- call the api to send the rows
						pkg_assessment_upload.prc_process_TSI_data_api(p_district_id           => p_district_id,
																													 p_school_year           => rec.SCHOOL_YEAR_TO_LOAD,
																													 p_file_name_school_year => l_file,
																													 p_status                => 'RESEND');
          elsif rec.TEST_TYPE = 'IB' then
            -- SET FILE NAME
             l_file := p_district_id ||'_IB_' || rec.SCHOOL_YEAR_TO_LOAD ||'_RESEND_'||to_char(systimestamp,'YYYYMMDDHHMISSFF3')||'.csv';
						 
						 -- update the resend records with new file name
								 update district_IB_data
										set file_name = l_file
									where school_year_to_load = rec.SCHOOL_YEAR_TO_LOAD
										and district_id = p_district_id
										and status = 'RESEND';
										
						 -- SET THE PROCESSING STATUS
						 begin
							 insert into edfi_assmt_file_status
										(file_name_school_year,
										 test_type,
										 processing_status,
										 status_update_ts)
									values
										(l_file,
										 REC.TEST_TYPE,
										 'Loading ODS',
										 systimestamp);      
						 exception
								when DUP_VAL_ON_INDEX then
									-- there is already an entry for this file so update it for the new run.
									update edfi_assmt_file_status
											set processing_status = 'Loading ODS',
													status_update_ts = systimestamp
										where file_name_school_year = l_file;
							end;
						 
						-- call the api to send the rows
						pkg_assessment_upload.prc_process_IB_data_api(p_district_id           => p_district_id,
																													 p_school_year           => rec.SCHOOL_YEAR_TO_LOAD,
																													 p_file_name_school_year => l_file,
																													 p_status                => 'RESEND');
          elsif rec.TEST_TYPE = 'AP' then
            -- SET FILE NAME
             l_file := p_district_id ||'_AP_' || rec.SCHOOL_YEAR_TO_LOAD ||'_RESEND_'||to_char(systimestamp,'YYYYMMDDHHMISSFF3')||'.csv';
						 
						 -- update the resend records with new file name
								 update district_AP_data
										set file_name = l_file
									where school_year_to_load = rec.SCHOOL_YEAR_TO_LOAD
										and district_id = p_district_id
										and status = 'RESEND';
										
						 -- SET THE PROCESSING STATUS
						 begin
							 insert into edfi_assmt_file_status
										(file_name_school_year,
										 test_type,
										 processing_status,
										 status_update_ts)
									values
										(l_file,
										 REC.TEST_TYPE,
										 'Loading ODS',
										 systimestamp);      
						 exception
								when DUP_VAL_ON_INDEX then
									-- there is already an entry for this file so update it for the new run.
									update edfi_assmt_file_status
											set processing_status = 'Loading ODS',
													status_update_ts = systimestamp
										where file_name_school_year = l_file;
							end;
						 
						-- call the api to send the rows
						pkg_assessment_upload.prc_process_AP_data_api(p_district_id           => p_district_id,
																													 p_school_year           => rec.SCHOOL_YEAR_TO_LOAD,
																													 p_file_name_school_year => l_file,
																													 p_status                => 'RESEND');
          elsif rec.TEST_TYPE = 'ACT' then
             -- SET FILE NAME
             l_file := p_district_id ||'_ACT_' || rec.SCHOOL_YEAR_TO_LOAD ||'_RESEND_'||to_char(systimestamp,'YYYYMMDDHHMISSFF3')||'.csv';
						 
						 -- update the resend records with new file name
								 update district_ACT_data
										set file_name = l_file
									where school_year_to_load = rec.SCHOOL_YEAR_TO_LOAD
										and district_id = p_district_id
										and status = 'RESEND';
										
						 -- SET THE PROCESSING STATUS
						 begin
							 insert into edfi_assmt_file_status
										(file_name_school_year,
										 test_type,
										 processing_status,
										 status_update_ts)
									values
										(l_file,
										 REC.TEST_TYPE,
										 'Loading ODS',
										 systimestamp);      
						 exception
								when DUP_VAL_ON_INDEX then
									-- there is already an entry for this file so update it for the new run.
									update edfi_assmt_file_status
											set processing_status = 'Loading ODS',
													status_update_ts = systimestamp
										where file_name_school_year = l_file;
							end;
						 
						-- call the api to send the rows
						pkg_assessment_upload.prc_process_ACT_data_api(p_district_id           => p_district_id,
																													 p_school_year           => rec.SCHOOL_YEAR_TO_LOAD,
																													 p_file_name_school_year => l_file,
																													 p_status                => 'RESEND');
          elsif rec.TEST_TYPE = 'TSI2' then
            -- SET FILE NAME
             l_file := p_district_id ||'_TSI2_' || rec.SCHOOL_YEAR_TO_LOAD ||'_RESEND_'||to_char(systimestamp,'YYYYMMDDHHMISSFF3')||'.csv';
						 
						 -- update the resend records with new file name
								 update district_TSI2_data
										set file_name = l_file
									where school_year_to_load = rec.SCHOOL_YEAR_TO_LOAD
										and district_id = p_district_id
										and status = 'RESEND';
										
						 -- SET THE PROCESSING STATUS
						 begin
							 insert into edfi_assmt_file_status
										(file_name_school_year,
										 test_type,
										 processing_status,
										 status_update_ts)
									values
										(l_file,
										 REC.TEST_TYPE,
										 'Loading ODS',
										 systimestamp);      
						 exception
								when DUP_VAL_ON_INDEX then
									-- there is already an entry for this file so update it for the new run.
									update edfi_assmt_file_status
											set processing_status = 'Loading ODS',
													status_update_ts = systimestamp
										where file_name_school_year = l_file;
							end;
						 
						-- call the api to send the rows
						pkg_assessment_upload.prc_process_TSI2_data_api(p_district_id           => p_district_id,
																													 p_school_year           => rec.SCHOOL_YEAR_TO_LOAD,
																													 p_file_name_school_year => l_file,
																													 p_status                => 'RESEND');
          end if;
					-- send email if a prior year upload
					for i in (
						select d.PRIMARY_SCHOOL_YEAR,
									 d.DISTRICT_NAME
							from V_DISTRICTS d
							where d.DISTRICT_CDC = p_district_id
							and  d.school_year = rec.SCHOOL_YEAR_TO_LOAD
							and d.PRIMARY_SCHOOL_YEAR = 'N') loop

						apex_mail.send(
								p_to        => 'chris.bull@region10.org,jeff.pendill@region10.org,garett.jaeckel@region10.org',
								p_from      => 'info@region10.org',
								p_body      => p_district_id||' '||i.DISTRICT_NAME||' uploaded '||REC.TEST_TYPE ||' assessments for school year '||rec.SCHOOL_YEAR_TO_LOAD ,
								p_subj      => i.DISTRICT_NAME||' Prior Year Assessment Uploaded' );

						APEX_MAIL.PUSH_QUEUE;
					end loop;
        end loop;

    pkg_assessment_upload.prc_log_status ('Main: End of processing prc_process_asmt_resend', 'INFO-91', V('APP_USER'));

  end prc_process_asmt_resend;

--------------------------------------------------------------------------------------------------------
-- PROCEDURE to pull the STUDENTS from the ods and load into DISTRICT_STUDENT_CACHE for each active or prior year active districts and school years.
--------------------------------------------------------------------------------------------------------
  procedure proc_cache_students_api
  as
	type r_stu_data is record ( 
			Student_unique_id  varchar2(20),
			first_name         varchar2(100),
			last_name          varchar2(100),
			birth_date         varchar2(20),
			local_id           varchar2(20)
			);
	type tbl_stu_data is table of r_stu_data index by pls_integer;
	l_stu_data          tbl_stu_data; 
	l_found             char;
	l_json_doc          clob;
	l_json_seoa         clob;
	req                 utl_http.req; -- request  for the Student
	res                 utl_http.resp;-- response for the Student
	req_edorg           utl_http.req; -- request  for ed org stu assoc
	res_edorg           utl_http.resp;-- response for ed org stu assoc
	url                 varchar2(4000);
	l_url_base          varchar2(4000);
	l_token             varchar2(200);
	l_offset            integer := 0;
	l_limit             integer := 50;
	l_count             integer := 0;
	l_resp_count        integer := 0;
	-- following are for the local id collection.  in order for the collection to be used in the sql statement with the student data we must have an 
	-- object (o_student) created at the schema level and a table of the objects (t_students) defined at the package level
	l_local_id      pkg_assessment_upload.t_students :=  pkg_assessment_upload.t_students();
	l_local_id_ndx  pls_integer  := 1;
  
  begin
    for rec in (select t.District_cdc
			              ,t.DISTRICT_DB_NUMBER   
                    ,t.school_year
                    ,active
              from DISTRICTS t
              where active in ('Y','P') )
    loop
      -- Check if the district status is 'P' (prior year) and already loaded then skip it.
			if rec.active = 'P' then
				begin
					select 'Y'
						into l_found
						from district_student_cache
						where rec.DISTRICT_CDC = district_id
							and school_year = rec.SCHOOL_YEAR
							and rownum = 1;
					continue; -- already loaded go to the next row in loop
				exception when no_data_found then
					l_found := 'N';
				end;
			end if;
			-- if the cache is not loaded then load it.
			if l_found = 'N'
				or rec.ACTIVE = 'Y' then

				-- delete current cache
				delete from DISTRICT_STUDENT_CACHE
				 where district_id = rec.DISTRICT_CDC and school_year = rec.SCHOOL_YEAR;
				-- get the oauth token
				l_token := PKG_UPDATE_STUDENT_ATTRIBUTES.FN_GET_AUTH_TOKEN_35(P_DB_NUMBER => rec.DISTRICT_DB_NUMBER);
				-- set the url
				l_url_base := PKG_UPDATE_STUDENT_ATTRIBUTES.FN_SET_API_URL(P_DISTRICT_ID => rec.DISTRICT_CDC,
				                                                           P_DB_NUMBER   => rec.DISTRICT_DB_NUMBER);
				-- set the local id array to empty
				l_local_id :=  pkg_assessment_upload.t_students();
				l_local_id_ndx := 1;
				-- get the student local ids first
				loop
					-- start the request to get the local ids via the api
					req_edorg  := UTL_HTTP.begin_request(l_url_base||'studentEducationOrganizationAssociations?offset='||l_offset||'&limit='||l_limit, 'GET');
					utl_http.set_header(req_edorg, 'Authorization', 'Bearer '||l_token);
				          
					-- submit request
					res_edorg := utl_http.get_response(req_edorg);

					if res_edorg.status_code = utl_http.HTTP_OK then
						-- read the response
						utl_http.read_text(res_edorg, l_json_seoa);
						-- if response is an empty set them exit the loop
						if l_json_seoa = '[]' then
							exit;
						end if;
						-- loop through the response json using query to parse out the data we need
						for x in (select  student_unique_id
														 ,identificationCode
												from json_table(l_json_seoa, '$[*]'
												columns (student_unique_id  path '$.studentReference.studentUniqueId',
																 NESTED path '$.studentIdentificationCodes[*]' 
																 COLUMNS(studentIdentificationSystemDescriptor path '$.studentIdentificationSystemDescriptor',
																				 identificationCode                    path '$.identificationCode'))
												) as jt
						          where studentIdentificationSystemDescriptor like '%District')
							loop
								-- add a new element to the l_local_id collection
								l_local_id.extend;
								-- load the collection using the o_student object constructor
								l_local_id(l_local_id_ndx) := o_student( x.student_unique_id,x.identificationCode);
								l_local_id_ndx := l_local_id_ndx + 1;
								-- count how many elements were in the response to increase the offset for the next batch
								l_resp_count := l_resp_count + 1;
							end loop;
					else
						-- we got something other than a 200 status meaning the call had an error
						--DBMS_OUTPUT.put_line('Error occured in api call to studentEducationOrganizationAssociations resp code'||res_edorg.status_code|| ' msg: '||res.reason_phrase);
						prc_log_status('Error occured in api call to studentEducationOrganizationAssociations resp code'||res_edorg.status_code|| ' msg: '||res.reason_phrase, 'ERROR', rec.DISTRICT_CDC||'/'||rec.SCHOOL_YEAR);
						exit;
					end if;
					-- close the response
					utl_http.end_response(res_edorg);
					l_offset := l_offset + l_resp_count;
					l_resp_count := 0;
				end loop;
				utl_http.end_response(res_edorg);
				DBMS_OUTPUT.put_line('count local ids: '||l_local_id.count);
					
				-- Process the student data and join in the local ids from above
				l_offset := 0;																		 
				loop
					-- set the url
					url := '';
					url := l_url_base||'students?offset='||l_offset||'&limit='||l_limit;

					-- start the request to get the students via the api
					req  := UTL_HTTP.begin_request(url, 'GET');
					utl_http.set_header(req, 'Authorization', 'Bearer '||l_token);
						
					-- submit request
					res := utl_http.get_response(req);
					--DBMS_OUTPUT.put_line('resp code : ' || res.status_code || ' msg: '||res.reason_phrase);
						
					if res.status_code = utl_http.HTTP_OK then
							
						-- read the response from the rest call
						utl_http.read_text(res, l_json_doc);
							
						-- if response is an empty set then end the loop
						if l_json_doc = '[]' then
							exit;
						end if;
							
						-- query parses the json from the response and joins in the local id
						select jt.student_unique_id
							 ,first_name
							 ,last_name
							 ,birth_date
							 ,l.local_id as local_id
						bulk collect into l_stu_data
						from json_table(l_json_doc, '$[*]'
						columns (Student_unique_id  path '$.studentUniqueId',
										 first_name         path '$.firstName',
										 last_name          path '$.lastSurname',
										 birth_date         path '$.birthDate')
						) as jt
						left join table(l_local_id) l on l.student_unique_id = jt.student_unique_id;
						
						l_count := l_count +  l_stu_data.count;
/*            for indx in l_stu_data.first..l_stu_data.last loop
							dbms_output.put_line( '-------------------------');
							dbms_output.put_line( l_stu_data(indx).last_name);
							dbms_output.put_line( 	 l_stu_data(indx).first_name);
							dbms_output.put_line(	 to_char(to_date(l_stu_data(indx).birth_date, 'YYYY-MM-DD'),'MM/DD/YYYY'));
							dbms_output.put_line(	 l_stu_data(indx).student_unique_id);
							dbms_output.put_line('local:'||	 l_stu_data(indx).local_id);
						
						end loop;*/
						-- add the students to the cache table
						forall indx in l_stu_data.first..l_stu_data.last
							insert into district_student_cache
								(district_id,
								 create_ts,
								 last_surname,
								 first_name,
								 birth_date,
								 student_unique_id,
								 local_code,
								 school_year)
							values
								(rec.DISTRICT_CDC,
								 systimestamp,
								 l_stu_data(indx).last_name,
								 l_stu_data(indx).first_name,
								 to_char(to_date(l_stu_data(indx).birth_date, 'YYYY-MM-DD'),'MM/DD/YYYY'),
								 l_stu_data(indx).student_unique_id,
								 l_stu_data(indx).local_id,
								 rec.SCHOOL_YEAR);
					else
						--DBMS_OUTPUT.put_line('Error occured in api call to Students resp code : ' || res.status_code || ' msg: '||res.reason_phrase);
						utl_http.end_response(res);
						prc_log_status('Error occured in api call to Students resp code'||res_edorg.status_code|| ' msg: '||res.reason_phrase, 'ERROR', rec.DISTRICT_CDC||'/'||rec.SCHOOL_YEAR);
						exit;
					end if;	
					l_offset := l_offset +  l_stu_data.count;
					utl_http.end_response(res);

				end loop;
				-- be sure to close response after loop
				utl_http.end_response(res);
				--DBMS_OUTPUT.put_line('Total Stu '||l_count);
					
				commit;
       -- prc_log_status('Completed stu cache load', 'INFO', rec.DISTRICT_CDC||'/'||rec.SCHOOL_YEAR);
			end if;
    end loop;

  end proc_cache_students_api;
---------------------------------------------------------------------------------------------------
-- PROCEDURE to load the assessments and objective assessments into the district ODS'.  This should
-- only be run once into a new ods or if changes were made to the bootstrap data.
---------------------------------------------------------------------------------------------------
  procedure proc_load_assessment_bootstrap ( P_DISTRICT_ID varchar2 default 'ALL')
		as
	
	req                 utl_http.req; -- request  for the Student
	res                 utl_http.resp;-- response for the Student
	url                 varchar2(4000);
	l_url_base          varchar2(4000);
	l_token             varchar2(200);

  begin
    for rec in (select t.District_cdc
			              ,t.DISTRICT_DB_NUMBER   
                    ,t.school_year
                    ,active
              from DISTRICTS t
              where active = 'Y'
							  and t.District_cdc = case when P_DISTRICT_ID = 'ALL' then t.District_cdc
								                          else P_DISTRICT_ID end)
    loop
      -- get the oauth token
			l_token := PKG_UPDATE_STUDENT_ATTRIBUTES.FN_GET_AUTH_TOKEN_35(P_DB_NUMBER => rec.DISTRICT_DB_NUMBER);
			-- set the url
			l_url_base := PKG_UPDATE_STUDENT_ATTRIBUTES.FN_SET_API_URL(P_DISTRICT_ID => rec.DISTRICT_CDC,
																																 P_DB_NUMBER   => rec.DISTRICT_DB_NUMBER);																 
			-- set the url for assessments
			url := l_url_base||'assessments';
      DBMS_OUTPUT.put_line('url : ' || url);
			
			-- loop through assessment boot strap rows and load to ODS
			for assmt in (select *
				              from EDFI_ASSESSMENT_BS)
			loop
				
				-- start the request to post the assessment via the api
				req  := UTL_HTTP.begin_request(url, 'POST');
				utl_http.set_header(req, 'Authorization', 'Bearer '||l_token);
				utl_http.set_header(req, 'Content-Type', 'application/json');
				utl_http.set_header(req, 'Content-Length', DBMS_LOB.GETLENGTH(assmt.JSON_PAYLOAD));
				utl_http.write_text(req, DBMS_LOB.SUBSTR(assmt.JSON_PAYLOAD, 4000, 1));
				
				-- submit request
				res := utl_http.get_response(req);
				DBMS_OUTPUT.put_line('resp code : ' || res.status_code || ' msg: '||res.reason_phrase);
				
				if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
					DBMS_OUTPUT.put_line('Error occured in api call to load assessments BS resp code : ' || res.status_code || ' msg: '||res.reason_phrase);
					prc_log_status('PROC_LOAD_ASSESSMENT_BOOTSTRAP: API call Failed '|| res.status_code || ' msg: '||res.reason_phrase, 'ERROR-32', V('APP_USER'));
					utl_http.end_response(res);
					continue;
				end if;	
				utl_http.end_response(res);

			end loop;
			-- be sure to close response after loop
			utl_http.end_response(res);
			
			-- set the url for objective assessments
			url := l_url_base||'objectiveAssessments';
      DBMS_OUTPUT.put_line('url : ' || url);
			
			-- loop through assessment boot strap rows and load to ODS		
			for obj_assmt in (select *
				              from EDFI_OBJECTIVE_ASSESSMENT_BS)
			loop
				
				-- start the request to post the assessment via the api
				req  := UTL_HTTP.begin_request(url, 'POST');
				utl_http.set_header(req, 'Authorization', 'Bearer '||l_token);
				utl_http.set_header(req, 'Content-Type', 'application/json');
				utl_http.set_header(req, 'Content-Length', DBMS_LOB.GETLENGTH(obj_assmt.JSON_PAYLOAD));
				utl_http.write_text(req, DBMS_LOB.SUBSTR(obj_assmt.JSON_PAYLOAD, 4000, 1));
				
				-- submit request
				res := utl_http.get_response(req);
				DBMS_OUTPUT.put_line('resp code : ' || res.status_code || ' msg: '||res.reason_phrase);
				
				if res.status_code not in (utl_http.HTTP_OK,utl_http.HTTP_CREATED) then
					DBMS_OUTPUT.put_line('Error occured in api call to load assessments BS resp code : ' || res.status_code || ' msg: '||res.reason_phrase);
					prc_log_status('PROC_LOAD_ASSESSMENT_BOOTSTRAP: API call Failed '|| res.status_code || ' msg: '||res.reason_phrase, 'ERROR-32', V('APP_USER'));
					utl_http.end_response(res);
					continue;
				end if;	
				utl_http.end_response(res);

			end loop;
			-- be sure to close response after loop
			utl_http.end_response(res);

    end loop;
  end PROC_LOAD_ASSESSMENT_BOOTSTRAP;
	
end pkg_assessment_upload;
/
