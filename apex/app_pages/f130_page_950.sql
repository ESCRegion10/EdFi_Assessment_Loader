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

prompt --application/pages/delete_00950
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>950);
end;
/
prompt --application/pages/page_00950
begin
wwv_flow_api.create_page(
 p_id=>950
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'Administration'
,p_page_mode=>'MODAL'
,p_step_title=>'Administration'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(32382429528647237)
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_last_updated_by=>'TONYE_EDFI'
,p_last_upd_yyyymmddhh24miss=>'20201120084543'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38282894837013646)
,p_plug_name=>'Choose District'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38305755054626824)
,p_plug_name=>'Button'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(32398553479647218)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38305422965626821)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(38305755054626824)
,p_button_name=>'B_CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--danger'
,p_button_template_id=>wwv_flow_api.id(32479868277647142)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38303635270626803)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(38305755054626824)
,p_button_name=>'B_FINISHED'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success'
,p_button_template_id=>wwv_flow_api.id(32479868277647142)
,p_button_image_alt=>'Finished'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38282987364013647)
,p_name=>'P950_CHOOSE_DISTRICT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(38282894837013646)
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct district_name, district_cdc',
'from v_districts',
'order by 1'))
,p_field_template=>wwv_flow_api.id(32478735398647145)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(38305897341626825)
,p_validation_name=>'Validate District Not Null'
,p_validation_sequence=>10
,p_validation=>'P950_CHOOSE_DISTRICT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select a district ...'
,p_associated_item=>wwv_flow_api.id(38282987364013647)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38305593845626822)
,p_name=>'Cancel'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(38305422965626821)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38305650713626823)
,p_event_id=>wwv_flow_api.id(38305593845626822)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(38305226881626819)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set District Id'
,p_process_sql_clob=>':G_DISTRICT_ID := :P950_CHOOSE_DISTRICT;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(38305345971626820)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Modal'
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
