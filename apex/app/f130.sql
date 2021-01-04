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
--   Date and Time:   20:18 Sunday January 3, 2021
--   Exported By:     TONYE_EDFI
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         19.1.0.00.15
--   Instance ID:     69403231853380
--

-- Application Statistics:
--   Pages:                     14
--     Items:                   26
--     Validations:              1
--     Processes:               14
--     Regions:                 51
--     Buttons:                 17
--     Dynamic Actions:         10
--   Shared Components:
--     Logic:
--       Items:                  5
--     Navigation:
--       Lists:                  2
--       Breadcrumbs:            1
--         Entries:              2
--     Security:
--       Authentication:         2
--       Authorization:          1
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              16
--         Label:                7
--         List:                12
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:              10
--       LOVs:                   1
--       Shortcuts:              1
--     Globalization:
--     Reports:
--     E-Mail:
--   Supporting Objects:  Included

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'EDFIAPP')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'CCMR Assessment File Data Loader')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'130')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'44471BF009A189996F8A7EE1E5AC55218CC07C5DA130D083140ED7BAAE9FDB0F'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'19.1'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Application created from create application wizard 2020.05.22.'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(38291459692649700)
,p_application_tab_set=>1
,p_logo_image=>'#WORKSPACE_IMAGES#ccrmInsights.svg'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'CCMR Assessment File Data Loader'
,p_last_updated_by=>'TONYE_EDFI'
,p_last_upd_yyyymmddhh24miss=>'20201217161513'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'/i/')
,p_files_version=>8
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/remote_servers/accountqa_region10_org_ords_edfidata
begin
wwv_flow_api.create_remote_server(
 p_id=>wwv_flow_api.id(38422897596328521)
,p_name=>'accountqa-region10-org-ords-edfidata'
,p_static_id=>'accountqa_region10_org_ords_edfidata'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('accountqa_region10_org_ords_edfidata'),'https://accountqa.region10.org/ords/edfidata/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('accountqa_region10_org_ords_edfidata'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('accountqa_region10_org_ords_edfidata'),'')
,p_prompt_on_install=>false
);
end;
/
prompt --application/shared_components/remote_servers/itunes_apple_com
begin
wwv_flow_api.create_remote_server(
 p_id=>wwv_flow_api.id(38459199240160309)
,p_name=>'itunes-apple-com'
,p_static_id=>'itunes_apple_com'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('itunes_apple_com'),'http://itunes.apple.com/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('itunes_apple_com'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('itunes_apple_com'),'')
,p_prompt_on_install=>false
);
end;
/
prompt --application/shared_components/data_profiles/rest_district
begin
wwv_flow_api.create_data_profile(
 p_id=>wwv_flow_api.id(38423041272328518)
,p_name=>'rest_district'
,p_format=>'JSON'
,p_row_selector=>'items'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38423263447328499)
,p_data_profile_id=>wwv_flow_api.id(38423041272328518)
,p_name=>'COLUMN_1_ID'
,p_sequence=>1
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38423697345328498)
,p_data_profile_id=>wwv_flow_api.id(38423041272328518)
,p_name=>'COLUMN_2_NAME'
,p_sequence=>2
,p_data_type=>'VARCHAR2'
,p_max_length=>2000
,p_has_time_zone=>false
,p_selector=>'name'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38424047099328498)
,p_data_profile_id=>wwv_flow_api.id(38423041272328518)
,p_name=>'COLUMN_3_HIREDATE'
,p_sequence=>3
,p_data_type=>'DATE'
,p_format_mask=>'YYYY-MM-DD"T"HH24:MI:SS'
,p_has_time_zone=>false
,p_selector=>'hire-date'
);
end;
/
prompt --application/shared_components/data_profiles/itunes
begin
wwv_flow_api.create_data_profile(
 p_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'iTunes'
,p_format=>'JSON'
,p_row_selector=>'results'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38459569046160307)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'WRAPPERTYPE'
,p_sequence=>1
,p_is_hidden=>true
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'wrapperType'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38459972454160307)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'KIND'
,p_sequence=>2
,p_is_hidden=>true
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'kind'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38460387721160306)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'ARTISTID'
,p_sequence=>3
,p_is_hidden=>true
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'artistId'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38460748423160305)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'COLLECTIONID'
,p_sequence=>4
,p_is_hidden=>true
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'collectionId'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38461181545160305)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'TRACKID'
,p_sequence=>5
,p_is_hidden=>true
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'trackId'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38461527440160304)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'ARTISTNAME'
,p_sequence=>6
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artistName'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38461965560160304)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'COLLECTIONNAME'
,p_sequence=>7
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'collectionName'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38462328330160304)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'TRACKNAME'
,p_sequence=>8
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'trackName'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38462774853160303)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'COLLECTIONCENSOREDNAME'
,p_sequence=>9
,p_is_hidden=>true
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'collectionCensoredName'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38463100430160303)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'TRACKCENSOREDNAME'
,p_sequence=>10
,p_is_hidden=>true
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'trackCensoredName'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38463551300160303)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'ARTISTVIEWURL'
,p_sequence=>11
,p_is_hidden=>true
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artistViewUrl'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38463920489160302)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'COLLECTIONVIEWURL'
,p_sequence=>12
,p_is_hidden=>true
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'collectionViewUrl'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38464340738160302)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'TRACKVIEWURL'
,p_sequence=>13
,p_is_hidden=>true
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'trackViewUrl'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38464776399160302)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'PREVIEWURL'
,p_sequence=>14
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'previewUrl'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38465135951160301)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'ARTWORKURL30'
,p_sequence=>15
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artworkUrl30'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38465509998160301)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'ARTWORKURL60'
,p_sequence=>16
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artworkUrl60'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38465960880160301)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'ARTWORKURL100'
,p_sequence=>17
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'artworkUrl100'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38466352669160300)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'COLLECTIONPRICE'
,p_sequence=>18
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'collectionPrice'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38466748495160300)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'TRACKPRICE'
,p_sequence=>19
,p_is_hidden=>true
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'trackPrice'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38467181310160300)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'RELEASEDATE'
,p_sequence=>20
,p_data_type=>'TIMESTAMP WITH TIME ZONE'
,p_format_mask=>'YYYY"-"MM"-"DD"T"HH24":"MI:SSTZR'
,p_has_time_zone=>true
,p_selector=>'releaseDate'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38467537716160299)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'COLLECTIONEXPLICITNESS'
,p_sequence=>21
,p_is_hidden=>true
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'collectionExplicitness'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38467959083160299)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'TRACKEXPLICITNESS'
,p_sequence=>22
,p_is_hidden=>true
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'trackExplicitness'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38468351631160299)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'DISCCOUNT'
,p_sequence=>23
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'discCount'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38468722008160298)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'DISCNUMBER'
,p_sequence=>24
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'discNumber'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38469128341160298)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'TRACKCOUNT'
,p_sequence=>25
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'trackCount'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38469534813160298)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'TRACKNUMBER'
,p_sequence=>26
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'trackNumber'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38469923031160297)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'TRACKTIMEMILLIS'
,p_sequence=>27
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'trackTimeMillis'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38470352107160297)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'COUNTRY'
,p_sequence=>28
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'country'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38470734579160297)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'CURRENCY'
,p_sequence=>29
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'currency'
);
wwv_flow_api.create_data_profile_col(
 p_id=>wwv_flow_api.id(38471109188160296)
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_name=>'PRIMARYGENRENAME'
,p_sequence=>30
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'primaryGenreName'
);
end;
/
prompt --application/shared_components/web_sources/rest_district
begin
wwv_flow_api.create_web_source_module(
 p_id=>wwv_flow_api.id(38424450262328496)
,p_name=>'rest_district'
,p_static_id=>'rest_district'
,p_web_source_type=>'ORDS_3'
,p_data_profile_id=>wwv_flow_api.id(38423041272328518)
,p_remote_server_id=>wwv_flow_api.id(38422897596328521)
,p_url_path_prefix=>'/rest_district/hol/'
);
wwv_flow_api.create_web_source_operation(
 p_id=>wwv_flow_api.id(38424714902328493)
,p_web_src_module_id=>wwv_flow_api.id(38424450262328496)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_allow_fetch_all_rows=>false
);
wwv_flow_api.create_web_source_operation(
 p_id=>wwv_flow_api.id(38425150208328492)
,p_web_src_module_id=>wwv_flow_api.id(38424450262328496)
,p_operation=>'POST'
,p_database_operation=>'INSERT'
,p_url_pattern=>'.'
,p_allow_fetch_all_rows=>false
);
wwv_flow_api.create_web_source_operation(
 p_id=>wwv_flow_api.id(38425560382328492)
,p_web_src_module_id=>wwv_flow_api.id(38424450262328496)
,p_operation=>'PUT'
,p_database_operation=>'UPDATE'
,p_url_pattern=>'/:id'
,p_allow_fetch_all_rows=>false
);
wwv_flow_api.create_web_source_operation(
 p_id=>wwv_flow_api.id(38425991445328492)
,p_web_src_module_id=>wwv_flow_api.id(38424450262328496)
,p_operation=>'DELETE'
,p_database_operation=>'DELETE'
,p_url_pattern=>'/:id'
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/web_sources/itunes
begin
wwv_flow_api.create_web_source_module(
 p_id=>wwv_flow_api.id(38471538819160296)
,p_name=>'iTunes'
,p_static_id=>'iTunes'
,p_web_source_type=>'HTTP_FEED'
,p_data_profile_id=>wwv_flow_api.id(38459348875160309)
,p_remote_server_id=>wwv_flow_api.id(38459199240160309)
,p_url_path_prefix=>'/search'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(38472290424160292)
,p_web_src_module_id=>wwv_flow_api.id(38471538819160296)
,p_name=>'term'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'beatles'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(38472683009160291)
,p_web_src_module_id=>wwv_flow_api.id(38471538819160296)
,p_name=>'entity'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'musicVideo'
,p_is_static=>true
);
wwv_flow_api.create_web_source_operation(
 p_id=>wwv_flow_api.id(38471860178160295)
,p_web_src_module_id=>wwv_flow_api.id(38471538819160296)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(32373915770647261)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(32512303743647032)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(32740559966412327)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'ACT'
,p_list_item_link_target=>'f?p=&APP_ID.:700:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'700'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(32708777425421335)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'AP'
,p_list_item_link_target=>'f?p=&APP_ID.:600:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'600'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(32724638139415349)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'IB'
,p_list_item_link_target=>'f?p=&APP_ID.:650:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'650'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(32855521770712493)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'SAT'
,p_list_item_link_target=>'f?p=&APP_ID.:550:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'550'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(32757319919323058)
,p_list_item_display_sequence=>25
,p_list_item_link_text=>'TSI'
,p_list_item_link_target=>'f?p=&APP_ID.:750:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'750'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33348416917804070)
,p_list_item_display_sequence=>45
,p_list_item_link_text=>'Upload Data Reports'
,p_list_item_link_target=>'f?p=&APP_ID.:800:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'800'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(44210943290481581)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'File Format Errors'
,p_list_item_link_target=>'f?p=&APP_ID.:900:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-exclamation-triangle-o'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(38841268180439863)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Import Status'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gears'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'500'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(39702451405088543)
,p_list_item_display_sequence=>62
,p_list_item_link_text=>'Update Student CCMR Data'
,p_list_item_link_target=>'f?p=&APP_ID.:2000:&SESSION.::&DEBUG.:2000:::'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(38301908838710536)
,p_list_item_display_sequence=>65
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=&APP_ID.:950:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-tools'
,p_security_scheme=>wwv_flow_api.id(38332730334606649)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(32502043310647104)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(38341757418221578)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'EdFi Monitoring Dashboard'
,p_list_item_link_target=>'f?p=119:1:&SESSION.'
,p_list_item_icon=>'fa-angle-double-left'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(32513824449647017)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.(&G_DISTRICT_ID.)'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(32514386313647017)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(32513824449647017)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(32514793411647016)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(32513824449647017)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files/app_icon_svg
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '3C73766720786D6C6E733D22687474703A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B222076696577426F783D223020302036342036';
wwv_flow_api.g_varchar2_table(2) := '34223E3C646566733E3C7374796C653E2E636C732D317B66696C6C3A75726C282372616469616C2D6772616469656E74293B7D2E636C732D327B6F7061636974793A302E313B7D2E636C732D332C2E636C732D347B66696C6C3A236666663B7D2E636C73';
wwv_flow_api.g_varchar2_table(3) := '2D337B6F7061636974793A302E363B7D3C2F7374796C653E3C72616469616C4772616469656E742069643D2272616469616C2D6772616469656E74222063783D223332222063793D222E30352220723D22363422206772616469656E74556E6974733D22';
wwv_flow_api.g_varchar2_table(4) := '7573657253706163654F6E557365223E3C73746F70206F66667365743D2230222073746F702D636F6C6F723D2223666666222073746F702D6F7061636974793D22302E3135222F3E3C73746F70206F66667365743D222E35222073746F702D636F6C6F72';
wwv_flow_api.g_varchar2_table(5) := '3D2223666666222073746F702D6F7061636974793D22302E31222F3E3C73746F70206F66667365743D2231222073746F702D636F6C6F723D2223666666222073746F702D6F7061636974793D2230222F3E3C2F72616469616C4772616469656E743E3C73';
wwv_flow_api.g_varchar2_table(6) := '796D626F6C2069643D22616D6269656E742D6C69676874696E67222076696577426F783D22302030203634203634223E3C7061746820636C6173733D22636C732D312220643D224D302030683634763634682D36347A222F3E3C2F73796D626F6C3E3C2F';
wwv_flow_api.g_varchar2_table(7) := '646566733E3C7469746C653E6261722D6C696E652D63686172743C2F7469746C653E3C726563742077696474683D22363422206865696768743D223634222066696C6C3D2223324542464243222F3E3C672069643D2269636F6E73223E3C706174682063';
wwv_flow_api.g_varchar2_table(8) := '6C6173733D22636C732D322220643D224D313920343668357631682D357A4D323620343668357631682D357A4D333320343668357631682D357A4D343020343668357631682D357A222F3E3C7061746820636C6173733D22636C732D332220643D224D31';
wwv_flow_api.g_varchar2_table(9) := '3920333868357638682D357A4D32362033326835763134682D357A4D33332033326835763134682D357A4D34302032376835763139682D357A222F3E3C6720636C6173733D22636C732D32223E3C636972636C652063783D2234322E35222063793D2232';
wwv_flow_api.g_varchar2_table(10) := '302E352220723D22312E35222F3E3C636972636C652063783D2233352E35222063793D2232352E352220723D22312E35222F3E3C636972636C652063783D2232382E35222063793D2232352E352220723D22312E35222F3E3C636972636C652063783D22';
wwv_flow_api.g_varchar2_table(11) := '32312E35222063793D2233312E352220723D22312E35222F3E3C7061746820643D224D32312E3832352033312E3837396C2D2E36352D2E37353820372E31342D362E31323168372E3032356C362E3836392D342E3930372E3538322E3831342D372E3133';
wwv_flow_api.g_varchar2_table(12) := '3120352E303933682D362E3937356C2D362E383620352E3837397A222F3E3C2F673E3C636972636C6520636C6173733D22636C732D34222063783D2234322E35222063793D2231392E352220723D22312E35222F3E3C636972636C6520636C6173733D22';
wwv_flow_api.g_varchar2_table(13) := '636C732D34222063783D2233352E35222063793D2232342E352220723D22312E35222F3E3C636972636C6520636C6173733D22636C732D34222063783D2232382E35222063793D2232342E352220723D22312E35222F3E3C636972636C6520636C617373';
wwv_flow_api.g_varchar2_table(14) := '3D22636C732D34222063783D2232312E35222063793D2233302E352220723D22312E35222F3E3C7061746820636C6173733D22636C732D342220643D224D32312E3832352033302E3837396C2D2E36352D2E37353820372E31342D362E31323168372E30';
wwv_flow_api.g_varchar2_table(15) := '32356C362E3836392D342E3930372E3538322E3831342D372E31333120352E303933682D362E3937356C2D362E383620352E3837397A222F3E3C2F673E3C7573652077696474683D22363422206865696768743D2236342220786C696E6B3A687265663D';
wwv_flow_api.g_varchar2_table(16) := '2223616D6269656E742D6C69676874696E67222069643D226C69676874696E67222F3E3C2F7376673E';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(32503389228647073)
,p_file_name=>'app-icon.svg'
,p_mime_type=>'image/svg+xml'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/app_icon_css
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E6170702D69636F6E207B0A202020206261636B67726F756E642D696D6167653A2075726C286170702D69636F6E2E737667293B0A202020206261636B67726F756E642D7265706561743A206E6F2D7265706561743B0A202020206261636B67726F756E';
wwv_flow_api.g_varchar2_table(2) := '642D73697A653A20636F7665723B0A202020206261636B67726F756E642D706F736974696F6E3A203530253B0A202020206261636B67726F756E642D636F6C6F723A20233245424642433B0A7D';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(32503673139647072)
,p_file_name=>'app-icon.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/users_guide_pdf
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '255044462D312E360D25E2E3CFD30D0A31382030206F626A0D3C3C2F4C696E656172697A656420312F4C2038373639382F4F2032302F452038323438372F4E20312F542038373339332F48205B20343631203135375D3E3E0D656E646F626A0D20202020';
wwv_flow_api.g_varchar2_table(2) := '20202020202020202020202020200D0A32362030206F626A0D3C3C2F4465636F64655061726D733C3C2F436F6C756D6E7320342F507265646963746F722031323E3E2F46696C7465722F466C6174654465636F64652F49445B3C41323837343632363131';
wwv_flow_api.g_varchar2_table(3) := '423436433430423734444233383130463341383542383E3C41303734433141314237373342373442424334324231314244324644334333323E5D2F496E6465785B31382031335D2F496E666F203137203020522F4C656E6774682035382F507265762038';
wwv_flow_api.g_varchar2_table(4) := '373339342F526F6F74203139203020522F53697A652033312F547970652F585265662F575B31203220315D3E3E73747265616D0D0A68DE62626410606062608A02120C538004E32B10F71B88D80D244A2781C4160389E6650C4C8C0C0B41EA181821C47F';
wwv_flow_api.g_varchar2_table(5) := 'C61DFF00020C0007A409EA0D0A656E6473747265616D0D656E646F626A0D7374617274787265660D0A300D0A2525454F460D0A20202020202020200D0A33302030206F626A0D3C3C2F432037352F46696C7465722F466C6174654465636F64652F492039';
wwv_flow_api.g_varchar2_table(6) := '372F4C656E6774682037332F532033383E3E73747265616D0D0A68DE626060606360604A64606060B4B76440058C40CCC2C0D1802CC606C50C0CAF1804804A78182E16AF60D879B81EA281D1C91CA291F1295C0B0B0363881354540120C000921708890D';
wwv_flow_api.g_varchar2_table(7) := '0A656E6473747265616D0D656E646F626A0D31392030206F626A0D3C3C2F4C616E6728FEFF0045004E002D00550053292F4D61726B496E666F3C3C2F4D61726B656420747275653E3E2F4D657461646174612032203020522F506167654C61796F75742F';
wwv_flow_api.g_varchar2_table(8) := '4F6E65436F6C756D6E2F5061676573203136203020522F53747275637454726565526F6F742036203020522F547970652F436174616C6F673E3E0D656E646F626A0D32302030206F626A0D3C3C2F436F6E74656E7473203232203020522F43726F70426F';
wwv_flow_api.g_varchar2_table(9) := '785B302E3020302E30203631322E30203739322E305D2F4D65646961426F785B302E3020302E30203631322E30203739322E305D2F506172656E74203136203020522F5265736F75726365733C3C2F4578744753746174653C3C2F475330203237203020';
wwv_flow_api.g_varchar2_table(10) := '523E3E2F466F6E743C3C2F545430203239203020523E3E2F584F626A6563743C3C2F496D30203235203020523E3E3E3E2F526F7461746520302F537472756374506172656E747320302F546162732F532F547970652F506167653E3E0D656E646F626A0D';
wwv_flow_api.g_varchar2_table(11) := '32312030206F626A0D3C3C2F46696C7465722F466C6174654465636F64652F46697273742031382F4C656E677468203430372F4E20332F547970652F4F626A53746D3E3E73747265616D0D0A68DEA452614BE43010FD2BF3F10EF1269924ED1664A1BBBA';
wwv_flow_api.g_varchar2_table(12) := '7782AB62F75C41FC106B6E37D84D973682FE7B93B42A087E3909349D372F2FEF31A11C18D0048A0CA80011FE8E8EB03CADE09F6E7A83B3259EB7DD4E37382F81FF62787139762E2E97C0B12AC1774F06ABA5EE1F03D5195CBDEC0D9E3CFBDF95D7DE60AD';
wwv_flow_api.g_varchar2_table(13) := 'D3B9763F9C9B4EA37E5F1BE78133CA70AEF77F8CDD6C3D6482F0D80CAD43C109178DDEF4C1132E5AE767B3F6F9F65031917AC049B2247097BA0BBDB3CDCB8FB96EEC7D677F0E986D0C018910F02A01E77A67F0ACBC595F55072333E195EF8CAFB76F4923';
wwv_flow_api.g_varchar2_table(14) := 'B41E2C49C6F0D4076A5DBA4D638061E5CDEE1A266C8819A9D17267F7BEEDF0664C22B33CE59CE9DE44CAE74B4F5CDD3E58B7C1B575A5EBED7BBDB05DEFE75BDDBDA5FE108F438A41CEF4C8E032C3EAE9DE471FAB30836468D5FE753688192099E8EF36C3';
wwv_flow_api.g_varchar2_table(15) := '5D0F7EDBDF1265A1F1BDA5F2227E8518EB4CF0F88A148DF544A90FAE1C5899A42FD464529361508A14C86292309E2AA22271E29E1745C214E56967206478B2050721D488FCDF22C5EEA6D35701060014F4CDCF0D0A656E6473747265616D0D656E646F62';
wwv_flow_api.g_varchar2_table(16) := '6A0D32322030206F626A0D3C3C2F46696C7465722F466C6174654465636F64652F4C656E677468203337333E3E73747265616D0D0A488974524D4B033110BDE757BC6372D86C329B6C764104DB6AA950B01AF1A01EA4ADB562ADB616FFBE93FD5014DCC3';
wwv_flow_api.g_varchar2_table(17) := '326FE6BD37C34C0651E417383ACAA7C3C90806C7C783D110228FD1C0223E0AA38D21C439B21439C44F58A3EB8A31D3DBD006D21582A9B547DC885B391C4E9563202F9583C44465A46BC857459AF17EAD6C2AAE5401F9A432FE7FA8CCB285DCE344B5C17E';
wwv_flow_api.g_varchar2_table(18) := 'C9E490828D2A3441763879F81F01AEB911A7DF5AEB97D6799BAA16F261D1B8F7A61DE99B9B1569AAB5CA18CDD987BB3C7C70B79092BF8CBAC9A1329FD25DD36646F6DD3199B57744A44C53E889632696908756DE99A6A192E952DDC77361D2724DDA2BF1';
wwv_flow_api.g_varchar2_table(19) := '043EA47821B8557C16A7D3748B9FFBD8FE3E99256DA904EFD5B8FA7F01F502B2BAB01649E7CBEA8FE0941FC1D97A75D82DBF85452F7C178150060FC732967B5D5484DD52DCE0958BF9F8CA60B517AE0CBAE6CF3B42F330129171557B04DB946A72F0AED6';
wwv_flow_api.g_varchar2_table(20) := 'A5AD7CE909F38DC8271B83D156CCDA3966E24B800100762289570D0A656E6473747265616D0D656E646F626A0D32332030206F626A0D3C3C2F46696C7465722F466C6174654465636F64652F4C656E6774682032393735362F4C656E6774683120383633';
wwv_flow_api.g_varchar2_table(21) := '32353E3E73747265616D0D0A4889D4556B50544716FECEEDDB97091199E1218AC0BD33CCA002516312352E468C6F1144C1279187800C06645416DF80607CCB438D4A5C151FE5A47453BA55464D62A2D97263ADEBAE64754DB26AA2E083E03388D13838B3';
wwv_flow_api.g_varchar2_table(22) := '3D03895AB5B5FFF74E75F739A74F9FB9F7EBEEEF0301F041291812C726F5EAB3EDCF7D1B45E49268E999F919B6CD95354F008A01BAF6CF2C2AD43EB17DFB06105208F063336C39F9C5DFB37E80A9B728129593B76006B706EC027AA500DA196B7646D6A3';
wwv_flow_api.g_varchar2_table(23) := 'D3E1AD40623751AFAF55047C3E0A3D26FC69C2375BF30BE70F7C50B453F84B81DCBB790599196C485404F06981F05BF233E6DB5EB1451680CC99225F9B95919F6D1ABE7699F0CB012FBBAD606EA1AB6BD72F40D191EE79DB9C6C9B7F8EA98BF0478BF2B7';
wwv_flow_api.g_varchar2_table(24) := 'C0E428AA02878ED7F0D7C45784B58DAC0ECB25E820F97249926426C957D0D37502E645A2CA4BA2213E49D3100B385D0A9CA0935EDBA5080DE472CFB123BCA3FBDF10207A096EFC206CE6B6A4302892B73B40689F79F690C8963C9684FFFDB4AD646C34DB';
wwv_flow_api.g_varchar2_table(25) := 'CC8EB00FE537D916B68915B31256210F6413D81C3699E5B1DBEC0EBBCBEEB1FBEC27D6CC1EB016F6904D6213E5A1F26079188B675B21C3003F74460822D00DD1E8850188C15B188A6188C3244CC154A4220B56CC45211660214A5829B3B1A56C235B4877';
wwv_flow_api.g_varchar2_table(26) := '48225FD253308551774AA4A9348D72298F0AE8F754444B6815ADA1B554451FD0C77482BEA4AFE8149D61656C162B67EF7B90EC802084612412914F3231E2E4450A79532069A49291C2298D52299DA6D3022AA1622AA5325A4A47E8301DA54F5925DBCDF6';
wwv_flow_api.g_varchar2_table(27) := 'B13FB26AB688ADA72DAC966D673BA959F292DF862F92E531F27079843C921D90C7CBF172B29C24AD9113A88EBE96C7910F2D67092C4E1E258F552AE5217222B3B25C3645EC92380D188B89B49215B22296CAD2D8549622C7CA13E86F2896BBB3BD2C8B65';
wwv_flow_api.g_varchar2_table(28) := '534F1AC1AAD862369D65CA03E005150A8C08C5ABE883D7D11BF148105F380633F12E7269063D1207C947F293CC52901429A95234B542EE122CB632586CA617823DB7AC58B24A07D83CB18FABD95AB6535ECE7BF1893C8DAFE095FC337E8A37F116254471';
wwv_flow_api.g_varchar2_table(29) := '7995E80EE93ED7B93A0E0A3D1E7A5A0D5443D5616ABC3A499DA2A6A8D3D425EA21F5A47A4EBDA8DE535B54A7A6D74C9A598BD07A6BAF6B03B4B7B4A15A9A365BABD0366A1F6BC7B5CB466EF437061935A3C91861EC69EC634C30A61997196B8C1F9A2493';
wwv_flow_api.g_varchar2_table(30) := '62F235F999024DC126D5D4C314651A69CA3065874BE1FA70A379AEB9C5028B64E960D15B022C9D2D3B2DFB2D672C672D37BA9544E745DBA24B7A06EDF96E8F6BEFB6BD3BECC176A37D85BDC2FE91FD4F76D7FEB4FDD90ED911E4E8EB8871BCE518EC18EA';
wwv_flow_api.g_varchar2_table(31) := 'F8D2E16ACD6C6D793AE869F3D396A74F9DE1CE42E75267ABD3E5F2DC29818D865A29573AC816B265029B0AB65B5EC95FE55378065FC5ABF9315EC7EF2B50C2BC1275B5BAC3BAF3021B849E0875AA9D554D1DA926B66393A696AA87D5AFD40BEA65B559FD';
wwv_flow_api.g_varchar2_table(32) := '5983E6E7C12652EBA3F5D7620436A99A4D2BD4AAB45AED683B369D9EC326DE98642C3756FD868D4160D3C514D68E4DBA29CB838D664E3737995D2F60B3CF72DA834D51747AF4ACE842814DDD9E8B7B6305364176CD6EB2AFB357D90FDA1FEDEFBD3FCB01';
wwv_flow_api.g_varchar2_table(33) := '87BF23D4D15F6013EB18E218EE38D79ADADAFC34C683CD13A7E6B4398B9CE51E6CC8F5D00D0FFFA68D189C47DBC680A680C6809B80F706B7E7BDE979F270E5DD5AF1BC7FEB3DF12BFB6F34F324B941B0E11D0FE3355CBB33CE3DFE58E5EE6FEFA83FD8D0';
wwv_flow_api.g_varchar2_table(34) := '1FA82FAB2F69886A08B93EE1D735B7A93EAE7E74FD5051779BA77AAFFAF0AB0EE06A43D3E4A6B8A698A6DDEE68E3B4C6E4C6718D098D718DFE8D2F03371B6FFED31DAFFF0BF0438FBC94BC9499CB66966732C01A620DB276B206E49CCDDA91B5155053DD';
wwv_flow_api.g_varchar2_table(35) := '79817303E704CEF658BF041C0482AC413383B27D77F9F773C73A9E6A6348EA44A22A4F57EE2A8FC52593BCBAEBEEB6BDA5775FD162BD278A7EA5F7890E651DAEF8E87C3A790E9AD567B1EF3EDF43BE4EBDAE2D57AFD78FD11FD2D7E99BF42D86CE861043';
wwv_flow_api.g_varchar2_table(36) := 'B4618C3B6EB08A36C750E4B18B0CF345BFCF70BE6D8DE1D233140DE70D170C770DF77FF39FB89BA1B5DD7BFC5CE67D3FF9C51D689B353CF6139AE1A73D3FE317F962A65F986866BF89EDDE647F37FFC07FD7B30CFFEDFE873CC6FFB76E3016E761FD3DEC';
wwv_flow_api.g_varchar2_table(37) := '002B60D59217DB4E75CC2A8F126F5F2BF9085E18CE1EB35FA8591ECFD6B3C552247B445FB35C395A8E94FBB004C1EF8AE05B9D477D7C85FE840A05520577F76EE7EEAE428FC678F87B2C12E5414846AE87C5F3B11893698B502959E8942294CA5BA848A0';
wwv_flow_api.g_varchar2_table(38) := 'D029CDA354A942ABDC4A152AB4AA58A855A950AA323996960BB53AE2D62BFA2BAD161AE24D3ABC4C2FA12375803F1910407EE8440108247F74A1AE08A61098C88C70B2C04C11B05037686442771A871E341E919484284AC62B94829EF40E5EA30CBC4199';
wwv_flow_api.g_varchar2_table(39) := 'E84B59E84FD9E84733F026E5E077F42E06523ECDC220B26130CD412CCDC6102AC4DB3417C3691E46D1428CA0F9B408A36931C65139C6D33224D17B6EF5430AADC334AAC43B548134AA463AADC774DA880CDAC0F5DC806CDA8A1CDA863CFA04B3E83314D0';
wwv_flow_api.g_varchar2_table(40) := '31D8E873CCA62F30878E631E9DC4123A8D6294D2DF514667B194FE4135CA2A7E8E9F5756F37F296BF805FE8DB2967FCBBFE3FF56D62915FC22BFC42FF3EF954AFE03BFA254F1ABBC9E3728EB950DCA467E8D5F57DEE737E46AF938BFA96CE28DCA66FE23';
wwv_flow_api.g_varchar2_table(41) := '6F52B6F05BCA15A586DF563EE077E41AF914BFCBEF092DD8CA7F52FEC09BF903659BB25DB92A94738752AF542B0DCA35E5BA72833FE43F2BB5FCD17F58AEAFEE2A8F2B00C39C3D9CCD37C39ED17C33A376E8BD77441318636C30DDA1091020A1DE400209';
wwv_flow_api.g_varchar2_table(42) := '0910428044EFBDDBA1F7DE7BEF4874708971929B242B8E932CC7298E134717F915EFF306FF893B83FF0AFE88BB82FFC6DDC19F704FF03FB837F85FDC17FC19F75715E50006F020021EC2C3C8F00856C7A318C46388781C6BE009F4F024723C85024F634D';
wwv_flow_api.g_varchar2_table(43) := '3C83679150E23954781EC350A38F17AAC940CD6A3AA0AA8D0A2C428317D1E225747819C3F10A46E0558CC46B1885D7311A6F60086F622DBC55D5F9DB5807EF544B0E6CA89616D88E75F12ED6C37B581FEF63037C800DF12136C247D8181F63137C824DB1';
wwv_flow_api.g_varchar2_table(44) := '029B612536C7A7D8029FE1737C812F0359F80A5F634B6C856FB035B6C1B7F839B6C52FB01DB6C70ED811BFC44EF81576C6AF3106DF6117FCC66BEA35F39A7B2DBC965E2BAFB5D7C66BEBB5F3DA7B1DBC8E5E27AFB317E375F1BA7ADDBCEE5E0F2FD6EBE9';
wwv_flow_api.g_varchar2_table(45) := 'F5F2DEE3FDF9C77C001FC807F1C17C081FCA87C958D9930FE723F8483E8A8FE6717C0C1FCBC7F1783E3EF08FC04F7C02483E9127F0443E8927F1649EC253791A4FE7193C9367F1ECFF2BA9759598EAF11C3E994FE1B93C8F4FE5D3783E2FE0D379212F12';
wwv_flow_api.g_varchar2_table(46) := 'D54550A0A8213CC18510350509299408135AF8C2082B9C08171122524489E8C05F023F047E842068D509C2A139D454F521040D033FAB18D5557557B1AA97EAADFAA8BE1008F60BF6571FA97EAABF3CA406A8816A901AAC86A8A16A98EAA83E51BF5075A1';
wwv_flow_api.g_varchar2_table(47) := '15B451C3D50835528D52A3559C1AA3C6AA712A5E8D57138249C19460D5E1A80495A826A92495AC5283D38205C142F540BD831DEA5B95AE325596CA56396A8ACA53D3547E70812A50856A869AA58AD56C55A2E6A8B96ABE2A53E56AA15AA496A8656AB95A';
wwv_flow_api.g_varchar2_table(48) := 'A956AB356A9DDAA036A92D6A9BDAA13E533BD56EB557ED5707FD467E63BF89DF1476C16EBF99DF9CE244B6C8119361A7DF02B6C276E8009F4217E80E3D61207C02F3A13D74844ED01962A02B74831E100BEF416F781FFAC007D0173E827ED01F3E860130';
wwv_flow_api.g_varchar2_table(49) := '1886C0501806BD6010E4C34C980D73611D4C83022884229801B3A0184AA014CAA01C16C04258044B60192C8795B00256C16A580F1B61136C8679B01696C21AD8E2B7144922558C1163C5383145A48B22315EE489445120E245AE9820A68A04912F5364B6';
wwv_flow_api.g_varchar2_table(50) := '4C9539324D4E96E9724A55917365A6CC935972AA481319224B4C172344B248119344A11829268A6922538C12A3451C1C81A3F01A0EC00BB805A7E10C9C858B7005DEC079380577E111EC81BDB00FF6C321380CC7E0389C8093700E2EC025B80C57E13ADC';
wwv_flow_api.g_varchar2_table(51) := '809B701BEEC07D78000FE1313C810AA884A7F00C9EC34B78C5884916C634732C8245B310ABC56AB306AC116BC29AB2E6AC256BCDDAB076AC03EBCC625817D68D75673D582CEBC97AB1F7D8FBAC0F8B6451EC03E6B3DEAC2DABCBEAB1FAAC316BC6FAB286';
wwv_flow_api.g_varchar2_table(52) := 'AC0EEBC8BACA52B902DEB20FE55CB952CE93ABE47CB95A96C935B25CAE950BE43AB950AE876BAC05DC639DE422B9412E961BE512B9492E959BE532B9452E975B65B1FA4EFD59FD557D2F4BE41C8AA7CF683CFD9226D04E38C80C4DA45D9440BB2991F6D0';
wwv_flow_api.g_varchar2_table(53) := '24DA4B49B48F92693FA5D0014AA583944687289D0E53061DA14C3A4A59748CB2E938E5D0099A4C27690A9DA25C3A4D797486A6D2599A46E7289FCE53015DA0E9544817A9882ED10CBA4C33E90ACDA2AB544CD768365DA71B544237690EDDA252BA4D73E9';
wwv_flow_api.g_varchar2_table(54) := '0ECDA3BB55F6BA4765749FCAE9012DA087B4901ED1227A4C8BE9092DA10A5A4A95B48C9ED2727A462BE839ADA417B48A5ED26A7A456BE835ADA537B48EDED27AFA9C36D017B491BEA44DF4156DA65FD116FA9AB6D23BDA46DFD076FA35EDA0DFD0A7F45B';
wwv_flow_api.g_varchar2_table(55) := '1DD0A099AEAE831A750DED69AE85AEA9494BAD745895F77C6DB4D54E87EB081DA9A374B40EE95ABA76A8305414CA0BE58666858A4333F5703D428FD4A3F4681DA7C7E8B17A9C8ED71375824ED4493A59A7E8549DAE3374A6CED2397AB2CED5797AAACED7';
wwv_flow_api.g_varchar2_table(56) := 'D375A12ED233F44C5DAC4BF41C5DAAE7E9F9BADC9FE04FF413FC447F929FE427FB297EAA9FE6A7FB197EA69FE567FB39064D0DE3196E44540D43461A65C28CF62787B5F073FD3CF7BBF0EE26D5A4B9BB26DDFDDE649899EEB299658A4D85A9344F6DB88D';
wwv_flow_api.g_varchar2_table(57) := 'B09D6C671B67C7D8325B6EB7D9EDF6B03DE2A453EE0F55AFF0477FAA7D6CBF77355CBC2B728BDC6177CF7DEBFE647C638C35CE849B081369A24CB409995AA6B6A963EA9A7AA6BE69601A9A4655EA6C52E5E07CBFC09F5EE5E0227F863FD39FE517FBB3FD';
wwv_flow_api.g_varchar2_table(58) := '127F8E5F6A66DBBF99A626D364996C7FA5C971F7DD03F79D2931734CA9996BE699F9A6CC949B67E6B979615E9A57E6B57963236D948DB6215BCBD6B6756C5D5BCFC6D82EB6ABED66BBDB1E36D6F6B4BDEC583BCEC6DB0576A1DD618FDA27B6C256DAA7F6';
wwv_flow_api.g_varchar2_table(59) := '997D6E7FB07F77612ECE69E739EE840B77112ED245B9681772E3DD0437D125B8C56E895BEA96B9E5EE8879EBAEB8A3EE96BBED1EBA47EEB17BE22A5CA5FB1FC5F5FD5E559585719C70166BC35A77DFB3CF3EFB4A6EE8841ED2680981544A804048E83574';
wwv_flow_api.g_varchar2_table(60) := '3BA8F4A6D2092584DE1119A902A1B7902230CE83A8741C1170C651062C0CBD8378E62F583FADE7F37DCF98B3E67620C2DC31E7CC5D732F10198872A698D2D0F0D05AA1B543EB84D60DADA7239DA9CE341DA5A3758C8ED58D746327DF59A89BE8A6CE74DD';
wwv_flow_api.g_varchar2_table(61) := '4CC7E978DDDCADEE2639339C99CE2C67B693EBCC71E63AF39CF94E9EDBCF9DED160412022D4C819EA967E9D93A57CFD173F53CFDBDBEECD6706BBAC96E7F7797BBDBDDE39E772F18C768E39AF16682C9330B4CBE19E8A6B8A96E8EFE415F7107B869FAAA';
wwv_flow_api.g_varchar2_table(62) := '1EAE4798FBE6817968CE9B0B81D840237DCD1DE80E32ACE7EB3CFDA3B7002EBA8FCD2033D13C328FDD56E66220D359E486BBB9C6984B6E6B77AFF1058B82C5C192E0C9E077C153C1D3C1F3C127C1A7C167C1E7C117C197C13F83AFC2BC400D2B1B668541';
wwv_flow_api.g_varchar2_table(63) := '58B9B0509DA05BE8963A5127E9649DA253759A6EA55BEB36BAAD4ED7ED747BDD4167E88EBA93CED49D7596CED65D7457DD4D77D73DFCDBFD3BCB1DF3EFF2EFF6EFF5EFF71FF41FF617FA8BFCC5FE528CC31B188F37B139FE8A09F81BB6C0DFB125FE8189';
wwv_flow_api.g_varchar2_table(64) := '780B93BC2D978CB73105EF602ADEC534BC87ADF03EB6C607D8061F625B7C84E9F818DBE1136C8F4FB1033EC30C7C8E1DF10576C2979889AFB0B32883592204B34559EC222CEC2A00BB8972D85D20F610027B8AF2D84B54C0DE82B08F60EC2B7CD84F48EC';
wwv_flow_api.g_varchar2_table(65) := '2FFC98236C1C20140E140E0E121A070B178708834345008789D7F0755111DF10A1F8A608E25B220CDF1695F01D5119DF155570B8A88A2344357C4F54C7F7450DFC40D4C491221C47895A385AD4C631A20E8E1575CB8C09395E666CC88932E343BEC471A2';
wwv_flow_api.g_varchar2_table(66) := '1E8E17F5718268801345044E120D71B288C40F45147E24A2458C88158D4463D14434B51BD811764DBB218C86BFC118F80CC6C24618079B603C6C8609B00526C2569804DB60327C0E1FC276F80876C0C7B013A640014C855D300D76C374D80333602FCC84';
wwv_flow_api.g_varchar2_table(67) := '7D300BF6C36C3800B97010E6C021980B87611E1C81F95008797014164011E443312C8412580C5FC01238064BE1382C8313B01CFE0E2BE04B5809FF80D57012D6C057B0164EC13AF81A3E816FCA4C0A3909EBE15BD80067E053386D47DA5176B41D63C7DA';
wwv_flow_api.g_varchar2_table(68) := '8DB82C230397678B0597E30A349BE6D11CCAA35C9A4F73690157E2AA5C85AB7365AE469B682B6DA1CF69336DE370AECBB5B93ED7E27A5C871BD04EDA43BB681F15D05EDA4DFB398193B825A7700B4EE6444EA5AFE85BFA9ACED0293A4DDFD059EEC09DB8';
wwv_flow_api.g_varchar2_table(69) := '2377E60CCEA44BF43DFD937EA0EFE83277E35EDC83FB7077EECD3DB92FFDC443F94D7E9DDFE661FC16BFC1EFD07FE937BA497FD00DFA9D7EA55BCC4C5C936B70438EE0B6DC86B3398B07F2001ECEEFB262EF1DF9357638C02E57A4A5B49296D36A5A46AB';
wwv_flow_api.g_varchar2_table(70) := '6805ADE1686ECCB1DC9463B80937E26674988AA8904AE80815D3512AE5F779348FE4B1FC018FE1513C8EEED243BA4F8FE91E3DA207F484FD2C39C83687B28FC368312DA285944F4B7CDD7C3D7D6D7D1D7C5D399EA3388E23B939EDA0ED74900ED0215F47';
wwv_flow_api.g_varchar2_table(71) := '5F86AF13B7E776DC8AD3389D5BD345BA40E7E99CAFB32FD397C5437830F7E77EDC85BBF220CEA1EBF40BFD4CFFA16BBE2EBE6C5F7B9EC0EFF1781EC113E92A5DA1DBF43FBAE36BE74B9775653D595F369011B2A18C9451325AC6C858D94836964DE40EB9';
wwv_flow_api.g_varchar2_table(72) := 'D31A299B5AA3ADB1D6781927E3AD3E565F6BB06C6EE55803AC2132C1CAB7165A935455554D555735544D5900092ADC1A6A0D934956964CB61EC93DD633EBB9F5C27A69FD69BD8232100265C10208F93794030401E5A1021030F840821F6C50E0800657A6';
wwv_flow_api.g_varchar2_table(73) := 'CA34D94AB6966D645B992EDBC9F6B283CC80B3D666D951769299B2B3CC92D9B28BEC2ABBD9E1762DBBB6AA62D7B5EB387D8385D6416BBDEC2192200262201262A1313485286806D1D004E2201EEAE32C91083DA017F484DE900303A02FF4817ED01FBA41';
wwv_flow_api.g_varchar2_table(74) := '9235193A4347D913D2646FBBAC1D6A07ED30BB925DD9AE6257B5ABD9D5ED1A729FCC81EE70AE5C05794416CAA3B24816CB12592ABF90C7EC8AF8B1688653702A4E1371221EA78BE6384324E04CD142B4C45C912C52EC66769C1D6F37B713EC16764B3B91';
wwv_flow_api.g_varchar2_table(75) := 'AA52B5908890A890F490F8900C354FCD57796A81CA570BD522B5582D514BD532B55CAD504755912A56256AA55AA556AB356A9D5AAF36A8CFD466B5456D55DBD40E55A00EA9C3EA882A54A56AA35AAB76AA83EA9827FB284FF212BD546FF32C3FA657E81D';
wwv_flow_api.g_varchar2_table(76) := '9EE727F42A5DE0195FAC97E8AD9EF0C7F54ABDD353BF482FD65B3CA76FB997DD9F3DAB6FBB57DCEBFA825B415FD78FF579B7BCFE453FD2975CD637F453AF047CFAA67EE6554084D7020DBC1668E8B5411DCFFF4CAF08D23DE5334CB889F384CF36F54DA2';
wwv_flow_api.g_varchar2_table(77) := '277C771369523DEDBB9A0893EC19BFD1537ED3FF6F7AC61F33A5E688D9630E981DE6B0D96DF67BA64707A20231CE626789B3D459E62C7756382B9D55CE6A678DB3D659E77CE2AC773E75367815D1C65431B15E195CF3FAE0AAD7073F7A1573D6FCE4F5C2';
wwv_flow_api.g_varchar2_table(78) := '15AF15FE65EE066A05CA065CF332E00FB40C24069202C98194406A202DF017AD551F1C5575C5CFDBCD269B4D22BBFBF63199BE3F78EB63336192904EB596D214D6EC0709919ACFF6BD80BA9B4D42A28201942F51B7520D2C20B4145A2B05CAA76D11EE26';
wwv_flow_api.g_varchar2_table(79) := '281BB01515ED97586BA765A6FD43DAF18F3A2376AC63873A43B6BF7BDFEEB2C9087FB5F77D9DF33BE79E7BCEB91FEF8494B01251A2CA22A5456955162B6DCA5DCA125416B72AA4789476A5C373D473CC73C2F382E7A4E7948779D29E31CFB8E7B4E745AB';
wwv_flow_api.g_varchar2_table(80) := 'A6F38EF8DEF0FDD9BBDCBBCAF70F45F5FD4771A1BE5BEDDDE0CD789FF11EF69DF39D47A537E1DDE93D827AEFAC7797F7A8F7A26CF7BEE7FDD8FBB65CE2BDECFD172A4087F76FDE4F5007CE462518402D18413518453DB85EEE9357A02ADC2027E495A80D';
wwv_flow_api.g_varchar2_table(81) := 'F7C85BE59DA810F7CA297917EAC4E3F201F930AAC5E7E583F211D48CAFCBE3F239F9847C413E2DBF8C9AF103F94FF27BA81C6DF255F91AEAC7904FF535A28A1CF1F5F986514B6EF63DEA7B0215E521DF2EDFB3C8FE19DF29DF38AACB4BBE0F9559BE2B8A';
wwv_flow_api.g_varchar2_table(82) := 'E69B5466289DCA37952EE55B4AB762283D8A4954B69F68723715B776BA9FD65012D7D3B48376D32BF457EAA3CDA09EA583748C7E4A8C5EA5DFD025FA1FB6C90D8E1554693F43A52413653FCB5E993C8627E3B8A508D90D4E2ED1AE235977F6A369D84793';
wwv_flow_api.g_varchar2_table(83) := 'BBB3EEC94CA9975CA26F95ED5DA09F48D7B29FD916723E7B07E76DA3A067881E1F97ED9F3C35797C5A0E3AA89796D232BA87621447FCFD3444C3C8CC03F420ADA095825B09D972BC07C1DD07AD04B4387D5DEB211AC1B39A1EA647682DAE11D06B721C97';
wwv_flow_api.g_varchar2_table(84) := 'AD12FC23B40ED77ADA401BE951DA448FE5DEEB04B209928D825F8FE7717A0233F36D7A5250F9AF856CA6EFD05398B551DA425B6FCA6D2D5029DA46DB31CFCFD0CE1BD23BA670BB707D97BE87F5F07DDA437BE9875817CFD1BE69E80F04FE23DA4F07B066';
wwv_flow_api.g_varchar2_table(85) := 'B86C0F900382E2D297E94D7A914ED2297A49E43281AC5919C9E76550E4700439D884083717796CE56F5D215B8F23761E5B2A17E97AE04F16F5589BCB23D7DC0C4DCB8A350FDCCA63D332B10B3158F4F5882C6E8F88FF3A5A9C959BA1F97CEC2BCACC7382';
wwv_flow_api.g_varchar2_table(86) := 'E3D474F446F45EFA3176E04FF0E659E5D421D0167540D0C5F8FE82EE41C11FA623741473715C50F9AF851C037D9C9EC7DEFE19FD9C4EE0BA4E1753D6F724BD20668E519AC6689C4E63265FA2339411F8CD649F878FE7F0B102324167E91C56C82FE93C4E';
wwv_flow_api.g_varchar2_table(87) := '9AD770E5915F007B25875E1098C5BF46AF83E75A16F726FD0A27D46FE977F416FD9EDE00F7B678FF1ADC3BF42EFD912E4955A0FE401FE07D8DDE71BC4FB7D09D448EB3C8F33EBA17D7FFB139BE400A1DCC5ECDAECB5EB5B7D0A0D42DBD85BC1E4256B64B';
wwv_flow_api.g_varchar2_table(88) := '12CE8D42936691ABE4EFE4A3D3D97FDB97E15B7BED2F8EA1C943D97F067B9F7EEAE135AB578D3CB472C5830FDC3F3CB47C70A0BFEFBE7BEF59B6B4D7347ABABB3A3BDAEFFEC692BBDA16B7B62C8A46C2A1E63B830B177CBDE96BF3BF3AEF2B777CB9716E';
wwv_flow_api.g_varchar2_table(89) := '437D6D4D60B67EEBAC6A9FC73DA3AAC255EE2C2B7594D86D12D547F4684C6335315652A3B7B434705E8F0388170131A6018A4ED5615A4CA869533583D01C9CA619B43483054DC9AD35515343BD16D1357631AC6B19A9B7C300BD23AC9B1ABB22E825822E';
wwv_flow_api.g_varchar2_table(90) := 'A9114C1518BF1F3DB448F5505863524C8BB0E8DAA154241686BD74852BA487065C0DF594765580AC00C56AF591B454BB401284AD36323F6D2367151F96D90391783F6BEF302261D5EF37054621618B95865899B0A50D739F699B96AE3F9FDA9E71535FAC';
wwv_flow_api.g_varchar2_table(91) := 'AEB25FEF8F2F33983D8E4E297B24951A659E3A36470FB3391BDFAF46C803AC5E0F47589D0E636D9D850124E608B8752DF529C179FDCA875391780E290DB83F254EF2100B69823C4F137C838788CFEFE7BE6CCB04A90F0C4B761816AF519F3A46C1C63A93';
wwv_flow_api.g_varchar2_table(92) := 'D9625C723E2F517AB824999714BAC7743F9FAA482C77AF1DAA66C93EADA11ED917770037E41AB3D7C4FA1243FC1B1F48E9E1B095B76E8305C32082F15CAC91F4171BA11F8F2188619E860E8335EA23CCA7375B0A00343E07C35D86E892EBC67C2146B144';
wwv_flow_api.g_varchar2_table(93) := 'AE176B8C84B95F5A24150B5B0E725B7A873141B7652FA76FD7D4F1DBE87632B91F6C66089352134919FD836C564CEDC7FA1CD40CD5CF8226D267EAC680C9674977B33997319C5F8C287A21B669DA79651E7959C0A91936D56EF2D902A045F1D29B9B2070';
wwv_flow_api.g_varchar2_table(94) := '63BA04CB67B4B949332495F26A1825A7C1A92976C0D803A1162EB2F3AEA116D56FFAAD761397D49C4F8E007316D9720328F8648D7343D72C6DEED01C2D32102E72708A5147CEC19CB5CFF7D3C673911B183D9C7C3A5BF2227B003B17980D6604C467B15A';
wwv_flow_api.g_varchar2_table(95) := '63D4AE19FA806EEA5843C17683C7C6732DE6B7AD4B6FEBE835C46CE75649F714CE92CFB338467E88F38C2D843518AD53F3D32AF845822FB02DD3C4AD79B1CEFD4AA5FAD3640FF0A5ACA625413842DB4C76779DA9B3BE3ADDCFFD6CA84F3BA9D2DF1D0B61';
wwv_flow_api.g_varchar2_table(96) := 'AF4671DCE9D1B8AEB9B5682A9EC926FB52E960303512890DCDC7BE48E9ADFD29BDCB685285F39DC663EA463EB697DAA4B6EE6698B251735A97B674A483D296AE5E63C24DA46DE936C66C922D146B36D3B321332634A2A0406D1CE5206734CE704B9D609C';
wwv_flow_api.g_varchar2_table(97) := '425F9D08122585B44400824F64241298338F4994C8D82CCC6D0D5423060A920D92124B12CC6B9700735A58D2D2AECD693B217173C959C28F8484D06A69E2090EBA1C4167B03C5869ABB221A51C1A037216BAE5128D574A55929A86CD4E0167A464BA3CA8';
wwv_flow_api.g_varchar2_table(98) := '4E084B9D39CD243439962C60F09CAB1519C27856E03DD723E8E935C62B09F6C51B1ACDBC6115560F610DE17F12D1FAF9FADB640EA562263F3D6826D62A6E8949FA0262367D013C2EAD642E7DA09955E8CD1C5FC8F185165ECAF132AC7C69A684C9E6876E';
wwv_flow_api.g_varchar2_table(99) := '2AA6E320C68E314895ACBD66E726B54C36DB6DF82FAA574C3FF6D2323CBD062BAFC3CFCD11580CBD45FC89015EC4928938F7837A0CDEB72CD09A30B12FF306A1D2CACA61A13C67011A51D187EF37744A60ADC5754102C6D191349959C70735864DB15FDD';
wwv_flow_api.g_varchar2_table(100) := '8C5AF4F9ACB4C6B2E9A8E103359A29AFFE2571F860AFBB02A3FC530EDFA8CBB010152C0633AD249555C2F3840E5122A6596BA40B7BD9FA59B8540B19C0995F5233201E979A13120FCB1EA8A872B1F2B930889BD31573F999E3089499A6E5BCE046730A18';
wwv_flow_api.g_varchar2_table(101) := 'DBCD2AE0514D512A731D901D885AB92FB847E12A577D959BE9C850A7BE1E4727775A582A839855055AE3F8BB59FD2B80E8F3F29D9DFC10ACC8D9B860A1653CF24AE41D4742267B5CDFE02F6A383BF8DF8FAF3F5227B051C94C4D07D8D2BA867AE77FE92C';
wwv_flow_api.g_varchar2_table(102) := 'BBD8B6AD2B8EF39294485194444A944453964C8A96649BB1645BFE88E2C45212DB859338F147E23A89D5D9719C74A9BAA4C8B2364B9116DB9A0701C63A20E8BEB0876143B116C5227FC55ABBA6D99097614086154681756B8660C0B087BA4887620F496C';
wwv_flow_api.g_varchar2_table(103) := 'EF5C8AB29DAD0D4CDECBAB7B4FEEFD9DFF39E7FEEFA8CB1C2E1659D7972FA8F0625D9BAD3948C6A6715580160BCED49BDA874BA57E608E3C6C982D32DBE2011D2A0819C30F5C7428081F4D3D7D1CCF822D0F99B9EC2B27A16D937099368D1785EEEA17B2';
wwv_flow_api.g_varchar2_table(104) := 'BE2ACE2C96CE3EF9F9ECE6673F7EE032184B56EE1070149C6B412BE742A50228B33A057B442DAA82BE4BC72F73F153F89904276D8605C81F548783E6D56975FC14881D0CF64F16FB8BF88A3A3D6561B3FEA7D2378C274C425C20100F18C2C729BD3AA44E';
wwv_flow_api.g_varchar2_table(105) := '1E5727E16A8A86C7352D04D108AD7A06EEA9FA142E054395F30C9D30AF2A53452C71026E2AC74325060AD399A9195D830A52C219A8421FEF91B6C28608158B7AB164C66D3F4C06F37108BB01DCC0DF05439F9AC157E833F8063D63AEED87ED9A74B0B550';
wwv_flow_api.g_varchar2_table(106) := '9F0EB13C03C3264B0007A9EF147E4D17F1053D3F690009B1E82DAA9922A4E03C540F3A3E3D3609A50A5724D574F55408BE00C200FE3A0E862A131D313CB112027837CF1B737926B63562FE9D372A9359D32AEC6C64BC34549D62C613EEBC6094C8E04EF8';
wwv_flow_api.g_varchar2_table(107) := '111F1E8D9C18AFE6290AFF3C007873A0AA105EAD96C8A3E3967BCCF5037869A8EAB0CA3218316B88155F9BD5A65A872642C0F42BC7091B41AC5FA43EB4B9098A60880C31481C267E587ACD18FF2D1482112240EC424B4BFEDE5EB699B985F643BD50D151';
wwv_flow_api.g_varchar2_table(108) := 'A86408EDCF7968D2B5AC28597DB9C33E4B890365D4BC9865664992C8AEDD5BBB9B5ABBB7EACDA45651EA93FBF7EE0B9FDF1533A9F4FD95FBAD2DA19CA4B8960BB0B4435F2E7450F6D9022566F1FA9CA390CD91CC6C018CC85943B96BDC4D19770D3063B4';
wwv_flow_api.g_varchar2_table(109) := 'B41E47A2269A8FE4261946B2EBD124D9918877A6D36D3D64477B5C8FBA4973ACBDB3AB874AB745484AAA8EF490F81B511F3E3E411D59B39357F5EC58DA16513C92CB6E236B656FF3EE98307A32B63B196628C64ED958A6A16B5FF460A12FFA312386FD81';
wwv_flow_api.g_varchar2_table(110) := 'B09765BDE1803F2C326B7FB5B91FFEDBE67EB49F2E3CBA4ED9BB27B2F5D48F3896A4EDF67244AE69EAD606C63C3E8176FA0431C0325E916FE89D58BBE6AFC5366AFDFE8AADB541C0A96F3CA4AFDA24224AC489BF61EEBF21EA37FEB5C80BE8905EB63AF1';
wwv_flow_api.g_varchar2_table(111) := 'F2C6834527749CD50E079D9C827B3101BF5DE69B37DFB90614C33FEF70A2C17A3D1EFB8277F27234AC732E14A079821778F286FE81FE279DD2799DF78647BCC76CC7886C36EBCD6452A97C5E0C6644E88A6961B54D4CB7B620236F98FF08C308E5226092';
wwv_flow_api.g_varchar2_table(112) := '8F7D51D86E73BB1DB96A68D38C0156C079B140C06E7A2C4169949BD2A3F1786717AAB829C8E894465F629110ABAB8BF91CF4F9B57F9EA3389F5E1B8E79108BE669574D22A236296EFA0AFA3BFAFD9E40C84D530CEF40DDEB7F70B81CB4CD1D0AD0F34E37';
wwv_flow_api.g_varchar2_table(113) := '4B51ACC739BB76052E6D531B0F68DE16014D9B7A5EA825BA0D20BA20A041681F2C78CCF6D30597D97E06F7AB41F377C066DC22D3849B90518AD08838DA31EF1BA5DF434D4407D18292738E3110F8CA2A7E50EABE8946F8E80EC87A4E93CB28B550D07CF1';
wwv_flow_api.g_varchar2_table(114) := '32DAB158F08D76D065D4B450E870B4945172BE002B41D5770CFC602492DBBE4D9D76BFA556AC63BF1421B1AC311E9A276DAC94FBDA9581AB7FFCFEE0E81B7F7E65E7B913FD21D646D1AC9375B71D79E1C8D8ECE9AE8EE9D74F0E5E1C6EF7309C9D5A1664';
wwv_flow_api.g_varchar2_table(115) := 'AF5B6A4C848EFEF2F39FFDFCF18D09BFDA1472FB14AF54EB73245289BE6BBF7BF9CAFBAFEC8DA7E276314200AF931B9FD12FD954224B7C8279E5C2B5B51E59065AB2E0C12FE024733CEE0121B94C8A3917F14102A9895C623241253C165B8FC5D663B1F5';
wwv_flow_api.g_varchar2_table(116) := '586C3D165B4F996C5B4CB5A37660C52D46A39954CF7B88833CC4A1C6F9CCA804E4E65240D8E42B561248BE4279259FBF53E9C130E61DC5366E16B0115B0F74170AB60C57468D8B85CC680A5B9A2FA44CE418B858CD22FF47B9B34BD4A271D30B1AE0F68B';
wwv_flow_api.g_varchar2_table(117) := '929BDEE6179A7E89667986DFF9CC774F3CF7F6B7B27DDF7E6B66F7958EF51551A41DA0C19F3A035ECEBB6BE2D4E9D6373EFDC558FEADD5D70F7C67A64FE1E8677C611F1B4FC60F176F9D7FF9F6F77AC36174395AEF0B892C2BD47AD77D4A3C1C95F9FC3B';
wwv_flow_api.g_varchar2_table(118) := '0FAEFFE461694AD11B9528F6C43B1B0FD138E4043F31853DB19C0D1E09DE0852844598B0089BADCB6CFF8309131661E25D5224B88DDBCB7E34C809236670A3945121D7DA920F2D988310A9150D5632A468A5483F1A6725AD468E4AACC3AF056B348955E0';
wwv_flow_api.g_varchar2_table(119) := 'F4361BC3B3F4C7D55E65977603EAC66EE223532FC264CF851ED2D5D2124CA5B8A42C2BD676156BBB8AB55DC5DAAE626D57C1528AD4B7F23C87D5C661B571586D1C561B27C3140E9F88D8B89DABC1C7ABEF1C76CA41574A6E4DDAEB1A86EB8E551358D60B';
wwv_flow_api.g_varchar2_table(120) := '39270D675DB10E0B9947D8EC89993DA9741A67B43C14A02FB5216F1979028D8E70C282D48574718B17AE3B90BB501A6731139DDD60A5BA9AA0E663C9F534E5F487257F447292EB4F2156526B64D5C7EC083DABB6D4CB0EF4A20D5D732A75F19AE73D211F';
wwv_flow_api.g_varchar2_table(121) := 'BF45F8ECA3EB0CC75034C43014971F6F8EBFD954CF2B0DA1C74F536F469A6A9C0E5FD80FD5037C403BC1079D442FF1BEE985889014BB58C0D485397609BC0B1DEAC25CBB30C8AE32995E6ECCC1676356C4FE809E68F947B4FC235AFE112DFF88E09FF9DA';
wwv_flow_api.g_varchar2_table(122) := 'A45046ECCD0B3994CB05F7949173491B0E5AD87195CFAF66AAB9B0AD4A1FB23F04E97C3287972E1560A18657DE2C584B316DB3B467B6C14E50494A7F92B2D6160846289C1C990815F40502A83D9E88C761164E90B4D32ED547144D72D22FFA9B7B8E765F';
wwv_flow_api.g_varchar2_table(123) := '74F8B41A2CDBC620F2B5EE550E5E3C9CD0F74D64D4F6E606E99B6E767DAD77A8269BFEC1AF7AA7F7D5017896A61D028F5ADB9FCEEA6B7FD904FEEB449D8D72ED1C3BBF7FEFD923BB24B7B1FB70EBFA3FEAC3D46B87BE1E64ECEB87B4EE218882B73756E9';
wwv_flow_api.g_varchar2_table(124) := 'CB10AB06B154C99A93CD48C5BC55CC5FC53A56B18E558C1F6EA3424E2472109844CE875F22BC0256A0042C47042C47042C47042C4704DE25051CD70B38AECB100D0E30C1C547849110E4BC399B993471A45BFC570C635BD02FE189363C73BE60AB24C5EC';
wwv_flow_api.g_varchar2_table(125) := 'B66CB815FFA25579B646E8CB7DAF962F3D57BADA0B3256E4A88FDD317A69E0E0A561C3CC149ACF81FE4B78B5C636759EE173B1737CB7E3135F0E4E7C89133BF1EDE4E25C9C8BED2426891D9B900672011C02344C65A74D4218B49475106855B44D6BB56E';
wwv_flow_api.g_varchar2_table(126) := '53B44E425347F763AB1430C48C49E307BD4DAAC48FAD121543FCA90A4148DD7E6C741AB0F7FBCEE7100255A3F87CF639E77BEDF3BCCFFBBCCF7BF3F0A5E3BDF1572E1E61BD2504FFF7AF1D6F80F19C581C676D6BB2019CDDF5E81E9B60FF4A35C3ECF66F';
wwv_flow_api.g_varchar2_table(127) := '8C99DBD8EBEA157B59ADDA16D5C10347116A510458D4640447132DD2FF491A28BFDF48D13A0AE14A75208CE0D60E848D9EAC5A792DA03D1D454695AC28B77D48454D51A6F34A94A6A0E744233D8122ED481AAF55D3D5D58AAAD548A6FB862EA7A044804E';
wwv_flow_api.g_varchar2_table(128) := 'E6316A13F9F9A97CA9B75F0D4EE563A22C234D40E829500FBDD646476D1F4A285E350E6895A86AB042103352B52A4532BAEE1B128A6B1751F38190BBA7F27207CA63B2232BE4F3B5B4943D3600CD2D51B92991330A8C3D27B7292BEA526CC254E9D8E432';
wwv_flow_api.g_varchar2_table(129) := '74BE3D32B030128E1FFAFD0BC7AC8D5B62DD7BD28D3A954EADE01CBD63FBA37BDEDCE67BEFA7A9E77B5D935B7B66BBED3A5D59994EB723D15FDBBFBF273B97A9ED8F6E6D715479AB5426C128546DF256F1A1EDAF6DBB6A0B27EAFB477B53C0EA1D902337';
wwv_flow_api.g_varchar2_table(130) := 'FB29189E4F5086962BA1B75C21BDE716E939B70B488CFD84BC7E425E3F69F77E92105857D1067F91D126F5A28136085FB9921AFDA0ABA64833053EC3DE6D84D805B57EB03154A4CB96D539E4AE82F7F061ADF55F45E8A3C941E712BE92E4003C8AB022F1';
wwv_flow_api.g_varchar2_table(131) := '9946F6AE84825C4041D4280A58AD9C6CB570EB7FB6D92A935D40D97AABC5BA192527740D4D887B7E39D3D233BF34191C49B5D8D5658C596FF4776DEF38F2234F32DF151B4B047548A77F5B2E94EB85DA2A73F2D5F33F78FD2F473B4D9BAAED06DE6EF6BB';
wwv_flow_api.g_varchar2_table(132) := '3C759E950FC64F4E046B825E155F05CC9F0654DF55BE084E3F46FD1933DF95E8A4B58E18E27B0CA944CC644207C03186E81FBB4C7F43519428632E12A84502B5486A4024508B454693D4F09E7E6DCCEF50188097CA73F60C148FE2BC21A7CC8254238EDB';
wwv_flow_api.g_varchar2_table(133) := '62899252FF8D08760CB7444D69A31DED2C48F68C01ED2D48783388352232EC5EDF19D7F317547A4D31589F6FBD896D63DFE5CA2B2BD0FC33B0B473DF4FC6EB9AF6BEBD7BF86492AB70D905B7597DB6EF87A9C4449B60898EF578BA93FD7E011443A100C5';
wwv_flow_api.g_varchar2_table(134) := '38921BCB9D5CDE7BE8F2A981CD7D8C96D32321D1730F368F8E77ED3D964C2DCE749B037D8D806E1ED05D025D0952516A15A31B105B13ADB3AD2CEF06F4783740C6F39E10687D2E84D00D21D84358618033DF5C4805DF0B326834B8804683A882505D4118';
wwv_flow_api.g_varchar2_table(135) := '8D3F6BF12A4B8C02E1EDF1843E3EAE784BC15C51D0D714B4425129DEF065ECABD38639036350AF56623AE789BACC1F2CC94AD33F8232B5912660814E562B421F4B87710C9F7843F2650CF6558932980C8C913554AA57A54A99D3484AB0A6E4653B5BE6F5';
wwv_flow_api.g_varchar2_table(136) := 'AC63B0E5499E33167F2BCE05C72EF98507E79CFD7323C9E7D3A28ED396B10CCB695BC7E693B3EF1FECE89A3FB3EFC02FA6C367D9578E74EF8A57330CE3F70CBD3C16B16CB27006C1ACE78D3AAD60E7E3478B470F5D3AB139B5F0EB097EF19D4876A68DA2';
wwv_flow_api.g_varchar2_table(137) := '58AAE5E1CFD9D3EC27549CDA42EDA6AD187F8B393C80B83CA002F806DC269ECE0E34278A8FEE23381384C5B0DEBA882E25B861789BD41BCD7476D8A13036B0CD1C873007CA3B50BBD3C39B7033E77070CD610512A2641429D004FA8A09B709B64D046A93';
wwv_flow_api.g_varchar2_table(138) := '5A586B8D0D1CDB9EF942377ADB62996E67EF740D06DCBDD7DB333BAFBB872959EA13F270F139AA08E899CD9F2191B1C1E02A423ECAE1A4E9B320FC074B07243E7E1C5797F942D2592CA3B72514BC8BBD23A1F0EDBDD7A5F68C7BE77509BEC22EAB7E4296';
wwv_flow_api.g_varchar2_table(139) := '7CD347A87048AEBC56AB3CE7F9FC65203D561BF136A59CB5415B88B6E2A35C54607FC0F0ACB58138C383FDF11B58F2893DCD1B4F782B9BF2C7B7B4ED73986D3DAD77FBE69E8B44BF7F76FEC5A5BD2193A7D1DD2836D5BA6AA2BB4E64EB075CB4A9BCFCE1';
wwv_flow_api.g_varchar2_table(140) := 'C3997CC380689BD9D93828DA46778FDC71D7DBD5A70E0FCDC41DEC21AFAB665CDCF2F268A8CA6A8E38BD1146C378BA273BE373DB1B6B9393514FBCBD5910B2A1EE695F6DBE3777745B58ADF23CFCE7AEEFB9DBD37593FB5D6D830FA63A128C4A08D7D759';
wwv_flow_api.g_varchar2_table(141) := '7AFAAA1AE268A6597AF45FF68C729E6AA27E83B8514844E9004F840BD6AF7145F1C4F1F0C401F145FA7ED2E6D42269D4A26AD5A2BAD5E292D5A26B1A2A89061F70C4E031CB56C2999A7E218BA50EDB525A24638FDCBEB1CE9D0F08617473522DADDD8E7D';
wwv_flow_api.g_varchar2_table(142) := '3FE4EBC979083707AEFC6983D4DA2A8BDC1995D98DE44B658FA41BE2C752F0119B7C8E974F0FBC95DEF16AD623A8B4E031E1C0187353A99A89ED0F7E5C3AA36CC7FE130E0FBE1C4A77EF3FBD0739A4D761FE1B518A30FF79A8F7E509D03BEC9DF5B256E2';
wwv_flow_api.g_varchar2_table(143) := '769E70863C5E6F6D7090B263BCCCCC5395944546D3427659C8554B09760B407951E34AC24E57918E1704531A63F8F9BD20512BD229B04E2D0BE8A60B927C1740F751F09973248F1A2CE23290988E6FC4860F757604D16B0D1DF6142763C1D10D1D81FA18';
wwv_flow_api.g_varchar2_table(144) := 'BC64DED071E08D851A9191B00DDB666D2C4518429167A2C83351A567A2E0990A1A533F7E10F21438FDF8943D9178E66F7EFA770A4FA74AFE55CA6BD06BB6D24EAC740EB309F118B1D367D2EAE8ACDF8E8E73CFD1FDEB38BD4676942B9EE48A27060973DD';
wwv_flow_api.g_varchar2_table(145) := 'E9B4C25BA7B3498328AF4194D7A0A01A4C790D74A995AD6866D81AF793B0EB7CD6D71B7C1806C87F99BE0F4567024F3494A941BCD7F764E2FDE1F67438BB562A30A921512CF9821899E0CA63A47C70E550E88D637908154F411ACAF4E06806E9C970F652';
wwv_flow_api.g_varchar2_table(146) := '3C10C0EF28A76FAB2F8B5C5FB6388B3F2AAFC965C6AB2A42A9486C61B30A5263F3F09C35D417891D5AABBA3273A5CD5A65E2B23F4BB74FA61A4CE191A1819AF1C369D7E3FAF3C636D4DFD367D8532AAD9A65D55AD591EDC39BC49EBAC6548087C2CC9634';
wwv_flow_api.g_varchar2_table(147) := '0CB2DE441571D68D72D6D181C8D9C6CC1215DBC800C8B4C3A9455E4F5635D4C16491C3FA06D75788B061A5D2843301A1265D4A17EA5D6BCA46A4AD9421C7B22C6E5A69DD1EBBBCE9BBF2F124FCDF2E6F6B40FF2AF71DF2F6049800E2345237345BDC0414';
wwv_flow_api.g_varchar2_table(148) := '79CA4F7D8A71AC4CD4D37566BABE9CF6E9699F8EF6A9681F470758BA9EA19DC4F43A09A84EE2CA9CC4953909A84E64C69CA286D654D8E1F60A046905F27D1566B8AB02E15AF1274643518FAEAC18A9DC1CA45328D2F43963C60B53C4B23247C9159027B0';
wwv_flow_api.g_varchar2_table(149) := '96060F80B5F4E75836A22D05C99851A24DE724654EEEF4B8B53F6EE1083E8E0C73250BCCDEEC58F8E3C1D9DFBDD41A5BF8C302AC6D1F38E20786D32FA43C8EC481E1C1032937FDE54B97DE18EA7DAD7010D60CACC7D28B7B63D1DD8BB9CCE29E58746A11';
wwv_flow_api.g_varchar2_table(150) := 'A1B7F4F01DF6EF805E80EAA696117A1740DE3CAD1AC2B5FF335EFE41515D571C3FEFDDF7637759D87DC0B2C00A2CB0B02C882208A8A5B02828888AA2F8FBB74627CE6A4D1C956AFC91F82B3ADA491C5B8BD52AE974D224A8D5D8D4499D69D2B1BFD5FE53';
wwv_flow_api.g_varchar2_table(151) := '6D3BA9334D3A355A616C67625A7FC0F67BEF7B8BB8D8893BF39973EFD97BEF7BEFDC73CF39D761F99A2316071D967D1C22957A4AB8494AB8494AD2F9DF25DC3025DC7676F238AA2A7315B50CD5FF0785937DCDEED6B1685AA6A9AB330BA53F0ECAA7E6C5';
wwv_flow_api.g_varchar2_table(152) := 'E1A7E6B4423E0F49D59CA9F2A90306AAAB1B28804C2B059FE176E6718FD94D37D2CCF2E67AC58AC38B8B1AEAC38141FE97EAF125EBA1295367942E3F30A7E88CA76276D85F8B6B43C39609B5F3AA33A53B9B2EED9AE4CE1B9DDF5F1B8BDACA1DB8216370';
wwv_flow_api.g_varchar2_table(153) := 'C86F16D7863C53769FDDD8F8EACA9A94D08451FDC766CEAD59F98A79C2E5B761DD0ADA2BAA94F59552A1CB32A9CBB2A42B665A97657317376D32859188890767E236A64C58BC206C2F995CE8F2F89B3DFCE48A302B8DE477D927F5C8B91231D011793232';
wwv_flow_api.g_varchar2_table(154) := 'DD8AA0830C669AE4FF184D93DF9635BBCDE6CD0A7832CA2AC7E5C79FD482FA7163B3127303594E85496C795AB661B7DB6DA923A654F7FD78E859DD55D51074319BC3614FF2C12633A2BDF235D8A459728BD3EA1CD952D7D2DAB2A3E56C8B5A6F99A0DEB2';
wwv_flow_api.g_varchar2_table(155) := '51BD754A213FE28549BD1512854CE052FA6B3827501E2877FA78E4F3F1A0E7E381D0C7A3A88F9F5ADF87D297FC98861DE890330CBD9397FF8558AFCE79D6293B47DCAC76DC35A61B4B8DF506AB36AA8DB49A4FEA7D6A6872DA6DD35961BD5E632C6AF945';
wwv_flow_api.g_varchar2_table(156) := 'EE5EB738D425564A439107F5A06A265C503DE266C470DC8D90E136FC064B32570CD57C12116BAA69B7636E8CB92562597E031BB43B4AECD07387AD1C3D42B3FA9A67D0EE211068F2B58AC5AF4D2B9BD35896E650B4043DA1A46EF698E286725F303CBD7D';
wwv_flow_api.g_varchar2_table(157) := '4638186ADBDA16681A17F2E88C31DDA1D9F3AA9A471687439EA2705BFBCC70504A6A8CC04BBC19A9819C944CB7EEF3FB92F3AB0A0A4717E5E495D4CEAEA95CD63CDC99EC713B5D696E23C3ADA765A4A5E4970D0B5616F9F38A6B66F13A3C377A4F5EAB9C';
wwv_flow_api.g_varchar2_table(158) := 'A671B45F7878888CFC526BD74AADDD2CB576B3D48ABDA596E7977247777A134B7BF39BB2127BBD4DA32E4ACA39DD0C9D57B96B5798962DBF7AB99CDF97B0746F0463BD616F626FC4DBA4F309E723BA153633DD5763494931FD5A148CB05DC5C0EDD563DE';
wwv_flow_api.g_varchar2_table(159) := '69716F32CCFB0EEFCB6B6D6E7F688477E2CA70D67657B26A4BB46D8B156C9FDB9C7625D9F579F5246F6058AA4DB5ABCA82AC3C77925D2B68D9304D4EF20752320DFD868E518ADD8986919912F0F73B162DB13BEC6A523A6C740419EA38BB3490E77390DD';
wwv_flow_api.g_varchar2_table(160) := '1382DC5F83DC5F83365E6F898A2CE816A597F4E003F3E4E75816CCB12C08F95F112B78839B3027163C72AC13815AFA41D89E52DA1C4C50339A5152A9EF274D15795EB871AC747DE2C0226884EDD684243EE342444C41D8103EFA54695BA96971B7179190';
wwv_flow_api.g_varchar2_table(161) := 'AAAA0714ECB89E9CE5F16619DAD4EF8884AEA7FAD3113D6CDE914D65B55B1BF5D41C049364FB409EDFDC3EAD66F5FEE5725E2C60F47DD1BA6442C1DC7679634CC33DAD986D9436A81DE4231FB7E2F904EF24AABB0AB7783F218C667A5DE655EB08E97A12';
wwv_flow_api.g_varchar2_table(162) := 'E32F599D12DB76698396E435F6AB8929192986D721297B12D2039919016F825A985331B234FD9AEEC419C1264A293B32FDC99A96ECE7CF24D2C6B4D5CC2A6D5CE2AAB94F19780FFC7E76F7952B5CDEF85520F4E861DF4E7B8FAD0A5D3BB2299F0134EA27';
wwv_flow_api.g_varchar2_table(163) := 'E9B2E3D4A3870F4FD97B8476D02F73AB92F4A427FD8148E9A2FCE745F345AF7094F9D4AD34D0B267D283FF7AE8A812251F87DDA66ED068C989162BC012F0AAA5EF66A7A95B75D2827894C7580FA861F2CB0A75CB4A74326411E458300A4C07AD602BF4D9';
wwv_flow_api.g_varchar2_table(164) := '20A81CC6B843A4CB87A2EF2845980FD822C1AB6CB9D55E4FC394C5D4ADFD096B173F031D4CA1155F49AB89768F56287978165097A33D176D93995CE2FB26597840FA40FF16B906A3E6D1BBCF8B7280F2F46CFA7A3C4A90CAB056F6107E4E5FB3C814F20B';
wwv_flow_api.g_varchar2_table(165) := '723F2FEAC2E8671C45A12EF67B5AFB2C9417A80BAC5136533987EDC4D89D781753FA2D868310186FE9BBD874CC7B8D2243E880BE830E2A27282CF55097D4139D0B9901D90482A01DB48197A03740BAE2A32EB916E5656DF420FB2DD606F2DF04FBE45B56';
wwv_flow_api.g_varchar2_table(166) := 'FB5F78B7EBD4A56958FFCD013A418768AF02EFD2AAAFE44313ACB38AFD12CF02CA39B47BD1366914B2959A4DA2F7C19703FD79348CCD8BF69B12FE78884E82E3963C0A365AED21B03ECAD56AA93A1E7685AAD82EEC593C2F5283854DC8EBB4308EEC67E8';
wwv_flow_api.g_varchar2_table(167) := '04DA4813653475E2FCCCB79806E6C4FAFA3768BE7613482618BB543908D680D1B48C3DA245CF83FC121568C7A8C0769D0A94F7D0FE9ED5AE89A3350E4BAF6D8A637F1C96FEA9F1763C63C2A0B5773DF94FE9355153A8402FA20276992AE311DF3A944E65';
wwv_flow_api.g_varchar2_table(168) := '74F4B43221FA40BA417BA41BD175902EC8F9C00F5E0673C16AE80DD0C93EA23D4A36BD2EFD337ADD6205FB01F4167C0C28968709D9223DA261721F756A2BF9B39E629A906F454F083906FBF134AD43743526DA15B177B17596CABFA34E93E803C8752C97';
wwv_flow_api.g_varchar2_table(169) := '6698C06F73A37DB1BE7AC6046B754AFFC6F833942B5F065C5EA242E516E52A1B9F0FD83A576F817FFFE5F9C07B1E01DFB2E45E3015ECB7DA4706C34E509E7A912AE3619B11934E52DE104234CF4217720CBDCC96D14AD6015FEDA606F91F1491A709D924';
wwv_flow_api.g_varchar2_table(170) := '5FA449D2C714908F628FEE50445A41CBA4B5D13FA31F9116239ECDC6D85B8246310F73704188C865345EFA3BE5F339F21ECA61F768B8BC1D396E2FE5C8D5345E46B92B6F044778D6EE4329F0F8B63C7BA80EEF476C0910BAC727C1EA38DD09F0A21445FF';
wwv_flow_api.g_varchar2_table(171) := '18780BFC48E85F004B5900EBDD876E22582DF4A7C0761644BF19AC1958631B73A2EF0286D0758377E43731FFBBE094D0DD019FC9A831E45F809F60ECC7E053D41CA2FA78DC064649D75087DC00D74CF02D5339F8B6DD905BE41D426E92FE43BBE551B17A';
wwv_flow_api.g_varchar2_table(172) := '25BA9FD7206C26F2EB6E1A67D610FDBFE639CDAC17FABFCF73B3592FF49F476DD026EA806F532096EF61E399660E8FA68939C8DBEC3DD426661E46BEEC5FC7A5968267229F6A446FA8D369B13ABDFF412C27F25C283F1239267F209721B65A79AB4BB940';
wwv_flow_api.g_varchar2_table(173) := 'ABCCBC856FEB89CE12F9E85332627987EDA3C503B9A4C3CC1F6C01B5887C302876ABB0148FEBEA5CDAC7F38BE0006A2D4E18E7B41CFE7818B9AF0CE37E081F05F26F1003A6E03F4E3DE251076972391D91CBA33D600B7089B87201DFB70AF2287C5DA6A9';
wwv_flow_api.g_varchar2_table(174) := '8CE1ECC46242848A9464DA84F9F3B0FF0B590631A59DDEB0D806FE477AB90767519D71F8DD3DBBDF175206B5244040A9A620372B18216500256AB826682086700926720908C2947073686B51D11A10A65C159C08416B2B06945A848E5A2E651C2ED53A2A';
wwv_flow_api.g_varchar2_table(175) := 'B5969952C11154C05B1D4543B6CF7B76F7E333E28C33FEF1CCD93DBB7BAEEF9EF7F76BE3E74B99DF5FCA98F78FFDA764B5BF52262B6EADDDCB4CD649F73ADFF5E5E1149D88FB406629763F47C816BB9FBF8898CF1E751193A61D6F4F4CA38F8352E4ABBE';
wwv_flow_api.g_varchar2_table(176) := '8A88F460896ABD94DE3A2E26F115BC15EAC6A439AFE3BCB3E13EAB4E8DB517F30CD9C9B9B03ADC6BFF52DEF91C6A646EE253DAE8C8F5877251A21D65014C9409DEED323199C1F56CF45DC0F79FA2DD086C1B1B676493D54959115DD8EF45D22A4D0F5D85';
wwv_flow_api.g_varchar2_table(177) := '9B28A42CF76A79562B6B614DA471CA54BF30D77A85BD756CBCDC156992A7607A142BAABB621D5147CCD6A1B97B328FCC305EBCE57C7307EF7D2533133F45EF0CE2BE52DAFAF7517712DE9519E663F44B1ED701F9BD527EE24D02FE4072B863EBC9FFDE4D';
wwv_flow_api.g_varchar2_table(178) := 'AC8BC6D661CEF57D118735070563D0796D354FA4E770DABF1E4D50E495127BA568AA52725A98036B34AF99E78937F0B2A54DC295D6FE1D52E90D218F758D72D535D0DDE69F07529A43F34C8E646AAE8BCEE676E675C9F59AA8E7EC2616D779D7DA1C7AA3';
wwv_flow_api.g_varchar2_table(179) := 'FFA6ACF39BB81F2E99FEADD4ED85A5C4F632C6F632D787A4AF571A9CD5DCCC7EB733B3985B04B1FA7BC57DD4C9741F955D8AD92EF7C36D96FF10DB55721AB699C9B2905C50491C77D798861734BEFD07642D750F697D5CB2470F428FB88CEA7AB8CFCB5C';
wwv_flow_api.g_varchar2_table(180) := 'D81D975E0E9A2F87FF212A4D5B71DCA3E484679C25A6D1D9CAFD8FB8FF993B871C02A6113D09C9EB654D3AD49D358DB227F5CFCD94FB61A13B9739CD9571EE62190DF3DC02CED502EA87CBB330F5BBDEA3ADC76001DC05F3BD676586771D7AA051A6C375';
wwv_flow_api.g_varchar2_table(181) := 'CE3E596AFAC8529F9CE4939B925F00792339202C135BE41905FFB9C87F4206FA0D3282F90ADF0EF49E9361D477E7BA9C52B5D318AEFF02C3B92FA59CC95AF4E0BAB7F98C5CBD81FFF7AFF8C70DBCB7019D76850CCBB896B3A291F3FD38317E895CE6AD96';
wwv_flow_api.g_varchar2_table(182) := '4AF710E7F229990823898F5CF31665BEDC6DFE8466CBE73CC827B65BC950D80A3530152E8729300326C128CB4DACCD32C931F7700ECEE13C6C902BCD34C6B1833518263D898D22F3A28C623C25B00CA6C044E80753ED9837103F1B8857DEF9D6F8BA7EEF';
wwv_flow_api.g_varchar2_table(183) := 'F1F5BAD0F8F83F863A5FA2219E9522778BDCE01E91CEEE93C4C851194F5ECE73DFA1FE283AE503194939D27D4DCA9D17A50AC6FC906FDD3AE9EB7C2ED7B8A364803B8CB81C2E59EE60BE1929BDDCBE92EB96D3D608DAFEBEEF6D0B8A4C6B29F42B815CEA';
wwv_flow_api.g_varchar2_table(184) := 'B78DCAABA1140EC8CD96A932C4DF019BE015E9E2FF5A06713D88DCAE7A6E68C6CD3294BA8AE401F6AB91BCDE28C550053DE0B6E87A2CF00FB157E1F33218ADF1ECBF2F5779BEF449BC2177B0F7B7BBA7D17F8D92A17A437580E6CCC414CEE25B65BCD746';
wwv_flow_api.g_varchar2_table(185) := '86F3CFAD87B570C0D24A9E49B672FAC565E6CDB23ED117EF562D5D9D25E8817FDBBCFB03715E0BF5508A1CC886CBA2FB4BD3B075514E557E6E4E0627E1FDA83CA975E4D46CD818E7CC0BB2FA3BC895CD96972F4CA8AB2252FE327801B6C1CE103C65EA3A';
wwv_flow_api.g_varchar2_table(186) := '555791965F7A99AF8323116FC321AD27BF5CA939E6BCA7094EC207E74BEA367E8B61B68CFDC1EB291E8ACAC15A46F9C6D592DC5BCADAF78D35A0F95FF012EC8ECAFD51DDFE6F425DAC0F17051FC31F60236C82E5D45F42EE6F01AB537A7033BE6633FD9D';
wwv_flow_api.g_varchar2_table(187) := '2FABBD53DFC132E20AFCEC14EBA3729E96A18E0C3ED1F27BC5DD1EA9F63BA19B94041A671567AAF22BC68F66524FA79A437D2B9EB1734C62FE79F01197BA2764B94990BB8B64B9FB477888FB42EEC7CB72E7493824BEFB5FEAB9F766F26C1EE7E63C72CE';
wwv_flow_api.g_varchar2_table(188) := 'BFECF538726FB9BB4806733678E8A872F7B8B4F70671566CA7EDA5B0534AD098E714AF3A08D2317B14F24B4BCA96A9D2550FA1384110A4431B2D1477B3DC1BF1888227599C5617F21BC60CD62FAD90C5FC87E7A8CF82D6D66FA5A04FF559EA9F6C3E86F5';
wwv_flow_api.g_varchar2_table(189) := 'A1F71209F06C4DC5F4F97548D3C090737B95A8DF2CDABF8F321B562966BD531C7E1FCE3B1CB77A2D2D9B7644E3C8D2BE741D740E719FCDF11CC9F21C6788B6E66ED677598B5743C235D37ADBEF7EC57C22FBE3E7B15FA37EA3D9A6630DBF4F56C8806485';
wwv_flow_api.g_varchar2_table(190) := '96E9C8C0C46B41A0706D220A9CA3D2CB7242F214F9520A1537494E505A48B1E2D4F14E9DADCBB344F526C2A98C1825ED2C7F9336965DC428B0FE23D361ED9F362F1127ED5903A58D3896F6CD70C44D47FBD07560DE762DF8F72EB2DEA5403A5A4F50871F';
wwv_flow_api.g_varchar2_table(191) := '0BA4837FB7AD2FE63CBDD3EF8C373B48CC6F09FEE9B722572C216E4BF02D57A2D5F1A4C9169C8DDD79C6B99AE8C9F7EFF22D3EC6FA13FCA837D0FAD18BACF7E46CF56EE4ECC4E7AA17D276C9FDD3329E96868C6C6948A8D719429B3B208BFF96F31E7FD4';
wwv_flow_api.g_varchar2_table(192) := 'CF9ED9F1D99C469C37121D82BFFB2D65BCC298E6C4E73CED6764AC09DBD66749C6EBBDC975776D3BF828CC27C13BCC7396EB35A9172BE6BBFED66B8D0976318F59F4D353FBD2F1AA1FD33385318F301F49FF381F35CF2F9A1F68FF6DAF303861264807F3';
wwv_flow_api.g_varchar2_table(193) := '1E3960B54CF666B0B68358B735D2897E1F73EB2589D79984C769CF39DEC1CE071F19B14E7D1E7BD4D01CFA5C1C712FF4867B586F3B471D631A5DB5645EF9305BF72B6223E36A803E5005D5EA3763747DBE41B3F9590F9A1BF9D59005A93D6FCE7BE1FEC7';
wwv_flow_api.g_varchar2_table(194) := '5C701F97901F009F7A9DA21E56B179769764DB7851742DF7068FE2933A687F762F66D3EF31F6A2909CB6053DB49DBAE9D2457D1778E6399B1FABF07F13DCD9C199C44DB67E9D791C0F788374317FE60C29C66F5D2F636D3D3E8D33FD0A9B231AE9AF1B6D';
wwv_flow_api.g_varchar2_table(195) := '6AAC56A383A7494952D76B37DAA923EF1E96D178C2729B9B7BCB4278301DF2FA44DE19A3F06F5478C5C131B38F357F5CFAC5799EB6AFC65356D9767966C77038D8156A06DEB7DAA0E955FA99820E38ADDFB8078339EE41B9D8EBCD19D05B7E6B63B337DA';
wwv_flow_api.g_varchar2_table(196) := 'FB15E6A95ABA9831479A23EAE796547F6800B7561EF13E64FECC31B14AAA122BE97B22795D3DAACE9758E5DB016E41F085A2EBE706ACD53174448DF53A35FAAEF319FEAE1BE7C7C3C4187E53FB8CD65D79407DAF5DFB66A46921A5444B77B6748EE71F31';
wwv_flow_api.g_varchar2_table(197) := '155AABAE61EE1D23C6E9BE45CC207FD7523726626C6232FB12913E0E4BB806A975889FB38ECA12C8645D03BB06E731361EB686F1E06E0D5E57F8AE16CAE09730C2CEB54E1CC845BBAB7EEF631648378B6AAF6E3CD37525A7EABBB4F1B27D479FB166CE27';
wwv_flow_api.g_varchar2_table(198) := '526A63F1B074E3D95A6F12F33B02857CB357F259C7FEEE1919607288D3FEF43B5B32CC19D90459E6900CB5FE7281E4796FD8FA52F4588DF784549B2532CD94A01FEF953BF19DADDD3C34CBA9A0C91C90FA449EACF056F00C5DE6AF9459FC5319E634FAE8';
wwv_flow_api.g_varchar2_table(199) := '16BE1F4FBCDFC73D1AC9DB16EA337CE2C5061F637E87BE5D2533CC2352967C55EA33CAF80FC7493D1EA621F10FA94F4EE37F442FD2CF10ABF996C9DA58DFC5C4DAD3AF088EE9D8ECF80EE00323ED481F12B7ADCF126568B7FFD35E26C055556700FEDF3D';
wwv_flow_api.g_varchar2_table(200) := 'E7DE87192454E3C2BE05B3E0148A166B519408050D4B90241214B240282088520D48A8C60418B65AA041795846E360C14C6C07A6C34CEB32E010EB0853B09516C74E3B538582624D7199AAF4DE7EE7DCFBE24B08249DEA9BF9E63FFBFBCF7FCFF9CFFF57';
wwv_flow_api.g_varchar2_table(201) := 'C8337A33FA7D123487F12831778D4C8E9DF18FF25FF733AF9F9DFB61B0937DCCE57FC4FE17FAEAE5C4C3C47FAA19DD37B287289E4D8955C3FFAD8B62E24392890FC85225C107EA46725D8D3FF909F5FFE0136A8813C6B0F606F35FB4D54977FEA3C88CE3';
wwv_flow_api.g_varchar2_table(202) := '3E34F18D9BEC7D28930FCD5ACC6D88B88F7517EB4ACA218F45722BBAE4C235301604EE5005F419DB2C47866C8781A6CC7E73A1C87CC78847D0B70104B221D3F3F8C611C66E6D68BFEF666B9B06FBFD43C6C066CEC2ED2988959C8988ABA157F44D1F8EE4';
wwv_flow_api.g_varchar2_table(203) := '43D6E6C64EE08D911B0CEA3067D85067CF906BCFD182702FAC9166C744B6B7769F4D7ED18C4417BD8F311F819963CE7A01FE23417B326E9F1091AC4FED209EAF8D48D6D77D55D60F919F7482F776E770779F88FC5BF8BE7067D5535FF93FFB1680DB472A';
wwv_flow_api.g_varchar2_table(204) := '8D5F847CFD5D188DEF1B1BFA58CB34FA76C800759418E23A9BD7857E0AFF808FFB983B5CEFFC105FF48F6097F3B969A37F0D3E6F8ED45BACEF0B5EB5F3A603BECEE50DE48ECF754749117E6E480AA1FF7B9C351F2796D926AB2DC6B7BF1F1C73F2827F5B';
wwv_flow_api.g_varchar2_table(205) := 'B93E3888FF1B6B7C207E254B57F10614C9A6A4BFB37E6C1A3A1B1FF7477809FFF1A214DB77A45E665BC99EDDB89462A7047B9E492C3493EF96306BE3CBB38C6FB3768AE6784B7897DE92B2782F6CF231F63D2883DC15D8BA3BDFEC978C5D808D3F926BE1';
wwv_flow_api.g_varchar2_table(206) := '7EF67B4C4F0E8EA93FE153D28377796B2BF465AC7948161217247409B1C42D8C5F2245D86BB563F299CDE4472D32C25D20A5D64E0F62F743C436CF732776E313B325C33BCC1EE6A7BCD5BB59E308EFABE116629085DCC94AC9777F27F9DE5CF29ABFCA40';
wwv_flow_api.g_varchar2_table(207) := 'AF07F6982A796A38F1887943F88ECE59E6D1A70B90ACE10E973ADED098C93189C3C5E499CE97E89BCC3377F326769E6786B9E65E9968F24D9B6B4679A6CD319BC8439A6491734226EA61944F846572CE099665E4A5862725373647CA918B7431634E5AC6';
wwv_flow_api.g_varchar2_table(208) := '3B5364949506E6C6DEE5BC9CA6EF1D627A336EB50C70EE904B9D5728FF80BE3AC956959CAF52F217D68B7D46FBE9685C720CEB30A6C08CF1EA39DB2F06BBF4CB7CF3B46097F7F3E084FE3571E02BDCFD3BA137ECE07D4B47E604AFF2FD472BE3438911BC';
wwv_flow_api.g_varchar2_table(209) := 'B59C7FEE83B380B3381FDE818351CC378D5885588238B54C13A3C55AE45EEF51DB9E7CEF17AA6ADEF42F382F9C5F7C4C8EBA89D86F25B1CBF194F824BAA3E6CE9A3363DFE0EBB893C7A55E55493E7BB9171B8D73EE83BDB04CF262072413E2C6A666EFB1';
wwv_flow_api.g_varchar2_table(210) := '2DE4988DC839B2D8964F403DF56ADEFB4CDEDCE2D0E6AA0FE7B12F92FD197BAB51D87C04EB2D0E8EC7DEB37617BED9B5F4DD673136BD41F29C7AF8052C255633DFE97468733B0FFBC35047C106D6E6AE386B6440ECA014AAEBA53016C846C8B5F2F7B2CA';
wwv_flow_api.g_varchar2_table(211) := 'E024A41216114F8C874A9D2FE30CCE3439EB14A343215026070DCBA6ED46EE11B4AED128B5EDC8879F39E5D86636FAB12FE711DE28F33F3DE589F6E8BBDA42DB6DC80B31BC3D8C3772687B68EF8D3C0FDAF3901DD15E8F0B8DCBBB881E1DB55F833C8FFF';
wwv_flow_api.g_varchar2_table(212) := '578F8BAC3B04791E17D12F1FD9115DD5E34276CE449EC745F49882EC88367A70B62A0C36B6DECE3D2A9161D45747BC6ED9CCB9E4BCAA03C4F707908CE3FEBD48DFB654F4ADC16706E5C83673C62D998C6D241EBD4CDE3258BF6AFCA7B96FE61C538EBD1D';
wwv_flow_api.g_varchar2_table(213) := '0421DC6F20BF6A83C8B97906A3631B32232ED4FE493B92ED46AFEEFC5710FEA7ADA7CCD7F3DAD27E1D62887D067CE41CDEC772B82D29D549E9A18BFDD78D542F10DB9B31B3A4BF4B4CAB9F95743B6E30E591BCD3BC3F90471CE7E93FCB346F9564F0EE56';
wwv_flow_api.g_varchar2_table(214) := '818AFCE7E8A434798B5A8ECF37EF688271CDF863D653B793FF1063E82A600DF3FE9A38D9C67A49B98EF3B3CE5F62A5898BF7C8DDE4A2FD5DA13C8BD8F91DC611BFEA86A05937F8EBA182F260788DF286947A0DCCD00DDC81562E3EC7AB94215E65D0EC55';
wwv_flow_api.g_varchar2_table(215) := 'FAEBA182326DC16B943724EBEA94DFA25FF66B61852D1FF0D744E59DB0559FF35BDC37FD5A58E196F88D1DD47702E3B06B2763BDFDE459FBFD96F856BF1656C4FB99B6B67547FB2DCEDB7E2DAC70CA3BACEF84AD8E0EA6C00A7752E0B99FFAB55E77BFDA';
wwv_flow_api.g_varchar2_table(216) := '96CFFA8F7AAEFFA03BC93F024D7AB0DFA24EFAF5EE55E871B9FF887EDA6FA43E2144FA1BDC023BAFDABBD45FEE26FCC6D6FAB7FC95619DB50AFC26B740667736369E21B3E3198117DFE757C7DFF497C76799B6A87ECC5F69EA7A3DE7B06BCCFC1FC6B699';
wwv_flow_api.g_varchar2_table(217) := 'A79E23960D991AC93B236CBB9EC4199E245BE0A7509F52DF92523794A494BB349EFB197346066BA00E2AA84B543794414F67A47F242A7F04D590030B607E3266BD20E13DAD32713CD446ACEAA07E19F4849AA8CF30161E801FDBBCE21BC2E483DF04EE6F';
wwv_flow_api.g_varchar2_table(218) := '3A47D59073D690EF86B42F579BDCB58B2CE9CA38EFA6CE899D914B6267828A88CAF3EB41CFD819FF34722E7D82DC08B9301DEED78DE43617C1F8504B1DFB37BEF66B93C1A76A1DB46BC78FCFFB3AF11EEA9CAEF8FCAEF8E1AEF8B1AEBC1DEDFD39E5C9ED';
wwv_flow_api.g_varchar2_table(219) := 'EBE7F9C30CBFBC8D3FA49E8C3F9231878971DAC413A9E59478A2357EE81EC605E4070F2771A760875B25CDBCF76A1EF9EE5874DDCB3BFE06F1E073F4CD8085D2C7ED2EE96E26B1C21E698A7F0F392C8C2B7817D293EF83AE9211EE1F881FB6CB837AA9E5';
wwv_flow_api.g_varchar2_table(220) := '05F733C936389A75E74B912E656E0F51A1FD8171F138327AABBD3EC161754A4ADCA1F8073073D0E50AA38F8B8E16E29524BA4226E1EBD25B592A0FA8E9FCD7D5D17E56CB089D05B79253CE921BBC7E72B3EE2D37C7D345C5B359EB0AB9DB1DC41EDE9099';
wwv_flow_api.g_varchar2_table(221) := 'EE25E8552A09F5B730CF743E972CF5B424DCFD32C6E6899FD0B70F3EA07F02367B003F7E9CFE7F2197F05E9838A897A4D99CD3B057728881D2D4FBC4CCFB2D09FDBAF432B875AC7984FA20B992B512BA907519E3EE9352632B754CBE0D33BCE1720FF969';
wwv_flow_api.g_varchar2_table(222) := 'B1C9510D765E8574532FF17DA6CB5678D2FAFAEF84A80DA2D179702BFB25C739888E85D17EF6488E5A865ED74B99572465EE53ECEBB792EF0D902BBD02F4182F05FA3174662F7A18BAEDC6579C629EF11919C833D2E01E9571F8C7BB745FDADEB064A1C7';
wwv_flow_api.g_varchar2_table(223) := '557A1B7D31FCD832FCDDB3526963BB12E96B7D01E8CB65943B5EFA62FFC5EA0B4B833B55061A6266DDE5AC1B3077A6C4ACCF6C606DC661838656BF7E4FF077FE3BCFAC6FB0736A884537A1CF3A79C6627CDDF321EA3DCEE68E14BE607C06FF5517EE475F';
wwv_flow_api.g_varchar2_table(224) := '25A3D461382577B86BA14496AAE3B294731CF37AA1C35A59C439EFCB7FCCD7F7A017917E37484AE757808C15D156807C091220C95FF017C8D53DC88580FBB9499D0B3E8F05B251CD90B5DCC14275BD14EA9D50154BA3EF4BE747324EFF53A646F17A3931';
wwv_flow_api.g_varchar2_table(225) := '7A1673A77B73F98EB932305EC6F99EC83DEC8FED3EE5EE644B1F730FBBED9691FAFB81AF6B6590DE2BFFA5BDFCA373BCEE00FE7D9F7B9FF78DC8308B9F21237E164594A1E247154198DF428228594A24122B454DDB637AD6B531A76D54B55A45573F16DD';
wwv_flow_api.g_varchar2_table(226) := '6C53B616ABE8A46A1D76B0AD678C8E73AA6C2D6A67E4CDB3CF7D9EFB6A1263FB67EF399F739F7BDFFBDCE77EEFFDFECCD66BA415EFB6326B845BCB0830E775C17D552EA84AFC4D48DEA59DA5C7874EE9F1B24F0BB59184F606C49EBDEB913AB21DD9B38D';
wwv_flow_api.g_varchar2_table(227) := '3DB3D6027D54EE7767C942F58134604FA5BA9BE4E8A6D868964CD075B1B507A448B5E7BE3A702F166AB3DF582A7CB67B2506FD57991AB926F19173921879099B2C60AFF820B7AEB40D6FA1AD90499181D8C361691D16F2923DD2226E9A6FFBFDCC5C8391';
wwv_flow_api.g_varchar2_table(228) := 'CFCD9714179BD5F7E1AB7E4AFBA42485EB6253DF96C6EE362955C7BD8391A1E8F47AC90A0FC6BF30DFE878788F14BAE5DCF30469889D6FE4BBC390C9C4FF14778AFC40779594C81792E7D69739E19FA18BCC57EBE1905F977ECCBDAC0AEEB86A5CE8F741';
wwv_flow_api.g_varchar2_table(229) := 'CD193AC4FDCF96879C9D5E46FCEBF24B7D429E774EC8F70D3CFF9CB6D88CFF37A82787073A146D12D326DFE7BF5CAD4E6C5BB3EF4CAE1607F67A9E3963776CE8BCF384AC8CCD3573F81111E42C5C86A41AEBDD85DABF5BFB1916ACA9DEE3B97ED0F731FF';
wwv_flow_api.g_varchar2_table(230) := '0DB76C0AF0F798E3CF7F0D1E8614FB5C833BD422F57CAAE77A7BBEA27A4E562DAF2A223FA90860CE1DF209CE19EB8D3687C53046E46615DCE01EE4CEEDDD881EA5ED1E70D3BB1D7F5E19ECB02D44932C3D6B31D3F288056D8BE6D4E28980CA8DB44510E5';
wwv_flow_api.g_varchar2_table(231) := 'F91F70055EB7BC65BF9767FBDD2CA69F63F7FC056D21ED55DA05969DF4BF13FCE7D32D90C19C95FF6E9EFDBF3A68407429EDE980684640E5D6007FDD37032A3FA11D65B1F3A28F337EE6ABF72B57C3F85A3C0F6B2D932DCFF1EE0A4BB1E5862576564B2D';
wwv_flow_api.g_varchar2_table(232) := 'AB2DF32D8F0554DE0C88BE6DD96A9963B1E772EB3C624C84F6967B2C1D6AD1AB26D5D7F7CF619825DDE2D4C43F5B73DE1B6AB1D172A7F1DEB588E9C4864027A2F705DFABFDBEAFAB4E359DADB54E746F4025D65DB939207AAC2695F9066CB8943AE1C300';
wwv_flow_api.g_varchar2_table(233) := '691E3A293F34B9480DD2A45DF85169F7BFF8C8FF277AB96CC6BFB7818990045DDD4CF2DC7A921CC994F6CE02690BED34D6AD3FF1F3CDFAE4C0B3C87BB2741FCF531BBCB3E153416EEB12C3DC4D32DD392CBD4CBE467CF96EA8D0FBA3F325B9C50E4957FB';
wwv_flow_api.g_varchar2_table(234) := 'A51F717149E8B4E4C65A3F3F26A6B9CF927B174A6B9303ABD5BCFB1EB12B8F7DCC9114FD75729AB1C4AB3132226E04F973039916972829E105322D7284B69F4C0B3FCDF787DEDE123733898163C91F1AAACDDEA7B4656A33B133D6AF2365CE3262E87469';
wwv_flow_api.g_varchar2_table(235) := '183AE95D774779E790EB123179B6FE9564D54992D9E4D159D40E0D754FEF22B5446FB72B1C91C4F01269478E30DBDC67248178FD06F79A2C4B542FBEB74526A828B9CA33419E4C1E3300DFDDCBE4B46A0B796D0A3922EBC55AF654A65AB18F6192E67306';
wwv_flow_api.g_varchar2_table(236) := '998B2591FC749AC1992569EE5C99A992645D84FDF3BC8E735EE792BF11FF5BABDDD412A3C8677A924B517F98FFD441BE17C3978FF96D83F38ECDD11B38EBDDC8C73D384402F2D432EA8D75FA216A9455DE593F4736F7A3B99F813256EDF04E1A7D7093FD';
wwv_flow_api.g_varchar2_table(237) := 'DA28CBED43DB9B36D64FF0F6F0BD38CE370E99E2DC4EE46A3D91710ABA745812D083FB556B19E7AEF2EB910C378DFD5E42B73A4A7793DF71B6F12A9B3C72990C35B920F3A77246D946C74CCD1077027D78C6BBE2D70C6F10F36E7A57A8351AF93ACA3D38';
wwv_flow_api.g_varchar2_table(238) := '6F4A22F7D8126E98F7CDDE7D790FC9080376B7307C849CC862EED6BFDF90E4AACBB2D159C5DCBFC00B9C3D6B51DF0C7497C9C0D045EF04EB9492C37630EBFA6B177B37D45CF4681FD092F35377782375736FA45A5CF5B91AC7DD27C84AE7532908FD9D7C';
wwv_flow_api.g_varchar2_table(239) := '69867748B5445663FF262E4F1245FED5D85D8ADD14B0E624191FEE227D6EE954B2F4373A13D3D9486BE67F2C8D4D6D1A4EE04EBEC95D997AE618396B1AFD86DE259DEE1DA8335FDC3845ADF28AB8FA6BD2847C4FF17F63EEBE23791C71C023E67858B4D7';
wwv_flow_api.g_varchar2_table(240) := '809CAE12BDFB1ECFC43A2F1526C06E204679A3019F59558E7F7BDFE6FAA303E404E31F0231CCEB01C3EC1A5409DE8C604E955927CFBED3C3FE9F13CC31BF2A33DEFBF68CEB3FFDFC3DEDBEC37839F5C450B37F7C0A3140AFE48F4CF2D41719DB6A69C6F7';
wwv_flow_api.g_varchar2_table(241) := 'E63B9F49A9794B6748BE9E27F9EAAA7476AE4A337C4E53BD5A4AF4CB5212FA33B63581FEAB9CED7C99A717CB3C3346FDD5546D848FA85B97A0D36FF1FF2FE0C7F8CE1D32D17FEF33E9AC9F958ED4A98D7407EA89BE30510A752EF9F463D42AE7A419DF2E';
wwv_flow_api.g_varchar2_table(242) := 'D1E3A88D58CF2DA11E7B4E46EA53F22D7D9E1A6D17DFB1503F75A2B6EC6CD665FF613366D67517CB5CFD0EEFBEC33A37A42B3AD9C2658E7E579A86156B54CA305FBE6A32C6E48CC9EACB8BAC466667B0249B6FF8FB5F87CF455E33E6CB5B5D662B373E20';
wwv_flow_api.g_varchar2_table(243) := 'DF6064BE25AF9113198DACBE8C31F990CD97D1CAE9CB8A9C465EEAD116D4552DDD6BE8F77EE94D3E3FF5566BE2057EC2198BDDF79052B79EAC3036EACEC0072D971E714BF1CBBD881F83BC53EA80F73BFC437DF78CC487DB634BF8F3481CFEF8B7D8F8E7';
wwv_flow_api.g_varchar2_table(244) := 'F4B169E293EF874DADE5D74D66FC15C62BB0F1E38CB7902E7A127B392EAE6B6C663736730C5BDBC6BC7FCA4C6AB1D926A6C5DA585CC066B1A5AA4DD47645910CA9A06DAF8EC972542CF7EE540D3736A1C8C69C6C99E1769010E7DE045F9CAEFAC8B8C807';
wwv_flow_api.g_varchar2_table(245) := '92113E201991B02C742FC8607717FF5F665FDD89BFFDF191F84AD54CE2D9771931F2A95BFD9EF8AD1230752C7E2FD21C5F515FD6C5F6EBEF3F159FBF89187C3ED88B8981AA109D0BD6487453587302BAB04A22C6F7E82C48F1C9D697986BE6195F9D40DF';
wwv_flow_api.g_varchar2_table(246) := 'FC8FEFF6E70EF1EBD43E26CE737F65C6771BBFED76E279BADF4F270E94C168BD061F4F6C347187754A797F9BF177D88C8903C97C73AAC9290CE849191418FF6FF6CFFEB61B4C4C633FD31D57D61AD49A0092381F743157AD4567FA13674412E2FA490FB7';
wwv_flow_api.g_varchar2_table(247) := '5C52D50A498D6F243DE29B8BF149D7F5BDC463201E88BB5D2AC2D7A442FD41663979D8CE00191AC995543D957BA21FF2BCADEA71C60FCB22C9F1B6EA06A127215337905F433A94C32E5803A32CDBDD47A4C26923239C0765811A24938971EFC717CA4AF7';
wwv_flow_api.g_varchar2_table(248) := '23F2AF1C79DAAE3389B97BE041288247E185EAEB384364A7B382FBCE92A7428B643D7296F8ECBF0347E5459FFAB2CC09D13734650FC9F29AC159E16D8DA1F7C9C3709CF5E7046372AF43E64C9B0D05762CF65FA16DF36DFB137F8D06B21C0E11EF8A90B5';
wwv_flow_api.g_varchar2_table(249) := '48A54BB10ECB44F2B7223553A6AB1F495F75D1922B7D6F9BF7272926FE4E27FEF6A93E4FBDC4D83D92E614B3BF62791B4640328C8407A00B2459FAC237A009B4815630141A426F6807EDEDFB1DA1997D2FD17FCE93D3500E73A11D14C01C98029D2DB990';
wwv_flow_api.g_varchar2_table(250) := '0683211386C322180033608CA52B8C8321900E83CCB33E28A9B108669E83BE8953555FC2BFE06FF6993ACDAB43BBF2DFECD77B7015571D07F0DFEE9EDD7B6F4A29EF47072884574809D026E1954809EF9218280C2490860408CF5A48898350C40CB4584A';
wwv_flow_api.g_varchar2_table(251) := '299524BCE4218C8952A0AD552A23C54E516B414405511308B6D23AC55654B094E1915DBFE7EEEF92BD97BDE1E6E6F28FD3643EF33B67F7BCF6EEEED973F8FB2CBFADE339C6E3F86788ED21111E879E80FD9885FD93D50AE4F759CE35FB388E826E906A7F';
wwv_flow_api.g_varchar2_table(252) := '7BAD72AE27EBB7E5EFFD10C09ED3D2ECEFA695C67D619F64AD8017B9AD857C0CFD986F731B33991CEF022ED7C7AEEF8F5DB81FB9FEF831AF338606A7CDBFC3593B5AB3B84E225FDBD6104928771A712CFF0E8BE59A06F13EE8CE7DCAEBEDC1FD26F258D2';
wwv_flow_api.g_varchar2_table(253) := 'B99C1C5F6BF0A84BB1465B4EBAB2867A42A9B2DC3A05679535D60DB5A73FFF3E9C50FE6A1D51CE93C05A231F4A95F3D6875083F4A39C7F177E652CA0AC5853BEB0F636D2A6BB95519F68B49D772B635CC078634CFC2646DEC33C15037AE7D8108731A618';
wwv_flow_api.g_varchar2_table(254) := 'C01C9A1BB5CB9413B55CA226799AE3AB4DB4DB8E9E87292B52BA07F720527323E7D988F623E41DE3CE6887F7C8CD5077DE39A8E7C2E844694EE24F78E69C3E0F66A4A19C83780BCF5703B40FB0266AC88686615D9FD510E35864D473987B22A03D11194F';
wwv_flow_api.g_varchar2_table(255) := '7FDC9F0888EB778AB45FDDC033186A2AA5B9F174457F51D07E8EBEA2F14E188763CB48C5FD73E119181D6F0D7EAB2ADCBF33D65E9F0FCF6F01EEC90287827ACA497C036B1C4ED6539B85275E43FD30B0A79B16A43FAED3A92C986883BD8E531EDAB98B48';
wwv_flow_api.g_varchar2_table(256) := 'BEFD917CCBB10FCBBA1BBD079E3FD076D969F100EAB5B4FB90511B66536B39BD0CE5FAA13C47F5D7781F42C8737EBB984C63A5DB24EDD1C609C426508F63CC79B7A5C1232C2BC4109763B745B14E6BDCFDDB1FE1FDDD827B586F0CCB6A0C3DCF4A139916';
wwv_flow_api.g_varchar2_table(257) := '796AF17E8186390A7BCAB681FC1DE3C5394953A8D44FBE03D5542A92A9549F85F68E00BED30656E8E1A2B881F47EC40C5C83333D0F6302FF3A1B6B7431D4AA813A918BE7523A431AA4892B366F25657AFA526620FAFE4103BC8FD1539ED954609C24F24D';
wwv_flow_api.g_varchar2_table(258) := '8142EBA2AFD01F4DDF00CBC27A5FAEE5857A9ABE29614F80353DFA92EBEF1AC7FB7F157D38E8D9C1FCC7F6F3D8B1B713A36C81F95C2BC133D714BB39BED044C16BC18CA03CAFD122F8E6BE0C8B83BE7761BE27985BFBCB7910CFCC8BF237D20EFAE78E04';
wwv_flow_api.g_varchar2_table(259) := '375A12EAB85047E3BCD3485BC83B940CDD952FCC539C7F92C5433E4C71292FCF557074E32C276587291350C9ED6570BE8A95C10ED8EE52BE8CD3650EE58EB4B39CAB9079A0122A2083F3554C96DB01DB5DCA07DA28732877A49DE55C293731CEC6DB1465';
wwv_flow_api.g_varchar2_table(260) := 'BD7B464D6EB49D51D4699C298D2B1F724DC9D05DB989F7C2CE3FC9E2211FD6BA9497E72A38BA7196932685291350C9ED6570BE8AC9E766076C77291F78A6CA1CCA1D6967395721BF4B25544006E7AB982CB703B6BB940FB451E650EE483BCBB90B33D745';
wwv_flow_api.g_varchar2_table(261) := 'EDBF56EF580A37E7462DC6FB853BE6FE488D0C23C6BF9F51816F6314A2DDEF18F383697F0886F5CCFBB0196B9A7C7834CC7A737548DA2D5F114847B2F66C4898B9767548DA2D5F114837750E15EF354CEFDCB0A075D265CA09D03D383F97D740B856B9BE';
wwv_flow_api.g_varchar2_table(262) := 'F1AF4DAFF01A15515D6DED25320FC155B80E1F731A3B19CB87F83CE223300326421E24E2F867880FDB69EB718E4930075A41367B93CF8F826E900A836097A35E5BBB9C3904CA9036A02FA4D975CCEF21AE804D300E16F231F4631EE37EE7B3976001B7DD';
wwv_flow_api.g_varchar2_table(263) := '07E23976864EDCDF61D4FB00CE420DF2B3A00D9F93B68648B2CB5A13E021588CFC2D4EF7E6FEBB71ECE868279DCBC9DFA183BC4EF10ECD837FC579E829AD1BEE490675514740023DA366D142498E55245126E2066EF305BE9E24FE5DA6420FD80623600B';
wwv_flow_api.g_varchar2_table(264) := '3C06657C2D323D8CEF453F38007301F7D2FC9C7FC371FC9BA4727B8338FA18CE994B6D56818D1EB059F2B77F1DBE015F8369B0082864CC3C5EF3A863BCA98EB1F238CD5A1EA76C370776F36F9DCDF59C639DEE3E5659CEBC89B884C71520C7F575FFF33E';
wwv_flow_api.g_varchar2_table(265) := '1466C2487E07CED4477D1009AF87C88B5FC93718F2B15FC29ECCDBD2AAF5165BE77C23AC5ADF7CEB9C310E7BC691700D73DC34CC7B7FA62C6F321CA22C5F061C87DF237F05B105CEA7A1DC73283F8CE7D74148AF411C6BD3736C4633B80FDAA34E1EAC80';
wwv_flow_api.g_varchar2_table(266) := '5D70C34E7B5B737E03DAFD18FE82B2EBB0F7034F17A42B11C7C35A949D0332DD15C7F7DA51EE133DF18893716CAD4D54D96EE7759B2CAF3F68477FFAAA1D7D0300C7C56138893A99381E87BE7A22FD2CF4C0F1BFA17C27BB5D7D3AE2EFEAFBF1D79366D8';
wwv_flow_api.g_varchar2_table(267) := 'F47E508C7ABD6CB21FF9DDF0FE07ED5E425F8524DFFF7DF23E8A16CA0F440BFA2DE4C073B014BE033F816C995647D211CC81CB854133B4AD709EF2B50DF455AD0FA56B9F627F57847D62317D0A13A13BF481F6900DF2DC8330539D4B3760250C84893002';
wwv_flow_api.g_varchar2_table(268) := '9E8645D0174A3DB994E0394509DA286BA6F686355B145945629535D3738812BC9D716E0A3C0BF994E66D85F8431C6F67E7651AF7D87F0CF736C1F8A9E338EA7BBE6D97F5A5C06B500ED5B0042A2087D27DFF445C0EA7392FD3ABE128EC44FDEF3B8ECBFA';
wwv_flow_api.g_varchar2_table(269) := 'B3EDB2EA2BD632DA688E52F698D9AA66666BADCDC95A8939554C37D3C5BFCDB17AB1395CDF604E1293CD616289F998FABCD94FB9688EA775A64FB96E662A2BEB8ED3C9BA13CA2B7567958D75B5B4D34C979449E64065823954598576DF35C7A91F9AE334';
wwv_flow_api.g_varchar2_table(270) := '0D0A38BD8CF383D1E75673827181D2DD782F62EC2EEC393B3C4F5FEBB238631DC673F05DDCFB22DCC7DEB84FF9FA565CD33A738C78930E88E674C05880678C05D615DACAFAF580B6C8DA8B71640568B944DAAB44C6313C1FFC1DF5F4C7F37BBD3EAF1BC8';
wwv_flow_api.g_varchar2_table(271) := 'E7D9EDC936C4263CCBCEFC16B4534224CB739FC910CFE94A08DAC706D61A5AE99D7B3F6DD51D7BA9C05EE7F69EC3B9F627AAC3FB63CAF9BB2BB4E4EF21D4616EBE950C19508DFC47806F8CF906CCE07A331CF57ADAFCF5641DAC056E5D0EA9D79CEC6FF3';
wwv_flow_api.g_varchar2_table(272) := '7AFE36268A5AA5435C7F4A92F48EB44FDC048B8AC435405A4FA5DD621E1D1497699FA1F3B93D7450C331630A1DD48B70FE386D16D3A88D9E80F71DF5F45E94A87F05755BD27A71CDBA203EA195FE76ABA944DF4D056873B33CEF3FF611DA3B0A6FD9E5B5';
wwv_flow_api.g_varchar2_table(273) := '97D1E6495AA4B7C3FC3E133187A62B16AD8744E517D6276AAE652A7FC4DCB08EE2707DC38D222A1729B44DACA142B1163105F9542AD47EE64F6FD37FC4E79056AA699BB1D07FBCD05F2EC59F5ECA71A23CA6545BBF1429D61EED197A481E57D7532FF4B1';
wwv_flow_api.g_varchar2_table(274) := '4D33A9448CE7F6C19871BB7E817A89F3B3A9B91881EBBB9F46E9A3A95C1D6E5D9375BDF3A9DC296E28CEF5A0B7D5121AADEAB4455CC27BA5D24BF8F7FF29DF0AA656474778634F2F6B983138F63C47EE0DDFB0E8C4157FE94BF75EB336D1B97F61649A1F';
wwv_flow_api.g_varchar2_table(275) := '0BD662CCFF87567323D3BAAC5E9B5DB1D136C55D7BEC363B1487D7F1F5FFB15BDEE1515569183F67124247444A20245C14B18021140141C110D010124A128A629BCCDC24632699389310A3D85DDCEA36B763C7022ACA051595A2A8808A85DEC4DE512CD8';
wwv_flow_api.g_varchar2_table(276) := 'EB7E73DF79E3B2C56777FF70CBF3C1F3CEEF77EA3DF75E66F8FEB56475F836BD9D0393BDEF9F4B9F2EDF5F9C591A8D46A3D1FC17658346A3D168341A8D46A3D168341A8D46A3D168341A8D46A3D168341A8D46A3D168341A8D46A3D168341A8D46A3D168';
wwv_flow_api.g_varchar2_table(277) := '341A8D46A3D168341A8D46A3D168341A8D46A3D168341A8D46A3D168341A8D46A3F93F8A35A6D7DCF451A687CD346D4CC0743683CC15C67419DE6FAF699D1C359DCC62F94C939840E7E4A7EFADCD1C6959BF6D6C9BC0BC94A7994E6957A63C5D7C7ECA33';
wwv_flow_api.g_varchar2_table(278) := 'C417A5BCB5199DB65C66DAF4B6B26797B4FD29B7A67746AB94074CA78CBE294F93FE41294F179F94F20CF1AA94CB79322E330B8D6386983C33D88C142B311113327113330949A56990BE02B1B8A9F73F83D21311AB33B932926FA2F2D731A5D25765AA65';
wwv_flow_api.g_varchar2_table(279) := '2CE1B75CA12BB3E7C86758667634856215D2E39A269931457673658F72D3EC9B638A65E766D9B7D1BF6254ACCA3F892389C99C6659CB6B382D67CE3343C5FAB7B4469881FEF583B243BDCC75E4BA41B94E728F90A949CD2D9256B5F426471BE57C8996FB';
wwv_flow_api.g_varchar2_table(280) := '2997FE887F0FD17F789E4AFF3938669CB42B6424D91BF49FC281F7887D62A93B75FCAB34CA68C8BF5F3EDD26591BF77B1A6556D87F6A8EF457FB7D2566A29C29F97422FEBA3AFFB98EF6D7BBFE0CD7D4CA35934F39EC7F3AA91371AEE3F727FC771A91B3';
wwv_flow_api.g_varchar2_table(281) := 'F0ED7D7B1FC9F1063945445626E42914F87713F1EF24D2721F41FF54C9F71FF6AF993C758D7F7F95079CF76FFFF554F9ED46B9366727DF46ADB4936F26E29F2E77A133246FF048A724128AC712B1CA06A72016AF8FC5830D91585DAE931F8D3AA591AAEA';
wwv_flow_api.g_varchar2_table(282) := '868453EA26DCF81C379CDBB1D0AD88BB4DCE947AB7AEBCB9DE758A83CDB1C606271AAB8A849C50ACBE399E5CE12477CE1BEAF44F62C440A73418ADAF760A8375A158A8467A8B62D5754E61633891BC4E797524E144FF729FCA58DC1917A9884642C1A893';
wwv_flow_api.g_varchar2_table(283) := 'BAA2CC89C9459D44AC311E729DE4719B8271D769AC0BBB71A7A1DA754A26963BC591905B9770473B09D775DCDA0A371C76C34E14BD4ED84D84E291FAE4EDF9D708BB0DC14834915B9C3F6B6669D98082603452118F7C572B85E469824E433C18766B83F1';
wwv_flow_api.g_varchar2_table(284) := '1A27568913B43CC8AA78ACB13ED91D8AD5D607EB226E22F77BFACAB7D32FFDFFCC97BE58DEEB2C33539E629919F0573F01C9775B25278DFAA7FEAE99FFEED87FE42707FF3D1BF34DA69967FECE9F256DD3F2CB02EB036BE54BD227B02EC53D6664609799';
wwv_flow_api.g_varchar2_table(285) := '1ED829DC2EDC91E236E156E116E166E126E146E16AE12AE14AE10A33DDA407769B619272495A8B85250B245B24AD4C8DEC644D7B596F4DD7C01A335E12963448AE92B492B9AB646C81EC688D13B87C59DB4C5BE42C0F5C46B9947209E562CA45940B2917';
wwv_flow_api.g_varchar2_table(286) := '50E652CEA79C4769A69C4B69A2CCA134521A2809CA39947A4A8C5247A9A544293594B329114A35A58A52497129614A8852410952CEA29C493983723AE534CA6CCAA9945328B32833293328D329E594324A29651A652A650A6532A584524C994429A24CA4';
wwv_flow_api.g_varchar2_table(287) := '14524EA69C449940194F29A08CA3E4534EA48CA58CA19C40399E329A328A721C652465046538E558CA30CA50CA10CA604A1E65102597720C65206500E568CA519423294750FA530EA7F4A31C463994D297E250FA507228D994DE942C4A2F4A4F4A26A507';
wwv_flow_api.g_varchar2_table(288) := 'A53BA51BA52BE5104A17CAC194CE9483289D281D291D28ED29ED286D296D28AD2919945694744A1A2540B1149312FB0DE56BCA57942F295F503EA77C46F994F209E563CA47940F29FB291F50DEA7BC477997B28FF20EE56DCA5ECA5B9437296F505EA7BC';
wwv_flow_api.g_varchar2_table(289) := '467995F20AE565CA4B9417292F509EA73C47D9437996B29BB28BB293B283B29DB28DB295B285B299B289B291F20CE569CA539427291B284F501EA73C46594F5947594B7994F208E561CA1ACA43940729AB29AB282B292B280F50EEA7DC47594EB997720F';
wwv_flow_api.g_varchar2_table(290) := 'E56ECA32CA528A475942B98B72276531E50ECAED94DB288B280B29B7526EA1DC4CB989B2807223E506CAF594EB28D752AEA15C4D994FF913E58F943F507E4FF91DE5B794DF50AEA2FC9AF22BCA2F29BFA0FC9C7225E567949F527E42F931E547941F52AE';
wwv_flow_api.g_varchar2_table(291) := 'A0CCA3FC80C2B2C7B2ECB12C7B2CCB1ECBB2C7B2ECB12C7B2CCB1ECBB2C7B2ECB12C7B2CCB1ECBB2C7B2ECB12C7B2CCB1ECBB2C7B2ECB1710AEB1FCBFAC7B2FEB1AC7F2CEB1FCBFAC7B2FEB1AC7F2CEB1FCBFAC7B2FEB1AC7F2CEB1FCBFAC7B2FEB1AC7F';
wwv_flow_api.g_varchar2_table(292) := '2CEB1FCBFAC7B2FEB1AC7F2CEB1FCBFAC7B2FEB1AC7F2CEB1FCBFAC7B2FEB1AC7F2CEB1FCBFAC7B2FEB1AC7F2CCB1ECBB2C7B2ECB1AC762CAB1DCB6AC7B2DAB1AC762CAB1DCB6AC7B2DAB1AC766CC1D2A42C0F5CEEE58CE92335B397D34D70295A977839';
wwv_flow_api.g_varchar2_table(293) := 'A30417A3751170A197D34170015A7381F381F380662F3B5F70AE975D206802E6008D186B402B01C4D1798E973D4E500FC4803A4CA905A2408DD77B82E06C200254035540A5D77BBCC0452B0C84800A20089C059C099C8175A7A3751A301B381538059805';
wwv_flow_api.g_varchar2_table(294) := 'CC046600D38172A00C2805A601538129C064A00428062601455ED644C144A0D0CB2A129C0C9CE4654D124CF0B28A05E38102601CC6F2B1EE44602CD68D014E008EC7CCD1C0282C3F0E18098C008603C762B361C050EC3204180CE461B341402ED61D030C';
wwv_flow_api.g_varchar2_table(295) := '0406004703470147024760EBFEC0E1D8B31F70187028B6EE0B3858D707C801B281DE4016D0CBEB3559D013C8F47A4D11F400BAA3B31BD0159D87005D808331D61938089D9D808E40078CB507DA016D31D606680D64783DA70A5A793DA709D281347406D0';
wwv_flow_api.g_varchar2_table(296) := 'B280F161BF01BEF6A7D8AFD0FA12F802F81C639FA1F529F009F031F09197592EF8D0CB2C13EC47EB03E07DE03D8CBD8BD63EE01DE06D8CED05DE42E79BC01BC0EBC06B98F22A5AAFA0F5325A2F012F022F60EC79E03974EE019E057603BB3065275A3B80';
wwv_flow_api.g_varchar2_table(297) := 'ED5E8F99826D5E8F1982ADC016746E0636011B816730E569E029743E096C009E001EC794C780F5E85C07AC051E051E011EC6CC35683D043C08ACC6D82A60253A57000F00F703F701CB31F35EB4EE01EE0696014BBDEE63059ED77DB6600970177027B018';
wwv_flow_api.g_varchar2_table(298) := 'B803B81DB80D58E47597DF6BBB10BBDC0ADC82B19B819B8005C08DC00DC0F5C075C0B5D8EC1AEC723530FFCFD4D6777453F51BC7F1FB2480D8344D52920E0A5E1401B180A0025140C20AA3D052E885B640CB282D7BA40DBB50362A7B0F070E448D235C50';
wwv_flow_api.g_varchar2_table(299) := '1145706F712F54706F41C53DEA3B3CE777CEEF9CDF39FECB8F0BAF7CEEFDDEEFF79B7B397D1EAAF776686CD7D8A6B155176CD1ABCD1A9B3436EABD0DBACB7A8D757A6FADC61A8DD51AAB3456EACC6BF5EA1A8DAB3556682CD758660746114BEDC0686289';
wwv_flow_api.g_varchar2_table(300) := 'C6623B504E2CD25868072CA2C60ED08C65811DE840CCD7A8D6E5F374DD5C8D3976A08C98ADCB6769CCD498A111D5A8D2A8D4AD23BA7CBAC6343B308698AA9B4DD199933526694CD498A0315ED78DD3A8D0272BD7E56335CA74E6188DD11AA334466A946A';
wwv_flow_api.g_varchar2_table(301) := '94E84B8FD0271BAE314C5FBA58B72ED22F2AD418AA8F3B44BFC8D25D0A34066B0CD2C8B7FD2162A0ED4F7C439EED4FFC78E7DAFEC5C400DBDF9AE8AF537234FAD97E7E2F90BE7AD547A3B70E866DFF7CA297ED5F4EF4B4FD0B881EB6BF86E86EA786896E';
wwv_flow_api.g_varchar2_table(302) := '1A218DAE1A57D9A9FCFF2E5DF4AAB3ED2B223A695C69FB123F1A5768046D5F6FA2A3ED2B243AD8BE62A2BDDEBB5CE332DBD78AB85467B6B37D89176B6BFB12B57989461B5DDE5ABFA19546B66E76B1464BDDEC228D161ACD359AD9BEC4BFD2851A4D75CF';
wwv_flow_api.g_varchar2_table(303) := '0B74CFF375B326BA8BA9719EAE6BACD148234BA3A146A6ED1D4164D8DE1222DDF69612691A010DBF46038D545DE0D3055E1DF468A468B8359275A64B6726E9E0B91AF535CED1A8A733EBEACC3A3AE8D47068888611AAF58C3613FEF68C31FFF294997F72';
wwv_flow_api.g_varchar2_table(304) := 'FE077EC76F8CFDCAD82FF8193FE114E33FE207EE7DCFF5499CC077F896F16FF035F7BEE2FA4B7C81CFF1594A85F969CA38F3137C8C8FF02163C7C963F800EF73FD1E7914EFE21DBCED9E68BEE56E67BE49BEE19E64BEEE6E6EBE8657397FC59D6DBE8C23';
wwv_flow_api.g_varchar2_table(305) := '7889FB2F32F6827BB2F93CE7CF71FE2CE7CFB827984FBBC79B4FB9C7994FBA2BCC2758FB38FB3D864711AA3DCCE7213C8283C9D3CD879323E643C995E681E42AF341ECC7038CDF8FFBB8B78F7B7B19B3B10771DCEB9A6DDEE39A63DEED9A67DEE5AA3663';
wwv_flow_api.g_varchar2_table(306) := 'AEF9E69DB803B763376EC32E576BF356F216DCCC9A9BC89DAE89E68D9CDFC0F9F5B88EF31DECB59DBDB6B1D756C6B6603336612336603DEBD6B1DFDAA45C734D529EB93AA9C25C95B4CB5C99B4DB5CEA6C662E7106CDC51234175935D6C2588DB5C0AAB6';
wwv_flow_api.g_varchar2_table(307) := 'E6C7AA2D57B5B8AAB3AA73AAE756C7AA8F568752EB25CDB3E658736373ACD9D64C6B566CA675C0B1CC28772C0D75B666C4A2569DA83F5A15759E8A4A2C2A3DA3D2362A0E23EA8D36893A93ABAC8855198B58466460A426128FD4E9148F1C8F388C8824ED';
wwv_flow_api.g_varchar2_table(308) := 'AF3DBC3792755E980CCD8BB8BDE1E9D6546B5A6CAA35A57CB23581071C1FACB0C6C52AACF26099353656668D098EB64605475AA5C11156496C84353C586C0D8B155B45C1426B28F387040B2C2B56600D0EE65B8362F9565E30D7CA657C4030C7EA1FCBB1';
wwv_flow_api.g_varchar2_table(309) := 'FA05FB587D637DACDEC1B0D58B97371A791B3569E4F4261E20B7114F626449F7B659A1ACE35927B3EA1859F1ACC359CE544F43B3A1A3A527537AE465CAD4CC05996B329D9E8C23198E5046CB56614FFA91F463E927D2EB3408A5B76C1336D2BC694DD29C';
wwv_flow_api.g_varchar2_table(310) := '81C4BBA50D28089FCEAE3D35DBB53FFDAE665AD3E6614F403C0133E0E8752220CB0CA7341131C44B38EB33679F04CCB0F320438651D710596B1464E7ECAF6F0CCA89D71F382C2E2BE2CD06273E43F9C5F17A2BE286553CAC708FC8EAA23DE2E85110F7E7';
wwv_flow_api.g_varchar2_table(311) := 'E417EBF5D255AB8CC6DD73E28D0717DACE9D3B1B772FCA89D724CE43A1D3E7B58973832945D92595D1CAECC25017C377DC77D2E70C1CF21EF13A3C1EF1786A3D8E908787F7A498298EC4476D8A3394D2AE63D8E336DD8EC447ADDB991672339278BF16C9';
wwv_flow_api.g_varchar2_table(312) := '030BC21E97E972585D5D792E47C8D5B54738E46ADD36FC3FEFB937F19EFACDD955257C945456659FFECB5591441397D989D1C4DFCA2AAE137FA2A7AF8DEC7F3D741A515AC951F59FC1AA7F5FF5FF7EC8997E80B3FFD863502285DD6A1D4B8C32C7622CC2';
wwv_flow_api.g_varchar2_table(313) := '42D46001E6A31AF3301773301BB33013331045152A311DD3301553301993301113301EE35081728C4519C660344661244A518211188E612846110A31144360A100833108F918883CE46200FA2307FDD0177DD01B61F4424FF440777443085D7115BAA033';
wwv_flow_api.g_varchar2_table(314) := '3AE14A5C81203AA203DAE3725C864BD10E6D7109DAA0355A211B17A3252E420B3447335C88A6B800E7A3094C9C87C668842C34442632908E3404E04703A4C2072F3C48811BC9702109E7A23ECE413DD4459D6EB57C3AE180C030CA8431F91B7FE14FFC81';
wwv_flow_api.g_varchar2_table(315) := 'DFF11B7EC52FF8193FE1147EC40FF81E277102DFE15B7C83AFF115BEC417F81C9FE1537C828FF1113EC4711CC307781FEFE128DEC53B781B6FE14DBC81D7F11A5EC52B781947F0125EC40B781ECFE1593C83A7F1149EC413781C8FE1511CC6213C828378';
wwv_flow_api.g_varchar2_table(316) := '180FE1001EC47E3C80FB711FF6612F6CEC411CF7E21EDC8DBB10C39DB803B763376EC32EDC8A5B70336EC24EDC881B703DAEC30E6CC7366CC5166CC6266CC406ACC73AACC51AACC62AACC4B5B806576305966319961A65DD6A84FA17EA5FA87FA1FE85FA';
wwv_flow_api.g_varchar2_table(317) := '17EA5FA87FA1FE85FA17EA5FA87FA1FE85FA17EA5FA87FA1FE85FA17EA5F22A007083D40E801420F107A80D003841E20F400A107083D40E801420F107A80D003841E20F400A107083D40E801420F107A80D003841E20F400A107083D40E801420F107A80';
wwv_flow_api.g_varchar2_table(318) := 'D003841E20F400A1FE85FA17EA5FA87DA1F685DA176A5FA87DA1F685DA176A5FA87DA1F6CF741F3ECB8FA233FD0067F9615456FED72F668923A3B4E41F01060059D584550D0A656E6473747265616D0D656E646F626A0D32342030206F626A0D3C3C2F46';
wwv_flow_api.g_varchar2_table(319) := '696C7465722F466C6174654465636F64652F4C656E677468203334393E3E73747265616D0D0A48895C92C96AC3301086EF7A0A1D9B43F092588AC1188A93800F5DA8DB0770AC716AA865213B07BF7D673421850AECF98466F935A3A8AA8FB51D1619BDFB';
wwv_flow_api.g_varchar2_table(320) := 'A96B6091FD608D8779BAF90EE405AE8315492ACDD02DF75DF87763EB4484C1CD3A2F30D6B69F4451C8E8030FE7C5AFF2E9D94C17D888E8CD1BF083BDCAA7AFAAD9C8A8B939F70323D845C6B22CA5811E13BDB4EEB51D4146216C5B1B3C1F96758B317F1E';
wwv_flow_api.g_varchar2_table(321) := '9FAB0399867DC262BAC9C0ECDA0E7C6BAF208A1857298B33AE528035FFCED38CC32E7DF7DD7A51A4E41CC76844B14F02A341DE31EF8835B326CE9973E223F311394B03A341CE983364C53915E5549C53514EB567DE13B3BF0AFE5C4B512D75603E10735D';
wwv_flow_api.g_varchar2_table(322) := '457555C55C11B306451AD489F9447C66C626149AEFA8E98E9A756AD2A9598F263D9AF568D2A3598F263D39F9A771928766DEBB466DC5E9CBC7CCBA9BF738AEF044C29C68428385C72B72939318459FF8156000E3ADA7BB0D0A656E6473747265616D0D65';
wwv_flow_api.g_varchar2_table(323) := '6E646F626A0D32352030206F626A0D3C3C2F42697473506572436F6D706F6E656E7420382F436F6C6F7253706163652F4465766963655247422F4465636F64655061726D733C3C2F42697473506572436F6D706F6E656E7420382F436F6C6F727320332F';
wwv_flow_api.g_varchar2_table(324) := '436F6C756D6E7320313834303E3E2F46696C7465722F466C6174654465636F64652F486569676874203439332F4C656E6774682035303035362F4E616D652F582F537562747970652F496D6167652F547970652F584F626A6563742F5769647468203138';
wwv_flow_api.g_varchar2_table(325) := '34303E3E73747265616D0D0A4889ECD18B5353571E07F07BF3F60D5ADB2234243C7C24D2108321210ABE5002C505DBD2507C2179904088E4DE9BAEEB388CED4CB5533BEEB63B2EEEECCABAB6A63E70B7D6958ABC7DA5EA5AA156202177F74FD9134811B7';
wwv_flow_api.g_varchar2_table(326) := '9B686796CD82DF99CF3087737FBFDFF99E13B5A13838F64F000000000000000000009856AA02B3DA504CF9FE0100000000000000000000D34A5560561B8A131E0300000000000000000060D6531598D586E284C70000000000000000000098F5D405A56A';
wwv_flow_api.g_varchar2_table(327) := 'FDA684C70000000000000000000098F55446B33A6F7DC26300000000000000000000CC7A2AA3992935243C06000000000000000000C0ACA7329A5B99D284C780FF155EC08DC9BCC3C99E8769CE5B865D176BCB8E1ED7EFF1AB4BC95FABF9C3C277FD4A47';
wwv_flow_api.g_varchar2_table(328) := 'FFD2C6BFCF6F7E246683B48F4F7460000000000000000080D9436534B7B632098F01D34AC885E7340F2F6DBC9F65EFD5EFBE54597982D9F85EDBEB1557B3D675661ABB33F27B947AE27AA6E19B2CD397EA92F74D0DBBDEF87893E54C4EEDD5F4FA1B8B9B';
wwv_flow_api.g_varchar2_table(329) := '1E8AD920EDE39F75104F71619A60C79EE0C214C753CFEE1D6F7FAAEC39BB000000000000000000660C95D1CCB4B6C62C68B84BD55CA42CFEFF3E32960C4FF4F55F0CFC42CF5041CD05F79643BF5BF3CED5ECF53D4A7DAF726D1FA1C823FA2374C4C4BF7D';
wwv_flow_api.g_varchar2_table(330) := 'E39F48415746FE85555B8F1A6DFB4A8FA4396F0BD930EDE3E31DC485C5AE7B736AAFCFDD7BED479D52DB00CD04292E6E634498F68E08BCC382E6098F099A0D51F14F040000000000000000985154467309D31AB3A0E62265F14F17323CD1D77F41CC6F7E';
wwv_flow_api.g_varchar2_table(331) := '94B7E7AB9DE5C73ECEAFBBB4724B67A6B157B9B64F91D7AFD0FD473D4A7D6766C1D9D56587D67B3E32D84EE7FC42BBF78A881BA37D7C9C536826B4B0EAEC32D38154231755E05BBAED98D0F33DC585A9B8BDC2A6A1456F9E595C7E7271796BD4F69352FB';
wwv_flow_api.g_varchar2_table(332) := '00FDAC46000000000000000080194465349F3F7F3E6681C53FBD127DFD1707EDE3E7343F5E61EDDA5A75BAA5B0E9AF2B36762BD7F62AF3FA1411FD0A5DFFF882EC7467E4FBD566D7D6967535E7E4F53777951F6B7BBD62CD9ECB62364886C43B82194DAE';
wwv_flow_api.g_varchar2_table(333) := '6893EB5C0A8D352AD79652D422720FD25C988ADB2B7106524D07D2B58EC95EB25E50DD4EB3218A8BD70800000000000000003083A88C66754E69CC028B7F7A25FAFA2F149A0B0BD9B094195DE60AACDED7515D7EFC94A6F26FD9EBBB32F27B94FA6EA5FE';
wwv_flow_api.g_varchar2_table(334) := 'CAF2A2DFE6D56C7BFB94CADAB9C4FD40C206C56CB07AFBF1364DA576EFD7623644FBF878F399D1E48A36B9CEA5D058A3726D29452D22F720399A8ADB2B7106524D07D2B58EC95EB25E50DD4EB3218A8BD70800000000000000003083A88C66B5363F6681';
wwv_flow_api.g_varchar2_table(335) := 'C53FBD127DFD1716EDE3E77A1FA7340436569FFD4DDEAEF695C5478C36FDAE4BAF34DE9332A3022E3C5146163B2A4F1C35DA5658BB44DC18E98A3793194DAE6893EB5C0A8D352AD79652D422720FD29181F17A25CE40AAE940BAD631D94BD60BAADB6936';
wwv_flow_api.g_varchar2_table(336) := '4471F11A010000000000000000661095D1ACD699621658FCD3EBE7A5E5E97154C4F376455AB830FD735AFEBFF1D4F3BE004F71E18818C5E459846C58CC86244C50CA8C12644D76A63E175988D890980D0AB8C8FE339E9A194DAE6893EB5C0A8D352AD796';
wwv_flow_api.g_varchar2_table(337) := '52D422720FD2D1187CAC3C126720D574205DEB98EC25EB05D5ED341BA2B85897E5C73FCD9A5F160000000000000000663F95D1ACD66F8A5960F14FAFB8D9681F2FE4C252EFC8CB8DF7B3EC3DCB6DDD39B51DDA3D9757D57566DB7A529D77E6340F0BB8F0';
wwv_flow_api.g_varchar2_table(338) := 'BFB508B831311B5AE4194AAF1F202DABACD7B47B2FAFDED741D64AC74052D3A0900DD3E35D6491E419CCB2F7122FBBEF9346CAC7C7C943C290B24C471F393DC9F3909C92D21020635758BB7E6AB9B52BC3D14F92CBBC2324243D6532CD8E093D8F24CEBB';
wwv_flow_api.g_varchar2_table(339) := '126720AA3E206A7C40F9C2914FFB7F90B8EE4EEE4B9CDF924FD196FA3B52FB4D99B5576A1B90D4DF16360D91FDA73273BCC03B2C76DD239512FB2D595D8F6C5FB7C47E43E2B82D76DD259323F55CB49E3C02CD8422FF46762636C3D493F7E4C70F1D2231';
wwv_flow_api.g_varchar2_table(340) := 'A4B61BB2BA3EE9F810817754E01D11BBA6842709DDDF9162DA1B4CAE6893EB5C0A8D352AD79652D842F20B3DDF47C23B6ECAEA7AA5248F334076C6C3900C41326DDEEE8E34239B9E6BFFB1D746D6493BFE2475DC22D7A1D9D078369E6646450D0F22B773';
wwv_flow_api.g_varchar2_table(341) := 'DC96D6F5910B4AED03641D19D8440606C7F3C7FB1101000000000000000012486534AB0D5B631658FCD32B7630DAC70BB8B125EE070535170E16EDFF3ABBE8CAF2C22FD5A55FAC2EFBCBCACD1D59A6CFF26ADE78EB0FCB5C0101179EEC22EB39CDC32BAC';
wwv_flow_api.g_varchar2_table(342) := '5DB5E6237FCED97E2DD3747165F1E739E5E755DB48CB395589BDE403F295D490629977A4A4EAD4D5AC7557B3D7FF728377AEF7313D65D44FF32CF40C356FFED5E5E51BBEC9366D7FF3F7499E41DF46EE7AA6A15BA9EF791AD9E9CA30B4AFDC72A8D0535C';
wwv_flow_api.g_varchar2_table(343) := '753AC57547C48E3D09D9FC78D15B9FBFA6DFFF5A9E3B622DD1F4CAE60F6936443E2DA8BE94B6B679CA27CFD2AD9F885D7793B79F94EB5CE95A477AAE9D90AF71BE54F26B89FD1615C9CC13343B2676DD5BF8B63FC574305D5B3F5116A575A41998A48A53';
wwv_flow_api.g_varchar2_table(344) := '92FA3BE494897A91FBBBB9BB3B248E9B02EF3019428E96DA6F92BFD1695C58E2B8BDC4FC995CD7383924D5C0CCABF94A56D79B96EF9D9AF0A5924F85FB7F1030A3C9956D24A442638DCAB5A514B6C8ACBD49156DF23553C2EB1A1697B7924BD14C48521F';
wwv_flow_api.g_varchar2_table(345) := '20D9C80B907D85C6F6A45763936B9DF23CF7AB1B0E8B1A1FD04C50E47E386FE7E5578B0E47DE61EAED72ED24C9E2B213B2BA1E8177848AFD230200000000000000002496CA68561B4B621658FCD32BC6B9B48F17B3C194866F77961FFBA366C7C93555EF';
wwv_flow_api.g_varchar2_table(346) := '6DE0F6967D64AE3AB5D972A6AAE253CF96839FE4D79E5BB58DDBE8CBB2F58AD9106911B2E1F9CD8F0ADFF51F31DABE585DF681C955BFED7065E589CDEFFC8B7D72016AEACCE23849808008040514915C46BB6041C94D2288419E82484008202582F80072';
wwv_flow_api.g_varchar2_table(347) := 'F3209090E4C65A47DC6A1D6B0B6A6BEBA22250EA42C507BE6A6BA56E2D3ABA681590B7493A3BBB3BED8EB5FB9E5AABEB9E24122E8F7468BB2ECEF8657E93F9BEEFFCCF39FFF3DD7BDF4F5B59235DBEB522BA0CCEF784AF8D5BD5E856DE3345D327CCA939';
wwv_flow_api.g_varchar2_table(348) := 'FF4254EB9CC803DC9CD0A28FE9A4D19E1F283EBFF0A377F8F917E6467E3277714656B597AA63433C792A387E676471F9D24DEAC44D2A0AB0056F6F85AF3E12B21C1681B2CFE9A401EA403586BA8795558F7165811C89191CFE09BF982D34DD1D4679AF47';
wwv_flow_api.g_varchar2_table(349) := '6E333584E1D299B1BFF64EDE653EC42D879C620B049B2BF34EAEA2690668A491A63330A5577C92ABD8FC120C27863436CC2DD83C85EFD2D799441B4D37E8409A5C8A3E0B082F9B19B3859559E72E3EEA25AAF58BA970965F8310E0A8BCE5BDAC0A524656';
wwv_flow_api.g_varchar2_table(350) := '2320C533AB61A443C267592543D54DD7F47B65D6B1F90A6A6B7FC106DFC4D72D75A4C3E7B884CD937B651C842C2671D91CE54A29A38D703E6BC92B4E8AEBCEB2ABD3D2F6CD8E28B7B41E6740F3454557B8AEBF40D7F44DFA678540201008040281402010';
wwv_flow_api.g_varchar2_table(351) := '08040281408C4BC8E294D0C5CBED0AC44D4F173B7D193AE3F4D29BEB53763485A6BCB1A8283AFF0377F56D1A69B446E9A4614A792FBEEEEC9625A547429237C6696728DBE9A491A9E95F5470E20037A73E4CB46AC5EE00D96550DA6A3AE90667CBAE14A4';
wwv_flow_api.g_varchar2_table(352) := 'BDD91096BE8F270E5FD3E2A9EA12E6D49C9F1B753A28EEF8BCA4D52BAAA0EFB87EA00E53DB9F95F9EEC9E0F83341711FBF10959155CD5275E813F4D02B417C185A3B69EF380E016B68E7A9EA0C2F38B135AAE454707CA170C79311481343D5CDCAACC3B8';
wwv_flow_api.g_varchar2_table(353) := 'D2404EB10509E0175341D30E32D43D1EB9CD18574E0915072C2CC57062E864046CBED299683327AABAA60BF7625C59202EA1961DE2891E04D3D2AA41ECA037BA165E842D54C638120C97625C02B64CA2CD8134D2B40353F35B02F8CAB11D41E91FA9A376';
wwv_flow_api.g_varchar2_table(354) := 'C138846F52250C45D7F47B65D6B2F90A8A5EC2E6C92DE625634A496647689C655799924B9042B98DD1B25951AF802B96A876CC3D8C1E109CCC887FCDB1E48B49FFAC100804028140201008040281403C83AC6EBA3B70F7C1C3478F0158C076D22D219E43';
wwv_flow_api.g_varchar2_table(355) := '4216A7840A847605E2A6716937DC7B3CE11F88EDD5B1D777AAFA76547EF3E1F9695511EBF175675D34FD34BDC91685359D34B868FA82249F6E89561E7F317145F601374DAFAFF27A55C4BAF717A4E764ECF52CEB64E88CD49A34D2E8A4BBE3A3BC5190F6';
wwv_flow_api.g_varchar2_table(356) := 'E6E105699B62CBE71097843987CEFD2A7AEFC2FCC6D0D4AD4B4A7C4A6F806CAC1F47D2E02FBFBA218E6C0A15EEE38BCF04C56664EF67A93AF409FAFA30516C5E234367A03A74D09B60CB208D60322AEFC8413CE7373CF16CD915B325D2C45075B332EB30';
wwv_flow_api.g_varchar2_table(357) := 'AE3490536C4102F8C554D0B4830C758F476E33C6950F85CC510C27406C81B0886DA162364FEE9EDB4C2FEF7529FADDEC087520C72A9004E2928008352BEB3D6056D446A860D5C3C23F9274965D83315D0B2F625C992D04B9B065126D0EA491AEEEF54DDC';
wwv_flow_api.g_varchar2_table(358) := '09DB9136A466BDC509D41F3EE710BE499530145DD3EF9559CBE62BA80E4149314F5043703865CD39A6E452C0C252C8323BC1474C67195CE617BDD96DCD877E319B2902A8299B9656CDCA6A9811FF9AC5A7C4DA8BCD53B8AE3D3FE99F1502814020100804';
wwv_flow_api.g_varchar2_table(359) := '028140201088670DD9896FBEF9F7A34F0DDFC5557F05C002B67038E9C610CF1B2182945081D0AE40DC342EED867B8F27FC03B1BD3AF6FACE2CF9FD7681BC61417AEACA838E3AC3B81A3A69646A0712731B1AC2D2DF5854E4A3BC214EDFD3322F818C2759';
wwv_flow_api.g_varchar2_table(360) := '659D34BD69DC2C27DDE01CE2B38A98B263F392A2F29B853935678262B72D516C8CD51CC4570AF28F3274C6B159CEDA8125F9470E707336C5AA21F774505C7AF67E96AA439FA0AF0F13C5E6355AB2C67634814998655B94A225786990A4D5913438902686';
wwv_flow_api.g_varchar2_table(361) := 'AA9B95598771A5819C620B12C02FA682A61D64A87B3C729B31AE7C286406E3123EC9BBA6E69D9C9EFA0E861316FD50882767896A19AA2E77F151364F317C8E4BBD44350CD56D084D5D7502429068862763F34B5C0B5B693A836BE1458C2BB314B46611B0';
wwv_flow_api.g_varchar2_table(362) := '654ADB68A4C951F9454078E94887845FF4E6A9792DAC8C1A360EE7B62C09C6217C932A6128BAA6DF2BB396CD578C308F13D352F7B9AD3EED9DBC0BEA8F9C4BEA2E3EE658DA3165ED471E2F3505449453CC983B4E4F7DD7ADE08CEBBA4F203D6061E9F0E0';
wwv_flow_api.g_varchar2_table(363) := 'B8C477E90EC7D25B3020E4FA47EAA0D4137872CF958727FDB342201008040281402010080402F1ACD1FEC7FB97BFBCEFBEF90FD62D2C600B87936E0CF1BC112248091508ED0AC44D4F173B7DC30B5A4E06C56F13C8BD4A6F39E84DE36A687A139D34CC28';
wwv_flow_api.g_varchar2_table(364) := 'B90EB2C6502126FDBC8E23FAEDFC54FEDA530C9DD15E653A69646A075ECA78EBF082D495A2BD19D9D5A783E236C6691273DF3B3E2FB12865BB8BA66F7423D2E8A1EA5C27DC0982B4EC0325CBB6404A7AF67E96AA439FA0AF0F13C5E6355A3A8EE3134C7A';
wwv_flow_api.g_varchar2_table(365) := 'AABA36C5AA4F05C705155F70240D0EA489A1EA6665D6615C6920A7D88204F08BA9A0690719EA1E8FDC668C2B1F0A9961F34B18CA5BF4F23E26717996E0E5405C62493187309EDC2BB39651D6C9CAAA8735A520C1121DA297F7D2B4034E8A76EF94B7BD97';
wwv_flow_api.g_varchar2_table(366) := 'EF3693B207D6CE449B0369742DBC887165184E0C6511B065126D349DC1B5B015AA0D8770099B2B9D527096AEE967A8BA66C6BD8AF164B65E1887F04DAA84A1200A66D87C05D5BC7F24E954D20EE69D64D702C2D536E766F35CA97BEE51C8A2E9EE30A557';
wwv_flow_api.g_varchar2_table(367) := 'FC052F635C62B82C4EB8AF3A46D7F4C1146EF927D97C25B5AC6FFC76B82BBA66C0A9E4064B546B9E6B6840F039E99F1502814020100804028140202685B72FFFBDFBEB0709FBBF1A7578F3CFDF8F3AB4D27AE7BBC743BF9EAF1F8C8D02E3CAE0DF1AA28A';
wwv_flow_api.g_varchar2_table(368) := 'FF71FF51C10777A98735EDFF1C7BF8E380F8EEBF1E6E6DFDEB4F1AFCE7658D7B0FDF3FFCCFC4EB80D278EF8751776BBBB7FF21D0021AFDEC018115757FF9F2DB1FF41F7E4B3D842D1C4268E275E0D1C363FDE513C12C70D513793DA0DDD89773EC21F521';
wwv_flow_api.g_varchar2_table(369) := 'FED4B76E22407D6BC7A7F17C1D2C8FF84F7F7B68BD5B68641DC476D5D4E9E010A683191F537E564B10B26EA194EDB51C5BCD7687D68B820555FF7F204490121A916057206E7ABAD8E92B5BF6EAD11797E5ADD8ED481A7EDCBF936ED05DDDE5557673C1FA';
wwv_flow_api.g_varchar2_table(370) := '73678362F62ECC732DEFA3E94DF6F410A29346174DBF87AAD3B3AC539873E85470BC3E411F5274BE7251E17FD9A9F2A028CF33EEB70B2206093819C2E57EFCD1688A83BB2B5E85514E27D2181451512BDAD23DD8D575610FBCA21883356D1CC7A499541A';
wwv_flow_api.g_varchar2_table(371) := '0435510C566B746AA6066DEA4951538C80C0B2A4078E762882A841E5EA6FF7755FBFEE25F51A3BF332BFF9E6799FE3F7FC9EE77D974DF1B9AF292B85E5B0A1E135E5F15F4D516C9DF4D3989CA3EA19EF1E1E9D989E591CA4AF41E1CE71B31316ED159BAC';
wwv_flow_api.g_varchar2_table(372) := '435C9AA2167E89E6F42FE2D465D2D97CEE295B9AB945ACAF0DCA28E3E5EA28A9C20E2510366D3D676C12E7D5056655F0728D23648B464E3172C646CE64F15D561D9A54142555D94B6C517EBC2638A354ACFF3670DE1ED80F0965CA511374C1E99FF8E69E';
wwv_flow_api.g_varchar2_table(373) := '13AFF8161D45F9F52243839DA78933350F315BFD734EF0F25C5EA67254A970F4539D423460E141D8F6460F4211938D7EEA339CD92A323604A7FF961FAFA5BD78A92A64FA165B0B4303C44862B50FC5CB9461091B7C56D440BC8FAE263C7EB5635EBB78B9';
wwv_flow_api.g_varchar2_table(374) := '7A44D67E91A1113B19AAA98A885F2DD8893DBAF0000AB196E14B8E4A6275B4108644A67EE58DADC3145FFBE82E89F597457975E80E2A2463C0E7F6F3616060606060606060606060607871F0D1D9AEEE9EFE7F76F6A4EDB8EEE4FC47474F72F135D7924A';
wwv_flow_api.g_varchar2_table(375) := '4B37E0899046BDA7D1E47FDFE92BA9BE453DE8686DEF69EDECCDDED7F618E390F28D951DCF6175C201D1F15E6FBF70102F4032443AED7630EB7AFEDBC02DB8DE855BA777D45DBF3FC8E53C2D1EA421D98B13CBC114C21C2CAAEB6EDF337A3CCFE27E8513';
wwv_flow_api.g_varchar2_table(376) := '819C18D0DF76FBC1ED785917BD44E1D4C8A73F5E5736BA34E47BE7DF7AF2E6AFCFDC74F5C389D0630F1B1D975651F14B8F090BCA9F2D3CF47D7F72CEA7316FFD68F1EF4466AB77FD5C418BD8647DC9503F2B73FB176392F4A96B7DCCCD8F9ABA055560F6';
wwv_flow_api.g_varchar2_table(377) := '37D4A7CD2F3D3426D994BCF2D5E5D5D933DFFF34267DC6BC52B1A0A92D2DFF4AD2823D9F47CFC87DE39D91BA6F946945874727A6671607E96B0A920B768E9B9DB0682F3480D6A9116A47E45D9E99F9C9AE987463CAAA912BFE6A1BC7DC22D6D7066594F1';
wwv_flow_api.g_varchar2_table(378) := '72759454618712089BB69E333689F3EA02B32A78B9C611B24523A79811E24C4DBEDAF3A14945515295BDC416E5C76B82334A457975C3971E954CD051BF0D32252F538D9AA07B3569D3CB73760FCBA9F459FE0D7886D83500FE392778792E721C252A1CFD';
wwv_flow_api.g_varchar2_table(379) := '542739A32570DE5EBB3C4748A60E9BB66E686E15AA384353E0BC3D92582D95C74B5521D3B7602891A1016204219B86B0840D3EBA4B108F6F78FC1A781E8A97AB4764ED17191A413B54531511BF5AB0137B74E101CE64E14CCDC3147F8E885B291C9CF495';
wwv_flow_api.g_varchar2_table(380) := 'C42E0B4D280C9A5D327CE997BEDA6A5071F6D19EFAFF0406060606060606060606060686171C1F9DEDEAEEE9BF7AB37771799B77A71095966EC013278D7A4FA3C9D6F61E20B9F81AF16CACECA8BB7E1FC8DEE7BEBB7780076C20790EDB731A104D858378';
wwv_flow_api.g_varchar2_table(381) := '81DBCCC1ACEBF96FE3ADB27F7D77A3A7E00F37844E1CE14468F03CB8D092EA5B4F3ED1E0799086642F4EBA7078060606BAEEF61DAEBF835787E3602EF17FC5B3B85FE062EB3DDCAFD345D32D91A8773DC29D9097693CD2EE968D2483B3B5B397FC3CDD2E';
wwv_flow_api.g_varchar2_table(382) := '19283CD671E3FBBE9D17FEEBA6708413A1C71E363A2E6DECD2CD1E131694BB457573FBC0A0FF90EC89C753DF5D31B34AA5737EA03CC199AD8F1C812B6879C950AF9C51F4FBD753E6CFFA403C8812027FC395B4F9A587C6241B935706E4D74DCE3EB03B26';
wwv_flow_api.g_varchar2_table(383) := '5D97BA2E585F43FB8A4DD6D0657F5991FA76897C6EF2C2CFFC0C0D8AB44D874727A6671607E96B5626993F8B99397BCE6F22B567C3B5E7C2B55514F0442B8E65647CBC6DE2920F2666C72EFDC2C76481D421E616B1BE3628A38C97ABA3A40A3B9440D8B4';
wwv_flow_api.g_varchar2_table(384) := 'F59CB1499C57179855C1CB358E902D1A39C58C1067B4F86ACF872615454955F6125B941FAF09CE2815191A7C975D0C49D96CE3942905B50A1C79990A6991930DAFCCD8367CE951515EBD6D3A738B7FCE095E9E8BA8235985A39FEA247A0565ECB4CB7384';
wwv_flow_api.g_varchar2_table(385) := '64AAD0C48DBEDAEA21662B676C0CCCFA5C12ABA5F278A92A64FA160C0519102308D9BA872514FAE82E8113DFF0F83576790EF172F588ACFD224323C40CD55445C4AF16ECC41E5D788033596C1BD3D58C7CF36349EC32815AC543D932F5A889FA9094F702';
wwv_flow_api.g_varchar2_table(386) := '161D14EB2FD94A9EF6FF040606060606060606060606068617191BBEEAE8EEE9BF7AB37771799B77A7132A2DDD80D093BDAFADEB6EDFC0C000BE175BEF91A86B5ADDF5FB25D5B79CA8CEFCEDAEB5BD67636507CD395C7FA7B5B3179C38C27FAFB77FC0FE';
wwv_flow_api.g_varchar2_table(387) := '476B490EE9089B0840C9E63F75E24B9289DFB59C644224FC876A1F34224E703A35823CE2413E95E4690FC9C5D7C8202827556841E6A2FB211E0099185C98435641F42399F6C220840D21B410B2E18F0820840029A4028893EEF6F170B2A5FBF4777747AC';
wwv_flow_api.g_varchar2_table(388) := 'FB3B39C2C0114E2F2574ED74107AF5C2BB83876C982E4138AFEB68AD371F5E2E6AC91503D4C67EC8024188657A71921BC7975E223570D7448CDB357AD7EF7AF5AEFCDEB7E474D7C257019BF20B1F337DC0F4CD905E7470FA7310BE5578483E32691492DA';
wwv_flow_api.g_varchar2_table(389) := '6EF76EAFEA7265A3EDDEF9AA83469DFA0A5178ACE3C6F77D3B2F3CF829C1C011CE27798AD171691515151E131694BB457573FBC0A0FF90EC89C753DF8AE81925F2B9119A735C41CB2347E0CCD680FC5A7DEADA833F4C7D736E89D8641DE4ECFE862B69F3';
wwv_flow_api.g_varchar2_table(390) := '4B0F8D4936A4AC1A6668E0734F174ED57D387171F4CFFF48497C4D96713F3BBA439AB936214F927BDACFD8A848DB747874627A6671B0BE665592F9C8E8C40F2766AF4BC87F3B216FAD03B0374C5DBE6DD2925D31B3D64F5D3129FBE0F0FCFA077DCD2D62';
wwv_flow_api.g_varchar2_table(391) := '7D6D5046192F57474915762881B069EB39639338AF2E30AB82976B1C215B34728A1921CE68F1D59E0F4D2A8A92AAEC25B6283F5E139C51CA19106D1ABEF4CBB069EB04B4CEE0A5AAF0F8D5013F3924B289B1FAE79CE0E5B9BC4CE54850E1E8A73A09AA07';
wwv_flow_api.g_varchar2_table(392) := 'F21C21E48426BDEBABAD1E62B672C6462894C46AA93CD0864CDF82A1448606881184145132655842A18FEE1238F10D8F5F03CF43F172F588ACFD224323763254531511BF5A28DE165D788033591045DF618AAF4352364BC66B69B90B949193F25FCEDC2D';
wwv_flow_api.g_varchar2_table(393) := 'D65F7E925F04030303030303030303030303C3FF1D361DEFECEEE9BF7AB37771799B77A7132A2DDD038E3FD8C9C5D75A3B7B612094BDAFADEB6E1FB19DD2E0A9BB7EBFA4FA961315002742A41C46FE917610C2DE58D901367C49A8ED762FB191033F3CD4';
wwv_flow_api.g_varchar2_table(394) := '098394408CB5BD87A4B92D172AA455C44934400C9CE08141BA109DD476124F8FC2D604742EA74CE4DCEBEDA75BA239709272EAC49718422705D54F08C96E8553C343391F1B39FB6DAB3BDEDC9DB8FD1A000347383DE5A31DF6806D083740AF9EDE9DDB25';
wwv_flow_api.g_varchar2_table(395) := 'D034BA4CE168C204CAECD48518E44D7A7182F662EB3D787024D70A12C24C1EA4A7357AD7EFE5EA9DDE80F03DD3D15CEF9ABE0AB74F94AE9ABE044F2F93FE429DE491554089F09D6FAFEA72CB46962FECE5FAE685283CD671E3FBBE9D176E0130707C9277';
wwv_flow_api.g_varchar2_table(396) := '0844C7A58D1D27F798B0A0FCD9C243DFF2B13FDE21CB94E49EE2CCD6478E20325B03F26B97A7AE3BF87ACAACFFB04F2D40515D6798DD8545622090A8E52597B6138C1A5D168AA25479052D18092B0AD8F840DDBDB020AF7D40B051A3D1B131B4A9D17442';
wwv_flow_api.g_varchar2_table(397) := 'A5405323066BE36B9C26D29AE8681DA8294410D965993E48756A294433832862BFDD2387E3BE62B5E98C33E7CE3767FEF33FBEFF3BFF3977C9BBB20728F128EF9194F7F89475A666D51E9E92A44BAE94EB4D20C949DFB56FC6E2C599BF784277C9C6DC3D';
wwv_flow_api.g_varchar2_table(398) := '5E77292B7DD7FEE98B9665BCED53760969EAD4ED472312D233AB034A5A2B120DC723E2F72A97BD397BEDCED8753BE7A8EF21765DD5EC35D551591F4C5DF87A5C41D4AA23E875AFB5B14756D2EEAFAA139479E10AB50D1A2068FE2689DE242BEDF0CB6E14';
wwv_flow_api.g_varchar2_table(399) := '94DAD190351A1A6B4448A2377B15B404266E0B5788B6126B5488D206A86A25FA2ED04ACB2EF9AC3939217557E8AC3241992F28C5B0A80221722C19069A067FFF55B9785662E8F659FB7B6B9A358144456CBDC5D368F454E6AF516E6B640B45E60526BCE6';
wwv_flow_api.g_varchar2_table(400) := 'A56D4617F4F2CB6A088B2E18E354889352AA7028A9EE32C43021146A82E2377B16B5413FD6E0B80DF08C8957E6F9661F94EAACE2E5DAF3217195CC4C6CD1E587240633A2981BFA7A8B679E7EF1DD903946B41895A76106656D173ABBEC8955271EF1A7E0';
wwv_flow_api.g_varchar2_table(401) := 'E0E0E0E0E0E0E0E0E0E0E0E078ECB0E7DCF5C1DB235F7C39BCA2E19A7B278B26F32040B72B0F5CEBB87A2BA9FA8A5DD42E0D405A4DF30D472A30F40E0C63B5DB229965A0842C0FB169096458FA6E6F6DEA47C86939CD24CA89EDD4C9EA67135CCD01AD21';
wwv_flow_api.g_varchar2_table(402) := '866840F25DDB07035B28814D35431E44928951DBB1DD8E530384D051033209FFD0F008185842F6D4EC341E05A547FBBE1A1AB93372178081AD9B647258FA9109D02BA3067B1C78C813A273231FFCECD1D87252423B9272765C6E9C64EC177A87D8288646';
wwv_flow_api.g_varchar2_table(403) := '9889C1F2B36374A39F64DA5DBDABDF81E5671F8FDD5DD32A56039D0935ECDEA7E3AF67D70E67675F057D4EF0236DC71F061CD92827DBEB6B1FD8E68FFB0706EF00301EF11102D3E6A64E9FA9749990D3F0CDC245DFEAA8ACFA9919CFAF3D21355ADCEB97';
wwv_flow_api.g_varchar2_table(404) := '1ABB9F2C6B0F2938A7FEC1F6C3531273D3DEF03476BB2F9194F7C8F55DFEC56D13D7FF296D59CD912949BAE44A2F83496E30C5ACFAF0AD59AB7F145F16A2FD23D23C0DE60945177E3A2B77F7F75E9EBAEE236CE57A933A75FBD18884F4CC6AFF92D68A44';
wwv_flow_api.g_varchar2_table(405) := 'E3FBCF2F5A96B1FBBBE2A96FE79D66F19DBC4FA7AFFB5D6EDA8F7F35E3A51D733411EA26105A05187B6425EDFEAA3A419917AE50DBA00182E66F92E84DB2D20EBFEC4641A91D0D59A3A1B14684247AB357414B60E2B67085682BB14685286D80AA56A2EF';
wwv_flow_api.g_varchar2_table(406) := 'F200B9B107399E859FF9AC3919905E13346FE333A9BB0313B6D81A89F7D822358232DF6FE97E94F8AC69822D448E861422B6DEE26990F8667D705F95420C8EAB94E79F93187BA4BA2E7F55BD105D40E5090A71524A150E25D55D8698B0B190B55D50FC66';
wwv_flow_api.g_varchar2_table(407) := 'CFA236E8C71A1CB7019E31F1CA3CDFEC83208472B9F67C485C2533135B74F92189C18CA8F574D6035A64C59F7B6B4E3FB5E4BDC0F82D615185F78B24931427A6BCF9E8FF05070707070707070707070707C763873DE7AE0FDE1EF95BFFEDA4EA2BEE9D14';
wwv_flow_api.g_varchar2_table(408) := '4DE641806EB736F55BFAC63269D42E0DE8B87AABA6F986532AAC67FF7213092B0F5C037A0786B1229965A0C92C0FB1690964400C2421E4B49C66C2436DA74EB60B9BE06A0E48468EFE581F5652683719100E0D8FC0C9FAA9CDB291763B4E0D9081D86940';
wwv_flow_api.g_varchar2_table(409) := '1AFCF0D0C3B2842C0F3B8D87C6C29AABE7FF7AD3FCAF5B316FFF0380812D9CAEF2717622CFE9D553831D292971AAD67186A49CED426CBB3B72E324DD49C70BBD436881EDF59B77D8E7E16A8CEEF53B5EBDABDFC16E8B4C57774DD2580D949C1A76A373FC';
wwv_flow_api.g_varchar2_table(410) := 'D1D871D1B3BBBA3B47B64F2C8398CF5DE6232FF9411E58C5897F038FF20229A6CD496B6C6C749990D3F0CDC245DF8DF34AF64F5FB420AB5E66B0B8D7EFA3EBCC4D7BA34EA1DA38AFF8F8B3F35F9B57E46930BBC997182D324377CCAAC355B3D71A922A96';
wwv_flow_api.g_varchar2_table(411) := '65EC3E322551975CE96530791ABB27145D287EE1D503D35223738F4B8D9671BACEE8D5477EF35C8A31A9629CEE32C4C8F52675EAF6A31109E999D5FE25ADE549E5F58A8CC4E5EFC38F7219C847812D9CDF2A6C294CD97C644A4266C66E9FB24E49798F87';
wwv_flow_api.g_varchar2_table(412) := 'B14756D2EEAFAA139479E10AB50D1A2068FE2689DE242BEDF0CB6E1494DAD190351A1A6B4448A2377B15B404266E0B5788B6126B5488D206A86AA5BA2E9C0B39525DA7ACF87359519BACF8A2ACB80D6CE3723F0E9EFB4AE86C5D58746178A4061022C509';
wwv_flow_api.g_varchar2_table(413) := 'A9BBA4BACB3E6B9B04653EB6A38D446CBDC5331243F7F895C7EF0B456A26471779AB3F41485AD63961E1CF10A5F204853829A50A870227C48445178C898FD404C56FF62C6A8336ACC1711BAC1AA878659E6FF64188C74CE4DAF3217195CC4C6CD1E58724';
wwv_flow_api.g_varchar2_table(414) := 'D6DBB478E074800143E842BEACB4DDB3A8552E9E7D266D4FE8AC52B60AFC21B186FFC9AFC1C1C1C1C1C1C1C1C1C1C1C1C1F1D8E1AD335F36FFFD6652F595AF751234990701BA454EEFC0704DF30DD82B0F5CBB7EF30E89DAA5011D576F913447AAAD4DFD';
wwv_flow_api.g_varchar2_table(415) := '43C32348202420C40A27D8B012E7B5AF8689CDF2109B96408CA5EF3649735A4E33D9464E9DA08541260091A022094EE78064E827FC5427A294812D411422899FDA6C326C320AACC4B073D2A19103DA114200914A553DDCC358B6EF9F9F7D3104868B5786';
wwv_flow_api.g_varchar2_table(416) := '5634DC3B3B0C6CE14408098E55ECD81DAF9E1AECCCE1713C2F65A34763CBD963D22A3A19F226DD3829157978104C6645C7E56A8C6EF43BBD7AFA48A841FBDA4DC9E95DD32ABB874D66C26AA025AC72C73F949DB61DECF4BB6273FAB33CDC03FB6F316D4E';
wwv_flow_api.g_varchar2_table(417) := 'DAF498789709390D4ED1DCDD77F7813F24BBE271D57769C63B1F3E975CF4C226B9BECB558EA4BC4762B4F817B76E9F9B7F2C223E2967DFB167E3EB141913D7B7C0EFAA4A66B478EBBB54AA9F1F9CBAA060C196CC25EF1C8948D025577A194C52A3456E30';
wwv_flow_api.g_varchar2_table(418) := '2D5ABAB7617ADA8A177F32BEACC3B7F4A221F995FA9919C939EFC90C166B82DEA44EDD7E3422213DB3DABFA4B53CA91CD1F81FEE47D4A3BCC75EA1D1025AD4EE9BB1D89054F174F19FC1E061EC9195B4FBABEA04655EB8426D8306089ABF49A237C94A3B';
wwv_flow_api.g_varchar2_table(419) := 'FCB21B05A57634648D86C61A1192E8CD5E052D8189DBC215A2ADC41A15A2B401AA5A696987CFEA8F26A6EC0C9E5B3139A63868DEABDEEA4F510249A892965DF259733268FE465BA15A8814272EA892EA3A7DD63609CA7C6C471B89D87A8B67205B9E772E';
wwv_flow_api.g_varchar2_table(420) := '2C4ACB84AC55012FED9515B5CAC573A1B34A59F182429C9452854349759721262CBA604C7CA426287EB367511BC4600D8EDB00CF9878659E6FF641A9AE0B33916BCF87C455DE471B29FAE658A3A8851EFF25F50119BFB4A1364055E759784162E8C6299E';
wwv_flow_api.g_varchar2_table(421) := '7CF9B793A3D7534E2034A6F8FFF3EF707070707070707070707070703CEE68320FDE1DFD7A078693AAAF6C6DEA1F1A1EC1F6FACD3B177A879040D28841D171F5564DF30D3B2A9A8342F0C05879E01A68B1C2463EED456B591E62B325441EFC4ECBD94C6A';
wwv_flow_api.g_varchar2_table(422) := '3B751272520B6DD4E9740E38388D52BFE53FEC930B50536716C7F30401A1A15824017233BB5D4450F3409E410241B0014582E559F04572F3809890E446C107D4825BADB5AED6ED526DA0BB5BB0B0A8A53BED4C4BB53BAE23157515854A2099ED8CB33AEB';
wwv_flow_api.g_varchar2_table(423) := '383ADB9D59AB6CDD935C122290CE6E6784BAF3657EF3CDBDE7FCCF77FEDFF972EF3E02603E9E88675C641CC49E67D0C003394652065958E1D9BB962C216577FE390E4178F5DE70BA0172AAFF2B296FFF0D6AFBBF79B0EAD8EDE95908420A04209B9EF51E';
wwv_flow_api.g_varchar2_table(424) := '3B79BF9E2BF33C4CB965F2BEBCCF4B8E74CAD1A65C3DA98407B21CF450051198CFB9BF3EF881A0273EE52F3AE3FD7A8FF187FDCF78F5533E07CF0E9E2991279DF1AE3D55F0EAF1E0998977D0530EC7F47C47E4C13DB730FDA39B321FCF5F65FA6EDEFAE9';
wwv_flow_api.g_varchar2_table(425) := '079F1DE252F3E293327D0ACA3A67E4C2D8DDC7FFF50FC4BEF6F1D5F745E599DF2FC93F9458B5B8FA338AC531A38646D819C458E2FA93C7842FB78A4A38DAF3BBC535DD8B730BE5BF619A6DBEAA18E6D1176A2F9AB2B7F5C648724BDE5F5D7CF4A34559C6';
wwv_flow_api.g_varchar2_table(426) := 'EC7A28A15A1CB0678CF28BB792361E48DAC8D1F647ABCF75C5ADDA975CBD40770952809FC9A690B5F4C66416AC6B65E9AF58A496F66585928A0EBAD93EBD236C4827C6841B7B8F245480B7F0DA8BB0038570D0F5D759F2364CA8E2F1152E94003B6317D5';
wwv_flow_api.g_varchar2_table(427) := '64A31B86424ABB30A1C69D7266A3520848514DA34CED404456338F8FBB4A9C594CA409955BE9FAC190E24EAEA80613E04E849A70690BA3E632F4A29AC7FCD4FD1192A6892A81120461796FD38C370236F7614235BCBA1B41A1DA1F3F4B3AE4A46DF372E8';
wwv_flow_api.g_varchar2_table(428) := '42A08A4EA8E50AD4181FF7B607AFE139FBA104F60433DC04AD5789922D6964E8AE827F5839E206884C9A17AA824BBB69C611E8E8A7E9E788EB9F9C09F83C0CE619B59782AA3E8E5EAE83EC0422CDFCF21354D308D56C9B577D26326D2B3943B223276DEB';
wwv_flow_api.g_varchar2_table(429) := 'AC7D3E0804028140201008040281403C5BECEEBB67BFFB48DA7A6BCE9DCC1A55C7EFDCBC3F0EEB8F163C130CDD7EF8D8FDFB6EFC7BB8E867EBA4C72E7C0B4798C3E98181596B17979A179F2CF52928EB7CBAF8E81BA6BBBC29EFF5AEB855DADC579FDFF2';
wwv_flow_api.g_varchar2_table(430) := '171A619F22A05A1C4CB32DBC76409BDB78227665E5EA3743F4838955273AE3650713D7C72AFAE8663B68A694D088B1A0BAA1DC92F67785C57B5314209395584F2D921AB3EB61375203025DCE4E689D51D159B5FA8D93B1D2F2350718C498ABDCEE67B229';
wwv_flow_api.g_varchar2_table(431) := '642DBD319905EB5A59FA2B16A9A57D59A1A4A203DA519E6CE7EE685FA4E87B3369E3DE549C5DD34F8783100EBAFE3A4BDE8609553CBEC285126067ECA29A6C74C35048691726D4B853CE6C540A0129AA6994A91D88C86AE6F1715789338B8934A1722B54';
wwv_flow_api.g_varchar2_table(432) := '05AEFF849B5043C631011EBD5CE7A73AC7D05DA16FB91AB8E1536E82D6DD08E78A34F3CB7B60C3804D7D98500D6277231C5EFDF1B314C24E338DB00AADAE2AA59713D70E0225C8BC23181F0FCFD90F87A2196F8019772F1702255BD2C8D05D8576B072C4';
wwv_flow_api.g_varchar2_table(433) := '0D1099342F54059776D38C2330133F753F3B7DFB933B3B0FC24EDF11263B1C54D91B9962761FDC798A0849139C2B60D3E7A16B8F72451E9F4A2801FD5C7DBC080402814020100804028140FCC419BAFDB06FF45F736E6336A9E8F8FB37F71EC1FAA305FF';
wwv_flow_api.g_varchar2_table(434) := '37C0D5C31F60CE6DCC88B4F5D6CDFBE3C72E7C3BFBADA129B40603B3D6312E2D3F5E9CE75350D6F974F1D1D7CF34F233FCCB8389EBDF5FBAB664EDAF16E82E3E297050097B98EE5249E1A136BEFC5062E5CFF12FE9E6B160C3B56AD99E9ED8953B33F42F';
wwv_flow_api.g_varchar2_table(435) := '2ACFD0CD76EF2A28F1378D08367C7C2069E3074BF264C5EF85E92ECB4AACA716498DD9F54CB38D948166C52BC7AD7C794B9ADABA4CDEB1241F9C402DA46884DDCF6453C85A7A63320BD6B5B2F4572C524BFBB242494587AB9763CA29A816079460EAB3AF';
wwv_flow_api.g_varchar2_table(436) := 'A72A0F2656456ACE3B658483AEBFCE92B76142158FAF70A104D819BBA8261BDD301452DA850935EE94331B9542408A6A1A656A0722B29A797CDC55E2CC62224DA8DC4A33DE606ABE62AFD8E94EE151292656517B58FE91D082A3AC422B57A4254B3001CE';
wwv_flow_api.g_varchar2_table(437) := 'CED8C954F753087BC0E6D398500D1177231C5EFDF1B390A29AC7FC547F668BEB31AF5E131D05AA888C46577CC21E3C87E7EC8743810D30C34DD04EEA054AB6A491A1BB0AFE61E5881B2032695EA80A2EEDA61947602670B48559CD60C0BB17B93F27BD3E';
wwv_flow_api.g_varchar2_table(438) := '60D3E7E139FB9C139B74ABE426E8A2930C98B73D81322AA90EC4B3FFE5221008040281402010080402F1936577DFBDEFC6BF7FECFA0DDD7E38E77E10B349D5F13BFF78F06FF2F66FDE1F97B6DE9A734B88B8B4FC78719E4F4159E7D3C5475FBAD91E641C';
wwv_flow_api.g_varchar2_table(439) := '4EAEEAD9975CFDDBA5054416915CD9F39C7E30C0F835106CB8B658F1594D6ED37B82A277446559651F041A87A9849D69B6B16BFAF52BB77F18FFD2DE146541512B5BDB1FE82A014178ED4091FCC8BE946AC82A5F6A5EA0BB042D6425D6538BA4C6EC7AA8';
wwv_flow_api.g_varchar2_table(440) := '255B33CCA32FE82EFE3255D91B93F9C92F56ECC830F89B46281607A46884DDCF6453C85A2055B0AE95A5BF62915ADA97154A2A3AC030A99902B862D77CF59AB8C6CA97F3547F62106314C241D75F67C9DB30A18AC757B85002EC8C5D54938D6E180A29ED';
wwv_flow_api.g_varchar2_table(441) := 'C2841A77CA998D4A212045358D32B5031159CD3C3EEE2A7166319126546EA51947683096920FA392EA3001CE1328B9222D00FB80207AB90E13AA21081D23D3B60655F6D2EA8629167BC0E6D31077EA271AE1F0EA8F9FA5107630097BCE2F3FC149DB8639';
wwv_flow_api.g_varchar2_table(442) := 'F751810C56D8334C769855D4EEDCD06D0FE3E3E139FBE15034E30D30C34DD04E9A1728D9924686EE2AF88795236E80C8A479A12AB8B41B1AB966722D74ED31D8DF5B40C2496FF0D3F4CFAF38C111D79307710B946E26FC73137421C51D30C339FFAC1008';
wwv_flow_api.g_varchar2_table(443) := '040281402010080402814020108819894BCB8F17E7F91494753E5D7C1BA311F6C0BAE1A59B3E6D90D4F5C4AE3C2A286E166B1B576C695AA17B2DBDE6D709E5A762A56F246F16BFD21568FC9A6A7190554CF328477BBEA2E0C0EF96AE391E9FB73745097A';
wwv_flow_api.g_varchar2_table(444) := 'E0D5F45A78EE8A5B05F1F282B7226A2F80789EF1C6AAD2B693B1D98695DBA1D0D39769B655AC39D01B9309A454F6308831EF54B56C0FB45EF3F2BBCF1906CDD2AD567E51464527DD6CA7B83D3C8923C430B82DD3F487D81CD1868FA01C8274C37556513B';
wwv_flow_api.g_varchar2_table(445) := '26D262027C02A18A2D69A29A6D34C37048593737C12B25C0235309AA79946A1A656A071666EF01B12705CA50791BD564A3100EBA7E30A4A43332D502029E00E7F1F189954FB6502F94360755FD916618A21076D0CFAB3EED6C24527B3CC0ABBFEA1CC562';
wwv_flow_api.g_varchar2_table(446) := '279DD3EA8603367FC192B745489AD82B763C9FFF0E94838790FFB04F2F4E4D5D791CC07F3709AFAEA85DD7F74AD0EAA8095D4010E90515141F4D000DA250411148822410929B7B99451DC776DDB1EBE0A33BBE5BD7EDD62EBEB5B6A3DDF1B5BAB55A8AC8';
wwv_flow_api.g_varchar2_table(447) := '43218424FBAFEC39495054D2BA33EBC4ADDF99CFDC3939BFC7F99DA3949D6299C9A9E6208B36D53A6159ABBAE9914AF2B0E4A40CFBB07B5959ADC6D1CD8667DF29B95B870FAF9D579FF8C17995C48717645F9CE5CEC4FC9DCF24044D59B82DA6E101BBDD';
wwv_flow_api.g_varchar2_table(448) := 'AF2ABF9EBC703BBB8876E85E4FF0B4DCADA3CB4EAB1D3DFC76D1FEB302000000000000000018914E34EA4543C484F2B6572BF260427340A5F863DDDE090D1D2935572A8B5A0F66AC3F3777D9C5394B4FBE5BD8B2D89D5B7166AAED5E9CE461994FAB14BF';
wwv_flow_api.g_varchar2_table(449) := '461E1CEDEC79C77A6BC5BA131F89F62F530CACE4EC9CE57BB336AD361D9E69BD95E8EC659D59B246F14DAFBB5D623A94B9F1526867E85CDF64FBFDD525878AD61C7BCBD5373CA456FCBFABB952623AC8FAB0A3B3365C30AC3D3EADFEAE3094F322364F5A';
wwv_flow_api.g_varchar2_table(450) := 'F537AB4A0ECFADFD075B537340907D1AFB83F8DA1B09D5D7B89AEBF135D763ADFF22C5CF42EA8687F13543A16034CEFC4FE2FDFD8234106BBDCBA335D743D1F89A9B1A7B0729EC0502ECAB72F5C7D6B7BF55F5EDDBC59F4ECCDF3925A78599B074D798D2';
wwv_flow_api.g_varchar2_table(451) := '2FE26B6F6A1A3A05C91B6CC5F355CE3E56FEE4AC783EC64D95AB8F8F1D9C44700FA8A47E4D6317EB195BFF83DAD12DB8BD2AC9337ADDE9A40C5B72AA39C8A24DB38E5FDEAA6E7A24B80783F7BAF964F8D0BD58151FDEED8DB3DC663BC386BFCE9A0BA179';
wwv_flow_api.g_varchar2_table(452) := '14F62C5E8DBD33CE7C3BA1EADB51159712CBCF8FAAB89C507535CE7A875D9CA5B1E1636C1D6CC831259FB34B4DCED932456C61D71CBBEA44C2A66B31B676362DEFA6047EE2FF1500000000000000004014E944A35E34444C286F7BB55E6E488DE24B70F5';
wwv_flow_api.g_varchar2_table(453) := '8D7574FFA6B1637C43C758475782AB5F2DFB22E50BCD0195E28F730F8C6EEA19D7D8C94AC6353E4874F6C6C85E167A9AA6F8D5B23F461E64FD87EF332AC5C7925FDC673FD58A3F56F6B24256AEE169832C999E4D7BAE2494A6917DAC24B8192085F13F2B';
wwv_flow_api.g_varchar2_table(454) := '100E8D107DD27CC4427FB86A083B45900654EC899C8F1995AB8FFD2479909ECE193A25582B87F88242DDFE2DB80712D79D1A5778789CF100673830A6E46F9AC62E41F6A9A4FEB1257FD5CEAB4F4E350759B4695696C34E098F3AC2F043F3BF38FC08EFC6';
wwv_flow_api.g_varchar2_table(455) := '73F815D873B1914225CD8167A2ECCD250F3B51C56EE77CCC6E273CF34A000000000000000000AF299D68D48B868809E56DAFD6CB0D293407548A5F2DFBD54A98C034077EA62A942C87BFAA914AD84EC84BEE3F178A94F3D2DD0214B13C304CE4A8DB4B52';
wwv_flow_api.g_varchar2_table(456) := '3F293E927D247948F187F715F6F5F39F2CE4F690A38B1C0FC9F988E7B3284B76F58593E54172F60613BAF8823561AF2DF58F5BB93F29C3AE4DAF0B9996D1306AFDC5187B476CDD7753DF53D84E72AA994BB368D33727969D564903C1439F1BFEBFBDD78B';
wwv_flow_api.g_varchar2_table(457) := '3911329F5C907F7FB6210000000000000000C06B41271AF5A221624279DBAB15EDEB4787E227D947EE018E2DE44192FAC9EDE50BCE3764906F4A9E7028BC0E5505335D7DB4FE2C998EF19DFAEFA9E813723CE439A1264A100B6DBA42394E5ABA9D8A0FF0';
wwv_flow_api.g_varchar2_table(458) := '347696F906ADD8C51BB261EAEE50C10ECADF422B3F26D351AABDC66A056960F4BA534919F6E4547372AA25C89A94513F355B9996D9A84DB326A7594221B69E92D3125BF79DC04E6C0E44FF6D0100000000000000005E633AD1A8170D11132ACE5179DBAB';
wwv_flow_api.g_varchar2_table(459) := 'C29A47FBFAD11020D763DAF015998E50C96764BEC1DFA1E453321D23EB6D2A3BC977D69FA5EAAB3CA7FCEF643ACA7F6EBAC213D61CA7755FF005FBB9E112EF30DF420BEAC8D94B1B2FD36C0319F7F192B22F79ABAA6FC87C939C8F7887A46C5AB28D561F';
wwv_flow_api.g_varchar2_table(460) := 'A2CAF3FCACFCAD346B19391FF3612A2FD0DC62121D54F4675ECE0E950705D91763FB7152DE87DA346B72AA79882539CDC2BF5C7027CDF2DB05AEC4B2332A671F29FE683F2C0000000000000000C0EB4E271AF5A2216282BD9D2ACE5179DBFF1E6BCB9A47';
wwv_flow_api.g_varchar2_table(461) := 'FBFAD11020FB8F942B51660DCDB7504E13A55752C10E9A63A4C27D949C4B0BDD34B79816D4D1BC2ABE98B59C66E4D1E2DFF3841C27CDC8E7326B29650D2D6AA6D4729ED9D4431B2FD3AC653C61BE99524A69F94EFEFDE0140F998E505236E56F21D3519E';
wwv_flow_api.g_varchar2_table(462) := '203652B69D662EE5FF0AA66354B89F661B7893D58728CBCA7F4A1E52FC823C98507D6D42C19FA66539B5E99BB5E975DA346B185BA76F4ECA6C9C94F75162D919B5A35B50FCFC5ED17F5B000000000000000080D79A4E34EA4543D4C7789304C8769F725D';
wwv_flow_api.g_varchar2_table(463) := '54B083966CA377D7D2DC62AABC407A13195AE99D25347D315FCF5A4699B594B286F25A7842AE44D9762AFD0B8F2E7493E8E08B35C7F97AC16672F6D2C6CB94524AAB0F5396856FEA56F1848607D4D443A6A3347D1119F750E9099AB791567E4CC6BD34B3';
wwv_flow_api.g_varchar2_table(464) := '80D67E4E85FBF8A16C0616ADBE4AD936BE90FA49F1B35105B737C6D63E6AFDC5B78B8F8D5FB167E2923F4ECAFB6852DE1FC617ECFE75D191C4B2D371963B2AC9434A20DA4F0A0000000000000000F0FF41271AF5A221EA63BC490264BB4FEF35504A2965';
wwv_flow_api.g_varchar2_table(465) := 'DBA8E4335AB18BB2ED7CA7FE7B32EEE38B550769914C1BBEA2A5DB69BE99DEDF4D459F50E17EB2DEA6450A6559C974948C7B7855763D2F97FAC9728B32AA79C3820FA9FA2ACD36D0A266923C3C547196524A68BE85F2B790A195F7171B796D533735F5D0';
wwv_flow_api.g_varchar2_table(466) := 'A62BBCA4F63A4F36EEA5B293E4F6F221C3D3FA056940EDE8D53474C6D8DAC31A3AD54D3D2AC923C83E5202C392010000000000000000E0A7E844A35E34447D8C3749806C3F505E0BBDBF9BEAEF91F3313575F3456327C983E47CC417CE5E727491E4E15F';
wwv_flow_api.g_varchar2_table(467) := 'DB3D723CA4A61E1E720FF0A8ED3E4F603B2C646FE7E5AC9085D8DA16EC6368A519F954F535293E927DE4EAE3FB9BEFF204D68A95B3011A1EF02A360F2B64ADDC5E9ECC8E60C98A9F0F19FD87020000000000000000F8A5D189857AD110F5310000000000';
wwv_flow_api.g_varchar2_table(468) := '00000000007EF17462A15E34447D0C0000000000F80F3BF5FB1BC5710670FCFE987DB5F36A5FFA4EAAFC326716DE548A1445E92B2BAA1459A2527395780511CA0581AE5490BE482945E6878489ECC64106A42027A158F2D558A1815AA17457064F4C8D63';
wwv_flow_api.g_varchar2_table(469) := 'B8E57CDEB3EF6EFAEC1DD91E17F00FC0DA9EF31D7DB49A9D1FCFCECD3C73000000D8F1ECB4ABD27D892F0300000000000000763C3BEDAA745FE2CB00000000000000801DCF4EBB2ADD97F8320000000000000060C7B3D3AE4AF7B5B758CA01BA5AA55299';
wwv_flow_api.g_varchar2_table(470) := '9F9FD7140A8542A15028140A8542A1502814CAFF4D999F9FAF542A767A974AF7A5727ECC520ED0D524B7CB53A34B87F7FC70E01700000000000040E2960EEF294F8DCECFCFDBE95D2ADD97CAF9314B394057D35A4B86277ECB00000000000080D8D2E13D';
wwv_flow_api.g_varchar2_table(471) := '5A6B3BB34BA5FB52393F662907E86A92D889DF2F000000000000A083D6DACEEC52E9BE54CE8F59CA01BA9A2476E2970B000000000000E8A0B5B633AE4AF7A5727ECC520ED0D524B113BF5C0000000000004007ADB59D7155BA2F95F363967280AE26899D';
wwv_flow_api.g_varchar2_table(472) := 'F8E5020000000000003A68ADED8CAB7AB2A99C1FB39403743549ECC42F17000000000000D0416B6D675CD5934DE5FC98A51CA0AB4962277EB9000000000000800E5A6B3BE3AA9E6C2AE7C72CE5005D4D123BF1CB0500000000000074D05ADB1957F56453';
wwv_flow_api.g_varchar2_table(473) := '393F662907E86A92D8895F2E000000000000A083D6DACEB8AA279BCAF9314B39405793C44EFC72010000000000001DB4D676C6553DD954CE8F59CA01BA9A2476E2970B000000000000E8A0B5B633AEEAC9A6727ECC52CE56F59F1C1B3D36F0121381ED20';
wwv_flow_api.g_varchar2_table(474) := '899DF8E5020000000000003A68ADED8CAB7AB2A99C1FB394B325FDC35E68A454EF8EEEEBDDE25C603B4862277EB9000000000000800E5A6B3BE3AA9E6C2AE7C72CE56C9ABBFFF25C68AA0BE3C70BE38B52B97F39DFBB85E9C0B690C44EFC720100000000';
wwv_flow_api.g_varchar2_table(475) := '00001DB4D676C655E96C2AE7C72CE56C8E9B1F5F0C4DF5FEE57C6FF375FFE5B9D098858942EF662300DB42123BF1CB0500000000000074D05ADB1957A5B3A99C1FB394B3096F1526036382DB6706DADBFBCFCC948C297D33D8BFA9201D0A1351C862BEAD';
wwv_flow_api.g_varchar2_table(476) := '311F7DC51B7A9968F8F992C47E2D1764A538DC587922CFC4AF2A0000000000007600ADB59D71553A9BCAF9314B391B19383D1318134C9F1CF8696FFFC99B25634A33E7FB378ED3A13011452DE6DB1AF393D2E40D6D39147ED624B15FFD76AC14871B6BA1';
wwv_flow_api.g_varchar2_table(477) := '69D4E529F5C46F2B000000000000BA9DD6DACEEC56E96C2AE7C72CE5AC27BB6FF44ED5D416278EB82F1AD37BA4B85033A137F69BECBAA13A152602638262BEAD313F294DDED01682008E24F62B5E8D95E27063E54978F34A3D78284FA94B4BE21716DBA4';
wwv_flow_api.g_varchar2_table(478) := 'FCD9478D9540CE3A38FB7E79E460A3BA1CD507F726BEB0A4AC7A53C69870FA62E22B01000000006087D15ADB99DDAA279BCAF9314B392F94CD5F99AD9A70EECA07EE7AC394D3FBC1D5FBA1091F5CCB67D71BF6ACC244604C50CCB735E627A5C91B7AFA3A';
wwv_flow_api.g_varchar2_table(479) := '70E26BAF149AA8D4AAA53B63FB5BC10F154BC69426C7C6E7AA515738377EE4ADFCF85C588BDE4AB7CEF7B7A6BF3738311734279BD2DC9616862E2389FD2AF762A538DC5879B272FD5C79E4603D78284FA9472DC5E14D4658CABF51B976BAFEE87B536F66';
wwv_flow_api.g_varchar2_table(480) := 'A169D4CB4BCB978EB67A8333BF5DFDF754232C4B7B33995757BD1BD25EF9EA94D4A5A1FEF841E9CFBF6E0F28AFD21805AA2ECB7AA4259CBE68DA4A63ADBA367BB3635687EAB75FC8401959B9FA49E27F3E898877F87FFBD6DCCFF2671F352AA5FAA3F960';
wwv_flow_api.g_varchar2_table(481) := '70AFBC4AA39CBBD4371FB9B6E0B7476D542B6B7AA67552DBA49500ABDED4760497B0D15FE9F4C5C48F0C00000000801D466B6D6776AB9E6C2AE7C72CE53C5FB630F1D044C51B79E19836435E73F0C362E1CD8D0737152602F3BCE20D45BD6E7E52BAAB0B';
wwv_flow_api.g_varchar2_table(482) := '37C63EFEF0F8D08DC5D098F0CEC83BD275A8589251B5C5DB178E172ECC44F5B05A9ABDF6F1D1F3CD0557A78F3517BF24ED73578EEEDB7FE6A68C0967067B37B52A741F49EC97BE144F3E3D507FF2C3CAF573522F8F1CAC070FE52975699176E9DD30C2E3';
wwv_flow_api.g_varchar2_table(483) := '3FFE6A6DEE9FC63444BDBC547B70B7B678AF512955BEFC8BF456BE3CD9A82E4B5E36D6AAD22EBDCD31FF8ABABE3A656AAB51CAD7D756FE76B63DA6BC4A6334ABBADC5A4F387D317A5D7E14C5FF8FD78A29711E1F7FFBF9AB3AFE766D715656147D79F666';
wwv_flow_api.g_varchar2_table(484) := 'E27F3EDBA4F4A777D7EEFD434EAAB54B1D5A3BDC08CBD1A635ADDDBF1D9CFB5DFB1899289B29E71E0CEEDDFC776B0BBEEC6D7D494761177CF9449400F55AF8CDA50DE786D39F4B7A84373EDFD22F6D25C0AA37B51DDB2861A3FFD1E98B891F2800000000';
wwv_flow_api.g_varchar2_table(485) := '003B8CD6DACEEC563DD954CE8F59CA799EC2C49231C1CCF8ADC078232F18F38C21CF946E5DBB1D18B354CC6F627CF40919BCEC8D8F8E8DFE68DCAB1AE30D45BD23778D31B363EF3C1DEC9E9E91F7B92BFD8E75A85892EACCF9DEA8FDDD2B733FB6CBEB05';
wwv_flow_api.g_varchar2_table(486) := '4F5EEE0E3FADDC3EE3B6BE75229ADB0A8B1D4812FBB55C90F2C8C17AF0509E5B9AB5FADD75631AD1C4D1431D5D4F3E3DD0A894A4B33AF3F5A3DFFFB2A3B7F2D529535B6D5497E5B976EFDBF6AEB5EFBF6B7655A4B7B59E70FAA224F1AA37D51AB07CF958';
wwv_flow_api.g_varchar2_table(487) := '637525EEFDA9CAD54F1A6BD5DA83BBF5F29208CEBE9FF8FFCF760806F7CACEBF681F5A3B5C5BF0D73F74992E4124D4E6BF2B3125B2C46FBD2EE5DF08FFFE57D9703994E54B7F587FAE1CA21CA51CE8967E694702BC5E2FB7240000000000B021ADB59DD9';
wwv_flow_api.g_varchar2_table(488) := 'ADD27DA99C1FB394F33C0327BEB87AE23D273F19186FE405639E31E499D264C17A333F343AD8BF89F1962A4C04C604C57C5B63F439E30D49FDC362C934033ED3154C1CFA2F7BE5F7DBC495C571FE983C115EF20A3CF41150CB0B525FD022AD54A13CB4AB';
wwv_flow_api.g_varchar2_table(489) := '202D146525A4A26CBDACD4C003BF96920542692181380B816D205109B469ED3A8140504830630C0C090E389EF1783C3FEEDCBBDFE19AC199B19D64CB22D13DA34F46F79E73CFCF7BC66969DAB74885B81593E68A2ADD270F879ED76788DF1D18ECB7F281';
wwv_flow_api.g_varchar2_table(490) := '18F10E4F9FC77BF926C5DE3DDCD4B8651897BF8A6AEDFB3F62F21C652C1FDB10D59A23270573D8CBA75E618E97F5E285BD159F17F662CBE61F21196E97643ED6F8C02B57A92055A8026D149C14DC2B27FBDCC777B1B052FD6F72EEEB60CF1F0A8FC121B7';
wwv_flow_api.g_varchar2_table(491) := '4DF3E6E97AC285FD5BECC9216C7DA16B3BE964E1F036C8F5537F729FDC8344CAED3B57EB0965DAEEA35BEE9349A4019CCCADE2D97657BD2FB7904B9F7E5117F7B1178F7D39FEF4F9D2E041DF6D779BEC43F9975EAFF8122AEE94ADB18B4103832F3CDA8D';
wwv_flow_api.g_varchar2_table(492) := '4A877399E845E330DCC279F5BA41C921E0139EE17F51CF674661854BF7FB891A9F56BA81AEA25EF447D652FDAB84FE685DAD882223A26E740077118D181A80003FE13B83181818FBF6C597E5D1EFA4AA8167A4C7E6D2F20A70EFEEE33B3299655C84E94F';
wwv_flow_api.g_varchar2_table(493) := '1473828E1104411004411004411004D100555557AFFBA879EDA655BB32014DCD2D0D882574A1C4DF483EFE6CC7EEF6804F3E7E73B247115AA2B3B1B7C5748EEA42E8C958289C507AFC753C2D84C85EF94345F5E1E929E1AB36B634ED4B6AE24D2CC47D6D';
wwv_flow_api.g_varchar2_table(494) := '5251A5FB5A9A7A21B5EFF5B65765FBD9E615E446BC4F60B0DFCA0762C43B3C7D1EEFE59B9837BA0573DC67D351553EB681CD67B96B95AE1DA96D3B7212B62C97B1EF0E09EEE12DE5FE9639D6AFFD4886DB25998F353E80417794943C53FEF99CF05CCFC8';
wwv_flow_api.g_varchar2_table(495) := 'EB6776463D43081537B562EF9EF2E859E131363B837CA0D2BA5ABD85677ECE8F6EDB77AFB117596BFC524D21CE3B0F53488C3D7F684D0CB29C82B5934E42EEAAF7B146D590E3ED3C48D4140669A30970025BEEDA38C34B052FAF3AD33FA13A2865E1C6C0';
wwv_flow_api.g_varchar2_table(496) := '57BC5CE49661DFBF09A0E265DDF8D7DFF4EE36F4C1B7B20C7880677F6D9BC6E5CEE2D976648B63706B4FDDB0C62EA2909A1D8E5E34FCC32D9C57AFEB951CED307CC233FC47874186830A3E512332F41666D104373B5138B8B5FC4B2FA6C2DF3EB9871046';
wwv_flow_api.g_varchar2_table(497) := '7F4C4E9D9319AF44141CFDC7C950C4D0000433E6272C385A8A0EB88F6EA115C0BC793A98E7A8E7CA75A336ED39ACF0C612CE1162E98B10C2D372E8FC3BF8874510044110044110044110BF0354555DBDEEA3E6B59B56EDCA043435B7342096D085125FB4';
wwv_flow_api.g_varchar2_table(498) := 'AD7AB44467A0EA51166D9741E7289CE9C958289C507AFCF587C7A76C21ECDCD895435F1E3C3DFAD412C29AEAFE00AA7D49AD2A34E2BE36A9A8D27D2D4D9FC4D330D095C163B11DBB638786A6D2432BCA8D789FC060BF950FC4887778FA3CDECB37B1C607';
wwv_flow_api.g_varchar2_table(499) := '307F8E928AAAF4EE3678E376A99E4373E4A4600ECB658A17F6F2B2EE15E6B4AE568005289EFFA2DA5C06E2A50536978609776DEE5AE68D53B5B34AF50BEEB9CFA6B12EF6EEE1A6C66DD3B8DCE96F11CB3278A900FFD8E6631B16F66FA929C47958B1D919';
wwv_flow_api.g_varchar2_table(500) := '6CFD72BEDBED1979501A3AEA6939EE944BD78EC87085835BB5139F468541DA5E5E2D1CDE86AD3D39EC6F8DBC7E66A7AFBD751935C93CDDEC048A32878F497379126FD946E1B9E59FCFC9DC584E4175E564DF924D961DAEFEC942EBE445C30486305FB4AE';
wwv_flow_api.g_varchar2_table(501) := '53321621CFF003CFF05FF342B14603A51350BA72009DF11666B5AFB7638B694126E88CD4CA6E5766E65544DC176E6D399326138649F1DC5FAAAF1E2D82DB7A9ECBA36785C7D8CB27F252F0C63A4869A98B60307F2B9F1B41100441100441100441FC3FA0';
wwv_flow_api.g_varchar2_table(502) := 'AAEAEA751FAD59BB69D5AE4C4053734B0362095D28F19ADB1E456889CE4015DA2E83CE515D083D190B85134A8FDC6E6C3F9E78AA31E13F4C7F92E8DEB1F1957C5F52136F6221EE1B9357AA749FBFFE60EF9574DE16F2D15F8C9FDABE92DC88F7090CF65B';
wwv_flow_api.g_varchar2_table(503) := 'F9408C7887A7CFE3BD7C9372B24F70CF7D7C37AAD2BEDEEE2DCC72A75CBA72A0A6AD3972523087E53258BBD909E1B9E51FCF0008EDBB437A771B92E17649E6638D0F88AA879B9AD11FABE9361FDBC06667909595EA9712F7D9344CECC961A975B377E040';
wwv_flow_api.g_varchar2_table(504) := '788CE594D2D543F584D6D8455FB2F891F9D8F77E807F8002CD9BA7618EF33585326D4749C94CE4366857D001EDC4A79E9613910786A13E0008A1822BACA3DA6887B965B0B9B4C49EBA212F1A26308479F5BA41C921CFC8199EE17FD1308C9E4503D16DFF';
wwv_flow_api.g_varchar2_table(505) := 'F6BB5AEDC9212FAF72DBF4DB22840C11CA1F2CECDF628D5F62F359E409F37A11439DAC085F25EC64C6AB673828A79E67279DF413B8FDEFC02A486945174110044110044110044110C492A8AABA7AFDE6356B37ADDA9509686A6E69402CA10B255E73DBA3';
wwv_flow_api.g_varchar2_table(506) := '082DD119A8425B82786760B057FA2D142FECF50A7378FF77C280D29503DC2973532B9EFF22AA751FDF15823BD33FD5B435474E0AE6B05CC65F0F1FE3AEED3E9964B333BCAC239CDEDDE6E9F3DC2E19F10E1CB0C60784108E925AD8BFC59E1C12DCF3B49C';
wwv_flow_api.g_varchar2_table(507) := '7E6667D4AD71B993DBA6883CA842EB6AC5817C6C4369E828E2C209B026BEAF299411DDC777904000CA44027E944B7F77D529E4EF17F83005F39AC2206D995B681B74E075B1A6F943577538C8437D00308713B8C23AAAADD7E1452D8A77C0048630AF5E37';
wwv_flow_api.g_varchar2_table(508) := '2EB91ABF51CC81FF40826261E8B72ED55F38B895CD3DC0DA7D360D9FE6CDD3284D8608E5EF6FD3499C642FB2D6C4A079FD84577C59B39C50EB2AC2B18B7EAB33E3354BABE7399440754A2BBA088220088220088220088220964455D5D5EB37AF59BB69D5';
wwv_flow_api.g_varchar2_table(509) := 'AE4C4053734B0362095D28F19ADB1E456889CE4015DA12C43B0383BDD26FC1887778FA3CDEBFF1643EB6C155EF0B21D87C56FFE6CF216D69E81FDCB5B86B5BBFF6E364486B8E9C14CC61B90CD685835BD98BACF05CE131373B0189DEDD86B8DC2EC9D0D6';
wwv_flow_api.g_varchar2_table(510) := 'F800A2384A4A06751EA684E06CEE010C436EEDC9619CE4659DCDA52BE414A4815888B8B07F4BE1F0B64A02D7FF89DCBC85D9E2B79F4785E5C405582107FDCCCE50C985A37FAC34A7FF4B04E2A666C4FF1A15167BF754A71DAA22D401F7D9B4E09E7DE76A';
wwv_flow_api.g_varchar2_table(511) := 'A89C501F00CCE104AE6A6AEB753874A730F14BEB6EAB5E97AE1DA9597214F894FD945B74D59EBA81FC3DED79C8679046B06D90BFD11FE39651B39C50EB2A031649B89C388F1162B333FAB79FD7F36C8D5DF487677646CEA4D6D5EA15E68294967F110441';
wwv_flow_api.g_varchar2_table(512) := '1004411004411004412C89AAAAABD76F5EB376D3AA5D9980A6E69606C412BAC80EEFD8DD2E397E5B174A5CAA7A14A1DDEE0E548359A1253A1B7B2388FF0518EC957E0B46BCC3D3E7F1FEED27F5333B3D2D27F0700F0B3697F6F22A2FEBE6F513D05A13DF';
wwv_flow_api.g_varchar2_table(513) := '43FE1F76EAF7B78DFA0EE0B8FF183FBAE389755305EE9DB455B285BCC546DA1E0D290F511F554CEA5CB44C4843A8D9932D0F528D6408E890BA090FD6C2A86CA0C0D8D8BA85C851513BBA96DA78ED87FEA049935C9CE4FCEBF6719C5DDD730B666A77D87A';
wwv_flow_api.g_varchar2_table(514) := 'BFF552E57C7DFEDEAFEFB7DD2FBDCDD68D6AEB7AA5535F6D5DBBA85F6D7E70D46F3574B037CFF6E289EE91EDE6D687C7BAD3BEFCA49EB7E3D57BA7DE2EBFA993342A8BBB27D56FD7AEEBF13A7FFFC5ACBDB0BFBD7AAD3BBE78A27FBC593BA33FD77F7BB7';
wwv_flow_api.g_varchar2_table(515) := 'D3B8F8F7ED336FB56E54F4BA9AF2C95D07578F3CAED7D9BDF2FAAAF7C99FBDB3EFB66EFE7BFBA313DD53AF48F3B3253DB879F96CF7AE57A47EF29783836BCF3F11BAECD09FFD4F401F57A7E9F9ED56F3F37FE9248D6AB975FD929E2BF41C94FE5C27D1A9';
wwv_flow_api.g_varchar2_table(516) := 'F473F72297AFE835EA65372E2DBAAF3DD37FD7A127DCFF4E75429D5627EFFF7CAF5B1E7CE93A67EF1EF575EB677DB9FAABF6C6CAC6EB3FD76FDDDF3FDDD95CD37BD1BBF0CEFFA553BFD53D78E714FAAD4EDB3B45E3D305EFE3B7DBB7AEEE3CF0F33AAEC7';
wwv_flow_api.g_varchar2_table(517) := 'E802E8BFD940EFD1E954DD33EED0FB5D3F7A40DF940EF72E589FBF3EC34E63ABFECE73FAF0EF35B3FBEACFBA97A70FED66CD3BF7BE2EA4CEF646F048877F110000000000E02B898861671F4A6662F96A206E26BEC48F4EDDF4435D38DEFBAA7021FCCD8D';
wwv_flow_api.g_varchar2_table(518) := '533FF9F2D980074117F6D7DD0B1BC79F6DAF7FA1FFDE9723D75ED8DFB870BAB3BDE1FB9DEE4E6835DA2B12FCA47E6AAE7DEB73BFDDDAD9251D3DCC3BF7BE8E6F7E70548F6CDDA8F60E5B3FF6E3F6C64A7BF59ACED6FDF3E527F5BC1DAFDE9B67BBFCA6FE';
wwv_flow_api.g_varchar2_table(519) := 'B851590C4EBAF9A7973A4D4F67DB38F98B6070EBC3637EBBA9F3E86CFD57B8F9EEAFBB076FAD6FFDF577ADE5CB7EA7DDBD94A6D7BC7C6EFD3707D67F7B6870B0775FCDDA191DD9B9F076DBBD597FE7B9B5E79F685E39B77B3BED56EBFA25F70FCFDE7570';
wwv_flow_api.g_varchar2_table(520) := 'F0B2437F869E80DE51DB5DEE3DC34E63AB515D5A3DF278E83928FDB91EA053FDF7572FEA7D754FEB2EBBAF4CDD71D777CEDFFF4E75429D5627EFFF7CAF5B1E7CE33AE7EDFFF8F4B08D15EFECA9DE8BDB7D11FF7875673DF87A6DDBE53FF69F425F4DEB8B';
wwv_flow_api.g_varchar2_table(521) := '5AF7365B8DADD3AFE8FC9DFA6A776134B6BC8FDF0EDD6CA0F7E8FAEB4DB8FAABC9C685BF75BCCDDD2BB975B5FED691DD8577EF99F598DD47DD6A343E5D687EB674E7231DEA45000000000080AF2422869D7D289989E5AB81B89900469A2EECAFBB17DCD7';
wwv_flow_api.g_varchar2_table(522) := '9EE96C6FF8C3A547EAF191EF5F0000000000008C161131ECACB93713CB57037133018C345DD8916F2E0000000000002044440C3B6BEECDC4F2D540DC4C00234D1776E49B0B000000000000081111C3CE9AC94C2C5F0DC4CD0430D2746147BEB900000000';
wwv_flow_api.g_varchar2_table(523) := '000080101131ECAC99CCC4F2D540DC4C00234D1776E49B0B000000000000081111C3CE9AC94C2C5F0DC4CD0430D2746147BEB900000000000080101131ECAC99CCC4F2D540DC4C00234D1776E49B0B000000000000081111C3CE9AC94C2C5F0DC4CD0430';
wwv_flow_api.g_varchar2_table(524) := 'D2746147BEB900000000000080101131ECAC99CCC4F2D540DC4C00234D1776E49B0B000000000000081111C3CE9AC94C2C5F0DC4CD0430D2746147BEB900000000000080101131ECACF9C8A3B17C35103713C048D3851DF9E6020000000000004244C4B0';
wwv_flow_api.g_varchar2_table(525) := 'B3E6C3E958BE1A889B0960A4E9C28E7C7301000000000000212262383973CFBE58BE1A889B0960A4E9C28E7C73010000000000002122623839F35B3FD8F75D604C7C27F37D5DD8916F2E0000000000002044440C27677EEF90E5A4817191D2851DF9E602';
wwv_flow_api.g_varchar2_table(526) := '0000000000004244C470728F1E9CB79C34302E52BAB023DF5C000000000000408888184EEE70A1603969605CA4746147BEB9000000000000801011319C5C61EEA0E5A4817191D2851DF9E6020000000000004244C470727307B3969306C6454A17F6C543';
wwv_flow_api.g_varchar2_table(527) := '8F00000000000000DF2822623839D3DA6B3969605CA47461FB444444444444444444DFB044C4B073E69E6F5B4E1A1817295DD851EF2D2222222222222222A2702262D839F3E1B4E5006323A50B3BEABD454444444444444444144E440C3B672633969306';
wwv_flow_api.g_varchar2_table(528) := 'C6454A1776D47B8B8888888888888888289C881876CE4C662C270D8C8B942EECA8F716111111111111111151381131EC9C99CC584E1A1817295DD851EF2D2222222222222222A2702262D8393399B19C34302E52BAB0A3DE5B444444444444444444E144';
wwv_flow_api.g_varchar2_table(529) := 'C4741E339319CB490FEBA9D7CFAF7ADEE65DB9E78F4F4F0C3F15F040A4746147BDB7888888888888888888C28988E93C66EED96739E921CD945D7FF99FC5D27B77F1D155CFF72AA5E989A167031E80942EECA8F7161111111111111111513811319C9C39';
wwv_flow_api.g_varchar2_table(530) := 'F194E5A487345376FD5A71607C72FFD33FFDA1333955AA79BE57294D4F0C3D2170BFA5746147BDB7888888888888888888C28988E1E40E170A96931ED24CD9F56BC581F162C5771766F5C3E454A9E6F95EA5343D31F49CC07D95D2851DF5DE2222222222';
wwv_flow_api.g_varchar2_table(531) := '222222220A272286939B2B4C5B4E7A483365D7AF1507C68B15DF5D98ED7D9E9C2AD53CDFAB94A627869E16B87F52BAB0A3DE5B444444444444444444E144C470727385C396931ED24CD9F56BC581F162C5771766833F27A74A35CFF72A6FE4879FF9B6D9';
wwv_flow_api.g_varchar2_table(532) := 'A575DFAF9C1CFC6A7EC1BD7DF1EBE5F9DE91A1BAE3FFC349313E52BAB0FF8FDB88888888888888888868A844C4B073870B05CB490F69A6ECFAB5E2C078B1E27B95D3EF154B3BDE78E9803359BCE2AF97E7879F3970A2E6576AB5F0596697D6FDFE09E717';
wwv_flow_api.g_varchar2_table(533) := '6A4BFF619F7E5ADB48EF008EBF9F99DC060A2B7B2CB3A0A1587112474D0F3DE4BC6FA04B61CB9E0A39EAE0935E45D5835060A1A75E9AC2F856F66498C383A050289AE05AF8CFD3C9BF5DAFE24D27E065C2E4F3E14B90C68F9EC9E1F79BFEF0D74515EB1B';
wwv_flow_api.g_varchar2_table(534) := '5FF559376A06BBEBDD02000000806D218464F7617AF0FB2C2F5A362DEB582DDF7BFE74FAB7D5FA6CB379D3BFFE3ECD8B7915D7E5ACFDCDEF5A9EC66AFEEADFFAC5F1CD87F174F1F3BF5A54B13E997EF4BBD4CB46CD6077BD5B00000000B02D8490E40FD3';
wwv_flow_api.g_varchar2_table(535) := '6C37CB8B964DCB3A56CB3627E7555C97B3F637BF6D51BDB9FF273F6F1ED627D30FFFEAC307F419356A06BBEBDD02000000806D2184247F98FEEACB2C2F5A362DEB582DDB9C9C57715DCEDADFFCC3AF4E17AF3F2FAA589F4C5BBEF4C6617DF68D9AC1EE7A';
wwv_flow_api.g_varchar2_table(536) := 'B700000000605B0821C91FA65FFC3ACB8B964DCB3A56CB3627E7555C97B3F637BFEAF8641DABF9DBAFCBD358BF386EF7D24515EB93E947BD4BBD6DD40C76D7BB0500000000DB420849FE30DD196779D1B26959C76AD9E6E4BC8AEB72D6FEE6B7976F79F3';
wwv_flow_api.g_varchar2_table(537) := 'AE4515EB93E9077EFB7F0FE8336AD40C7617FB04000000001F124248F247E9CE38CB8B964DCB3A56CB3627E7555C97B3F63767F9EC451D4F17379E1C9FAC63357FF579791AEB17C73FFFDB4515EB93E947BC4B3D6ED40C76D7BB0500000000DB420849FE';
wwv_flow_api.g_varchar2_table(538) := '28DD39C8F2A265D3B28ED5B2CDC97915D7E5ACFDCDD9F1C93A56F39F3C9CBDA8E3E9E2DD7BE3DBCF6FFF549D4C7F38B9A8627DE3AB3EEB46CD6077BD5B00000000B02D8490E447E9CE4196172D9B9675AC966D4ECEABB82E67ED6F6ECEBF7FF3ABD7D527';
wwv_flow_api.g_varchar2_table(539) := 'D3375F8F4FD637FEF3A78B1B2717D58FC7F4B9376A06BBB3A502000000809F114248F2A374E720CB8B964DCB3A56CB3627E7555C97B3F6374B77D4A819ECAE770B00000000B6851092FC28DD39C8F2A265D3B28ED5B2CDC97915D7E5ACFDCDD21D356A06';
wwv_flow_api.g_varchar2_table(540) := 'BBEBDD02000000806D2184243F4A77EF6779D1B26959C76AD9E6E4BC8AEB72D6FE66E98E1A3583DDF56E01000000C0B61042B2F728DD39CCF2A265D3B28ED5B2CDC97915D7E5ACFDCDD21D356A06BBEBDD02000000806D218464EFD1BDDD07595EB4ECAB';
wwv_flow_api.g_varchar2_table(541) := 'EF56EDEEDE6CCE62F8EEEBF6374B77D4A819EC5F767300000000E0E3851092BDA37BBB0FB2BC68DDD3AFBE7DF6CD9F5AF4EDD7871F71AD74578D9AC1EE7AB700000000605B0821D93BBAB7FB20CB0BA92F8D9AC1EE7AB700000000605B0821D93BBAB7FB';
wwv_flow_api.g_varchar2_table(542) := '20CB0BA92F8D9AC1EE7AB700000000605B0821D97B9CEE1C667921F5A55133D85DEF16000000006C0B21247B8FD39DC32C2FA4BE345AAD569BCDA6EBF502000000801F9D9F9FAF56AB64EF71BA33CEF242EA4D2F5FBE6C663B00000000C02763B55ABD7C';
wwv_flow_api.g_varchar2_table(543) := 'F932D97B9CEE8CB3BC907AD3D5D5D5E5E5E5C5C5C566B3393F3FFF2F0000000074E4FCFC7CB3D95C5C5C5C5E5E5E5D5D257B8FD3C138CB0BA9375D5F5F5FBD76F9DA050000000074E4F2B5ABD7AEAFAF93E1241D8CB3BC907A538CF1FA9D2B00000000E8';
wwv_flow_api.g_varchar2_table(544) := 'D4F53B31C664384907E32C2FA4DE14DFB906000000804F407C27194ED2C138CB0BA9374500000000F82425C3493A18677921F5A6AEB70A000000006E970C27E960FCE5F837526FEA7AAB00000000E076C970920EEE677921F5A6AEB70A000000006E970E';
wwv_flow_api.g_varchar2_table(545) := '27E9E07E9617526FEA7AAB00000000E076E970920EEE677921F5A6AEB70A000000006E970C27E9E07E9617526FEA7AAB00000000E076C970920EC6595E48BDA9EBAD0200000080DB25C3493A18677921F5A6AEB70A000000006E970C27E9609CE585D49B';
wwv_flow_api.g_varchar2_table(546) := 'BADE2A00000000B85D329CA483719617526FEA7AAB00000000E076C970920EC6595E48BDA9EBAD0200000080DB25FB4FD2C138CB0BA9379D9D9DAD56AB00000000009F8CD56A75767696EC3F490707595E48BDA999ED8B8B8B08000000009F8C8B8B8BD5';
wwv_flow_api.g_varchar2_table(547) := '6A95EC3F490707595E48BD2984D0F57A01000000C0B61042B2FF241D1C6479D1B63FFCE5FBFF6C3667B7567FFFE76787EDAF927E999AC1EE7AB700000000605B0821D97F920E0EB2BC68D9B4ACE3BFFFB97CFED75BFAC76A1337A7CF9F1DB6BE4DFA256A';
wwv_flow_api.g_varchar2_table(548) := '06BBEBDD02000000806D218464FF493A38C8F2A265D3B28ED5F2BDE74FBFFAF68FBFCB9F7EF3BCDAC4CDE9F36787AD2F94EEBA5133D85DEF16000000006C0B2124FB4FD2C14196172D9B9675AC96EF3D5F9EC6FAC571F3E1E937CFAB4DDC9C3E7F76D8FA';
wwv_flow_api.g_varchar2_table(549) := '4EE94E1B3583DDF56E01000000C0B61042B2FFDBF48BFFB1537FA171547B1CC0F725E08B0F792945917D914077A80813DC3BC8E06D6E66BA554445A4B97BDBB52D06FF805729A5FB502D080DFA202E120A5D68BC888862455649DC40E1B2E015B9012748';
wwv_flow_api.g_varchar2_table(550) := 'C3E2435D1CE951B74B29DD716B96D07CEFEFB86BD2DDA4ED491AD96BF2FDF065993973E677CE19CED994EDFA86C90511C2E28AF66205D1CC78EB3A736C3A6CA259997EFD51E3B20CB371F16463F7FA6C11111111111111111175534A25FEBAD77252B6EB';
wwv_flow_api.g_varchar2_table(551) := '1B261744088B2BDA8B154433E34BB79963D36113CDCA6747CD2B2F677CB60E54A63A1A0BE1F5130F0BEB28CB6C9578B2B17B75A68888888888888888886E442995D8B5D77252B6EB1B261744088B2BDA8B15342B5FFDBB38FD5B3EFBD73FDD4CF102EA41';
wwv_flow_api.g_varchar2_table(552) := 'DEBCF2520A212A61D8358A342E55D3734058587B65666BC4938DDDEBB3454444444444444444D44D2995D8B5D77252B6EB1B261744088B2BDA33B9FFFC54BFDA6CB672F1BF39D72F84A80779F3CABFA7584158D0BFD1CCF8727B67B5FC4CD4F19461AE8B';
wwv_flow_api.g_varchar2_table(553) := '271BBBD7678B8888888888888888A89B522A3134623929DBF50D930B228445939E8510F5206F5EB99DA9B055BFEBF5CEDB6205D1CCF81A2B335B259E6CEC5E9F2D2222222222222222A26E4AA9C4D0DF2D2765BBBE61724184B068D2B310A21EE4CD2B2F';
wwv_flow_api.g_varchar2_table(554) := 'BD5599FAED7A2A44349B5BAD9A9EC3758F18A6339E6CEC5E9F2D2222222222222222A26E4AA9C4DFD29693B25DDF30B920425834E95908510FF2E69575C667EB080BEDDB6205D1CCF872B565D16C6E4D6599AD154F3676CF0E151111111111111111D10D';
wwv_flow_api.g_varchar2_table(555) := '28A512C3FFB09C94EDFA86C90511C2A249CF42887A9037AFDC2EDEE5F7B1D6518DD9AAF16463F7E23C111111111111111111DD8C522A31BCCF7252B6EB1B261744088B263D0B21EA41DEBCB2EDE6672254A6AE6B199FAD232CACB31AB365E3C9C6EEF5D9';
wwv_flow_api.g_varchar2_table(556) := '222222222222222222EAA6944A78FB2D2765BBBE61724184B068D2B310A21EE4CD2BDBE3B37584858EC6FC4C84CAD4BAAA315B379E6CEC5E9F2D2222222222222222A26E4AA9C4F03ECB49D9AE6F985C10212C9AF42C84A80779F3CAD27F65653D5C349B';
wwv_flow_api.g_varchar2_table(557) := '5B7B35660BC7938DDDEBB3454444444444444444D44D299518DE6F3929DBF50D930B228445939E8510F5206F5E996136289E6CEC5E9F2D2222222222222222A26E4AA9C4F07ECB49D9AE6F985C10212C9AF42C84A80779F3CA0CB341F16463F7FA6C6D01';
wwv_flow_api.g_varchar2_table(558) := 'D52A868630328228EAF5548888888888888888FE1C945289E18CE5A46CD7374C2E8810164D7A1642D483BC796586D9A078B2B14DCF40368B781CE5F21F79CEFE3FC84A63318C8C208A961B1B0DA4D3482651ABADB960B58A540ACF3CA38B101111111111';
wwv_flow_api.g_varchar2_table(559) := '11119101A554C27BDA7252B6EB1B261744088B263D0B21EA41DEBC32C36C503CD9D8A667209B453C8E72F98F3C67B7D26C627C1C4F3E895AEDB6EA7CFB2D9E7802EFBDB7FA5359692CA673FA341617DB8D8D06D26924934643DFBC3E1111111111111111';
wwv_flow_api.g_varchar2_table(560) := 'DD8A522AE13F6D3929DBF50DF3DCD99FCC6A379B57A1CE1E35AFCC301B144F36B6E919C866118FA35C5EEF19DA088D06D2692493A8D56EAB4EA984580C1313AB3F95956EDB86FBEED3EB3D776E3D43DFBC3E1111111111111111DD8A522AE11FB09C3DB6';
wwv_flow_api.g_varchar2_table(561) := 'EB1B27F3DCF1D78F9D30C8F1A38FAEA12CC36C543CD9D8A667209B453C8E72595FD76A4826914E637A1A3B77A2AF0F070FE2E2C5E5DB911154AB1D3D6766303484584C77906E8B8BEDB23FFF8C575FC5F6EDFAD1C00072395CBDAADB1B0DFDD6E020DE7E';
wwv_flow_api.g_varchar2_table(562) := '1BF7DCA3AF83404F40BAB52265A5F8952B78F34DFDA2B4489137DE68BF5E2AE99653A7F0EEBBFAF53BEEC0912388A2F642968A482626565FE9A79FC2B2F4425A6FB5E6D31AB4E5BBEF303A8AFE7E5DC4B6F1C107585858BDFED2479022E2DA357CFE391C';
wwv_flow_api.g_varchar2_table(563) := '477F28795DFA379BED4FF1F2CBBA45662BE37EFFFDDAFFA888888888888888883609A554C23F68397B6CD76798CD124F36B6E919C866118FA35CD6D7B51A9249DC7D379E7A0A9F7C82C71F472C86A1213CFC303EFC10A3A3FAF6F0612C2CB47BEED8815D';
wwv_flow_api.g_varchar2_table(564) := 'BBF0FEFB38750AF7DE8BFE7E7CF595AEF3E38F78E8216CDF8EB1314C4EE2C001F4F5E1F871FD62A381745AD7D9B70F57AEE8CEF23B3DADEB0C0CE0E38FF1C517989FD7F31919D183CAA3D6B8274FEACEA592BE96715F780167CEC0F7971F9D3B87B7DED2';
wwv_flow_api.g_varchar2_table(565) := 'B7478EE0EC59542A375CE9471FE9F99C3E8DC5C5F67C642DB2223137A7A7216B9115C91778E411DDF39D7774CF95F55B1F415E9722B2B41327746799924C5BBEC92BAFE8F6D6A7705DBD34C9030FE8EF59ADDEFE7F1711111111111111D19F9152CADA7D';
wwv_flow_api.g_varchar2_table(566) := 'C872F6D8AECF309B259E6C6CD33390CD221E47B9ACAF6B352493D8B9133FFCA06F2F5CC0FDF7E3AEBBF0CD37FAF6E245380E3C0F972FB77B0E0CE0FCF9769D2FBFC49D77626C4C5F9F3C89BE3E4C4EB61FCDCFE3D0A1F6288D06D2696CDB8620589E43AB';
wwv_flow_api.g_varchar2_table(567) := '510A4AD9966BD7B0B8D8BE6E4D637414CD264A25C46278E9252C2CE8475250CAB61E89D6D389895BAC54E6F3ECB37AF273731D434BCDC387F57ABFFEBAFDCAA54B181AD2AB96B5AFACDFFA08F2BA14914F242F663288A28E41E5535CFF95E49B4885A52F';
wwv_flow_api.g_varchar2_table(568) := '4344444444444444B4C528A5ACDD872C678FEDFA0CB359E2C9C6363D03D92CE27194CBFABA56433289741A8DC6F2ED638FA15ED7B7D2288FA445DABB7A8A6A158383C86470F9B2FE956B6959323181580CA5524791252B1BE7E7313585E79FD775FAFBF5';
wwv_flow_api.g_varchar2_table(569) := 'BBADB1A4825C4BB596AE69743DBDC94ACF9F8765E979CA249786BE74090F3E88BD7BF1CB2FABBF7593D1CF9CD18F26273B46FCF5573D84B477E546332422222222222222DAEC945209FFA0F597DDB6EB33CC6689271BDBF40C64B388C7512EEBEB5A0DC9';
wwv_flow_api.g_varchar2_table(570) := '24D269341AABDCCAAF5C4B8BB4773D12950A76ECC08B2F228A90C9607010D5EAF228131388C5502A751459D2D5B8B080D75E437F3FC6C6F42B7373B0EDF658722B75FEC73E1D86C651A7711CCF9B4029F8A26F8AE08B20485ECCA018A7EDDAE8141B987F';
wwv_flow_api.g_varchar2_table(571) := '346DEE4D4F2CFB62B3BE283D04CF37C51CB6DCBB5EC1378B04A18B84826F8445BD545A76C122410EAEB707DB17425AA12E4EB907E1F68225E3962E813EF71F774993490C136818997C3FFC08B3FF9979FEFF09CF63ABF5258E91B8BBCD975AB59AEEDFAF';
wwv_flow_api.g_varchar2_table(572) := '1F7DA4A74F0FB65E5ED6575ED1B7DED25F7ED9FAAD6D76EF7FE08D1B1B76EC7F973DFCF7DF0FFE69FDACFDD3000000000000F61811714CD92D049E6F08C94B02DBD869676076564746746929BEEE74B450D06251BBDD2D7EDABFF6DAAED8F5FEADB131BD';
wwv_flow_api.g_varchar2_table(573) := '776F50E7DA351D1ED68F3F8EAF2F5ED4A79ED24663706B7555DF79474747F5EEDD0D45D6241613FBDAB3D913F67F2E2EEAD090CECF0F5E4C3C99B8BBCD975A0F1FEAD9B37AF0A03EF3CC60EB5E4FCF9C899FF9EEBBC1333FFFAC274FEAC4842E2F6F517F';
wwv_flow_api.g_varchar2_table(574) := 'FDEE376FC69FFCDE7BF1C7AE97F857000000000000EC6D22E24EBEED1E3EEEF98690BC24B08D9D760666677564449796E2EB4E470B052D16B5DBDDE2A7FD6BAFED8A5DEFDFDABF5F2727F5CB2FF5E2457DFA691D1BD37BF7E227DB6D7DF1C578C5AE5FBB';
wwv_flow_api.g_varchar2_table(575) := 'A6E572FCE4871FEAA3471B8AAC595DD577DFD5E161FDE003BD72257E3D08E2D73FF9443FFF5CA7A7F5C081C1311617756848E7E7072F264ED86AE9C1837AE4887EFAA9361ADB7D69DFDDBBEABA71C1B5F3DCBC19EFFBDC737AF972FC5D274EE8BE7DF119';
wwv_flow_api.g_varchar2_table(576) := 'FA12F5D7EFFEF0A19E3D1B97B2AFD817EDC92F5C88D76FDFD6D1D1C1BFE2EBAF1FAF030000000000EC4922E24EBEED1E3AE5F98690BC24B08D9D760666677564449796E2EB4E470B052D16B5DBDDE2A7FD6BAFED8A5DEFDF3A7D5ABFF8429F7F5E8787F5';
wwv_flow_api.g_varchar2_table(577) := 'D429FDE187C7657FFC51CF9CD103077468483D4F3FFB4C57579345D6BB73472726E287DF7C53EFDFD766538F1E8D7FDAC56FBF7D7C8CC5C578717E7EF056E284768B4A25DED4E6EAD5EDBE744DAD161F7EFD796EDD8ABF65DFBE78FDF871BD71431F3D1A';
wwv_flow_api.g_varchar2_table(578) := 'DC4AD44FECFEE0417C7774343EE1B3CFEADCDCE0936FDF1E14B4EB2FBCA0D5EA601D000000000060EF1111C794DD93B39E6F08C94B02DBD8BB3B399D8E160A5A2C6AB7BBBB1B010000000000204744C431E5D7CF553DDF10929704B6B17777723A1D2D14';
wwv_flow_api.g_varchar2_table(579) := 'B458D46E777737020000000000408E888863CA7FABD53CDF10929704B6B17777723A1D2D14B458D46E777737020000000000408E888863CAB5CBE73CDF10929704B6B17777723A1D2D14B458D46E777737020000000000408E888863662E9FFBC3C4893F';
wwv_flow_api.g_varchar2_table(580) := '12928F1C9F3A651B3BEBD9020000000000009244C43125F7A571CF3784E425816DECAC670B000000000000481211C794DCC3AF79BE21242F096C63673D5B00000000000040928838A6E4168CE713929B04B6B1B39E2D0000000000002049441C53728FBE';
wwv_flow_api.g_varchar2_table(581) := 'E1F98690BC24B08D9DF56C010000000000004922E20433EED1373CDF10929704B6B1B39E2D0000000000002049449C60C63D32E1F98690BC24B08D9DF56C010000000000004922E20433B55ACDF30D217949601B3BEBD9020000000000009244C43133AE';
wwv_flow_api.g_varchar2_table(582) := 'F7AAE71B42F292C03676D6B3050000000000002489886366DC97C63DDF10929704B6B1B39E2D0000000000002049441C33E38EBDECF98690BC24B08D9DF56C010000000000004922E29819F7D031CF3784E425816DECAC670B000000000000481211C7CC';
wwv_flow_api.g_varchar2_table(583) := 'B8875FF37C43485E12D8C6CE7AB6000000000000802411714CD93D74CCF34DDAFCE5EA9DFBBDDE832D13DDF9FBA5E9F4A508D99504B6B1B39E2D0000000000002049449CC9B23BF6B2E79B94A9B4225D5EAA37BED922FFFEA9A7BD76E3D274EA6A84EC42';
wwv_flow_api.g_varchar2_table(584) := '02DBD8FF030000000000007E6744C4992CD76A35CF37295369451AD637AD97FEF4D70B45BF74BE11F6B4D76E5C9A4E5D9090279DC036B602000000000000BF3322E298B2EBBDEAF926652AAD48C3FAA6F57A5BA3E69CBD289D6F843DEDB51B97A653D724';
wwv_flow_api.g_varchar2_table(585) := 'E48926B08D9DF56C010000000000004922E298B27BE898E79B94A9B4220DEB9BD6EB6D8D9A73FDEBD2F946D8D35EBB71693A7559429E5C02DBD859CF16000000000000902422CE64D93D32E1F926652AAD48C3FAA6F57A5BA3E6DCDACFD2F946D8D35EFB';
wwv_flow_api.g_varchar2_table(586) := 'ABF7D357B6590875A555FDF5BADA8CD61D34BA55D9491DB2B713D8C6CE6CA800000000000080DF2022CE64D91D9FF27C93329556A4617DD37ABDADBDF63FBFA9377ECD5757FEEC97EAFFD19556357D659B8570ED956A33D2F675B376BDD352640F27B08D';
wwv_flow_api.g_varchar2_table(587) := '9DF56C010000000000004922E298B23B3EE5F926652AAD48C3FAA6F552E51F3FAD3CE8F5FAF9EFBF2ABE590875A5554D5FD9DBF04AB51969FBFAF69B12B26502DBD859CF160000000000009024228E29BBE3539E6F52A6D28A34ACA7797221D49556357D';
wwv_flow_api.g_varchar2_table(588) := 'E58DAF549B91B6AFF7D7EB6D8D9A733BA843F67602DBD859CF160000000000009024228E29BBE3539E6F52A6D28A34ACA7797221D49556357DE58DAF549BD1E373EEB40ED9DB096C63673755000000000000C0D644C43165777CCAF34DCA545A9186F534';
wwv_flow_api.g_varchar2_table(589) := '4F2E84BAD2AAA6AFBCF1956A33D2F6F5C7EB293725C4F303DBD859CF160000000000009024228E29BBE3539E6F52A6D28A34ACA7797221D49556357DE58DAF549B91B6AFAFDDAAB7355CD84929B28713D8C6CE7AB60000F83FFBE5EFDA56B2C5F1FF4685';
wwv_flow_api.g_varchar2_table(590) := 'E44E950D8234BA5E1B5E15A75DFC621E6C932AB0CD834DF320450A17AF082E9D3A859B45C526D8902A29B4857117042A46AF4B614160ABFB0E39E4ECF13933A3B9BA8AA528DF0F4350C633E7CE9CDF030000000000000096104277FFB8B777D81F5485E3';
wwv_flow_api.g_varchar2_table(591) := '743CAFA7A3929517D3FA767C562EF9EE96B30FF37AF2FBD73FFDF7CFDB7A7AD14414C60F3C86E4D8EB8E2D00000000000000000000002C2184EEFE716FEFB03FA80AC7E9785E4F47252B2FA6F5EDF8AC5CF2DD2D671FE6F5E4F7BFE70B3F8A81D11F0CC9';
wwv_flow_api.g_varchar2_table(592) := 'B1D71D5B0000000000000000000000584208DDFDE3DEDE617F50158ED3F1BC9E8E4A565E4CEBDBF159B9E4BB5BCE3ECCD541E77F9E369183F1638F2139F6DA820A0000000000000000000080042184EEFE716FEFB03FA80AC7E9785E4F47252B2FA6F5ED';
wwv_flow_api.g_varchar2_table(593) := 'F8AC5C3206C68AC6901C7BDDB10500000000000000000000802584D0DD3FEEED1DF60755E1381DCFEBE9A864E5C5B4BE1D9F954BC6C058D1189263AF3BB60000000000000000000000B08410BAFBC7BDBDC3FEA02A1CA7E3793D1D95ACBC98D6B7E3B372';
wwv_flow_api.g_varchar2_table(594) := 'C918182B1A4372EC75C7160000000000000000000000961042B73AEEED1DF60755E1381DCFEBE9A864E5C5B4BE1D9F954BC6C058D1189263AF3BB60000000000000000000000B08410BAD5716FEFB03FA80AC72F7FFCAF4CF65F7F7DAEC31FBF964BC6C0';
wwv_flow_api.g_varchar2_table(595) := '58D11892637FDBC80100000000000000000000A03921846E75DCDB3BEC0FAAE2F1F32FBF3DFFF77F0AC66FBFFEA381580C8C558D2139F6BA630B00000000000000000000004B08A15B1DF7F60EFB830A03635BC6901C7BDDB10500000000000000000000';
wwv_flow_api.g_varchar2_table(596) := '802584D0AD8E7B7B87FD418581B12D63488EBDEED80200000000000000000000C01242E856FFDCD93DE80F2A0C8C6D194372EC75C716000000000000000000000096104277FFF1CEEE417F5061606CCB189263AF3BB60000000000000000000000B08410';
wwv_flow_api.g_varchar2_table(597) := 'BAFB8F77760FFA830A03635BC6901CBB692C7CFEFCF9E9D3A71D05FD97265FBC7841BF5FBF7E4D6BF4EFEF087D357DF84F9F3E3D7AF488E7DFBF7F4F33F457FA4DD794356686FF2BD07F69632786D19297BC342B14C5B01E1E3C78F0F1E347FFD7258C9E';
wwv_flow_api.g_varchar2_table(598) := '17D808562FBB224923992499E42F21AACDF6CCDE8C39D8F1B41E588E3809EF324E65A4898369138851FC273CBC589C3C8ABEC5CA1D2C43EA5B2B4C352DDD067C0B56E263DF693D5A88142C13B02BCCAB85B434539BD0D399BF7C57F98159BE5FC9676EFA';
wwv_flow_api.g_varchar2_table(599) := 'DD6F4ACA1F369394624B4A9546DAB31F2A75B7AC5652EBB504D360B069A28D2BE752DD30EB4088CA61B4B48C97EA96DB5BD6342A66B1108D4DBF788521BC512D84371CCDE8132E715AB1EC861453398F31A27808FB9EBFA99931FD36499BCD66254EB551';
wwv_flow_api.g_varchar2_table(600) := '166F4F61316DDF60E810DEFCF64C42C918DAB8DF4237F3696D329994E7AE7BE33E5F764B1042E8EE3FDED93DE80F2A0C8C6D194372ECA6B1A07B309D3A7452DDFC041B25D55EFA1ED2E72B3D63DA515645B4ADF55A5A61265C79523555D8BCA70A8DCEA7';
wwv_flow_api.g_varchar2_table(601) := 'E265EDCBBAA01B89853D923E8367E1F6CC8331B337630E731EE95584945F11C61CA667D046616DA70ABD169E7928793FBF9FAA9DFA569B5463ECB865AD751BD85552AAC887CF6A59CEC7A201B5E1F5289355F25B7CC0AE30AF16D23215B409BDC227A4A1';
wwv_flow_api.g_varchar2_table(602) := 'F0C0F940E04F6F8E5FA5FC6103C92B365FAA0CBE3DFB11681332A6C1103D9B798E8E68E34A3E9F7A08A4E47851A904C5D6D72BF535F55F59B25F6FCE9317BE44F648618C729F85D2E30D4733FA844D5D480BBCCF4B99878646BA56ED4BDE43FC4DBD1E8C';
wwv_flow_api.g_varchar2_table(603) := '3FCC66B312A7DAB2A631554C4D73D2B2C1306F8DA6ED59C61FBE11D112A31360EAE1A967A2696D329994E7AEF6143699F7F9B25B82104277FF6467F7A03FA83030B6650CC9B19BC64249CFDF34C16E0892AC8E8E8E74CAA2EBF0A4DCDAE72B9911FDC8F5';
wwv_flow_api.g_varchar2_table(604) := '49CE6834F22BA367D8F04CA831472D34BA5ED6B2AC6B528DC4C2332CC172C74E59961D468AB8947E391ECDBF7AF5CA4B9095FEDD94320AFF371AB9853AD167B84F5F4D7DAB8D298D1DB7ACB56E435E15F799DE97F3B1A8DB6F783D5A22ABA46AF10AF3EA';
wwv_flow_api.g_varchar2_table(605) := 'FDD026F41A657EA1D0AF5878CA7358CF9B93314A7AB30D21AFD83A5BAA34D2B33D7BF6EC7B699C56C2D221C31B3939B0038B9EB9D1CD240D5ECFB1C616E40394C8318D31DB376A2F2D9967A8FF91DF1CB9646E7FFD129D98DCE8BFD5067380F5D69D8589';
wwv_flow_api.g_varchar2_table(606) := 'B1A90BADEB6D92F92EFFE9E4E444EB992FCE93BCCBDF54CFB0105114FD7B7E7E2E4ACB6B69CB9AC694CF98A869D960B48C8BFBF743EF51F557D3F3246B2CEF66F9B4763F8EF4DD7586514208DDFD939DDD83FEA0C2C0D8963124C76E1A0BA99E5FE75893';
wwv_flow_api.g_varchar2_table(607) := '6F397F32BEC19644447FA21FBA1CE88D9243FC7A5A260DA14E689C0019390C9FCD4CEAAB496FCF7F65C934A36FED2B82CC887E52A9355F4DE4AF72777DC8A8265921AC376A2444B8FE505EAC37AB6E51583EFD9ECD6692CCB51AF50C6DE41F99869C2151';
wwv_flow_api.g_varchar2_table(608) := '93C98405D247D97CBA13889A4FA38D3E1A8DA2655194C3CBE80AE60CB4860FFCF2E54B7E6BDCDCDCE8CAA88F4DF397979722D0DBD154D59469347C4D9E976F659A4FEF75BADCFFEB0B1DF532EAB84ED508377661C3994913CBDEC18CBDA24F12FF829365';
wwv_flow_api.g_varchar2_table(609) := '8D1C5B63BC8EB79BA79FD783162E76F489C5ABDA9CD0BBA2F10AAD13ED9C464B5157F77BFD8C896BB69D2CCB9F3F9578F5578CD28C573C7CF8F0C99327513D2F91C7A294CBE1C3FB2423019E494DC61FC42EDAAC929AA22E97F101935E68993EA1F70AD9';
wwv_flow_api.g_varchar2_table(610) := '1BFDBABE350545B4164BD72D7935FA22883E018C02FDD32CAAABC25A5392B133173717F472CAC3D01FD2FBA1F40399C70B1B37EAC3D17CE8FD41DF4EA729FD744A1974A13F64A29E0EC09351CFD793D17E4C26BDC0E8779B2A365AAA3C268969B544EF15';
wwv_flow_api.g_varchar2_table(611) := 'B54EE76E08A7F4ACF11764DBE9EAD6B9DB9A1A9F346944C791F7017F9EA621632EEEB319FF4EDD579FD9B7882572B43FFB63444DE3BB3EC94E5757573EF545139AC11CC3DCA2E4C9605A65DF6DA6FA4C9F85A2EA15A732A9F8DDBB77BAABF14D4E548DE6';
wwv_flow_api.g_varchar2_table(612) := '43D1D396B8903E9BDC3D9AE244C3DCB3F96620D5A54443D23F34F4A95820BDCEF88522AE28E988857BC7D0339912B0D0A932AFD7943BA5300F0DAD22164B0ED0714D6361F95EA2289B3B8A4C12E2F352B43FF12A8DBE354CEAE8A49B259296F7075F5B4D';
wwv_flow_api.g_varchar2_table(613) := 'FAD57E6B16687F33C796F5E6CD224E1E6D638CF364D2DA42378BBA47BD28004DD5F0765CE82D79CF115235EE1B1142E8FD74B2B37BD01F541818DB3286E4D84D63C184B049A4A9DF99146AB2844E9B666F34ABB0CCA3A323731E5D1444A6993489459E09';
wwv_flow_api.g_varchar2_table(614) := '5495A4BE73C633ED9FCE578C9E493DC4FC4A8F3F764A1BACC9A8F64C228D8AF50713AB8989751D919785AEA1FA24E6781D57D68DE790A8C964A2D3B8364AD47CFAB4A604E82F4A6933F2537DB23E39FDF5E6E6462AA3F90ACD5F5E5E9AA2E69D39E5A87E';
wwv_flow_api.g_varchar2_table(615) := 'BDDC54BFBFFC65539EC39FD0CD1B9DFFFAFA5ACEA02351E4E7ED427BC7E371DE2EE50EA6D7F061B4DFEA797D80BC637BA7F5DB7DC7651CDE3727E589A82489D1C5CD241D86DCCF38A47E0EE88FFABDEC967A86AEE6F75226946572CE720DBFFF82B94826';
wwv_flow_api.g_varchar2_table(616) := '84DFBE7DDB89E9B9691EF3DEAE7DBE440E1FC334F03EC065A50E0113E6A9F88DBA6B27AD4F5F01BD0F7462BE17F5C654A0758A73A3284757315304FD5E1374515D95A482928C9D51FBC2DB891C3D1F0DC368E0F88218CD1B06298E0BFD56E4187FD07EA8';
wwv_flow_api.g_varchar2_table(617) := 'D3B5AEB6D12BA70A65A749C3F0E6CD1B6F4D9301F890A920320269EFC2002F516CB45479C4F12435F1DDA35E9A31D0423D6BA2179403BCFE42E7ABDF96A40546A7EED5864C5463C6E57C6E371AE3AF8845D849CC393372F481657BD4BE4682D6BF16926A';
wwv_flow_api.g_varchar2_table(618) := '874AFCCAA854E74333EF9F0CC6D3BC21A27D26F5543E0BA5AEDC89C59194E64C57A331516C4E18FD9D71217F98C23C2FE1A0897629D190F40F0DEFCCE7E7E7FC709310A65D3E06B5AEF48C39B029A679A75AF8FE324A2B744BFFD06859BE9728CAA93B92';
wwv_flow_api.g_varchar2_table(619) := 'C04C9ECC277FFFD61013479BA5E7CF9F1B05E6FD21FA9433E794EEDA143B096D6F6B5EF3E20B2C8157125757579D584EF6CE93496B0BDDCCBB07AD6F6453DF0845ED58FEB2CB47812F9A2B2484D0FDE96467F7A03FA83030B6650CC9B19BC682EF1C7422';
wwv_flow_api.g_varchar2_table(620) := '35BFF59BA24E54108E65DFD3EA355A8E5EAFFB40F9AE6FCE259DF20152498F7791E4EBEB6BA9EFB48BD693A27C29D41D8B99C99478BF57C37F958228374A6952AF975BA792AAAE1ABE968996F85B272727A201AD6D7306D3D8F37F75AF6E2EE89F9C9DBB';
wwv_flow_api.g_varchar2_table(621) := 'EFC78CF9FC69E513FE82F4A7C964A2DD237A06F9AFE8DCF7FCE622460F1ABFD79B32AA10F38A8C766EA907089F44F7EA724173D34C0FAF571ADDEAFF7AA7D2F6E2EDFABFF288E366929CAAA39A79FA51E2D80BB5C7F3FABB5A6CD47FBC1D5389A8248945';
wwv_flow_api.g_varchar2_table(622) := 'CD245D8A58D3E42B7D66E3EA7EAF9FA9EFBA3DEF358931A3E14CE2CD37873E84BD9E9BE6B1BC3253725281130DF04C6AF276A9EF869B0E9C94CB457DA076E945A36336935DE5EBB3D94C7F2E952ECCBC36B489D968128B1EAF5C57A95A6334AFD5E2D3A6';
wwv_flow_api.g_varchar2_table(623) := '57BB395534F3474DB030705205517297379C398CC92D997C5867FD2115590B0BA5F7877CD4FF9FFDEA778D6B3BC2FFCD16BBE9B6918A2D12D87D5709AEA22A859B4B209D0D6E022F44850B172E5CA4502D376E0421955CC56A9D801AA3F0AA0517C7A91E';
wwv_flow_api.g_varchar2_table(624) := '040C065537C33BBC6134BFF65C3DC92BADBF8F8358DD7BEE9C39F3F31B9B38B622C94B25E9E60A6CA17CB961935665ED6C59991BA51B854476B68AB9179463A9ABB92D0B3265EA272EBFB5893C2A65221D06117296D82B07B95C62721D891CD553DCDA62';
wwv_flow_api.g_varchar2_table(625) := 'F5549A48E56D93CADB96AB36FBB17D64503BE5A14A016931B70A3164EF560697266A61354A26C36A383684E49EA4C4D9D46B6129F2A024AF15145DA4BF553E33CCF650A9D6AEB01C3B0A2AD53BB83771A74E46187B11ABE1C46B5B3768DF8D4D396AA6AA';
wwv_flow_api.g_varchar2_table(626) := 'E84575B291DDB9F4CC6D8E6EAF4CE241ED57D7E17FEB30C28CE8F0F0907E3355B092D97D8A9F73BCB9256EF082C72D6BEE4E89A40A250968BB5832BADA68C9E99C5572A3776E0BA59469D7CFF60EE68B1516D6AEAC2505F6D85C50BD92618BAA24FF8AB3';
wwv_flow_api.g_varchar2_table(627) := 'C90F5D0E2329ABE24E727FD4B85DAE689FBB3440CEADC7C7C7B45F0E3EF220594E558B51B6923BF37AA5DEDAA15259529D6B0BA9FD1DB1A0FA9C543D3F3FA7B34E4E4E680FFD7DF613487FB7DB5A626F7D1AC5492430725F62A8A82DBAED2FE1034A79D7';
wwv_flow_api.g_varchar2_table(628) := 'AD49534BBE8DFC5EB7555F70C024E453BE926D5A5A803524A6313133D446BFA88322DEAEFC250DA2A63C7A4BEAD5A0AA848720878251811DA9EDDE8245D93948A91D0D53ED45CC86AB25F92A2089B747A16EBF8DA4D9A143D6AB48FFA4F0E6E4D0758DB2';
wwv_flow_api.g_varchar2_table(629) := 'F3D83A664F71FDAEE4B086AA3E2751115DCD160AD57D263F275A243C8F019583729B5B5DDDD3D7EBB5DC13F562777AAAFF7205A8F9184D5E56BDDC562DBDA6B16247668F42C2CA895C209F58256D3DAFD2F8FAD232FC9007B4C4FE43C08E6CB447CDD16D';
wwv_flow_api.g_varchar2_table(630) := '945C3DDC7868CC7AEB4D25539AC24D37F5AABD5ADAB8B2368C4A909413458BDBFA19F26D05DD25B2B3FC36BF20479AA213514CD66D6EEFB67E97FF8E4A197BF1880B499D650CB839C257AB0D7D620A9194A364CA2B47FEE56D5532479D759C3C2E8F1979';
wwv_flow_api.g_varchar2_table(631) := '912ABCEE6F1F1954D59587461442C5C664139B55E69DFC3CFB0C822E46AC4699CE8D5EAB6D4B08E535932F6B5FB5B0942148C9C83852329735927674746499AA8DE728FCEA5772671E546EF5E34E6DC32972969B863660F89A1F3E7C18D5BE6FD094AD58';
wwv_flow_api.g_varchar2_table(632) := 'B7100DE3D95D42CFDC594CA540120FF964276F5785D0A85B63A60E296767676E4E7197E7AE747C7C2C6B88A41F2D6126CB9ABC6923E5B62E18E2049405DFF5631E2D51E448F5A21E774728A54CBB7EB677F09BDF1D6261EDC6FAF56F7F4F813D3617A219';
wwv_flow_api.g_varchar2_table(633) := 'D02DAAB64059B81C866BBBEDA71B1BBA2451115DA9A7A8EA57A5C953B866AA836A39E57BF1E6BAB32A50655A4A9F7413B59F0F4D2C592FA2F6DB42DA5254F9FA878787F4836283B6D53EE572307511190049738946CE51EEE3CD2A6C645B94A7B383DCA6';
wwv_flow_api.g_varchar2_table(634) := 'EF720049EAD87DC482EC94246129AEEB1A7B113E9D49293F2151AF5FBFB606E79E6E673AF95689AA3EB543901D0FD980F25F37A864A00EA244486BF77D4F1228A8E8D51F7F42C461A43E1BADC7E56230815DFFA5607689EB60C22F1AA65A8A186D561393';
wwv_flow_api.g_varchar2_table(635) := '5435625FF4E4E4E4240F75FBAD7CD232E944FA4785D7BE726DAE824AD9796C1D8B10C9717DCDFF2609DE325ED5CDD68F529A0DB928069432F546B261B954D93D9D8F9377B1C1A3ACA1D2B91E4AF9E8465DA45E6EAB965ED358B123B32B0D5D39ED696895';
wwv_flow_api.g_varchar2_table(636) := 'B431C9C3573D480E2FAACCAA91B3A51EDA2955E92C394634617DFAF4298A87C6ACB7DE7CF3E68DD49640532A1F64D34D096C497065D8644F147B15DC2B156454ABD66F85CBBB2493AC129874FFAA838CC38D6541F66EA94392C8A352C62A2959AEBD8BAA';
wwv_flow_api.g_varchar2_table(637) := '188361170A76BF7D2EB340658495A69A8B8C34EB6EBE785EDBA5C07A65C92BDA4706CA05A9BC2C471185B03651072903921CA29AF5152B598D5F771E1D1D55669EDCD47599D4706C08C99A9994385B4E5B584A9492433A3131796651791B52DAF24E45CC';
wwv_flow_api.g_varchar2_table(638) := 'A4F22D8421A9CCC908632FA2060DE9C7899843E938E28D6EFA44EDFB064D598A553E8D06B7467697D0333765540A24F1E0722D979456AB56D65AED403F28AD5CE5EB6659B7951C15B76E984565AD3EC9C3CC86C7E5E56563022624B3255AA2C85166CF89';
wwv_flow_api.g_varchar2_table(639) := 'EBED82A6C869D7CFF60EE68B1516D6AEAC2505F6D85C903D543E8F8A2A972F59C4E4872E87E1DA2EBF951CD236F4E17AE9505CBDEE570F9532DCEC2455730F92DD5F49735FC9FE927413ABF6E43AB1B7C771B396B085B4A5A8CAD315C39153982AE6ACA1';
wwv_flow_api.g_varchar2_table(640) := '747AD25CF816F476BD5EBB6D3D729F0D1BD7057C7A952F37D48B481D988BB28F2C6555BE60035A3FCA6F13D748C85E1F85966B1379E5C1A3DF7C4D75B58D4C465E9021A78F28C05C97B11D149F517C4CDDA8D17AEADBC9F550B16749283F26C3D4C62266';
wwv_flow_api.g_varchar2_table(641) := 'D5B0158C7E5F5C5CD8807443DD7EFBEEDD3B1B8A2D934EA47F5478557259D3A9F471ED3CB68E59EF8C9523452509EE96261BF064375B615C63AA532464C0279651647E12B4BFE8F489A9E46EFE72EEB064B73E47EAE5B66AE9352D15DB46BEBD5D22A731';
wwv_flow_api.g_varchar2_table(642) := '0D55E2A8BEC6907C208FCFA49332DCC2927C554745D971DC092B898796AC4FBCB9D1B6AEC0E8DCB18695ADCACD593981F2432E62EEBD789B9B20B421B1B3D4CDBDA00C75594B5BCA82ECDD5287249147A58C357EA2BF3A485E599ADACA89C803CB517115';
wwv_flow_api.g_varchar2_table(643) := '05806DFD92BD4B77D49D1C1809ED54AEE7A3D9745123DE980B354FA5236C5BA427D4FA5515BABCBCE41EED86AB8A1C5551275EF05833AAE7366CDA43484D2E5189B3E5B485A54429399841C3AA24A9E9C41B065D6DED20A3BC6C2D66C3C96D464A1F699C';
wwv_flow_api.g_varchar2_table(644) := 'C8418D7C4F8A1DD5BE6FD0946DD6D4B75C5DDDC1AD85DDA962629976341AA859C3C6833BCAA9DBC96196CDC835C75558CE68BCD3CDBE24CCA2B2768330931CC60A4CBA98F2634BB4449163CD6E3D754728A54CBB7EB677305FACB0B076652D29B0C7E682';
wwv_flow_api.g_varchar2_table(645) := 'ECA1F2796351B5E5CEE530B2B6D35B3A8B2B4CD4D087B4055B72654B9F1A13A4347B6B4547E5BD5475529397525281DFB2106967D7927C29FECA16D296A23A5C67A7FC959ADDD83E2CA73E914E4F9A0B1F416FD7EB75D4D65DF72951B2879E9F9F4FCC84';
wwv_flow_api.g_varchar2_table(646) := '58E55B47481D48ACDBC4DD89951F4A9BDBDBB9DB22BF57F9EA82AA51BA044F8596A5DFAC396FAB12DC614D194185377F1205D5709D6F246AD46D8A4A6D0CECC87AF5C3939393AAAD12BB71409347B88568541153AA2A1265870EE5171963F65BFB44B920';
wwv_flow_api.g_varchar2_table(647) := '298CAEFE49E195FB55F91A4CFAB8761E5BC724E3B50E8AE448BBC96F9304774322F28B6BF328E4DC18B081C467A9AA3598AAE29E2E13933E777B3117EAB3B3B32A4145AC52C97EEBAA97D8AAB1D7C88A4D068C42D1BDB8445EF9279BD2D055D20E77BCCD';
wwv_flow_api.g_varchar2_table(648) := '3514FB222A2F513D4C8CCFCE559C2799B0F278D898F551E44BE5DD8ECC0FDD84CAABE546C30ED75B957B84DB47F8E1C5C5857B2F255F192DB1B3FA5C5D903EAC42D4D84B125ACA82ECDD5287249137A68C62B36E98498151240C01E78F184222479ADD55';
wwv_flow_api.g_varchar2_table(649) := 'AC42DDA5DED19299C1508B8DED7EF092BD3A221A105C16CAE7D25FBA381F1A39859E5040BA0E9A78855D326A9B443C16D52B58E257E13E971A8EADBA9683B925CE5AB891A5B829399841C3AAE47ADF6A2B5D2945C95BE416B3E1C46F2943EBE7D1895682';
wwv_flow_api.g_varchar2_table(650) := '72901A346CC0C813271E591AE2F6DDD894DD8EAFEE4242DC3A69A96324CAA5D6F5DF16D69DC483EDADD2AAEED0612BB6B5AA64A7EAEE36CBA23073CB1A1FB1B176B973684B02AA2E66FD98474B12394AF9493AA9DD224A29D3AE9FED1DCC172B2CAC5D59';
wwv_flow_api.g_varchar2_table(651) := '4B0AECBBCB1AE02B83AB6232E600F7101B87D35B416DA62E41DA5554C675A7DC00183C3B8F656575BF9D01EF212CE77F58A86DC2CE325F134CECEF796E563DA329A94E430F3712B688DCB0DF60AB7251ED70B354850D010000801D432965DAF5B3BD83F9';
wwv_flow_api.g_varchar2_table(652) := '628585B52B6B4981BDEDDC027E1178B06544330E706F411313CD4D371BBBEECF11F70A2F5FBEACE9F0ED5C792B88EC7C7A7A4A0FE96D8B901A9C0FA570D52BD305B7ADC8689083C84DD55F8DAEB945542FCB56F52072F3FDFBF7AEB9AA31E94674AFAD28';
wwv_flow_api.g_varchar2_table(653) := 'F6D0510DFBFCF97345609E3E7DFAE4C99307111B778DCAEE6E668A6ADEFB5FA6B883DC7A4DB0DC18D90A0000F0A0514A9976FD6CEF60BE586161EDCA5A52606F3BB7805F04C539EDD80800DF20EA94778BC31DE022B2F3E9E9E9AE96A37A65BAE0B61519';
wwv_flow_api.g_varchar2_table(654) := '0DF211796A5B7EF9F2E5CBB367CFB855D16F7AF2F5D500808782CAEED0C50000000080504A9976FD6CEF60BE586161EDCA5A52606F3BB70000000000000000000000000040A39432EDFA5FED77F3C50A0B6B57D692027BDBB90500000000000000000000';
wwv_flow_api.g_varchar2_table(655) := '0000001AA59469D7CFF6BBF9628585B52B6B4981BDEDDC02000000000000000000000000008D52CAB4EB67FBDD7CB1C2C2DA95B5A4C0DE766E0100000000000000000000000080462965DAF5B3FD6EBE586161EDCA5A52606F3BB7000000000000000000';
wwv_flow_api.g_varchar2_table(656) := '0000000040A39432EDFAD97E375FACB0B076652D29B0B79D5B00000000000000000000000000A0514A9976FD6CBF9B2F565858BBB29614D8DBCE2D00000000000000000000000000D028A54CBB7EB6DFCD17ABD6F5E77FFCF0BFABAB2FEEFAFCC3DF5F3C';
wwv_flow_api.g_varchar2_table(657) := '6A17858575276B4981BDEDDC02000000000000000000000000008D52CAB4EB67FBDD7CB16A5CAF2E3E0F3FFEE7ECED3F9DF5EFFF5E0D57EBB72F1E354BC3C2BA83B5A4C0DE766E0100000000000000000000000080462965DAF5B3BDEFE68B55E37A75F1';
wwv_flow_api.g_varchar2_table(658) := '79F878669E3FFED35FFFF287C5E3EFDF7EBC1AAED66F5F3C6A16888575DB6B4981BDEDDC02000000000000000000000000008D52CAB4EB677BDFCD17ABC6F5EAE2F3F0F1CC3C3F5B0F9FFFF537FAF1F8FBB71FAF86FFB353C72E72A3671CC7FF1B15A3EB';
wwv_flow_api.g_varchar2_table(659) := '948B078288089176D677EE56ED12988BCF97228DC08DE1AA80032A544C61A60A6E838AE16018C341B82210B485A6702B060479F720858A1108B67AF3ECBEB64ED6AC8D766F9681F1F7C30FF3EA9DE77D5EC9BCEF5E6DDEBC7C32B827217B8D2F07FBD077';
wwv_flow_api.g_varchar2_table(660) := '0B000000000000E8534A8D26537B7CE2B8C1C02479ADCBD5CEFC6AA3EB8B99199FBF78535EE9ABCD9B974F06B725647FF1E5603FF4DD89E3D8B2AC344D1F7A23A3AAAA300C3DCF2B8A625F3D9BA689A248BE22CBB27DF5040000000000C02728A54693A9';
wwv_flow_api.g_varchar2_table(661) := '3D3E71DC606092BCD6E56A677EB5D1F5C5AC7D3C7FF1A6BCD2579B1F9E0FEF7C93F945DDBE5DB7E17516A5CCAD13F3385B6F773E679BCFEFB81D39CAF872B01FFAEEC4716C59569AA60FBD9151555518869EE71545B1AF9E4DD34451245F9165D9BE7A02';
wwv_flow_api.g_varchar2_table(662) := '0000000000E0139452A3C9D41E9F386E3030495EEB72B533BFDAE8ABCD7FFEB57A73931FFEF157F77CF55FBDCDE7C33BDF34D19BE5FBC7D9FA62D9F975B6DED6E5A6AE2F661FAE5A96BA5E2777D8851C7D7C39D80F7D77E238B62C2B4DD387DEC8A8AA2A';
wwv_flow_api.g_varchar2_table(663) := '0C43CFF38AA2D857CFA669A22892AFC8B26C5F3D010000000000F0094AA9D1646A8F4F1C37189824AF75B9DA993F4FFEFDF3B6B9BA32F95F96B8C1A2D4DB7C3EBCB3335B6F75B9F8F8BED2ED96DD97A5AED7C9F05DC8F1C797837DBF1B11C7B1F55E9665';
wwv_flow_api.g_varchar2_table(664) := '325355551886BDC9B6324DD3A669A2286A7F2A8AC2F33C59220BDBB1FC240353DF363435B24426E5511A9A8129EBBD9859254DA495592E9BCAD6E6D77661FB1AED5B19B716BF7EFDBAFBE6DD25EDBBB59FF0EAD5ABEEE7030000000000E01E9452A3C9D4';
wwv_flow_api.g_varchar2_table(665) := '1E9F386E3030495EEB7235A47251EA6D3E1FDED971571BAD37CB5B7F9A5FD4F5C52C7066EBAD2E17DD9F96A5AED7C91D7621471F5F0EF65DEF42D3345114591D59961545E1799EF5219997FA388E659CA669BBD0CC9B2561185655B5BB5C1ECFCECEDA47';
wwv_flow_api.g_varchar2_table(666) := '592E4BE4DFDE166679F7F5E451267B6566B97993EE16B2EF6EBD94DDBA9779F3DD7AF928F9B4DE27986F040000000000C0FD28A54693A93D3E71DC606092BCD6E56A48E5A2D4DB7C3EBCF37566EBEDF57B958BDDF97A9D5C8FE717B5DE2C3B3F2D4BFDEE';
wwv_flow_api.g_varchar2_table(667) := '27424C7C39D877BD0B59965996E5795E5114ED649AA632194551D334BDC7388E652C33329619194B07A991E5D2240CC3AAAACCD8F4944799344BA4CC2C977F7B6DBB4BBAAFD72E37BBB4CBCD7C5B6F5A992D7A9F26FDA5D8BCAA29E8F66C6B9A1B32303D';
wwv_flow_api.g_varchar2_table(668) := 'CDFBB4FB020000000000E0D7504A8D26D32FC613C70D0626C96B5DAE86542E4ABDCDE7C33BFF926579FD729D5DBAADFA2F20C5F53AB9C72EE468E3CBC1BEEB5D48D3D4B2AC388EBB93F22893F29379CCB24C1EA3286A9AA6FD49C6322363F9556A8AA2F0';
wwv_flow_api.g_varchar2_table(669) := '3C2F0CC3AAAABAE35E5977BBEE582AA5BE2D6B9979E9263DBB4BCC16D687E4D7B64F4B76BFBCBCEC36E9BE9269D865CABA9F709F3F31000000000000E8504A8D26D32FC613C70D0626C96B5DAE86542E4ABDCDE7C33B7F98F945DD2E5F6DFA2F5E5FCCDE';
wwv_flow_api.g_varchar2_table(670) := '572E4B5DAF937BEE428E32BE1CECBBDE852CCB2CCB0AC3B0AA2A792C8AE2EDDBB7699ACA6414454DD3C864F7318E6319CB8C8C65C68CDB1AD3479A789E67C66D996CD4964993DE582AA5BE2D6B9979E9263DBB4BCC16ED7CCB1474F792DD2F2F2F4D73F3';
wwv_flow_api.g_varchar2_table(671) := 'AA66AD29EB7D69ABFB0977FD2F050000000000408F526A3499DAE313C70D0626C96B5DAE86542E4ABDCDE7C33B7F74A365A9EB75F2B1CE3BBF92CF3EBE1CECBBDE85AAAAC230B43AB22C2B8AC2F33CEB43322FF5711CCB384DD3766C9C9D9DC91269250D';
wwv_flow_api.g_varchar2_table(672) := 'CD72336E9A268AA276B92C94B12CEC8DDBD73065BDD7936ED2B3B7A4BBBB905D642F53B03BDF2B6EBF68F7F3CDA7753FA13BFEF57F7C0000000000003E434AA9D1646A8F4F1C37189824AF75B91A52B928F5369F0FEFECCCD69B5FEAE717F5BBE5B7F459';
wwv_flow_api.g_varchar2_table(673) := '96BA5E27BB6342AEE3CBC1BEC775689A268A22EB86E7794551C86455556118F626451CC73293A669B746FECDB24CCA64209352DC8EDBE652204B64A18CA5496FDCB632652D33DFBE407749FB3286EC227BB57DE4F1A79F7E6AE7BBDF28F3DD57EA7E69FB';
wwv_flow_api.g_varchar2_table(674) := '69DD4FE88EEFF917070000000000E0F3A6941A4DA6F6F8C471838149F25A97AB21958B526FF3F9F0CE8EBBDA74DEEDDDDAD97AABEB8BD92D959BE5CD7859EA7A9DDC611772F4F1E5601FEC52010000000000001FA1941A4DA6F6F8C471838149F25A97AB';
wwv_flow_api.g_varchar2_table(675) := '21958B526FF3F9F0CE84EC29BE1CEC43DF2D000000000000A04F29359A4CED4781E30E4D92D7BA5C0DA95C947A9BCF877726644FF1E5601FFA6E010000000000007D4AA9D1E9D47E1438EED02479ADCBD590CA45A9B7F97C786742F6145F0EF6A1EF1600';
wwv_flow_api.g_varchar2_table(676) := '0000000000D0A7941A9D4EEDF189E3060393E4B52E57432A17A5DEE6F3E19D09D9537C39D887BE5B000000000000409F526A74FA8D3D3E71DC60609EFDF8F3B0DE57578D563F3E1FDE99903DC59783FDB03707000000000000B83BA5D4E8F4CFF63870DC';
wwv_flow_api.g_varchar2_table(677) := 'E1397FF6FDCB177F1B90EF9F3FB9435B42F6155F0EF6A1EF16000000000000D0A7941A9D3EB51FFDD17103428E25BE1CEC43DF2D000000000000A04F29353A7D6AFFF60F8E1B10722CF1E5601FFA6E010000000000007D4AA9D157CFEC2F3DC70D083996';
wwv_flow_api.g_varchar2_table(678) := 'F872B00F7DB7000000000000803EA594FDF577F66F5CC70D083996F872B00F7DB7000000000000803EA594FDF55F6CE71BC70D083996F872B00F7DB7000000000000803EA5D4E8ABEFEC3FFDDD7103428E25BE1CEC43DF2D000000000000A04F29357AFC';
wwv_flow_api.g_varchar2_table(679) := 'EDF9CB7F3A6E40C8B1C497837DE8BB05000000000000F429A5468FBFB59DDF396E40C8B1C497837DE8BB05000000000000F429A5468F9FDA5FFEDE71FFCF3EFDBC36729E011CFF7F6628340C4A739996AEA289ADB2B9B4A712DC0DBB3639F56208852D81';
wwv_flow_api.g_varchar2_table(680) := '42610F39E8A0934EFD13AA2E18190239154ADD30BE959C04037D1114128AC6B816FEF156D9AC76B7B243C7E07416EDE7C3F7A079353CD2E17D0A6953EA2D2F76DBBB0500000000EB4208497F2F7DFB5E9617D2A6D45B5EECB6770B00000000D6851092FE';
wwv_flow_api.g_varchar2_table(681) := '5EFA4E2FCB0B6953EA2D2F76DBBB0500000000EB4208497F2F7DA777EF67BF9036A39FF67FBEBCD86DEF1600000000AC0B2124FDBDB4F3932C2FA44DA9B7BCD86DEF1600000000AC0B2124FDBDFDFE3B595E489B526F79B1DBDE2D0000000058174248B6';
wwv_flow_api.g_varchar2_table(682) := 'F7F6B7DFCAF242DA947ACB8BDDF66E01000000C0BA1042B2BDB7BF956679216D4ABDD96CB6582CDA5E2F0000000078E9ECEC6C369B25FDDDFDAD34CB0B69633A393959DEED0000000000AF8DD96C76727292F477F7B7D22C2FA48DE9F2F2F2E2E2E2FCFC';
wwv_flow_api.g_varchar2_table(683) := '7CB1589C9D9DFD1B000000005A727676B6582CCECFCF2F2E2E2E2F2F93FEEEFE569AE585B4315D5D5D5D3E73F1CC3900000000B4E4E299CB67AEAEAE92FEEEFE569AE585B431C518AF562E01000000A055572B31C6647B777F2BCDF242DA98E2CA150000';
wwv_flow_api.g_varchar2_table(684) := '0000BC06E24AB2BDBBBF956679216D4C11000000005E4B497F37FDC15B595E481B53DB5B0500000000374BFABBE90F7F94E585B431B5BD550000000070B3A4BF9B667996174DFBCD9FBEFCD762717A63F5977F7C72BFF928E9FBA9EDAD02000000809B25';
wwv_flow_api.g_varchar2_table(685) := 'FDDDB4D3CDF2A26183B28E5FFD7D72F8F90DFD6DB6888BE9E193FB8DA749DF476D6F1500000000DC2CD9DE4D3BDD2C2F1A3628EB584DAE9DEF7CF4C96F7F99EF3C3EAC1671313D7C72BFF140E9CE6B7BAB00000000E066C9F66EDAE96679D1B04159C76A';
wwv_flow_api.g_varchar2_table(686) := '72ED7C328DF5D170F961E7F161B5888BE9E193FB8D674A775BDB5B0500000000374BB677D34E37CB8B860DCA3A56936BE79369AC8F86DF7EDE797C582DE2627AF8E47EE3B1D21DD6F65601000000C0CD92EDDDB4D3CDF2A26183B28ED5E4DAF9641AEBA3';
wwv_flow_api.g_varchar2_table(687) := 'E18BC79DC787D5222EA64F3F6E3E795C5DFF77D5F89BAF4647F58B93D5AF0C8FE7CFBF95D6FB3F2E1000000000DC42B2FD28ED74B3BC68D8A0AC6335B9763E99C6C5F42F9F4F0E9FF5F40FBFCE7726FF88F372D47CF2AAD1511DA707AF4E7EE571787C74';
wwv_flow_api.g_varchar2_table(688) := 'F0FCC33C56E35B0FD71B51DB5B0500000000374BB61FA59D6E96170D1B9475AC26D7CE77067F9ECD4F178B6FFBE75F077931AEE2BC1C359FBC6A7454C7E9C1EA71783C8FD5F8FA6BDF752EE545DB5B0500000000374BB61FA59D6E96170D1B9475AC264D';
wwv_flow_api.g_varchar2_table(689) := 'DE1C57715E8E9A4F5E353AAAE3F4E0C5E3641A5F7D5C353C9EC76A7CEBE17A236A7BAB00000000E066C9F6A3B4D3CDF2A26183B28ED5A4C99BE32ACECB51F3C9AB4647759C1EBC72323C9E7FF34FAB71BE76F8DF27D2AAD3D3D3D96C1600000000E0B531';
wwv_flow_api.g_varchar2_table(690) := '9BCD4E4F4F93AD8769A79BE545C306651DAB499337C7559C97A3E693578D8EEA383DB8767E50C5A5173F3D3C9EC76A7CEBE17A235ADEED932F9E7EFDE9FB5FFDEEC792244992244952EB7DFDE9FB275F3C9DCD66C9D6C3B4D3CDF2A26183B28ED5A4C99B';
wwv_flow_api.g_varchar2_table(691) := 'E32ACECB51F3C9AB4647759C1E7CE757CF670E8FE7B11ADF7AB8DE884208CB1BDEFA96499224499224492FFAFAD3F74308C9D6C3B4D3CDF2A26183B28ED5A4C99BE32ACECB51F3C9AB4647759C1EFCAF5F1F1ECF6335BEF570BD112D2F76EBFB25499224';
wwv_flow_api.g_varchar2_table(692) := '499224AD154248DE7B98BEDDCDF2A26183B28ED5A4C99BE32ACECB51F3C9AB4647759C1EAC1E87C7D39743BEF9EAF9CCE1F13C56E35B0FD71BD1F262B7BE5C922449922449D25A2184A4F830ED74B3BC68D8A0AC633569F2E6B88AF372D47CF2AAD1511D';
wwv_flow_api.g_varchar2_table(693) := 'A7072F1E27D3F8D2CB81C3E379ACC6B71EAE37A1DEF262B7BE5C922449922449D25A2184A4F830ED74B3BC68D8A0AC633569F2E6B88AF372D47CB27447F59617BBF5E592244992244992D60A2124EF3D483BF7B2BC68D8A0AC633569F2E6B88AF372D47C';
wwv_flow_api.g_varchar2_table(694) := 'B27447F59617BBF5E592244992244992D60A2124C583B4732FCB8B860DCA3A5693266F8EAB382F47CD274B77546F79B15B5F2E49922449922469AD1042523C483BDD2C2F1A3628EB584D9ABC39AEE2BC1C359F2CDD51BDE5C56E7DB9244992244992A4B5';
wwv_flow_api.g_varchar2_table(695) := '420849F1ABB4D3CDF2A2611F7D368B8D2C16A7317CF671F3C9D21DD55B5EECD6974B9224499224495A2B8490F476D2B7BB595E346EE7A34F9E3CFE7D833EF9F8FE2DC64A77556F79B15B5F2E49922449922469AD1042D2DB493BDD2C2FA44DA9B7BCD8AD';
wwv_flow_api.g_varchar2_table(696) := '2F97244992244992B456082179F783B4D3CDF242DA947ACB8BDDFA72499224499224496B851092773F483BDD2C2FA44DA9B7BCD8AD2F972449922449D27FD8A9DF1F278E3380E3FF8FCD3BCBF7CE2F0E7BAD53FB92BE88CE27DE25E255752F5AB5AAD448';
wwv_flow_api.g_varchar2_table(697) := '89AC5EF2A24A1B511429A2BD1E25224D820B754A4843E1023955C49804B890C06173C0706073BFF6BCF6EE7A76B78F65303E7377C2F4AA15DBEFE8A3D5F899679E99B5661618A0948A6526E2C974229505A2C290831DFAE5020000000000000628A56299';
wwv_flow_api.g_varchar2_table(698) := '8978329D486581A830E460877EB900000000000080014AA95866229E4C275259202A0C39D8A15F2E0000000000006080522A96998827D3895416880A430EF60B5C07FBD249BFED043B364990B4D06F2E0000000000005E464AA95866229E4C275259202A';
wwv_flow_api.g_varchar2_table(699) := '0C39D8C3DE858D8F5EF79BEBC173344993E4D02FEFAE702B257923BB5C0C7D27000000000000FF0F9452B1CC443C399A486581A830E4600F7B171A85BCEF58C1A6E6FB6E4B486753D4B12479BB3AE6CCA467D60772B60CEE165DAB06DA6DCE4EF707DD4A';
wwv_flow_api.g_varchar2_table(700) := '49B66A978B3BCF7DCE34000000000000EC0AA5542C938B274713A92C1015861CEC61EF42A390F71D2B78D2FCB6D3FAEA83EE9074E4E7D321C792E4EDEA9833939E591FC8D932B85B74AD1A68B7393BDD1F742B25D9AA5D2EEE3CF739D3000000000000B0';
wwv_flow_api.g_varchar2_table(701) := '2B9452B14C2E9E1C4DA4B240541872B087BD0B8D42DE77ACE049736FCC99477FAE976E0AE9C8CFDE90A449F27675CC9949CFAC0FE46C19DC2DBA560DB4DB9C9DEE0FBA95926CD52E17779EFB9C69000000000000D8154AA95826174F8EEEFDF14F806818';
wwv_flow_api.g_varchar2_table(702) := 'FDD13E39D8C3DE854621EF3B56D06DBE677F5D68CD1D0B3C1D68B7393B2D3F25F878D0B12479BB3AE6CCA467D6077206821BC7F3FAE1AD4EF14EB566F3FC916E9AF5C57B922631594B3FBA2369BD8D798D15BD74B313AF55075694487793FD41B75292E2';
wwv_flow_api.g_varchar2_table(703) := '76B9D8FDB97EF8807BABE4B79DEE8ACE95CF57A6C606D2E4297DB75A766FCC49C1CEBFB0B16C9D3E18FA670A000000000020329452B1742E9E1C4DA4B240541872B087BD0B8D42DE77ACA0D7B4DBE169E7BBD9D5775F69DFB9D21B913449DEAE8E3933E9';
wwv_flow_api.g_varchar2_table(704) := '99F5819CFEE0FAE103DEEA7D29DEBEFD8D73F59FFAD1A25DFEBBE434CF1FF1DB8ED75871AE9D71172E4A82B7FE5026F636A61FDE92B9CFAEA86B55496ECE4EF707DD4A49A6D8E5A2F4D70EEDD70F16E45DDA77AECA8ADEEA52E07BF6E54F07D2E4D9793B';
wwv_flow_api.g_varchar2_table(705) := 'BB21EB3AF36775FDB6FCF29BEB1B1FBF11FA970A0000000000201A9452B1F4783C399A486581A830E4600F7B171A85BCEF58C1E6E6562EADBEFB8A73FDCBC0F77A414993E4EDEA9833939E591FC8E90F6E7CF2A66F377C6B6DE3E3376468656A6CF59D7D';
wwv_flow_api.g_varchar2_table(706) := '6B0773FAD1A2DF3265B43BA57DE76AE0E9D6DCB1EEC67CB765FDE3775BAEA86BD5609B66978B92D0BA7034F0DAEE8DB96EBED4916A7AF99E2CEA564ABD34794ADF5B7BB07EF84077637AE986BC78EBE2F1D0BF54000000000000D1A0948AA5C7E3C9BD89';
wwv_flow_api.g_varchar2_table(707) := '5416880A430EF6B077A151C8FB8E15F437DFB3BF2EB4E68E059EDE14762C49DEAECEFAFBAF79AB4BBED36C9C78AB173467263DB3DE9DB83235D65EBC2265A4ACAE55ACCFFF20091B9FBCE9DB8DE09966978BDD8DC97429B2E58ABA5695AD7A2B4A3F58E8';
wwv_flow_api.g_varchar2_table(708) := 'F1ADD5EE744970172E3E5BB95BD0AD947A69F294BE447A95ED6F4E75220B1743FF520100000000004483522A961E8F27F7265259202A0C39D8C3DE854621EF3B5630D0B4DBB1B9499A24EF504AD7AA81A75B73C79E163FF196EF343DB36ECE4CCACF95A9';
wwv_flow_api.g_varchar2_table(709) := '31EB8BF73A69BE27EC6F3FEBAEEE6D2C5BA77E2FFD9EF5F75F7B3CF464EED6CB69B7393BDD1F742B25D9AA5D2EF6FACEFCD9FECA1B7FFDB56CA33F4D9ED29748AF88F3FD85CEC46B6742FF520100000000004483522AB6773C3E924EA4B240541872B087';
wwv_flow_api.g_varchar2_table(710) := 'BD0B8D42DE77ACA0BF79BA75F1B8904E7F58D2247987526EA52469FAC1C2DAA1FDF273656ACCF9EE9CCCD34B37A4BFFACEBE6E5C34CFFDD16F3BDEEA52E36FBF9167A0DDE6F9235B6ECC33EBE6CCE496CBE95AB5337176FAD93DD8E5A2F43BAFE07BBA56';
wwv_flow_api.g_varchar2_table(711) := 'E9ADBB659A3C3BDB5EBEDB4D93A7F403AFDDBA7034F42F150000000000403428A562995C7C249D486581A830E4600F7B171A85BCEF58417FF33DF787AF847436851D4B92772A55FCADDFDAE864DA0DFDB0E25B6BD2F5DB4EF3DC9FBA0B7966DDBDF96FFB';
wwv_flow_api.g_varchar2_table(712) := 'DBD3BA5691A1B6BA2E71FBF2A7B290A4B56F5F96A1F6DDF9F6BDF9DEC6648A3933B9E572BA560DB4DB9C9DEE0FBA95926CC02E17A52F13BDF5879DF7597FE85C3BE35CFF522FDF6B9E3D3C9026CFEE5BEB478BCEFCD9EE14BD7C77EDD0FED0BF54000000';
wwv_flow_api.g_varchar2_table(713) := '000000D1A0948A6572F19174229505A2C290833DEC5DD8F8E875BFB91E3C47933449DEB95AE3E4DBFAD162E0E9CE044F7BABF7ADD307BB43E607BFD0CB7703DFEB946A3BEDBBF3E69F7F2AF195A931FBD249BF654A58F876C3993FDB2955C8FB8EE59975';
wwv_flow_api.g_varchar2_table(714) := '736672CBB574AD1A68B7393BDD1F742B25A96F978B8FDFEED8AFF4839B4FF7B3A2A4EC409A3CA5DFBE73A5ADBEEF6CCFF7DAF77F30FFF2B3D03F5300000000000091A1948A6572F19174229505A2C29083FD02D7C1BE74D26F3BC18E4D12242DF49BFBBF';
wwv_flow_api.g_varchar2_table(715) := '60978BF2826EA514FA4E000000000000A24A2915CBE4E22399442A0B448521073BF4CBF5D2B1CBC52008DC4A29F49D0000000000004495522A96C9C54732895416880A430E76E897EBA563978B4110B89552E83B010000000000882AA5542C938B8F6412';
wwv_flow_api.g_varchar2_table(716) := 'A92C1015861CECD02FD74BC72E178320702BA5D07702000000000010554AA95826171FC9245259202A0C39D8A15F2E0000000000006080522A96C9ED193112A92C1015861CECD02F17000000000000304029154B8FEF193112A9EC8B7BF5E087FFBA70E6';
wwv_flow_api.g_varchar2_table(717) := 'B3136FBFFA5F1401768D21073BF4CB050000000000000C504AC5D2E37B468C442AFB827E79AAE20481234D9E8BFF619F7E5EDC46EF008CFF3F52DA946827B4B02AD41AE9B025A7F6E038E0DBC2D0C3C21E4A07BA971D0AA59768C1ED41B0D0818142CC1E';
wwv_flow_api.g_varchar2_table(718) := 'B405A153729ACB6A41229710262010F44BA06CC2E017160C036F5F7BFC4B9AD9D833715130CF8787E079ADF7D5EBF0BEF1E16DD721DA5ABE39D8AD5F2E2222222222222222A246226279BD3BF77DC70D6E55FFE46CAC55117603A71B65E77A5CA607B75C';
wwv_flow_api.g_varchar2_table(719) := '8A685BF9E660B77EB98888888888888888881A8988E5F5EEDCF71D37B8450F8E5F8CF5F8E593FEEA9FCF8FFBB75B8D684BF9E660B77EB98888888888888888881A8988E5F5EEDCF71D37B8795176AE75951E2C47FA276763AD8AF036AB4D1754BA4C6A83';
wwv_flow_api.g_varchar2_table(720) := '71A54779F4CE5969A95536B8DD1B9785B932BFE5DA2DADD8C28BE8FF9F6F0E76EB978B8888888888888888A89188585EEFCEFD7DC70D6EDAD1E95BAD5F3F3D9CFEF9E9179F7D3AFD70F84C2EF40FA78F6FB1A0E34699D265521B8C2B3DCAA377CE4A4BAD';
wwv_flow_api.g_varchar2_table(721) := 'B2C12D5E572BCC95AED24DB6441F7CBE39D8AD5F2E2222222222222222A246226279BD3BF7F71D37B85987CFE4428FBE8FA67FFEF3F98F5AFFF8E21FD3AF8E4EDFEA8BD7E9E10D179C14654A97496D30AEF4288FDE392B2DB5CA06B7785DAD3057BA4A37';
wwv_flow_api.g_varchar2_table(722) := 'D9127DF0F9E660B77EB98888888888888888881A8988E5F5EC3DCF71839BD43F391B6B5584DDCB3FD3521B553CFB36CACEF5B84C0F6EB6E674A2D265521B8C2B3DCAA3C9E7A49ABCD1FC7BC97C76176F57D960F67C982B3D379B385F796EB1CFE99AF3C1';
wwv_flow_api.g_varchar2_table(723) := 'CC4CACD24DB6347B633E9D6BA64C37964DFF9A3DB95C56AFAC599F35FB4F6BEC93B6926F0E76EB978B8888888888888888A89188589D87F69EE7B8C1E63D387E31D6E3974FFAF391B4D44615D71F787EDCBFD1B28E1B654A97496D30AEF4288F269F936A';
wwv_flow_api.g_varchar2_table(724) := 'FA9274313EFF6CDEAEB2C16430CCD5CA3626BB9AAD3628CACB45A6AF585970FEF0A018AD2CDED8D2922AC2C5EF5D3C3CDDD872DB933F67FBA9BDAE3E6BF9BBDC284EA21BFE47D1BBF3CDC16EFD72111111111111111111351211ABF3D0DEDB77DC60E3A2';
wwv_flow_api.g_varchar2_table(725) := 'EC5CEB2A3D588EA4A536AA7839D23F391B6B5584375876BAB2D265521B8C2B3DCAA3C9E7A4AA2D382846B3379AB7AB6C70CDF43057669F8DB72C06972BFFF4C3D76E69E58DC1D58D35965DF9B636CB3C76DDEB682BF9E660B77EB9888888888888888888';
wwv_flow_api.g_varchar2_table(726) := '1A8988E5F5ECBD7DC70D36ECE8F4ADD6AF9F1EAE0EA6A536AA78F5C9C36772A17F387DBCF9CA8E1B654A97496D30AEE62349A55511D65E7AF946F3416583D50FF356A6987596AAF4EABBC25C4DC7D76FA9F9A2DAC6AE3C3F2846CD7D2E7FDA44ED47D156';
wwv_flow_api.g_varchar2_table(727) := 'F2CDC16EFD72111111111111111111351211DBEBD97BFB8E1B6CD4E133B9D0A3EFA3C6F8675FA7F1D75F34068F4EDFEA8BD7E9E1662B4F8B2B3DCA57178F32A5CB64FA39A9B42AC2C5578362A4AB78F2392DB5CA06F587DDF9942A6D2C1BE6EAEAE0E59F';
wwv_flow_api.g_varchar2_table(728) := '97E3F5AEAC597BE3351B6BFE04B3CFD9B7F559F326FB59FD5DB4857C73B05BBF5C4444444444444444448D44C4F67AB6F36BC70D36A87F7236D6AA08BB9B3C6C8AB2733D2ED3838D1E9E96545AAB6C30FB33CCD5E475CBAF7499CC57567A9447D3CF6939';
wwv_flow_api.g_varchar2_table(729) := '9F32795E57F16C35337EF9FCE4E1D589BA4A9B0F0F8A919E8D377FC272EEA2E51B671B5B6CB2F913AEDFE764BC5AF95DABD3690BF9E660BFFAD3AF8888888888888888883EA844C4DE7F341C0E1D3758DB83E317633D7EF9A4DFFCEAF3B41C6B3DAEE2CF';
wwv_flow_api.g_varchar2_table(730) := 'AF9FF2FCF8CA947794547A4115E1EAB82AB2C597553A9F92965A6583D96361AE16B3CBE4EA9AAAACD462EEF26155C4B95A597351942DD75BAC597BE3E5C6C29FF809A33CBA769FF1F2912ADEFC3F8736CA37075B030000000000001F1811B1BD9E7DF723';
wwv_flow_api.g_varchar2_table(731) := 'C70DD6F5F8F48DD6557A70F5ABA8184D165359747556FFE46CACDF7C77B47EFD7525955645F8FEEBD0EEE79B83DDF6DD020000000000009A44C4F67AF6CFEE3A6EB0AEB4D4BA4CAEFDEA0F7FFBF7E9D36FFEDEBB76E237AFB4AEE2F5EBAF2BA9B42AC2F7';
wwv_flow_api.g_varchar2_table(732) := '5F87763FDF1CECB6EF16000000000000D02422B6F7C8B66DC70DD6F5F8F48D1EFFB778F2D55FFFFC978DFBEA5FA7FF19EB37DF1DAD5F7F5D49A55511BEFF3AB4FBF9E660B77DB7000000000000802611B1BD47C3E1D07183B53DF8F2DB97E7377FC7F9AB';
wwv_flow_api.g_varchar2_table(733) := '275FF637599F684BF9E6606FFFB600000000000000EF47446CAF67DBB6E30644BB926F0E76DB770B000000000000681211DBEBD9B6EDB801D1AEE49B83DDF6DD020000000000009A44C4F27AB66D3B6E40B42BF9E660B77DB7000000000000802611B1BC';
wwv_flow_api.g_varchar2_table(734) := 'DE703874DC806857F2CDC16EFB6E010000000000004D2262793DFBEE478E1B10ED4ABE39D86DDF2D000000000000A049442CAF67FFE2978E1B10ED4ABE39D86DDF2D000000000000A049446CEFA17DEF63C70D887625DF1CECB6EF16000000000000D024';
wwv_flow_api.g_varchar2_table(735) := '2256A76BEF751C3720DA957C73B0DBBE5B000000000000409388589DAEBDD771DC806857F2CDC16EFB6E010000000000004D226275BAF65EC77103A25DC93707BBEDBB05000000000000348988D5E9DA7B1DC70D887625DF1CECB6EF16000000000000D0';
wwv_flow_api.g_varchar2_table(736) := '242256A76BEF751C3720DA957C73B0DBBE5B000000000000409388589DAE7DEF63C70D887625DF1CECB6EF16000000000000D0242256A73B1C0E3BBFFD3DD16EF49B4F7E670E76DB770B000000000000681211ABF3D0FEE48F8E1B10ED4ABE39D86DDF2D';
wwv_flow_api.g_varchar2_table(737) := '000000000000A04944ACCE43FBE7F71C3720DA957C73B0FFC73E1DB426B265011CCF87C877E8A0C33043210C61841850063F40BAF30DB2CA6656A1778F84DE8D881B5D0D6FD390C75BB8117D8B6EDC3CDE8C0BB5213C1781E2D5C44B0BF26651250E9227';
wwv_flow_api.g_varchar2_table(738) := '35476F525ECB321ABB5FD22DFF1F27723D9E7BEEA94AD573BF5B0000000000004098522A76781CFFC31FAD648620B625D2F2603FF65D188CC6D9A25DEBB866F2E4F2265FEF6FFC7EF5DC5BE9299FEB0FB073DAD6B17B76D5EE0E1FA897D92416F3B26B3F';
wwv_flow_api.g_varchar2_table(739) := '77BDE6A1000000000000784A4AA9D8E171FC6F7FB7921982D89648CB83FDD87761301A678B76ADE39AC993CB9B7CBDBFF1FBD5736FA5A77CAEAC6C7787BB6757E659B20E0DB32669B59FBB5EE7500000000000003C31A554ECF0F8BBEF4A56324310DB12';
wwv_flow_api.g_varchar2_table(740) := '6979B01FFB2E0C46E36CD1AE755C3379727993AFF7377EBF7AEEADF494CF0D8EDE58BB3BDCCF5DAF3C140000000000004F4F29153B3C8EFF2961253304B12D919607FBB1EFC26034CE16ED5AC73593279737F97A5F163DF776EFA2B373DA96D01921C53A';
wwv_flow_api.g_varchar2_table(741) := 'B37B76D5EE0E8326E73FF424230BF91AB4925DBA58FA4837F314E9132A8E9C418FB19FBBD66749527E0AF2C17872BAD4E823F43C3A1F14030000000000E0B928A56287C7F13FFFC54A6608625B222D0FF663DF85C1689C2DDAB58E6B264F2E6FF2F5BEB9';
wwv_flow_api.g_varchar2_table(742) := '90B21FED812CA472EFA2D3736FF55AF6CA4FBA895E9B7DDADDE17EEE5A177F50FFD38B807496FECB060B8E16B251FA483773972465123DB91E400FA6D7C1D88B570700000000008027A6948A1D1EC7ADBF5AC90C416C4BA4E5C17EECBB30188DB345BBD6';
wwv_flow_api.g_varchar2_table(743) := '71CDE4C9E54DBEDED70B89C89FF4DEE36F7F697787914D84FCF4E2BC239F91474B9FA0B9EEB073DA96088E0E0EEAB9B7FBB96BDD27D825C7C916D9189C253552192C745ECA42970000000000008027A6948A1DBE8A275256324310DB126979B01FFB2E0C';
wwv_flow_api.g_varchar2_table(744) := '46E36CD1AE755C33797279136464BD73DA961AA9D4C5F2D50CA98C6CA2B5BBC3DDB32B5D16FA4932BA6DE8E87CBD6F2E44CFBDDDCF5D4B2B594B527E3217C141522395D23634E1E229000000000000784A4AA9D8E1AB782265253304B12D9196077B83D7';
wwv_flow_api.g_varchar2_table(745) := 'E1E4F2265FEF075F07A371B668D73AAE59230592949FA438F4D3B22DA69E7BBB77D1091548723F77DDEE0E238731A7322B25293FC942BAE991748D7C9523A452CA8EBFFD25C8030000000000E0D929A56287AFE2899495CC10C4B6445A1EEC0D5E875AC7';
wwv_flow_api.g_varchar2_table(746) := 'DD3DBB6A7787FA6BBEDECF16EDC1682C71FE434F3E758D4ECA62EFA2D3736FCD0E92975FE5A7C5CE3AF940C1CE69DBCC9F5CDEC800E6183A194C2879F92A0BF92A49B3BF1E4CAF75130000000000007C099452B1C357F144CA4A6608625B222D0FF6666F';
wwv_flow_api.g_varchar2_table(747) := '44ADE3EE9CB675648BF66034D6F993CB1B9DDCBBE8F4DC5B9DCCD7FBA1620959489350DB7677B87B76A52B6557E4D1668D79BAEEA993FFFCD7AFFBB96BA9D4A7CB54A1BDF2A96BF490F22903073D1707030000000000C053524AC50E5FC513292B992188';
wwv_flow_api.g_varchar2_table(748) := '6D89B43CD8CFFD6E01000000000000614AA958EA653C91B2921982D89648CB83FDDCEF1600000000000010A6948AA55EC613292B9921886D89B43CD8CFFD6E01000000000000614AA958EA653C91B2921982D89648CB83FDDCEF1600000000000010A694';
wwv_flow_api.g_varchar2_table(749) := '8A1D1CC513292B995915FFA87E1C6D76CAE8E3FB6F56F72788CF156979B03FEF9B020000000000007C3AA554ECE0289E4859C9CCAAA8DABEF7E1ED9BD7E76F5EBFFDD9F53FBE3B9FAE8D78D7F5DDABEF43C969B1535EDD5FA2D4F07CBB32972C3BBEDB2C';
wwv_flow_api.g_varchar2_table(750) := 'AD1CAC5158A7FF43916B7ABE538D1C694E44CDA745C531DBAFBA58629D48CB83FD94EF11000000000000B00EA554ECE0289E4859C9CCAAA8DABED7284CD78596EB3BE5859AB2E3BBCD5278E392E2A828353CDFAEACD173D9609F10B9A6E73BD555234DBE';
wwv_flow_api.g_varchar2_table(751) := 'FA2B2EE791F3541CDF6BE566F72A7C073E6FAC713FB720D2F2603FF7BB050000000000008429A5620747F144CA4A665645D5F6BD0F6FDFBC3E7FF3FAEDCFAEFFF1DDF9746DC4BBAEEF5E7D1F4A4E8B9DF2EAFE12A586E7DB95B964D9F1DD6669E5608DC2';
wwv_flow_api.g_varchar2_table(752) := '3AFD1F8A5CD3F39DEAE718E991F3541CDF6BE51E71BD9F14BF77FF2F23D2F2603FF7BB050000000000008429A5620747F144CA4A665645D5DEFC1CA7BCBABF44A9E1F976652E59767CB7599AAC2B8EEFB572F2A9C97A3698D728DCD5E79A5E70EADDC6FB';
wwv_flow_api.g_varchar2_table(753) := 'CE11C304DD7CA7211B9DEA3A23DD4D12D9B6D07283C45D8D71DF663347769BBFDEB96BB99F79E94D08FD83826B9CCEDF9C4EE5A9FFCCA6D5776CB6C5B8575B106979B037784C01000000000080DF95522A7670144FA4AC646655546DDF6B14A6EB42CBF5';
wwv_flow_api.g_varchar2_table(754) := '9DF2424DD9F1DD6629BC71497154941A9E6F5796F4AC3893899D6A90BF5FCF06CB353D7F7696E4EFBB155AF6DD6093238C86F7C5932167CD1F1E697645916DCD1B353DE57EBB318F193286D7CA05EBFB9126D7729F9FACF56C0FDD84D9CD37F64E069BF5';
wwv_flow_api.g_varchar2_table(755) := '9FFF1F19EB52B9B2F08FFB8A232D0FF6B3BE580000000000004004A554ECE0289E4859C9CCAAA8DABED7284CD78596EB3BE5859AB2E3BBCD5278E392E2A828353CDFAE2CE959717CAF958B681B0C16DE9E6B7ABE530D9D122443D34616478E147945C676';
wwv_flow_api.g_varchar2_table(756) := 'E346AD737FE4BA02B30142E74ACFE989CB6E4228BFFC9E9833C83AEA92B720D2F2606FF646F4DCDBBD8BCECE695B47BEDEFF3C6FDAA6CC7964215F9F771E53ADE306372A0849B6BBC317E71DF95CB62B5BB407A3F1134F0B0000000000F025504AC50E8E';
wwv_flow_api.g_varchar2_table(757) := 'E2899495CCAC8AAAED8FEC9FDE576BEFAB3F3923FFBF1F6AD3B5111F7EF547CEBF43C969B1535EDD5FA2D4F07CBB32972C3BF7998AE37BADDCDC3CBAAD2CBC46C15CDC87B145FACC38D5C5B3724D6F9A5F3DD2836D17C7987408B8CD52F8885937D9189C';
wwv_flow_api.g_varchar2_table(758) := '3559CF9BF65C721316860FC60ECF2F039B33DCCD3FD7730B222D0FF606AF43BB3BDC3DBBCAD7FBFAEB6034CE166D09596CD0EDD3C93C2FCE3BF2A9BFFE680F82F5133BB9BC096ECB22F9490AD66C55EBB8EBDFD287CF050000000000F8EA28A5620747F1';
wwv_flow_api.g_varchar2_table(759) := '44CA4A665645D5960DA3D168287F93BD9345287EF3FDDF16929362A7BCBAFF24CA8EEF364B46A6D4F07CBB325D571CDF6BE5829F0A2DF7AEAD0CE6350AF3C5C9FB2D4E35D436D7F41693FAABCECFC7424F2313D9D69827BC7DE1EA16AEABE2DCDF2BD918';
wwv_flow_api.g_varchar2_table(760) := '3459526CDE84507EB63D3C7FE40C93E1E7B67FED91FE3FFBF4EFDA4693C771DC7F44FE8733BBE5B28D61C12BB35BE8CA3B9CC8F515AADC3F70655C0B914681071ED21C0852B831569A43E5838B584540854144670F16884058099F1759D17DEDF18DE6D9';
wwv_flow_api.g_varchar2_table(761) := 'B5653B8F41D1E6FDE293B09A1FDF995DCFC8C17EEA5D18A7D372A3576F0FF38DAD6EF23CF7ED89645D595DF6B094D56DD5E669E6CBD8A44B063CB2D4935E6AF1BA0000000000002B4729E56C6EBB7EE805F14339ECCD46476F6E9EDF1C27B3FE7E6ECC7E';
wwv_flow_api.g_varchar2_table(762) := '7F967C7C9B9D78CFE0BB73D09F995582B8F671341B1DD7E65DB3DE81EE7A7B34326BCD37763D7EBE96B4EBF1D783ED89B3FE6176F0F5266FDBFF187BEE6DCDFF0FBBBBEC1F3E54F6F9AEEF23EF65DEF1E61BCEB767B57B0F7F8479716B6E66FFF6DFE8ED';
wwv_flow_api.g_varchar2_table(763) := '51DFFAB6F9B55638911CECA7DE85CED9C546ED64904C32EDF5F6B0DA3C9587563729377AEF3B5FD7763B12791EA7533D4666ADEF7575BB8C9716E99201BFFDFE45B7BFF8E593D4CF2F2A83F52C89D4CF6FE92FAFBBF989B21FBD8A5E5AB6ADC7E8AD9A9A';
wwv_flow_api.g_varchar2_table(764) := '7ADB8FDFB93CE8D7D7355F7F1848E33FFEF51F19AF072C780BB356664B7AB7767DBD19BD01E9328B4ABBBD8AFE808BD705000000000058394A296773DBF5432F881FCA616F363A7A73F3FCE63899F5F77363F6FBB3E4E3DBECC47B06DF9B83FE7C7FA3E3';
wwv_flow_api.g_varchar2_table(765) := '9ADD3E3A3E329DFDC33B3616C4B58F2333BB7790AF39EAF54766EE7CF0E878FFE3C8AA69F2F6685EEF7A9C59E8E1B2379BB7F6D3EFDDF97D6EDE6BFE9AD7AF733B6CDFFA12B7C5EFFD08B71373DFED7AFFF3EF70FBE7B87D11ABFE53FE402B90480EF613';
wwv_flow_api.g_varchar2_table(766) := 'AEC18D563729377AE3747A5FBB3CACED76AACD53DD2E0FFA79904CD6F7BAD2AB9F376A279DB30B192FB3A45D5AF4E07C71F9F9FAC34037D6DBC3FB569745335D524DC6EB67B3A22E22837597DE807E5EBC7353CAEC41B79BF19915F3A4CB1E6C6FC9AC25';
wwv_flow_api.g_varchar2_table(767) := 'DE77BE4A97F99EF6379146F3ADEC3FC4E275010000000000568E52CAD9DC76FDD00BE28772D89309699A5EC8BFEBB9D70F995CCD6657B9C62FA364D6DF7FB8FE4339E8CF46C7B53F5F67A5C34778542239D84FBD0BAD6E526EF4C6E9F4BEF6CC80CED9C5';
wwv_flow_api.g_varchar2_table(768) := '46ED64904C32EDF5F650223FA551BA3283EF5B7DF10029B8B6DB91FFF5CF6AF3D43CCB149928D3F530E9FAEE9D9B5276CDFC8A776ECF5ED74CBFF3A5F4A2AF3F0CECA5EDFAD25879F759AFBE785D00000000008095A3947236B75D3FF482F8C1ECFE7A78';
wwv_flow_api.g_varchar2_table(769) := 'D8FAF77764FFD77F3EA6FE0339E8CF46C7B53F5F67A5C34778542239D84FBD0B9DB38B8DDAC9209964DAEBED61B5792A0FAD6E526EF4C6E954B7CB48F929FFCB80B5DD8E1D192FC3A457A62C2E2E03CCACF5BD6E7E80215D32401794FAB2A86997CA52DF';
wwv_flow_api.g_varchar2_table(770) := 'DEAA59B4F2EEB3EC64C1CEEDF166CF764DCD5E312F53C74CCFAC6BBFB2FDB27ADDCC37CCBF290000000000400128A59CCD6DD70FBD20FED173D09F8D8E6B4BDF061F610512C9C17EEA5D18A7D372A3D7EA26F735CAFFF22C2DBAAB7376B1513B19241369';
wwv_flow_api.g_varchar2_table(771) := 'AF364F17573383ED3176C13B0764C82AF5F6D07E10324526CA747996467B27A6FE829DDBEDF25079F7597AED9A99A5EF9459D74C5FF0D6AF3F0CD6F7BAA64BA667BEFC63D605000000000058394A296773DBF5432F8809294A2239D8DF711D3A67172F7E';
wwv_flow_api.g_varchar2_table(772) := 'F9D4EA26FAE7389D961BBD6AF354FF94F6B5DD8EEED55DF5F6509E07C9647DAF6B66D9734DA354DEA89DC8487B8C4C37C5E5598A6406C87453C15E45064B7159429EA582EC59EAEB76F36C8F5FBC73FD6C979576D9ADAEA3C92A66589EFD22BAAC9E9EF9';
wwv_flow_api.g_varchar2_table(773) := '80EF3B5FA54BB6A157B15F591AF3AFFFE0BA0000000000002B4729E56C6EBB7EE805312145492407FBFB6EC42099ACEF75D7763B3AF5F6D074B5BA49B9D1ABBCFBACBBAACD53D3D539BB78F1CB27DD2E0FF2739C4E65B04C3103366A2752FCBEB5A46C7E';
wwv_flow_api.g_varchar2_table(774) := '805D5662AAE9E2BAF1B7DFBFC8441929EDB25BA963BACCE617ECDCDE838C91CABAD1D4B477A25F2DFFD164A14C4D33DDDEAAAEAF37A3179259E6BDA48879533360F1BA0000000000002B4729E56CBE74FDD00B62428A92480EF6B35F96563729377AE374';
wwv_flow_api.g_varchar2_table(775) := 'FAEC959F4BBD3DAC364FF3ED3FFECE0100000000007E124A2967F3A5EB875E101352944472B09FFDB2B4BA49B9D11BA7D367AFFC5CEAED61B5799A6FFFF1770E0000000000F093504A39E14BD70FBD2026A42889E4603FFB6569759372A3374EA7CF5EF9';
wwv_flow_api.g_varchar2_table(776) := 'B9D4DBC36AF334DFFEE3EF1C0000000000E027A19472C297AE1F7A414C485112C9C15EF6DD02000000000000B294524EF8D2F5432F8809294A2239D8CBBE5B000000000000409652CA29BD72FDD00B62428A92480EF6B2EF1600000000000090A594724A';
wwv_flow_api.g_varchar2_table(777) := 'AF5C3FF4829890A2249283BDECBB050000000000006429A59CD22BD70FBD2026A42889E4602FFB6E01000000000000594A29A75471FDD00B62428A92480EF6B2EF1600000000000090A594724A15D70FBD2026A42889E4602FFB6E01000000000000594A';
wwv_flow_api.g_varchar2_table(778) := '29676BC7F5432F8809294A2239D8CBBE5B000000000000409652CAD9DA71FDD00B62428A92480EF6B2EF1600000000000090A59472B6765C3F2CFDF5EF84142361F96F72B0977DB7000000000000802CA594B3B5E3FAA117C4841425911CEC65DF2D0000';
wwv_flow_api.g_varchar2_table(779) := '00000000204B29E56CEDB87EE8053121454924077BD9770B000000000000C8524A395B3BAE1F7A414C485112C9C15EF6DD02000000000000B294524EA9E2FAA117C4841425911CEC65DF2D000000000000204B29E5942AAE1F7A414C485112C9C15EF6DD';
wwv_flow_api.g_varchar2_table(780) := '02000000000000B294524EA9E2FAA117C4841425911CEC65DF2D000000000000204B29E5942AAE1F7A414C485112C9C15EF6DD02000000000000B294524EA9E2FAA117C4841425D1F9F9799AA6CBBE5E000000000000C0DCE5E5E5F9F9B953AAB87EE805';
wwv_flow_api.g_varchar2_table(781) := '312185C9783C96B3AD000000000000801FC6F9F9F9783C764A15D70FBD2026A430994EA757575793C9244DD3CBCBCBFF020000000000004B72797999A6E96432B9BABA9A4EA74EA9E2FAA117C4841426DFBE7D9BDEB8BAF13FF6E9E7B56D348FE3F8FF63';
wwv_flow_api.g_varchar2_table(782) := 'CDB2B01A5F1644EA04C42E4B6EEDD6CEC1B74098436028740B290B5D4A420FAD17DC2911EC300B8140430EEAC1A89704167C19156402250D131008DA351437043D10109BE6BBF26F3B51C6767E8CDAF07EF1393CFA3E8FBEFADAF0FC0F00000000000048';
wwv_flow_api.g_varchar2_table(783) := 'C971CBE796939393CC7441CBE674C324E4C644444EBA3E03000000000000A93AE91291CC7441CBE674C324E4C644BA4E000000000000802F807465A60B5A36A71BE6C479F093FD7ADB6965ED69F1221D08B99E08000000000000F045CA4C17B46C4E37CC';
wwv_flow_api.g_varchar2_table(784) := '4953F2941C47D151141D8BD4AB0B937720E49A92F6AD020000000000009265A60B5A36A71BE684293AEF257ABB1EAF675FD745D54A137720E4BA92F6AD020000000000009265A60B5A36A71BE61879B6F551E458F9DEF6CBCD5A43C4AF149BF507AF5CEF';
wwv_flow_api.g_varchar2_table(785) := 'D593CDDD868AA2A3283A0CB65E14C76B48C8B524ED5B0500000000000024CB4C17B46C4E37CC9159A804226ACFDB6FA8E68BE1BB578BFDDDFB5B7591C3BAEF078D23915F36C76978367620A1675DECDDAB8EE3F7FFA4C04E7F1E3241D2BA4D0000000000';
wwv_flow_api.g_varchar2_table(786) := '00C0AFCB4C17B46C4E37CC51D9DC8B24F4ACD981E2ECE2A3C5F9F67A7DE7483EBC2EC6EB92A7A45E5D387D60ACD841F313E39FBF649AA3064EC256B9168A72CBDDC74AADBD1E633CC71F7C91A494B46F15000000000000902C3333A76573BA618E8AE51E';
wwv_flow_api.g_varchar2_table(787) := '8A44F5ADA7C54EE541F543AB4358DFDDF195C84175A5555FDF8F246ABCDBF53F46CDEDA3DD1FF3239B776207127AD698872F9F92A7247012B62A81A85AE922E339BE28B7FC1BCD4FCE4BAA570A000000000000385766664ED30DDD304727FF7CEB7D24D1';
wwv_flow_api.g_varchar2_table(788) := 'FE5A3E7EBC6FFB911CD65EAE5577EA2A3A0CAAEB0FBB278B4F5EEF37946AF8357B6D3B3E15BEB1C6EA6F987620A1D73EECF8A2DC4A2D6C0DD92AC695B6C0EE9C6F9D29F7EAF1BAD7CA7255EF27F6EB254F49506B6DA98F07FD3FC1AF0C4F528EBF3BD82D';
wwv_flow_api.g_varchar2_table(789) := 'B1E160A53552B9336DEB48AD34F4737AD3F6FA9FF3697215B9BAFB010000000000005CA5CCCCDCF286A51BE65879506D8872CBA6FECF5A28D1DECBE2D0EEFCC3A5C78F16F243AF2CFDE74024B0C7EB6F07127AED611C3F1E4ED54AF1BA1C7F4BBA4D2C57';
wwv_flow_api.g_varchar2_table(790) := '0D9FE935AF0483672470F4D375B3E4C51BADF97B8FBD63A7D27CAB3B40C278CDA9FCCEFAD448FDFE43E7FB5BCDF37EA553B42BE3FDF36492A478A1000000000000805F9199995BDEB074C31C9DFCF3ADF79144FB6BF9786DB99F44A283EA8B627B77B112';
wwv_flow_api.g_varchar2_table(791) := '44ED8EC7076EAFB8B91FC6A77C67719CFE866907127AED611C5F945B6ED72D57F5EA66C953123867CE748EF915532FD742096CE34C7DE8DD84C7B3691E90FEA707C63B732C69A4E1F3BDADA19F43AE23A95E29000000000000E05CDA4C6179635537CC51';
wwv_flow_api.g_varchar2_table(792) := 'B1DC439128701E153B95FC8A134472B4FB43F37173EF5842EFA7B976F1D3CF4B71F1FBED0FD22A8E6EDE891DC4E7ADD6DAF145B9E57EDDAF74D6254F49E09C3DD33F560944D54A496D07DE35CF3E9E93F82B9DAF0F8CD779EC4B1A69F8FCE096E5AAC1B7';
wwv_flow_api.g_varchar2_table(793) := 'C815279DBB040000000000008CA2CD1496375675C31C95CDBD48A2B7EBB303C5D9CD7D91C06EAE1D5F94FBA2557C5D97A3DD1FE262B916CAC1D683919DFBB103093D4BEF352CF7EB7EA5B32E794A02E7EC19DDB05CD53AD6FC6E7BAAD3AF0FBC9BF03872';
wwv_flow_api.g_varchar2_table(794) := 'AA81F186D6E78D3478E6CCB49D03E30C40264DDAB70A00000000000048A6CD1496375675C31C99854A20A2F6BCFD86523BEBE6DCBF7E6E4412F9CE4273F759F553BC5977E3DDB8F8CBE66CB368B98722517DEB69719CFE71EC4042CF6AAD1D5F945BEED7';
wwv_flow_api.g_varchar2_table(795) := 'FD4A675DF294044EF78C74D7ADBAAA95DADF55FDBADE1C3BB04FBF9BF0D84F25E87DAEFD95F6E3C078CD4F74CF0C7E6E68EC81919AEF4A67CBF107674E1C805C2EFF05000000000000BE48DA4C6179635537CC31F26CEBA3C8B1F2BD574F56AA0D91F0ED';
wwv_flow_api.g_varchar2_table(796) := 'E6626F77FEB9F3EE203C521FBC574BF96E31FF7CEB7D24D1FEDA58FD4D3B90D0B35A6BC717E596FB75BFD259973C2581D33FE305D211D8FD5696ABE46C7DE05DB3DBA1A9D7BC93722D94BEFE6EA7DE1AACD2FBAEF2837EDBE6279AB55A69780CBFD2FB45';
wwv_flow_api.g_varchar2_table(797) := '03B3758E912BCE67000000000000E08BA44DDFBDB7BAAA1BE664F9DEF12309DF58F17A76F1D1D2DFEFCF0E1DF86EF1F1CAE27CBCB86FC7E70E6BA549FB8F15C717E596AFA333F9BA93F6AD020000000000009265727F2D2E6FE886396916B7EB222A3C8C';
wwv_flow_api.g_varchar2_table(798) := 'A4250A9CC5F656DE723FB56B121EAA48A29D7F172FD07F8C38BE28B77C1D9DC9D79DB46F15000000000000902C73EB8EF6BB3FEB8639792C273868F835FBC5FDB9A7B586C8DECB667D61BB2EC7C1CBF9EFFEB1B6EDC6077636172ED27C9C38BE28B77C4D';
wwv_flow_api.g_varchar2_table(799) := 'CDC9579CB46F15000000000000902C33755BFB7D5637CCCBC5729534AA2BF1FAC7B79104CEA51B1272F1A47DAB000000000000806499A9DBDA1FFEA81BE62563FBD213BE797EF986845C3869DF2A0000000000002059E6D61DEDDB29DD302F9BF9874B8F';
wwv_flow_api.g_varchar2_table(800) := '575A79B490BF7437422E91B46F15000000000000902C33755BCBE674C324E4C624ED5B0500000000000024CB4CDDF9269BD30D93901B93B46F15000000000000902C73EBEE37DF4EE98649C88D49DAB70A00000000000048A6CDCC7DA31BBA6112726392';
wwv_flow_api.g_varchar2_table(801) := 'F6AD0200000000000092693305ED2F7FD30D93901B93B46F15000000000000902C339DFFD33D4B374C426E4CD2BE5500000000000040B2CCF4DD7BABFF679FFE5D2447CE308EFF3FD2718613D31B98C2D64DAFB0319B79647030B1A34B7C18C31AA71B2A';
wwv_flow_api.g_varchar2_table(802) := '50B28A9C6F62F94068A28B0CC6324899B94850603830180E151C745456FF9054EA2ECDD6ECCE2268BE1F1E96DE52E9ADB74A5359202242AE266BDF2A000000000000C0CEFBF2376FDF7E1D888890ABC9DAB70A000000000000B0F37E7EF7F6F7BF0C4444';
wwv_flow_api.g_varchar2_table(803) := 'C8D564ED5B05000000000000D879E1DDBB77EF021111723559FB5601000000000000765E78F78BCF3E0F4444C8D564ED5B05000000000000D879E19DFFF9175FFEEAD7845C4DD6BE55000000000000809D17C6FE4F6E021111723559FB56010000000000';
wwv_flow_api.g_varchar2_table(804) := '00765E78E77FF1D34044845C4DD6BE55000000000000809D17DEF9373F0B4444C8D564ED5B05000000000000D87961EC6F6E031111723559FB5601000000000000767E187FB6D9062222E46AB2F6AD02000000000000ECFC30F66F6E031111723559FB56';
wwv_flow_api.g_varchar2_table(805) := '01000000000000765E18FB37B7818808B99AAC7DAB000000000000003B2F8CFD9BDB4044845C4DD6BE55000000000000809D17C6FECD6D202242AE266BDF2A000000000000C0CE0B63FFE6361011215793B56F1500000000000060E785B17F731B888890';
wwv_flow_api.g_varchar2_table(806) := 'ABC9DAB70A000000000000B0F3C2D8BFB90D4444C8D564ED5B05000000000000D87961ECDFDC062272CD1FFFF6DD0FBBDD8FD6A8EFFEFAE6957B29423E4DD6BE55000000000000809D17C6FE661B88C83149ADF4FFFE5D3E7C6BC9BFBEDFE95DFBF0E695';
wwv_flow_api.g_varchar2_table(807) := '7335423E45D6BE55000000000000809D17C6FE661B88C83149ADB42C2FC6EF7FF7E73FFD56DCBF7E903BBD6B1FDEBC722E48C8B367ED5B05000000000000D87961EC6FB681881C93D44ACBF262BC6CB5AAD2FEC7FDEB07B9D3BBF6E1CD2BE79A843C6FD6';
wwv_flow_api.g_varchar2_table(808) := 'BE55000000000000809D17C6FE661B88C83149ADB42C2FC6CB56AB2A3DFEBE7FFD20777AD73EBC79E55C969067CCDAB70A000000000000B0F3C2D8DF6C03113926A99596E5C578D96A55A5E37FEF5F3FC89DDEB5DFFCC1BD7220B24AE9B6980DE6527775';
wwv_flow_api.g_varchar2_table(809) := 'F6842269D369993F6151A7AE06E61E9F98E76FECB2BDF95915727A705AFA30593589F5B38EBB9BBDB870FEFBEDCC9C7DB875B3F6AD02000000000000ECBC30F637DB40448E496AA56579315EB67AD7FEE3DBF2E1906FFEF295B82FFFA3BB3A73AF1C88AC';
wwv_flow_api.g_varchar2_table(810) := '52BA2D6683B97C6291B4E9B4CC3F66C2F9BE8C96D2A62A1E39848F6BEC035EDC3F32CF27AB64930CE7A6CDB70A79D8457FC2AABB38E4E336B556557A9AACD5A9CE71898BF9175D1DA6BDEF4CFA5586253E71D6BE55000000000000809D17C6FE661B88C8';
wwv_flow_api.g_varchar2_table(811) := '3149ADB42C2FC6EF93BF7FDFFDB8DB1DF3DF7F2622CAA5EEEACCBD7220B24AE9B6980D3EB948DA745AE61F33C161F2C2217C5C634F7EB16CF5F9714DEDA9265938E14E9D377FD88E6CB5AAD2C34821CDD7ED9FC0D2553955B0E7BD139E2D6BDF2A000000';
wwv_flow_api.g_varchar2_table(812) := '000000C0CE0B637FB30D44E498A4565A962E3373A9BB3A73AF1C88AC52BA2D168A1452AB26E9FF3DEA7F4FD3CAF634AADBBAE9B4CC8FE3E3646D14199D76B15F743E62665FF9B2A5D1FE516AAC787E3E0B8DD9163DBE38165F6E78C8F140DC8E71FEA8EF';
wwv_flow_api.g_varchar2_table(813) := '4A55A939D8FFD7189C57B67FC7F9AE2F661A1B3C4EDBCF1F9C8A4F87B3B0910FCFDAB70A000000000000B0F3C2D8DF6C03113926A99596A5CBCC5CEAAECEDC2B0722AB946E8B852285D4BD61E97E7CF85DB67A7C6B5FA17F909FE69C7E1CDE1D7EA74D37';
wwv_flow_api.g_varchar2_table(814) := 'FE3ECC1F9AB4AC3ECC9F6A5A0E6156D07CB4D4987DD1FD8BE3FC7DC3AA4A2DF51D3E44BFEEF0EEC209CFDEEDD7524D62BE751AB938BAF363391F9FCAA64D6B6C70D8ECBCB1420E87631ED4F364ED5B05000000000000D87961EC6FB681881C93D44ACBD2';
wwv_flow_api.g_varchar2_table(815) := '65662E755767EE950391554AB7C54291426AD524E3A3B4E9B4CC1F199FA56CB5AAD28B096793FB524B5BEB1FF586A7B3439817991E2D35B6B0E8FC608DA3B0EFE8910F616C76E984A79AE342C65BC7CD1E2D1D88AD2B6B4BC6E062634FFF53794FD6BE55';
wwv_flow_api.g_varchar2_table(816) := '000000000000809D17C6FE661B88C83149ADB42C5D66E6527775E65E391059A5745B9C17398D1452AB26991E95AD96F9653F69D31DC687DF2355A51713FA9A67664B58DA3BEE68B6A859D078B4D8D8C2A2F3F9C651CCEB4F393F90C78EF1F2D1E9EB4CC5';
wwv_flow_api.g_varchar2_table(817) := 'FBF31C8E68AADC0F2E94B275657EF1DCDCE5695FC6124333A327FEA9BC276BDF2A000000000000C0CE0B637FB30D44E498A4565A962E3373A9BB3A73AF6C7B25AB946E8BC3EF426AD524E3A3B4E9B4CC2FC7FBFF1EC7C709FB94AD56553A7FF1F8DB7CD7';
wwv_flow_api.g_varchar2_table(818) := '79EFB343982D643C7AA431DBA2F38335363EAF6FC4D894EB379A97554D351DB851CDEC7C6CFB2C975D1923E677349A311B363AF9A03F95C7B3F6AD02000000000000ECBC30F65FBC0C44E498A4565A962E3373A9BB3A73AFBC4F21B556556AACA59A647A';
wwv_flow_api.g_varchar2_table(819) := 'A4DBE2F828ABD4503C6DBAF9B8D6323FCE9FBD3B94DDCF3F4C38AB634DDAB4D3D369F2FC10CA766CE0D0CCE9D152630B8BCE6BEEE71835C7862F5E999638BC258F5BDEB7346DFF7002876946D9594BC7578623328FEEF01D2D5FFCACAB8BAF335BE5F4BA';
wwv_flow_api.g_varchar2_table(820) := 'B1C4F9EFA7FFA93C9AB56F1500000000000060E785B1FFE2652022C724B5D2B27499994BDDD5997BE5530AA947AA49CC71D554E343B387B4E98617AAA2FF2DF3FD7856A971B26CFB47E9D49851A16CA7F5745B9CF5337B6A6CE7347E9A3FF6AC9ADC3C1F';
wwv_flow_api.g_varchar2_table(821) := '7B63F645E707BB6F7E6C66DEF03CD312E7FDE7C6410E27392BBB6F7BAA594E477438EA647E08E79F72BEEE7CBEF911552BA77DEDF7384C3EFD3E6CACFDB03F95E5AC7DAB000000000000003B2F8CFD172F03113926A99596A5CBCC5CEAAECEDC2BBF2785';
wwv_flow_api.g_varchar2_table(822) := 'D4AA499EAB1AB9EAAC7DAB000000000000003B2F8CFD17FF679F8E51DB08C2300CDF67B61CB0D44C31989D2EEDBA4BED13B809B80AA454AD5BA8312A7C87F519B608E92508B8DA5C60C0135818589E87B7FCF9BB6F8CA934769AEFEB726DB9BC2CEB6D3E';
wwv_flow_api.g_varchar2_table(823) := 'B77FFEA2B765BD7F9CB6FAA65DD77B55000000005017F2341CC6984A63A7F9BE2ED796CBCBB2DEE673FBE72F7A5BD6FBC769AB6FDA75BD57050000000075214FC3618CA934769AEFEB726DB9BC2CEB6D3EB77F96B6AAF7AA00000000A02EE469388E3195';
wwv_flow_api.g_varchar2_table(824) := 'C69EDFFFAC4D3E3FFFAEBFDF5FDA3F4B5BD57B55000000005017F2341CC7984A73DF9F5F7FFDF8D9D0EBCBB7FF782B6D56EF5501000000405DC8D3701C632AD26EEABD2A00000000A80B791A8E634C45DA4DBD57050000000075214FC3618CA948BBA9F7';
wwv_flow_api.g_varchar2_table(825) := 'AA00000000A02EE469388C31156937F55E1500000000D4853C0D0F8F31156937F55E1500000000D485FC343C3CC654A4DDD47B55000000005017F2D33F010600C425CAA30D0A656E6473747265616D0D656E646F626A0D312030206F626A0D3C3C2F4669';
wwv_flow_api.g_varchar2_table(826) := '6C7465722F466C6174654465636F64652F46697273742036332F4C656E677468203339302F4E2031302F547970652F4F626A53746D3E3E73747265616D0D0A68DE8C52CB6EC23010FC953DC2A1AC435E20A148D052A9A28588D013E26052172C821D1947';
wwv_flow_api.g_varchar2_table(827) := '227FDF7592D222F5D08B57339E7D78D611308861E4C308BC610463F082103C067E1C80E741C07CE22170A40FC128A67B087D0A2184A30826135C503E8335A6DC0865374608AA754F2CC5D52E440D1EAE7521DE78497D9C62539702336BAABC91ADB5B649';
wwv_flow_api.g_varchar2_table(828) := 'E24A6EA935095CEB26F82EEC3085A8C9CB3013792B5D56E7CB96B9899DA2A1A64A69CBADD40AB3922B9C1A2B3F796E31C599DC17521F0C2F8FB50373654D8D8F476E2C3ECB4365043E494EF7E71B34BA7CE4E5379CAB0F2A2E70E98E679AF707BDA8422A';
wwv_flow_api.g_varchar2_table(829) := '911D39BDA953AF2AEBB8760C7AA73C095DD90E56FB4B6E647983A530BF890D7936D357373DBEAB0F616E9592E44F7BDC669C07CD4A18BE7275E8CD970FEF599F7CEB56748021EB1C4C5BA76927FF546EDBFA30DCFD3363EA3E892316E093AC9DF24ED7D9';
wwv_flow_api.g_varchar2_table(830) := 'B4E9F59B8419BD771B0F070CC2603C88BC314546288AC301F3C63B5C51E7DA3998163C1767FA5D382B747E4A922F0106003831CB0D0D0A656E6473747265616D0D656E646F626A0D322030206F626A0D3C3C2F4C656E67746820333931352F5375627479';
wwv_flow_api.g_varchar2_table(831) := '70652F584D4C2F547970652F4D657461646174613E3E73747265616D0D0A3C3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B633964223F3E0A3C783A786D706D65746120786D6C6E73';
wwv_flow_api.g_varchar2_table(832) := '3A783D2261646F62653A6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F726520352E362D633031372039312E3136343436342C20323032302F30362F31352D31303A32303A30352020202020202020223E0A2020203C7264';
wwv_flow_api.g_varchar2_table(833) := '663A52444620786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E7323223E0A2020202020203C7264663A4465736372697074696F6E207264663A61626F75743D22220A20';
wwv_flow_api.g_varchar2_table(834) := '2020202020202020202020786D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F220A202020202020202020202020786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F786170';
wwv_flow_api.g_varchar2_table(835) := '2F312E302F6D6D2F220A202020202020202020202020786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E74732F312E312F220A202020202020202020202020786D6C6E733A7064663D22687474703A2F2F6E732E61';
wwv_flow_api.g_varchar2_table(836) := '646F62652E636F6D2F7064662F312E332F220A202020202020202020202020786D6C6E733A706466783D22687474703A2F2F6E732E61646F62652E636F6D2F706466782F312E332F223E0A2020202020202020203C786D703A4D6F64696679446174653E';
wwv_flow_api.g_varchar2_table(837) := '323032302D30392D32335431323A31343A33372D30353A30303C2F786D703A4D6F64696679446174653E0A2020202020202020203C786D703A437265617465446174653E323032302D30392D32335431373A31343A30315A3C2F786D703A437265617465';
wwv_flow_api.g_varchar2_table(838) := '446174653E0A2020202020202020203C786D703A4D65746164617461446174653E323032302D30392D32335431323A31343A33372D30353A30303C2F786D703A4D65746164617461446174653E0A2020202020202020203C786D703A43726561746F7254';
wwv_flow_api.g_varchar2_table(839) := '6F6F6C3E4163726F626174205044464D616B657220323020666F7220576F72643C2F786D703A43726561746F72546F6F6C3E0A2020202020202020203C786D704D4D3A446F63756D656E7449443E757569643A33303264346164352D306531612D346534';
wwv_flow_api.g_varchar2_table(840) := '622D613366312D3835396162346636613130633C2F786D704D4D3A446F63756D656E7449443E0A2020202020202020203C786D704D4D3A496E7374616E636549443E757569643A66313131323631622D663035362D343461392D623836312D3332383861';
wwv_flow_api.g_varchar2_table(841) := '366436363932373C2F786D704D4D3A496E7374616E636549443E0A2020202020202020203C786D704D4D3A7375626A6563743E0A2020202020202020202020203C7264663A5365713E0A2020202020202020202020202020203C7264663A6C693E323C2F';
wwv_flow_api.g_varchar2_table(842) := '7264663A6C693E0A2020202020202020202020203C2F7264663A5365713E0A2020202020202020203C2F786D704D4D3A7375626A6563743E0A2020202020202020203C64633A666F726D61743E6170706C69636174696F6E2F7064663C2F64633A666F72';
wwv_flow_api.g_varchar2_table(843) := '6D61743E0A2020202020202020203C64633A7469746C653E0A2020202020202020202020203C7264663A416C743E0A2020202020202020202020202020203C7264663A6C6920786D6C3A6C616E673D22782D64656661756C74222F3E0A20202020202020';
wwv_flow_api.g_varchar2_table(844) := '20202020203C2F7264663A416C743E0A2020202020202020203C2F64633A7469746C653E0A2020202020202020203C64633A6465736372697074696F6E3E0A2020202020202020202020203C7264663A416C743E0A202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(845) := '3C7264663A6C6920786D6C3A6C616E673D22782D64656661756C74222F3E0A2020202020202020202020203C2F7264663A416C743E0A2020202020202020203C2F64633A6465736372697074696F6E3E0A2020202020202020203C64633A63726561746F';
wwv_flow_api.g_varchar2_table(846) := '723E0A2020202020202020202020203C7264663A5365713E0A2020202020202020202020202020203C7264663A6C693E546F6E79204573706F7369746F3C2F7264663A6C693E0A2020202020202020202020203C2F7264663A5365713E0A202020202020';
wwv_flow_api.g_varchar2_table(847) := '2020203C2F64633A63726561746F723E0A2020202020202020203C7064663A50726F64756365723E41646F626520504446204C6962726172792032302E392E39353C2F7064663A50726F64756365723E0A2020202020202020203C7064663A4B6579776F';
wwv_flow_api.g_varchar2_table(848) := '7264732F3E0A2020202020202020203C706466783A536F757263654D6F6469666965643E443A32303230303932333137313430303C2F706466783A536F757263654D6F6469666965643E0A2020202020202020203C706466783A436F6D70616E792F3E0A';
wwv_flow_api.g_varchar2_table(849) := '2020202020202020203C706466783A436F6D6D656E74732F3E0A2020202020203C2F7264663A4465736372697074696F6E3E0A2020203C2F7264663A5244463E0A3C2F783A786D706D6574613E0A20202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(850) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(851) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A2020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(852) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A20202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(853) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(854) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A2020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(855) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A20202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(856) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(857) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(858) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A20202020202020202020202020';
wwv_flow_api.g_varchar2_table(859) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020';
wwv_flow_api.g_varchar2_table(860) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A2020202020202020202020';
wwv_flow_api.g_varchar2_table(861) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A20202020202020202020';
wwv_flow_api.g_varchar2_table(862) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020';
wwv_flow_api.g_varchar2_table(863) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A2020202020202020';
wwv_flow_api.g_varchar2_table(864) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A20202020202020';
wwv_flow_api.g_varchar2_table(865) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020';
wwv_flow_api.g_varchar2_table(866) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A2020202020';
wwv_flow_api.g_varchar2_table(867) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A20202020';
wwv_flow_api.g_varchar2_table(868) := '2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020';
wwv_flow_api.g_varchar2_table(869) := '202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A2020';
wwv_flow_api.g_varchar2_table(870) := '202020202020202020202020202020202020202020202020200A3C3F787061636B657420656E643D2277223F3E0D0A656E6473747265616D0D656E646F626A0D332030206F626A0D3C3C2F46696C7465722F466C6174654465636F64652F466972737420';
wwv_flow_api.g_varchar2_table(871) := '352F4C656E6774682035302F4E20312F547970652F4F626A53746D3E3E73747265616D0D0A68DE3234533050B0B1D177CE2FCD2B5130D4F7CE4C298E3632000A06C5EA875416A4EA0724A6A716DBD901041800E7720BDB0D0A656E6473747265616D0D65';
wwv_flow_api.g_varchar2_table(872) := '6E646F626A0D342030206F626A0D3C3C2F46696C7465722F466C6174654465636F64652F466972737420352F4C656E677468203139352F4E20312F547970652F4F626A53746D3E3E73747265616D0D0A68DE5CCE4D0BC2300C80E1BFD29BEB419B56654C';
wwv_flow_api.g_varchar2_table(873) := '86204E2F2A080A82B76E8D583F16C93A64FFDE4E3C797B21E149742A40E4B95AB4E14A9C1CA9EEC4AA7951E30349B5A4E713EBD024DF7CD9BAEB8BD1064F75610326C5CC8001C8CC58A77A02FAFC9B476B51319536887DB1DED93BB230202EC4E244ECA4';
wwv_flow_api.g_varchar2_table(874) := 'DA60F78ED1D33B72FF96D193713A84E9006020D59EC9B51546D251893D28B6BE64CB5D3447D9289B4A75A0962B8C94BF7874FF7F415C68CB1B5621DE3BFAF0C044CEE71F010600BC054C0F0D0A656E6473747265616D0D656E646F626A0D352030206F62';
wwv_flow_api.g_varchar2_table(875) := '6A0D3C3C2F4465636F64655061726D733C3C2F436F6C756D6E7320352F507265646963746F722031323E3E2F46696C7465722F466C6174654465636F64652F49445B3C41323837343632363131423436433430423734444233383130463341383542383E';
wwv_flow_api.g_varchar2_table(876) := '3C41303734433141314237373342373442424334324231314244324644334333323E5D2F496E666F203137203020522F4C656E6774682035302F526F6F74203139203020522F53697A652031382F547970652F585265662F575B31203320315D3E3E7374';
wwv_flow_api.g_varchar2_table(877) := '7265616D0D0A68DE626200012646462773062620E32988E49F012219FBC0A40250F6FFEAF9203690470EC9F41D443232000418009FBB062B0D0A656E6473747265616D0D656E646F626A0D7374617274787265660D0A3131360D0A2525454F460D0A';
null;
end;
/
begin
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(39803500324457574)
,p_file_name=>'Users_Guide.pdf'
,p_mime_type=>'application/pdf'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(32371049652647272)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IG'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(32371318381647270)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(32371605151647270)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SWITCH'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(32371925126647270)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_RICH_TEXT_EDITOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(32372233298647270)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'IG'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(32372510122647269)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(32372860074647269)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'modern'
);
end;
/
prompt --application/shared_components/security/authorizations/data_upload_administrator
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(38332730334606649)
,p_name=>'Data Upload Administrator'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return pkg_sv_security.permission_check(p_user_sid => :g_user_sid,',
'                                             p_permission => ''Admin'');'))
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_reference_id=>0
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(38048119332367512)
,p_name=>'G_ASSESSMENT_TYPE'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(38332494514626243)
,p_name=>'G_DISTRICT_ID'
,p_scope=>'GLOBAL'
,p_protection_level=>'N'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(37790598582805477)
,p_name=>'G_FILE_PROCESSED'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(39664529902949950)
,p_name=>'G_ODS_NUMBER'
,p_scope=>'GLOBAL'
,p_protection_level=>'N'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(38334758980545768)
,p_name=>'G_USER_SID'
,p_scope=>'GLOBAL'
,p_protection_level=>'N'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
null;
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs/login_remember_username
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(32507577011647047)
,p_lov_name=>'LOGIN_REMEMBER_USERNAME'
,p_lov_query=>'.'||wwv_flow_api.id(32507577011647047)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(32507986812647045)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Remember username'
,p_lov_return_value=>'Y'
);
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(32505555654647067)
,p_group_name=>'Administration'
);
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(32373488522647264)
,p_name=>'Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(32373661142647263)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(33349326181804066)
,p_short_name=>'Data Reports'
,p_link=>'f?p=&APP_ID.:800:&SESSION.'
,p_page_id=>800
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(32374245685647257)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_internal_name=>'LEFT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32374582785647248)
,p_page_template_id=>wwv_flow_api.id(32374245685647257)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32374806795647247)
,p_page_template_id=>wwv_flow_api.id(32374245685647257)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32375109134647247)
,p_page_template_id=>wwv_flow_api.id(32374245685647257)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32375420825647247)
,p_page_template_id=>wwv_flow_api.id(32374245685647257)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32375793120647247)
,p_page_template_id=>wwv_flow_api.id(32374245685647257)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32376055086647247)
,p_page_template_id=>wwv_flow_api.id(32374245685647257)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32376320216647246)
,p_page_template_id=>wwv_flow_api.id(32374245685647257)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32376624815647246)
,p_page_template_id=>wwv_flow_api.id(32374245685647257)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_and_right_side_columns
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(32377060389647242)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_internal_name=>'LEFT_AND_RIGHT_SIDE_COLUMNS'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32377388358647241)
,p_page_template_id=>wwv_flow_api.id(32377060389647242)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32377694339647241)
,p_page_template_id=>wwv_flow_api.id(32377060389647242)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32377951477647241)
,p_page_template_id=>wwv_flow_api.id(32377060389647242)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32378252016647241)
,p_page_template_id=>wwv_flow_api.id(32377060389647242)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32378515764647240)
,p_page_template_id=>wwv_flow_api.id(32377060389647242)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32378821029647240)
,p_page_template_id=>wwv_flow_api.id(32377060389647242)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32379120952647240)
,p_page_template_id=>wwv_flow_api.id(32377060389647242)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32379414910647240)
,p_page_template_id=>wwv_flow_api.id(32377060389647242)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32379774851647239)
,p_page_template_id=>wwv_flow_api.id(32377060389647242)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
end;
/
prompt --application/shared_components/user_interface/templates/page/wizard_modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(32380105652647239)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_internal_name=>'WIZARD_MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--wizard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        #BODY#',
'      </div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--wizard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32380488277647239)
,p_page_template_id=>wwv_flow_api.id(32380105652647239)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32380763652647239)
,p_page_template_id=>wwv_flow_api.id(32380105652647239)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32381081708647238)
,p_page_template_id=>wwv_flow_api.id(32380105652647239)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/login
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(32381637758647238)
,p_theme_id=>42
,p_name=>'Login'
,p_internal_name=>'LOGIN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody--login no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #REGION_POSITION_01#',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="t-Body-wrap">',
'    <div class="t-Body-col t-Body-col--main">',
'      <div class="t-Login-container" role="main">#BODY#</div>',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32381911219647238)
,p_page_template_id=>wwv_flow_api.id(32381637758647238)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32382294403647237)
,p_page_template_id=>wwv_flow_api.id(32381637758647238)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(32382429528647237)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_internal_name=>'MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--standard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        #BODY#',
'      </div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--standard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32382727226647237)
,p_page_template_id=>wwv_flow_api.id(32382429528647237)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32383022065647237)
,p_page_template_id=>wwv_flow_api.id(32382429528647237)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32383320296647236)
,p_page_template_id=>wwv_flow_api.id(32382429528647237)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/master_detail
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(32383999836647236)
,p_theme_id=>42
,p_name=>'Marquee'
,p_internal_name=>'MASTER_DETAIL'
,p_is_popup=>false
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'))
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-info" id="t_Body_info">#REGION_POSITION_02#</div>',
'        <div class="t-Body-contentInner" role="main">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32384273620647235)
,p_page_template_id=>wwv_flow_api.id(32383999836647236)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32384500136647235)
,p_page_template_id=>wwv_flow_api.id(32383999836647236)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32384876066647234)
,p_page_template_id=>wwv_flow_api.id(32383999836647236)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32385156807647234)
,p_page_template_id=>wwv_flow_api.id(32383999836647236)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32385476802647234)
,p_page_template_id=>wwv_flow_api.id(32383999836647236)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32385734004647234)
,p_page_template_id=>wwv_flow_api.id(32383999836647236)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32386033148647234)
,p_page_template_id=>wwv_flow_api.id(32383999836647236)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32386313637647233)
,p_page_template_id=>wwv_flow_api.id(32383999836647236)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32386627703647233)
,p_page_template_id=>wwv_flow_api.id(32383999836647236)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/minimal_no_navigation
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(32387082354647233)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_internal_name=>'MINIMAL_NO_NAVIGATION'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"'
||'></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32387370789647232)
,p_page_template_id=>wwv_flow_api.id(32387082354647233)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32387616376647232)
,p_page_template_id=>wwv_flow_api.id(32387082354647233)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32387961075647232)
,p_page_template_id=>wwv_flow_api.id(32387082354647233)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32388255030647232)
,p_page_template_id=>wwv_flow_api.id(32387082354647233)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32388518537647231)
,p_page_template_id=>wwv_flow_api.id(32387082354647233)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32388828563647231)
,p_page_template_id=>wwv_flow_api.id(32387082354647233)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32389157364647231)
,p_page_template_id=>wwv_flow_api.id(32387082354647233)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/page/right_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(32389539971647231)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_internal_name=>'RIGHT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8"> ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" aria-label="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button'
||'>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32389881548647230)
,p_page_template_id=>wwv_flow_api.id(32389539971647231)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32390150246647230)
,p_page_template_id=>wwv_flow_api.id(32389539971647231)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32390457696647230)
,p_page_template_id=>wwv_flow_api.id(32389539971647231)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32390779439647230)
,p_page_template_id=>wwv_flow_api.id(32389539971647231)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32391066872647230)
,p_page_template_id=>wwv_flow_api.id(32389539971647231)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32391324763647229)
,p_page_template_id=>wwv_flow_api.id(32389539971647231)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32391621148647229)
,p_page_template_id=>wwv_flow_api.id(32389539971647231)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32391927633647229)
,p_page_template_id=>wwv_flow_api.id(32389539971647231)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/standard
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(32392348844647229)
,p_theme_id=>42
,p_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32392689652647228)
,p_page_template_id=>wwv_flow_api.id(32392348844647229)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32392925396647228)
,p_page_template_id=>wwv_flow_api.id(32392348844647229)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32393253130647228)
,p_page_template_id=>wwv_flow_api.id(32392348844647229)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32393548482647228)
,p_page_template_id=>wwv_flow_api.id(32392348844647229)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32393862217647227)
,p_page_template_id=>wwv_flow_api.id(32392348844647229)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32394188435647227)
,p_page_template_id=>wwv_flow_api.id(32392348844647229)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(32394430064647227)
,p_page_template_id=>wwv_flow_api.id(32392348844647229)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/button/icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(32479146109647144)
,p_template_name=>'Icon'
,p_internal_name=>'ICON'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"><'
||'/span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(32479868277647142)
,p_template_name=>'Text'
,p_internal_name=>'TEXT'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text_with_icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(32479918031647142)
,p_template_name=>'Text with Icon'
,p_internal_name=>'TEXT_WITH_ICON'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconRight'
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/region/alert
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32394861046647226)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">#BODY#</div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_internal_name=>'ALERT'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32395159541647222)
,p_plug_template_id=>wwv_flow_api.id(32394861046647226)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32398553479647218)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes_no_grid
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32398716891647217)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes (No Grid)'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES_NO_GRID'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3369790999010910123
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32399001165647217)
,p_plug_template_id=>wwv_flow_api.id(32398716891647217)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32399369914647217)
,p_plug_template_id=>wwv_flow_api.id(32398716891647217)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/buttons_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32399586131647217)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##CLOSE##DELETE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      <h2 class="t-ButtonRegion-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_internal_name=>'BUTTONS_CONTAINER'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32399879594647217)
,p_plug_template_id=>wwv_flow_api.id(32399586131647217)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32400126099647216)
,p_plug_template_id=>wwv_flow_api.id(32399586131647217)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/carousel_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32401702999647215)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'   <div class="t-Region-carouselRegions">',
'     #SUB_REGIONS#',
'   </div>',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_internal_name=>'CAROUSEL_CONTAINER'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.1/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#'))
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32402030534647214)
,p_plug_template_id=>wwv_flow_api.id(32401702999647215)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32402380198647214)
,p_plug_template_id=>wwv_flow_api.id(32401702999647215)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/collapsible
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32408979195647209)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems  t-Region-headerItems--controls"><button class="t-Button t-Button--icon t-Button--hideShow" type="button"></button></div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_internal_name=>'COLLAPSIBLE'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32409245168647209)
,p_plug_template_id=>wwv_flow_api.id(32408979195647209)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32409502038647208)
,p_plug_template_id=>wwv_flow_api.id(32408979195647209)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/content_block
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32414306433647205)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ContentBlock #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ContentBlock-header">',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--title">',
'      <span class="t-ContentBlock-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'      <h1 class="t-ContentBlock-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'      #EDIT#',
'    </div>',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--buttons">#CHANGE#</div>',
'  </div>',
'  <div class="t-ContentBlock-body">#BODY#</div>',
'  <div class="t-ContentBlock-buttons">#PREVIOUS##NEXT#</div>',
'</div>',
''))
,p_page_plug_template_name=>'Content Block'
,p_internal_name=>'CONTENT_BLOCK'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-ContentBlock--h1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2320668864738842174
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/hero
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32416311859647203)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-wrap">',
'    <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'      <h1 class="t-HeroRegion-title">#TITLE#</h1>',
'      #BODY#',
'    </div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Hero'
,p_internal_name=>'HERO'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32416687985647203)
,p_plug_template_id=>wwv_flow_api.id(32416311859647203)
,p_name=>'Region Body'
,p_placeholder=>'#BODY#'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_dialog
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32418436879647202)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_internal_name=>'INLINE_DIALOG'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32418710607647201)
,p_plug_template_id=>wwv_flow_api.id(32418436879647202)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_popup
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32420747535647200)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionPopup" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Popup'
,p_internal_name=>'INLINE_POPUP'
,p_theme_id=>42
,p_theme_class_id=>24
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>1483922538999385230
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32421045343647200)
,p_plug_template_id=>wwv_flow_api.id(32420747535647200)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/interactive_report
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32422679959647198)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#">',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Interactive Report'
,p_internal_name=>'INTERACTIVE_REPORT'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/login
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32423216519647198)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Login-header">',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">',
'    #BODY#',
'  </div>',
'  <div class="t-Login-buttons">',
'    #NEXT#',
'  </div>',
'  <div class="t-Login-links">',
'    #EDIT##CREATE#',
'  </div>',
'  #SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_internal_name=>'LOGIN'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32423568088647198)
,p_plug_template_id=>wwv_flow_api.id(32423216519647198)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/standard
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32423732821647198)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32424074282647197)
,p_plug_template_id=>wwv_flow_api.id(32423732821647198)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32424304872647197)
,p_plug_template_id=>wwv_flow_api.id(32423732821647198)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/tabs_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32430585101647193)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES# apex-tabs-region" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Tabs Container'
,p_internal_name=>'TABS_CONTAINER'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32430813334647192)
,p_plug_template_id=>wwv_flow_api.id(32430585101647193)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32431149652647192)
,p_plug_template_id=>wwv_flow_api.id(32430585101647193)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/title_bar
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32433141235647191)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#"> ',
'  <div class="t-BreadcrumbRegion-body">',
'    <div class="t-BreadcrumbRegion-breadcrumb">',
'      #BODY#',
'    </div>',
'    <div class="t-BreadcrumbRegion-title">',
'      <h1 class="t-BreadcrumbRegion-titleText">#TITLE#</h1>',
'    </div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Title Bar'
,p_internal_name=>'TITLE_BAR'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(32434164421647190)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title">#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">',
'        #BODY#',
'      </div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_internal_name=>'WIZARD_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(32434402611647189)
,p_plug_template_id=>wwv_flow_api.id(32434164421647190)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/list/badge_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(32456278579647168)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_theme_id=>42
,p_theme_class_id=>3
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--cols t-BadgeList--3cols:t-BadgeList--circular'
,p_list_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'Link Classes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/cards
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(32460273497647163)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item is-active #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Attributes'
,p_a06_label=>'Card Color Class'
,p_a07_label=>'Subtitle'
,p_reference_id=>2885322685880632508
);
end;
/
prompt --application/shared_components/user_interface/templates/list/links_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(32465873533647159)
,p_list_template_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_name=>'Links List'
,p_internal_name=>'LINKS_LIST'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_item_templ_curr_w_child=>'<li class="t-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t'
||'-LinksList-badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
end;
/
prompt --application/shared_components/user_interface/templates/list/media_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(32467473365647158)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Class'
,p_a06_label=>'Icon Color Class'
,p_reference_id=>2066548068783481421
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(32470257942647156)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_internal_name=>'MENU_BAR'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_reference_id=>2008709236185638887
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_popup
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(32471211979647154)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_internal_name=>'MENU_POPUP'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({ slide: e.hasClass("js-slide"), iconType: ''fa''});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Data ID'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut'
,p_reference_id=>3492264004432431646
);
end;
/
prompt --application/shared_components/user_interface/templates/list/tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(32471687505647154)
,p_list_template_current=>'<li class="t-Tabs-item is-active"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_internal_name=>'TABS'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Tabs--simple'
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>3288206686691809997
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(32473240049647152)
,p_list_template_current=>'<li class="t-NavTabs-item #A03# is-active" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class'
||'="t-NavTabs-badge #A05#">#A02#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-NavTabs-item #A03#" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class="t-NavTab'
||'s-badge #A05#">#A02#</span></a></li>'
,p_list_template_name=>'Top Navigation Tabs'
,p_internal_name=>'TOP_NAVIGATION_TABS'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-NavTabs--inlineLabels-lg:t-NavTabs--displayLabels-sm'
,p_list_template_before_rows=>'<ul class="t-NavTabs #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_navtabs">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'List Item ID'
,p_a02_label=>'Badge Value'
,p_a03_label=>'List Item Class'
,p_a04_label=>'Link Class'
,p_a05_label=>'Badge Class'
,p_reference_id=>1453011561172885578
);
end;
/
prompt --application/shared_components/user_interface/templates/list/wizard_progress
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(32474877519647151)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step is-active" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap" data-link="#LINK#"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></'
||'div></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap" data-link="#LINK#"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></div></li>',
''))
,p_list_template_name=>'Wizard Progress'
,p_internal_name=>'WIZARD_PROGRESS'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(32476213372647150)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_internal_name=>'TOP_NAVIGATION_MENU'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True / False'
,p_a03_label=>'Hide'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut Key'
,p_reference_id=>2525307901300239072
);
end;
/
prompt --application/shared_components/user_interface/templates/list/navigation_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(32477235507647149)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_internal_name=>'NAVIGATION_BAR'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_reference_id=>2846096252961119197
);
end;
/
prompt --application/shared_components/user_interface/templates/list/side_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(32477475835647148)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_internal_name=>'SIDE_NAVIGATION_MENU'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>'apex.jQuery(''body'').addClass(''t-PageBody--leftNav'');'
,p_theme_id=>42
,p_theme_class_id=>19
,p_preset_template_options=>'t-TreeNav--styleA'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&APP_TITLE!ATTR.">',
'<div class="t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&APP_TITLE!ATTR."><ul style="display:none">'))
,p_list_template_after_rows=>'</ul></div></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True/False'
,p_a04_label=>'Title'
,p_reference_id=>2466292414354694776
);
end;
/
prompt --application/shared_components/user_interface/templates/report/alerts
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(32435459458647188)
,p_row_template_name=>'Alerts'
,p_internal_name=>'ALERTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_alerts" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/badge_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(32435677417647185)
,p_row_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
' <span class="t-BadgeList-wrap u-color">',
'  <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
' </span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed:t-BadgeList--circular'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/cards
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(32439683199647182)
,p_row_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':CARD_LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <div class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/comments
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(32445007589647178)
,p_row_template_name=>'Comments'
,p_internal_name=>'COMMENTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'    <div class="t-Comments-icon">',
'        <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'    </div>',
'    <div class="t-Comments-body">',
'        <div class="t-Comments-info">',
'            #USER_NAME# <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'        </div>',
'        <div class="t-Comments-comment">',
'            #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/search_results
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(32446283980647177)
,p_row_template_name=>'Search Results'
,p_internal_name=>'SEARCH_RESULTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/standard
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(32446447746647176)
,p_row_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" aria-label="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(32446447746647176)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_column
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(32449073575647174)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_COLUMN'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_row
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(32451098222647172)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/timeline
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(32452816162647171)
,p_row_template_name=>'Timeline'
,p_internal_name=>'TIMELINE'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline" data-region-id="#REGION_STATIC_ID#">',
''))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/media_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(32453231342647171)
,p_row_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#"><span class="t-Icon #ICON_CLASS#"></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'            <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#LIST_BADGE#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_preset_template_options=>'t-MediaList--stack'
,p_reference_id=>2092157460408299055
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/hidden
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(32478477883647147)
,p_template_name=>'Hidden'
,p_internal_name=>'HIDDEN'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(32478503873647146)
,p_template_name=>'Optional'
,p_internal_name=>'OPTIONAL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(32478649535647146)
,p_template_name=>'Optional - Above'
,p_internal_name=>'OPTIONAL_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(32478735398647145)
,p_template_name=>'Optional - Floating'
,p_internal_name=>'OPTIONAL_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>1607675164727151865
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(32478848486647145)
,p_template_name=>'Required'
,p_internal_name=>'REQUIRED'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer is-required rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(32478938165647145)
,p_template_name=>'Required - Above'
,p_internal_name=>'REQUIRED_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(32479024892647145)
,p_template_name=>'Required - Floating'
,p_internal_name=>'REQUIRED_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>1607675344320152883
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(32481279516647141)
,p_name=>'Breadcrumb'
,p_internal_name=>'BREADCRUMB'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active"><h1 class="t-Breadcrumb-label">#NAME#</h1></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(32481438609647136)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="apex-item-text"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(32481362302647139)
,p_cal_template_name=>'Calendar'
,p_internal_name=>'CALENDAR'
,p_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_cust_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_cust_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">'
,p_cust_weekend_close_format=>'</td>'
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_cust_wk_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_weekend_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_wk_weekend_close_format=>'</td>'
,p_agenda_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(32482647096647127)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(32392348844647229)
,p_default_dialog_template=>wwv_flow_api.id(32382429528647237)
,p_error_template=>wwv_flow_api.id(32381637758647238)
,p_printer_friendly_template=>wwv_flow_api.id(32392348844647229)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(32381637758647238)
,p_default_button_template=>wwv_flow_api.id(32479868277647142)
,p_default_region_template=>wwv_flow_api.id(32423732821647198)
,p_default_chart_template=>wwv_flow_api.id(32423732821647198)
,p_default_form_template=>wwv_flow_api.id(32423732821647198)
,p_default_reportr_template=>wwv_flow_api.id(32423732821647198)
,p_default_tabform_template=>wwv_flow_api.id(32423732821647198)
,p_default_wizard_template=>wwv_flow_api.id(32423732821647198)
,p_default_menur_template=>wwv_flow_api.id(32433141235647191)
,p_default_listr_template=>wwv_flow_api.id(32423732821647198)
,p_default_irr_template=>wwv_flow_api.id(32422679959647198)
,p_default_report_template=>wwv_flow_api.id(32446447746647176)
,p_default_label_template=>wwv_flow_api.id(32478735398647145)
,p_default_menu_template=>wwv_flow_api.id(32481279516647141)
,p_default_calendar_template=>wwv_flow_api.id(32481362302647139)
,p_default_list_template=>wwv_flow_api.id(32465873533647159)
,p_default_nav_list_template=>wwv_flow_api.id(32476213372647150)
,p_default_top_nav_list_temp=>wwv_flow_api.id(32476213372647150)
,p_default_side_nav_list_temp=>wwv_flow_api.id(32477475835647148)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(32399586131647217)
,p_default_dialogr_template=>wwv_flow_api.id(32398553479647218)
,p_default_option_label=>wwv_flow_api.id(32478735398647145)
,p_default_required_label=>wwv_flow_api.id(32479024892647145)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(32477235507647149)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.3/')
,p_files_version=>62
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(32481641438647134)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(32481819632647134)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>true
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(32482011012647133)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3543348412015319650
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(32482262166647133)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>1938457712423918173
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(32482424319647133)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32395473215647220)
,p_theme_id=>42
,p_name=>'ALERT_TITLE'
,p_display_name=>'Alert Title'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the title of the alert is displayed.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32396032220647219)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32396489362647219)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32396829992647219)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32400406698647216)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32400804203647216)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32402633477647214)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32403638734647213)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32405083989647212)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32406280441647211)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32406849674647210)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32407207279647210)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32410612833647208)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32412455934647206)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_ICON_POSITION'
,p_display_name=>'Collapsible Icon Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the position of the expand and collapse toggle for the region.'
,p_null_text=>'Start'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32413060614647206)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_BUTTON_ICONS'
,p_display_name=>'Collapsible Button Icons'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines which arrows to use to represent the icons for the collapse and expand button.'
,p_null_text=>'Arrows'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32414645725647205)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32415425869647204)
,p_theme_id=>42
,p_name=>'BODY_STYLE'
,p_display_name=>'Body Style'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the region''s body container.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32417364099647203)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON'
,p_display_name=>'Display Icon'
,p_display_sequence=>50
,p_template_types=>'REGION'
,p_help_text=>'Display the Hero Region icon.'
,p_null_text=>'Yes (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32417707459647202)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REGION'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Rounded Corners'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32419241667647201)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32431615511647192)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32432045567647191)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32432454253647191)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32434768499647189)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32435909553647185)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the overall style for the component.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32436302212647185)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32438195781647183)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32440574487647182)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>70
,p_template_types=>'REPORT'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32441782626647181)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32442507825647180)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32444164827647179)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REPORT'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32445395476647178)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32446781839647176)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32447193648647175)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32447938281647175)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32449348442647174)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32454966552647169)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>35
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32456500595647166)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32456939380647165)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32458744845647164)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32461103157647162)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>80
,p_template_types=>'LIST'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32462316701647161)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32463178809647161)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32464799553647160)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'LIST'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32466906549647158)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32469147190647156)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32473592764647152)
,p_theme_id=>42
,p_name=>'MOBILE'
,p_display_name=>'Mobile'
,p_display_sequence=>100
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a mobile-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32473951620647152)
,p_theme_id=>42
,p_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_sequence=>90
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a desktop-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32475357979647150)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32479385900647143)
,p_theme_id=>42
,p_name=>'ICON_HOVER_ANIMATION'
,p_display_name=>'Icon Hover Animation'
,p_display_sequence=>55
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32480597518647142)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32482853470647122)
,p_theme_id=>42
,p_name=>'BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the bottom margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32483272975647121)
,p_theme_id=>42
,p_name=>'REGION_BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>210
,p_template_types=>'REGION'
,p_help_text=>'Set the bottom margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32484888179647120)
,p_theme_id=>42
,p_name=>'LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the left margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32485204571647120)
,p_theme_id=>42
,p_name=>'REGION_LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'REGION'
,p_help_text=>'Set the left margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32486849289647119)
,p_theme_id=>42
,p_name=>'RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'FIELD'
,p_help_text=>'Set the right margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32487239160647118)
,p_theme_id=>42
,p_name=>'REGION_RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'REGION'
,p_help_text=>'Set the right margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32488874260647117)
,p_theme_id=>42
,p_name=>'TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'FIELD'
,p_help_text=>'Set the top margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32489240134647117)
,p_theme_id=>42
,p_name=>'REGION_TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'REGION'
,p_help_text=>'Set the top margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32490832861647116)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32491256213647116)
,p_theme_id=>42
,p_name=>'SPACING_BOTTOM'
,p_display_name=>'Spacing Bottom'
,p_display_sequence=>100
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the bottom of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32491628912647115)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32492001979647115)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32492423979647115)
,p_theme_id=>42
,p_name=>'SPACING_TOP'
,p_display_name=>'Spacing Top'
,p_display_sequence=>90
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the top of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32492822821647115)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32493234948647114)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32494648696647114)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32496048105647113)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32497037577647112)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32497415986647112)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32497808172647111)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32498231946647111)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Padding'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32498879644647111)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32499425301647110)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32499801883647110)
,p_theme_id=>42
,p_name=>'ITEM_POST_TEXT'
,p_display_name=>'Item Post Text'
,p_display_sequence=>30
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Post Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32500254519647110)
,p_theme_id=>42
,p_name=>'ITEM_PRE_TEXT'
,p_display_name=>'Item Pre Text'
,p_display_sequence=>20
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Pre Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32500698281647109)
,p_theme_id=>42
,p_name=>'RADIO_GROUP_DISPLAY'
,p_display_name=>'Item Group Display'
,p_display_sequence=>300
,p_template_types=>'FIELD'
,p_help_text=>'Determines the display style for radio and check box items.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(32501426019647109)
,p_theme_id=>42
,p_name=>'PAGINATION_DISPLAY'
,p_display_name=>'Pagination Display'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of pagination for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32376971237647242)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(32374245685647257)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32380093743647239)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(32377060389647242)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32381351174647238)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(32380105652647239)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32381517664647238)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_api.id(32380105652647239)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32383657175647236)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(32382429528647237)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32383877506647236)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(32382429528647237)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32386977947647233)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(32383999836647236)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32389494422647231)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(32387082354647233)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32392266613647229)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(32389539971647231)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32394755320647227)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(32392348844647229)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32395645036647220)
,p_theme_id=>42
,p_name=>'HIDDENHEADER'
,p_display_name=>'Hidden but Accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32394861046647226)
,p_css_classes=>'t-Alert--accessibleHeading'
,p_group_id=>wwv_flow_api.id(32395473215647220)
,p_template_types=>'REGION'
,p_help_text=>'Visually hides the alert title, but assistive technologies can still read it.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32395842409647219)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(32394861046647226)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32396207934647219)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32394861046647226)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(32396032220647219)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32396656214647219)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32394861046647226)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(32396489362647219)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32397093993647219)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32394861046647226)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(32396829992647219)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32397247314647218)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32394861046647226)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(32396032220647219)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32397433015647218)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32394861046647226)
,p_css_classes=>'t-Alert--removeHeading'
,p_group_id=>wwv_flow_api.id(32395473215647220)
,p_template_types=>'REGION'
,p_help_text=>'Hides the Alert Title from being displayed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32397685501647218)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(32394861046647226)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(32396032220647219)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32397826377647218)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32394861046647226)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(32396032220647219)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32398048728647218)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32394861046647226)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(32396829992647219)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32398295040647218)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32394861046647226)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(32396489362647219)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32398474451647218)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32394861046647226)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(32396489362647219)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32400638525647216)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(32399586131647217)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(32400406698647216)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32401029664647216)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(32399586131647217)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(32400804203647216)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32401296297647216)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(32399586131647217)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(32400406698647216)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32401452173647215)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(32399586131647217)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(32400804203647216)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32401638546647215)
,p_theme_id=>42
,p_name=>'STICK_TO_BOTTOM'
,p_display_name=>'Stick to Bottom for Mobile'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32399586131647217)
,p_css_classes=>'t-ButtonRegion--stickToBottom'
,p_template_types=>'REGION'
,p_help_text=>'This will position the button container region to the bottom of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32402843561647214)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(32402633477647214)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32403089305647213)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(32402633477647214)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32403264969647213)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(32402633477647214)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32403432511647213)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(32402633477647214)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32403893530647213)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(32403638734647213)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32404029001647213)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(32403638734647213)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32404251598647213)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(32403638734647213)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32404485266647212)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(32403638734647213)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32404675428647212)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32404800060647212)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32405206176647212)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32405453900647211)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32405680473647211)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32405876707647211)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32406081044647211)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32406479388647211)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(32406280441647211)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32406654701647211)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(32406280441647211)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32407041972647210)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(32406849674647210)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32407413025647210)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(32407207279647210)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32407641024647210)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(32400406698647216)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32407898440647210)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32408097001647210)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(32407207279647210)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32408226934647209)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(32406849674647210)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32408471645647209)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32408634454647209)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32408805065647209)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32401702999647215)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(32400406698647216)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32409885198647208)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(32402633477647214)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32410096822647208)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(32402633477647214)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32410270443647208)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(32402633477647214)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32410446209647208)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(32402633477647214)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32410855588647208)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(32410612833647208)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32411083375647207)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(32410612833647208)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32411280604647207)
,p_theme_id=>42
,p_name=>'REMEMBER_COLLAPSIBLE_STATE'
,p_display_name=>'Remember Collapsible State'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
,p_help_text=>'This option saves the current state of the collapsible region for the duration of the session.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32411450845647207)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32411645748647207)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32411880297647207)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32412026514647207)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32412205631647206)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32412644268647206)
,p_theme_id=>42
,p_name=>'CONRTOLS_POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'t-Region--controlsPosEnd'
,p_group_id=>wwv_flow_api.id(32412455934647206)
,p_template_types=>'REGION'
,p_help_text=>'Position the expand / collapse button to the end of the region header.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32412889281647206)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(32406849674647210)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32413238379647206)
,p_theme_id=>42
,p_name=>'ICONS_PLUS_OR_MINUS'
,p_display_name=>'Plus or Minus'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'t-Region--hideShowIconsMath'
,p_group_id=>wwv_flow_api.id(32413060614647206)
,p_template_types=>'REGION'
,p_help_text=>'Use the plus and minus icons for the expand and collapse button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32413400834647206)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(32400406698647216)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32413658183647206)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32413867183647205)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(32400406698647216)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32414077196647205)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(32406849674647210)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32414281326647205)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32408979195647209)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(32400406698647216)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32414892817647205)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H1'
,p_display_name=>'Heading Level 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32414306433647205)
,p_css_classes=>'t-ContentBlock--h1'
,p_group_id=>wwv_flow_api.id(32414645725647205)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32415027996647204)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H2'
,p_display_name=>'Heading Level 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32414306433647205)
,p_css_classes=>'t-ContentBlock--h2'
,p_group_id=>wwv_flow_api.id(32414645725647205)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32415218915647204)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H3'
,p_display_name=>'Heading Level 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32414306433647205)
,p_css_classes=>'t-ContentBlock--h3'
,p_group_id=>wwv_flow_api.id(32414645725647205)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32415634764647204)
,p_theme_id=>42
,p_name=>'LIGHT_BACKGROUND'
,p_display_name=>'Light Background'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32414306433647205)
,p_css_classes=>'t-ContentBlock--lightBG'
,p_group_id=>wwv_flow_api.id(32415425869647204)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly lighter background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32415899482647204)
,p_theme_id=>42
,p_name=>'ADD_BODY_PADDING'
,p_display_name=>'Add Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32414306433647205)
,p_css_classes=>'t-ContentBlock--padded'
,p_template_types=>'REGION'
,p_help_text=>'Adds padding to the region''s body container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32416008174647203)
,p_theme_id=>42
,p_name=>'SHADOW_BACKGROUND'
,p_display_name=>'Shadow Background'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32414306433647205)
,p_css_classes=>'t-ContentBlock--shadowBG'
,p_group_id=>wwv_flow_api.id(32415425869647204)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly darker background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32416200286647203)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32414306433647205)
,p_css_classes=>'t-ContentBlock--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32416926900647203)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32416311859647203)
,p_css_classes=>'t-HeroRegion--featured'
,p_group_id=>wwv_flow_api.id(32400406698647216)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32417189067647203)
,p_theme_id=>42
,p_name=>'STACKED_FEATURED'
,p_display_name=>'Stacked Featured'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32416311859647203)
,p_css_classes=>'t-HeroRegion--featured t-HeroRegion--centered'
,p_group_id=>wwv_flow_api.id(32400406698647216)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32417591983647202)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON_NO'
,p_display_name=>'No'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32416311859647203)
,p_css_classes=>'t-HeroRegion--hideIcon'
,p_group_id=>wwv_flow_api.id(32417364099647203)
,p_template_types=>'REGION'
,p_help_text=>'Hide the Hero Region icon.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32417906921647202)
,p_theme_id=>42
,p_name=>'ICONS_CIRCULAR'
,p_display_name=>'Circle'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32416311859647203)
,p_css_classes=>'t-HeroRegion--iconsCircle'
,p_group_id=>wwv_flow_api.id(32417707459647202)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a circle.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32418139227647202)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32416311859647203)
,p_css_classes=>'t-HeroRegion--iconsSquare'
,p_group_id=>wwv_flow_api.id(32417707459647202)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a square.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32418347515647202)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32416311859647203)
,p_css_classes=>'t-HeroRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the hero region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32419016833647201)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(32418436879647202)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32419434210647201)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32418436879647202)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(32419241667647201)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32419638331647201)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32418436879647202)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(32419241667647201)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32419875524647201)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32418436879647202)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(32419241667647201)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32420053229647201)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32418436879647202)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32420269485647200)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32418436879647202)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32420477812647200)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32418436879647202)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32420615918647200)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(32418436879647202)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32421394838647199)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(32420747535647200)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32421586481647199)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(32420747535647200)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_api.id(32419241667647201)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32421754462647199)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32420747535647200)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(32419241667647201)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32421991907647199)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32420747535647200)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(32419241667647201)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32422137341647199)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32420747535647200)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(32419241667647201)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32422388337647199)
,p_theme_id=>42
,p_name=>'REMOVE_PAGE_OVERLAY'
,p_display_name=>'Remove Page Overlay'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32420747535647200)
,p_css_classes=>'js-popup-noOverlay'
,p_template_types=>'REGION'
,p_help_text=>'This option will display the inline dialog without an overlay on the background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32422561131647198)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32420747535647200)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32422921056647198)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32422679959647198)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32423120521647198)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32422679959647198)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32424624783647197)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(32402633477647214)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32424802050647197)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(32402633477647214)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32425092668647197)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(32402633477647214)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32425248781647196)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(32402633477647214)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32425447634647196)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32425627081647196)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32425817756647196)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32426037097647196)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32426215938647196)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32426461784647196)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32426699456647195)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32426864338647195)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32427093215647195)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32427236272647195)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32427461807647195)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32427685701647195)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32427814503647194)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32428017444647194)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32428289801647194)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32428400159647194)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_api.id(32405083989647212)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32428669921647194)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(32406849674647210)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32428864756647194)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(32407207279647210)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32429089770647194)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(32400406698647216)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32429270844647193)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32429491069647193)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(32400406698647216)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32429605664647193)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(32407207279647210)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32429878807647193)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(32406849674647210)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32430051696647193)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32430270802647193)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(32400406698647216)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32430452116647193)
,p_theme_id=>42
,p_name=>'TEXT_CONTENT'
,p_display_name=>'Text Content'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(32423732821647198)
,p_css_classes=>'t-Region--textContent'
,p_group_id=>wwv_flow_api.id(32400406698647216)
,p_template_types=>'REGION'
,p_help_text=>'Useful for displaying primarily text-based content, such as FAQs and more.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32431420121647192)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32430585101647193)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32431843789647191)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32430585101647193)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(32431615511647192)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32432249126647191)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32430585101647193)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(32432045567647191)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32432654456647191)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32430585101647193)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(32432454253647191)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32432894382647191)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32430585101647193)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(32432454253647191)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32433070165647191)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32430585101647193)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(32432045567647191)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32433454084647190)
,p_theme_id=>42
,p_name=>'USE_COMPACT_STYLE'
,p_display_name=>'Use Compact Style'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32433141235647191)
,p_css_classes=>'t-BreadcrumbRegion--compactTitle'
,p_template_types=>'REGION'
,p_help_text=>'Uses a compact style for the breadcrumbs.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32433688492647190)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(32433141235647191)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32433896691647190)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(32433141235647191)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(32414645725647205)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32434080720647190)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(32433141235647191)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(32414645725647205)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32434946501647189)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(32434164421647190)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(32434768499647189)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32435162053647189)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32434164421647190)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(32434768499647189)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32435349203647189)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(32434164421647190)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32436132864647185)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(32435909553647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32436516892647185)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32436784189647184)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32436978154647184)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32437150841647184)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32437374889647184)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(32435909553647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32437536704647184)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32437764562647184)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32437975163647184)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32438358767647183)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(32438195781647183)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32438545046647183)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(32438195781647183)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32438716221647183)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(32438195781647183)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32438995239647183)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32439151098647183)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(32438195781647183)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32439352463647183)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(32438195781647183)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32439582244647182)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32435677417647185)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32439993117647182)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32440180831647182)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32440321942647182)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32440739141647181)
,p_theme_id=>42
,p_name=>'CARDS_COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(32440574487647182)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32440951467647181)
,p_theme_id=>42
,p_name=>'CARD_RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(32440574487647182)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32441190726647181)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(32435909553647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32441302631647181)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32441568272647181)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(32435909553647185)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32441933012647181)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(32441782626647181)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32442128683647180)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(32441782626647181)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32442369431647180)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(32441782626647181)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32442718307647180)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(32442507825647180)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32442998016647180)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(32442507825647180)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32443171436647180)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32443383591647180)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(32435909553647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32443509296647179)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(32435909553647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32443715016647179)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32443926001647179)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(32441782626647181)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32444347599647179)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_api.id(32444164827647179)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32444589222647179)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_api.id(32444164827647179)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32444723704647178)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32444986522647178)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32439683199647182)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32445574606647178)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32445007589647178)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(32445395476647178)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32445717488647177)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32445007589647178)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(32445395476647178)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32445947744647177)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32445007589647178)
,p_css_classes=>'t-Comments--iconsRounded'
,p_group_id=>wwv_flow_api.id(32444164827647179)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32446107097647177)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32445007589647178)
,p_css_classes=>'t-Comments--iconsSquare'
,p_group_id=>wwv_flow_api.id(32444164827647179)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32446990629647176)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32446447746647176)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(32446781839647176)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32447372442647175)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32446447746647176)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(32447193648647175)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32447511396647175)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(32446447746647176)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(32447193648647175)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32447789861647175)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(32446447746647176)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(32447193648647175)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32448115708647175)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32446447746647176)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(32447938281647175)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32448309909647175)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32446447746647176)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(32447938281647175)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32448543817647174)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32446447746647176)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(32446781839647176)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32448751387647174)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32446447746647176)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32448977311647174)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32446447746647176)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(32447193648647175)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32449590440647174)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(32449073575647174)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(32449348442647174)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32449757111647173)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32449073575647174)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(32449348442647174)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32449929295647173)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32449073575647174)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(32449348442647174)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32450155758647173)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32449073575647174)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32450307156647173)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32449073575647174)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32450592944647173)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(32449073575647174)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(32449348442647174)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32450710613647173)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(32449073575647174)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(32449348442647174)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32450981162647173)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(32449073575647174)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(32449348442647174)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32451367352647172)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(32451098222647172)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(32449348442647174)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32451575182647172)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32451098222647172)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(32449348442647174)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32451752596647172)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32451098222647172)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(32449348442647174)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32451966206647172)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32451098222647172)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32452142402647172)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32451098222647172)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32452341301647171)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(32451098222647172)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(32449348442647174)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32452570421647171)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(32451098222647172)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(32449348442647174)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32452715609647171)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(32451098222647172)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(32449348442647174)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32453126102647171)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(32452816162647171)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(32435909553647185)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact version of timeline with smaller text and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32453533377647170)
,p_theme_id=>42
,p_name=>'2_COLUMN_GRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32453231342647171)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32453704824647170)
,p_theme_id=>42
,p_name=>'3_COLUMN_GRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32453231342647171)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32453959896647170)
,p_theme_id=>42
,p_name=>'4_COLUMN_GRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(32453231342647171)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32454188098647170)
,p_theme_id=>42
,p_name=>'5_COLUMN_GRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(32453231342647171)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32454317602647170)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(32453231342647171)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32454545953647170)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32453231342647171)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_api.id(32444164827647179)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32454790747647170)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32453231342647171)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_api.id(32444164827647179)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32455196712647169)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32453231342647171)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(32454966552647169)
,p_template_types=>'REPORT'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32455348237647169)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(32453231342647171)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32455552221647169)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(32453231342647171)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32455775714647169)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(32453231342647171)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32455989827647169)
,p_theme_id=>42
,p_name=>'STACK'
,p_display_name=>'Stack'
,p_display_sequence=>5
,p_report_template_id=>wwv_flow_api.id(32453231342647171)
,p_css_classes=>'t-MediaList--stack'
,p_group_id=>wwv_flow_api.id(32436302212647185)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32456154981647169)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(32453231342647171)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32456746749647166)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(32456500595647166)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32457153066647165)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32457380298647165)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32457532137647165)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32457717087647165)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32457904026647165)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(32456500595647166)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32458191696647165)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32458317325647164)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32458542254647164)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32458938546647164)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(32458744845647164)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32459109881647164)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(32458744845647164)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32459365474647164)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(32458744845647164)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32459562504647164)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32459716414647163)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(32458744845647164)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32459941984647163)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(32458744845647164)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32460167195647163)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32456278579647168)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32460557030647163)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32460734413647163)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32460935196647162)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32461321732647162)
,p_theme_id=>42
,p_name=>'COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(32461103157647162)
,p_template_types=>'LIST'
,p_help_text=>'Fills the card background with the color of the icon or default link style.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32461559842647162)
,p_theme_id=>42
,p_name=>'RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(32461103157647162)
,p_template_types=>'LIST'
,p_help_text=>'Raises the card so it pops up.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32461782659647162)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(32456500595647166)
,p_template_types=>'LIST'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32461915459647162)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32462140184647162)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(32456500595647166)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32462512049647161)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(32462316701647161)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32462751632647161)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(32462316701647161)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32462915165647161)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(32462316701647161)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32463317626647161)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(32463178809647161)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32463577378647161)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(32463178809647161)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32463725207647160)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32463901122647160)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(32456500595647166)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32464176543647160)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(32456500595647166)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32464303809647160)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32464588468647160)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(32462316701647161)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32464915402647160)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_api.id(32464799553647160)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32465120096647159)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_api.id(32464799553647160)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32465384945647159)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32465569643647159)
,p_theme_id=>42
,p_name=>'CARDS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'t-Cards--stacked'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_help_text=>'Stacks the cards on top of each other.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32465752166647159)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32460273497647163)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32466183978647159)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32465873533647159)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(32456500595647166)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32466314378647159)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(32465873533647159)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32466571645647158)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32465873533647159)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32466785135647158)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32465873533647159)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32467168969647158)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32465873533647159)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(32466906549647158)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32467392449647158)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32465873533647159)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(32466906549647158)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32467755833647157)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32467473365647158)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32467909832647157)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32467473365647158)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32468148899647157)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(32467473365647158)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32468399203647157)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(32467473365647158)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32468500376647157)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(32467473365647158)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32468735481647157)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32467473365647158)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_api.id(32464799553647160)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32468937527647156)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32467473365647158)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_api.id(32464799553647160)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32469387067647156)
,p_theme_id=>42
,p_name=>'LIST_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32467473365647158)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(32469147190647156)
,p_template_types=>'LIST'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32469595009647156)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(32467473365647158)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32469789144647156)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32467473365647158)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32469946842647156)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32467473365647158)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Display an icon next to the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32470139944647156)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(32467473365647158)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies colors from the Theme''s color palette to icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32470560822647155)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(32470257942647156)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32470703551647155)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(32470257942647156)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32470913934647154)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32470257942647156)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32471135802647154)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32470257942647156)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32471573937647154)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32471211979647154)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Enables you to define a keyboard shortcut to activate the menu item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32471907954647153)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(32471687505647154)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(32456939380647165)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32472164342647153)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32471687505647154)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(32463178809647161)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32472388176647153)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32471687505647154)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(32463178809647161)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32472555183647153)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32471687505647154)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(32469147190647156)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32472700337647152)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32471687505647154)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(32456500595647166)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32472923757647152)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32471687505647154)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(32456500595647166)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32473123600647152)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(32471687505647154)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(32469147190647156)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32473762360647152)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_SM'
,p_display_name=>'Display labels'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(32473240049647152)
,p_css_classes=>'t-NavTabs--displayLabels-sm'
,p_group_id=>wwv_flow_api.id(32473592764647152)
,p_template_types=>'LIST'
,p_help_text=>'Displays the label for the list items below the icon'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32474157477647151)
,p_theme_id=>42
,p_name=>'NO_LABEL_LG'
,p_display_name=>'Do not display labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(32473240049647152)
,p_css_classes=>'t-NavTabs--hiddenLabels-lg'
,p_group_id=>wwv_flow_api.id(32473951620647152)
,p_template_types=>'LIST'
,p_help_text=>'Hides the label for the list item'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32474328231647151)
,p_theme_id=>42
,p_name=>'HIDE_LABELS_SM'
,p_display_name=>'Do not display labels'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(32473240049647152)
,p_css_classes=>'t-NavTabs--hiddenLabels-sm'
,p_group_id=>wwv_flow_api.id(32473592764647152)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32474590314647151)
,p_theme_id=>42
,p_name=>'LABEL_INLINE_LG'
,p_display_name=>'Display labels inline'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32473240049647152)
,p_css_classes=>'t-NavTabs--inlineLabels-lg'
,p_group_id=>wwv_flow_api.id(32473951620647152)
,p_template_types=>'LIST'
,p_help_text=>'Display the label inline with the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32474791586647151)
,p_theme_id=>42
,p_name=>'LABEL_ABOVE_LG'
,p_display_name=>'Display labels above'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32473240049647152)
,p_css_classes=>'t-NavTabs--stacked'
,p_group_id=>wwv_flow_api.id(32473951620647152)
,p_template_types=>'LIST'
,p_help_text=>'Display the label stacked above the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32475190304647151)
,p_theme_id=>42
,p_name=>'WIZARD_PROGRESS_LINKS'
,p_display_name=>'Make Wizard Steps Clickable'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(32474877519647151)
,p_css_classes=>'js-wizardProgressLinks'
,p_template_types=>'LIST'
,p_help_text=>'This option will make the wizard steps clickable links.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32475577520647150)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32474877519647151)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(32475357979647150)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32475748653647150)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32474877519647151)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(32475357979647150)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32475956215647150)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(32474877519647151)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(32475357979647150)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32476164257647150)
,p_theme_id=>42
,p_name=>'VERTICAL_LIST'
,p_display_name=>'Vertical Orientation'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32474877519647151)
,p_css_classes=>'t-WizardSteps--vertical'
,p_template_types=>'LIST'
,p_help_text=>'Displays the wizard progress list in a vertical orientation and is suitable for displaying within a side column of a page.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32476538626647149)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(32476213372647150)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32476755451647149)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(32476213372647150)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32476996007647149)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(32476213372647150)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32477153566647149)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(32476213372647150)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32477721568647148)
,p_theme_id=>42
,p_name=>'COLLAPSED_DEFAULT'
,p_display_name=>'Collapsed by Default'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32477475835647148)
,p_css_classes=>'js-defaultCollapsed'
,p_template_types=>'LIST'
,p_help_text=>'This option will load the side navigation menu in a collapsed state by default.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32477975292647147)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Classic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(32477475835647148)
,p_css_classes=>'t-TreeNav--classic'
,p_group_id=>wwv_flow_api.id(32456500595647166)
,p_template_types=>'LIST'
,p_help_text=>'Classic Style'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32478143695647147)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(32477475835647148)
,p_css_classes=>'t-TreeNav--styleA'
,p_group_id=>wwv_flow_api.id(32456500595647166)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation A'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32478323852647147)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(32477475835647148)
,p_css_classes=>'t-TreeNav--styleB'
,p_group_id=>wwv_flow_api.id(32456500595647166)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation B'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32479514638647143)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(32479146109647144)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_api.id(32479385900647143)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32479733016647143)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(32479146109647144)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_api.id(32479385900647143)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32480153553647142)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(32479918031647142)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_api.id(32479385900647143)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32480368550647142)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(32479918031647142)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_api.id(32479385900647143)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32480756701647142)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(32479918031647142)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(32480597518647142)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32480914697647141)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(32479918031647142)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(32480597518647142)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32481177052647141)
,p_theme_id=>42
,p_name=>'HIDE_LABEL_ON_MOBILE'
,p_display_name=>'Hide Label on Mobile'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(32479918031647142)
,p_css_classes=>'t-Button--mobileHideLabel'
,p_template_types=>'BUTTON'
,p_help_text=>'This template options hides the button label on small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32483024224647121)
,p_theme_id=>42
,p_name=>'FBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(32482853470647122)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32483419102647121)
,p_theme_id=>42
,p_name=>'RBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(32483272975647121)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32483628919647121)
,p_theme_id=>42
,p_name=>'FBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(32482853470647122)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32483804361647121)
,p_theme_id=>42
,p_name=>'RBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(32483272975647121)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32484078345647121)
,p_theme_id=>42
,p_name=>'FBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(32482853470647122)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32484217441647120)
,p_theme_id=>42
,p_name=>'RBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(32483272975647121)
,p_template_types=>'REGION'
,p_help_text=>'Removes the bottom margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32484439617647120)
,p_theme_id=>42
,p_name=>'FBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(32482853470647122)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32484623045647120)
,p_theme_id=>42
,p_name=>'RBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(32483272975647121)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32485052722647120)
,p_theme_id=>42
,p_name=>'FLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(32484888179647120)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32485492261647120)
,p_theme_id=>42
,p_name=>'RLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(32485204571647120)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32485634523647120)
,p_theme_id=>42
,p_name=>'FLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(32484888179647120)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium left margin for this field.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32485822434647119)
,p_theme_id=>42
,p_name=>'RLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(32485204571647120)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32486019418647119)
,p_theme_id=>42
,p_name=>'FLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(32484888179647120)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32486205588647119)
,p_theme_id=>42
,p_name=>'RLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(32485204571647120)
,p_template_types=>'REGION'
,p_help_text=>'Removes the left margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32486427756647119)
,p_theme_id=>42
,p_name=>'FLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(32484888179647120)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32486652305647119)
,p_theme_id=>42
,p_name=>'RLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(32485204571647120)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small left margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32487026973647119)
,p_theme_id=>42
,p_name=>'FRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(32486849289647119)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32487485191647118)
,p_theme_id=>42
,p_name=>'RRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(32487239160647118)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32487630136647118)
,p_theme_id=>42
,p_name=>'FRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(32486849289647119)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32487844344647118)
,p_theme_id=>42
,p_name=>'RRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(32487239160647118)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32488019673647118)
,p_theme_id=>42
,p_name=>'FRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(32486849289647119)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32488247414647118)
,p_theme_id=>42
,p_name=>'RRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(32487239160647118)
,p_template_types=>'REGION'
,p_help_text=>'Removes the right margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32488475348647118)
,p_theme_id=>42
,p_name=>'FRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(32486849289647119)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32488637050647117)
,p_theme_id=>42
,p_name=>'RRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(32487239160647118)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32489037163647117)
,p_theme_id=>42
,p_name=>'FTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(32488874260647117)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32489478731647117)
,p_theme_id=>42
,p_name=>'RTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(32489240134647117)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32489696154647117)
,p_theme_id=>42
,p_name=>'FTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(32488874260647117)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32489802665647117)
,p_theme_id=>42
,p_name=>'RTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(32489240134647117)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32490096433647117)
,p_theme_id=>42
,p_name=>'FTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(32488874260647117)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32490233909647116)
,p_theme_id=>42
,p_name=>'RTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(32489240134647117)
,p_template_types=>'REGION'
,p_help_text=>'Removes the top margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32490437665647116)
,p_theme_id=>42
,p_name=>'FTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(32488874260647117)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32490672513647116)
,p_theme_id=>42
,p_name=>'RTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(32489240134647117)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32491044731647116)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(32490832861647116)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32491470335647116)
,p_theme_id=>42
,p_name=>'LARGEBOTTOMMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapBottom'
,p_group_id=>wwv_flow_api.id(32491256213647116)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32491824919647115)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(32491628912647115)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32492299747647115)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(32492001979647115)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32492683928647115)
,p_theme_id=>42
,p_name=>'LARGETOPMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapTop'
,p_group_id=>wwv_flow_api.id(32492423979647115)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32493081548647115)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(32492822821647115)
,p_template_types=>'BUTTON'
,p_help_text=>'A large button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32493467608647114)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_LINK'
,p_display_name=>'Display as Link'
,p_display_sequence=>30
,p_css_classes=>'t-Button--link'
,p_group_id=>wwv_flow_api.id(32493234948647114)
,p_template_types=>'BUTTON'
,p_help_text=>'This option makes the button appear as a text link.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32493678622647114)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(32493234948647114)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32493894973647114)
,p_theme_id=>42
,p_name=>'SMALLBOTTOMMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padBottom'
,p_group_id=>wwv_flow_api.id(32491256213647116)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32494020163647114)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(32491628912647115)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32494238131647114)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(32492001979647115)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32494494336647114)
,p_theme_id=>42
,p_name=>'SMALLTOPMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padTop'
,p_group_id=>wwv_flow_api.id(32492423979647115)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32494834163647113)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(32494648696647114)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32495033463647113)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(32494648696647114)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32495239463647113)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(32494648696647114)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32495494216647113)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(32490832861647116)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32495698517647113)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(32493234948647114)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32495844534647113)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(32492822821647115)
,p_template_types=>'BUTTON'
,p_help_text=>'A small button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32496250124647112)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(32496048105647113)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32496457069647112)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(32490832861647116)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32496681683647112)
,p_theme_id=>42
,p_name=>'TINY'
,p_display_name=>'Tiny'
,p_display_sequence=>10
,p_css_classes=>'t-Button--tiny'
,p_group_id=>wwv_flow_api.id(32492822821647115)
,p_template_types=>'BUTTON'
,p_help_text=>'A very small button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32496807575647112)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(32490832861647116)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32497282014647112)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(32497037577647112)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32497626570647111)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(32497415986647112)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32498033629647111)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(32497808172647111)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32498423608647111)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(32498231946647111)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32498623252647111)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(32498231946647111)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32499088058647111)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(32498879644647111)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32499247813647110)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(32497415986647112)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32499663964647110)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(32499425301647110)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32500099417647110)
,p_theme_id=>42
,p_name=>'POST_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--postTextBlock'
,p_group_id=>wwv_flow_api.id(32499801883647110)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Post Text in a block style immediately after the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32500472225647110)
,p_theme_id=>42
,p_name=>'PRE_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--preTextBlock'
,p_group_id=>wwv_flow_api.id(32500254519647110)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Pre Text in a block style immediately before the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32500858797647109)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_PILL_BUTTON'
,p_display_name=>'Display as Pill Button'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--radioButtonGroup'
,p_group_id=>wwv_flow_api.id(32500698281647109)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the radio buttons to look like a button set / pill button.  Note that the the radio buttons must all be in the same row for this option to work.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32501023289647109)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32501261000647109)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(32499425301647110)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(32501695519647109)
,p_theme_id=>42
,p_name=>'HIDE_WHEN_ALL_ROWS_DISPLAYED'
,p_display_name=>'Hide when all rows displayed'
,p_display_sequence=>10
,p_css_classes=>'t-Report--hideNoPagination'
,p_group_id=>wwv_flow_api.id(32501426019647109)
,p_template_types=>'REPORT'
,p_help_text=>'This option will hide the pagination when all rows are displayed.'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts/delete_confirm_msg
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(32505331409647068)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
end;
/
prompt --application/shared_components/security/authentications/application_express_authentication
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(32373101207647265)
,p_name=>'Application Express Authentication'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/shared_components/security/authentications/copy_of_ldap_login
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(38291459692649700)
,p_name=>'Copy of LDAP-Login'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'pkg_sv_security.ldap_auth'
,p_attribute_04=>'post_auth'
,p_attribute_05=>'N'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procedure post_auth  ',
'is  ',
'begin  ',
'   pkg_sv_acct_mgmt.proc_good_login(p_user_sid => :G_USER_SID);  ',
'end;  '))
,p_invalid_session_type=>'LOGIN'
,p_logout_url=>'f?p=&APP_ID.:9999'
,p_cookie_name=>'&WORKSPACE_COOKIE.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_reference_id=>33236200012825477
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(32502397090647103)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_api.id(32373915770647261)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(32477475835647148)
,p_nav_list_template_options=>'#DEFAULT#:t-TreeNav--styleA'
,p_css_file_urls=>'#APP_IMAGES#app-icon.css?version=#APP_VERSION#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(32502043310647104)
,p_nav_bar_list_template_id=>wwv_flow_api.id(32477235507647149)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'EDFI'
,p_last_upd_yyyymmddhh24miss=>'20200522144051'
);
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
prompt --application/pages/page_00600
begin
wwv_flow_api.create_page(
 p_id=>600
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'AP File Data Upload'
,p_step_title=>'AP File Data Upload'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(32389539971647231)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'TONYE_EDFI'
,p_last_upd_yyyymmddhh24miss=>'20201217161449'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39447874816319212)
,p_plug_name=>'AP Student Id Mismatch'
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
'and assessment_type = ''AP'' ',
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
 p_id=>wwv_flow_api.id(39447988839319213)
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
,p_internal_uid=>39447988839319213
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39448009623319214)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39448143144319215)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39448230287319216)
,p_db_column_name=>'BIRTH_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Birth Date'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39448313489319217)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39448412023319218)
,p_db_column_name=>'LOADED_DATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Loaded Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(39559683509143272)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'395597'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'LAST_NAME:FIRST_NAME:BIRTH_DATE:FILE_NAME:LOADED_DATE'
,p_break_on=>'FILE_NAME:0:0:0:0:0'
,p_break_enabled_on=>'FILE_NAME:0:0:0:0:0'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(55182332952066059)
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
'  (SELECT max(loaded_date) FROM v_district_ap_data) as "Last Load Date",',
'  (SELECT max(admin_year_01) FROM v_district_ap_data) as "Last AP Date",',
'  (SELECT count(*) FROM v_district_ap_data where loaded_date = (SELECT max(loaded_date) FROM v_district_ap_data)) as "Last Row Count"',
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
 p_id=>wwv_flow_api.id(32717202627421325)
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
 p_id=>wwv_flow_api.id(39447744006319211)
,p_query_column_id=>2
,p_column_alias=>'Last AP Date'
,p_column_display_sequence=>3
,p_column_heading=>'Last AP Date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(32718072655421324)
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
 p_id=>wwv_flow_api.id(55184094348066077)
,p_plug_name=>'AP Data Loading History'
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
 p_id=>wwv_flow_api.id(32718704115421323)
,p_region_id=>wwv_flow_api.id(55184094348066077)
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
 p_id=>wwv_flow_api.id(32720447449421321)
,p_chart_id=>wwv_flow_api.id(32718704115421323)
,p_seq=>10
,p_name=>'AP Data Rows Loaded by Test Admin Date'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowcnt, to_char(admin_year_01 ,''DD-MON-YY'') as latest_assessment_date',
'from (select count(*) as rowcnt,',
'             admin_year_01 ',
'from v_district_ap_data ',
'where loaded_date <= sysdate and loaded_date >= sysdate - 365',
'and admin_year_01 is not null',
'and district_id = :G_DISTRICT_ID      ',
'group by admin_year_01 ',
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
 p_id=>wwv_flow_api.id(32719241554421322)
,p_chart_id=>wwv_flow_api.id(32718704115421323)
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
 p_id=>wwv_flow_api.id(32719858318421322)
,p_chart_id=>wwv_flow_api.id(32718704115421323)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65367747743536645)
,p_plug_name=>'AP Load Date History'
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
 p_id=>wwv_flow_api.id(32721387787421320)
,p_region_id=>wwv_flow_api.id(65367747743536645)
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
 p_id=>wwv_flow_api.id(32723085147421319)
,p_chart_id=>wwv_flow_api.id(32721387787421320)
,p_seq=>10
,p_name=>'AP Data Rows Loaded by Load Date'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) as rowcnt,',
'       to_char(loaded_date,''DD-MON-YYYY'') as loaded_date',
'from v_district_ap_data ',
'where loaded_date < sysdate and loaded_date > sysdate - 365',
'group by to_char(loaded_date,''DD-MON-YYYY'');'))
,p_items_value_column_name=>'ROWCNT'
,p_items_label_column_name=>'LOADED_DATE'
,p_color=>'#4CD964'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(32721872133421320)
,p_chart_id=>wwv_flow_api.id(32721387787421320)
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
 p_id=>wwv_flow_api.id(32722418341421319)
,p_chart_id=>wwv_flow_api.id(32721387787421320)
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
 p_id=>wwv_flow_api.id(97833043709011279)
,p_name=>'AP File Data Upload'
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
'      from v_district_ap_data',
'      where district_id = :G_DISTRICT_ID',
'      order by 2 desc)',
'where rownum <= 5'))
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
 p_id=>wwv_flow_api.id(33028932276994931)
,p_query_column_id=>1
,p_column_alias=>'FILE_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'File Name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(33028745446994929)
,p_query_column_id=>2
,p_column_alias=>'LOADED_DATE'
,p_column_display_sequence=>2
,p_column_heading=>'Loaded Date'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32716174774421326)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(97833043709011279)
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
,p_grid_column_span=>5
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39814804753100881)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(39447874816319212)
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
 p_id=>wwv_flow_api.id(32716524162421326)
,p_name=>'P600_FILE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(97833043709011279)
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
 p_id=>wwv_flow_api.id(39815289193108265)
,p_name=>'Clear Student ID Mismatches'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39814804753100881)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39815655898108268)
,p_event_id=>wwv_flow_api.id(39815289193108265)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure you want to clear student id mismatch results?'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39817119711108270)
,p_event_id=>wwv_flow_api.id(39815289193108265)
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
'  pkg_assessment_upload.prc_clear_stu_id_mismatch (:G_DISTRICT_ID, ''AP'', v_user_id);',
'',
'end;'))
,p_attribute_02=>'G_DISTRICT_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39816608964108269)
,p_event_id=>wwv_flow_api.id(39815289193108265)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(39447874816319212)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39088410033005113)
,p_event_id=>wwv_flow_api.id(39815289193108265)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Student id mismatches cleared'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32723681826421318)
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
'    v_test_type varchar2(10) := ''AP'';',
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
'       ',
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
'    t_files := apex_string.split(p_str => :P600_FILE, p_sep => '':'');',
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
'    pkg_assessment_upload.prc_reset_and_run_import_agent (v_db_link, v_user_id );',
'        ',
'    exception',
'      when e_district_id_missing_error then',
'        pkg_assessment_upload.prc_log_status (''Main(): District id is missing when processing file '' || substr(:P600_FILE,INSTR(:P600_FILE,''/'',-1)+1), ''ERROR-90'', v_user_id);',
'        apex_error.add_error(p_message          => ''Main(): District id is missing when processing file '' || substr(:P600_FILE,INSTR(:P600_FILE,''/'',-1)+1),',
'                             p_additional_info  => '''',',
'                             p_display_location => apex_error.c_inline_with_field_and_notif,',
'                             p_page_item_name   => ''P600_FILE''); ',
'      when others then ',
'        pkg_assessment_upload.prc_log_status (''Main(): File load error with file '' || substr(:P600_FILE,INSTR(:P600_FILE,''/'',-1)+1), ''ERROR-91'', v_user_id); ',
'        apex_error.add_error(p_message          => ''Main(): File load error with file '' || substr(:P600_FILE,INSTR(:P600_FILE,''/'',-1)+1),',
'                             p_additional_info  => substr(sqlerrm,1,200),',
'                             p_display_location => apex_error.c_inline_with_field_and_notif,',
'                             p_page_item_name   => ''P600_FILE'');',
'         ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00650
begin
wwv_flow_api.create_page(
 p_id=>650
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'IB File Data Upload'
,p_step_title=>'IB File Data Upload'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(32389539971647231)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'TONYE_EDFI'
,p_last_upd_yyyymmddhh24miss=>'20201217161422'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39448917626319223)
,p_plug_name=>'IB Student Id Mismatch'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--accent8:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct student_id, file_name, loaded_date',
'from v_assessment_stu_id_mismatch',
'where district_id = :G_DISTRICT_ID',
'and assessment_type = ''IB'' ',
'order by student_id, file_name, loaded_date;'))
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
 p_id=>wwv_flow_api.id(39449096271319224)
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
,p_internal_uid=>39449096271319224
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39449195447319225)
,p_db_column_name=>'STUDENT_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Student Id'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39449285494319226)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(39449315550319227)
,p_db_column_name=>'LOADED_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Loaded Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(39624412095817766)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'396245'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'STUDENT_ID:FILE_NAME:LOADED_DATE'
,p_break_on=>'FILE_NAME:0:0:0:0:0'
,p_break_enabled_on=>'FILE_NAME:0:0:0:0:0'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(87906732195481409)
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
'  (SELECT max(loaded_date) FROM v_district_ib_data) as "Last Load Date",',
'  (SELECT substr(max(school_session || '' '' || year),3) FROM v_district_ib_data) as "Last IB Date",',
'  (SELECT count(*) FROM v_district_ib_data where loaded_date = (SELECT max(loaded_date) FROM v_district_ib_data)) as "Last Row Count"',
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
 p_id=>wwv_flow_api.id(32733180740415337)
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
 p_id=>wwv_flow_api.id(32842430668740321)
,p_query_column_id=>2
,p_column_alias=>'Last IB Date'
,p_column_display_sequence=>2
,p_column_heading=>'Last IB Date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(32733941326415336)
,p_query_column_id=>3
,p_column_alias=>'Last Row Count'
,p_column_display_sequence=>3
,p_column_heading=>'Last Row Count'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(87908493591481427)
,p_plug_name=>'IB Data Loading History'
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
 p_id=>wwv_flow_api.id(32734661828415335)
,p_region_id=>wwv_flow_api.id(87908493591481427)
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
 p_id=>wwv_flow_api.id(32736382634415334)
,p_chart_id=>wwv_flow_api.id(32734661828415335)
,p_seq=>10
,p_name=>'IB Data Rows Loaded by Test Admin Date'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*) as rowcnt,',
'       substr(school_session,3) || '' '' || year as latest_assessment_date',
'from v_district_ib_data ',
'where loaded_date <= sysdate and loaded_date >= sysdate - 365',
'and school_session is not null',
'group by substr(school_session,3) || '' '' || year',
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
 p_id=>wwv_flow_api.id(32735750753415334)
,p_chart_id=>wwv_flow_api.id(32734661828415335)
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
 p_id=>wwv_flow_api.id(32735107880415335)
,p_chart_id=>wwv_flow_api.id(32734661828415335)
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
 p_id=>wwv_flow_api.id(98092146986951995)
,p_plug_name=>'IB Load Date History'
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
 p_id=>wwv_flow_api.id(32737202068415333)
,p_region_id=>wwv_flow_api.id(98092146986951995)
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
 p_id=>wwv_flow_api.id(32738985391415331)
,p_chart_id=>wwv_flow_api.id(32737202068415333)
,p_seq=>10
,p_name=>'IB Data Rows Loaded by Load Date'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowcnt, to_char(loaded_date,''DD-MON-YY'') as loaded_date',
'from (select count(*) as rowcnt,',
'             to_date(to_char(loaded_date,''DD-MON-YY'')) as loaded_date',
'from v_district_ib_data ',
'where loaded_date <= sysdate and loaded_date >= sysdate - 365',
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
 p_id=>wwv_flow_api.id(32737704535415332)
,p_chart_id=>wwv_flow_api.id(32737202068415333)
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
 p_id=>wwv_flow_api.id(32738337073415332)
,p_chart_id=>wwv_flow_api.id(32737202068415333)
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
 p_id=>wwv_flow_api.id(130557442952426629)
,p_name=>'IB File Data Upload'
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
'      from v_district_ib_data',
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
 p_id=>wwv_flow_api.id(33029053991994932)
,p_query_column_id=>1
,p_column_alias=>'FILE_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'File Name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(33029151551994933)
,p_query_column_id=>2
,p_column_alias=>'LOADED_DATE'
,p_column_display_sequence=>2
,p_column_heading=>'Loaded Date'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32732095393415339)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(130557442952426629)
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
,p_grid_column_span=>5
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39818582534131170)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(39448917626319223)
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
 p_id=>wwv_flow_api.id(32732433364415338)
,p_name=>'P650_FILE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(130557442952426629)
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
 p_id=>wwv_flow_api.id(39818733017133391)
,p_name=>'Clear Student ID Mismatches'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39818582534131170)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39819126236133392)
,p_event_id=>wwv_flow_api.id(39818733017133391)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure you want to clear student id mismatch results?'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39820653705133393)
,p_event_id=>wwv_flow_api.id(39818733017133391)
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
'  pkg_assessment_upload.prc_clear_stu_id_mismatch (:G_DISTRICT_ID, ''IB'', v_user_id);',
'  ',
'end;'))
,p_attribute_02=>'G_DISTRICT_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39820123831133393)
,p_event_id=>wwv_flow_api.id(39818733017133391)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(39448917626319223)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39819678812133392)
,p_event_id=>wwv_flow_api.id(39818733017133391)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Student id mismatches cleared'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32739531672415330)
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
'    v_test_type varchar2(10) := ''IB'';',
'    v_out_test_type varchar2(5);',
'    v_user_id varchar2(100); ',
'    n_rows_with_stu_id number;',
'    e_district_id_missing_error exception; ',
'begin',
'    ',
'    select user_id ',
'    into v_user_id ',
'    from edfiapp.user_account_v',
'    where user_sid = :G_USER_SID;',
'    ',
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
'    t_files := apex_string.split(p_str => :P650_FILE, p_sep => '':'');',
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
'         ',
'    exception',
'      when e_district_id_missing_error then',
'        pkg_assessment_upload.prc_log_status (''Main(): District id is missing when processing file '' || substr(:P650_FILE,INSTR(:P650_FILE,''/'',-1)+1), ''ERROR-90'', v_user_id);',
'        apex_error.add_error(p_message          => ''Main(): District id is missing when processing file '' || substr(:P650_FILE,INSTR(:P650_FILE,''/'',-1)+1),',
'                             p_additional_info  => '''',',
'                             p_display_location => apex_error.c_inline_with_field_and_notif,',
'                             p_page_item_name   => ''P650_FILE''); ',
'      when others then ',
'        pkg_assessment_upload.prc_log_status (''Main(): File load error with file '' || substr(:P650_FILE,INSTR(:P650_FILE,''/'',-1)+1), ''ERROR-91'', v_user_id);',
'        apex_error.add_error(p_message          => ''Main(): File load error with file '' || substr(:P650_FILE,INSTR(:P650_FILE,''/'',-1)+1),',
'                             p_additional_info  => substr(sqlerrm,1,200),',
'                             p_display_location => apex_error.c_inline_with_field_and_notif,',
'                             p_page_item_name   => ''P650_FILE'');',
'         ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
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
prompt --application/pages/page_00750
begin
wwv_flow_api.create_page(
 p_id=>750
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'TSI File Data Upload'
,p_step_title=>'TSI'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(32389539971647231)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'TONYE_EDFI'
,p_last_upd_yyyymmddhh24miss=>'20201217161326'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38849157740455843)
,p_plug_name=>'TSI Student Id Mismatch'
,p_region_template_options=>'#DEFAULT#:t-Region--accent8:t-Region--scrollBody'
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
'and assessment_type = ''TSI'' ',
'and file_name = :G_FILE_PROCESSED',
'order by loaded_date desc, last_name;'))
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
 p_id=>wwv_flow_api.id(38849279573455844)
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
,p_internal_uid=>38849279573455844
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38849343600455845)
,p_db_column_name=>'LAST_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38849410360455846)
,p_db_column_name=>'FIRST_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38849586959455847)
,p_db_column_name=>'BIRTH_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Birth Date'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38849638717455848)
,p_db_column_name=>'FILE_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(38849783282455849)
,p_db_column_name=>'LOADED_DATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Loaded Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(39319421997736082)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'393195'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'LOADED_DATE:FILE_NAME:LAST_NAME:FIRST_NAME:BIRTH_DATE:'
,p_break_on=>'FILE_NAME:0:0:0:0:0'
,p_break_enabled_on=>'FILE_NAME:0:0:0:0:0'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(55230970788967782)
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
'  (SELECT max(loaded_date) FROM v_district_tsi_data) as "Last Load Date",',
'  (SELECT max(test_start) FROM v_district_tsi_data) as "Last TSI Date",',
'  (SELECT count(*) FROM v_district_tsi_data where loaded_date = (SELECT max(loaded_date) FROM v_district_tsi_data)) as "Last Row Count"',
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
 p_id=>wwv_flow_api.id(32765814814323046)
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
 p_id=>wwv_flow_api.id(32661356609115330)
,p_query_column_id=>2
,p_column_alias=>'Last TSI Date'
,p_column_display_sequence=>2
,p_column_heading=>'Last TSI Date'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(32766613005323045)
,p_query_column_id=>3
,p_column_alias=>'Last Row Count'
,p_column_display_sequence=>3
,p_column_heading=>'Last Row Count'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(55232732184967800)
,p_plug_name=>'TSI Data by Assessment Date'
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
 p_id=>wwv_flow_api.id(32767374065323044)
,p_region_id=>wwv_flow_api.id(55232732184967800)
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
 p_id=>wwv_flow_api.id(32769014039323043)
,p_chart_id=>wwv_flow_api.id(32767374065323044)
,p_seq=>10
,p_name=>'TSI Data Rows Loaded by Load Date'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowcnt, to_char(test_start ,''DD-MON-YY'') as latest_assessment_date',
'from (select count(*) as rowcnt,',
'             test_start ',
'from v_district_tsi_data',
'where loaded_date < sysdate and loaded_date > sysdate - 365',
'group by test_start',
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
 p_id=>wwv_flow_api.id(32767859643323044)
,p_chart_id=>wwv_flow_api.id(32767374065323044)
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
 p_id=>wwv_flow_api.id(32768452131323043)
,p_chart_id=>wwv_flow_api.id(32767374065323044)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(65416385580438368)
,p_plug_name=>'TSI Data by Load Date'
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
 p_id=>wwv_flow_api.id(32769933413323042)
,p_region_id=>wwv_flow_api.id(65416385580438368)
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
 p_id=>wwv_flow_api.id(32771623658323040)
,p_chart_id=>wwv_flow_api.id(32769933413323042)
,p_seq=>10
,p_name=>'TSI Data Rows Loaded by Load Date'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowcnt, to_char(loaded_date,''DD-MON-YY'') as loaded_date',
'from (select count(*) as rowcnt,',
'             to_date(to_char(loaded_date,''DD-MON-YY'')) as loaded_date',
'from v_district_tsi_data',
'where loaded_date <= sysdate and loaded_date >= sysdate - 365',
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
 p_id=>wwv_flow_api.id(32770495704323041)
,p_chart_id=>wwv_flow_api.id(32769933413323042)
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
 p_id=>wwv_flow_api.id(32771063493323041)
,p_chart_id=>wwv_flow_api.id(32769933413323042)
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
 p_id=>wwv_flow_api.id(97881681545913002)
,p_name=>'TSI File Data Upload'
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
'      from v_district_tsi_data',
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
 p_id=>wwv_flow_api.id(32967448711614318)
,p_query_column_id=>1
,p_column_alias=>'FILE_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'File Name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(32967533421614319)
,p_query_column_id=>2
,p_column_alias=>'LOADED_DATE'
,p_column_display_sequence=>2
,p_column_heading=>'Loaded Date'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32764740806323048)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(97881681545913002)
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
,p_grid_column=>6
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39821135458136192)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(38849157740455843)
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
 p_id=>wwv_flow_api.id(32765124963323047)
,p_name=>'P750_FILE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(97881681545913002)
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
 p_id=>wwv_flow_api.id(39821351397137865)
,p_name=>'Clear Student ID Mismatches'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39821135458136192)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39821796899137865)
,p_event_id=>wwv_flow_api.id(39821351397137865)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Are you sure you want to clear student id mismatch results?'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39823209794137867)
,p_event_id=>wwv_flow_api.id(39821351397137865)
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
'  pkg_assessment_upload.prc_clear_stu_id_mismatch (:G_DISTRICT_ID, ''TSI'', v_user_id);',
'  ',
'end;'))
,p_attribute_02=>'G_DISTRICT_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39822723679137866)
,p_event_id=>wwv_flow_api.id(39821351397137865)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(38849157740455843)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39822295440137866)
,p_event_id=>wwv_flow_api.id(39821351397137865)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Student id mismatches cleared'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32772256192323039)
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
'    v_test_type varchar2(10) := ''TSI'';',
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
'    ',
'    if :G_DISTRICT_ID is null then',
'      raise e_district_id_missing_error;',
'    else',
'      v_district_id := :G_DISTRICT_ID;',
'    end if;',
'    ',
'    pkg_assessment_upload.prc_log_status (''Main: Start of processing '' ||  v_test_type || '' test(s) for '' || v_district_id, ''INFO-90'', v_user_id);',
'    :G_ASSESSMENT_TYPE := v_test_type;',
'    pkg_assessment_upload.prc_get_output_directory (v_district_id, v_test_type, v_output_directory, v_user_id);',
'    pkg_assessment_upload.prc_get_database_dblink (v_district_id, v_db_link, ''ODS'', v_user_id);',
'          ',
'    t_files := apex_string.split(p_str => :P750_FILE, p_sep => '':'');',
'    for indx in 1 .. t_files.count',
'    loop',
'      ',
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
'    pkg_assessment_upload.prc_reset_and_run_import_agent (v_db_link, v_user_id);',
'    pkg_assessment_upload.prc_log_status (''Main: End of processing '' ||  v_test_type || '' test(s) for '' || v_district_id, ''INFO-91'', v_user_id);',
'        ',
'    exception',
'      when e_district_id_missing_error then',
'        pkg_assessment_upload.prc_log_status (''Main(): District id is missing when processing file '' || substr(:P750_FILE,INSTR(:P750_FILE,''/'',-1)+1), ''ERROR-90'', v_user_id);',
'        apex_error.add_error(p_message          => ''Main(): District id is missing when processing file '' || substr(:P750_FILE,INSTR(:P750_FILE,''/'',-1)+1),',
'                             p_additional_info  => '''',',
'                             p_display_location => apex_error.c_inline_with_field_and_notif,',
'                             p_page_item_name   => ''P750_FILE''); ',
'      when others then ',
'        pkg_assessment_upload.prc_log_status (''Main(): File load error with file '' || substr(:P750_FILE,INSTR(:P750_FILE,''/'',-1)+1), ''ERROR-91'', v_user_id); ',
'        apex_error.add_error(p_message          => ''Main(): File load error with file '' || sqlerrm || '' with file '' || substr(:P750_FILE,INSTR(:P750_FILE,''/'',-1)+1),',
'                             p_additional_info  => '''',',
'                             p_display_location => apex_error.c_inline_with_field_and_notif,',
'                             p_page_item_name   => ''P750_FILE'');',
'         ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
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
end;
/
begin
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
prompt --application/pages/page_00900
begin
wwv_flow_api.create_page(
 p_id=>900
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'Format Errors Report '
,p_step_title=>'Format Errors Report'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'EDFI'
,p_last_upd_yyyymmddhh24miss=>'20201002164658'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33083321685958916)
,p_plug_name=>'Last Uploaded File'
,p_icon_css_classes=>'fa-warning'
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--accent8:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(33350017480790007)
,p_name=>'Assessment Standard File Format'
,p_template=>wwv_flow_api.id(32423732821647198)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--showIcon:t-Region--accent8:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select column_position, column_name ',
'from edfidata.assessment_std_file_format',
'where standard_type = :g_assessment_type',
'   minus ',
'select column_position, column_name ',
'from edfidata.district_assessment_header',
'where filename = :g_file_processed',
'and assessment_type = :g_assessment_type;'))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(32446447746647176)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Not Applicable'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'Y'
,p_prn_format=>'PDF'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
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
,p_sort_null=>'F'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(33350187755790008)
,p_query_column_id=>1
,p_column_alias=>'COLUMN_POSITION'
,p_column_display_sequence=>1
,p_column_heading=>'Column Position'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(33350211114790009)
,p_query_column_id=>2
,p_column_alias=>'COLUMN_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Column Name'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(33451604398937894)
,p_name=>'Input File Format Error(s)'
,p_template=>wwv_flow_api.id(32423732821647198)
,p_display_sequence=>20
,p_icon_css_classes=>'fa-warning'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--showIcon:t-Region--accent8:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select column_position, column_name ',
'from edfidata.district_assessment_header',
'where filename = :g_file_processed',
'and assessment_type = :g_assessment_type',
'   minus ',
'select column_position, column_name ',
'from edfidata.assessment_std_file_format',
'where standard_type = :g_assessment_type',
''))
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(32446447746647176)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Errors Found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'Y'
,p_prn_format=>'PDF'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
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
,p_sort_null=>'F'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(33452044366937888)
,p_query_column_id=>1
,p_column_alias=>'COLUMN_POSITION'
,p_column_display_sequence=>1
,p_column_heading=>'Column Position'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(33452406910937887)
,p_query_column_id=>2
,p_column_alias=>'COLUMN_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Column Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33083501787958918)
,p_name=>'P_FILE_PROCESSED'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(33083321685958916)
,p_use_cache_before_default=>'NO'
,p_item_default=>'<h4 style="color:black;">None</h4>'
,p_source=>'G_FILE_PROCESSED'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(32478735398647145)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'N'
);
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
prompt --application/pages/page_02000
begin
wwv_flow_api.create_page(
 p_id=>2000
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'Student List'
,p_step_title=>'Student List'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'EDFI'
,p_last_upd_yyyymmddhh24miss=>'20200917154618'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(39135437559019981)
,p_name=>'Student List'
,p_template=>wwv_flow_api.id(32423732821647198)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'  l_db_link varchar2(100);',
'  l_sql     varchar2(1000);',
'  l_district_id varchar2(20);',
'begin',
'  l_district_id := :G_DISTRICT_ID;',
'  ',
'  select DB_LINK',
'    into l_db_link',
'    from DISTRICT_DB_LINK',
'   where DISTRICT_ID = l_district_id',
'     and TARGET_DB = ''ODS'';',
'     ',
'  l_sql := ''select "LastSurname", "FirstName", "BirthDate", "StudentUniqueId", "LocalCode" ',
'        from edfi.v_StudentIds@''||l_db_link||'' ',
'       where instr(lower("LastSurname"),lower(''''''||:P2000_SEARCH||'''''')) > 0',
'	        or instr(lower("FirstName"),lower(''''''||:P2000_SEARCH||'''''')) > 0',
'			or instr(lower("BirthDate"),lower(''''''||:P2000_SEARCH||'''''')) > 0',
'			or instr(lower("StudentUniqueId"),lower(''''''||:P2000_SEARCH||'''''')) > 0',
'			or instr(lower("LocalCode"),lower(''''''||:P2000_SEARCH||'''''')) > 0',
'			or "StudentUniqueId" = nvl(''''''||:P2000_SEARCH||'''''',"StudentUniqueId")'';',
'  apex_debug.message(''>>>>>>> ''||l_sql);',
'  return l_sql;',
'END;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2000_SEARCH'
,p_query_row_template=>wwv_flow_api.id(32446447746647176)
,p_plug_query_max_columns=>10
,p_query_headings=>'return ''Last Name:First Name:Date Of Birth:State Unique Id:Local Id'''
,p_query_headings_type=>'FUNCTION_BODY_RETURNING_COLON_DELIMITED_LIST'
,p_query_num_rows=>15
,p_query_options=>'GENERIC_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39154520270840608)
,p_query_column_id=>1
,p_column_alias=>'COL01'
,p_column_display_sequence=>1
,p_column_heading=>'Col01'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:2010:&SESSION.::&DEBUG.:RP,2010:P2010_STUDENT_UNIQUE_ID,P2010_STUDENT_NAME:#COL04#,#COL02# #COL01#'
,p_column_linktext=>'#COL01#'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39154625880840609)
,p_query_column_id=>2
,p_column_alias=>'COL02'
,p_column_display_sequence=>2
,p_column_heading=>'Col02'
,p_use_as_row_header=>'N'
,p_default_sort_column_sequence=>2
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39154753177840610)
,p_query_column_id=>3
,p_column_alias=>'COL03'
,p_column_display_sequence=>3
,p_column_heading=>'Col03'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39154811766840611)
,p_query_column_id=>4
,p_column_alias=>'COL04'
,p_column_display_sequence=>4
,p_column_heading=>'Col04'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39154941058840612)
,p_query_column_id=>5
,p_column_alias=>'COL05'
,p_column_display_sequence=>5
,p_column_heading=>'Col05'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39155049478840613)
,p_query_column_id=>6
,p_column_alias=>'COL06'
,p_column_display_sequence=>6
,p_column_heading=>'Col06'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39155132328840614)
,p_query_column_id=>7
,p_column_alias=>'COL07'
,p_column_display_sequence=>7
,p_column_heading=>'Col07'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39155254871840615)
,p_query_column_id=>8
,p_column_alias=>'COL08'
,p_column_display_sequence=>8
,p_column_heading=>'Col08'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39155365429840616)
,p_query_column_id=>9
,p_column_alias=>'COL09'
,p_column_display_sequence=>9
,p_column_heading=>'Col09'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39155492818840617)
,p_query_column_id=>10
,p_column_alias=>'COL10'
,p_column_display_sequence=>10
,p_column_heading=>'Col10'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39155557285840618)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(32423732821647198)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39155756233840620)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(39155557285840618)
,p_button_name=>'Go'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--large:t-Button--success:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>wwv_flow_api.id(32479868277647142)
,p_button_image_alt=>'Go'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39155695871840619)
,p_name=>'P2000_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(39155557285840618)
,p_prompt=>'Search'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(32478735398647145)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39158146910840644)
,p_name=>'do the search'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(39155756233840620)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39158233919840645)
,p_event_id=>wwv_flow_api.id(39158146910840644)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(39135437559019981)
,p_stop_execution_on_error=>'Y'
);
end;
/
prompt --application/pages/page_02010
begin
wwv_flow_api.create_page(
 p_id=>2010
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'Student Detail'
,p_step_title=>'Student Detail'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'EDFI'
,p_last_upd_yyyymmddhh24miss=>'20201002134628'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(39157578081840638)
,p_plug_name=>'<b>&P2010_STUDENT_NAME.</b>'
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
 p_id=>wwv_flow_api.id(39158308122840646)
,p_plug_name=>'Buttons'
,p_parent_plug_id=>wwv_flow_api.id(39157578081840638)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(32399586131647217)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(39715455128916523)
,p_name=>'Industry Certifications'
,p_template=>wwv_flow_api.id(32423732821647198)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'  l_db_link varchar2(100);',
'  l_sql     varchar2(1000);',
'  l_district_id varchar2(20);',
'begin',
'  l_district_id := :G_DISTRICT_ID;',
'  ',
'  select DB_LINK',
'    into l_db_link',
'    from DISTRICT_DB_LINK',
'   where DISTRICT_ID = l_district_id',
'     and TARGET_DB = ''ODS'';',
'     ',
'  l_sql := ''select "StudentUniqueId", "SchoolYear", "TermDescriptor", "AcademicHonorCategoryType", "AchievementCategory", "AchievementTitle"',
'        from edfi.v_StudentIndustryCert@''||l_db_link||'' ',
'       where "StudentUniqueId" = ''''''||:p2010_student_unique_id||'''''''';',
'  apex_debug.message(''>>>>>>> ''||l_sql);',
'  return l_sql;',
'END;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2010_STUDENT_UNIQUE_ID'
,p_query_row_template=>wwv_flow_api.id(32446447746647176)
,p_plug_query_max_columns=>6
,p_query_headings=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return ''StudentUniqueId:School Year:Term:Cert Category:Achievement Category:AchievementTitle'';',
''))
,p_query_headings_type=>'FUNCTION_BODY_RETURNING_COLON_DELIMITED_LIST'
,p_query_num_rows=>15
,p_query_options=>'GENERIC_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Industry Certifications Found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39715543206916524)
,p_query_column_id=>1
,p_column_alias=>'COL01'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39715648342916525)
,p_query_column_id=>2
,p_column_alias=>'COL02'
,p_column_display_sequence=>2
,p_column_heading=>'Col02'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39715727381916526)
,p_query_column_id=>3
,p_column_alias=>'COL03'
,p_column_display_sequence=>3
,p_column_heading=>'Col03'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39715869972916527)
,p_query_column_id=>4
,p_column_alias=>'COL04'
,p_column_display_sequence=>4
,p_column_heading=>'Col04'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39715973907916528)
,p_query_column_id=>5
,p_column_alias=>'COL05'
,p_column_display_sequence=>5
,p_column_heading=>'Col05'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39716071416916529)
,p_query_column_id=>6
,p_column_alias=>'COL06'
,p_column_display_sequence=>6
,p_column_heading=>'Col06'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(39716201369916531)
,p_name=>'Level I/II Certifications'
,p_template=>wwv_flow_api.id(32423732821647198)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'  l_db_link varchar2(100);',
'  l_sql     varchar2(1000);',
'  l_district_id varchar2(20);',
'begin',
'  l_district_id := :G_DISTRICT_ID;',
'  ',
'  select DB_LINK',
'    into l_db_link',
'    from DISTRICT_DB_LINK',
'   where DISTRICT_ID = l_district_id',
'     and TARGET_DB = ''ODS'';',
'     ',
'  l_sql := ''select "StudentUniqueId", "SchoolYear", "TermDescriptor", "RecognitionAwardDate", "AchievementTitle", "Criteria"',
'        from edfi.v_StudentCert@''||l_db_link||'' ',
'       where "StudentUniqueId" = ''''''||:p2010_student_unique_id||'''''''';',
'  apex_debug.message(''>>>>>>> ''||l_sql);',
'  return l_sql;',
'END;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2010_STUDENT_UNIQUE_ID'
,p_query_row_template=>wwv_flow_api.id(32446447746647176)
,p_plug_query_max_columns=>6
,p_query_headings=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return ''StudentUniqueId:School Year:Term:Award Date:Achievement Title:Cert Level'';',
''))
,p_query_headings_type=>'FUNCTION_BODY_RETURNING_COLON_DELIMITED_LIST'
,p_query_num_rows=>15
,p_query_options=>'GENERIC_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Level I/II Certifications Found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39716313377916532)
,p_query_column_id=>1
,p_column_alias=>'COL01'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39716461155916533)
,p_query_column_id=>2
,p_column_alias=>'COL02'
,p_column_display_sequence=>2
,p_column_heading=>'Col02'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39716546018916534)
,p_query_column_id=>3
,p_column_alias=>'COL03'
,p_column_display_sequence=>3
,p_column_heading=>'Col03'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39716651322916535)
,p_query_column_id=>4
,p_column_alias=>'COL04'
,p_column_display_sequence=>4
,p_column_heading=>'Col04'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39716787288916536)
,p_query_column_id=>5
,p_column_alias=>'COL05'
,p_column_display_sequence=>5
,p_column_heading=>'Col05'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(39716815140916537)
,p_query_column_id=>6
,p_column_alias=>'COL06'
,p_column_display_sequence=>6
,p_column_heading=>'Col06'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39158424822840647)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(39158308122840646)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(32479868277647142)
,p_button_image_alt=>'Cancel'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:2000:&SESSION.::&DEBUG.:RP,2010::'
,p_button_cattributes=>'title="Take me back to the student list"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(39158598837840648)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(39158308122840646)
,p_button_name=>'Update'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(32479868277647142)
,p_button_image_alt=>'Update'
,p_button_position=>'BELOW_BOX'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(39158788706840650)
,p_branch_name=>'back to student list'
,p_branch_action=>'f?p=&APP_ID.:2000:&SESSION.::&DEBUG.:RP,2010::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39157617525840639)
,p_name=>'P2010_STUDENT_UNIQUE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(39157578081840638)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39157938605840642)
,p_name=>'P2010_STUDENT_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(39157578081840638)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39713856239916507)
,p_name=>'P2010_ASVAB_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(39157578081840638)
,p_prompt=>'ASVAB Administration Date'
,p_format_mask=>'MM-DD-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(32478649535647146)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39713912708916508)
,p_name=>'P2010_MILITARY_ENLISTMENT_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(39157578081840638)
,p_prompt=>'Military Enlistment Date'
,p_format_mask=>'MM-DD-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(32478649535647146)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39714093526916509)
,p_name=>'P2010_MENINGITIS_DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(39157578081840638)
,p_prompt=>'Meningitis Vaccination Date'
,p_format_mask=>'MM-DD-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(32478649535647146)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39714227748916511)
,p_name=>'P2010_ASSOCIATES_DEGREE_DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(39157578081840638)
,p_prompt=>'Associates Degree Date'
,p_format_mask=>'MM-DD-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(32478649535647146)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'both'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39714374229916512)
,p_name=>'P2010_COLLEGE_APPLICATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(39157578081840638)
,p_prompt=>'College Application'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:College Application;Y'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(32478477883647147)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39714558995916514)
,p_name=>'P2010_FINANCIAL_APPLICATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(39157578081840638)
,p_prompt=>'Financial Application'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:Financial Application;Y'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(32478477883647147)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39158611408840649)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'update student'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  DECLARE',
'  l_token varchar2(100);',
'  begin',
'  l_token := PKG_UPDATE_STUDENT_ATTRIBUTES.FN_GET_AUTH_TOKEN_25(P_DB_NUMBER => :g_ods_number);',
'  -- Call the procedure',
'  PKG_UPDATE_STUDENT_ATTRIBUTES.PROC_PUT_STU_CHAR_25(p_student_unique_id => :p2010_student_unique_id,',
'                                                     p_ASVAB_date => TO_DATE(:P2010_ASVAB_DATE,''MM-DD-YYYY''),',
'                                                     p_Military_date => TO_DATE(:P2010_MILITARY_ENLISTMENT_DATE,''MM-DD-YYYY''),',
'                                                     p_Meningitis_date => TO_DATE(:P2010_MENINGITIS_DATE,''MM-DD-YYYY''),',
'                                                     p_database_number => :g_ods_number,',
'                                                     p_auth_token => l_token);',
'  PKG_UPDATE_STUDENT_ATTRIBUTES.PROC_PUT_POST_SEC_EVENTS_25(p_student_unique_id => :p2010_student_unique_id,',
'                                                            p_associates_degree_date => to_date(:p2010_associates_degree_date,''MM-DD-YYYY''),',
'                                                            p_college_app_flag => :p2010_college_application,',
'                                                            p_financial_app_flag => :p2010_financial_application,',
'                                                            p_database_number => :g_ods_number,',
'                                                            p_auth_token => l_token);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Student Record Update Successful!'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(39715245971916521)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get student data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_UPDATE_STUDENT_ATTRIBUTES.PROC_GET_STU_CHARACTERISTICS(p_student_unique_id => :P2010_STUDENT_UNIQUE_ID,',
'                                                             P_DISTRICT_ID => :G_DISTRICT_ID,',
'                                                             P_ODS_NUMBER => :G_ODS_NUMBER,',
'                                                             p_ASVAB_date => :P2010_ASVAB_DATE,',
'                                                             p_Military_date => :P2010_MILITARY_ENLISTMENT_DATE,',
'                                                             p_Meningitis_date => :P2010_MENINGITIS_DATE);',
'                                                             ',
'PKG_UPDATE_STUDENT_ATTRIBUTES.PROC_GET_POST_SEC_EVENTS(p_student_unique_id => :P2010_STUDENT_UNIQUE_ID,',
'                                                         P_DISTRICT_ID => :G_DISTRICT_ID,',
'                                                         P_ODS_NUMBER => :G_ODS_NUMBER,',
'                                                         p_associates_degree_date => :p2010_associates_degree_date,',
'                                                         p_college_app_flag => :p2010_college_application,',
'                                                         p_financial_app_flag => :p2010_financial_application);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_api.create_page(
 p_id=>9999
,p_user_interface_id=>wwv_flow_api.id(32502397090647103)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_step_title=>'CCMF Assessment File Data Loader - Sign In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(32381637758647238)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'EDFI'
,p_last_upd_yyyymmddhh24miss=>'20200707163715'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32506418799647052)
,p_plug_name=>'CCMF Assessment File Data Loader'
,p_icon_css_classes=>'app-icon'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(32423216519647198)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(32511147722647037)
,p_plug_name=>'Language Selector'
,p_parent_plug_id=>wwv_flow_api.id(32506418799647052)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(32398553479647218)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>'apex_lang.emit_language_selector_list;'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_num_rows=>15
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32509215309647041)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(32506418799647052)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(32479868277647142)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32506869570647049)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(32506418799647052)
,p_prompt=>'username'
,p_placeholder=>'username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(32478477883647147)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32507238715647047)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(32506418799647052)
,p_prompt=>'password'
,p_placeholder=>'password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(32478477883647147)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32508335670647044)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(32506418799647052)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'LOGIN_REMEMBER_USERNAME'
,p_lov=>'.'||wwv_flow_api.id(32507577011647047)||'.'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(32478477883647147)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32510036644647039)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P9999_USERNAME),',
'    p_consent  => :P9999_REMEMBER = ''Y'' );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32509625434647040)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P9999_USERNAME,',
'    p_password => :P9999_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32510814762647038)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(38282747314013645)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'REDIRECT_TO_LOGIN_PAGE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'owa_util.redirect_url(''f?p=119:9999:''||:APP_SESSION);',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32510480886647039)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(33288570066597502)
);
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
