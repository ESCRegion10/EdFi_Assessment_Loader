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

prompt --application/pages/delete_00001
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>1);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'CCMR Assessment File Data Loader'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'TONYE_EDFI'
,p_last_upd_yyyymmddhh24miss=>'20201201161030'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32513206675647028)
,p_plug_name=>'CCMR Assessment File Data Loader'
,p_region_template_options=>'#DEFAULT#:t-Region--accent8:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p style="font-weight: bold; padding-top: 10px; padding-bottom:10px">Help for districts loading District Assessment Data for CCMR Insights</p>',
'The CCMR Assessment File Data Loader web application allows data stewards at the district level to upload ACT, AP, IB, SAT and TSI assessment data into their district''s CCMR Insights dashboard using a simple, intuitive interface which provides loadin'
||'g and error statistics for the end user.',
'',
''))
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32911697769663112)
,p_plug_name=>'<p style="color:red;"><u>Important Notice</u></p>'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_template=>wwv_flow_api.id(32394861046647226)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li>File names MUST begin with your 6-digit district id (CDN), followed by the assessment type (ACT, AP, IB, SAT or TSI), both separated by a single underscore (_), and MUST not contain spaces.  The following is a good example of an acceptable file n'
||'ame:  <b>123456_SAT_Results.csv</b>.</li>',
'<li>With the exception of the ACT assessment file, the input assessment file format MUST be comma-separated (.csv) and the first row MUST contain a column header.</li>',
'<li>With the ACT assessment file, the input assessment file format MUST be fixed-width (.txt) and the first row MUST NOT contain a column header.</li>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32911746847663113)
,p_plug_name=>'User Help'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(32394861046647226)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="https://region10.atlassian.net/wiki/spaces/CIFU/pages/555778203/CCMR+Assessment+File+Data+Loader+-+User+s+Guide">User''s Guide</a><br>',
'<a href="https://reveal.region10.org/ords/f?p=115:1:::::P1_CATEGORY:CCMR%20Insights">Open a Support Ticket</a>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
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
