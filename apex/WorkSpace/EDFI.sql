prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_210200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_default_workspace_id=>12800282098498789
);
end;
/
prompt  WORKSPACE 12800282098498789
--
-- Workspace, User Group, User, and Team Development Export:
--   Date and Time:   14:12 Tuesday October 18, 2022
--   Exported By:     ADMIN
--   Export Type:     Workspace Export
--   Version:         21.2.3
--   Instance ID:     697912742147843
--
-- Import:
--   Using Instance Administration / Manage Workspaces
--   or
--   Using SQL*Plus as the Oracle user APEX_210200
 
begin
    wwv_flow_api.set_security_group_id(p_security_group_id=>12800282098498789);
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API creates only the meta data for this APEX workspace
prompt  Creating workspace EDFI...
begin
wwv_flow_fnd_user_api.create_company (
  p_id => 12800492233498790
 ,p_provisioning_company_id => 12800282098498789
 ,p_short_name => 'EDFI'
 ,p_display_name => 'EDFI'
 ,p_first_schema_provisioned => 'EDFIAPP'
 ,p_company_schemas => 'EDFIAPP:EDFIDATA'
 ,p_account_status => 'ASSIGNED'
 ,p_allow_plsql_editing => 'Y'
 ,p_allow_app_building_yn => 'Y'
 ,p_allow_packaged_app_ins_yn => 'Y'
 ,p_allow_sql_workshop_yn => 'Y'
 ,p_allow_websheet_dev_yn => 'Y'
 ,p_allow_team_development_yn => 'Y'
 ,p_allow_to_be_purged_yn => 'Y'
 ,p_allow_restful_services_yn => 'Y'
 ,p_source_identifier => 'EDFI'
 ,p_webservice_logging_yn => 'Y'
 ,p_path_prefix => 'EDFI'
 ,p_files_version => 7
 ,p_env_banner_yn => 'N'
 ,p_env_banner_pos => 'LEFT'
);
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1583110771263353,
  p_GROUP_NAME => 'OAuth2 Client Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to register OAuth2 Client Applications');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1583021338263353,
  p_GROUP_NAME => 'RESTful Services',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use RESTful Services with this workspace');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1582979400263351,
  p_GROUP_NAME => 'SQL Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use SQL Developer with this workspace');
end;
/
prompt  Creating group grants...
----------------
-- U S E R S
-- User repository for use with APEX cookie-based authentication.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '13284552907780109',
  p_user_name                    => 'ADAMW_EDFI',
  p_first_name                   => 'Adam',
  p_last_name                    => 'Warner',
  p_description                  => '',
  p_email_address                => 'adam.warner@region10.org',
  p_web_password                 => '463EF8D43924F677FD0B9D8E1C3D9C014E71E6D0A7E3E28BAA00BF969AA906C561DD2B0764541FB96790CF44CD272C7304276812F1F70D7E7E6E91049E43878B',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'EDFIDATA',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202208032231','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_websheet_dev_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '12800173573498789',
  p_user_name                    => 'CHRISB_EDFI',
  p_first_name                   => 'Chris',
  p_last_name                    => 'Bull',
  p_description                  => '',
  p_email_address                => 'Chris.Bull@Region10.org',
  p_web_password                 => 'D16C30EB6AAC73411C05B3A38A5C4AD66378778271811593FABC15420B5BDDF9967C043D3D981F5B2EBA37C001C8D18EEF034F678884B6BE06CA1748B1BD39F5',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'EDFIAPP',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202209221558','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_websheet_dev_yn        => 'N',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
