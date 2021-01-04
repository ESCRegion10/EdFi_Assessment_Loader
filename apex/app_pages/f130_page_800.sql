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
--   Date and Time:   20:16 Sunday January 3, 2021
--   Exported By:     TONYE_EDFI
--   Flashback:       0
--   Export Type:     Page Export
--   Version:         19.1.0.00.15
--   Instance ID:     69403231853380
--

prompt --application/pages/delete_00800
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>800);
end;
/
prompt --application/pages/page_00800
begin
wwv_flow_api.create_page(
 p_id=>800
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'Upload Data Reports'
,p_step_title=>'Upload Data Reports'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'TONY.ESPOSITO@REGION10.ORG'
,p_last_upd_yyyymmddhh24miss=>'20201113205121'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38227215424730143)
,p_plug_name=>'<h1>Upload Data Reports</h1>'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--accent5:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(32401702999647215)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32911922531663115)
,p_plug_name=>'SAT Data Report'
,p_parent_plug_id=>wwv_flow_api.id(38227215424730143)
,p_region_template_options=>'#DEFAULT#:t-Region--accent8:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * ',
'from v_district_sat_data',
'where district_id = :G_DISTRICT_ID',
'order by loaded_date desc'))
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
,p_plug_header=>'<div style="overflow: auto; height: 700px;">'
,p_plug_footer=>'</div>'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(39061945831001039)
,p_max_row_count=>'1000000'
,p_allow_report_saving=>'N'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'EDFI'
,p_internal_uid=>39061945831001039
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39447374119319207)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>10
,p_column_identifier=>'P'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39447487039319208)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>20
,p_column_identifier=>'Q'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39062422235001044)
,p_db_column_name=>'BIRTH_DATE'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Birth Date'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39062542350001045)
,p_db_column_name=>'LATEST_SAT_TOTAL'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Latest Sat Total'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39062625515001046)
,p_db_column_name=>'LATEST_SAT_EBRW'
,p_display_order=>50
,p_column_identifier=>'G'
,p_column_label=>'Latest Sat Ebrw'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39062715530001047)
,p_db_column_name=>'LATEST_SAT_MATH_SECTION'
,p_display_order=>60
,p_column_identifier=>'H'
,p_column_label=>'Latest Sat Math Section'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39062870216001048)
,p_db_column_name=>'LATEST_REGISTRATION_NUM'
,p_display_order=>70
,p_column_identifier=>'I'
,p_column_label=>'Latest Registration Num'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39062931980001049)
,p_db_column_name=>'LATEST_ASSESSMENT_DATE'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Latest Assessment Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39087289734005101)
,p_db_column_name=>'DISTRICT_ID'
,p_display_order=>100
,p_column_identifier=>'L'
,p_column_label=>'District Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39087306071005102)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>110
,p_column_identifier=>'M'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39063071218001050)
,p_db_column_name=>'LOADED_DATE'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Loaded Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39062092715001040)
,p_db_column_name=>'AI_CODE'
,p_display_order=>130
,p_column_identifier=>'A'
,p_column_label=>'Ai Code'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39062372121001043)
,p_db_column_name=>'NAME_MI'
,p_display_order=>140
,p_column_identifier=>'D'
,p_column_label=>'Mid Init'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39087457665005103)
,p_db_column_name=>'LINE_NUMBER'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Line Number'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39087548590005104)
,p_db_column_name=>'SECONDARY_ID'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Secondary Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(39102047694005710)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'391021'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LINE_NUMBER:AI_CODE:SECONDARY_ID:FIRST_NAME:NAME_MI:LAST_NAME:BIRTH_DATE:LATEST_SAT_TOTAL:LATEST_SAT_EBRW:LATEST_SAT_MATH_SECTION:LATEST_REGISTRATION_NUM:LATEST_ASSESSMENT_DATE:DISTRICT_ID:FILE_NAME:LOADED_DATE:'
,p_sort_column_1=>'LOADED_DATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'FILE_NAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'LINE_NUMBER'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32912126548663117)
,p_plug_name=>'TSI Data Report'
,p_parent_plug_id=>wwv_flow_api.id(38227215424730143)
,p_region_template_options=>'#DEFAULT#:t-Region--accent8:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>50
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * ',
'from v_district_tsi_data ',
'where district_id = :G_DISTRICT_ID',
'order by loaded_date desc',
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
,p_plug_header=>'<div style="overflow: auto; height: 700px;">'
,p_plug_footer=>'</div>'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(38225057832730121)
,p_max_row_count=>'1000000'
,p_allow_report_saving=>'N'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_select_columns=>'N'
,p_show_rows_per_page=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'EDFI'
,p_internal_uid=>38225057832730121
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38225628570730127)
,p_db_column_name=>'STUDENT_ID'
,p_display_order=>10
,p_column_identifier=>'F'
,p_column_label=>'Student Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38225374949730124)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38225412534730125)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38226012890730131)
,p_db_column_name=>'TSI_MATHEMATICS_PLACEMENT'
,p_display_order=>40
,p_column_identifier=>'J'
,p_column_label=>'Tsi Mathematics Placement'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38226173579730132)
,p_db_column_name=>'TSI_READING_PLACEMENT'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>'Tsi Reading Placement'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38226239083730133)
,p_db_column_name=>'TSI_WRITING_PLACEMENT'
,p_display_order=>60
,p_column_identifier=>'L'
,p_column_label=>'Tsi Writing Placement'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39447673659319210)
,p_db_column_name=>'TSI_WRITEPLACER'
,p_display_order=>70
,p_column_identifier=>'T'
,p_column_label=>'Tsi Writeplacer'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38226738110730138)
,p_db_column_name=>'DISTRICT_ID'
,p_display_order=>80
,p_column_identifier=>'Q'
,p_column_label=>'District Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38226845625730139)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>90
,p_column_identifier=>'R'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38226919084730140)
,p_db_column_name=>'LOADED_DATE'
,p_display_order=>100
,p_column_identifier=>'S'
,p_column_label=>'Loaded Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38225226024730123)
,p_db_column_name=>'TEST_START'
,p_display_order=>110
,p_column_identifier=>'B'
,p_column_label=>'Test Start'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38225591326730126)
,p_db_column_name=>'MIDDLE_INITIAL'
,p_display_order=>120
,p_column_identifier=>'E'
,p_column_label=>'Middle Initial'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38225772553730128)
,p_db_column_name=>'BIRTH_DATE'
,p_display_order=>130
,p_column_identifier=>'G'
,p_column_label=>'Birth Date'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38225811154730129)
,p_db_column_name=>'SITE_ID'
,p_display_order=>140
,p_column_identifier=>'H'
,p_column_label=>'Site Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38225924324730130)
,p_db_column_name=>'INST_ID'
,p_display_order=>150
,p_column_identifier=>'I'
,p_column_label=>'Inst Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38226427067730135)
,p_db_column_name=>'ABE_MATHEMATICS_DIAGNOSTICS'
,p_display_order=>160
,p_column_identifier=>'N'
,p_column_label=>'Abe Mathematics Diagnostics'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38226506181730136)
,p_db_column_name=>'ABE_WRITING_DIAGNOSTICS'
,p_display_order=>170
,p_column_identifier=>'O'
,p_column_label=>'Abe Writing Diagnostics'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38226609681730137)
,p_db_column_name=>'ABE_READING_DIAGNOSTICS'
,p_display_order=>180
,p_column_identifier=>'P'
,p_column_label=>'Abe Reading Diagnostics'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38225103965730122)
,p_db_column_name=>'LINE_NUMBER'
,p_display_order=>190
,p_column_identifier=>'A'
,p_column_label=>'Line Number'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(38255573064115931)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'382556'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'LINE_NUMBER:TEST_START:LAST_NAME:FIRST_NAME:MIDDLE_INITIAL:STUDENT_ID:BIRTH_DATE:SITE_ID:INST_ID:TSI_MATHEMATICS_PLACEMENT:TSI_READING_PLACEMENT:TSI_WRITING_PLACEMENT_2017:ABE_MATHEMATICS_DIAGNOSTICS:ABE_WRITING_DIAGNOSTICS:ABE_READING_DIAGNOSTICS:DI'
||'STRICT_ID:FILE_NAME:LOADED_DATE:TSI_WRITEPLACER'
,p_sort_column_1=>'LOADED_DATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'FILE_NAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'LINE_NUMBER'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38227303721730144)
,p_plug_name=>'AP Data Report'
,p_parent_plug_id=>wwv_flow_api.id(38227215424730143)
,p_region_template_options=>'#DEFAULT#:t-Region--accent8:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * ',
'from v_district_ap_data',
'where district_id = :G_DISTRICT_ID',
'order by loaded_date desc'))
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
,p_plug_header=>'<div style="overflow: auto; height: 700px;">'
,p_plug_footer=>'</div>'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(39009765536976350)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'EDFI'
,p_internal_uid=>39009765536976350
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39058200946001002)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39058341552001003)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39447527958319209)
,p_db_column_name=>'BIRTH_DATE'
,p_display_order=>40
,p_column_identifier=>'AM'
,p_column_label=>'Birth Date'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39061789417001037)
,p_db_column_name=>'DISTRICT_ID'
,p_display_order=>60
,p_column_identifier=>'AK'
,p_column_label=>'District Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39061814500001038)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>70
,p_column_identifier=>'AL'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39061636323001036)
,p_db_column_name=>'LOADED_DATE'
,p_display_order=>80
,p_column_identifier=>'AJ'
,p_column_label=>'Loaded Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39058652557001006)
,p_db_column_name=>'ADMIN_YEAR_01'
,p_display_order=>90
,p_column_identifier=>'F'
,p_column_label=>'Admin Year 01'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39058739517001007)
,p_db_column_name=>'EXAM_CODE_01'
,p_display_order=>100
,p_column_identifier=>'G'
,p_column_label=>'Exam Code 01'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39058860692001008)
,p_db_column_name=>'EXAM_SCORE_01'
,p_display_order=>110
,p_column_identifier=>'H'
,p_column_label=>'Exam Score 01'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39058992651001009)
,p_db_column_name=>'ADMIN_YEAR_02'
,p_display_order=>120
,p_column_identifier=>'I'
,p_column_label=>'Admin Year 02'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39059095050001010)
,p_db_column_name=>'EXAM_CODE_02'
,p_display_order=>130
,p_column_identifier=>'J'
,p_column_label=>'Exam Code 02'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39059172109001011)
,p_db_column_name=>'EXAM_SCORE_02'
,p_display_order=>140
,p_column_identifier=>'K'
,p_column_label=>'Exam Score 02'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39059227764001012)
,p_db_column_name=>'ADMIN_YEAR_03'
,p_display_order=>150
,p_column_identifier=>'L'
,p_column_label=>'Admin Year 03'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39059331494001013)
,p_db_column_name=>'EXAM_CODE_03'
,p_display_order=>160
,p_column_identifier=>'M'
,p_column_label=>'Exam Code 03'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39059439075001014)
,p_db_column_name=>'EXAM_SCORE_03'
,p_display_order=>170
,p_column_identifier=>'N'
,p_column_label=>'Exam Score 03'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39059562170001015)
,p_db_column_name=>'ADMIN_YEAR_04'
,p_display_order=>180
,p_column_identifier=>'O'
,p_column_label=>'Admin Year 04'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39059672182001016)
,p_db_column_name=>'EXAM_CODE_04'
,p_display_order=>190
,p_column_identifier=>'P'
,p_column_label=>'Exam Code 04'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39059700272001017)
,p_db_column_name=>'EXAM_SCORE_04'
,p_display_order=>200
,p_column_identifier=>'Q'
,p_column_label=>'Exam Score 04'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39059888938001018)
,p_db_column_name=>'ADMIN_YEAR_05'
,p_display_order=>210
,p_column_identifier=>'R'
,p_column_label=>'Admin Year 05'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39059906769001019)
,p_db_column_name=>'EXAM_CODE_05'
,p_display_order=>220
,p_column_identifier=>'S'
,p_column_label=>'Exam Code 05'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39060078771001020)
,p_db_column_name=>'EXAM_SCORE_05'
,p_display_order=>230
,p_column_identifier=>'T'
,p_column_label=>'Exam Score 05'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39060126758001021)
,p_db_column_name=>'ADMIN_YEAR_06'
,p_display_order=>240
,p_column_identifier=>'U'
,p_column_label=>'Admin Year 06'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39060230806001022)
,p_db_column_name=>'EXAM_CODE_06'
,p_display_order=>250
,p_column_identifier=>'V'
,p_column_label=>'Exam Code 06'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39060383639001023)
,p_db_column_name=>'EXAM_SCORE_06'
,p_display_order=>260
,p_column_identifier=>'W'
,p_column_label=>'Exam Score 06'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39060466376001024)
,p_db_column_name=>'ADMIN_YEAR_07'
,p_display_order=>270
,p_column_identifier=>'X'
,p_column_label=>'Admin Year 07'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39060501399001025)
,p_db_column_name=>'EXAM_CODE_07'
,p_display_order=>280
,p_column_identifier=>'Y'
,p_column_label=>'Exam Code 07'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39060633523001026)
,p_db_column_name=>'EXAM_SCORE_07'
,p_display_order=>290
,p_column_identifier=>'Z'
,p_column_label=>'Exam Score 07'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39060709711001027)
,p_db_column_name=>'ADMIN_YEAR_08'
,p_display_order=>300
,p_column_identifier=>'AA'
,p_column_label=>'Admin Year 08'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39060828444001028)
,p_db_column_name=>'EXAM_CODE_08'
,p_display_order=>310
,p_column_identifier=>'AB'
,p_column_label=>'Exam Code 08'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39060926170001029)
,p_db_column_name=>'EXAM_SCORE_08'
,p_display_order=>320
,p_column_identifier=>'AC'
,p_column_label=>'Exam Score 08'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39061026072001030)
,p_db_column_name=>'ADMIN_YEAR_09'
,p_display_order=>330
,p_column_identifier=>'AD'
,p_column_label=>'Admin Year 09'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39061176207001031)
,p_db_column_name=>'EXAM_CODE_09'
,p_display_order=>340
,p_column_identifier=>'AE'
,p_column_label=>'Exam Code 09'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39061286047001032)
,p_db_column_name=>'EXAM_SCORE_09'
,p_display_order=>350
,p_column_identifier=>'AF'
,p_column_label=>'Exam Score 09'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39061395665001033)
,p_db_column_name=>'ADMIN_YEAR_10'
,p_display_order=>360
,p_column_identifier=>'AG'
,p_column_label=>'Admin Year 10'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39061486682001034)
,p_db_column_name=>'EXAM_CODE_10'
,p_display_order=>370
,p_column_identifier=>'AH'
,p_column_label=>'Exam Code 10'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39061522386001035)
,p_db_column_name=>'EXAM_SCORE_10'
,p_display_order=>380
,p_column_identifier=>'AI'
,p_column_label=>'Exam Score 10'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39058480603001004)
,p_db_column_name=>'MIDDLE_INITIAL'
,p_display_order=>390
,p_column_identifier=>'D'
,p_column_label=>'Middle Initial'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39058176522001001)
,p_db_column_name=>'LINE_NUMBER'
,p_display_order=>400
,p_column_identifier=>'A'
,p_column_label=>'Line Number'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(39086623960001666)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'390867'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LINE_NUMBER:LAST_NAME:FIRST_NAME:MIDDLE_INITIAL:ADMIN_YEAR_01:EXAM_CODE_01:EXAM_SCORE_01:ADMIN_YEAR_02:EXAM_CODE_02:EXAM_SCORE_02:ADMIN_YEAR_03:EXAM_CODE_03:EXAM_SCORE_03:ADMIN_YEAR_04:EXAM_CODE_04:EXAM_SCORE_04:ADMIN_YEAR_05:EXAM_CODE_05:EXAM_SCORE_'
||'05:ADMIN_YEAR_06:EXAM_CODE_06:EXAM_SCORE_06:ADMIN_YEAR_07:EXAM_CODE_07:EXAM_SCORE_07:ADMIN_YEAR_08:EXAM_CODE_08:EXAM_SCORE_08:ADMIN_YEAR_09:EXAM_CODE_09:EXAM_SCORE_09:ADMIN_YEAR_10:EXAM_CODE_10:EXAM_SCORE_10:LOADED_DATE:DISTRICT_ID:FILE_NAME:BIRTH_DA'
||'TE'
,p_sort_column_1=>'LOADED_DATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'FILE_NAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'LINE_NUMBER'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38265299777021945)
,p_plug_name=>'IB Data Report'
,p_parent_plug_id=>wwv_flow_api.id(38227215424730143)
,p_region_template_options=>'#DEFAULT#:t-Region--accent8:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * ',
'from v_district_ib_data',
'where district_id = :G_DISTRICT_ID',
'order by loaded_date desc'))
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
,p_plug_header=>'<div style="overflow: auto; height: 700px;">'
,p_plug_footer=>'</div>'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(39008662027976339)
,p_max_row_count=>'1000000'
,p_allow_report_saving=>'N'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_select_columns=>'N'
,p_show_rows_per_page=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'EDFI'
,p_internal_uid=>39008662027976339
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39008710621976340)
,p_db_column_name=>'LINE_NUMBER'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Line Number'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39008895088976341)
,p_db_column_name=>'YEAR'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39008963571976342)
,p_db_column_name=>'STUDENT_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Student Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39009060657976343)
,p_db_column_name=>'DISTRICT_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'District Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39009648902976349)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>50
,p_column_identifier=>'J'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39009585921976348)
,p_db_column_name=>'LOADED_DATE'
,p_display_order=>60
,p_column_identifier=>'I'
,p_column_label=>'Loaded Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39009190065976344)
,p_db_column_name=>'SCHOOL_SESSION'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'School Session'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39009282979976345)
,p_db_column_name=>'SUBJECT'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39009310812976346)
,p_db_column_name=>'EXAM_GRADE'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Exam Grade'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39009450568976347)
,p_db_column_name=>'PREDICTED_GRADE'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'Predicted Grade'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(39057507638998370)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'390576'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LINE_NUMBER:YEAR:STUDENT_ID:DISTRICT_ID:SCHOOL_SESSION:SUBJECT:EXAM_GRADE:PREDICTED_GRADE:LOADED_DATE:FILE_NAME'
,p_sort_column_1=>'LOADED_DATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'FILE_NAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'LINE_NUMBER'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39396564777462703)
,p_plug_name=>'ACT Data Report'
,p_parent_plug_id=>wwv_flow_api.id(38227215424730143)
,p_region_template_options=>'#DEFAULT#:t-Region--accent8:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * ',
'from v_district_act_data',
'where district_id = :G_DISTRICT_ID',
'order by loaded_date desc'))
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
,p_plug_header=>'<div style="overflow: auto; height: 700px;">'
,p_plug_footer=>'</div>'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(39396740628462705)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'EDFI'
,p_internal_uid=>39396740628462705
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39450308641319237)
,p_db_column_name=>'LINE_NUMBER'
,p_display_order=>10
,p_column_identifier=>'S'
,p_column_label=>'Line Number'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39398115916462719)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39398231170462720)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39397995292462717)
,p_db_column_name=>'DISTRICT_ID'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'District Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39398007593462718)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39397843283462716)
,p_db_column_name=>'LOADED_DATE'
,p_display_order=>60
,p_column_identifier=>'A'
,p_column_label=>'Loaded Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39400860780462746)
,p_db_column_name=>'OTHER_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Other Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39400946166462747)
,p_db_column_name=>'MID_INIT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Mid Init'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39401083791462748)
,p_db_column_name=>'GENDER'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39401156291462749)
,p_db_column_name=>'BIRTH_DATE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Birth Date'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39401209653462750)
,p_db_column_name=>'ACT_SCALE_SCORES_COMPOSITE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Act Scale Scores Composite'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39446778886319201)
,p_db_column_name=>'ACT_SCALE_SCORES_ENGLISH'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Act Scale Scores English'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39446893171319202)
,p_db_column_name=>'ACT_SCALE_SCORES_MATH'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Act Scale Scores Math'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39446949077319203)
,p_db_column_name=>'ACT_SCALE_SCORES_READING'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Act Scale Scores Reading'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39447016977319204)
,p_db_column_name=>'ACT_SCALE_SCORES_SCIENCE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Act Scale Scores Science'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39447193717319205)
,p_db_column_name=>'TEST_DATE_MONTH_AND_YEAR'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Test Date Month And Year'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39447222646319206)
,p_db_column_name=>'GRADE_LEVEL'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Grade Level'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(39459619274324360)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'394597'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LINE_NUMBER:OTHER_ID:FIRST_NAME:MID_INIT:LAST_NAME:BIRTH_DATE:GENDER:ACT_SCALE_SCORES_COMPOSITE:ACT_SCALE_SCORES_ENGLISH:ACT_SCALE_SCORES_MATH:ACT_SCALE_SCORES_READING:ACT_SCALE_SCORES_SCIENCE:TEST_DATE_MONTH_AND_YEAR:GRADE_LEVEL:DISTRICT_ID:FILE_NAM'
||'E:LOADED_DATE:'
,p_sort_column_1=>'LOADED_DATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'FILE_NAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'LINE_NUMBER'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38282316158013641)
,p_name=>'TSI_DATA_REPORT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(32912126548663117)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38282497575013642)
,p_name=>'SAT_DATA_REPORT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(32911922531663115)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38282593610013643)
,p_name=>'AP_DATA_REPORT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(38227303721730144)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38282625045013644)
,p_name=>'IB_DATA_REPORT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(38265299777021945)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39396627343462704)
,p_name=>'ACT_DATA_REPORT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(39396564777462703)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
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
