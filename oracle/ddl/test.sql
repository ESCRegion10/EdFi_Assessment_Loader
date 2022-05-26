prompt PL/SQL Developer Export User Objects for user EDFIDATA@HDSTQA
prompt Created by chris.bull on Thursday, May 5, 2022
set define off
spool test.log

prompt
prompt Creating table APPLICATION_PERMISSION
prompt =====================================
prompt
@@application_permission.tab
prompt
prompt Creating table ASSESSMENT_CONFIG
prompt ================================
prompt
@@assessment_config.tab
prompt
prompt Creating table ASSESSMENT_FILE_FORMAT
prompt =====================================
prompt
@@assessment_file_format.tab
prompt
prompt Creating table ASSESSMENT_STATUS_LOG
prompt ====================================
prompt
@@assessment_status_log.tab
prompt
prompt Creating table ASSESSMENT_STD_FILE_FORMAT
prompt =========================================
prompt
@@assessment_std_file_format.tab
prompt
prompt Creating table ASSESSMENT_STU_ID_MISMATCH
prompt =========================================
prompt
@@assessment_stu_id_mismatch.tab
prompt
prompt Creating table ASSESSMENT_TEST_COLS
prompt ===================================
prompt
@@assessment_test_cols.tab
prompt
prompt Creating table DEBUG_ASSESSMENT_HEADER
prompt ======================================
prompt
@@debug_assessment_header.tab
prompt
prompt Creating table DISTRICTS
prompt ========================
prompt
@@districts.tab
prompt
prompt Creating table DISTRICT_ACT_DATA
prompt ================================
prompt
@@district_act_data.tab
prompt
prompt Creating table DISTRICT_AP_DATA
prompt ===============================
prompt
@@district_ap_data.tab
prompt
prompt Creating table DISTRICT_ASSESSMENT_HEADER
prompt =========================================
prompt
@@district_assessment_header.tab
prompt
prompt Creating table DISTRICT_DB_LINK
prompt ===============================
prompt
@@district_db_link.tab
prompt
prompt Creating table DISTRICT_DB_LINK_SY
prompt ==================================
prompt
@@district_db_link_sy.tab
prompt
prompt Creating table DISTRICT_IB_DATA
prompt ===============================
prompt
@@district_ib_data.tab
prompt
prompt Creating table DISTRICT_OUTPUT_DIR
prompt ==================================
prompt
@@district_output_dir.tab
prompt
prompt Creating table DISTRICT_SAT_DATA
prompt ================================
prompt
@@district_sat_data.tab
prompt
prompt Creating table DISTRICT_STAFF_CACHE
prompt ===================================
prompt
@@district_staff_cache.tab
prompt
prompt Creating table DISTRICT_STANDARD_FILE_FORMAT
prompt ============================================
prompt
@@district_standard_file_format.tab
prompt
prompt Creating table DISTRICT_STUDENT_CACHE
prompt =====================================
prompt
@@district_student_cache.tab
prompt
prompt Creating table DISTRICT_STUDENT_CERTS_CACHE
prompt ===========================================
prompt
@@district_student_certs_cache.tab
prompt
prompt Creating table DISTRICT_TEMP_ACT_DATA
prompt =====================================
prompt
@@district_temp_act_data.tab
prompt
prompt Creating table DISTRICT_TSI2_DATA
prompt =================================
prompt
@@district_tsi2_data.tab
prompt
prompt Creating table DISTRICT_TSI_DATA
prompt ================================
prompt
@@district_tsi_data.tab
prompt
prompt Creating table EDFI_AP_IB_TEST
prompt ==============================
prompt
@@edfi_ap_ib_test.tab
prompt
prompt Creating table EDFI_CONFIG
prompt ==========================
prompt
@@edfi_config.tab
prompt
prompt Creating table EDFI_COURSE_DUAL_CR
prompt ==================================
prompt
@@edfi_course_dual_cr.tab
prompt
prompt Creating table EDFI_STUDENT_CERTS
prompt =================================
prompt
@@edfi_student_certs.tab
prompt
prompt Creating table EDFI_STUDENT_DATA
prompt ================================
prompt
@@edfi_student_data.tab
prompt
prompt Creating table EMAIL_TYPE
prompt =========================
prompt
@@email_type.tab
prompt
prompt Creating table EMAIL_SPECIFICATION
prompt ==================================
prompt
@@email_specification.tab
prompt
prompt Creating table IMPORTER_FILES_LOG
prompt =================================
prompt
@@importer_files_log.tab
prompt
prompt Creating table IMPORTER_INGESTION_LOG
prompt =====================================
prompt
@@importer_ingestion_log.tab
prompt
prompt Creating table ODS_TABLE_CNT_CACHE
prompt ==================================
prompt
@@ods_table_cnt_cache.tab
prompt
prompt Creating table PARENT_ANON
prompt ==========================
prompt
@@parent_anon.tab
prompt
prompt Creating table REST_DISTRICT
prompt ============================
prompt
@@rest_district.tab
prompt
prompt Creating table SECURITY_GROUP
prompt =============================
prompt
@@security_group.tab
prompt
prompt Creating table SECURITY_GROUP_PERMISSION
prompt ========================================
prompt
@@security_group_permission.tab
prompt
prompt Creating table SECURITY_TRANSACTION_LOG
prompt =======================================
prompt
@@security_transaction_log.tab
prompt
prompt Creating table STAFF_TITLE
prompt ==========================
prompt
@@staff_title.tab
prompt
prompt Creating table SYSTEM_CONFIG
prompt ============================
prompt
@@system_config.tab
prompt
prompt Creating table USER_ACCOUNT
prompt ===========================
prompt
@@user_account.tab
prompt
prompt Creating table USER_CAMPUS
prompt ==========================
prompt
@@user_campus.tab
prompt
prompt Creating table USER_GROUP
prompt =========================
prompt
@@user_group.tab
prompt
prompt Creating sequence SID_SEQUENCE
prompt ==============================
prompt
@@sid_sequence.seq
prompt
prompt Creating package PKG_IDMGR_USER_ACCOUNT
prompt =======================================
prompt
@@pkg_idmgr_user_account.sql
prompt
prompt Creating view USER_ACCOUNT_V
prompt ============================
prompt
@@user_account_v.vw
prompt
prompt Creating view V_ASSESSMENT_BY_TITLE
prompt ===================================
prompt
@@v_assessment_by_title.vw
prompt
prompt Creating view V_ASSESSMENT_STD_FILE_FORMAT
prompt ==========================================
prompt
@@v_assessment_std_file_format.vw
prompt
prompt Creating view V_ASSESSMENT_STU_ID_MISMATCH
prompt ==========================================
prompt
@@v_assessment_stu_id_mismatch.vw
prompt
prompt Creating view V_ASSESSMENT_SUMMARY
prompt ==================================
prompt
@@v_assessment_summary.vw
prompt
prompt Creating view V_CAMPUS
prompt ======================
prompt
@@v_campus.vw
prompt
prompt Creating view V_CAMPUS_SUMMARY
prompt ==============================
prompt
@@v_campus_summary.vw
prompt
prompt Creating view V_DISTRICT
prompt ========================
prompt
@@v_district.vw
prompt
prompt Creating package PKG_DISTRICTS
prompt ==============================
prompt
@@pkg_districts.sql
prompt
prompt Creating view V_DISTRICTS
prompt =========================
prompt
@@v_districts.vw
prompt
prompt Creating view V_DISTRICT_ACT_DATA
prompt =================================
prompt
@@v_district_act_data.vw
prompt
prompt Creating view V_DISTRICT_AP_DATA
prompt ================================
prompt
@@v_district_ap_data.vw
prompt
prompt Creating view V_DISTRICT_ASSESSMENT_HEADER
prompt ==========================================
prompt
@@v_district_assessment_header.vw
prompt
prompt Creating view V_DISTRICT_DB_LINK
prompt ================================
prompt
@@v_district_db_link.vw
prompt
prompt Creating view V_DISTRICT_IB_DATA
prompt ================================
prompt
@@v_district_ib_data.vw
prompt
prompt Creating view V_DISTRICT_SAT_DATA
prompt =================================
prompt
@@v_district_sat_data.vw
prompt
prompt Creating view V_DISTRICT_STUDENT_CACHE
prompt ======================================
prompt
@@v_district_student_cache.vw
prompt
prompt Creating view V_DISTRICT_STU_CERTS_CACHE
prompt ========================================
prompt
@@v_district_stu_certs_cache.vw
prompt
prompt Creating view V_DISTRICT_TSI2_DATA
prompt ==================================
prompt
@@v_district_tsi2_data.vw
prompt
prompt Creating view V_DISTRICT_TSI_DATA
prompt =================================
prompt
@@v_district_tsi_data.vw
prompt
prompt Creating view V_IDMGR_USER_CAMPUS
prompt =================================
prompt
@@v_idmgr_user_campus.vw
prompt
prompt Creating view V_IMPORTER_FILES_LOG
prompt ==================================
prompt
@@v_importer_files_log.vw
prompt
prompt Creating view V_IMPORTER_INGESTION_LOG
prompt ======================================
prompt
@@v_importer_ingestion_log.vw
prompt
prompt Creating view V_ODS_TABLE_CNT_CACHE
prompt ===================================
prompt
@@v_ods_table_cnt_cache.vw
prompt
prompt Creating view V_PERMISSIONS
prompt ===========================
prompt
@@v_permissions.vw
prompt
prompt Creating view V_SECURITY_GROUP
prompt ==============================
prompt
@@v_security_group.vw
prompt
prompt Creating view V_STAFF_TITLE
prompt ===========================
prompt
@@v_staff_title.vw
prompt
prompt Creating view V_USER_CAMPUS_DROP
prompt ================================
prompt
@@v_user_campus_drop.vw
prompt
prompt Creating view V_USER_CAMPUS_LIST
prompt ================================
prompt
@@v_user_campus_list.vw
prompt
prompt Creating view V_USER_SECURITY_GROUP
prompt ===================================
prompt
@@v_user_security_group.vw
prompt
prompt Creating materialized view MV_ASSESSMENT_BY_TITLE
prompt =================================================
prompt
@@mv_assessment_by_title.mvw
prompt
prompt Creating materialized view MV_ASSESSMENT_SUMMARY
prompt ================================================
prompt
@@mv_assessment_summary.mvw
prompt
prompt Creating materialized view MV_CAMPUS_SUMMARY
prompt ============================================
prompt
@@mv_campus_summary.mvw
prompt
prompt Creating package PKG_ASSESSMENT_UPLOAD
prompt ======================================
prompt
@@pkg_assessment_upload.sql
prompt
prompt Creating package PKG_SV_ACCT_MGMT
prompt =================================
prompt
@@pkg_sv_acct_mgmt.sql
prompt
prompt Creating package PKG_SV_SECURITY
prompt ================================
prompt
@@pkg_sv_security.sql
prompt
prompt Creating package PKG_UPDATE_STUDENT_ATTRIBUTES
prompt ==============================================
prompt
@@pkg_update_student_attributes.sql

prompt Done
spool off
set define on
