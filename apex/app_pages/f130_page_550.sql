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
--   Date and Time:   20:12 Sunday January 3, 2021
--   Exported By:     TONYE_EDFI
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         19.1.0.00.15
--   Instance ID:     69403231853380
--

prompt --application/pages/delete_00550
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>550);
end;
/
prompt --application/pages/page_00550
begin
wwv_flow_api.create_page(
 p_id=>550
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'SAT File Data Upload'
,p_step_title=>'SAT'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(32389539971647231)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'TONYE_EDFI'
,p_last_upd_yyyymmddhh24miss=>'20201217161513'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38848221722455834)
,p_plug_name=>'SAT Student Id Mismatch'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent8:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct',
'  last_name',
' ,first_name',
' ,birth_date',
' ,file_name',
' ,loaded_date',
'from v_assessment_stu_id_mismatch',
'where district_id = :G_DISTRICT_ID',
'and assessment_type = ''SAT'' ',
'order by loaded_date desc, file_name, last_name;'))
,p_plug_source_type=>'NATIVE_IR'
,p_translate_title=>'N'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(38848338163455835)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No student mismatches found'
,p_search_button_label=>'Student or File Name'
,p_allow_report_saving=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'NONE'
,p_show_detail_link=>'N'
,p_show_select_columns=>'N'
,p_show_rows_per_page=>'N'
,p_show_filter=>'N'
,p_show_sort=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV'
,p_owner=>'EDFI'
,p_internal_uid=>38848338163455835
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38848881211455840)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38848760992455839)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38848687589455838)
,p_db_column_name=>'BIRTH_DATE'
,p_display_order=>30
,p_column_identifier=>'A'
,p_column_label=>'Birth Date'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38848906268455841)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38849025834455842)
,p_db_column_name=>'LOADED_DATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Loaded Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(39254589709943813)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'392546'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'LOADED_DATE:LAST_NAME:FIRST_NAME:BIRTH_DATE:FILE_NAME:'
,p_sort_column_1=>'LOADED_DATE'
,p_sort_direction_1=>'DESC NULLS LAST'
,p_sort_column_2=>'LAST_NAME'
,p_sort_direction_2=>'ASC NULLS LAST'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'FILE_NAME:0:0:0:0:0'
,p_break_enabled_on=>'FILE_NAME:0:0:0:0:0'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(88086197062680276)
,p_name=>'File Load Stats'
,p_template=>wwv_flow_api.id(32399586131647217)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Form--labelsAbove'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--medium:t-BadgeList--dash:t-BadgeList--stacked:t-Report--hideNoPagination'
,p_display_point=>'REGION_POSITION_03'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  (SELECT max(loaded_date) FROM v_district_sat_data WHERE district_id = :G_DISTRICT_ID) as "Last Upload Date",',
'  (SELECT max(latest_assessment_date) FROM v_district_sat_data WHERE district_id = :G_DISTRICT_ID) as "Last Uploaded SAT Date",',
'  (SELECT count(*) FROM v_district_sat_data where loaded_date = (SELECT max(loaded_date) FROM v_district_sat_data) and district_id = :G_DISTRICT_ID) as "Last Upload Row Count"',
'FROM',
'  dual'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(32435677417647185)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39087658990005105)
,p_query_column_id=>1
,p_column_alias=>'Last Upload Date'
,p_column_display_sequence=>1
,p_column_heading=>'Last Upload Date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39087787216005106)
,p_query_column_id=>2
,p_column_alias=>'Last Uploaded SAT Date'
,p_column_display_sequence=>2
,p_column_heading=>'Last Uploaded SAT Date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39087804092005107)
,p_query_column_id=>3
,p_column_alias=>'Last Upload Row Count'
,p_column_display_sequence=>3
,p_column_heading=>'Last Upload Row Count'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(88087958458680294)
,p_plug_name=>'SAT Data by Assessment Date'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--showIcon:t-Region--accent8:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(32867525444712478)
,p_region_id=>wwv_flow_api.id(88087958458680294)
,p_chart_type=>'lineWithArea'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>false
,p_show_row=>false
,p_show_start=>false
,p_show_end=>false
,p_show_progress=>false
,p_show_baseline=>false
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(32869255819712476)
,p_chart_id=>wwv_flow_api.id(32867525444712478)
,p_seq=>10
,p_name=>'SAT Data Rows Loaded by Test Admin Date'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowcnt, to_char(latest_assessment_date ,''DD-MON-YY'') as latest_assessment_date',
'from (select count(*) as rowcnt,',
'             latest_assessment_date ',
'from v_district_sat_data ',
'where loaded_date <= sysdate and loaded_date >= sysdate - 365',
'and latest_assessment_date is not null',
'and district_id = :G_DISTRICT_ID      ',
'group by latest_assessment_date',
'order by 2);'))
,p_items_value_column_name=>'ROWCNT'
,p_items_label_column_name=>'LATEST_ASSESSMENT_DATE'
,p_color=>'#E65100'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(32868695953712477)
,p_chart_id=>wwv_flow_api.id(32867525444712478)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(32868061919712477)
,p_chart_id=>wwv_flow_api.id(32867525444712478)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(98271611854150862)
,p_plug_name=>'SAT Data by Load Date'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--showIcon:t-Region--accent8:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(32870110718712475)
,p_region_id=>wwv_flow_api.id(98271611854150862)
,p_chart_type=>'bar'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>false
,p_show_row=>false
,p_show_start=>false
,p_show_end=>false
,p_show_progress=>false
,p_show_baseline=>false
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(32871823677712473)
,p_chart_id=>wwv_flow_api.id(32870110718712475)
,p_seq=>10
,p_name=>'SAT Data Rows Loaded by Load Date'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowcnt, to_char(loaded_date,''DD-MON-YY'') as loaded_date',
'from (select count(*) as rowcnt,',
'             to_date(to_char(loaded_date,''DD-MON-YY'')) as loaded_date',
'from v_district_sat_data ',
'where loaded_date <= sysdate and loaded_date >= sysdate - 365',
'and district_id = :G_DISTRICT_ID',
'group by to_date(to_char(loaded_date,''DD-MON-YY''))',
'order by 2);'))
,p_items_value_column_name=>'ROWCNT'
,p_items_label_column_name=>'LOADED_DATE'
,p_color=>'#4CD964'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(32870654143712474)
,p_chart_id=>wwv_flow_api.id(32870110718712475)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(32871207707712474)
,p_chart_id=>wwv_flow_api.id(32870110718712475)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(130736907819625496)
,p_name=>'SAT File Data Upload'
,p_template=>wwv_flow_api.id(32423732821647198)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--accent8:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * ',
'from (select distinct file_name, to_char(loaded_date, ''DD-MON-YY HH:MI:SS'') as loaded_date ',
'      from v_district_sat_data',
'      where district_id = :G_DISTRICT_ID',
'      order by 2 desc)',
'where rownum <= 5'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(32446447746647176)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(33030430507994946)
,p_query_column_id=>1
,p_column_alias=>'FILE_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'File Name'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(33030296983994944)
,p_query_column_id=>2
,p_column_alias=>'LOADED_DATE'
,p_column_display_sequence=>2
,p_column_heading=>'Uploaded Date'
,p_use_as_row_header=>'N'
,p_column_format=>'DD-MON-YYYY HH:MIPM'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32864979613712481)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(130736907819625496)
,p_button_name=>'B_UPLOAD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(32479918031647142)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-file-arrow-up'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38849862927455850)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(38848221722455834)
,p_button_name=>'B_CLEAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(32479918031647142)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-eraser'
,p_grid_new_grid=>false
,p_database_action=>'DELETE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32865330259712480)
,p_name=>'P550_FILE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(130736907819625496)
,p_prompt=>'File'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>50
,p_colspan=>5
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(32478848486647145)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APEX_APPLICATION_TEMP_FILES'
,p_attribute_09=>'SESSION'
,p_attribute_10=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39396384701462701)
,p_name=>'Clear Student ID Mismatches'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(38849862927455850)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39448680193319220)
,p_event_id=>wwv_flow_api.id(39396384701462701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure you want to clear student id mismatch results?'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39396422478462702)
,p_event_id=>wwv_flow_api.id(39396384701462701)
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
'  pkg_assessment_upload.prc_clear_stu_id_mismatch (:G_DISTRICT_ID, ''SAT'', v_user_id);',
'',
'end;'))
,p_attribute_02=>'G_DISTRICT_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39448808500319222)
,p_event_id=>wwv_flow_api.id(39396384701462701)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(38848221722455834)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39088587499005114)
,p_event_id=>wwv_flow_api.id(39396384701462701)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Student id mismatches cleared'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32872430690712473)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Permanent Load Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    t_files apex_t_varchar2;',
'    v_district_id varchar2(6);',
'    v_db_link varchar2(50);',
'    v_output_directory varchar2(100);',
'    v_file_processed varchar2(50);',
'    v_test_type varchar2(10) := ''SAT'';',
'    v_out_test_type varchar2(5);',
'    v_user_id varchar2(100); ',
'    n_rows_with_stu_id number;',
'    e_district_id_missing_error exception; ',
'begin',
'',
'    select user_id ',
'    into v_user_id ',
'    from edfiapp.user_account_v',
'    where user_sid = :G_USER_SID;',
'        ',
'    if :G_DISTRICT_ID is null then',
'      raise e_district_id_missing_error;',
'    else',
'      v_district_id := :G_DISTRICT_ID;',
'    end if;',
'    ',
'    pkg_assessment_upload.prc_log_status (''Main: Start of processing '' ||  v_test_type || '' test(s) for '' || v_district_id, ''INFO-90'', v_user_id); ',
'    :G_ASSESSMENT_TYPE := v_test_type;',
'    pkg_assessment_upload.prc_get_output_directory (v_district_id, v_test_type, v_output_directory, v_user_id);',
'    pkg_assessment_upload.prc_get_database_dblink (v_district_id, v_db_link, ''ODS'', v_user_id); ',
' ',
'    t_files := apex_string.split(p_str => :P550_FILE, p_sep => '':'');',
'    for indx in 1 .. t_files.count',
'    loop',
'    ',
'      :G_FILE_PROCESSED := substr(t_files(indx),INSTR(t_files(indx),''/'',-1)+1);',
'      pkg_assessment_upload.prc_check_file_name_format (v_district_id, v_test_type, :G_FILE_PROCESSED, v_user_id);',
'      pkg_assessment_upload.prc_check_file_header_format (v_district_id, v_test_type, :G_FILE_PROCESSED, t_files(indx), v_out_test_type, v_file_processed, v_user_id); ',
'      pkg_assessment_upload.prc_upload_test_data (v_district_id, v_test_type, :G_FILE_PROCESSED, t_files(indx), v_user_id);',
'      pkg_assessment_upload.prc_load_stu_id_mismatch (v_district_id, v_db_link, v_test_type, :G_FILE_PROCESSED, v_user_id);',
'      pkg_assessment_upload.prc_get_and_output_file_data (v_test_type, v_db_link, :G_FILE_PROCESSED, n_rows_with_stu_id, v_output_directory, v_user_id);',
'    ',
'    end loop;  -- end files to process loop',
'    ',
'    pkg_assessment_upload.prc_get_database_dblink (v_district_id, v_db_link, ''IMPORT'', v_user_id); ',
'    pkg_assessment_upload.prc_delete_old_imported_files (v_district_id, v_output_directory, v_user_id);',
'    pkg_assessment_upload.prc_uploaded_vs_imported_rows (v_test_type, v_district_id, n_rows_with_stu_id, v_user_id, :G_FILE_PROCESSED);',
'    pkg_assessment_upload.prc_log_status (''Main: End of processing '' ||  v_test_type || '' test(s) for '' || v_district_id, ''INFO-91'', v_user_id);',
'    pkg_assessment_upload.prc_reset_and_run_import_agent (v_db_link, v_user_id);',
'        ',
'    exception',
'      when e_district_id_missing_error then',
'        pkg_assessment_upload.prc_log_status (''Main(): District id is missing when processing file '' || substr(:P550_FILE,INSTR(:P550_FILE,''/'',-1)+1), ''ERROR-90'', v_user_id);',
'        apex_error.add_error(p_message          => ''Main(): District id is missing when processing file '' || substr(:P550_FILE,INSTR(:P550_FILE,''/'',-1)+1),',
'                             p_additional_info  => '''',',
'                             p_display_location => apex_error.c_inline_with_field_and_notif,',
'                             p_page_item_name   => ''P550_FILE''); ',
'      when others then ',
'        pkg_assessment_upload.prc_log_status (''Main(): File load error with file '' || substr(:P550_FILE,INSTR(:P550_FILE,''/'',-1)+1), ''ERROR-91'', v_user_id); ',
'        apex_error.add_error(p_message          => ''Main(): File load error with file '' || sqlerrm || '' with file '' || substr(:P550_FILE,INSTR(:P550_FILE,''/'',-1)+1),',
'                             p_additional_info  => '''',',
'                             p_display_location => apex_error.c_inline_with_field_and_notif,',
'                             p_page_item_name   => ''P550_FILE'');',
'         ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
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
