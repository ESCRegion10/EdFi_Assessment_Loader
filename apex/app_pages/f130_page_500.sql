prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.03.31'
,p_release=>'19.1.0.00.15'
,p_default_workspace_id=>30716031763993174
,p_default_application_id=>130
,p_default_owner=>'EDFIAPP'
);
end;
/
 
prompt APPLICATION 130 - CCMR Assessment File Data Loader
--
-- Application Export:
--   Application:     130
--   Name:            CCMR Assessment File Data Loader
--   Date and Time:   20:13 Sunday January 3, 2021
--   Exported By:     TONYE_EDFI
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         19.1.0.00.15
--   Instance ID:     69403231853380
--

prompt --application/pages/delete_00500
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>500);
end;
/
prompt --application/pages/page_00500
begin
wwv_flow_api.create_page(
 p_id=>500
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'Import Status'
,p_step_title=>'Import Status'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'TONYE_EDFI'
,p_last_upd_yyyymmddhh24miss=>'20201201160753'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(38841681369439864)
,p_name=>'Import File Status'
,p_region_name=>'RPT_P500_MASTER'
,p_template=>wwv_flow_api.id(32423732821647198)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--accent8:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct "Id",',
'       "AgentId",',
'       "FileName",',
'       case ',
'          when "Status" = 4 then ''Loaded'' ',
'          else ''Failure''',
'       end as "Load Status",',
'       "Message",',
'       "Rows",',
'       "CreateDate"',
'from v_importer_files_log',
'where substr("FileName",INSTR("FileName",''/'',-1)+1,6) = :G_DISTRICT_ID',
'order by "CreateDate" desc'))
,p_header=>'<div style ="overflow-y: scroll;height:350px;width:1400px;>'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P500_FILENAME'
,p_query_row_template=>wwv_flow_api.id(32446447746647176)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No data imported'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download Import File Status'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(38846776304455819)
,p_query_column_id=>1
,p_column_alias=>'Id'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(38846887211455820)
,p_query_column_id=>2
,p_column_alias=>'AgentId'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(38846946036455821)
,p_query_column_id=>3
,p_column_alias=>'FileName'
,p_column_display_sequence=>3
,p_column_heading=>'Filename'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.:RP:P500_FILENAME:#FileName#'
,p_column_linktext=>'#FileName#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(38847091652455822)
,p_query_column_id=>4
,p_column_alias=>'Load Status'
,p_column_display_sequence=>4
,p_column_heading=>'Status'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(38847110609455823)
,p_query_column_id=>5
,p_column_alias=>'Message'
,p_column_display_sequence=>5
,p_column_heading=>'Message'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(38847214652455824)
,p_query_column_id=>6
,p_column_alias=>'Rows'
,p_column_display_sequence=>6
,p_column_heading=>'Rows'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(38847327135455825)
,p_query_column_id=>7
,p_column_alias=>'CreateDate'
,p_column_display_sequence=>7
,p_column_heading=>'Created Date'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(38863879320576711)
,p_name=>'Import File Status Detail'
,p_template=>wwv_flow_api.id(32423732821647198)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--accent8:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct "FileName",',
'       trunc(to_date("Date",''YYYY-MM-DD HH24:MI:SS''),''MI'') as "Load Time",',
'       count("RowNumber") as "Rows",',
'       case ',
'          when "HttpStatusCode" = ''Created'' then ''Inserted''',
'          when "HttpStatusCode" = ''OK'' then ''Updated''',
'          when "HttpStatusCode" not in (''Created'',''OK'') then ''Failed''',
'       end as "Import Status",',
'       case',
'          when "HttpStatusCode" not in (''Created'',''OK'') then "OdsResponse"',
'          else ''N/A''',
'       end as "Detail"',
'from v_importer_ingestion_log',
'where "FileName" = :P500_FILENAME',
'group by "FileName", TRUNC(TO_DATE("Date",''YYYY-MM-DD HH24:MI:SS''),''MI''), "HttpStatusCode", "OdsResponse"',
'order by trunc(to_date("Date",''YYYY-MM-DD HH24:MI:SS''),''MI'') desc, "FileName"'))
,p_header=>'<div style ="overflow-y: scroll;height:250px;width:1400px;>'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(32446447746647176)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No results found'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download Import File Status Detail'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(38864862412576721)
,p_query_column_id=>1
,p_column_alias=>'FileName'
,p_column_display_sequence=>1
,p_column_heading=>'Filename'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(38864985641576722)
,p_query_column_id=>2
,p_column_alias=>'Load Time'
,p_column_display_sequence=>2
,p_column_heading=>'Load Time'
,p_use_as_row_header=>'N'
,p_column_format=>'DD-MON-YYYY HH:MIPM'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(38865041191576723)
,p_query_column_id=>3
,p_column_alias=>'Rows'
,p_column_display_sequence=>3
,p_column_heading=>'Rows'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39451490907319248)
,p_query_column_id=>4
,p_column_alias=>'Import Status'
,p_column_display_sequence=>4
,p_column_heading=>'Import Status'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39451530621319249)
,p_query_column_id=>5
,p_column_alias=>'Detail'
,p_column_display_sequence=>5
,p_column_heading=>'Detail'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78399271217270518)
,p_plug_name=>'<p style="color:red;"><u>Important Notice</u></p>'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_template=>wwv_flow_api.id(32394861046647226)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li>If any user cannot ascertain the cause of the error, any errors seen on this page should be forwarded to Region 10 Customer Support for further review and resolution.<br>',
'<li>Region 10 Customer Support issues can be opened using <a href="https://reveal.region10.org/ords/f?p=115:1:::::P1_CATEGORY:CCMR%20Insights">Open a Support Ticket</a>',
'',
''))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39089254060005121)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(38841681369439864)
,p_button_name=>'B_REFRESH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(32479918031647142)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_position=>'REGION_TEMPLATE_COPY'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38864772497576720)
,p_name=>'P500_FILENAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(38841681369439864)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38845049942455802)
,p_name=>'Status Detail Color'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(38863879320576711)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38845164168455803)
,p_event_id=>wwv_flow_api.id(38845049942455802)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''td[headers="Import Status"]'').each(function() {  ',
'  if ( $(this).text() === ''Updated'' || $(this).text() === ''Inserted'') {  ',
'    $(this).closest(''tr'').find(''td'').css({"color":"green"});  ',
'  } else {',
'    $(this).closest(''tr'').find(''td'').css({"color":"red"});  ',
'  } ',
'});  '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38847460698455826)
,p_name=>'Status Color'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(38841681369439864)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38847542223455827)
,p_event_id=>wwv_flow_api.id(38847460698455826)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''td[headers="Load Status"]'').each(function() {  ',
'  if ( $(this).text() === ''Loaded'') {  ',
'    $(this).closest(''tr'').find(''td'').css({"color":"green"});  ',
'  } else {',
'    $(this).closest(''tr'').find(''td'').css({"color":"red"});  ',
'  } ',
'});  '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(40149096628525815)
,p_name=>'B_REFRESH'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39089254060005121)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40149951555525821)
,p_event_id=>wwv_flow_api.id(40149096628525815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure you want to refresh the import status report?'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40150957964525822)
,p_event_id=>wwv_flow_api.id(40149096628525815)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_user_id varchar2(100); ',
'begin',
'',
'  select user_id ',
'  into v_user_id ',
'  from edfiapp.user_account_v',
'  where user_sid = :G_USER_SID;',
'',
'  pkg_assessment_upload.prc_load_importer_logs (:G_DISTRICT_ID, v_user_id);',
'',
'end;',
''))
,p_attribute_02=>'G_DISTRICT_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40150461847525822)
,p_event_id=>wwv_flow_api.id(40149096628525815)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(40149412121525820)
,p_event_id=>wwv_flow_api.id(40149096628525815)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Import status report refreshed'
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
