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

prompt --application/pages/delete_00700
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>700);
end;
/
prompt --application/pages/page_00700
begin
wwv_flow_api.create_page(
 p_id=>700
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'ACT File Data Upload'
,p_step_title=>'ACT File Data Upload'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(32389539971647231)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'TONYE_EDFI'
,p_last_upd_yyyymmddhh24miss=>'20201217161355'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39449444051319228)
,p_plug_name=>'ACT Student Id Mismatch'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent8:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>40
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
'from edfidata.assessment_stu_id_mismatch',
'where district_id = :G_DISTRICT_ID',
'and assessment_type = ''ACT'' ',
'order by loaded_date desc, file_name, last_name;'))
,p_plug_source_type=>'NATIVE_IR'
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
 p_id=>wwv_flow_api.id(39449502345319229)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No student mismatches found'
,p_search_button_label=>'Student or File Name'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_owner=>'EDFI'
,p_internal_uid=>39449502345319229
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39449691533319230)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39449725475319231)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39449859148319232)
,p_db_column_name=>'BIRTH_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Birth Date'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39449932749319233)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39450066221319234)
,p_db_column_name=>'LOADED_DATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Loaded Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(39632606181879542)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'396327'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'LAST_NAME:FIRST_NAME:BIRTH_DATE:FILE_NAME:LOADED_DATE'
,p_sort_column_1=>'LOADED_DATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'LAST_NAME'
,p_sort_direction_2=>'ASC'
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39451641987319250)
,p_plug_name=>'ACT Download CSV Formatted File'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--showIcon:t-Region--accent8:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct *',
'from v_district_act_data',
'where district_id = :G_DISTRICT_ID',
''))
,p_plug_source_type=>'NATIVE_IR'
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
 p_id=>wwv_flow_api.id(39722746575058001)
,p_max_row_count=>'1000000'
,p_search_button_label=>'File Name'
,p_allow_report_saving=>'N'
,p_show_nulls_as=>'--'
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
,p_download_filename=>'&P700_ACT_CSV_RPT_NAME.'
,p_owner=>'EDFI'
,p_internal_uid=>39722746575058001
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39722961670058003)
,p_db_column_name=>'OTHER_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Other Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39723048604058004)
,p_db_column_name=>'LINE_NUMBER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Line Number'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39723174261058005)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39723296681058006)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39723380799058007)
,p_db_column_name=>'MID_INIT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Mid Init'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39723485992058008)
,p_db_column_name=>'GENDER'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39723516428058009)
,p_db_column_name=>'BIRTH_DATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Birth Date'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39723617254058010)
,p_db_column_name=>'ACT_SCALE_SCORES_COMPOSITE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Act Scale Scores Composite'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39723739680058011)
,p_db_column_name=>'ACT_SCALE_SCORES_ENGLISH'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Act Scale Scores English'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39723877428058012)
,p_db_column_name=>'ACT_SCALE_SCORES_MATH'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Act Scale Scores Math'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39723920475058013)
,p_db_column_name=>'ACT_SCALE_SCORES_READING'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Act Scale Scores Reading'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39724091573058014)
,p_db_column_name=>'ACT_SCALE_SCORES_SCIENCE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Act Scale Scores Science'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39724156814058015)
,p_db_column_name=>'TEST_DATE_MONTH_AND_YEAR'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Test Date Month And Year'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39724292020058016)
,p_db_column_name=>'GRADE_LEVEL'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Grade Level'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39724342767058017)
,p_db_column_name=>'LOADED_DATE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Loaded Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39724446657058018)
,p_db_column_name=>'DISTRICT_ID'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'District Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39724576458058019)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(39736106071109403)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'397362'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'OTHER_ID:LAST_NAME:FIRST_NAME:MID_INIT:GENDER:BIRTH_DATE:ACT_SCALE_SCORES_COMPOSITE:ACT_SCALE_SCORES_ENGLISH:ACT_SCALE_SCORES_MATH:ACT_SCALE_SCORES_READING:ACT_SCALE_SCORES_SCIENCE:TEST_DATE_MONTH_AND_YEAR:GRADE_LEVEL:FILE_NAME'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(120647006422893737)
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
'  (SELECT max(loaded_date) FROM v_district_act_data) as "Last Load Date",',
'  (SELECT max(test_date_month_and_year) FROM v_district_act_data) as "Last ACT Date",',
'  (SELECT count(*) FROM v_district_act_data where loaded_date = (SELECT max(loaded_date) FROM v_district_act_data)) as "Last Row Count"',
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
 p_id=>wwv_flow_api.id(32749126136412314)
,p_query_column_id=>1
,p_column_alias=>'Last Load Date'
,p_column_display_sequence=>1
,p_column_heading=>'Last Load Date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39725046576058024)
,p_query_column_id=>2
,p_column_alias=>'Last ACT Date'
,p_column_display_sequence=>3
,p_column_heading=>'Last ACT Date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(32748761006412315)
,p_query_column_id=>3
,p_column_alias=>'Last Row Count'
,p_column_display_sequence=>2
,p_column_heading=>'Last Row Count'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(120648767818893755)
,p_plug_name=>'ACT Data Uploading History'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--showIcon:t-Region--accent8:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(32749860142412313)
,p_region_id=>wwv_flow_api.id(120648767818893755)
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
 p_id=>wwv_flow_api.id(32751545460412312)
,p_chart_id=>wwv_flow_api.id(32749860142412313)
,p_seq=>10
,p_name=>'ACT Data Rows Uploaded by Test Admin Date'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowcnt, latest_assessment_date',
'from (select count(*) as rowcnt,',
'       test_date_month_and_year as latest_assessment_date',
'       from v_district_act_data ',
'       where district_id = :G_DISTRICT_ID ',
'       and loaded_date < sysdate and loaded_date > sysdate - 365',
'       group by test_date_month_and_year )',
'order by 2;'))
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
 p_id=>wwv_flow_api.id(32750364484412313)
,p_chart_id=>wwv_flow_api.id(32749860142412313)
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
 p_id=>wwv_flow_api.id(32750910403412312)
,p_chart_id=>wwv_flow_api.id(32749860142412313)
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
 p_id=>wwv_flow_api.id(130832421214364323)
,p_plug_name=>'ACT Upload Date History'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent8:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(32752484803412311)
,p_region_id=>wwv_flow_api.id(130832421214364323)
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
 p_id=>wwv_flow_api.id(32754157812412309)
,p_chart_id=>wwv_flow_api.id(32752484803412311)
,p_seq=>10
,p_name=>'ACT Data Rows Uploaded by Load Date'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowcnt, loaded_date',
'from (select count(*) as rowcnt,',
'       to_char(loaded_date,''MM/DD/YYYY'') as loaded_date',
'       from v_district_act_data ',
'       where district_id = :G_DISTRICT_ID ',
'       and loaded_date < sysdate and loaded_date > sysdate - 365',
'       group by to_char(loaded_date, ''MM/DD/YYYY''))',
'order by 2;',
'',
''))
,p_items_value_column_name=>'ROWCNT'
,p_items_label_column_name=>'LOADED_DATE'
,p_color=>'#4CD964'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(32752931710412310)
,p_chart_id=>wwv_flow_api.id(32752484803412311)
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
 p_id=>wwv_flow_api.id(32753556722412310)
,p_chart_id=>wwv_flow_api.id(32752484803412311)
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
 p_id=>wwv_flow_api.id(163297717179838957)
,p_name=>'ACT File Data Upload'
,p_template=>wwv_flow_api.id(32423732821647198)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--accent8:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct file_name, to_char(loaded_date, ''DD-MON-YY HH:MI:SS'') as loaded_date ',
'from v_district_act_data ',
'where district_id = :G_DISTRICT_ID ',
'order by 2 desc'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(32446447746647176)
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
 p_id=>wwv_flow_api.id(39450137690319235)
,p_query_column_id=>1
,p_column_alias=>'FILE_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'File Name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39450284511319236)
,p_query_column_id=>2
,p_column_alias=>'LOADED_DATE'
,p_column_display_sequence=>2
,p_column_heading=>'Loaded Date'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32747293190412317)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(163297717179838957)
,p_button_name=>'UPLOAD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(32479918031647142)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-file-arrow-up'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_column_span=>4
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39823789742148724)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(39449444051319228)
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
 p_id=>wwv_flow_api.id(32747694138412316)
,p_name=>'P700_FILE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(163297717179838957)
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
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39088862952005117)
,p_name=>'P700_ACT_CSV_RPT_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(39451641987319250)
,p_use_cache_before_default=>'NO'
,p_source=>':P700_ACT_CSV_RPT_NAME := :G_DISTRICT_ID || ''_ACT_'' || to_char(sysdate, ''YYYYMMDDHH24MISS'');'
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'U'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39823953713150182)
,p_name=>'Clear Student ID Mismatches'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39823789742148724)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39824364548150183)
,p_event_id=>wwv_flow_api.id(39823953713150182)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure you want to clear student id mismatch results?'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39825839265150184)
,p_event_id=>wwv_flow_api.id(39823953713150182)
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
'  ',
'  pkg_assessment_upload.prc_clear_stu_id_mismatch (:G_DISTRICT_ID, ''ACT'', v_user_id); ',
'  ',
'end;'))
,p_attribute_02=>'G_DISTRICT_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39825380100150184)
,p_event_id=>wwv_flow_api.id(39823953713150182)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(39449444051319228)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39088386401005112)
,p_event_id=>wwv_flow_api.id(39823953713150182)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Student id mismatches cleared'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32755403179412307)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Permament Load Data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    t_files apex_t_varchar2;',
'    v_district_id varchar2(6);',
'    v_db_link varchar2(50);',
'    v_output_directory varchar2(100);',
'    v_file_processed varchar2(50);',
'    v_test_type varchar2(10) := ''ACT'';',
'    v_out_test_type varchar2(5);',
'    v_user_id varchar2(100); ',
'    n_rows_with_stu_id number;',
'    e_district_id_missing_error exception; ',
'begin',
'   ',
'    select user_id ',
'    into v_user_id ',
'    from edfiapp.user_account_v',
'    where user_sid = :G_USER_SID;',
'      ',
'    if :G_DISTRICT_ID is null then',
'      raise e_district_id_missing_error;',
'    else',
'      v_district_id := :G_DISTRICT_ID;',
'    end if;',
'    ',
'    pkg_assessment_upload.prc_log_status (''Main: Start of processing '' ||  v_test_type || '' test(s) for '' || v_district_id, ''INFO-90'', v_user_id);',
'    :G_ASSESSMENT_TYPE := v_test_type;',
'    pkg_assessment_upload.prc_get_output_directory (v_district_id, v_test_type, v_output_directory, v_user_id);',
'    pkg_assessment_upload.prc_get_database_dblink (v_district_id, v_db_link, ''ODS'', v_user_id); ',
' ',
'    t_files := apex_string.split(p_str => :P700_FILE, p_sep => '':'');',
'    for indx in 1 .. t_files.count',
'    loop',
'    ',
'      :G_FILE_PROCESSED := substr(t_files(indx),INSTR(t_files(indx),''/'',-1)+1);',
'      pkg_assessment_upload.prc_check_file_name_format (v_district_id, v_test_type, :G_FILE_PROCESSED, v_user_id);',
'      -- ACT raw file has no file header   ',
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
'    pkg_assessment_upload.prc_reset_and_run_import_agent (v_db_link, v_user_id);',
'    pkg_assessment_upload.prc_log_status (''Main: End of processing '' ||  v_test_type || '' test(s) for '' || v_district_id, ''INFO-91'', v_user_id);',
'  ',
'    exception',
'      when e_district_id_missing_error then',
'        pkg_assessment_upload.prc_log_status (''Main(): District id is missing when processing file '' || substr(:P700_FILE,INSTR(:P700_FILE,''/'',-1)+1), ''ERROR-90'', v_user_id);',
'        apex_error.add_error(p_message          => ''Main(): District id is missing when processing file '' || substr(:P700_FILE,INSTR(:P700_FILE,''/'',-1)+1),',
'                             p_additional_info  => '''',',
'                             p_display_location => apex_error.c_inline_with_field_and_notif,',
'                             p_page_item_name   => ''P700_FILE''); ',
'      when others then ',
'        pkg_assessment_upload.prc_log_status (''Main(): File load error with file '' || substr(:P700_FILE,INSTR(:P700_FILE,''/'',-1)+1), ''ERROR-91'', v_user_id); ',
'        apex_error.add_error(p_message          => ''Main(): File load error with file '' || substr(:P700_FILE,INSTR(:P700_FILE,''/'',-1)+1),',
'                             p_additional_info  => substr(sqlerrm,1,200),',
'                             p_display_location => apex_error.c_inline_with_field_and_notif,',
'                             p_page_item_name   => ''P700_FILE'');',
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
