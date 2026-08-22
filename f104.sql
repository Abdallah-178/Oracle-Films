prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>2090789809480893
,p_default_application_id=>104
,p_default_id_offset=>0
,p_default_owner=>'HR'
);
end;
/
 
prompt APPLICATION 104 - SnoopyFilm
--
-- Application Export:
--   Application:     104
--   Name:            SnoopyFilm
--   Exported By:     HR
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                      5
--       Items:                   30
--       Processes:                9
--       Regions:                 13
--       Buttons:                  6
--       Dynamic Actions:          1
--     Shared Components:
--       Logic:
--         Items:                  1
--         Processes:              1
--         Build Options:          1
--       Navigation:
--         Lists:                  2
--         Breadcrumbs:            1
--           Entries:              1
--       Security:
--         Authentication:         1
--         Authorization:          1
--       User Interface:
--         Themes:                 1
--         Templates:
--       PWA:
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--   Version:         24.2.0
--   Instance ID:     1367178712857120
--

prompt --application/delete_application
begin
wwv_flow_imp.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'HR')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'SnoopyFilm')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'SNOOPYFILM')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'8C5A5A0189F1987B3B2FB2B79F528C8FB04817B4ED0E2F079540D3345F07C0DC'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'24.2'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(35174053711852393)
,p_application_tab_set=>0
,p_logo_type=>'T'
,p_logo_text=>'SnoopyFilm'
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
,p_substitution_value_01=>'SnoopyFilm'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>6
,p_version_scn=>72729319
,p_print_server_type=>'NATIVE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'N'
,p_pwa_is_push_enabled=>'N'
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(104)
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(35174858310852401)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>2467739217141810545
,p_nav_list_template_options=>'#DEFAULT#:js-defaultCollapsed:js-navCollapsed--hidden:t-TreeNav--styleA'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(35175950044852475)
,p_nav_bar_list_template_id=>2847543055748234966
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --workspace/credentials/credentials_for_movies
begin
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(35191271920903389)
,p_name=>'Credentials for Movies'
,p_static_id=>'Credentials_for_Movies'
,p_authentication_type=>'HTTP_HEADER'
,p_valid_for_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://api.themoviedb.org/3/',
''))
,p_prompt_on_install=>true
);
end;
/
prompt --workspace/remote_servers/api_themoviedb_org_3
begin
wwv_imp_workspace.create_remote_server(
 p_id=>wwv_flow_imp.id(35191402797903406)
,p_name=>'api-themoviedb-org-3'
,p_static_id=>'api_themoviedb_org_3'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('api_themoviedb_org_3'),'https://api.themoviedb.org/3/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('api_themoviedb_org_3'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('api_themoviedb_org_3'),'')
,p_remote_sql_default_schema=>nvl(wwv_flow_application_install.get_remote_server_default_db('api_themoviedb_org_3'),'')
,p_mysql_sql_modes=>nvl(wwv_flow_application_install.get_remote_server_sql_mode('api_themoviedb_org_3'),'')
,p_prompt_on_install=>false
,p_ai_is_builder_service=>false
,p_ai_model_name=>nvl(wwv_flow_application_install.get_remote_server_ai_model('api_themoviedb_org_3'),'')
,p_ai_http_headers=>nvl(wwv_flow_application_install.get_remote_server_ai_headers('api_themoviedb_org_3'),'')
,p_ai_attributes=>nvl(wwv_flow_application_install.get_remote_server_ai_attrs('api_themoviedb_org_3'),'')
);
end;
/
prompt --application/shared_components/data_profiles/movie_cast
begin
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(35235935153233895)
,p_name=>'Movie Cast'
,p_format=>'JSON'
,p_has_header_row=>false
,p_row_selector=>'cast'
,p_use_raw_json_selectors=>false
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35237622927233896)
,p_data_profile_id=>wwv_flow_imp.id(35235935153233895)
,p_name=>'ID'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35236145164233895)
,p_data_profile_id=>wwv_flow_imp.id(35235935153233895)
,p_name=>'NAME'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'name'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35236477869233896)
,p_data_profile_id=>wwv_flow_imp.id(35235935153233895)
,p_name=>'ADULT'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'adult'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35236701456233896)
,p_data_profile_id=>wwv_flow_imp.id(35235935153233895)
,p_name=>'ORDER_'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'order'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35237050665233896)
,p_data_profile_id=>wwv_flow_imp.id(35235935153233895)
,p_name=>'GENDER'
,p_sequence=>5
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'gender'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35237386822233896)
,p_data_profile_id=>wwv_flow_imp.id(35235935153233895)
,p_name=>'CAST_ID'
,p_sequence=>6
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'cast_id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35237924851233898)
,p_data_profile_id=>wwv_flow_imp.id(35235935153233895)
,p_name=>'CHARACTER'
,p_sequence=>7
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'character'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35238245358233898)
,p_data_profile_id=>wwv_flow_imp.id(35235935153233895)
,p_name=>'CREDIT_ID'
,p_sequence=>8
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'credit_id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35238571607233898)
,p_data_profile_id=>wwv_flow_imp.id(35235935153233895)
,p_name=>'POPULARITY'
,p_sequence=>9
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'popularity'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35238874910233898)
,p_data_profile_id=>wwv_flow_imp.id(35235935153233895)
,p_name=>'PROFILE_PATH'
,p_sequence=>10
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'profile_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35239144513233898)
,p_data_profile_id=>wwv_flow_imp.id(35235935153233895)
,p_name=>'ORIGINAL_NAME'
,p_sequence=>11
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_name'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35239457885233898)
,p_data_profile_id=>wwv_flow_imp.id(35235935153233895)
,p_name=>'KNOWN_FOR_DEPARTMENT'
,p_sequence=>12
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'known_for_department'
);
end;
/
prompt --application/shared_components/data_profiles/movie_details
begin
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'Movie Details'
,p_format=>'JSON'
,p_has_header_row=>false
,p_use_raw_json_selectors=>false
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35243342158233907)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'ID'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35243643240233907)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'ADULT'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'adult'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35243952901233907)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'TITLE'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'title'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35244261615233909)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'VIDEO'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'video'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35244580333233909)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'BUDGET'
,p_sequence=>5
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'budget'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35244841619233909)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'STATUS'
,p_sequence=>6
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'status'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35245194120233909)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'IMDB_ID'
,p_sequence=>7
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'imdb_id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35245405236233909)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'REVENUE'
,p_sequence=>8
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'revenue'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35245766368233909)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'RUNTIME'
,p_sequence=>9
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'runtime'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35246093742233910)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'TAGLINE'
,p_sequence=>10
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'tagline'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35246355360233910)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'HOMEPAGE'
,p_sequence=>11
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'homepage'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35246628227233910)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'OVERVIEW'
,p_sequence=>12
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'overview'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35246939588233910)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'POPULARITY'
,p_sequence=>13
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'popularity'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35242173213233906)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'VOTE_COUNT'
,p_sequence=>14
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_count'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35242454040233907)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'POSTER_PATH'
,p_sequence=>15
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'poster_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35242776182233907)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'RELEASE_DATE'
,p_sequence=>16
,p_column_type=>'DATA'
,p_data_type=>'DATE'
,p_format_mask=>'YYYY"-"MM"-"DD'
,p_has_time_zone=>false
,p_selector=>'release_date'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35243084223233907)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'VOTE_AVERAGE'
,p_sequence=>17
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_average'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35240984128233906)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'BACKDROP_PATH'
,p_sequence=>18
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'backdrop_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35241266758233906)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'ORIGINAL_TITLE'
,p_sequence=>19
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_title'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35241556677233906)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'ORIGINAL_LANGUAGE'
,p_sequence=>20
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_language'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35241831641233906)
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_name=>'BELONGS_TO_COLLECTION'
,p_sequence=>21
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'belongs_to_collection'
);
end;
/
prompt --application/shared_components/data_profiles/popular_movies_2
begin
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'Popular Movies (2)'
,p_format=>'JSON'
,p_has_header_row=>false
,p_row_selector=>'results'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35248410707233914)
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'ID'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35248739311233914)
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'ADULT'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'adult'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35249076051233914)
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'TITLE'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'title'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35249318684233914)
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'VIDEO'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'video'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35249619341233914)
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'OVERVIEW'
,p_sequence=>5
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'overview'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35249944860233914)
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'POPULARITY'
,p_sequence=>6
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'popularity'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35250290072233915)
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'VOTE_COUNT'
,p_sequence=>7
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_count'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35250515303233915)
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'POSTER_PATH'
,p_sequence=>8
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'poster_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35250845042233915)
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'RELEASE_DATE'
,p_sequence=>9
,p_column_type=>'DATA'
,p_data_type=>'DATE'
,p_format_mask=>'YYYY"-"MM"-"DD'
,p_has_time_zone=>false
,p_selector=>'release_date'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35251127776233915)
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'VOTE_AVERAGE'
,p_sequence=>10
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_average'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35251448732233915)
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'BACKDROP_PATH'
,p_sequence=>11
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'backdrop_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35251763780233915)
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'ORIGINAL_TITLE'
,p_sequence=>12
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_title'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35252015124233915)
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_name=>'ORIGINAL_LANGUAGE'
,p_sequence=>13
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_language'
);
end;
/
prompt --application/shared_components/data_profiles/search_movies
begin
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'Search Movies'
,p_format=>'JSON'
,p_has_header_row=>false
,p_row_selector=>'results'
,p_use_raw_json_selectors=>false
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35254062768233918)
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'ID'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35254387075233920)
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'ADULT'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'adult'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35254690119233920)
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'TITLE'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'title'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35254936445233920)
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'VIDEO'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'video'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35255201402233920)
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'OVERVIEW'
,p_sequence=>5
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'overview'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35255562107233920)
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'POPULARITY'
,p_sequence=>6
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'popularity'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35255804017233920)
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'VOTE_COUNT'
,p_sequence=>7
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_count'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35256159692233920)
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'POSTER_PATH'
,p_sequence=>8
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'poster_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35256440795233921)
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'RELEASE_DATE'
,p_sequence=>9
,p_column_type=>'DATA'
,p_data_type=>'DATE'
,p_format_mask=>'YYYY"-"MM"-"DD'
,p_has_time_zone=>false
,p_selector=>'release_date'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35256741217233921)
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'VOTE_AVERAGE'
,p_sequence=>10
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'vote_average'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35257072673233921)
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'BACKDROP_PATH'
,p_sequence=>11
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'backdrop_path'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35257326117233921)
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'ORIGINAL_TITLE'
,p_sequence=>12
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_title'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35257644833233921)
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_name=>'ORIGINAL_LANGUAGE'
,p_sequence=>13
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'original_language'
);
end;
/
prompt --application/shared_components/data_profiles/sdf
begin
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(35453326938516632)
,p_name=>'sdf'
,p_format=>'JSON'
,p_use_raw_json_selectors=>false
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35453583784516645)
,p_data_profile_id=>wwv_flow_imp.id(35453326938516632)
,p_name=>'SUCCESS'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'success'
,p_remote_data_type=>'boolean'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35453817552516646)
,p_data_profile_id=>wwv_flow_imp.id(35453326938516632)
,p_name=>'STATUS_CODE'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'status_code'
,p_remote_data_type=>'number'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(35454186001516646)
,p_data_profile_id=>wwv_flow_imp.id(35453326938516632)
,p_name=>'STATUS_MESSAGE'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'status_message'
,p_remote_data_type=>'string'
);
end;
/
prompt --application/shared_components/web_sources/movie_cast
begin
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(35239736722233900)
,p_name=>'Movie Cast'
,p_static_id=>'Movie_Cast'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(35235935153233895)
,p_remote_server_id=>wwv_flow_imp.id(35191402797903406)
,p_url_path_prefix=>'movie/:movie_id/credits'
,p_credential_id=>wwv_flow_imp.id(35191271920903389)
,p_pass_ecid=>true
,p_catalog_internal_name=>'TMDB'
,p_catalog_service_name=>'Movie Cast'
,p_catalog_service_version=>20220802
,p_version_scn=>72342329
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(35240372137233903)
,p_web_src_module_id=>wwv_flow_imp.id(35239736722233900)
,p_name=>'movie_id'
,p_param_type=>'URL_PATTERN'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'505'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(35239961418233900)
,p_web_src_module_id=>wwv_flow_imp.id(35239736722233900)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/web_sources/movie_details
begin
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(35247269302233910)
,p_name=>'Movie Details'
,p_static_id=>'Movie_Details'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(35240770696233906)
,p_remote_server_id=>wwv_flow_imp.id(35191402797903406)
,p_url_path_prefix=>'movie/:movie_id'
,p_credential_id=>wwv_flow_imp.id(35191271920903389)
,p_pass_ecid=>true
,p_catalog_internal_name=>'TMDB'
,p_catalog_service_name=>'Movie Details'
,p_catalog_service_version=>20220802
,p_version_scn=>72086000
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(35247895971233912)
,p_web_src_module_id=>wwv_flow_imp.id(35247269302233910)
,p_name=>'movie_id'
,p_param_type=>'URL_PATTERN'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'505'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(35247410216233910)
,p_web_src_module_id=>wwv_flow_imp.id(35247269302233910)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/web_sources/popular_movies
begin
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(35252385959233917)
,p_name=>'Popular Movies'
,p_static_id=>'Popular_Movies'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(35248269524233914)
,p_remote_server_id=>wwv_flow_imp.id(35191402797903406)
,p_url_path_prefix=>'movie/popular'
,p_credential_id=>wwv_flow_imp.id(35191271920903389)
,p_pass_ecid=>true
,p_catalog_internal_name=>'TMDB'
,p_catalog_service_name=>'Popular Movies'
,p_catalog_service_version=>20220802
,p_version_scn=>72257548
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(35253043463233917)
,p_web_src_module_id=>wwv_flow_imp.id(35252385959233917)
,p_name=>'language'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'en-US'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(35253423066233917)
,p_web_src_module_id=>wwv_flow_imp.id(35252385959233917)
,p_name=>'page'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'1'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(35252615200233917)
,p_web_src_module_id=>wwv_flow_imp.id(35252385959233917)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/web_sources/search_movies
begin
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(35257938512233921)
,p_name=>'Search Movies'
,p_static_id=>'Search_Movies'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(35253824914233918)
,p_remote_server_id=>wwv_flow_imp.id(35191402797903406)
,p_url_path_prefix=>'search/movie'
,p_credential_id=>wwv_flow_imp.id(35191271920903389)
,p_pass_ecid=>true
,p_catalog_internal_name=>'TMDB'
,p_catalog_service_name=>'Search Movies'
,p_catalog_service_version=>20220802
,p_attribute_01=>'PAGE_NUMBER_FIXED_SIZE'
,p_attribute_04=>'page'
,p_attribute_05=>'1'
,p_attribute_06=>'20'
,p_attribute_08=>'OFFSET'
,p_attribute_10=>'EQUALS'
,p_attribute_11=>'true'
,p_version_scn=>72075014
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(35258623341233923)
,p_web_src_module_id=>wwv_flow_imp.id(35257938512233921)
,p_name=>'language'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'en-US'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(35259079602233923)
,p_web_src_module_id=>wwv_flow_imp.id(35257938512233921)
,p_name=>'query'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'harry potter'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(35259488429233923)
,p_web_src_module_id=>wwv_flow_imp.id(35257938512233921)
,p_name=>'include_adult'
,p_param_type=>'QUERY_STRING'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
,p_value=>'false'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(35258225121233923)
,p_web_src_module_id=>wwv_flow_imp.id(35257938512233921)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_legacy_ords_fixed_page_size=>20
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/web_sources/tagged_images
begin
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(35454458011516651)
,p_name=>'Tagged Images'
,p_static_id=>'sdf'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(35453326938516632)
,p_remote_server_id=>wwv_flow_imp.id(35191402797903406)
,p_url_path_prefix=>'person/:person_id/tagged_images'
,p_credential_id=>wwv_flow_imp.id(35191271920903389)
,p_version_scn=>72521646
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(35455373075530787)
,p_web_src_module_id=>wwv_flow_imp.id(35454458011516651)
,p_name=>'person_id'
,p_param_type=>'URL_PATTERN'
,p_data_type=>'VARCHAR2'
,p_is_required=>false
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(35454630644516657)
,p_web_src_module_id=>wwv_flow_imp.id(35454458011516651)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(35174858310852401)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>72037149
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35186474457852564)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_bar
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(35175950044852475)
,p_name=>'Navigation Bar'
,p_list_status=>'PUBLIC'
,p_version_scn=>72037168
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35187963356852590)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35188401052852592)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(35187963356852590)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35188839212852593)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(35187963356852590)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/listentry
begin
null;
end;
/
prompt --application/shared_components/files/icons_app_icon_32_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000005124944415478018C55CB6E5C45103D7712CF387E12DBC4B19C070F818494488048D8B3820FC0FC0C5F910D0B16860D1F000B140112626B09212C0509C7C871C0';
wwv_flow_imp.g_varchar2_table(2) := '3032F258F1639C99F134E75475DFDB331EC7B4BB5EA74E55D77DCC75EDEDD58D70B1FC7E01E7A2FCF967D4F0BF567101CBF3D2928A1C2A97DE608E00F7C8018689C331EBB8079B13809020A58052407F74E2B694A908D08C1CA06C427241120DF5F03E27';
wwv_flow_imp.g_varchar2_table(3) := '233852552789A19B2C2F60E4001C5C39C8E60D0ABB4664ABEA665E4ECE5860DDD95AA83D460F80B8861A062BF19C1DE8AEFAF308A0303030A6205F3C3E2899E174B935804C4E765F7498F218E573F138D891EEEB6051AD930E12E0A9523B24560999C33B';
wwv_flow_imp.g_varchar2_table(4) := '90402B27E8D635C3B8BD8182944975BC60C2091D189A78DA9E0F9E0E4463390760603B224611C3C05205C3153A4FBA7EF42F244247CAD05D037B0470A998463B1B40619282D4E4BB2DDC947AACBD870FDEBA6132D66E657C3BC279BC6D7CFAEE131EE8C1';
wwv_flow_imp.g_varchar2_table(5) := '584FF19C01FCB67AA56BBF185501FD9323DCBFBD80C9FA654C50EEDD9AC3E9F3632766A30808292E30F81A314611F4128AF6020931A702B99CA476B08B66EB00BF6E37B1FEA489DDFD2308D3159522EE80B051EA51E2453600F318B5B2A2826FF869FB00';
wwv_flow_imp.g_varchar2_table(6) := '0F3E791FAB2B77B1FA314576E50E1EACDCE35D38AC3A9CD7CF26AC68B52211F383623E3DBF94E2F998BFD4C5BB4B1338E9057CFAED2313F9EF5C9FC2D5A203889C04F912A898369D495B5353C19274601A3258373EBB049074776906E0CBD53CEA60E9A5';
wwv_flow_imp.g_varchar2_table(7) := '2993DDE3AE20DCB93E8DD12B54B05CCE6000EDC04B184084997C2886DC8ED3C1D24C4313E1F66C03AFCD4FE2F58529DC9CA92B85C569E6CC930A5421764CF50111405AB5E49CB5241B18AD0CA5DDE91B2AF5D19BF3F8F08D39B926DD5ECFAC2B1DEAF754';
wwv_flow_imp.g_varchar2_table(8) := '9E4D1D4F77D4596707E0219EF232C42270F50EF7B1D1E46F5E29BE3CAD761FADF62933BE37FED9C729391E45CD7EDC0C5444C31DB29E670720217BE48A28C1DEF0FB37A6D1EE73FE20A8C056EB185BFB270C787DC48E4E0BBCB73C65DF0903A5782EB7BC';
wwv_flow_imp.g_varchar2_table(9) := '91920D107C2EB125399D2FC5D2580FAFBC3C8BF999297CF7B8E559F1025DDA878FF7B0787516AF92B370B94B905BB9CAD0D326C8CD911564DF013FDE40534632CFD4ECF898D95B0BB3F8ECC747E8F62381879F74033EFFE937DC9CE72F847DE6AE5CF2FE';
wwv_flow_imp.g_varchar2_table(10) := 'CC59D18022C80DF2F469CCEE80D7202D23558724B8C69F60E3CA04BE58FB934FCAF3AB6B4FD1B832899AD580ADD9963E3746AD12672F32D9843B279604B6CAF13E3FC36B9B3B78D269E0CB9FFFC237EB3BF87A7D1B5FFDB283ADE775AC6DFE0DBB31B141';
wwv_flow_imp.g_varchar2_table(11) := 'E088797DF2FDB860DD3900D9BE2D4FB72A0B0619B1D9DAC7F7EB7F60BB338E5A7D1C98BE86874F3B941EC2CC35620DE6EAF8617D13CDBD7DFD9F61B1BAD1A41DFB292CF85E29E4000AA310E18E014DAC17F66C6A1987138B28C6EA3610B3A88DF3B653E4';
wwv_flow_imp.g_varchar2_table(12) := '83686DAC8103729E4D2E2314AA92C05601FAD68F9608CFA706CA010C2E0C736580BB15ECA0E90A74120F305C91E5A4240294497EB2C2E10314EE538B48A39D4042DC42788D026364C654CCC954B122B165C14ACB540A69D574A70C4FC8B0ADBAC46B8C80';
wwv_flow_imp.g_varchar2_table(13) := '1953561178084C50AE10BDC42A7458C6D16319F86F883C69D5A6E04B7E6A858C89A1DF2FE3737628AB823102E3F80E04035CB9AF97A43CCE2046667316D842A004D57A61A8247B193BF83B00B641B952521716FD680668911F04F283922806E701BF1D86';
wwv_flow_imp.g_varchar2_table(14) := '952A4F167180005FC97AA4D6D1AB8CCA257C210886921318696433992A093996F9FF010000FFFF0B1A270F000000064944415403003A8AD36EC549377E0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(35177098707852504)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_144_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000090000000900806000000E746E2B800001000494441547801EC5D69901CC5957ED53D3D97349A198D66343A41D2CC0849481A21F0C1258C1187C34BC4EE0FC2E120AC03135E111B1BAC03D6EBDD1F661DDE';
wwv_flow_imp.g_varchar2_table(2) := '3F8EF0AEF9B1AC6001898DFD8371843976C15C2B990DA35B2321B0906604121A21348734F7D547F9BDAC3EAABB2BAB32ABB2BAABE788CEAAACCC97DFFBDECBAFB2AABB5AAD10F8FCA7A5F133B574D36CA5E433E0BB80F4748A32B5749397CAAC1EBD644F';
wwv_flow_imp.g_varchar2_table(3) := 'D958DF05A48C692E90623DE6C2CF1E8B65A0740524165F20ADA6D3E2392BA022486C3A2D9EB302F25140D369A5E1A569460BC8EF099E162B8D43925C0B88A7C8526A9F1613EC77C21D92347304E47026F93D0F19FCC010C950F2509314500907EF702679';
wwv_flow_imp.g_varchar2_table(4) := 'C8A1E4500722259662490139042F99CA59738B0C94588AED05E4E3D9E023B4C5AC947253B033652F201FCF061FA14B592D16DC839D297B01598433DB34FD32E0658D2BBC8004F2BFFA854F6B6ED9F379F3E6BD9DAB36BD706663FB8B5DB7B6EF39BB75C3';
wwv_flow_imp.g_varchar2_table(5) := '9ECEBF50525E5484A38A4F0E0EC54A3153EC9403CA05E5442075AE4C9CD738BEC48A2B205DD736EF397303266B5BFBDECE6736EEE93CDABEA773AA2A141E8A42EC725C872E3D143A019AFE4700ED9D10C0EB21D0B1D0DE43D13C8CD53D8C65FC9DC753AC';
wwv_flow_imp.g_varchar2_table(6) := '14B38EB1530E28179413CA4D3247FF4E39A3DC01E6107CFFE34B0CE7C477EF69079B5EEC6CDCB4B7F3414CC4BFB4EFED7A17CBB538844E63B2F6820EBB3480CD681CC162F3422B9B5EDFBB987B7E427DF61F41F794A3C72867943BCA219677DB5F3CFB0B';
wwv_flow_imp.g_varchar2_table(7) := '5A9DD73DFFC97C9F3964C1174E4078A660DA6FD575F80932F8473C73EEC17D2D96127CE1340687752DCBA5A6FD134EE64FCA42915BF1B86004D1A7BF99D8FCECD148FB9EAE47F12CF914347815006EC552DC172AB9B8047CF37E9BA6696FE0EDC0695CE9';
wwv_flow_imp.g_varchar2_table(8) := '1FA1DC673CF9A3295F05B4F1A5334B62E5B50700F4E73090367F424064D9970891921699B61A57FAE7E315B51FD26D83911E7F02F24D40487CAD96081DC2B9A26B368BC19F1018B4FA0D125709EA0CE7437674B859D7E0C0C6BD9DEB54C662C6F245401B';
wwv_flow_imp.g_varchar2_table(9) := '5F38773B12FF101D2DC1A2E855DA306AE4E10A6595A6C31FF184DEE24706950B0889AED54289B7916C89DE2023F3A2BC9CD728C09B48112BC8FFABC513FA4D3F5622A502DAFCEC97D548F415E45F8DA5845EAECEECA2C4E7816935AE442FD31CA924AE54';
wwv_flow_imp.g_varchar2_table(10) := '40F1F2916790DC5A2C25F672795E97589448775D728EB0AAE6A54C40ED7BCE6E07D0B641C9FF7938C78B16BB0C676D9B3157726479A79812017DF33717AB00B47F8569F1C74B55908393E5ACFD4AF652C693A812014D8C8ED3CA531F8814F3227520679E';
wwv_flow_imp.g_varchar2_table(11) := '0273DD615851BB3DF09C9F281FF9810AF2DE05A4EB1ACED9E3D664B0C7BAC3BFD6FCAC0AF9323335D785060B18B9A4658BEC85274EDBDFAA78E4E1594037ED3D771F80B61A2CFFFC489BA5239B462F69B68195EC0A060B13690DD61873676A7351F52C20';
wwv_flow_imp.g_varchar2_table(12) := '1D74CEEAE3828D2F438220625F02F30C9A3F77F2B91212100FF6AE3D9F57EA005B3D476202E0F93299F850C5287C400D3A2446BDD57803E49EA99080D091A58701887D033B8430D04EE8C5F32534D8B5517164EB9AAEBA81A1F1D189AF67E0E4B3EF69F2';
wwv_flow_imp.g_varchar2_table(13) := '31ED24A08CFFD99A9101F97930C61561EB750E3D084803CC938580B0D56B221440C8519075E8608FB322E7BF78D61889C51C8AF3712F203D4169BA3DDF1535E7B74AB5288090F2C77948C9C72838413E15EF3DC511D02D7BCF2F44EE0D58D4BFF0B41003';
wwv_flow_imp.g_varchar2_table(14) := '153674845387E4E88A635034060BBFF65277039E431C5EF6CDAE57A0292DD6600FEDA157F8041736F440C6FD50397672D6EE59E58F9CD4C79BE97E24BFC7B9C5B580343D51625FD9704E866A0BD935A55812F232971E04142A2D01C9CEA66A35E5E259F0';
wwv_flow_imp.g_varchar2_table(15) := 'B168CA1D657FEC1240D3DDCFA57B01691A3E81B78F2750BDC53ABD7949F0838F5BCC50A88C47D3A9DDB580E250D84B98DBDC382560B61F40D3F508B8FC732D204D0B17740572B53ABB1AE43293E6612556F7B218B8161078506DC1F2EB71D98A0E5C81E8';
wwv_flow_imp.g_varchar2_table(16) := '404F365D97A2F448259B83E2232F8B816B01E9BA1E531C47A0E0A6FABA513CBD587A80EA69722E95E0527769B741AD7004E4324B418D5292D764CF17101B1980458D0DAC507DAAF7A224CACC30E7084887992AA1C92B17203E36040DB5B570D7FA165616';
wwv_flow_imp.g_varchar2_table(17) := 'D4D7426C7410267B2ECC0C55484419E209459700F16ACAE3E0155776FC54DF25888F0F435DCD1CF8F64DAB218CD9A17277FB6AA89B5703F1B161BC9C5D92850D88BD3F331AF207562E6741E0101BEA83D8C8359837770EDCB3792D9487338B33D5EFD974';
wwv_flow_imp.g_varchar2_table(18) := '03D45457339BD850BF5C805CEB4246EECF699AC9123748F90E7FA8CAF3101DC15696AB5FC19CAA4AD87AD31AA82C0BE70DAD8C8461EBCD6BA11A6DA6AE5E86F8F8489E8D7C436EA6E4118A3DC2170115F2BCF29A403D1EC3CB5237DEF36970D7A6355055';
wwv_flow_imp.g_varchar2_table(19) := '5EC685ACC6BE2D1B6F80105EDAA6F05D9A9E88736DA757075FE8BE08C83A79C194554A0837B62E87FAEA0A6BEAA6D686B995B076C5723084575AF7437C199802B4ACF2E7AE8002724FDF32265E233FD6BC1174CF439722BA69DEB07C515E3FAF61C3F5CD';
wwv_flow_imp.g_varchar2_table(20) := 'EC463B8EEFD6E2F8EE8C6757F07687D81DBA5DD12DA0805CF1931F24A8535A41A2782FA3A1FD6DEBDB80F6A2CE42687CDB8DAD6C0CDD0FE98984E8507FED30167F1DE4A32B135011B8E74723D112C5471434F11B5A56085DBA72A1EBE754C28D2DD7B14B';
wwv_flow_imp.g_varchar2_table(21) := '596C30E77147AEB1A7633FD60D4F84B2062B1350B0C3CC8A1912D149880D5F85CA8A7268AC9B0B3D4363D2A517C734D5D640452402D1C13ED063D16C27CA8E827D6A2A1390B27C890279506C14DFB2939B89C92978EFC82978E7F047D2E56D1CF3FED18F';
wwv_flow_imp.g_varchar2_table(22) := '61326A08277AED2B822C5611F2EB87144B57402EB341AB0F7DDADCBA78013CB6F52625A505B1E851877FAB10EAC3C30983A3D94B0104C3316F4A5740E62824EAA94F911FFE661BFCF06B4B959487BFD1C618D0BB3A56F163C33B61FC508504FF9925203D';
wwv_flow_imp.g_varchar2_table(23) := '01F1910188E0638A7B5AD4FD8F00844598745F25917B35A63C61A94177449951028A8D0C828E22BA7BFD0AA82A5315BA0ED591106C59773DD04703F4D99063D6A79181AA2C96444A5293FBC0BAA58C2FEFE41D8D26E0B9435FC093AF7FCCCA73872F02B5';
wwv_flow_imp.g_varchar2_table(24) := 'B141791B03258519C727F67926856A485ECE0C46E454874C9D8EDD171E4E96807846EEDD066824AE3C89891198575D09775ECFFF09EBAEAB13F097BBF7C1EEF74EC0FBA73E6365F73B1DACEDDCB509E0CDC8B756D6C1DCAA727CC83A0C45FB4B4EA09E26';
wwv_flow_imp.g_varchar2_table(25) := 'C07EBF207DE4A592C1CC46C91210CF287B48691ED1230B5DD7E1BE8D2BD301E4C61BC7869FBE7A0C0647C7E1FB77AC875F3C7407FC1CCBF7EF5CCFDA7EFAEA7188DB7CE87CEFFA95EC3296981C4FFB00C4CC1C04ACA603786594252011B0A4C8454C0362';
wwv_flow_imp.g_varchar2_table(26) := '63CC60626294F179602DFF99D7B14BC370EE723FDCBDA105D62EC19BEC50089FBC87589DDABABEEC83935F8D301CABCDFDEB16B3E638AE74AC429B20274C0137AE8078D8C67450664AA5189124A6F0F28394DB9BE7E0D6FAD5D9678863616DFE3FBA4DB5';
wwv_flow_imp.g_varchar2_table(27) := '75F61A3656081B161AD8FAD4A45537BFADF4929A8E852BA0128E291D9CB94202AA9F9B2F0CB34D4375393B1C8BA6BEE763888F1AC7A231DAE17333C3861DE46CCAC31AD45455E0A31243AC39DDFCC38C1BBE4D407BB8020A285F57B4E8ED357DF96BC13C';
wwv_flow_imp.g_varchar2_table(28) := '7B01AD5F5483F81A9CFCFC32E0FB7DAC274F23BC77EAC0364DD3A09DD96017E7D550530D3A3E6B43008EC5F46A0E8480FC3E01F5D8149BB5C679F6FF9876494D393CFAED8DD089F73AFFF6E651F8DDF1F3583E07AA9FFBB21F76DDB3099AE6D8FF2BE026';
wwv_flow_imp.g_varchar2_table(29) := 'BCFCD1CDBA1E33562CE6B8A09BA4E80BE4331002F23B64FADA06E5B3B1C65E4064F3D75F5F0E8F3F70330C8D4DC0B1B317B07C01C3E393F0E3EFDC028FDC627C7E4476BCB260AEE1434F781190978CF87D3A66471E08016553F2E128F9DDE5F9732AEDC1';
wwv_flow_imp.g_varchar2_table(30) := '31F77895821FDCB4180EFDC377E1E55DF7C26F1FBB0F3E78E23BF0F0A645407DF600000D4991EAF138209C9339A7DFFD480EA0FAE624E28C10908E1F2252BC8D350E02CA39F15BE757C2CAFA0A28C79B631A2F521AE7267DA06873E0448697DCAD93B480';
wwv_flow_imp.g_varchar2_table(31) := '02736EB8981D1D6F86C566D1BD552899203D29DA7C243371733D69991C9F3C0AFC4E5A40162117274889446B9A61DC3722F9F98C8BC87A878DB7F09AC64BADC1C58036D78D9652DBF2A22CB538ECF986C2ACBF6FC4985C76E0D326ED23E9D327374A61BD';
wwv_flow_imp.g_varchar2_table(32) := 'C8D89D80BC7834875EA0E54C4BFE825BEFB0E9199599878B3A2F05BDC3630C4D0B97B17D296CD834F0027208C09D8098470764916E97A445A0CD36B1A13E76D837644C2E3BF0B8E1A5A067D0F0111BECF5E8A1C0C37901311AFC89722720061AEC4D2A64';
wwv_flow_imp.g_varchar2_table(33) := 'FA5D1FFABE32B1ED1D321EA8525DA41CC687AB47B088D8A66C523EC827F94EB507666F2B141E4BFE207901F17C04AC9D42663F14353A08CB172D84A54D0B607074027A468D7F452142F767AF1E85A75E3B2A62CA6C2E8F446174620A96352F603EBD8828';
wwv_flow_imp.g_varchar2_table(34) := '75023060951BC5C0D35340F8769D7E0C2A3E36C48473C7DA15B0A4693E9B86431707D99EBF21E919BD097C2B9E90F857A7072F5C630397343600F924D1928848C8C6B335D62DB4C9B01032973652A5235F04A48A9C74569203267B2F427C6C1816372E80';
wwv_flow_imp.g_varchar2_table(35) := '3B37B400BD8B5F327F1EEB3D70AE87EDF91B337B0D74301FF34751CF81CF0CEC650DF3807C92EFC528A6380A9938914D508AAE88882F025245CE4D8C51BC79A5096B6EA8872D1B56412A40FA6996FA7935F0E1D96E09588A848AF390049A7D78E622CCA7';
wwv_flow_imp.g_varchar2_table(36) := '7FAD5A667C6C40BEB7AC6F81A6FA3A14F410103767243B0B7462D75D843E8A51895BF1F354893B4B10FACE4F6CA007AA2B2BE0CE0DAD10A665C064B9B8713E7B48FAA75E776FE7ED62FCB8670CC626A3B0047D985C320E77B5B7411572226EF40F1BCDFD';
wwv_flow_imp.g_varchar2_table(37) := '72753B06724879D62EA19509A8E8E706DEF7D0BB1E1DF7B76F588DCFAFF2435BDA607C99FEE085AB79F91369B08BF1E0857E06B1A4A18EEDD31B9C18FA89BC6FDED88AB7413A1047ACA4BBAD2B769EAC47E4B5CA42C8DA271DE66739D9516ABBF8E428D0';
wwv_flow_imp.g_varchar2_table(38) := 'D9DD503B0F9A385F1C5B80EDE59108FC4FC767CE73289100FA32FEEBC7BA80B0534FE373872FAE9B0BF57809A5553231E5B402A2EA7201648F85215C2A27C9A780024A7AF469A7478D2F8D2D9C6FAC32566E28A7ADCB17C1F99E6BF07697BB55C80AF7AD';
wwv_flow_imp.g_varchar2_table(39) := 'B37DF0E5D561587DDD62201F5636D4D694E4964872A53691628729323EDFC62C1A6FE89202F2E62C3F10752D7AF2E7559AEA6BF240CDACD72E6B8608DEE43EB7FF1325AB105E3161F7BE8FD9EAB366D9C23CDFE686857506373D26F750D73CDD663CF775';
wwv_flow_imp.g_varchar2_table(40) := '734678282236907E93C24361ED1ADBD2467D2884AAA2E809E30B5CD515F95F7A37B3AE280B01FDC621AD42EF7F76CDC135454E856FF676573F7CD93F0437AE5C6E79DF651E39B7AA821DD297CD5825D01B73D6F8448556203128BE9342F588F25CB3AC09';
wwv_flow_imp.g_varchar2_table(41) := '2A2A22F0DC07A71DA81122156B335A7D9EDDF709545554C0EAA50B3246FC21199BC0D7EC4F9C147D7B0189609460B2CA421AAC5F791DD03F14DCF7D9402A17D2FBF7CE5D830BBD03B0BE65397BBB9E06C8CB5B819224EC46C450C4061C2E6122185A3A6D';
wwv_flow_imp.g_varchar2_table(42) := '2555695BDCC03E9BF9E55B1D30341997E64E637EF9E671A8AEAA8496E60687F1054A92B01BA3AA9F0E000008F249444154614387B8C041408EC34BD7801E7155E3877B570686E1EF5F3BC90944C3762AB833BDE8D2F5C4AB27A17F78142F5FE590A08FA1';
wwv_flow_imp.g_varchar2_table(43) := '4DFD33A96A7F090B46262459E44F782EC078340EBF3FF627E81F18022D1486C39DDDF0FC91EE5C33EEF1B3872EC2D1AE6E369630088B30B9038AD12172F550C0ABA002729E5A5E4432D9B0B71D1C9F82B70E9F8281A161289B5B07954BDB2054560EFFF1';
wwv_flow_imp.g_varchar2_table(44) := 'CE71E8B83C924380B0A8649AE9FB41FFF97E078E89B0B184415884393C617C1695B12E624D2B8C6F43400572963D1532019A093AA1986DB37DF40C8DC1EF0F7D0463E31310A95F08E50B96B255A4BC71193E7507F8F1CB07E0AB91CCF785743DFB69FCA5';
wwv_flow_imp.g_varchar2_table(45) := 'E12978F23707D05687F2A6E5C658C4202CC27CEBD029E853F8B5D96CF6C13C3204E4342781E2CE17881DCD2FFA06817ED2371A8B41050A2652DB98360F5554018980FD2ED00BFBE0E9FFFF1C9E3FDC0DE35393303A39C9EAD4F6F0F3FBD9C3D8487D3384';
wwv_flow_imp.g_varchar2_table(46) := 'CAABD2E3098B30A7A251F673C1E42BDD39CD2B86800213A42EC9C4CA3EBFED74772F7C70E234E85A082A17AD84F09CFCC71D2482485D230C8C4CC04B1F9C8267DE3D0EA3135118C342756A1B1CC395ABAE09C8369728611236F9205F9F5EEACD359996C7';
wwv_flow_imp.g_varchar2_table(47) := 'FE09287F1E051228BBBA58D967DA88C211BCD93DF6E939D0CA225081E20955F07FA12352B710AA96AF6122AB6C5E015A38CC0AD5491CD4174101F102216CF2A1852370F4F43920DFC481673F1DDAFD1350661E1DF32461EA8895FAB7C193B138ECFFA80B';
wwv_flow_imp.g_varchar2_table(48) := 'CE9CEF06BA44552E5A05A188F128C10E84DE959110429573D08CD21302AA531BF561A3ED8B7C542E465F788923DF7F38D5059376BF8B678BE65FA7AA9C5386FC632988ACF22C7DF3C009F8EFF70EC22BFB8FC0A59E3EE39D56F34A5C49CA04D998CD8819';
wwv_flow_imp.g_varchar2_table(49) := '15739B735D0B97E12AB602CAE6D441F7953E7865DF61C689B84140FEE4A342E216AA0B8480909AE757182F4D615C3558A9AA81B29AF940971E7AA7059A45E4021EC3D5F3808A8069BE09DE6F95372E858AE6EB1997307262DC1847FE65341F28402D16AA';
wwv_flow_imp.g_varchar2_table(50) := '732F204D1F3387E66E8ACC08DEEA61FC4CA702EF5B5859781D94372C66971E37A8A95808838A1B8CD49870E55CC6A50239316EC8318C2B53AA3F087B5D8F8FBBE5E15A40610819024AAA32B973CB833FCE37E062B92C4240FC50594F7A2EF12875F26055';
wwv_flow_imp.g_varchar2_table(51) := 'E81512B2B230D275DD50ADAC473396482EFDC637F32948DD4B40220445929A8D939E4B6C16196D8EC0BD80B484B102A1D3F44BC4BBD9C6CC240DA2B0E237BE42AA7C2873C2F856991EF9A075ABB9CC00E6D5CC8C3C0828790933C38B7017B1316306AD6E';
wwv_flow_imp.g_varchar2_table(52) := 'CE5E41B8F99F30FCF0337F31108CCDB5801289E4252CCF51C1339CC7C073831D80C57C5A34D92104AE8F3F97CE545D0BA8528B70545BEAE9744E5AAE45A99F32FCB9CC8D34FFD8B5801253FDFD98B8F44F7E59CB062DF27DFADB520497FE06E42F3AA66B';
wwv_flow_imp.g_varchar2_table(53) := '82E6D2AD17D7023AF6A39BA3289A4329C748245535EDD1C27454906A115C16242E0B272A42458C43349716F0424DAE059444DF9FDCCFEE8A9001EB93569A88A7399C159074BEA7DD80E209A80ECA0EE25990BE0F9A76A99DE601D1DCD11C7A09D3D30AB4';
wwv_flow_imp.g_varchar2_table(54) := '7FC78A090478CD0B81E935565D34786FA20E8C8344734773C8E9166A460C2B3B71FA68F96B2B84D9366F19C0D5C11B80C0681573C7119038FDE33B5A0F22D7F4BB31ACFBF2C26015E38AC7A8D87150E00E25E7CE131F8E80E43035D07C5F85D44FB72617';
wwv_flow_imp.g_varchar2_table(55) := '245ACB8FC041457889F0D414CD991201D55EB8F85BD0A0BB08B91277A940813C084D9C45412C793C4DCE2FB13933351855F948940868FF53DF8A4102FEC62011D0AD7C6E8403C99BB0BC0661A88218260076B139CBF3264F5C898088C7899DADF86E4C7B';
wwv_flow_imp.g_varchar2_table(56) := '9AEA2555E473E61C9E8F627576EE64A13DFDD18ED6379CAC44FB9509881C86A7069E04D08F503DABF83149590E3C1C0463B23D04203574BF31475263D0989F24EF0232611BCF54E20FA1C7EC1FDD31D960DFECAB3819B8128B85BF67CC119F80F554F157';
wwv_flow_imp.g_varchar2_table(57) := '00EF02CAC13EB163CD793D04770368E721F59763936A9EDDF333A0F1BBDCF45CD01289FB3E7E74E595ACC1164E9CA72A7B9077016531320E4E6E6BED280F456F064D7B8FB564FB644D3361231BB6D9DE7922C5328898FF571E8A6DEE786475FE8F20C93A';
wwv_flow_imp.g_varchar2_table(58) := '4130BC45C972EC8B80C8C3E16D6BFA5BAB57DDAF83B69B8EED8A052F3B73A34F377641DECA5294B5778A5DD7E1572D735AEEA5B970B215EAB720E89B8088D02B0F69F1933B5A7669A0EFC2E3292C962FC68BA9C8B2DBBA51D6DE1AC5652B63EC726C4186';
wwv_flow_imp.g_varchar2_table(59) := '8DEBBAF6BD933B5B9FA039F0D3A3AF024A11EFD8D1B65B0F25566A1AFC0CE7FD62AA3DD07B5B8D60144AC8DB3A91F7607C98FB14E6BAF5E4CE9697ED0058046C6367E5DC571001118D93DB565FEAD8DEFA735C5257E821EDAF90FBDBD88E19C4175602F7';
wwv_flow_imp.g_varchar2_table(60) := '4282FE73F2EE0439C611E50DD0F4EFB656B75C7F6247EB3F7F84B9C676DB17CB3ADBD89A3976164C402926B4A49EDCD6F2BB8E1DADF787A742F5B82A6DC11BB3C7B1BC848938051AC452B681DF2B9800A91831372C473AFC178EFB3B4D87BBC613F17ACC';
wwv_flow_imp.g_varchar2_table(61) := 'E58327B6B7FD2FE516DBA190B40A2E200A30558EFD68D560C7F6B60F4EEC687B1ACB764CC48613DB5B2398947911285B14D6A005DF7EB683AEDD06A0DF8B1FC13F18A8A281201F5DD0CEC0A35829668A9D7240B9A09C506E588E76B66EC395E6D71D3B5B';
wwv_flow_imp.g_varchar2_table(62) := 'FF70E6911B8653F92CC6BEA802E2054C4939B263C557C7B6B79EEBF8E1EA932776B67C88027B973E822FCDD2F6860C6F8A9562A6B7DE9403CA05E5249D2F5C86D275DB8A98A19895B5A3400A288B6A21D7E32CC7013E10CE8998A19895753E8A262059D5';
wwv_flow_imp.g_varchar2_table(63) := 'CBDA5B87EBB2D5A57397C332243D0364A094D792DC8A24200D64552F6BAF34612E9DBB1C96A1EE192003A5BC96E4E65D404925CA114C7A971B346BAD32038AB0BC0BA864B5A0E127068AB2388361BC0BA86493A74B5F464B36D424712DB957B99B1102F2';
wwv_flow_imp.g_varchar2_table(64) := '2371C2935054E7D92CFDB85894AE802426C68FC4654F8DCD51519DDBF052D4552202B2504BB126C6828AFBB9500AE69E8687912522A062A9C522B34AA92805B320EB7F93BD80FC3E41FCC6F73F7F01F7E04782B343B6179097134484BB17FCEC380A7224';
wwv_flow_imp.g_varchar2_table(65) := '12927B227EA0FB9F607B01B9CF063E50F63258ED585553E3EF74F88BAE36A319B43F030000FFFF0B6153D500000006494441540300BBF5799A2139AB2B0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(35177213279852507)
,p_file_name=>'icons/app-icon-144-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_192_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000C0000000C0080600000052DC6C0700001000494441547801EC5D5990DCC679FE67666767EFE592DC5D927BEFF2A62C8994645B1225279169A5F2E097D8D6435CA9A42A55492595C4CE4B527692A7C4A924';
wwv_flow_imp.g_varchar2_table(2) := '15D97E88AB5C95A3124BCE61A7ACA8741F955894AD8314C543A22891E27D6A0F92BBDCE51EB333EE1F18008D1960D00D348006A6B7168346F7DFFFF1F5FF018D6330D9BBFFF564592D0A8346CD812C34E25FB9118356313B21D09804C83841A1EA1A1181';
wwv_flow_imp.g_varchar2_table(3) := 'C62440238EB48AD91101450047585465A320E08F0002E6D0F1CF42421C6201F8B879976ADCDC82165C4F63E88F00B4069FCE8598233E3D12D84D003E6EDEA409B7106172834FABA731F447004D8DFA50080443804EC4609AFCF75604F08F5DB09E328C3E';
wwv_flow_imp.g_varchar2_table(4) := '7304B4B374D9AE20AE3DBADD0BBE2D45003EBCC449272A5B6867E9B21D0E776AD8E564DA5204A88C86FBB05604D2B412184BD2710B4480A4074FE74112F75EB4FF7195938E5B2002243DF8B89246D98D13017BD60622409C6128DB0A017F08D8E72D8A00';
wwv_flow_imp.g_varchar2_table(5) := 'FE5054BD3810B0A71C47C7084415012200B9D14DD8271DF1A2516D5D11A01A91C46FC7976ED69E3E3E1F78872F380192132B2F3662E423C7C74A433101B06BB1428DCF07CB5BCB1BABAEB6940DEC6A600576A704ABB32B8F632B7501C501A21F9B6CC067';
wwv_flow_imp.g_varchar2_table(6) := 'D978E2C7017F7D64F3C75714A908C257E489EB147C0A94B8902370986DE7138123CA841702D11320B6BDA3171431B62B4C6203DF8500218E88DA3BD60EB6C2A41693886A5C08A0462422FC753395FD4D2A50AFC4A20726FFA70B01E4773C551E56323FDC';
wwv_flow_imp.g_varchar2_table(7) := 'DC0957BB391E9558CC6DC90B8A00920F9038F764CECC88C8E900662D01E2F3C5C13D49AA928E892430BABB111F396B09109F2FEEF8C4DD5283896244DC4322CA7E2D0144694EB59E1A4654A215470C370B1543DE2B71AE78DB4AB0842280D0C1634B5B16';
wwv_flow_imp.g_varchar2_table(8) := 'A9C0F9CB624468ECC954A60810C3B8054EEE187C4EAB494500DE9155D9CB8B58ACF25EC61501BC10AA6E57538B6A4412BDAD0820F3F0C57CB46904AE4B40809847596602D46460B458456BCDFF40D4C05457953D2A0908C0E77EDDD80234CAE1855700E1';
wwv_flow_imp.g_varchar2_table(9) := '7B19BE05AF18F9DBED29EDD49F96B047A813806E77EADF00750D098143D00E558CA3EFBF27A3810062F6A4A715E904706FA765232E07055484BB32F820220E171D6EE3EE2B6C37652EB625A9D609403BE32B785A81A8B20C80CAE083283C39F43450D8B5';
wwv_flow_imp.g_varchar2_table(10) := '0468A0E039524289A614815A02A43450159642C0090145002754E2AC93660AEA0E429A2609C9250047A2246AC04438EB9EBB425A38A017622F4C25C9250047A2843660A1290E73C8956E1A81F008D008C9C141421A7455960781F008A09223A6516E843D';
wwv_flow_imp.g_varchar2_table(11) := '8F3868C32380381F1935A981D7814AEF9E278CC852448030E0D1534A7D868D00DBCE8B458AD7D314118037F460F241E9562EAEC0D2D533DA82E560DEB8F70EEAA7BB66912DF1794911200C7E8904C9872EB790DCEA394C0451515E5986C52BA76175715E';
wwv_flow_imp.g_varchar2_table(12) := '5BB08C751CE6994583F8C96C24C1821401C26061CCF0BB85E4561FE2401A264B2B4BB078F56328AFAE98D6B0BC78F534609B59A90ACE08084E298A00CEF682D51AC31E4C4B1A7AE3B895966EC312D9F3975757B5903ADB5A0117DC28AF16B5B6D2F26DDC';
wwv_flow_imp.g_varchar2_table(13) := '548B1B020E29E550E5D6BBA69E8900410CD4586CC88A3294161760E9DA192897F4E4EF20C9BFEFBE5D800B9611166C5BBA7A164A4B0BB8A916460470E7C2285A23C6448020066A2C865621AF624C7E9CE2944B25CDC9CEF676F80249FEB67C13E082E5CE';
wwv_flow_imp.g_varchar2_table(14) := 'F636AD4D91408321B20F2602F07923802E0254F0F91C9E74999CF02E7D72DE34D0DDD10E8FDEBB534B7CA31249F0E8BDBBC874A8428272891C2DCE41B9B86C8848BA4EFE400520805BF099E0832540457027826BC03DFED2B5B3E6B4A7ADA505F6DDB313';
wwv_flow_imp.g_varchar2_table(15) := '5AF2B91AE558B7EFBE9DD05A28686DDA91E01A2141E5A8A1554AF791FC810A4080E4071F6E3E9561F9937350AAECC5F34D39D847F6FC98E86E76F148F0082148733EAF8994C81523D4A16DA88F501008408050FC498DD2E5A9CBDA357E0C289BCDC0AFDC';
wwv_flow_imp.g_varchar2_table(16) := '730774B634E366DD654D5B017E79F70EC865F5A1C17B052B3357EAF6518DFE11D051F6DF5FF57440A0383B0DC55BD7CD96BD776E87DECE5673DBABD0DBD5060FDEB9CD145BA9D267361805B5F68D8022000B746EA73B0E7DF13AFEF2CC55B365F7B67118';
wwv_flow_imp.g_varchar2_table(17) := '5EDF6D6EB316B0CFDD5BC74DF195E9CB505A5E34B755410C026209C0912862DC8F480BEBE94E99CCFB272F10A7742006FBD6C3AEC13EB2EDEFFF8EE13E18DAB05EEB5C367493B556A13E842020960019213E2556C9CAF5AB5022973D3180D696023CB08B';
wwv_flow_imp.g_varchar2_table(18) := 'ECC1036272FF8E71405DA8134F8A576E7C8245299780A1C612935802C4128297517D6FEC2515B4BDB4380F385737F43C7CD77668CE058717753C449F0FDC9C22778A6B1F979021F9A241DA4058CC3AF80889F123442DFCA9C1DB43BBDEAF4D7DF4303EB5';
wwv_flow_imp.g_varchar2_table(19) := '6584EBA457EFE5FED9474E8A774D0C5704C8346B8A4CB3AAA642D2245FC48E5440F1BD6A0002F063C33B862B3397011F66434B78A7F753231BB11860A9F5E0AEB14D603C2E81D3AC6532DD0A6020BCAEBC7B8FF03C61D2AC08C00493BB105EF529DEBA61';
wwv_flow_imp.g_varchar2_table(20) := '0ADCBF6B330407B5368B5027EA360C15676720C855A15A0B86E6E8D632F880B84617710A2DAD4C5B37A9260637C27A8EEBFDBC70E054686C537FA55B1956AE5FAB94F957B5C7187E1D69E81180000AC2D5855958AD3CBA8C8F3AECD93C147A4EECD9320C';
wwv_flow_imp.g_varchar2_table(21) := '680B0DADDE9E2327C4097974DA215D1CAA30AC48970004A81CC06488220864BEFDB7EF81F7901B5E85A6007032C6D09ACFC1DD5BC74CE9E5A43C26514917D3711F05012A6AAC061FB1BA5EF167575D7536F7056DF834589CBB0E785DDEF0E2ADF74FC213';
wwv_flow_imp.g_varchar2_table(22) := 'AFBC19C972E0F829C32C3902DC86D5F99BE6B667817F483C554625E0DF75BA275D0601E76B75A3CFD46D756AB4BBE72421415DB904426F48050C9AEB5C807F4808E0011D241AE2FDA783A6CB103601E20D5B98F5AAF1C7AB3EC6654F213632C1B4E023D7';
wwv_flow_imp.g_varchar2_table(23) := '5C47016E73011DE4B6175D87E053A0E87CF5B05495A51ED25CCD55E35F2477638DFEDFFACA5E38F4CD2FC6B27CEBCB0F1A6E003E816A6EA802330229224055963243C027B87AFB96F92597EEB616D8B7792D9F0281D2FBB6AC83351D2D9A46BC1A15E4BE';
wwv_flow_imp.g_varchar2_table(24) := '80A6A4013F5244806846AF38376D1A7AECFEED908B807735262A1EA0ED2FDD677D6F401D052AC070AC140138C0C22FA9AF2ECC693DB2992C3C76D780560EFBA3DEE4EED7EFDA04E80BFAB03A7FC3FCFE316EA7617123BFA8D814013890C4C70F0CF1CFDF';
wwv_flow_imp.g_varchar2_table(25) := '390A3DADB55F6E37DAA3586372F4B7E7E197EE18D1CCE177068A73335A392D1FF5C82F224645006614CB50247B5843FCB17B468D626C6B2339BE42F9B23A3F1B9B3F4934AC0850336A465AD91B4ACB4BE6139FBDDDEDB07B63875D80716B72BE08DF7EED';
wwv_flow_imp.g_varchar2_table(26) := '34FCFE8F0EC123DF7D455BB0FCEDFD6700DBBCD4E05EBF5AE6D3039DD0D3A1BF53081FCE137A89B6DA58CAB615016A06D429C500F0B91B43F4E11DFE9EF979EDEC4DF8D2F75F851FEC7F0FDEFCE8225CBFB5A02D58FEC16BC7B4369431EC38AD9DE909F0';
wwv_flow_imp.g_varchar2_table(27) := 'F08E4153DC384F312B5254101D4AB208E036FAA25171D04727D583E37D0E12F5AB7E78F80A7CEDC99FC2DCED2557416C4399FF3C627DA9DE55B8AAE1C109E329513B59ABC4D4661502B111C0793F5BE55DF5A6AF4ED54AF8B7F12D6DC60B6B73D92CDC3F';
wwv_flow_imp.g_varchar2_table(28) := 'C4F796878F6716E13B2FBC631ADE3ED80BBFB3EF5EF8ABC71ED2162C639D2180B2676F3811C57D0F70FF703718F094166F01547D63CCD0ADD67604622380FB50DA1D94618BDEFBDF373100852623D5BCBD5B2581FEE94FDE81E2AAFE62DC4F6F1D82AFEE';
wwv_flow_imp.g_varchar2_table(29) := 'DD09A3EBDA01C8A5545CB0FCD5BD3BE0D35BF569CC727115BEF1D421C0BE60FB73B7DB9ECFC29E894D9A347E45135FA8A56DA88FBA083011C01DF6BABA53D3585A9C3763D9BB75835966291CBD7A0B4E5FD56F9E75B616E08BBB475DBA6548DB18A00C0A';
wwv_flow_imp.g_varchar2_table(30) := '9CB83409C727F99EF5DFBBC5FA2A6669C9F219F5A9C519012602909D9873EF06A92DAD582FA4BA73533757D49766ADBE3B86C8B903EEF5DD3490B61D647A64345FBA69F535EAEAADEF1A586336E3552B7343155C116022806BEF481BE23356A6DEC836B1';
wwv_flow_imp.g_varchar2_table(31) := '567FF686D59BEBF3D62BCEBBDAF4373FD7EBDBD566E99F9E773A0F70EF3DDE63F52D53A475EF41B534E85E4E1180CA01A7223EFE807758B1AD7F4D27B4727EEB6B742D99EB6367B2CC3224F4CD056BAF3FD2A35FDB275DC13CC305F7BFAE420ED675B669';
wwv_flow_imp.g_varchar2_table(32) := '02257C4117CF89705AE7B90EC4A643958C000EDE6AC319D18783F912BDF7DF604D31583DDADAAB2724CA7F40E6F550D64F8671BB662995E0830B9366F5B65E8B3CE0E09B2948152636F4985BB4EF666544053AC92232E96CC6C1111A4A6E0238E87336EC';
wwv_flow_imp.g_varchar2_table(33) := 'AB365CED9E2E3998A79368A28F6FFE8FF6FADBF3F0D08E112CC21CD9BB3FFDEE59ADECF4F1D4BB67E0D6A23EEDD94BFAF4B6353989D5AD1BEFB57CA4CF5DEA760AA1914EB2C0EA852AB37BC34D80107DB17B26C95679454F4874677C7D27AEB8976F3EBA';
wwv_flow_imp.g_varchar2_table(34) := '135A2A3F7AF1F64717E089D78FC3D9697295068F06643943CA4FEC3F0E074F5ED474A3EC5F3CBA4B2BF37E4CF476995D68DFCD4AB782CC03EBB063720B83B79E9B00BC06922E8F37C18C18FA3ABC4F620D597ADD478E027FFCABBBCDAA131727E19F5E3E';
wwv_flow_imp.g_varchar2_table(35) := '087FFE5FFBB5E59F49192F7B1A025FFFB57BA0B79DDAFB1B0D0C6BDAC772E5DE0343376039C78014FEC94F80B8F74C645E6E8C7B7BB3BFA4C4FE8FDDB901BEF31B9F33AFF3635DF582F70050E6CB7790CBA5D58D8CDB1DE444D8102D978A46519A75883B';
wwv_flow_imp.g_varchar2_table(36) := '735F31CA4F8098112B93298A816C7B7330B81E1EED861FFFEE23F09B0F7F0A3EBB6510F02B95EBBADA4879087EEB7377C28F7FEF114019C39E9F755B9EFA8E4269D58F8A50FBC4BD3FAB0E2ED888566B4BE3369544ED7472F98C15A7365F7B680CBEF795';
wwv_flow_imp.g_varchar2_table(37) := '3DF07F5FFF02BCFC879F27E5DDF0477B47C0CF496FB51BF623807C04A8F637EEED40048879E72C1E3B87DD133E5763186A6FA6F6AE46A5B07505CDCACAAF5AFA0850A6C8EB575FDAFB05228043BE241B2F87E4A309D091AF0397435F5F600404B59DF671';
wwv_flow_imp.g_varchar2_table(38) := '35F947005F187274AA33A21C5A522C9AA1127BB5DE9DD580892B0A42DA5F60BD7B26CA7802F5A4830061261F9551F32B75EEE27A0C3EC5230FC960CDF3CB948F99740C6F3044EAF74E07421ED9E5D15C1F212A89160210204C8ED201CCAF50D31E8ABCB4';
wwv_flow_imp.g_varchar2_table(39) := '4CBD7220ACEA2996B42D1D04F0003748F265B21644F3CB5472A14D09B3853E0264B2FC27ED2C588516368B71C45DE0D4CE1A5D4D717A3EFC0F927D143259EBE6D702BD7745A8ECA25813FB32BF6CDDFCCAE42CDF453A165AD8CC83C62CE819B6C404F0F4';
wwv_flow_imp.g_varchar2_table(40) := 'BDAE80FF41AA02974AA2E9F995BA36853756B9C2A27F7AC1F2B11E017CA8F67D4EEDCB164BB00264524B0001D8E82AA83BC1176FF07D45515710E0D3078B2F503ED29770ABBDF0A11AFC3E2FE4CB1644F3A7085007E7E5E9CB806F8336442E5C9F378AD2';
wwv_flow_imp.g_varchar2_table(41) := 'AE2FCE583EE2BB8C3006699D95C03145009741589EBA08D5EFD9BC387DCB453ACC6ABEFDE7C519FDE5BD8647188322818146ED5A11A01613589EBE04F82B30D54D17A667ABAB7C6F4F2E14E1B79F3CA02D587657C437833E3F55EBA322813BBA8A0055D8';
wwv_flow_imp.g_varchar2_table(42) := '68C93F77DDAC1D357F9717E0D20CC78FD1991A9C0B2F7F340947CE5ED1162CDBA4026C5CBB5AC1BC4100000DB749444154611D0168DF15099C415504A070D1A73D56F28F91E47F70E718F4ADB5BE0BFCE1D46DAA87FFE202754F812EFBD708B6F708F5AF';
wwv_flow_imp.g_varchar2_table(43) := 'EB01F41D6330746A2420533B635BAD0114012A59A025FFAD1B952D8089C18DF00049FE0CA9E9EBE9269FFAFFA14B968C5E13CE27DAE5D57CE8A27584EAEBE9D22EDA600C188BA10BA77618ABB1DDE86B6104F0336062C1E73B59A46D6342606218755B86';
wwv_flow_imp.g_varchar2_table(44) := '07E0B3DB47B404C2BADE351DB8D2968367A7B475E00F0FC0FC4473F0EC27A65B7D6BF4EF2FA3198C4591C084C6561046003F0366F324F046C64C581E557885844EFEEDA383F099AD43365D7D5DD6EB49DE3E759947BDBBAC60C0F041D5774EEBBE6588D5';
wwv_flow_imp.g_varchar2_table(45) := 'DE4ECB67DC461220B14993F68F3163ECDA46037F0823800C18F2E6547176CA76A973D7C430DCBB597F412D1D4F3E97859E2E7D8F3ABFB804A766AC9757D1727ECA989C7EFA55F7F968E636CC2FAE68D56BD7744153CEAE19B790D848704D887CE0394171';
wwv_flow_imp.g_varchar2_table(46) := '567F6F29D994E23F6A275245001EF0B49B4433D67BF831F9778FE96F5776D233D0BBD6AC7EFD8CB8A4E125ADE94455E1F5D3964FB4AF55621AC1778C0D99D5CB33576C37FBCC860629342601CA25C079BF31C6E3E484B75EF2A3DC48BF4580E78F9EC32A';
wwv_flow_imp.g_varchar2_table(47) := 'A996A70F7D6CFA33BE619D59762ADC333100E3031BCC260D0B82895991EA827D97D39004582187FD72E5EB826BC8D4E60172C2EB35E63D6D05E8EED0E7D5272F4FC1C559EBA5B710F31F4EC92E4CE9578070AAD651C87B7AF4C08E51339EF26A11F45FC0';
wwv_flow_imp.g_varchar2_table(48) := 'B42787A792440AE064D0723C5202D84D5B4E445DA2E7BD776FB6A6035E7E8C6EEC33459E396E4D9FCCCA980A2F9DB8665A1EDDD86B96BD0A776D1E364556C8F910D84EFDA121FE2225800CFB17FCA923DCE3E1E8B6B61460706D17169996B10DD634E87F';
wwv_flow_imp.g_varchar2_table(49) := '0E7C0478E585A9638842F82B323F79E7A469618C9AAA99952E85A1F5DD801860336282BF3089E5465AFC11803993990501201AD85717AC6765C6A83D3A8B759C5AACEDD6AF064DCF2EC0ABA7ADBBC62CFDC39079E5D40CA02FA87B3DB961D7C6F1F63A3C';
wwv_flow_imp.g_varchar2_table(50) := '220FF7AFC7AEDAB23A6F618315D88EEB342FFE08C08C0CB36064189796AC471986FA8C3D3A3B51B70E593F43F4C3374F45E6B79BA17FFBF98766D3D621EBC4D6ACF4288CF45B27CCD5470076543C8C48DCEC8F001207E4E55A7955BF568E723D6DC62FAA';
wwv_flow_imp.g_varchar2_table(51) := 'B01375BCBF075A0ACDD81D0E9FBD021F4D8BBB27A029E5F838F6C902E08B76B14B5B4B0B8CF5F660916BE96E37300028172D6CB894C42A1C8CA6820810CC8928F1A307B9FA66118B1FD94C067690BBC586EC0FDE3E6314235FFFF080F55B033BC70680B8';
wwv_flow_imp.g_varchar2_table(52) := 'C6ED4353D6223F9E07702BF0EC10766E58FE7BBAE220208800C19C70F02BB4AAB28033D72D9BD643BE497FE3C2F3EF9E82F3315C12C5DF117EE9B03E052BE4F3B079A33597E7012F47B1269C5729CA9D1B8208C003B958D938E06DCE6561DBC880164889';
wwv_flow_imp.g_varchar2_table(53) := '10EAF1573FD0CABE3F7C74FC9B17DF335F0EB26D7400E83DB90F750DDB25F10408FB00EB96193B87374021AFDF707AEDF8393874E5969BA8F0FA372FCEC181539734BDCDC4879D83FD5A597DF023401120AE54E2775A861E7814B87BEBA8E9CADFBE7034';
wwv_flow_imp.g_varchar2_table(54) := 'B2FB028FBF78C4B4BB67DB3834E5E2380E9A2E24BA4011C00344C58F9A81DEBC711D18F705F0F188673E14F45D812A4BF4C83C757C124E5D9DD124F0B1870972554ADB501FBE10A008E0D19F1E050F51B766012A886A799888F17C66C704F149FF7FFCF9';
wwv_flow_imp.g_varchar2_table(55) := '437063B1EAF5897A53A04F23E2E9DB45F8EE8BEF9ABA3EBB73C2D7951F53812A44FB95486320C915E700D063DA05E82EB8EBBA8E16C0A749512DFEC8F55F3E7B0C8B02170BB56F3C7D04D0062AC76F78A16D2C277909C5770B324FF5EC47004F553C0272';
wwv_flow_imp.g_varchar2_table(56) := '25318FE74EB2ADCDFAC930B6BD7EE23CFC844C53B02C66D1B1FAEF63D7CC135FD4DBC2F0C427CA35E4A243C6147A4C0460F28D53C89DF61C7870D9C437F1FFECF85978FFF4795BBFBF7BE6005C9A13F7B8F4F99BCBF0F873076D36DEFFF83CFCECF81928';
wwv_flow_imp.g_varchar2_table(57) := 'B9876D93571BCE08A48800EE691E468E2CAF96E0D5774FC099CBD663D199CAEBC897568AF0273F3E08CBF8A8A633EECCB5B78B25F8FA8FDE86E5A27E6E61D84005672E5F83570F7F08CBC417DC6E9C45DC88269E00EE69EF371DBCC1BDB5B402CFBFF51E';
wwv_flow_imp.g_varchar2_table(58) := '5C9BB65E91D2D4B9165A06B742A6499F0EE155A16F3EFBBE5F27CC7E7FF6F43138734DBFEA83BAD106DA3204AE4D5F27BE1C03F4C9A84BFF5ADCA8B313C03B2F62C15DBC5BF5C19D9CBB0DCFBF7914E6168C374567A079ED46685EB70970EF5CE81D2657';
wwv_flow_imp.g_varchar2_table(59) := '66741DAF1E3B0DFF7240BF61E5079CEFBF751EF67F607CFD32039A6E7294415B681340B733B7A0FB347D2BBE07F320A17F5966BF75AC99C5BD059327716EF206BCFCF651585AD19F9ACC64B250E81F86A62EEB91E26CA115F26B3798C1FDE34BEFC01B17';
wwv_flow_imp.g_varchar2_table(60) := 'ECCFD99B8D750AAF9DBD09DF7FE5B029D1DCD30FA8DBA8409B681B7DC03AF4E9C5B78EC0B929EBA884F56AA98F003B01EAEB49752B1E658E9EBB0AFB8F9C20279DB805803F3E51D8380EB956FD0B3240FD3575AE835C9BFE4D3394FE837FFF7FF88F2357';
wwv_flow_imp.g_varchar2_table(61) := '60865CC7A7C41C8B78ADFFC9C357E06B4FFED46C475D4DDDB50FBBA16DF4017D41617C2E69FFE11370EC9CF51549AC97734164E2F74C4E02C8818D363A5A52BD7F1A8E9EB41E3DCE36B740CBA6CD806B4DC8E1A3B07ED03C1FC0E6BF2757863EFFF873B0';
wwv_flow_imp.g_varchar2_table(62) := 'E7AF9FD696EFBD7C08ABB505CB46FD3E22F30FCF1ED0EAF1234BCE295017969D16F4A165D384CD972327CF807E854822206B9CCFD4D4C451212701E4C00696C81598970E7D08E7AF58AF1CCCB575420BD9F31B7B5DD741CB6689DC04E40A6DAE225E0DB9';
wwv_flow_imp.g_varchar2_table(63) := '9676286C9C0020BAEAC9667279626B9C1C8D3A4C31BC4284BE37DE15221302A6829C049060C735BBB80CCF91F9FED4756B4E9D27D39042DF0840860DB64CAE8924F038349373029CAEE03678FCA10C920CFB14368C016E7B74D19B894F85FE51C853E723';
wwv_flow_imp.g_varchar2_table(64) := 'E83B5EAD9A23B1E842EAB31A01B691ACEE15F67646375059E91BD59F2192E493D90578E1AD6330BFB008E843269381E6750390EFB14E6EABDDA9B7DDD4B59E9C2C8F40EBD076681BBD03DAC8925FD36776C1B2518F324832EC630A7014F2DA15A901D203';
wwv_flow_imp.g_varchar2_table(65) := '3D07ED6AD5F32496C9B94552A7FEAB11C85657C8B45D37C7F5F165729743143EB838092F913DFF72E54A0F90E94773FF083475F630D99241087D2D109F33C477F4076379F1ADC370E2D2246EAA8542406A02507E062AD62512D17C7D7E114E5C9E82FFFD';
wwv_flow_imp.g_varchar2_table(66) := 'F91178E784F58AC16C533399C24C40AEC59A5B13F1BAFF3C64ABAB286063AEB583F83E6E3B113FF8C1C7F0F41B47E143122BC6EC6AC20B30D78EC96B680802B80DCB13AFBC09B83CFBC6613878FC14992E58AF4CC193D70239D9CDE60B6EDD1DEB65CA9D';
wwv_flow_imp.g_varchar2_table(67) := '6CBE859C1C4F40963A119F9D5F800324568C1963C7A5261059585CE398F88A86234026533F646DAFDF3BA4EF3DC949AC78C8758DB41F74596F15F78927D178D50A4FAABDEC78B58BF34A1E4DF5B3411E3F857992EB5853A32BDB4CEEDE92AB2785BE61ED';
wwv_flow_imp.g_varchar2_table(68) := '799E5C7B778D8CE88A2C99A2607266C875FE6C5B8740F5CEC7203CA96E19D84CAE12AD079C1EE1FD856AA34ED898DFBCAF16F6B92D5BB7862340F3BA4DE69518E3CA0BDE48C2AB27B9CADDDB280629DBDCA25D156A1DDC0638551167D37DFE9221E73479';
wwv_flow_imp.g_varchar2_table(69) := '7249162F97B610BB46FCC61AB1A9F1C35D5D8D68122BA22780F30E2A89D8299F538040F40448F91E25484E241D1A5EFF79E58360EBD6377A02B879A2EAD9A7DB0E47511992C9C1ADBAA3CA2B5F5799CFC608091051B81199F1C63B44471CB23D446BDEA1';
wwv_flow_imp.g_varchar2_table(70) := '2658224202388C5A18C04564C6DB75164754DA7AE318AE448404083790646A67214932234B8AD78A00491929E5273B021C07564104E0B0C81E86924C2B0261A70BC781551001382CD2831A3610B42D99CB8D8683CF740963080511C0A76B1201E13302B6';
wwv_flow_imp.g_varchar2_table(71) := '6E5E520A072F84426B8F9700A185A5142B042A08781C5D15012A3831AF3C0065D69314C1A4C7EB71745504E04D440F4079D5C925EF90EDA98E17401140AE0C8CD99B4CCCF6A337AF08103DE60D6551F6601501421CA1A4EF4F93EE3FCBD07213A0114061';
wwv_flow_imp.g_varchar2_table(72) := '018E45C66146CDD24DA84C90F192C17F163082C4C84D80A480C2025C23C834C2780589919B00CC4913C42B66234A5021100C81F00810E4B8142C26D53B5404D2B5670B8F0010EA28245A79B2F70DC9F6BE3A711401AA1189603B5DFBD008000BD1842240';
wwv_flow_imp.g_varchar2_table(73) := '88E0A655759A8E018A0069CDD210E31275049381488A0021260AB36A511955633034C53596FC54C8E05DB2082003622C23CD2B13DAAE3034C5BC114A2B9F2C02A8F194369192EA58B20890549495DFD222203101923EDF09E27F90BE6CB9D6B807533BB6';
wwv_flow_imp.g_varchar2_table(74) := '121320E621B2E3C4965536A920FE07E9CBE6389B942DA0946CD8B195980031E36DC729666778CCC7EB388FA732C82A02D0A3D0B8BB451A05B9CBBC63E4219F180244B25F8BC488DCF925BD77BC63E4219F18027810D91A376641AB8B2A352E02F2104054';
wwv_flow_imp.g_varchar2_table(75) := 'E27A30BE71873AECC8450D60D87EDAF5CB4300E9133799036C1FEE30B7A41F40C7E00512C0517F789591E7633207D81A80C801B34C4B5C4A2E0122CA4716332C3291E440DD1C97C6CB48A06035925C02B0461850AE6E4E5574B3C85444BD57419405C9F1';
wwv_flow_imp.g_varchar2_table(76) := '2076BDA39256422C01D204625CB10449E220691697DD203E0BE82B96006902314DB1084894B4AA104B80B4A2E415976A4F2C02D21140ED78597329AE391AAB7FC9908B8D006E891ECFB0C66335588AB821184C2BDD3B7C0BB4B578CA4C04080308B9524E';
wwv_flow_imp.g_varchar2_table(77) := '70847205C796590E3E3B54B1E94A901413011A0188206356439F9A8A20DA23EA9B449F0540C34400017652AD228C1D4452F231E903FB0B000000FFFFC5AAFFAA00000006494441540300DFAC55C93D43B5A00000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(35177518078852509)
,p_file_name=>'icons/app-icon-192.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_256_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000001000000010008060000005C72A86600001000494441547801EC7D09781CC775E6EB19DC076F82B74810074F912069C9BA28CAB2257B0F5F49EC68BF782582B6A34D36BBC997783F27B6E52896627BADECB7';
wwv_flow_imp.g_varchar2_table(2) := 'DE4DEC75B21241CB76B2B1755A6B4B5CC92BD9BA4849244052A44800BCC5FB00491C243098E9D4EB993E66D03D7D4C75F5310FDFD47475D5AB57EFFDAFEAEFEA631A09A03F428010285B048800CA36F4131D9726165149CC112002887980DDB827336122';
wwv_flow_imp.g_varchar2_table(3) := '010642197D8800CA28D84E5C451270224732D147003D200240146294E270048F830F5119524400518994433BE370048F830F0EC315B8181140E02120030881E0102002080E7BCF3DD312D93374D4308780BA2102509188D036124B6462297E23CA472C89';
wwv_flow_imp.g_varchar2_table(4) := '00F8858934191188044B190D0E71DE472C8900421C77328D10F01B012200BF118EA37E1F97A471842B6C3E19ED114E0034768CF047345FE29294C6808BB8FB0C9670022871ECB8408E44C38A008D0117912902160F6E104E002E5C275142204608F098AE';
wwv_flow_imp.g_varchar2_table(5) := 'F97014E1867CC1227B440045C0A12A42801F023CA66B89D64800851A88000A11A1FD0908F03F764DE8820A442060C2411125001A9222C68BDA87C9B851AB689B8740F4C6654409808664DEB8A39D902010BD711951020849BCC90C4220420898991A3E02';
wwv_flow_imp.g_varchar2_table(6) := '88DE2ACA0C572A2304228140F80880FB2A8A18251223D1CC480A9D192A5CCBC247005CDD4365DC19059552128100856E22CA9C49511C0170367C22325442089401021E49D10A197104C0D9702B870ACB89770A11A1FD521188D398124700A5A2EEB1BDCE';
wwv_flow_imp.g_varchar2_table(7) := '3BCEC2D6FA3FFBAA3BBA0E4F59DE7578F60D9BFB17AC7AFC487347D7C1B6359BFB96AFFDE1FE55AB36F7AD5DBBA57F1DA5F061A0C486C508638531C3D8610C319618538CADC76194D74C1F5358EC6C5CA1641893500208162A3D6CEBB6F4B5ACEEEAFDAD';
wwv_flow_imp.g_varchar2_table(8) := 'D59BFBFEAAA3ABEF1996BA593AC192DCD008D700C607AA60FC544A928F25D2A94300995E5982BD994C725742821D19597E8752F8305062C36284B1C2982558EC3086184B8C29C61663CC12C61A63FE0C8E011C0BD76FEE5DEC6D82CA5AB360C7B76686AB';
wwv_flow_imp.g_varchar2_table(9) := '8C4F04600E850E952B1B4B16EEE8EAED58D3D5FB404757DFAF591A4ACBD02F81F4A424C1D799F24FB2D4C1D25C96E8531E0860AC31E69FC431806321294907716CB0F4CAEACDBD5F5BF3D881D56EA1703DBE25B73D78932FD68A1301147AE21A8A6236BA';
wwv_flow_imp.g_varchar2_table(10) := 'AE5BFED377ABD812F05F776CE9FBFE9AAEBE630052B70CD23700E07696EA59A28F10046421BD70EC04C7C60649921E9213891E4606873ABAFABFBB66CBC10FE398E2D84F565508E0E1440021F08441BAF6D1FE5636E9BF59355C8DCBF65F800C7FC02C5B';
wwv_flow_imp.g_varchar2_table(11) := 'C0AAB21FB693CDD0B718040A0F0C627AE5D84B3380FCC7B29C7909C7142384BFC631C6517FE0AA381140707E2CFFDEBB0DABBBFA36756CE97D359394FBD8A4FF0B66CD3C96267E223F1E27BA4425C210C031F5151C636BBAFA7FD3D1D5BB11C79EB0DE7D';
wwv_flow_imp.g_varchar2_table(12) := 'EA28D204B0FA87FD9FAEAAABDEC6E6F563204BB7F98411A92504F21090415E0F207555D655B3EB057D1F8510FFD999164902E8E8EABB831DF5DF9432F253CCC1152CD18710108E003BF0AC93247801C7228E49E10670E8305204804BAED55DBDFFC4FC7E';
wwv_flow_imp.g_varchar2_table(13) := '99817F13DBD28710081C81DC587CB9634BDF8F708C066E900B032243001D9BFB6F61CBFD5D1248F7B8F08F4409017108C8F03936467BF02131719D96D653240860CD96FE7B41925F66AE7A7C5883B5A44F041188E46D9B968C2CBFA18CD9801177D27DB8';
wwv_flow_imp.g_varchar2_table(14) := '09409625766EF5D7B22CFF903953C5127DCA0A0129AADE56E1986524F050D81D082D01E083176BB61C7C8201F81596E84308440E0146025FEBD8DCF7431CCBBC8DE7458DA124803B1E7CB9A26AA4FA4976BBE5B7780347FA0801A10848706FD550F5CF70';
wwv_flow_imp.g_varchar2_table(15) := '4CF3EC97D7C9512809E0D2A2058F830CFF962760A4CB04015EA3C8443515191090E0139716CDEF3294B8CCBA3FDE3BED207404B0A6ABEFDB20CBFFCEA903FECBC57896F837AEFC0F4BD47A60770894B1EDC96EFFC660A808805DF0FB13E6EA973D61E45B';
wwv_flow_imp.g_varchar2_table(16) := '23AFB38479E29B4DA4388A08B011F1651CE361B2BD7402F03A3F0A50E8D8D27F2B2BFA6F2CC5E4C309184768B0A1E5488E844280C0DFAC7EEC60681E5B2F9D00388C3DE52A69F6565FE9F68420C2E24D104936E2BD8B598F492999E952C6BC4F8EB9511B';
wwv_flow_imp.g_varchar2_table(17) := '8A09573D5C8DBFD56F716338C9120291454086D6DC980FDC85C00960D5A3FD2BD922E24BA291A063A668C4CBB73FB3B18663FEFAAE83D7078D4AE0049048CA0F3310922C71FC30786DB4D94BD828A06A42C0210216632D99844CE04F0A064A00F8031F86';
wwv_flow_imp.g_varchar2_table(18) := '21BE938F6D787ECC3897A77E3F75590C173FBB24DD4121F049DE1704DD3AE23F01149B8B92FC885B83E32F5F0CB089DEBB939ED89E4A8245404A6470051C9811FE1380C501ADA3ABFF53CCEB5B58A24F090858C05B8246FF9A12599962BB616D57FFC74C';
wwv_flow_imp.g_varchar2_table(19) := '6B0414FA4F00964EC87F62594515B144408EA557A53B9501F9CF4BD7E24D432004B0E6D1430B99B9F88A6EB6A10F2150C6086459F1F6558FEF6F2E15052FED0321003999EE64C6D28A9081409F3247203B0BA4443A795F10488827005946973706E12CF5';
wwv_flow_imp.g_varchar2_table(20) := '191D047090F86F6DF6F0EB7F3F8E7AB817B273C391302F21E104B0764BFF0799F1780AC036F42104CC11103335C5D08CB987134A9B73736342859F05C209800516AFFEFBE95399EB660897390251753F03E0F96E80579F8320006B2769EC7A8DA3A15DA8';
wwv_flow_imp.g_varchar2_table(21) := '8E6A06BB4AC896CFB8B09E1B1A7C7CE32B9400D63CB67F2EF363154BE61FBEBE99F741A5D143A07CC6C58DEBFEFEE0E4E201E2CB86BE118059CCE444E26EE69C59152B2EDF8F5F80F8A5B77C23E5BBE752A64AFE57BEF762E8C0370230E32909123701FD';
wwv_flow_imp.g_varchar2_table(22) := '4D40C00CAB09424A8173491477278D2D288500813BDCDA508ABC6F046066940C72875939953945008FE9B25361928B2002A2E78838027850C6BEACCFFF2318AC604C461208A667EA550802D74376AE08E90C27A5908E3A16F6E1E4AF15D2996F9DD0D1D7';
wwv_flow_imp.g_varchar2_table(23) := '376849B18A40DDBA85BDEDEA0E6EFDA47C6104C09C88C1F93FF30223428910F011810C24F34E95E5C2BE0CC3B0B0CAEDBE30020048E439E5D650922704CA0701B9F85C91F92191E0A7CA4E93BCC84E82EA098138232039744E0658EA50B464313E04E0C0';
wwv_flow_imp.g_varchar2_table(24) := '33E6D4EC92ADF5598103377CB680D4C719013607B2EE6999ECAEC9B7B083251F02B077087D0C3D013873035DA14408948080FD91C6D15C29C102AD291F02D0D459641E7C3001124CB7A8A562428010C847609AA85B8189FC7EFDD95BB2E09E7A90A1C21F';
wwv_flow_imp.g_varchar2_table(25) := 'EDA49510881D0295EBE6ECA811E1951002A84D54274538437D10027141205D35BD4A842F420820934CBB73260A27E351B051C408A23E7C41C06ECEF0EA540801544A15EE5600F6174978F9EF5D4F146CF4EE1DB50C1801D773C6A3BD42086034354EE7FF';
wwv_flow_imp.g_varchar2_table(26) := '1E0344CD7404CA897345CD1921045021A5DCAD00F498473417E1F383109B1E62D3B88F53517346080124DD9E027087D32785962352ECB18A6B6F5C95F9847BC4D53A81B8D89CE1E9BE25013831D2A92172A2D2DD4540278A2D279F93C69C647882548249';
wwv_flow_imp.g_varchar2_table(27) := '5EA1903369C05442D7D4D403024EE2352E2584AC9A2D09C08991CE7D1F732EEA54322493CFA9B98572419B9F1EBE0CD7DE3FA0A4F4C89542F3683F60049263E960092060FF63DF3D5F827507174EFEB1F3EFB3A37F464963E78E837F24E0DCD3A049D11D';
wwv_flow_imp.g_varchar2_table(28) := '8A5192B646D672051025F7C856E708E0E41F65135E96F58989798504D8AAC0B9A642495D5F7E8DF5E0CB9703B0D25028E769DF57E500CEBD8492FEBC35B6763E0204606DBC3730CAB7D5F8D000E0E4571168ACAB054CB88F248075E9A14BB8EB3C69E109';
wwv_flow_imp.g_varchar2_table(29) := 'F714F07B866A3038472E1492112080900FAC5084D1DE88F1C101183B7F42136C6093FFAE1B56C05D1F58A19100568EB253837137245006E189B38B1120001C96944A41607CF0228C5DD0277F637D1DDC7DE34AA8ABAC80BAAA0A85042635D4695D8C2924';
wwv_flow_imp.g_varchar2_table(30) := '30A0ED87292305604C548FEE4EA022027082528465D25707D9E43FA97930B9A11E3ECA8EFA7586A7B3151258B702F249E024605BAD61412688898826C47932A27FC5921F75A12080A006931F8086496766EC2A8C9D3DAE998493FF6E36F96B2A27DE61AA';
wwv_flow_imp.g_varchar2_table(31) := '656577311240996C0359699B19BB96DD2DF8A6895800088FDD00400D050158FB6D5DC303EF38EB90C753307AE628C8724671B3AEB6063EB26E39545758871C4900656A6BAA9536D876F4CC1190D3E3CABED72F227887C8050094F5687068B3BF620120E2';
wwv_flow_imp.g_varchar2_table(32) := 'AF4362B4B3496F9CB8956CB9FFE1B5CB0127B89D012883B215C9EC2A01273FEA02A6D3AEAD553DD1B81532C197879C008207287A16C8307AF6186452A38AE912BBFFB5A163394CAE75FE34F694BA6A58DFB194B594141D781A80B708951DFA0A0401BF3A';
wwv_flow_imp.g_varchar2_table(33) := '2502F00BD980F4A62E9E6617EF86B4DE6F5CD106B3A7D46BFB4E33F3A636C20796B768E2E99141480D9CD6F629130F048800E21147C58BF4D521485DB9A0E4F1AB65C15C689B330DB39ED292B933A079EE2CAD6DEAF279C85C1BD6F6BD64B26B0A2F2DA9';
wwv_flow_imp.g_varchar2_table(34) := '8D1F081001F881AA1B9D9C4E90F15C1DEFDF67BB96955B7A37B62DC8EE167CBB9984372D5D94FFA0103E469CC95E582C50EB689793BB8EFA22217B048800EC31F257C2CD6C2C62094E7E240114492692B061F5524826CC95BB9984A8E376455776A8C8E9';
wwv_flow_imp.g_varchar2_table(35) := '14A40C0F15617F94FC45C04FEDD9A8FAD903E9E68780C5CCC527FD70F9AF76B46E598BAB8B7E6A3BABEDD4FA6A58BB7471AE5A82F1E1CB901E76F99B815C6BDA840B01228070C5A3B835260774797C0CF0C29FDA705ED30C689FC3FF7FB0E0F580F94CB7';
wwv_flow_imp.g_varchar2_table(36) := 'DACFD88553208FA7D45DDA461401228088064E351B6FCFE1033BB88FF7FB6F59DE8C595FD2CD4C37F681CAF14D4278DA81F9A827135E2D70C962E9552015C55D228028462D67739A2DC533A357737B006B962C86EA8AEC033C5A21C70CEAEE686F06F587';
wwv_flow_imp.g_varchar2_table(37) := 'FB697647A0D8EF053876EDAB2AFBE96D4F117E19E8B7DE1810807DF8FC063110FDB20CA981335AD7532735B25B7EFC97FE5A07B94C3BBB3538B9517FAEC078FA911529D378649D8FDC770C0820BEEC5C6C34E185BF0C3BFF57656E5ED1022290C03E6E5A';
wwv_flow_imp.g_varchar2_table(38) := 'D1AA76AB3C7198FFFE0094D0AA291372046240002147D80FF3E40CA42E9DD534E3033FD3EA6BB47DBF33331B6B61F1BCD95A37A94B6C25C256245A4190195A80B8429F08C0155CE110C627F2F0229C6ACDC0954178A9E780D0343038AC76AFDC0DC01589';
wwv_flow_imp.g_varchar2_table(39) := '56106426460B1011301201884099631F38F1C7AF9CCFD378F1F2209C3E3F203421E9188D5056246C65622CE391A7F9CC03456B1D4400D6D884B266FCF279904B7814D72FA714621ABCC85D3DADE8B9439AA79008200F8EF0EFE09B7D552B6F5BB610FEF0';
wwv_flow_imp.g_varchar2_table(40) := 'AEB581A6DB965EA79A03E357F81380A6DC5386E8C30E3622801C4251586AE2D576F5797FB4F7818FAE802FDC383FD0F4D58FADD0EE3EE05D89703D178028E5025C64E34CAA88021FAA44A92C2B022816E8281C2B8CE7FE1B562E82A6FA0A51E3C4B29F59';
wwv_flow_imp.g_varchar2_table(41) := 'F595B07EF942AD3E7CAB00CD34CB4C14626F697C8915654500510E343EF1876FE651E37DCFBA66F5813CB5C8DBB6182B3AD4F8BB1F68D6247105201B9E4FD02A28231E0107B12D2B02101F017E3D8E0FEA2FFA58306332DC38BF918F720EAC78F3824930';
wwv_flow_imp.g_varchar2_table(42) := '779A6ECFB8E1A5247C8C242D9E1070105B2200D7C83A40D5B5CEE20D942BEC43FACF6F7FEF3E5C144D0000100049444154E6A5C51B38A975707470A24695F9BD5B96A959C06B15DA0E655C23E0BE81F7601201B846DB3BD8AEBBCA35C85C1DCCE500EAAA';
wwv_flow_imp.g_varchar2_table(43) := '2AE1E3CB676AFB9E338CC70E5F1A054C9E75181A7E627913D45466AF492061A5AF0E196A29EB2F022C981E3B2002F0089CC866F8424EB5BF0D2B16426D9177FBAB7256DB9FEE3E03BFF3E86BB0EE5BCFC16F7F6FAB92D67DF339F8CC63AFC1CFF69CB16A';
wwv_flow_imp.g_varchar2_table(44) := '665B5E5F9980DB96E9B7043306D2B26D4C028121102F02F04E848105C049C769C3D1F4D656FD259D4EDAAA32D7C665F88B5FEC856F3FB71D0E9DB9087246074B96653878FA227CEBE7DB99CC3E184BEB756A7B27DBF56DFAEF03F062A0933624132C02F1';
wwv_flow_imp.g_varchar2_table(45) := '2200F1AB73DFA397191D619335ADF573CB7553B4BC9BCC17FF693B6CED3998DFC4649E6FEDE9872FFCE35BF9720EF76E59A8DB96498D81CC92C3A624964340F4265E04C019BD30F08971F9BFF2BA5930A526E9DACB1F6C3B0E7B8FE9BF1E5CB56836FCFE';
wwv_flow_imp.g_varchar2_table(46) := 'DD37C0C3F7AC87877F77BD925FB5505F59BC7BEC0CFCC35BFAFF1474DAE1F4DA0A58326F86264EAB000D8AD06688008A84C6E4005944DA9F2AE324BAAD7DAEEB4E0E9CBF0A8FFEFF1EADDD9D2B9BE1B31F6C87EBA6D501482CFC2C61FEB3372D01AC83DC';
wwv_flow_imp.g_varchar2_table(47) := 'DFFFFED52EE8BF782DB7E77CB3BE7D9E266CB45D2B3464C240B006737CCC86612499BBC74680790595068F003EF66B7CF8E79666F76FFCF93F3B8F41869DE3A3372DB3A6C29D2B16004826538F95615DCBACEC323E9DC9C03F77BB5F05DCB2D8B802287E';
wwv_flow_imp.g_varchar2_table(48) := '2720BCD30238FF99E0CDB907AFEA8800BC2227A09D71F227D8917AC54C76D476D96FFF9901ADC59A16767466135D2B28CCB03A4526577EF0B4FEEC41AEC876B3B2A90ED056553093FB1F85EA3E6DAD1108A226920460CDA7F13AA6C8297D09DE32679AE9';
wwv_flow_imp.g_varchar2_table(49) := '81DB6ED01C3CAD13C0AC49B576E2D0344927997E76B7C0B6418140454282854DD9550456C963BA0FB84F892302D613C17127C2098083CD459E81E7A1DD3176BE0B1A5700ADB9A5B9DB4E674DAED79AC84E5ED8619099D1A89381A6C441A67DCE544DCAE8';
wwv_flow_imp.g_varchar2_table(50) := '835648193E087038DE0927000E36F301CFA59620A8C538795A9A2603783062E93CFDBA41AF8325FD01C38A61E95CBD2DB8F86B99C96CCDC9670CAB985C116D42848070020891EFAE4C0982B864C3F973CB0C7624F76044FB6C7D39FEFA7B476178D4FABF';
wwv_flow_imp.g_varchar2_table(51) := 'F90C5F4BC11BFB8E69B82C9BA3B7D50A1D645A663668524612D30A239AF1C0BF8E3D0D4A90082028E46DFAC523A79CBB7A8FA22D78DB0E332ED3C797CD8286DA2AA5D5D5B171F8F16BFB60F8DA98B26FFCC2B21FBDB617AEA6C695E2C97535F0F1E5B394';
wwv_flow_imp.g_varchar2_table(52) := 'BCDB2FA3AD32FEFB30C369855B5D6192F7C0BF6132DFD41622005358822F54268EC18CF993B293D850E4283BA3AE02BEF6891B35D9E3E72EC1B79ED9064FBFDD0FDBFB4F2909F358F6FEF9CB9ADC373EFD414F0F1DA182D90D95B8D152869E08D4B0085B';
wwv_flow_imp.g_varchar2_table(53) := '8608206C1151ED61F7E1D56C4D65FE8452CB9D6EEF6E9D069F5BBFD2202EC38E8327E0B9777A958479305C5ADD74C72A58BF483F8F37347494AD4AE26219534E3CA33FCA9C2BA14D481008350118865048E01267866C58364FE6F04F3FFEF4F6C5F0F71B';
wwv_flow_imp.g_varchar2_table(54) := '3F04D30DB7F90ABD699ADCA0C8FCD1AD8B0AAB5CEFCF30F4231BC8CCB5A2326810A48BA12680389E73390EB661D234E6CEE11DB7B510BC615E233C75FF9DF09D7BD6C37FB86B0D7C64D562F858470BFC01CB3FC2CA9EBCFF0E40198BE6AE8A1B6AAA3479';
wwv_flow_imp.g_varchar2_table(55) := '7C3F80B613824C391F580AE10F3501141A5B4EFBC615C01476418E97EF8D5509F848CB54F8FD1B17C0773EBE12BEF96F56C01759FEC3ACACBE92DF7098625CB584EC14C0AF034B1489855FC4798D502F7AFC8AA8175B78B5314C1A5E2B004BD3388CDC42';
wwv_flow_imp.g_varchar2_table(56) := '158D215E0158E25062451487613C08A070F49518C8929B731809C6F3E6499C4E012CFDE2616F81F23C9B0DA733056265BF1B3400F12080A0512CEC9F3321495E1E012CB449F07E85722720DBA96CB8C3902DA1EFB0204004A04582C36150D3557A4692F4';
wwv_flow_imp.g_varchar2_table(57) := 'D08C8C4D7C70A7F41EFCD530742DFB4011F62249126E288510017D9485D038BE26D94DF0D2066969AD4D3C354C9AA1228FEF9AB40C45D1F035C323C706320B857164848640191100F729AA8188193B7A411937494AE8AFFE1A311C4DDDE87025CB199EA1';
wwv_flow_imp.g_varchar2_table(58) := '517DD52225C40F33CEEEB882D2A97018E4C447260C5E47C186A44E00436386A3A95FB6173058A91368C8F07B032959E197D5967A0BDCB1942BF70A2280908E0029A14F9AA1ABA3C2AD2C75021909000CBE087724AF43375EB991CDEB24523B44001EC355';
wwv_flow_imp.g_varchar2_table(59) := 'EA11D2AE5B29A9AF00CE5D1EB61337D4073F70F15F0E0C0C5DD56C92025801689DE765DC44CD8D6C5E27E1D971E0021180C770F93DCD8CFF60135FD0796AC8E9698083A87BF4D969B31383638036ABF2E397CFA959DAE61010B271304889008444C24D27';
wwv_flow_imp.g_varchar2_table(60) := '328C9E3D06E3C3FA4F73B1F5F14BD179B7DEB1025BD117F4C9F88B43F48952F0081001041F833C0BC6CEBD0FE9912B796538718E5ED297D405959E77DF38760530795660D1F0D8C0C8841AF4097D9B504105812240041028FCF99D8F9D3B9E77E4AF48AA';
wwv_flow_imp.g_varchar2_table(61) := 'D70124387EB1F83BF6F335D9EFBDD07701FEE847AF28E9C57EFDCDC1F62DED258E1A6CD57D00C537F4D15E433425823FF9728F1B11807BCC7C69814B645C2AABCA17CD9D056B9634ABBBF0DEC98B5A9E47A6E7B83EE9771CBFC043A5A663FF09DDD6B54B';
wwv_flow_imp.g_varchar2_table(62) := '1703FAA256A28F71250107A7DC0A0C61FA2202083A1A329EF31FCD5BF62F983D136E5DDE0C4D931B35EB761F39CD2EACF11B62799AF276B42E3D65C6D232EC3D7E466BDB34B941F1057D520B910446CF1E6567361C3B569547612BD26D9B65892702B0D1';
wwv_flow_imp.g_varchar2_table(63) := '19851084C3469CFCE78EB1C93FA8D98313E5F6152D80184FA9AF86CA8AA4924FA533B0EF3CFFEB005AC79C327BCF8E684485B64FA9AB56EC479FE63519FE6DD8C8208C32DF8161C0A9EBE8A8C1E08AB2D6866C3C11808D4E51AE45BB1F36F07102A4D944';
wwv_flow_imp.g_varchar2_table(64) := '501DC109821345FD19008E93A66953B5DFD2ED3A917F67406D17A66DCF49FDDF89CD9A3E55330D7DDA707D0BA08F6A21FA8E18448E046234013C11801A40DA7A4760945DF0C309A06A9833733A6C58D50A3851D432DC364D9D841B25ED3C765ED986F9AB';
wwv_flow_imp.g_varchar2_table(65) := 'FBA86EE3AC6993F34C4D30E7D047F455AD400C100B753F125B64668F8686AD1911400011495D3CC596FDFAADBE3933A6C31D6CF29B05A3698A7E1D60D711FDDC3A00B36DBB648B1AE83E7C4A936B325CC3500BD147F4D5B83A48B3DB9EA981D3AA4808B7';
wwv_flow_imp.g_varchar2_table(66) := '313AE417A08BF12828A25D3F11181F1C80D415FDAAFBACE95394C99F644747B37E6736D64255EEB5E0034323B0EFDC88995828CAF69C1DD6FEE9484D75154C6FA831B50B7DBD73753BA0EFAA40EAF279181FD24F1FD4F2706C6374C82F009408A000103F';
wwv_flow_imp.g_varchar2_table(67) := '77E5740A52174F6A5D34D6D5B1C9DF0EC944F101B6686E13A8125BDF0BEF91D268DBC2394D9A9F6619F4F9F655ED8018A8173952174E829CD65F2462D62EFA65E25613EA98298619114031744AAD2B88756AE02CBBDE952DC42BE477AE5D0A9549FB102C';
wwv_flow_imp.g_varchar2_table(68) := '6C9AA6CE11F8E5AEC3A55AE55BFB5FF61CD2742F9A354DCB5B65AA99EF77AC590A1515494504DF849CBA7456C9C7F12BEB9393699995F4F6ADEBCF8EB4E25AEC475FF1F6545B0C013D1620A746F396B82B5B1682F1CDB9C5D4344DAE87DAEA6A45E4C295';
wwv_flow_imp.g_varchar2_table(69) := '61D8796A48C987E9EB9D93437079387B9B1297FF331AEB1C9937B9B60A562CBE4E934D0F0D28586905C68C93116D942FCBBC3B908800040D92F1417C3A2E1B9CBA9A1A58367FA6E39E9147F034406D605C6AAB65416FB7BEA79FDAB4CC9FAD9DB238B16B';
wwv_flow_imp.g_varchar2_table(70) := 'D9822640D24059995D491C672480F909098198504805A5204004500A7A2EDAA6AFE9BFE96F5D301B121617FDAC542E342CA97FD9DD0F23A98C95A8F072B4E505C3F21F4F599C18A1CEE78A8404ADF3E7684DD257C3B7C2D18C8B598608404040F1C25666';
wwv_flow_imp.g_varchar2_table(71) := '4CFF39EFDC82FBE34E4C98D1500B5327656F090E5F1B8367F785E796E0D37BCF6857FFD1C669C6FF0A54C4B9EC7A282B3077FAE46C867D23566EFF9D98C4DA85F91356DB880004442693D2273F5ECD9BCE26B3976E5734CFD39A3DFEFA7E764151DB0D2C';
wwv_flow_imp.g_varchar2_table(72) := '9366B3F8C7CC16D580EB17CF57B3AEB6530B48433610A61345CC0C27622453800011400120BEEC1AFE334E755525B85CFD6B262D9C3105EA6AB3F7D6CF0C0CC2AF0EE9BFE8D38404675EEABF08672E657FCBD058570B0B66E8477237A654B23B02786744';
wwv_flow_imp.g_varchar2_table(73) := '6DE37605A0B6E3B32D1F3A2102E033628A6A310EE6DADC042EDAC0A212896345B37E84DDFCFA010B4971C55B0C362C67B695B214C78BA3AAE5C67F8DA69689DB96E2851B2B83271A220037F1F22ACBAE6CAB4D93EC82979AF7B26D9D3D1DAA2B2B95A6FB';
wwv_flow_imp.g_varchar2_table(74) := '8F9FF5E58D3E8A72075FBF3E72090E9CC8BEEFAFBAB2125A664F73D0CA5AC4F8F21090F95EE41435A5CDBCB32E0BDE2A2200EBE878AAF13BA448204B16E9D7021E79A107F02DBC85C6FA6D479A75FAC8F3DD5AB7CB9A17B8BEB3A135169009FE582BC049';
wwv_flow_imp.g_varchar2_table(75) := '0F5D449F00FC8CAC07DD1E9AB80EDBB2F94DDA2AE0E8B94BF0D4DE894FCFF96DC7CFF69C819317B3E7FE780F7FE9BC99AEFDA006FC10704BF8AA7CF40940F5841F96BA263F75EBBDB8CEE105B3D5ED8BB476DF7BB147E87301836319F8DE4B3D5AFF1D6D';
wwv_flow_imp.g_varchar2_table(76) := '8BA0221952B0342BE39D714BF8AA7C7102A0988676D4B4CD990E931AB28FDB5E1EB906DFFDCDC1ACAD0262F6DF5FE9D7EEFB4F69AC2FF9DC3F6BB8FAAD0E4D753FDADBB05B5F9C002816F6F10B08239CE7372C5DACD9F7C4B6F760C7C921C0E70CB4421F';
wwv_flow_imp.g_varchar2_table(77) := '32DBDF1F8467DEDEAF69FEE0B2ECEBCBB4829233E859C94A488143048A13005342E1602014FB0408D09C290D30DFF09EBDAF3EF596AFA702B8F4FFEA53DB353416CC6E829993B2AB10ADD0512620D674645B790925ECDCA550D921146C7DF31CFDE2DBD9';
wwv_flow_imp.g_varchar2_table(78) := 'CB43F0C8CBBDBE19F45F5FDA0F1707F517922C62B724BD7566C19A16C5DEFAA0564E10B02500274A482618048E5FB8026FECC97F18E8D9B77BE1CDE3FAEBC67859F6EA91CB803F4232EA7B734F2FA00DD9320E870A0E2AB2B684E33B0A56100144214A26';
wwv_flow_imp.g_varchar2_table(79) := '36BE7BFC2CFCBA7B1FA40D8F19AB625F79621B9C194EA9BB256F4F0EA6E06B4F6D9BA0673C9D566CD8CB6C01B0397CD3E48630FE110188888ACDDC7063023E1FF7FABEC3D073407FFB8E54510935B39B414A5628AAF0AEC01FFFF46D181D2F7DD65D1DCF';
wwv_flow_imp.g_varchar2_table(80) := 'C07FFAE7ED30787554D18D7DD4CC5E0C12EB5329605FDDCC9637F71F05B48DED9A7F24F3622A0D16813C02E01F23FE1A8385CB63EFA5CF43A5E3B174067ED57D000E9FD47F0A9CA8AC869A392D90A8A987EA26FDCD3ABD27CFC303CFEF55DA95F2F5E73F';
wwv_flow_imp.g_varchar2_table(81) := 'DF0387CFE0CB4C508BA4F491A8A9CBF6C9FAC6524C07DF3FA5D88636E23EA5682090309AC9699C1A54F2D768501E9AAC3DCDD94BD83933349A82E7DF7A17CE5CD07F0198AC6D5026221E95B17DA2BA0E2AA7E82FE37C69F721D8FCCE09AC3224E731F987';
wwv_flow_imp.g_varchar2_table(82) := 'EDC7E1D5F78E6A6D2BA7CC04EC030BB04F241EB401F731A16D5BDFDE0B682BEEBB4E7930E5EDB856C5B381174B8AF6EF3C0445D5F0A8CC23001E0AED4E05B9F4E18B12EF51B16F692F51CCA5738357E1F96DBB617058BF025FD13015AA672D0248E48710';
wwv_flow_imp.g_varchar2_table(83) := '09C03829FF6EEB0E786EBFFECF3AC0244066D63DBDEF1CFCE025FD597FD489BAC1F8C7FA461BD016B5F8F2D0B05263599A00000E1A4944415462EB85A1ECFB01D572F75B33ABDC6BE1D182BB25120FABF8E8C81F3D3C7472478B8751563A8CC6FA1915EF';
wwv_flow_imp.g_varchar2_table(84) := 'BA8F9EBF042FBEB51B4653FA45BDCAA9B3A06A86FE83A042EFAA662E8044459556FC974FBE019BFEF16DF8BB378EC0A36FBDAFA4BD27CE6BF59857CBFFF6F523B0F1276FC1434FBFA9D5272AAB00756A050519B4056D528BD1D6ADDB77C3D1F3A5FC2B33';
wwv_flow_imp.g_varchar2_table(85) := 'EF98A97694BA0DDE82523DB06FCF9F00ECFB0C9184A8101B89C699FBD862F7D1D3F06ACF7EC8187E4E5CCD2677E564FDDEBF9936299184AA590BB58B82C0FE7A0E9F82CD2FEF86EFBFB85349FB8EE93F20C2BC5ADEF5CA6ED87D44FFDF03B8D4AF6A62BA';
wwv_flow_imp.g_varchar2_table(86) := '984EA6C6F2833655CFD4AF41A0CDAFF6BC077B8EE9D72B2C1B9B562002A615C20A83B7C07F57634500A2A6B3DF615126CFDE43B0BBEF88D6154EEA9A398B21593F592B2B9649B00B7435735BD9397B6D31B1A27589EA5A5074305D45057395C9FA49EC9A';
wwv_flow_imp.g_varchar2_table(87) := 'C462405B7345B0ABF730E05D0BF4492DB3DCC664C659FA17C28A58114078C78F736A1A65B7DD5EDC79008E9DD28FD078CBAD9A4D7EF5029CD3718447EF1A768700EF0EE0113A59D7084976B70013D6A97A308F654A6232288B6DB02DD6A9724EB66823DA';
wwv_flow_imp.g_varchar2_table(88) := '8A36ABF278D7027DB2BD43900753DE8EAA8AB69C118801018477DAEBB17266E3E0B53176A57F379C1BD0FF475EA2AAC6D55158EF53CF25EB26019EA357B3A57CF5EC66C08465AA04E6B14C494C0665B14CAD77BB55561F8C78D076B52DFAF4FCF6778BDF';
wwv_flow_imp.g_varchar2_table(89) := '21C883296F4755435BD7081427D218104071075DE3155083131707E1F9ED7B6068447F83301EB16BD891DFB8A40EC83CD7DDE2CA016D4FD6366A6D07474600EF669C18C8BE4844AB5033F108A5EA4D48B6C58934060410129C8B9A613EB2AFA6D2709EDD';
wwv_flow_imp.g_varchar2_table(90) := 'E27B6DDF617879E75E18335CE9AF689C0678C46627D4453587BA524A4035BB1889BEA876E21D829777EC05F4F93CBB55788D61A0D6E50F55492D0E689B6F8D5323A2264704202462FA60BA70E90AFCF8A56D4A7AF2D76FC30BDB77C111C3937D684ED5D4';
wwv_flow_imp.g_varchar2_table(91) := 'D950357D2E666391D0173CAD303A833EBFB06D173CC13050F1B8C8B0D16574CCF43291B9A009488CAF4400027096120C6607E319CF9971D95C317986EF5649923EC02576A4F6BB43BCB088BEE1F501277D29983911249992106023B3A4F6D4B800017D5A';
wwv_flow_imp.g_varchar2_table(92) := 'E915899A06909249BDA02097A8AA6547FC39D98B7DD57505B5FEEC1A2FF2E1ED3B7F7AC9D78A77086AE6B541D5B43990601737F36BF53DC42A61B876A0D7508E3702B12700B309C91B44A33EB303BD94AC80DA054B017FB1674CB5F39740DDA2956CE2B7';
wwv_flow_imp.g_varchar2_table(93) := '4045E37410F99760B7036BAF5B069870628AECBB62D274E673ABE27BEDFCF689B82C580692CD834722ED75DA5714E58410405A4EA68302C76C4206628B2429BFD8C389A726C9F0935A08E00F2719A600BAD6BA942AAA26E0A255967146AA94C68CEEFB75';
wwv_flow_imp.g_varchar2_table(94) := '2013420015C6FF8D65F48AF2840021608A405A1ECF3B687A3F9015A70E210450E88CA9C75448080847C0FBB4F2DBD471B9328F00BCF757DC472104C0CF19EF30504B42602202C58F8E13E5AD4BB8D418E66A7565C538179D364A84108028676C7CA56A42';
wwv_flow_imp.g_varchar2_table(95) := '802F028609CB45B1818F5205A7005CF49B28114200E971F9AA49DF544408441B01C384E5ED48229DCCBB08C85BBFAA4F08018C35185E65A3F64C5B428010B04460AC5ECC9C114200FB3EB312D92CFB5A594B97A9A27C11E0BD96168BA40FBD8DEEFBAC32';
wwv_flow_imp.g_varchar2_table(96) := '677C509DAF520801E4BAD45F33932BA00D219045C0C7B574B683A87D0B9B2B4400511B1A61B6970EE4BCFE39ABFE2A289FE34D04E033C056EA6379CC8BA5535611B428E7800153119F15007346414A9241FF9FD24A49797FD1C1321EF1F7C98BF8AC00B4';
wwv_flow_imp.g_varchar2_table(97) := '812E493D3E81456A09819821206EAE083B0548405A2300C975B8341A71DD921A10025141409D17C6B9E2B7EDC20860C7D1F65EE68CF2FF23DD4F67151AA6813E84404C11C8CD8B91DC5C11E2A5300280072536F9E53EA03F42202608F8E4C61E50E60A08';
wwv_flow_imp.g_varchar2_table(98) := 'F9134700CC1D0924ED3480EDD2871020040A109004CF11A104C06E92BE52E06F747773EBB5E83A40968713818CD083A45002488F4BFF97811E8FA923314F02FDF80B63E0EE058A6D609DCB90C9FC5C64EF420960F717DBDE67CEED66893EB608D84D707F';
wwv_flow_imp.g_varchar2_table(99) := 'A7A85DEFB6E6C75CC027F776777F7EE9499F749BAA154A0068011BB62FE096921D020C293B11AA8F15022CE2C2E7867002604716E14EC66A94E49C61832597A34D781060A3BB0463584C9F29A1B9A7A6C209203976F97566E95196E8530202A50DB5123A';
wwv_flow_imp.g_varchar2_table(100) := 'A6A645106053B848AD4DD5B14947DF7FC746867BB57002D871FF0752CC8B2D2CD18710882402EE8D7644D75DAF3CF82121EF0134DA2F9C00B073299DEC625B47A83039FA10021147C0666520C1783291D81C8493811040F717161F6590FCBF201CA63E09';
wwv_flow_imp.g_varchar2_table(101) := '81E0112838F6C9F08B1DF7B51C0BC2AE4008001D65107C1BB794C2870023E7F019152B8B2620FCDDA0DC0B8C007A3ADB5E61306C0DCA71EA7722022C1E4A212367654B5F1311E05DC230DF8A7381B75EA7FA022300C5C04CE6CBCA56F8170D7133C80915';
wwv_flow_imp.g_varchar2_table(102) := '3354FC2963135F513C0E89FFA26402FA0A9400BA3FBF6417F3FB5996047F54F805774BDD110239047264FBEC9ECE963DB9A240368112007A9C484B5F020986301F99948B5E64EC2543C388C07052823F0BDA3085009C1F0F9D4B3A756CE7175AFB418607';
wwv_flow_imp.g_varchar2_table(103) := '9CCA87428E3F0CA1702B9446F844B65E42C8131F09E42FEDD8D87670824EC78639169CD085B140210047182BFD399234EA77946FAB6FFD5B90E4D71C0993507921A08C3BFE2EFB33921DDBF97A7767FB0F4CA51D1BE658D0B41BB550210075A7E8964F7F';
wwv_flow_imp.g_varchar2_table(104) := 'A65DFCECB3523A319EE88CDCA980A93754480814450097FEF71595285AC997119D134051A34AAFC45301B62CDAC8346558A20F21104704327242FAF7A64B7FC7DEF23D12878600D0FFEE8DED4F327EFB2AE6291102614280932D7FB6EBBED6A72D75B1C1';
wwv_flow_imp.g_varchar2_table(105) := '6F59E75345A808007DECEE6CFB363B15C0DF0AE02E254220260848FFA3A7B3ADF8137F7C0FEE8E700B1D01A0D5C9D1CBF7B3ED8B2C193E01A063E89DB22142206A4341969FEE39DAF2A721425033259404803F194E8ED57F4A02E929CD52B62CD0F3942B';
wwv_flow_imp.g_varchar2_table(106) := '6B04A44879FF6C32D5F03910F8AA6F28F657805D280900EDDF71FFDC91EE8D2DBF2349D2C3B81FCF14B543593CA360E795E77A09BED5B3B1F5D338963DEBE0DDB060C885960014BF2549EEDED8FA002301BC6D9256CA62F55540C705BE15AF2D10A6DD30';
wwv_flow_imp.g_varchar2_table(107) := '2130C616AC9FEBD9D8F6156063384C8615DAE29A008218948C041ECFC8F2AD00F2814207BCEFE7A830B7F1AEC7BF9621366DA2D3913276A2F9BC4AD8FCD8236512B7B2C9FF135E3AFDD4E39A00828AF3EE4DEDDBA740650703E3AF58C2D78AB14D291F16';
wwv_flow_imp.g_varchar2_table(108) := '2A6C9EDB6096520908108E2919A487126397D7757FBE45F8BBFDDC472E1B30D704E0BE237E2D5EE96CBEC66EA53C2827122B99F9CFB1C44F3969728440B961EE001436EFE189445A5ABEABB3F5EB78013B1A18C98A6B912200C562F6B5EBBE96DEEECEB6';
wwv_flow_imp.g_varchar2_table(109) := '4FC892741BDBC5B70CB30D7D4420901D36227A8A441FAFC80958C796FB9FC12759558B4563540AE144920054A07B36B6BECE5604B731276E66A0FF88958FB2441F42C04F04708CFD845DDCBB8D8DBD0FEDBAAFADDBCFCE9CE86663DF8998A90C9B3BA6E5';
wwv_flow_imp.g_varchar2_table(110) := '912ADCD9D9B66D5767DBBDC9B1CC7C90257CC3CAC1483940C64601814320C95FC631C6263EBBC2DF1A8B95672C08401D3D3BEE5F72BE6753EBDFB000B5CA327C8C957F9F2D8F8EB3ADA30F937524E749C896A66D053C755B568D3843C8C6C37190E07FB1';
wwv_flow_imp.g_varchar2_table(111) := 'BB4F77B331D5D2B3B1FD3B38C6E28469AC08C018985D9BDAF0658BFF915D2BB84ECA643A6459C6978EFC86C90CB364FAE13C7EF2FB60A329BFA070CF56A0B001ED1722500061C16EA1B4D93E8E8DDF48207F9D4DFA3538767A36B6FD614F677BC163E966';
wwv_flow_imp.g_varchar2_table(112) := '4DA359165B02308603DF3DB86B53FBC33D9D6D1B586A48CB728B0CF26FB355C237981CBE93B0876D85FE5756D61F7D7C46A008A163AC31E6CFE218C0B19094A015C7064B1BBA3BDB1F62931EEB7DB63078F56541008530EFD9D47E685767FB536C95F097';
wwv_flow_imp.g_varchar2_table(113) := '3D9D6D9F62690D4BF358928606A106A062EA1854CCA994A5EB32C9CAC500897649861589447A754686750949FA00A5F061A0C486C508638531C3D8610C319618538C2DC698258CF51AB6FD148E815D6C2CEC307B3D57E1C089E17E22863E95E452FF7F6E';
wwv_flow_imp.g_varchar2_table(114) := '1BEDE96CBEB4AFB3F9F4DB9B5A8FEFBE77D1E19ECE96BEEE4D6DFB76DEB774F7EE4D6D3B776E6CDD41297C1828B16131C25861CC307618438C25C61463EB7470948B1C1140B9449AFC24044C1020023001A5EC8BA4B247400800618099084048A823D649';
wwv_flow_imp.g_varchar2_table(115) := '91AB6711F324D4E68601662280500F11322E0804CAA94F7E041086F54C39452EC2BED250094FF08A1280AB4085613D131E5CC9922208D05029028EE0AAA2044081121C8D5075E78AFEBD59AE74A17C796B4FAD4A46A0280194AC9D144418010EF46F37B7';
wwv_flow_imp.g_varchar2_table(116) := '952E94AFD0E0E4D6103B17DDEAB392F7AB1F22002BC4A9BC7404A23DB71DF92FCA45BFFA210270146612D210F0E15054AACA52DB6BBE95618608A00C835E92CB3E1C8A4A55596AFB92F0086963A7A4480410D2009259E21188538F4E49B1440270CA3371';
wwv_flow_imp.g_varchar2_table(117) := '82967CB144808683253461AD2891009CF24C58DDE769178D7EA0E1C0734009D155220108B131229DD0E88F48A0C84C030244000630DC669563BEF2E5B625C9870D8178D9E37C509621013807C76E5028C77CE5CB4E92EA238780D361E2544E2800CE0765';
wwv_flow_imp.g_varchar2_table(118) := '191280737084C64C4067A11CAB02FCF6D485D361E254CE9311FE37B221001A32D910C40387A88ED578A09F1D4961FBB62180A80E19B730DB0DB172C1C12D6E62E4FD465F8C17627AB11BC98556D81040A1785CF7C33CC4DC8634AE3122BF9C20E0762417';
wwv_flow_imp.g_varchar2_table(119) := '10000D3627208B95711B52B1D6516F5141C07C6E1710000DB6A88493EC2404DC21A0CF6D23151410803B95241D5D048C8320BA5E946E79396AD0A900E05F000000FFFF7698E73C000000064944415403005C28F2D4A6D359DE0000000049454E44AE4260';
wwv_flow_imp.g_varchar2_table(120) := '82';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(35177892538852510)
,p_file_name=>'icons/app-icon-256-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_512_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000200000002000806000000F478D4FA00001000494441547801ECBD079024D979DFF965D9F6DE774FF7F8999E590BEC2E9600D60224A4A0407B218A77BA381E79A404D19D4E714149C7535CC42982A1234550';
wwv_flow_imp.g_varchar2_table(2) := 'A20890C482278000281A1CB124DCEE627767B1DECCCECCCEEC78DB33DDD33DED7D97CD7B5FB59936952FB3AAD2BCCCFCF74C7567E573DFF7FBB232FFCF6456E481FFF7928E1718E018C031806300C7008E81701D03110AEB8F1E56C7E13708808029019C';
wwv_flow_imp.g_varchar2_table(3) := '1F4C112183DF091085570068FE0F1E3C000110708800CE0F0E8145B52A1108AF002812057CE68B40D9BE0B3DA3ED44F01E044000047C47800D8600600A6B2F5CDBD640C8FE4025C9E8B8948623D525D0680604024D000220D0E18573C124001516CCB8C2';
wwv_flow_imp.g_varchar2_table(4) := '2B10708BC06A3B1000AB1CF01B04400004400004424500022054E1F68FB3E8E3FA2756B0140440C05F04D6AD8500582781BF4A11C02CB752E180312000020124000110C0A0C22510000110000110284EE0EE5E0880BB2CB00502200002200002A1210001';
wwv_flow_imp.g_varchar2_table(5) := '109A50C351100001100081B013D8EC3F04C0661AD8060110302180D5192680900C02BE210001E09B50C15010508100EECF50210AB00104CA23B0B554D90200A781AD20F10E0440201C0470EE0B479CC3E065D90200038161383CE0230880C0760238F76D';
wwv_flow_imp.g_varchar2_table(6) := '2782F79E1128F160DC6E67D902607B45780F0220000220000220E022810A87A320005C8C159A02011000011070964085D744678DF3B4F69D8D4300EC64823D2000022000023E2550E1A8B84FBD2ECF6C0880F2B8A11408800008800008F8864031432100';
wwv_flow_imp.g_varchar2_table(7) := '8A51C13E10000110000110083801080045038C792C450303B340A00402F81C97000B591D2450BC6A0880E25C3CDF8B792CCF43000340A0620281FF1C07DEC18A0F01A52B8000503A3C300E04400004142680210E858373D734A32D08002332D80F022000';
wwv_flow_imp.g_varchar2_table(8) := '022000020126000110E0E0C2351000011000817502619DAF58F77FE75F08809D4C5CDE8383D265E0680E0440209404305FB13DEC1000DB89B8FE1E07A5EBC8956A100250A970C01810081801993B1000323A480301C70940003A8E180D80000814250001';
wwv_flow_imp.g_varchar2_table(9) := '50140B768200088000088080DF09C8ED870090F3412A08800008800008049200044020C30AA7400004400004FC40C0C9494033FF2100CC08211D044000044000041C22E0E53260080087828A6A2B24E0E5A7A242D3511C04400004BC27606E818F0400AE';
wwv_flow_imp.g_varchar2_table(10) := '08E6E10C500E2FC7C5028411AE800008808011011F09005C118C8288FD200002C1278033609062EC7C87D60A2D1F09002BEE200F088000080493801A978C60B275DF2B35E41C0480FB91478B20000220000220E020016B55430058E3845C200002200002';
wwv_flow_imp.g_varchar2_table(11) := '201028021000810A279C010110000110083B01ABFE43005825857C200002200002201020021000BE0E269605F93A7C301E044000046C2760BD420800EBAC14CCA9C64A5205C13868124497837051350880808B0420005C848DA6824000A22B0851840F20';
wwv_flow_imp.g_varchar2_table(12) := '105402A5F80501500A2DE4050110000110008180108000084820E10608F89500C654FC1A39D8AD1E81D22C8200288D1772830008D84C00AB2A6C068AEA40C0220108008BA0900D04400004400004542650AA6D1000A512437E1000011000011008000108';
wwv_flow_imp.g_varchar2_table(13) := '800004112E800008800008AC1208EF9A9255FF4BF90D01500A2DE4050110000110509A00D694580F4F410040315907869C20000220000220A01A8172EC29080028A672D0F9A40C82EB9340C14C100001107097404100B8DB245A73950086775CC58DC640';
wwv_flow_imp.g_varchar2_table(14) := '000440C07D02E5B50801501E3794020110000110080481F00E93420004E2008613200002200002E511F0FF3069797E134100944B0EE540000440000440C0C70420007C1C3C980E0220000220107602E5FB0F01503E3B9404011050914078A774558C066C';
wwv_flow_imp.g_varchar2_table(15) := '5298000480C2C181692000026510D0CA28138822503E810863894E54923D580200C77F25C702CA820008F89A4068958FAFA3E6A5F1C1120038FEBD3C96D036088000088080AB042A6B2C5802A03216280D022000022000024A1170B25F0B01A054A8618C';
wwv_flow_imp.g_varchar2_table(16) := '3101CCEF18B3410A0880406504D43DBFC82CABCC67C27300E4009D442F6F19A9DB0968DB77E03D08800008D844209CE7178C00480F9F601E14C1F44A1A48248200088040C00854EE0E0440E50C7D5703C6357C1732180C02200002B6138000B01D292A04';
wwv_flow_imp.g_varchar2_table(17) := '011000011000016709D8513B04801D1437D581E1F54D30B0090220000220A02C0108009B4383E1759B81A23A1000011000816D04EC790B01600F47D40202200002200002BE220001E0AB70C1581000011000818A08046098B622FF37158600D804039B20';
wwv_flow_imp.g_varchar2_table(18) := '0002200002012780855A1B018600D840810D10000110000110509D807DF64100D8C7123581000880000880806F084000F826543014044000044020EC04ECF41F02C04E9AA80B04400004424C00D3EBFE0A3E0480BFE2056B410004404059025860EF7468';
wwv_flow_imp.g_varchar2_table(19) := 'ECAD1F02C05E9EA80D044000044000047C410002C017618291200002C12380FE72F062EAAC4776D70E01603751D40702200002960860C6DC122664728C0004806368513108800008800008D845C0FE7A2000EC678A1A41C022010C015B04856C2000020E';
wwv_flow_imp.g_varchar2_table(20) := '10800070002AAA04016B0430046C8D137281000838410002C009AAA8130440000440000414270001A07880601E088000088040D80938E33F04804D5C31986B1348540302A125803521A10DBD478E4300D8041E1F5D9B40A21A10082D017423421B7A13C7';
wwv_flow_imp.g_varchar2_table(21) := '9D4A8600708A2CEA050110000110000185094000281C1C98060220000220107602CEF90F01E01C5BD40C0220E0070298BFF3439460A30304200036A0E22CB081021B20102602987A0F53B47DE7AB930643006CD0C5596003C5A60D50D904039B20000220';
wwv_flow_imp.g_varchar2_table(22) := '1020021000010AA613AE605CC409AAA81304400004AC1070360F0480B37C513B088000088000082849000240C9B0C028100001100081B01370DAFFC00900CC593B7DC8A07E1000011000812010089C00C09C75100E4BF800022000026127E0BCFF811300';
wwv_flow_imp.g_varchar2_table(23) := 'CE23430B20000220000220E07F021000FE8F213C000110083C018C6D063EC4DB1CDCF2D6A1F043006CA1ECED1BAC5FF0963F5A07017509E0EC605B6C1CBA98DA665FB18A1C0A3F044031D81EEDF3E371E9112A340B02200002E51170E8625A9E3146A5DC';
wwv_flow_imp.g_varchar2_table(24) := 'D9BF450014E582AB923B9170B995A2B176D90634070220000220E01D812D02A0E8B51E570AEFA2E360CB4563ED607BA81A04400004424DA08493AE5B9CB60800B71A453B20000220000220102A020A76A62100427504C259100001100001B509B8671D04';
wwv_flow_imp.g_varchar2_table(25) := '807BACD1120880000880000828430002409950C010100001100081B01370D37F0800376997D596822B47CAF2038540000440000454220001A052348ADAA2E0CA91A2766227088080AF09A0AFA140F8DC350102C05DDE680D04400004D42480BE869A7171';
wwv_flow_imp.g_varchar2_table(26) := 'D02A080007E1A26A10000110000110B04AC0FE7CF2611D0800FB897B5FA33CE6DEDB070B4000044000045C20201FD68100702104AE37218FB9EBE6A0411000011000013302EEA74300B8CF1C2D068500465A821249F80102A124000110CAB0C3695B0860';
wwv_flow_imp.g_varchar2_table(27) := 'A4C5168CA804044080C80B0610005E50479B20000220000220E0310108008F0360B9790C375B46858C20000220E02F02DE580B01E00DF7D25BC57073E9CC5002043C2050EE47B5DC721EB8882603420002202081841B4124E0E0B08F8355073112A5F854';
wwv_flow_imp.g_varchar2_table(28) := '2EDA72CB95621BF2AA49C02BAB2000BC228F7641C09480837D4207AB36750B1940000494200001A044186004088000088040380978E735048077ECD1320880000880000878460002C033F46818044000044020EC04BCF41F02C04BFA681B044000044000';
wwv_flow_imp.g_varchar2_table(29) := '043C220001E01178340B0220000220101402E5DEC3E1ADFF1000DEF247EB200002200002BE27E0CFDB6A20007C7FE0C10110A88080EECF9E4B051EA328082843C06B432000BC8E00DA0701B709E879CACC8E536AF45AE1959D9B203D9771DB0AB4070220';
wwv_flow_imp.g_varchar2_table(30) := 'E0310108008F0380E641C04D02F9F40AAD0C5FA2CCF418E5561629975AA2F4D428ADDCBE4AF9F4B29BA6A02D10083901EFDD8700F03E06B000045C21905B9AA3D49D1B94CFEEECEDEB625F6AEC06711E578C41232000029E138000F03C04302054043C9A';
wwv_flow_imp.g_varchar2_table(31) := '72CF2D2F507A6298F8426FC45BCF65293D390211600408FB41C046029E54B5EDFC0301E04914D068680978B05838BB304DE93B43A4E773A6D80B2260FC267119D3CCC8000220E02F02DBCE3F1000FE0A9F2FADDD76CCF9D207BF1A9D9D9FA48C98E3D7F5';
wwv_flow_imp.g_varchar2_table(32) := 'BC6517745DA7CCE46DCACE4E582E838C200002A51050232F04801A7108B415DB469D02EDAB4ACEF1EAFEF4E4A8A59EFF76BB752118D2D36385BB05B6A7E13D0880403008400004238EF00204B610C84CDDA6F4D498D85789FC1223014204F0BA005111FE';
wwv_flow_imp.g_varchar2_table(33) := '830008D84440956A2000548904EC00013B08889E7B667A94327353A2B64A2EFEA2F8DAFFECFC546171E0DA5BFC01011008080108808004126E800013C8CCDC11C3F63C776F7EF1AF4DC4291A4B7031D3178B005E4B609A11194000044C08A8930C01A04E';
wwv_flow_imp.g_varchar2_table(34) := '2C600908944F40D7452F7D78EDE26F5E4D476B0B7DE6E141FAD44347A9BFA3D5BC80C891999B282C28149BF80F022010000210000108225C0839011EF6173DFFECFCB425109D2D4DF4D8D1BD54535D431D75497AF8F06EEA1282C04AE1CCDC2465A6796D';
wwv_flow_imp.g_varchar2_table(35) := 'C1DDDCDADD4D6C81000898105029190240A568C01610289980E8F94FDD163DFF714B257BDA5BE8A9070E527522B691BF5A4C053C75FF01EA13691B3B0D37F4425B3CD5B09EC57CB2613D27FE820008A844000240A568C01610288580E8F9A72746C86ACF';
wwv_flow_imp.g_varchar2_table(36) := 'BFAFA38D9EB8672FC5223B3FF6D188461F3BB28F76777758B28005003F59D05266640201105823A0D69F9D6702B5EC8335200002C50888397FBE085B7D625F9F98E77F5C5CFCA3D1BB3DFFEDD556C7A3F4F0A101EAEBB4B62680DBCE4C8F6EAF06EF4100';
wwv_flow_imp.g_varchar2_table(37) := '047C420002C02781829920B0994066861FD2C3ABFD37EF2DBEDDDFD5418FDDB38F22457AFEDB4B2463517AFC9EFDD4DFD9BE3DA9E8FBCCEC44614AA06822768200086C21A0DA1B0800D52212227BB078ACBC6067E7A7283B3769A9707F671B7D627080A2';
wwv_flow_imp.g_varchar2_table(38) := '91621FF5E2B3F7114D4C070CEEA67DBD9D96DAC8CE8C5BB6C75285C8040220E00A81626705571A46232050FCF2032E3202FCAD7EFC943F5D4C01C8F2711A5FFC1F133DFF6834CA6F8BBC8C25188F047CF4E0801809309F0ED0F53CF154406E65A1481BD8';
wwv_flow_imp.g_varchar2_table(39) := '050220B04A40BDDF1000EAC5041681405102B9E5794A4FDC22DDC2C57F6F5F377D52CCF96B9AF145BE68239B7626A21131757080F6581809609BD2776E527E6571530DD8040110509900048082D129FF94ADA03330C91602F94C8AF899FCFC75BD6615F6';
wwv_flow_imp.g_varchar2_table(40) := '75B5D3A387765144ABFCE3CDFAE19103FDB4AFCF7C3A80BF6E383D354A6CAB998D480781B01150D1DFCACF102A7AE5739B3034EEF300DA6CBE9ECD506AEC3AF15FB3AABBDB5AE8F1A3FB6CB9F8AFB7158F45E9C1FD03D4D5DAB4BECBF06F3EBD4CE9F19B';
wwv_flow_imp.g_varchar2_table(41) := '44F9BC611E24800008A8410002408D38C00A10284A401717D2F4E4B0A58B7F537D1D7DF2E81E71F12F5A55453BAB62117AEC9EFD545B57675A4F3EBD22462B86897488005358C81012026ABA0901A0665C601508140864A6468817FE15DE487EF13DFC4F';
wwv_flow_imp.g_varchar2_table(42) := 'DCBB9F92F1B824576549C9788C3E71642FD554254D2BCA2ECEE2CE00534AC80002DE128000022F338E0000100049444154F0963F5A070143027CAB5F7661C6307D3DA12A1EA51FB96F90EA6BAAD67739F6B7A3A1863E3AB89F62867716DC6D3A3D7D87F8';
wwv_flow_imp.g_varchar2_table(43) := '614177F7600B04C2494055AF2100548D0CEC0A3581DCD21C6566EE9832E07BF61F1217E49E66F3A179D3CA2C661868ADA78707F79266BAC850A7CCE408F19480C5AA910D0440C0450210002EC24653206085809ECB50666A544CA1E74CB33F242EC4BB3B';
wwv_flow_imp.g_varchar2_table(44) := '9A4DF3996528F5CE937D5DAD74CFFE7EB36AA9707B20AF61C8654DF31A66C0AA58433448F00301756D8400503736B02C84040AB7D2F1FDF4D9B4A9F787067AE9408FB547F69A5556CE35F6FE812E3AD0DF6B5635E553CB949E1816F9CA6945142B559D88';
wwv_flow_imp.g_varchar2_table(45) := '2241FA1F72F783144AE57C8100502E243028B404749DB2B3E3944B2D9922E8EB6CA78FEEEF23AF2F0E0F1FD865E96981FC10A3CC8CB5AF2C36753E6419CA944D21A3A4AEBB4A5AB67650410028191D18154602FC8C7FFE721D33DF3B9B1BE891C3BB89E7';
wwv_flow_imp.g_varchar2_table(46) := 'FFCDF23A9D1E110AE41347F75187B0C9ACADCCCC1D622160960FE92000020E13109F5B6E01028029E005021E13E085727C813433A3B6A6861E3D7A806AE246CFF737ABC1FEF46824423F72CF016AAAAD36AD3C33751B8B024D2921437008A8ED090480DA';
wwv_flow_imp.g_varchar2_table(47) := 'F181752120C08FF74DF342B9BC7CD15F2C1EA727EEDD47F55571E5A8D427E3F4C8D1FD549590DB96CFA4894580720EC02010082101088010061D2EAF13589B085B7FEBD15FEEF9F34239B3E61F3DB28F5AEA6BCDB27996DED1504B8F1ED96BDA7E6E6591';
wwv_flow_imp.g_varchar2_table(48) := '32B3580F600A0A197C4F4075072000548F10EC7390C0DA4498832D9855CD0FCAC95978D8CFBD7B7A69A0DDFC59FC66ED399DDEDBD644FB77F5983693E5F5008BB3A6F990C14F04D410D47789A966CF5DCB54D98AA86208EC0081B011D0B362387C7A8C74';
wwv_flow_imp.g_varchar2_table(49) := '9367E63737D4D391DDBD9EAFF8B7121F4D58F9D1FDBDD4505B23CDAEEB3A656684EFD98C341F12FD444053CC58AFED510C47117320008A40C12E10709A40E17EFF8961E2F97F595B89588C3E79CF3E8A47FDF3518D47A3F4F17BF653226EBE1E203D755B';
wwv_flow_imp.g_varchar2_table(50) := 'E63ED24000041C24E09FB38A8310503508B84D203B3B413C172E6B57131D987B0FEEA146179EF12FB3A39CB4B6FA1A7AF8D06ED3A2FCC8E31CA6024C392183FF08F8C1E2900B00CC11F9E1200D9A8DB99505CACE4D98BAB5AFA793067B5A4DF3A99A6177';
wwv_flow_imp.g_varchar2_table(51) := '572BEDEA6A37358F4701F83648D38CC80002B612C0F93FE4024074B16C3DA0501908C809E862CE3B3D2E86FEC51CB82C677D5D1D7DF440BF2C8BF269FCE9FAD8E1DDD45C5F27B595A741F8364869263F25E2BAE29368F111EA94A9FEA837E402C01F4182';
wwv_flow_imp.g_varchar2_table(52) := '95C121C03D7FFEB21F99477131DFFFF1C1DD148F4565D97C9156257C78500899643C26B5976F83CCCE4D4AF3F826B1D87505A2C037E10B93A11000618A367CF59400CF77F3E37ECD8C18DCDB4FED8DF25EB3591D2AA5F7B434D0BD7BFB4C4DCA4C8F523E';
wwv_flow_imp.g_varchar2_table(53) := 'BD6C9ACF97198A89025F3A02A3AD10F04B1E0800C52285F3846201B1CB1C3D4F99C22D7FF2AE605F671B1DEDEFB2AB5565EA39D4D7493DADCD527B566F0DBC437C87843423124100046C210001600B46FB2A915F1EEC6B0735B94940A7F494E8DD6652D2';
wwv_flow_imp.g_varchar2_table(54) := '46ABABAAE8C1FDBB28AA49B3F93251D3B4C253021B4DBE2F20B7344F81990AF065A46074E504FC530304807F62054B7D4A20B738476643FFE2FA282E90FBA8B13AE9532FCDCDAE49C6E9DEFD0314E5AF109464CFCE8E53DE442C498A23090440C0220108';
wwv_flow_imp.g_varchar2_table(55) := '008BA0900D04CA21C00BFE32566EF9EBEDA6DE96FA729AF05599FEB626DADD239FE2284C05F003824CEE9420FC80808204FC641204809FA2150A5B83350992999D205EE12E0B5D7D4D151DB5B0484E56875FD2B8F37FEFDE1E8AC5E47705E496174C1F94';
wwv_flow_imp.g_varchar2_table(56) := 'E4179F612708A84A000240D5C8946A5760AE9B2A4D805706359F59A1DCFC94692407F70E507DC2FFB7FC993ABA96A12E11A7FB0FF05302E5B1CE4C8F6241E01A33FCF10B017FD90901E0AF78195B2B3F971A97438A844005500BABFEEF100F674B1AA0CE';
wwv_flow_imp.g_varchar2_table(57) := 'F676DAD7D924CB12C8B4C3BD6DD4DE26BF2B809F0E98E1A9804012805320E03D010800EF63000B02488057B3E796E6A49EC5A211FAE8FE3E8AF20A40694EA3C4CA46288C6A75633F4BAB7BF7EEA284C90382B20B33C442C00D9BD00608544AC06FE52100';
wwv_flow_imp.g_varchar2_table(58) := 'FC1631D8AB3E01EEFD8BB97F3343077ABBA9A5B69255FF7C19356B45DDF49E866A3AD0DF676A20DF152086524CF32103088040690420004AE385DC3202FEED90CABC2A392D33332E7AADF227DAD5D5D5D1BDBB7B4AAE3B68058EF6775032291741D9C559';
wwv_flow_imp.g_varchar2_table(59) := '321B4DF137177C70DC889FF372D90D2FEC6D0302C05E9EE1AE0D9F30D2B369B2F2209B8F1C1CA0BA102DFC33FA6024C434C80307068C9237F6A7A74729B8A300F8E06C04DAC10DC8AC9D7021007632C11E102893805EB8F8EB620A405641776707F53607';
wwv_flow_imp.g_varchar2_table(60) := 'E759FF325FADA4EDEB6CA1B6F67669563D9B212BCF5390568244107090801FAB8600F063D460730904DCD3FDF99525CACE4F4B6DD3348D1EDC57C9C23F69F5BE4CE467033CB0B7D77C41E0EC38513EEF4B1F61B47F0904797C0602C0BFC765202DB7FFC3';
wwv_flow_imp.g_varchar2_table(61) := '667F8D46E033337CDB9FFC027560A08F5A6A1246558464FF4E51D6595F4587F6F44BFDD7C5C53F3327448034171241C05E023B8FD662F5FB731F04803FE31658ABFDFA61CBAF2C523EB5248D4B73432D1DE96D95E60947E24E51C67BF67534515D759514';
wwv_flow_imp.g_varchar2_table(62) := '41767E86705BA014111241C032010800CBA89011048C09F02235DDE4D9F5BD2D8D549388127FDD2D5EB91D1C6AE211DADD217F38107FB7426E413ECD621C25A480803304FC5A2B04805F2307BB9521C0B7A8E553F2DBFED8D833D747E8AF5E3949DF7AEB';
wwv_flow_imp.g_varchar2_table(63) := '34FDDD5B1FD2B36F9DC16B8DC1B7DEFC40B03941676EDC6654D2575608003D9795E64122088080390108007346C80102C604F43C59B9ED6FBD826C3E478B4B2B34BFB4440B4BCB78AD31585C4E11B359E724FB5B580B30734764F1EB8491301DFF0344C0';
wwv_flow_imp.g_varchar2_table(64) := 'BFAE4000F83776B05C0102D9C539D3B97F05CC0C9C093C0D904FA702E7171C020137094000B8491B6D058E003FA6D66CEE3F704E2BE01033CFCE4F2A60094C083B013FFB0F01E0E7E8C1764F0914E6FE33E8857A1584DCE22CF1DD175EB58F7641C0EF04';
wwv_flow_imp.g_varchar2_table(65) := '2000FC1E41D8EF0D81BC98FBB7F0853FDE18178E56792D004601C2116B67BCB4630D893396B9552B04805BA4D14EA00870EF3F6772DF7FA01C56D499DCD202E18E004583A3BC59FCF409E58D74D440080047F1A2F24012D075CA58987FAEABA9A69E9606';
wwv_flow_imp.g_varchar2_table(66) := 'EA69ADF0D55661F94ADBF7A87C774B23D557CBBF2950E7BB3016F05C80407ECE7CE094DF4D8400503C82D0A8EA0528B7B248BAC90AF49F7DE410BDF2BFFE287DFB734FD2B7FF7985AF7F5661F94ADBF7A8FC773EF704BDF09B3F463FF3D07EE941909B9F';
wwv_flow_imp.g_varchar2_table(67) := '223D9B96E641220880C04E0210003B9928B507B3544A85A3604C56F4FEB9E7597853E4577D324EFFE09E3ED2A0DE8AD0296D5722AAD13F7E680FD555198F04E4B319CA2ECE965631728340C504FC5FC12601804B8DFFC3090F9C26A06752945B9A973633';
wwv_flow_imp.g_varchar2_table(68) := 'D8DF45F776D448F320D13A8181A62A7A685F97B4404E8C0290980E906642220880C016029B0400BA2B5BC8E00D081421C08FA12DB27B63572216A19F7C7080B8E7BAB1131B1511488A5180CFDE3F20ADA3300AB03023CD834410B0934010EADA240082E0';
wwv_flow_imp.g_varchar2_table(69) := '0E7C0001E708E4D32B6426007A9AEAE8E1DE06E78C0869CD0F76D7D381EE16A9F7854732EB18C994424222086C220001B00986E54D9C632CA30A52C6FC0ADF7296337489C7D0FEE103FBA8AD2666980709E511684846E9C7EEDD232D9C17D3332CD2A499';
wwv_flow_imp.g_varchar2_table(70) := '900802B6100846251000E5C491CFF4E59443195F13309BFBEF6C6EA027F6B7FBDA47558D8F88CFDC678F7652735DB5D4C4DCD29C341D895609A0976395949FF34100F8397AB0DD3502F9F432997DE5EF43FBBAE9606B1591B85891E33FE13B41B75445E9';
wwv_flow_imp.g_varchar2_table(71) := '89C15D52B2B9E579DC1228256435D19583D8AA31CAE50B8A4110004189A4577E04F93AB4C9B7ECFC14C96EFD8B892EEA8F1DE9598DC2A672AB3B9CF81DBE133433FEE9FB590018FB5EB84B6365D109E0A813040247000220702175D921E373B1CB8638D0';
wwv_flow_imp.g_varchar2_table(72) := 'DC9A6FFCA8D9DCA27C6879705707DDD751EB8011A87233817D2DD574EF9EEECDBBB66CEBBA4E9806D88264F58D2BA274B5A9E0FF0E8E871000C189253CD92060EFD92E2F7A947ADE78F11F37FB930FEEA586243E4ECCC2C9574D3C423FFFF05E6913F9E5';
wwv_flow_imp.g_varchar2_table(73) := '4562D126CD14B6442D6C0EC35F2B0470C6B24209797C46C0DEB39D598F724F67337DACBFC9678CFC6BEEA3BB1AA9B5DE7831A0AEE729B7886702F837C26A5B1E24EB0C0580BDA7D02021832F6122904F2D113FFB5FE6F35383BBA8B73E2ECB82341B0934';
wwv_flow_imp.g_varchar2_table(74) := '26A3F4131FD92FAD31CB0F05CAE7A5794A4EB47760A9E4E6510004EC2660280070ACDB8D1AF5F991005FFC65C3C96DF535F4E4810E3FBAE65B9BF93B167EEABE5E8AC78C9FB7C0CF03C86753F6FA885E91BD3C7D595BB08C361400C17213DE80407904CC';
wwv_flow_imp.g_varchar2_table(75) := '16FF3D72A087EEE9A829AF72942A9B406F7D823E71A84F5A3EB7BC204D472208849D000440D88F00F86F48807BFE7A66C5309D131E3F20FF921ACEA3E22B2786F856B23AA5C5465E6CAB68A3CCA688E88DFF64E19640E35C797E2680C9E24DE3D2480181';
wwv_flow_imp.g_varchar2_table(76) := '9D0482B60702206811853FB611C82DCD93AE1B5F1DF7B4D5D360479D6DED3955D1C4728EDE1A59A2CFBF718B7EF3D9B3F42FFEE624FDCA5FBC43FFFCEB6FD02F7FED8DC2F6AF7EF314FDAB6F9FA33F7D7784DE185EA4F1A5AC53E6D856EF7D5DF5549330';
wwv_flow_imp.g_varchar2_table(77) := '5E7B914FA74C1FDE649B31A808047C480002C0874183C92E10E095E44BB3D2860EF7B4D2AE8684348F5789DCABBF3693A62FBC3944FFDBDFBC4BFFFB378ED19FBFFC3EBD7AE632BD7561884E5C1BA50F6E4DD269F17A5F6CBF79FE06BD7CEA12FDF1F3EF';
wwv_flow_imp.g_varchar2_table(78) := 'D1AF7FE545FA57DF3C4ECFBC7393AE4EDB3C8F6E2390FA64941E3DD86B5823DFBAC9A30086199000022511085E660880E0C5141ED94040CF6629BFB224ADE981013517FFDD9A4BD397DEBE41BFF29557E899974ED299A13BB498B2DEA3E7418F334363F4';
wwv_flow_imp.g_varchar2_table(79) := '85174ED06F7CE3357AE6ED21BABD9091B2F022919F0CF8F17D9DD2A673580720E583C4701380000877FCE1BD01811C7FF39F18053048A6582C4647BBD5FADA5FEEF5BF7E63867EFDEBAFD29FBC788A2617968DCCB7BC7F646691BEF08393F46B5F7F9DBE';
wwv_flow_imp.g_varchar2_table(80) := '7B61C27239B7323ED2DF4C7C5780517B7A364DFC324AC77E10B04A2088F92000821855F8543181BC1000B24A1EDADB493DF549591657D396B379FAF3F786E837C5C5FFC6D4A2ED6D5F9B98A37FFFECDBF495776F52869586ED2D945761775D9CFA5A8C85';
wwv_flow_imp.g_varchar2_table(81) := '18AFE1C02840796C512AF8042000821F63473DD41CADDD99CACD6CD6B319E20564B2D61F1A68A7A6AAA82C8B6B69F3E91CFDE1B18BF49F9E3F49791EBF77A8E5954C4EB471827EFFA50BB49CC93BD44A69D546231A7DFAE82E69A18298B3FBA14064BC38';
wwv_flow_imp.g_varchar2_table(82) := '546A0C127D4A20986643000433AE05AFCC2E74854C15FEF2E369D0CCE6C2F0BF100132340FEE6A9125BB96C6B7F2FDC9AB97E8BFBD7DD1B536FF52B4F547AF5E76AD3DB3861EDBDF4111C93C406E7991F239BBD730B8F1E932F31CE9205019010880CAF8';
wwv_flow_imp.g_varchar2_table(83) := '295DDAEC42A7B4F11E1A975F5E205D32FF7FA8A7853AEBBC5FFDCF9DFD674F8FD037DE72EFE2BF1E96FFF6D60516DEB1E30000100049444154FACA7BB7D6DF7AFAF7605B2DD5D51A3F8C89EF06D033EADECDE0293C346E8940503341000435B2F0AB6C02';
wwv_flow_imp.g_varchar2_table(84) := 'B9947CF5FFD15D1DD453EFBD00383E3C47FFF1FB272CFBD9DD54439FBE7F1FFDF28F7E94FECD4F7F9CFEFDCF3D5E78F136EFE334CE63A5429E6AF893974ED11B43B356B23B9AA73A16A187F7744ADBC8AFD8BF2E42DA201241C0070420007C102498E81E';
wwv_flow_imp.g_varchar2_table(85) := '017EFA1FE5E4B7CC3DD8DFE69E41062D8D2F66E9F79F3B41590B73DB9D4DB5F43F3C762FFDEA671EA22707FB68A0B58E6A93712A2C9F1743E7BCCDFB388DF3705E2E43263FBC26E00F9F3F450B696FD7030817E8C9435D526BF3E915693A1241C0984070';
wwv_flow_imp.g_varchar2_table(86) := '532000821B5B78560601FEF63F9DC7D60DCA76D457D311059EFEF7F2A53B7461D4BCF7FDC8C13EFAF5CF7C94067B5BA870C127931F7135E5BC5CE69103BD2699892E8CCDD0B7CE8C98E6733AC3C37D8DC40B028DDAC967D394C73480111EEC0F29010880';
wwv_flow_imp.g_varchar2_table(87) := '90061E6E1727905B5E289EB0B6F7706F2BF1AD676B6F3DF933329FA1BF78F39CE93AF4A7EEDB4F3FF1917D64E9C24FDB7E8410F8898FEEA7A7EE13E5B7256D7FFBE7AF9DF5FCD1C1EDB571DAD72544CE76E3D6DF8B511D4C03ACC3C0DF520804392F0440';
wwv_flow_imp.g_varchar2_table(88) := '90A30BDF4A22A0732FD164FEFF23031D5415F37605F8EBD726C8EC5EFF8F1DEAA74F1D31EFC19B01FAD4913EE2BA64F9C6E757E8D933B765591C4FE3883C7EB8CFB01D1ED5810030C48384901280000869E0E1F64E02F94C9A74F1DA99B2BA478B44E9D1';
wwv_flow_imp.g_varchar2_table(89) := '3DADAB6F3CFA3D9BCAD1F3A787A4AD77B534D2671FDC23CD534A22D7D52579D80ED7F5E287729B388FD3AF27F6B7532C6A7C4AE3E91D924CEF386D1FEAF7238160DB6CFC6909B6DFF00E047610D0C51CB12EB9FD6FB0B78D9AAA623BCAB9B963683645D7';
wwv_flow_imp.g_varchar2_table(90) := 'C767A44D7EEA3EFB2EFEEB0D7DEADEBDEB9B45FFDE9A98A56B336EDD6A57FC06D7C1B61AAAAF4E16B58F77E6B359E25B02791B2F1000012208001C0520B046202F04C0DA66D13F477B5BA83EE9AD0038737B9626178D2FB4DDCD7534D8D558D4FE4A760E';
wwv_flow_imp.g_varchar2_table(91) := '7637527753AD61152BD91CBD7675D230DDDE04AD687511B1FB605773D1B4D59D3AE9260F785ACD87DF20B04A20E8BF2100821E61F86799008F00C832F735D752B557F3FFE2E2C6B69DBF2DEFFDDF33D0C5D91C791D1DE836AC3797D7E9FCA8DC36C3C236';
wwv_flow_imp.g_varchar2_table(92) := '260CF6344BD73CE633B81DD046DC01A8AAF86852001CB3E4020480254CC814780262E8BFF00C0089A3032DC64F9B9314B32769ED3CB592923FD2767747B33DED15A9654F675391BD7777DD9EF1FE613BFBDAEA2916313EADE969E3D193BB9E602B3C04D6';
wwv_flow_imp.g_varchar2_table(93) := '9475518783BFD3F893127CDFB77AB87682DDBA13EFC242202F2E0C6602A0BBBECA731C4BA9B4D486F63AE3397069410B896D7572FFA717BDEF5D1FEDAAA7A86C21A01801308BB30514C8020281200001B01EC6700BC1750AA1FD9BE7DBFFC4288011809A';
wwv_flow_imp.g_varchar2_table(94) := '448C6A13DE7E5CB262987D3925EFC1D624A2462E54BCBF362EF77F4588139E0AA8B8A10A2AE814022812337E4CB39E49939E958BA80A9A47D1001108832BF24F741808C047101004F2A965D225B7881DE96BA3EAB87317576182E9FF88A69174829BC48F';
wwv_flow_imp.g_varchar2_table(95) := 'C40791EAE8FF5C3E4FD188B0D1D156E495570B91D2D168BC5871F589801000728A36A6EA36D685AA6C270001603B5254E83B02A2E79F1743C332BB0F77B75075CCDB8F0B5F5BAB93C6BD5BB67F312DFF1E03CE53EE6B3125AFBBB65A3E45506EBBA596EB';
wwv_flow_imp.g_varchar2_table(96) := '6FAD9716D1B3F251146961249646C05B3D589AAD5B7287E38DB767B4703086978A13E09EBF2EBD3D4CA35DAD759E3F019031D69808808979E72E6EE30BF239FEA6DA2A36D1F3D7C1CE46A90DBA98069066402208848400044048020D372504C4D0B5EC01';
wwv_flow_imp.g_varchar2_table(97) := '319AA6D19E16E3616549CDB6275525E2D23AAF4D987F4190B40249E2F57179DDAD75D592D2EE25ED6FABA3A464B4462EF6DCB3132DA94B202C9641008425D2F0D39080E9054108002757D71B1A562461A0B5A1C8DEBBBBCE0E8DDF7D63F3D699A13BD21A';
wwv_flow_imp.g_varchar2_table(98) := '0F763549D3DD4A1CECA895AE45D0F33C9581C969B7E28176D4250001A06E6C60994B04F49CFCDEFACEC61AE2C5652E99236DE6484F2345842031CA3432354BE7C6E68D92CBDE7F6E749646A78DEBE51EF7A3BBBDFD9E8475E7BA6AE3948C1B3FB1512F8C';
wwv_flow_imp.g_varchar2_table(99) := 'F8E4D7B3E32F086C23109EB71000E189353C352060765FF80131A75C25195236A8D691DDFB5BAAE99EBE3669DD2F9EBC4464E7DD00A2AE1F9CBC2C6DB3B7B589EEEB50630A201ED5A8BDA1D6D85EE18F59CC8D0B230504824300022038B184276512D04D';
wwv_flow_imp.g_varchar2_table(100) := 'EE0BDFDBDE480D1E3F0360DDB5B6EA283D39B86BFD6DD1BFDC53FFFB93D78BA695B3F3EF4E5CA3B19905C3A2BCD0FBA923729B0C0B3B94B0ABADD1B866160026DFFB605C182941271026FF2000C2146DF85A94405E7A0700D1EEB6BAA2E5BCDAF9E4C10E';
wwv_flow_imp.g_varchar2_table(101) := 'EA6994F7B6DFBE30442F9E1DAED8C4173EBC45EF5CBC29ADA7A53649FFE4C15E691EB7130F743691A6B13429D6B24E7908806260B02F640420004216703FBB6B743AAFC4A77C7A858AAD01D8DCD65E45EE0058F7737763827EE66387D7DF1AFE7DF983CB';
wwv_flow_imp.g_varchar2_table(102) := 'F477C7AF94371D207AC9CF1EBF4CAF9C16E50D5B20719125FA89870F536BB5F19C3B79F073A8B381AA12C56D2ADCF6C9B7020A1F3D300D4D2A4D205CC64100842BDEBEF6D68975DB85B9E05C6E0797F5B6B44894DAEB123BD2BDDEF1E347BA89A726CCEC';
wwv_flow_imp.g_varchar2_table(103) := '78E7D22DFAC3E7DFA773A3C60BF8B6D7C10BFEFECB73EFD3BB97CC471076B5D4D32F3DA2D6F03FFB73B0AD86E231E35B2679DA47D7B1109059E1152202EB27B635972100D640E04F4809E4B3454700D66934D6D7514CF2ED72EBF9DCFEDB591BA39FFBF8';
wwv_flow_imp.g_varchar2_table(104) := '114BCD8E4D2FD0D78FBD4F5F7CF134BD72E136DD985CA045FE5641EE018BD7E24A86AE8B7D9CF60591E7EBC74ED2A864CE7FBDD1642C4ABFF4E47D541357EF34D25E131302C0F8D1CD85511FE1FBBA2FF81B7602AB57C6C053D83CB4299C55EF932B8CC2';
wwv_flow_imp.g_varchar2_table(105) := '7F10708B802E7AFFBAE442D050535518E676CB9E52DAF9C9C136FAA78FDD6BB9C8F0F814BD70E2227DE985E3F43B7FFB06FDF65FFEB0F0FA9D6FBD41CF887D9C3622F258A9906F45FCD9478FD0670FB75AC9EE7A9E5844A3645C320220E24E1801703D2E';
wwv_flow_imp.g_varchar2_table(106) := 'EA36B8EDCAA8AEA1B65A16B1B5365406023E23B0FA501863A36BABE214315C4C665CCE8D944454A35FFDC46EFAC78F1C74A3B92D6D3C7EA49FFEE5E37BB6EC53ED4D326E3C02C0177F99F053CD17D8E30681F0B5010110BE98C3E34D04780460D3DB1D9B';
wwv_flow_imp.g_varchar2_table(107) := 'ADB549210076EC5666475288807FF9F421FAF107F6BA62138BA14F1EDE45BFF3D9FB4834ED4A9BE53652938819162D5CFC25233F860591000201221009902F7005044A2760320CDC559F244DFC2BBD62F74AB008F8EDCF1CA55F7CE25EE923702BB5882F';
wwv_flow_imp.g_varchar2_table(108) := 'A8BFF8C43DF4073FF320719B95D6E774F9DAA4B10028B46D12FB421EFC0A0D81303A0A0110C6A8C3E70D02FC58D88D374536AAE231AA55E4214045CCDBD8958C69F46B9FDC43FFEEA71EA5D6BAAA8DFD766DF436D5D2BFFEEC23F42F3EB147D911116D9B';
wwv_flow_imp.g_varchar2_table(109) := 'B3B549E335009CD52CF69C072F100832010880204717BE9913C8EFBC057073A1BA644CF9A1EECDF67E76B09D9EF98527E8BF7B749058BC6C4E2B67BBA926493FF72383F4D55F7C82FED1E1B672AA70ADCCF675DC6602804C62EF9AE168480102E1340102';
wwv_flow_imp.g_varchar2_table(110) := '209C7187D76B0474938B409D492F72AD1AA5FE0C3426E9DF7EEA00FDD75F7A9A7EFA6347A8B9AE8678F83E1AD9DE47DE6936E7A98E47891FA5FBB33F7294FEE87F7C827EEBE903D4ACD8837E765ABE734F3216DDB973D31EB3D86FCA8A4D100824010880';
wwv_flow_imp.g_varchar2_table(111) := '4086154E592660B210AC2E29BF88586EC7838C075BABE8FFFCF47E7AF1373F4D7FF23F3D49BFF2F4FDF4D4917E7A684F171DEE69A1EEC66A1A68A9A523BD2DF4C8BE6EFAD4D101FADCA71FA0AFFE2F9FA267FFD913F47F3CBD8F06DBAA3CB0DC9E26EBAB';
wwv_flow_imp.g_varchar2_table(112) := '62F28AF27810901C507852C3EA6924AC8EC36F10B042A036617211B1528902798E76D4D02F7FAC9FFEE34F3F407FFADF3F42DFF89F3F49DFF9B51FA5BFFDDCA7E86BBFF049FAE37FF230FDEE4FDD4FBFF8F02EDAD7E2DF8BFE66D466A3373A16016EC685';
wwv_flow_imp.g_varchar2_table(113) := 'ED101280000861D0E1B2750289283E22D669A99593476FEAABE2C6466104C0984DA852C2EB2CCE6EE18D3D3CA7EDCBC67622A94DF8770A60A737E1DA539F8C49EF58C00840B88E87D07B5BE474070110FAA322C4000A1F88C22F43082A3EE7DED058246C';
wwv_flow_imp.g_varchar2_table(114) := '21D0DF58459AF8B765E79637F2D86FC98A378125101AC7B49D9E4200EC64823D20B041A03A8E11800D183EDB48C422247D8A33A6007C1651986B378188DD15A23E10080A0116CC49D59F771B14D80EF8512BC45B44A20074933B401C3009555A22E0E6C8';
wwv_flow_imp.g_varchar2_table(115) := '8C2583029BC9A702000748608F48851CD3344D3A874CF8519A008FDE88101ADB080160CCC6D31496DE9E1A109AC67D2A00708084E608F5D0D1B81842CE436B7A1881CA9AAE8A6994943E0C4891E02A628615DA413BF35AF139C8792241760EBE81402504';
wwv_flow_imp.g_varchar2_table(116) := 'B883E8A3737325AE7A54D659BA96C41B07D923EF379AF5D155D5D988395BFB066F6C6C108000D840818D7012303EFB667279F922B27002B3D16B63F67634B292CD532667725191CE11D86105EAB04EC0D9E361A71DD80301806320BC044C4EFE85456226';
wwv_flow_imp.g_varchar2_table(117) := 'D78FF0C253DFF3E54C9EB2D295FEB8E0A81F4558E82401080027E9A26EDF13E05EA4EF9D08A90329318253107146FE9B0840A36246FB21278CC8A8B91F56114100E028083701938BC092E845861B907FBDBFB39026D914BFA669B63A87C1225B71A2B272';
wwv_flow_imp.g_varchar2_table(118) := '099470204200940B19E542416029930B859F41747272294379A902C0E92F8871B7E653807395A06BF10908F071A09C6B252853F76C977F5A16D31000EEC5C2DE9616D2599A5BC918572A0FBD7139A4804040084000042490BE7043C513AEC9303004802F';
wwv_flow_imp.g_varchar2_table(119) := '8EACA2462EAC648BEEBFBB53C503F2AE75D8728E40786A96F7BA2000C27324C0D32204344D7E1158C61440116AFED8B590321300FEF003568240F904E4E7370880F2C9A264100868F28F0004807F836C163B2D8A2F7AF26F742BB11C65D709C8CF7EEBB9';
wwv_flow_imp.g_varchar2_table(120) := 'F01704024A408BC83F02E845FA37F04B69F90880168100F05B74E5FD59BF79E3BDBDF2B39FF7F6C10210709680C9450002C059FC4ED6BE984AC9AB3789BDBC3052BD20209FD1B6661172DD250001709705B64248408BC6A55E2FA432349BCA4BF3B89F88';
wwv_flow_imp.g_varchar2_table(121) := 'D3A015E6668B003102608522F2049900044090A30BDF4C0998CD038FCDAD902EFE9956E46A060C845AC13D6F7217000480158A41CB037F36138000D84C03DBA123A04563529FAF4FCE4B9F26272D8C44CF08F018C9DC8AD914004E7F9E05080D2B41009F';
wwv_flow_imp.g_varchar2_table(122) := '0025C20023BC22B0DA0B34EE51CF2C2C5326A7DA148057B4FCD3EEBC98B65916D33746166B9A469AC91D204665B1DFBF0460F9560210005B79E05DD80844A2A4699AA1D7994C8696F17D00867C544DB8BD90A66C56721700C71C0240D5F0C12E97084000';
wwv_flow_imp.g_varchar2_table(123) := 'B8041ACDA84920B7CC43FCC63DFC7C364DB76657D4341E561912B834B94439C95701EB222DB7346B581E094124009FB6138000D84E04EF4343209F121789F969537F8767974DF320835A04AE4D2ED28AC97300327393945B5E50CB705803022E12800070';
wwv_flow_imp.g_varchar2_table(124) := '11369A5287009FF85363D7897BF866568DCE2DD34A96979599E544BA2A0486A61648977D13A03054CF66283D3E44F99545F10EFF83ED8F567700001000494441544E00FEED240001B09309F6049C406E699ED293C3C4C3C0565CBD36314F292C04B4824A';
wwv_flow_imp.g_varchar2_table(125) := '993C2342009085DB37F918488DDF142301F3CAD80E4340C02D0210006E91463B4A10E061FFC2C55FF4FEAC1A7466789AF09D405669799F2F2F066B86A7E62C1BA2E7B2949E18A1DC0AA6032C43F35D46185C8C000440312AD8174802DCF34F8DDD203EE1';
wwv_flow_imp.g_varchar2_table(126) := '97E2E0DC728A327C5529A510F27A46603695A39CEC0E802296E939311D7067488C04400414C1835D0125A0900010B23DA090E196F704789E3733755B0CFBE74A36269BCD05720A80354DDE649EBC64580A14185FCC505EF4EA4B3585A703787488EF0C29';
wwv_flow_imp.g_varchar2_table(127) := 'B52CF2AB4D00D61527E08E00B0746D37BE17BBB8E9D80B02D608E453CBC4F3BCF96CDA5A81EDB9F43C5D9F3179AADCF6320ABF7F7764917EE3D9B3F40FBFF843FA475F7CA5B07D6A6C49618B4B33EDFCC432B1B829ADD46A6E5D4C0DA5276E513E151C1E';
wwv_flow_imp.g_varchar2_table(128) := 'AB9EE13708EC24E08E00C0B57D2779EC718500F7E6D2E3374B1EF6DF629CE825DF990F8600787778813EF7D563F4DA99CB343E3D43A3D37385EDDFF8FAAB7462341817BDAB534B94CD1B3FDB614B6C8BBCD17362C467EC3AA6038AB0F1E72E586D44C01D';
wwv_flow_imp.g_varchar2_table(129) := '0160D43AF683808304B8179799BC4D65F7FC376CD3E9E6F46220D6013CF3D655CA8B0BDC866B6B1BF3CB29FADB533729576ED779AD1E15FE5C9F5AACD80F9E0EC84C0E0B1180BB035488296C7086000480335C51ABC704F22B4BC40BFEAC5CFCA3118DA2';
wwv_flow_imp.g_varchar2_table(130) := 'F10419FDF0FDE4D726E769315D7EAFD2A86E37F7F3B5FDC2F0A4619337EE4CD39D25C9E3730D4BAA95704B08009945F55571E9E39FD7CBE6793A408C1EF1B1B4BE0F7FFD4700161B138000306683149F12280CFB8B795C3D6FBEE0AFBAAA8A1EBF671F1D';
wwv_flow_imp.g_varchar2_table(131) := '1EE8A5881002462EBF77758C967CFE9D0059A100C47F2317E9FAC49C1039E6CC0C2B502081EF00189B35EEB5738C8FEEEEA5078F1EA6BA9A6A538B792420353E244602707780292C64F01D010800DF850C06CB08E453CB949E1CA1BC85057F35C9383D7A';
wwv_flow_imp.g_varchar2_table(132) := '743FF576B4D29EAE166A905C1032A2DE2B3E5F08A8EB449AE4139F1553037EBF2BE0E4E822A553C6EB356A6A6AA9BFA3990E7735D223837BA92A693CF2436B3F7A2E4B193EA6CA59182898AF55833F9E1040A3320292D381AC18D240403D0285C7FBDEB9';
wwv_flow_imp.g_varchar2_table(133) := '41BC92DBCCBA6422418F3D70847A9BEB44568DEA851868A9AF15DBC5FF734FF0D2443016C915F730187BDFBC314359890068AAAFA3B898EEE1135F4F733D3DFDE020C5137153E75950A6EE0C957E770016409BB24506EF08F0E7C0BBD6D13208D844809F';
wwv_flow_imp.g_varchar2_table(134) := 'E296991A21EEAD995559535D454F3D7888DAEBEF0E0147C589BAAD91C58071E9B3A3B33497527C1D80F0C3D883E0A7BC3F3441BA6E1CA39686DA2DF3FF2D75D5F4C47D87A85E32FAB34E8D8FADC22D82F8EE807524CAFF858172021000723E48F50181C2';
wwv_flow_imp.g_varchar2_table(135) := 'B0FFF82DCA67CCEFF3AFAB123DFF7B0F525B91DE7EABB838C8DC7DEFDA1D9A4F2B3E471EE221E7C54C9E8627676521A4163102C01936EBA4AEA63A7AE4C83EAA4E263949FAE263AC2002D2F88648292824FA80804E1000853085F8AC59F0DFBFBF78C11F';
wwv_flow_imp.g_varchar2_table(136) := '2FD2E2DE999917DCF37FECFEC3D4DE5053346B7D759262F178D134DEB9B0B44CA38B19DEC44B4102672752945E5931B4AC49C4B7A17A35BEDB3FF1DD42043CF9E0614A262C88806C66F50E93154C0919C256220146C80968100054F8D9DC1F28ECC02F1F';
wwv_flow_imp.g_varchar2_table(137) := '10C8A7962833799BACCCF9D75425E9E9FB0F526B7DF18B3FBB1B8B45A9B1BE81378BBEF46C9ACEDDC16AF0A27014D8F9DEC83CE573C6B7313688119E9A78D4D0D2D6BA6A7A4A1C238DB577A7868C32B3E04C4F0E133F62DA280FF68380EA043002A07A84';
wwv_flow_imp.g_varchar2_table(138) := '605F51027CF1B77A9F7F7D75821E7FE03035D5195FFCB9918816A1F6E67ADE2CFAE293FEF9DB33BEBF1DB0A8733EDFC97738BC77639274DE30F0A5B5A18E62925B3DB9585B632D7DECE801AA138291DFCB5EF94C6AF511D369E351075979A4394B00B59B';
wwv_flow_imp.g_varchar2_table(139) := '1380003067841C8A11E061FFB498F3B7729F7F7D4D0D3D76DF616A13BD3B2B6EF07C303F18C828EFBBD7C76956F5858046C60778FF4A364F976E1B3FE4488B44A8ADD158DC6D46D321A6889EE0E9000B228045616AEC3A46023603C4B66F084000F82654';
wwv_flow_imp.g_varchar2_table(140) := '309409E453D6EFF3AFAB4AD0D30F1CA016C9B03FD7B9F9C5422129A60236EFDBBC3D39334F6301785ADE669F82B07D632E4DCB0BC60F008A46E3D4502B1F01DACCA1594C033C7DDF416AB07A7740613A006B023633F4761BAD5B2110B192097940400502';
wwv_flow_imp.g_varchar2_table(141) := '7CF14F59BCCFBF51F4F89F7CF088A5DBBB36FB5625E6886BABD7E680B7AF141319F55C86AE4E61C857A050EAFF7BC30B94CB1A2FD0E4E321211176C59CE1BB421EBDE700D5575B58189849131F9B794C071443897D4A12C05D004A860546ED24A08BF956';
wwv_flow_imp.g_varchar2_table(142) := '7EC21F0FB9EE4CDDBAA7A1AE963E79CF416AAAADDA9A60F15D93982B2E642DB23694E798CF8ECD1592F14B0D02FC78E37786A6A4C674353790C9F47FD1F23C1DF0D87D87A8665D1416CDB5BA93A7A47861201FABAB7BF0DB2B0268D70A018D300240F851';
wwv_flow_imp.g_varchar2_table(143) := '9E80AE537A6298F216EEBDAE13BDB5A71F3848CD6204A05CBFDA1AEBB63C2C667B3DE747A66874C178B5F9F6FC78EF2C81542E4F676E19CFFF47348D3A38A6659AC153484FDE77801AC5B48059153C4A959E1E23923C8CC8AC0EA483805B042000DC228D';
wwv_flow_imp.g_varchar2_table(144) := '76CA23C017FFC911CAA5CCE7571B45CFFFA907072DADE09619D328E68AA3B1B861960BC3E3343467FCBCF9220307867521A17202E7275334376F7C7B665C0CFDB7D597371AB46E1D8B8047EF3D244440CDFA2EC3BFB9A5B98260152AC0300F129C2480BA';
wwv_flow_imp.g_varchar2_table(145) := 'AD128000B04A0AF93C2190991DA7ECC2B469DB7CD17EEC9EFDD45853D9899E1BAA1375F028006F177BE552CBF4E690F113E78A2C1D28560DF6D944E0854B13A4678D05594D6D1D25240F78B26A467B5D157D421C6356A603B28BB3949D934F4B586D17F9';
wwv_flow_imp.g_varchar2_table(146) := '40C0290210004E9145BD1513C82DCE5066E68E693D0D3549FACC4383D454C1B0FFE64692518DDA9BE4B78CBD7F6382C616310DB0999B17DB2B599D5E3C3B2C46DCF386CD77B63449A7740C0B1649E091009E626A10534D4592B7ECCA4C8F524E08812D3B';
wwv_flow_imp.g_varchar2_table(147) := 'F1C6710268C03A010800EBAC90D34502FC9095F4C488698BB5A2B7FEE403876DE9E1AD37C643F8FD6D4DEB6F8BFE3D2FA601AECF9A7FF740D1C2D8691B810F27566862CA7884281E8D508F492C4B35A6A9B69A783AA05E1C7BB2B2BC60342D4400DF3922';
wwv_flow_imp.g_varchar2_table(148) := 'CB873410F08A807F0500C659BD3A666C6D972FB63B2A14F3FED93931ACBBB690AA681E51281E8DD24387F65ABA575B642FE97F636D92EA6A6B0DCB640BD3003386E948709E80384CE8852BD324BBC036D7D7524785F3FF54E487EF0E78E8D06E8A68F253';
wwv_flow_imp.g_varchar2_table(149) := 'A89ECD50666A54D480139680E0C27F34510A01F9D15B4A4D6EE7D5DC6E10ED3941A0D86931B7B240B985BB73ECC5F2B02DFC0D6EBB5A1B78D3F6179FD8FBBBDB0DEBD5F3793A71631CD30086849C4F58C9E9F4EAC5DBD2867A3B5A29E6D0B9A2B7B5891E';
wwv_flow_imp.g_varchar2_table(150) := '39B257DA3E27F27A803CBE388851E0A51801FF0A00C540C21CFB0864A6EF90BED6FB37AAF5DEBD7DB4BBB3C528D996FD7B3A5A282686908D2ABB78738CAE611AC0088FE3FBCF8E2FD3D884F1ED7F5A34463DAD8D8EDAB1BFBB8D0EF5779BB691991376F2';
wwv_flow_imp.g_varchar2_table(151) := '9085694E64A88400CA96460002A0345EC8ED30015E346576BF7F6F471BDDBBA7971CEAD86D78D85C93A0FA5AE3DBBE52A9157A63080F05220F7EF8E13F3FB83245B227EFB5363688E9A1CAEF0A3173EF23FBFB69577BB3341BDF1A985DC494911412125D';
wwv_flow_imp.g_varchar2_table(152) := '271071BD453408020604F8496ABC72DA20B9B0BB2E19A78F1EEC1773AF4E5FFE0BCD51BF101BAB5BC57F9FBA3941B7F150A0E2701CDC9B12C3FFAF5F920FFFEFED6EA5A8E6FC71128D68F4F0C1DD62B4C8F8AB86194586EF68115347BC8D9713045067A9';
wwv_flow_imp.g_varchar2_table(153) := '0420004A2586FC8E11C82D4C533E6BFC3C776EF8507F0F35542578D39557674B032513C6ED5D1919A7CBD3F86E005782B1DE88B8A69F9D58A19109E3D5FFFCDCFF5DADF5EB251CFF5B539DA4C13DBBA4EDF082402BCFB49056824410B0910004805D308D';
wwv_flow_imp.g_varchar2_table(154) := '56AAD9557FC0EBE1DBFE32B313522FEBAAAB684F4F87348FDD896DF5D5D4D66CBCD0707971918E5D35BE10D96D0FEA23E24EF48B572649CF18DF86D9D4D848D512E1E604C723BBDA459BC64F90E436F9C1562C04781B2F7B09A0B6D209400094CEAC7809';
wwv_flow_imp.g_varchar2_table(155) := 'D12B299E80BD5608E41666C8EC8B7E1E3CD04FFC6D7D56EAB32B4F440C21F7B4351B56C78B152FDD9EA43B4B78289021249B1396B3797AEDC28874A1685F67ABCDAD9A57C7B7A51EDD6B320A90CB52561CEBE6B5210708384F0002C079C668C102015E24';
wwv_flow_imp.g_varchar2_table(156) := '25CBD6D2D840FD260BAD64E52B49EB6DAE274DFC33AAE3DAED09E2E7D16B4619B0DF56021F8EAFD0F01DE3D1A25A3145D42D19B5B1D5986D95EDE96AA3B626F99D07F995856DA5F0B67202A8A11C021000E55043195B0970CF3F9F317E963BF7C20FEFEE';
wwv_flow_imp.g_varchar2_table(157) := '254DF3E6125B9B4C50476B93A1CF4BCBCBF4BD0BE394557C1A2812804F7B26AFD3F72E4E48478B3A9A1BA9B95A3E146F18CC0A1392B1081DD825BF2D90A70074C9F4458526A03808582610805382655F9151510279936FFAE367FCF7B618CFC33BED16EB';
wwv_flow_imp.g_varchar2_table(158) := '8EBD3D928702E93A9DBA728B2E4F1B8B18A76DB452BFB8765AC9A6749E3B8B59FADEA9EB521B7B255336D2823625EE6AAD932E1C65C19B4B2DDAD41AAA6102785924B0AD93020160911BB23944405C3CF32BF293619B1852E52FE871C8024BD5F21307AB';
wwv_flow_imp.g_varchar2_table(159) := 'C4488051E6D18929FAC1D5BB4F2F34CAE7E9FE6D1F7E4F6D29B3F1EF5C98A48CE40B7612C92A31045F5766EDF6148B4763D42DB97D94D78D981DF3F658825A40601B816D83A8916DC978AB10816DB152C832FB4C59ED0D2D492AD44CBF994F52D8B6A444';
wwv_flow_imp.g_varchar2_table(160) := '2C26EC6890D6F7CAF95B34BD9293E64162F904E6D279FAFEE91BA40BD168544B7F470BD5BABCFA7FBB2D3C62D467320A511000123FB6D789F73202482B97000440B9E45C2817800E9B2925FE22173D6D7C1F7D341EA7D606E3A7F19936606386BD5DF207';
wwv_flow_imp.g_varchar2_table(161) := 'CB0C8D4ED0F7AFE0696F3622DF52D52B37E6E9C698F1E23FCEBCAFBB95F802CCDB5EBE3A1B6B281E8B1A9AC0C2971F7C6598010920E0020108001720A3096302850551929E506B431D5579DCA35BB7BEB3B981DA5B1AD7DFEEF89B4EADD0F3676F533A17';
wwv_flow_imp.g_varchar2_table(162) := '06E9B6C37D47772C88DEFFB3A78749CF198FB0B435D452BB78396A88C5CAABE351AAABAE36CCCDA3182C7E0D33B892108CE3D41554016D040220A081F58B5B7A4E7EFF7C67532DC5A26A1CA6FC74B903BDF207115DBA3942AF0FCBD734F825362AD9F9CE';
wwv_flow_imp.g_varchar2_table(163) := 'ED253A71E986A1497CA7C881FE1EC3742F121AEBAAA5CD7A3F02A049ED4362F009A871660D3E6778684040CF1B0B003E3D35D756914A07695F5B13D524E306DE102D2DAFD0DF9DBD63988E84D209F0837FBE77FE0EF1689151E9B6C63ACF9E1361645343';
wwv_flow_imp.g_varchar2_table(164) := '4DD2286975BF64346335037E9B13408E4A08A8746EADC40F94F529015D7612140A201137BED87AE1723412A1C1DD7DD2A64F5E19A6E3A3CBD23C48B44EE0E2548A8E9DB9262DB0BFB78BE28A8C14AD1B1A8BCA8F5D3D6F3C9DB15E87637F31FAEF185A3F';
wwv_flow_imp.g_varchar2_table(165) := '550C01E0A76805D156C94950234DB9933A87607F771BD54AE6776767A6E9BB17E48BD5B81EBCAC11F8C1A549CAA78C05557D4D3575B7CAEFD0B0D692BD057B12BD0000100049444154B912F1A8B442D98886B4A01D899A1D95785F072CA88C00044065FC';
wwv_flow_imp.g_varchar2_table(166) := '50BA42023A7FB38B411DBC9A5BB692DAA098E3BBD9A6DD920703B1016F5D1EA1AB33C65F56C379F03227707D364D2F9FE55BFFF28699F9C97BD589B861BA5709F1584CDAB4F78B00A5E6213104042000421064A55DD48D4FEC6C77222AEF45711E2F5EBB';
wwv_flow_imp.g_varchar2_table(167) := '3B5BA9B6CAF8A2C30F067AEE8AE20F06F2025C896D1EBB3E472377260D4B256351DADFDD6A98EE65020B00D9C3A378FA4B375904EBA5FDEAB70D0B2B250001502941942F9F00DFFEC72F831AA2910889FF06A9DEEE6EAE49D2813EE367BEF3F0EE0B1F0E';
wwv_flow_imp.g_varchar2_table(168) := 'D1B2EA5F10E02D4669EBC3F319FAFE999BD23C03DD1D941022409AC9A3C4583442D549C942403D479EAE03F0880B9A55870004803AB108A1253AF13F23C7354D23CD285181FDFBC53400DF7E6664CACD9131FAFA9929A364EC3721F0C2D559BA34346298';
wwv_flow_imp.g_varchar2_table(169) := '8B2FAE07FA3A0DD3BD4E880B61121522C0C88EC2F497640ACCA81CF6AF12C0EFCA09400054CE103584944052CC3B0F74B51B7A9F13C3BBCF9EB84637454FD63013128A12E0F5137FFBDE65690FB9AFBD99F836D1A21528B0B33619A78844C2F228114946';
wwv_flow_imp.g_varchar2_table(170) := 'C014700126049C4024E0FEC13D10708C008F4E1CE9EFA4A8649DC2C8E8287DE3D498633604B5E26F5F98A45B268FFDDDDD6D2CBE54E0221B1D2AD85758FFA2F8FD78CA9A5720885F151290080044BE42B6281E0202CDF5B5D4D264FC78601EE6FDFEA9AB';
wwv_flow_imp.g_varchar2_table(171) := '747E3215021AF6B8787A7C85BE73FC92E81C1B2F10DDD5D5416D8A7C47843D5E2B5A0BAB5C454D8359951388185781C81BB3410A08DC2570C8E411B473B3B3F4D513B7EF16C0962181544EA7BF3E3346E3D3F22F551AECEFA2A886739421C88027C03D7B';
wwv_flow_imp.g_varchar2_table(172) := '084804803D0DA01695096094C78EE8F4B5D4526F5B8B6155FCC52F2F9EBC84A7031A12BA9B706274899E3B71E9EE8E225BED4D0DD48EDE7F1132D80502A5118000288D57C072A30765474063A2277A684F9F64B9175126B54C5F7A7BC88EE6025B077FE3';
wwv_flow_imp.g_varchar2_table(173) := 'DF5F9CB84599E525431F13B118DDB7BF5FCADAB03012B611F06B07609B1B785B36010880B2D1A12008DC25D0D558437B7AE5B7A41DBF38442F5E9FBF5B085B5B08BC31BC486F9EBDBE65DFF637BBFBBAA8BBA96EFB6EBC2F8B003A0065610B5021088000';
wwv_flow_imp.g_varchar2_table(174) := '05D37957DCEF316CB4B8B1E1BC97E5B4C01FA4FBF7F65242F2E0975C7A999E79F32AE1CEAF9D84A79673F4676F5EA66CC678B1644D224E074DBE8E7967CDD8133402F0C73E027CDEB2AF36D4147002EEF718365ADCD85017716D32410707FAA4065EBC76';
wwv_flow_imp.g_varchar2_table(175) := '93BE7941BEC04D5A4140138FDD98A3CB3786A5DEDD2386FE9BAA13D23C48040110B04E0002C03A2BE4F403018F470A067B5A896F0D3442A5EB79FAF26B176829637C8B9B51D9A0EEE747FEFED7B7AE505EF254BCA6C6063AD0D31E5404F0CB320164B493';
wwv_flow_imp.g_varchar2_table(176) := '0004809D345197010117AFCA1E8F14246311BAFFC000699AB121636377E8CF4F1B7FC18D01C4C0EEFEFB0B9374FBB6F1C392A291083DB00F0BFF027B00C031CF08400078863E4C0D1B5F0C8348A1B7A581764B1704EAF4D5D7CED1D05C2688EE97E4133F';
wwv_flow_imp.g_varchar2_table(177) := 'F4E7AFDE3C47B97CCEB05C6F5707F5B560E19F21A01025C0557B094000D8CB13B58100B1DCB97FA09BA2D1D8361A77474296E767E8FF7AFE62A81704F26D7F9F7FE532CDCCCD6FE374F76D3216A5FBF7F6DCDD812D100001DB084000D886121581C05D02';
wwv_flow_imp.g_varchar2_table(178) := '75D549DAB7E309812C0DEEE63975F12A7DED4C78A702BEF6C11D3A7D497EDBDF1131F4DF5885857F778F9A306FC177BB09782C00EEF688EC760CF58180D7048EF67751636D8DA119BAAED31FBF7C862E4E19DFFA6658D8E709C74797E82FDFBA2086FE8D';
wwv_flow_imp.g_varchar2_table(179) := '1743D6D6D5D37E2CFCF379A461BECA043C16005B7B442A83826D0A11F0896EAC8D476870EF2ED234E3E37C797E96FEC3B12B94CEF9C4291B0E03BE03E2F32F5FA4D9D959C3DA34D2C4D07F2F25A31E9FA20C2D4482DB04D09EFD0402FCE90ACF09D5FEC3';
wwv_flow_imp.g_varchar2_table(180) := '42F11A35C5EDDB645E7F5B13F574746CDAB373F3E4053115707A7C6782E77B9CF90C3DF3FE289DBB267F2C726F7727ED6E6FF29C000C00812013285D0038734E708071095709DFF8E4002654E928814454A3BED67A691BFC95C15F7CEE387D7067599ACF';
wwv_flow_imp.g_varchar2_table(181) := 'FDC4123E43168D7B676491BEF9F679D3C58F9D4DF514B1BF798B56229B7A0402649142D79BD20540103F9441F429409F17BFBB2266024C5DC86533F4FBC72E12AF8C37CDECD30C3CF4FF7B2F5DA0F9F905530F629A426749536B9101044A20A0D0F5A674';
wwv_flow_imp.g_varchar2_table(182) := '0150829FC80A026126C08BFC3EB872935EFFF0B2250CA745DEBF3A7387827AE9FBC23BC3746568C4128B77CF5DA19382473EA8302C5140A67502F8EB0C01080067B8A2D69013C8E772F4F6F9EB74FADAB0E970F73AAAC254C04B1FD0C931D5A602D62D2C';
wwv_flow_imp.g_varchar2_table(183) := 'FFEF7BB797E85B6F7E285818AFFADF5C7B5ED7E98C60F7FEC56B94CE592BB3B9BCBDDB5021F6F2446DAA108000502512B023300432D92C1DFBE0225D1E1E2BB9379F4BADD07F3976816653C64FC6F31B281EFAFFBFBFFB012DA5D2259B7EFEE618BDF1C1';
wwv_flow_imp.g_varchar2_table(184) := '054A65BC7C6AA24263B625130C4201F8E014010800A7C8A2DE5012989C5FA2E7DF3D432393C6B7B849C188CEE689CB43F4B5F7472808C3DFA2234F9F7FED3ADD1C2DFF2E875B82E50BC7CFD1CC42F04646A4C782CA89E23855D93CD8668D000480354EC8';
wwv_flow_imp.g_varchar2_table(185) := '0502A6042666E7E9D55317687A71C534AF6186B5CEE69F1DFB80BE7F79DA309B5F12FEFAEC243DFBCE79616E65578C9985257AF9E459BA3D6DFCD860D108FEBB4560ED3875A339B4E11C010800E7D8A2E61011B83E3A412F1C3F4B0B2BF63CD54FCFE7E8';
wwv_flow_imp.g_varchar2_table(186) := '77BFF31EBD3BB2E85B8A1F8C2DD17F7EEE3865C594881D4E2CAE64E88727CFD1D058781F9F6C0747D40102EB042000D649E02F08944180FBB51FDC18A537CF5EA19CA5317B8D62F52D146FEAA0684D83B4C5D9C565FADDE7CFD0F5D9D2E7CEA515BB9038';
wwv_flow_imp.g_varchar2_table(187) := 'B99CA5DFFAD6095A5A968F8668D19860D149B1BA264B566572797AF5CC653A7DFDB69822F17A71A0259391A9220228EC2401080027E9A2EE4013E08BD1F10BD7E9F4E5EB962EFE9AA651BCB18D12AD3DE2A2D74189966EE20BA00C122F24FCC2AB5768C6';
wwv_flow_imp.g_varchar2_table(188) := '478B0279D1DF6FFDFD191A9B90F7D4D9F764E76EC1A29D12ADBD85BF3216EB697C7BE5A9CB37E8C4E55B94CD0567B1E4BA7FF81B1602DC7DF0D65708006FF9A3759F12584EA5E94DD1133D7F739478A19B991B9A16A1445B1FC59B3B37B26AB1B8B8F0F5';
wwv_flow_imp.g_varchar2_table(189) := '9026D2367616D978F183CBF495F76E51C6D20843910A5CDCC55F69F09F5EBF41EF5F923FEA974D4A0821144954F1269126C451532725DB77894D6BA7A5733746E8F5D3972893F5F20E0152EA4753CA9ACA8D09760DDE47CBDA272DD85180772050128139';
wwv_flow_imp.g_varchar2_table(190) := '3134FFE2C98B34343E65A95C842FF41DFD14AD6DDC919FA701620DAD3BF66FDEC13DDEAFBEF2013D7F7966F36E25B7FFFEFC047DF3CD33A6B6C51BDA887DDF9E9119254A1001372766E8C51317687A61697B55A17CEF7D9F3294D87DEB74410078AF437C';
wwv_flow_imp.g_varchar2_table(191) := 'CB0F86878CC0D8F41C3DFFDE199AB1F0385B4613892729D1B99BA2D575FCB6E82BCEEB0124E95C8845C0EF7DEF38BD3DACEEA2C0E3B717E9FFF9F67B943719A98824AA69F34808FBB7F915ADA9A7AA9E7DC4EC36EF37DA9E985DA0D74E5DA0910AEF10C0';
wwv_flow_imp.g_varchar2_table(192) := '79D088B057FBD1AED3040A0200AAD169CCA83F08046E8D4DD04B27CED34AC6DABC335FF493DD162E6462F89BA70722B18414D3ACE8E5FE87EF9DA06B33EA2D0A9C58CAD2BFFDFFDEA195B4DC369EF7E7A17F31CE2FF55513C289D707141B252856707639';
wwv_flow_imp.g_varchar2_table(193) := '45AF9D3C47372D8ECA14AB03E7C16254B02FC8040A0220C80EC23710B04CC0F00AA0D387D787E995D3972997B7B6F29C2F5CC98E01D222D63E627C618C377798E6BF3E36457F704C0C79AF581321967DAF20237F81D1BFFEF6191A9F31BF479F17414692';
wwv_flow_imp.g_varchar2_table(194) := 'D5965AE33512C9B6BEB53B04CCFBE7FCC8E01F9EBA48676F8E59AA3FF0990C8F677F780E2B9D2760EDECE4BC1D680104BC2750E41AC32BFDDFBF709D4E5CBE69F9B1BE89E62E4A8A397FB35EEE7687A3B54D146B6CDFBE7BC7FB573FBC465F7E678852BC';
wwv_flow_imp.g_varchar2_table(195) := 'E26E47AA644711FF24B92D25B10D7FF4FA354B8BFEF8F6C79898FBB754F17A2621A0787424D1D229709A3BC0D7BC1317AFD13B226679DD9A585B6F2A707FCD7105CE6538541A010880D27821778808A433597AFBC34B967B94DC8BE7E1ED58635BD994E2';
wwv_flow_imp.g_varchar2_table(196) := '0DAD14ADAE372DFF17AF9DA12FBF3D44CB19EB1739FEB0F35A0279E5D6AF1A8BA2ED2FBF7B8BFEFAADB3F22A456AB4AA9612ADDD62ABBCFF2C1C12BC38301A33AD80EFCAB8787394DEFCF02A6533F22909D3CA90C1230268D60D027C4E70A31DB40102BE';
wwv_flow_imp.g_varchar2_table(197) := '2230B7B442CFBDF7215DBF63ED71BCAB17FF5EE25E6E458E6A114AB4F791168B4BABE10BF9332F9FA27FF7FDF37463364D26EBEE0A75691A513E2B993A1057CE5844642AE436FEC56D8D2F66E9B7BF7B969E79F104992EFA8B2528DEDA232A34AF5B6432';
wwv_flow_imp.g_varchar2_table(198) := 'FCCFD32ACC261297AF9558AFE0DAE8043DFFFE059A5FB6E7E98CEBF5E22F0804850004405022093F6C2330323547AF9C3C4FFC243E2B9572EFB6AA7B2FF1EA752BF9CDF2689128F1DCB726C40099FCF033027EE1CF8ED117DFB8462F5C9AA00BE38B34B5';
wwv_flow_imp.g_varchar2_table(199) := '94A1F1C5F4A6578626C4FB8898C4585E317E325F2E97A75C3643F3A99C28BBB58EDBF3293A7B67819EBB304E9F7FE512FDFC975EA457CE5C35B18E48D3344AB4F552249E243B7EA2557554D5B39FA2C91A4BD54DCD2FD24BEF9FA5F199394BF991490D02';
wwv_flow_imp.g_varchar2_table(200) := 'B0C21D0211779A412B20E00F0237458FFFCD339768568C0058B13826E6ED798E5A13BD5C2BF9ADE6898821F3B8C52173B6F5CBC74ED36FFDD51BF4F37FFA227DFAF3DFA37FF007DFDFF4FA1E7D46BC7FE877BE4D3C726064032FA2FBB93F7D899EF8BDEF';
wwv_flow_imp.g_varchar2_table(201) := '88B25BEBF8F1FFFC1CFDD32FBD44FFE66FDEA4AFBF7E8EA616ADF4AA358A357510FB62D46659FB85302ADC5A69F228E5F5BAE7C508C0CBA72ED2AD3B53EBBBF0170440401080001010F01F0498C0D91B23F4CA071768396DEDC9723CDCCFBD5BB3E17AAE';
wwv_flow_imp.g_varchar2_table(202) := 'BB9C57ACAE598C2A34945354F4F569C7AB948A7831DDE6572965D7F3C66A1B286E6151E37AFE52FE6A914861A125C7C04A395ECFF1C3D397E8EC10EE10B0C2AB9C3C5A39858A96C14EB7084000B8451AED284B209FCF15BECCC7CAE36BD9094DD32829E6';
wwv_flow_imp.g_varchar2_table(203) := 'E979C19F18E3E65D8EBD5860F0DCB7630D1855CC577FA3340BFBA3D575146FE9B690B3B22C1C83B81865B0524B5ED7E9E4A5EBF4EEB92B94B5783BA7531735A7EAB5C2C1A93C151E324E99857A2504229234248140E00964C59CF76B1F5EA52B23E3967C';
wwv_flow_imp.g_varchar2_table(204) := 'D578F8B97D17F12D7B960A5498498B4429D1D2457C4125377F2AB8424592359468ED252D1A73C5621600FCB2D2188B800BC3E30511B092C99A1671EAA2E654BDA60EF920034C748F0004807BACD1926204E69779A5FF591A1A937F6BDDBAD97C314E76ED';
wwv_flow_imp.g_varchar2_table(205) := '26B77BE4BCBE20D931E07ABBEB7E97F23756DB48559DBB4933B98BA1943AADE46501C00B31F97B17ACE4BF727B925E3A7E961657709BA0155EC8134C021000C18C2BBC3221303A3D4B2FBF7F8EA617964D72AE26F32AF664D71EE2DEEDEA1E977F6BDAEA';
wwv_flow_imp.g_varchar2_table(206) := 'B483180D6021E272EBA6CD716F3FDEDC5958F14F627EDEB4800319383609164A62FAC14AF5530B4BF4FDF73EA489797C9190155EEEE4412B6E1288B8D9D86A5B18FC5AE58006A494880000100049444154DF5E11189998A6D74F5FA2B9652B2BD9490CBF';
wwv_flow_imp.g_varchar2_table(207) := 'D753B27B2F4512555E99BCDAAE16217E204EB2A35FD8524DAAFC44AB6A89EFCF2F2CF813367A6917C728D1D627625667C98CE59514BDF2FE591A9E50FF9B162D39844C205002010F0480568279C80A02F612B87073948E9DBA48CB69F3F95F6E39DED846';
wwv_flow_imp.g_varchar2_table(208) := 'C98E5DA452AF9B6FABE36FCBE3FBE113AD3D85870F45AB6A0A366A9A739F2F4DD3488BC60B17575E7DCF0B14AB7A0F108F8CF0FDF9CC4B8597168D51B27380387656EC59CE64E9E59317E8E2AD512BD991C74102A8DA5D021E0800771D446B20C0047279';
wwv_flow_imp.g_varchar2_table(209) := '9DDEB93844C72FDE205E08C6FB642F4D0C63C79B3A28DED449E464AFB6820131EEED162EC42DDDA207DE4F3C4AC11763BEF8F128C1FAAB4A4C5DF03ECEAB691AC97E380F0B0BFE26BEF5F2AB7F07C44575B7780D105FF8796122DFA6C85323B2FABC4BD3';
wwv_flow_imp.g_varchar2_table(210) := '0AB16381A469729F576D14C7C7F9EB74F2CA4DCAE6244F4B5CCD8CDF2010080210008108239C9011E0D5DE6F9C163DBCA1118B17FF28C55B7AC405A483C8D2C583CAFFD1CA2FBA5152D8C8BD5EBE18F33C78B4BABEB06090172BF28B470C785FBCB19D78';
wwv_flow_imp.g_varchar2_table(211) := '41E146B96D1BEBA287854554CCA373D9BBAFFAC2037D384D13A300E4A428DA6657D96F35AD303AC28245B368EF996BC374FCC2754ACB1E995CB6412828278054B7094000B84D1CEDB94A606969B9F058DF1BE3D6E678F9229AECDA4DB1BA2657ED74A531';
wwv_flow_imp.g_varchar2_table(212) := '31AA41FC9234A6E7AC4D8D48AA502E896FD94C76EFA188C5A7355E1A19A7974F9C235E1FA09C333008046C24000160234C54A516813B33F3F49DF7CED1F8EC8225C3B8D7CB43E591843A0BEC2C196E3193A669A4699A3CB72A5FA15BC1D448310739A6AB';
wwv_flow_imp.g_varchar2_table(213) := 'B1AD2A96BC631F1F333F38719E6E4F5A138E3B2AC08E9209A080FB042000DC678E161D26901717B1ABB746E998E8C5A5D2D6EEF3E62FF2E1796FD910B9C366A3FACD044C74CAE6AC56B7B57892925D7B2992B426F0F8CBA05E3F7389CE0DDDA69CC52707';
wwv_flow_imp.g_varchar2_table(214) := '5AB5A5D47C0EE028D504E40F20010880000635282E712750D3AC1FA2FC453753B373F4C2BB1FD21BE7C53C6E2E6F018556582D9EEC18B0901759FC4E80D739B0D08B56D75B726525932B2C1C7D598C064CCECC4ABF4C697B85BA10A27AE11B19B6A794FE';
wwv_flow_imp.g_varchar2_table(215) := '9E3F0BA597F25309D8EA0501EB67572FAC439BA12690CBF1698F5F720CBAAED3F4FC22BDFEE115FAEEBB67697C6E515E60536AA2A593E2CD5D9BF66033E804B448B4703743BCA983348B0273745A08CBF7CFD3DBE7AED2DCA2B5E38BBF80286B4984127E';
wwv_flow_imp.g_varchar2_table(216) := '40C0130210009E6047A35608F050FEADC9799A5EC9D24C3A47D3A9BC78E568623145B7A766E9B218E63F75F11ABD71EA2CBD7CE22C5D1F9DB0526D218FB676AF383F58A7B003BF4247800540A284673C64F33A5D1E19A797DE3F473F7CFF0C7D70E91A5D';
wwv_flow_imp.g_varchar2_table(217) := '1D1EA3E1C959714CA6693695A319718CCEA7F3B492CDD1B589795A585E091DD7721C4619170814E94B4100B8C01D4D9447807BF66F7E78999E7FEF437AEEDD73F4FC71F112DBCFBF7B865E3A7181DE12C3FCA787C60A27DA252110ACB6C273C049FE421F';
wwv_flow_imp.g_varchar2_table(218) := '8BC3C056EB453EFF11E0A980A498FE8924AC2D0E640F1752591A9A5AA00F6E8CD11BE7AED1B15317888FC9EF89D1A7E7C431CAA350DF7AF30C9DBA709532990C17C10B04BC27506421090480F76181051202BCF82AB3B24C99E505CA2CCD53667989F2D9';
wwv_flow_imp.g_varchar2_table(219) := '8C988BB532BFBFB3E2D58B7F7FE19EF69DA9D813460291AA1A4A08411829F3EE0F3D9F17C7649AB22B8BB47A8C2E5036B55CF6311ABE18C063AF08400078453E44ED16119EAE7BCF73BDFC6535FC543CCDE56FAA73DD59345832017EFE037F9B60E16149';
wwv_flow_imp.g_varchar2_table(220) := '16D70594DC080A808062042000140B4810CD2932F5B4E6A63BD2804FEE7C0F389FDC29D42777E6CDAF35FCDBFF301B7E6DDF1F96F79A462C12F9C981561F1A54119A489428CCBC69F507BFBD230001E01D7BB4CC04746379C0C995BC344D2BDCE2C75F9C';
wwv_flow_imp.g_varchar2_table(221) := '13A9AAADA4AA6094153C648EF0C2481E2991E509435AB4B691923DFB28DED04A9A26114C15C288C413A445A315D682E220503E010880F2D9A164A504348D22F124D9FDA34563C42BBCAB770D52E1163FF4B2EE22E65EE7DD775BB6780E5CC3F4488109DF';
wwv_flow_imp.g_varchar2_table(222) := '2A186FE9A6AADE83C45F90C4C75421C1C65F5A2C491A7FAF828D75FAAF2A58EC250108002FE9A36DE2DE9616A9FC30D4348D584CC41BDA881FF4C202802295D74B01FB89D53614F548D322146B6821121C093F1B045810F1370A263BFA378480A6D9332A';
wwv_flow_imp.g_varchar2_table(223) := '50F8BE099BEADA30181B20500201E7CE90CE8DEC96E01EB2AA4E80BF6D2ED1B68BF864C8F3AE9AA6896B90C94BF462396F540CEB73EF2CD1DA2B866CF78BDEDA018AB774512461FD962ED5F9D86D5FE18B71DA997733F11D1111310C1DE321EFCE018A94';
wwv_flow_imp.g_varchar2_table(224) := 'B90ADE6E1B55AC8FBF6531D1DA43D5BB0E158E35DEE6632F2A8E4116092C6235CDECB88DD0066FBEF5509455D157376DAAB42DADD20A0CCB87E302E69C00702E32862143823F09F073F8136D7D54D57790AA078E9ABFFA070B79935D7B68F5442C2E660E';
wwv_flow_imp.g_varchar2_table(225) := '4C25F893A6B9D53CEAC20BDDAABAF709D17470F516385C8CCCC1157268E2229E24BEF8F3B1C7C76075DF21AAEE3F42A6C7AEC8C3530A0921C0F89827FC544CC0B9CB74382E60CE09808A43EB4405CE1D2E4E588B3A4100044020B804E099D704422600C2';
wwv_flow_imp.g_varchar2_table(226) := 'A1EABC3EA8D03E088000088080FA04422600D40F082C04011000813010808FDE138000F03E06B000044000044000045C270001E03A72340802200002612700FF55200001A04214600308F8900056D4F8306830190436118000D804039B200002D609E09E';
wwv_flow_imp.g_varchar2_table(227) := '1AEBAC90732B01BC53830004801A71801520A03401F4F6950E0F8C0381B208400094850D8540205C04D0DB0F57BC9DF516B5AB420002409548C00E1000011000011070910004808BB0D11408800008849D00FC57870004803AB1802520000220E032014C';
wwv_flow_imp.g_varchar2_table(228) := 'EEB80C5CA9E62000940A078C01011F10C035C30741B26AA2DBCB3BADDA857C6E108000708332DA00812011C0352348D1842F2E1250EDA30301E062F0D11408800008849940D87D576DF00C0220EC4724FC07014F09A8764AF414868F1A47DC7C142C4353';
wwv_flow_imp.g_varchar2_table(229) := '21000CD120010440C07902AA0D8A3AEF71305A28276EC1F03C485E400004299AF005044000044000042C128000B0080AD9400004400004CA278092EA118000502F26B00804400004B610C080FB161C7863130108009B40A21A10000110708A80FF97DC39';
wwv_flow_imp.g_varchar2_table(230) := '4506F556420002A0127A280B022000022000023E250001E0D3C0C16C10000110F00B01D8A92601A50400E6B9D43C4860150880000880809F09149F44524A001437D1CFD0C36C3BA219E6E8C37710B84B005BDE1328DEBD564A00780F0916D847A0F80167';
wwv_flow_imp.g_varchar2_table(231) := '5FFDA8090440000440A01202100095D04359100001100001290124AA4B000240DDD8C03210000110000110708C0004806368513108800008849D80CAFE639D120480CAC7276C030110000110708800D6294100387468A15A100001107084808F3AAE8EF8';
wwv_flow_imp.g_varchar2_table(232) := '8F4A6D230001601B4A5404022000022E1040C7D505C8E1680202201C71869720000220E032017F3417663D0501E08F631456820008800008384060EB8CCAD6770E34A7549510004A8503C680000880403008F8D38B708D074000F8F32885D52000022000';
wwv_flow_imp.g_varchar2_table(233) := '022050110108808AF0A130088040E008846B14D8A1F0A15A3F108000F0439460230880807B04C2350AEC1E57B4A41C010880924382EE41C9C850000440205404E0AC3F084000941C27740F4A468602200002200002CA118000502E2430080440C0FF04C2';
wwv_flow_imp.g_varchar2_table(234) := '3C52E8FFE885C5030880B0441A7E82808204823B9EA69E67EA59A4E0011932932000421670AFDDC549C8EB08A8D53EFAC9EEC5C32DD6EE7984962A250001502941942F8940E84E420E390C2155D26187CC200002450840001481825D20601B0187AED40E';
wwv_flow_imp.g_varchar2_table(235) := 'E90ADBDC4645612500BFFD440002C04FD182AD2000022000022060130108009B40A21A10000110083B01F8EF2F021000FE8A17AC05011000011000015B084000D88211958000088040D809C07FBF118000F05BC4602F08800008800008D8400002C00688';
wwv_flow_imp.g_varchar2_table(236) := 'A80204400004C24E00FEFB8F000480FF62068B41000440000440A06202100015234405200002560838F448042B4D238FE304D0801F094000F8316AB019047C48000F2FF261D06072A0094000043ABC700E044000049C278016FC490002C09F7183D52000';
wwv_flow_imp.g_varchar2_table(237) := '022000022050110108808AF0A13008800008849DC0BAFF98E45927E197BF10007E8914EC2C81004E4425C0425610B089009679DA04D2B56A20005C438D86DC238013917BACD152D809C07FFF128000F06FEC603908800008800008944D0002A06C74A515';
wwv_flow_imp.g_varchar2_table(238) := '449FB4345EC80D0220E00702B0D1CF0420005C8A1E66A55D028D664000044000042C118000B084099940000488206371146C2580773612F0E0E305016063FC501508049B0026B2821D5F78E729010F3E5E10009E461C8D830008B845C083F3AB5BAE55D8';
wwv_flow_imp.g_varchar2_table(239) := '4EB95DCF0A9B4571CF094000781E0218000220E006015CE68C28431A199109FA7E0880A04718FE8100088080030450A5FF094000F83F86F000044000044000044A260001503232140001100081B01380FF41200001108428C287F2096062B87C76280902';
wwv_flow_imp.g_varchar2_table(240) := '20E06B021000BE0E1F8CAF9800D63F558C1015848F003C0E0601088060C4115E8000088000088040490420004AC285CC200002AA11287B1007D33F658612C582420002202891841F20105202655FC7CB560E21050DB703470002207021854320000220E0';
wwv_flow_imp.g_varchar2_table(241) := '1C01D41C1C021000C189253C0101100001100001CB0420002CA3424610000110083B01F81F24021000418A267C01011000011000018B0420002C82423610000110083B01F81F2C021000C18A27BC01011000011000014B0420002C61422610000110083B';
wwv_flow_imp.g_varchar2_table(242) := '01F81F34021000418B28FC0101100081C01128FB690F812361A743100076D2445D20000220105002DEBA85A73639C11F02C009AAA8130440000440000414270001A07880601E08800008784F0016049100044010A30A9F40000440000440C08400048009';
wwv_flow_imp.g_varchar2_table(243) := '20248300088040D809C0FF6012800008665C4BF00AAB6B4B8085AC200002201018021000810965B98E60756DB9E4500E04C241005E069500044050230BBF40000440C00102E8323800D5A32A21003C028F6641000440C00F04B6DB8849C3ED44FCFB1E02';
wwv_flow_imp.g_varchar2_table(244) := 'C0BFB183E52000022000024E1308B0E2810070FAE041FD20000220E05B02309C7C3DE761A05ED6764300E0F8060110508FC0DA094A3DC3601108F88980817A59DB0D01E0A758C25610080B81B5135458DC55D54FD8A51601BB3F1610006AC517D6800008';
wwv_flow_imp.g_varchar2_table(245) := '80000880405102760F8C410014C58C9DFE2660F7C7A4421A8A9953A137281E1A027034E8042000821EE150FA67F7405985101533A7426F501C044020200420003C0F24BA879E870006800008EC20801DC1270001E0798CD13DF43C043000044000044248';
wwv_flow_imp.g_varchar2_table(246) := '000220844187CB20000220202780D430108000084394E123088000088000086C230001B00D08DE8200088040D809C0FF7010800008479CE125088000088000086C210001B005873A6FB034509D58C01210081701781B160210008A461A37072A1A189815';
wwv_flow_imp.g_varchar2_table(247) := '3C02F8B0052FA6F0C8120108004B989009044020B00430DCB625B478A33E01BB0E590800F5630D0B410004400004406083805D835610001B48B10102200002612700FFC3440002204CD186AF200AE95E2100000188494441540002200002205020A01304';
wwv_flow_imp.g_varchar2_table(248) := '4001047E81000880000880409808681000841F10000110709A805D93B64EDB89FA4345002300A10A379C05818011F0CB85D5AE65DB8E860F95878D000440D8220E7F4120480470610D5234E18BCB0420005C068EE640000440404502B0297C042000C217';
wwv_flow_imp.g_varchar2_table(249) := '73780C02200002200002580488630004400004400004C24840811100BFACE209E3E1019F410004400004824A40010180553CC13CB820EC82195778154402F0299C04141000E1041F7CAF1D1476D016C13F7CE021088080E30420001C478C066C27E0A0B6';
wwv_flow_imp.g_varchar2_table(250) := 'B0DD56540802CA1380816125000110D6C8C36F1000818A09408B568C101578480002C043F8681A0440C0DF0482301BE5EF08C0FA4A08400054424F5AB6C8A9A1C82E691548548F0062A85E4C601108804059042000CAC266A55091C1C122BBACD4843C0A';
wwv_flow_imp.g_varchar2_table(251) := '11085D0CA178143AFA1C300555869980BF044098CE4561F235CC9F40E57D0F9DE2513E22301004EC22E02F01607A2E0AD055D3D457BB0E01D4532010A043A7E00F7E81800502C8126E02FF3F000000FFFFC1AF869700000006494441540300A8AA2EB2C4';
wwv_flow_imp.g_varchar2_table(252) := '3A59BE0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(35178155439852510)
,p_file_name=>'icons/app-icon-512.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35169549760852379)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
,p_version_scn=>72037027
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35169897928852382)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>72037027
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35170126626852382)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
,p_version_scn=>72037027
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35170478389852384)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'background', 'default',
  'display_as', 'LIST',
  'map_preview', 'POPUP:ITEM',
  'match_mode', 'RELAX_HOUSE_NUMBER',
  'show_coordinates', 'N')).to_clob
,p_version_scn=>72037027
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35170733478852384)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>72037027
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35171013329852384)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>72037027
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35171382851852384)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>72037027
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35171660339852384)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>72037027
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35171957568852385)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>72037027
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35172225906852385)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>72037027
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35172564904852385)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>72037027
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35172850586852387)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>72037027
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35173101755852387)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>72037027
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(35173426361852389)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>72037027
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(35179401001852512)
,p_name=>'Administration Rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return true;'
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_version_scn=>72037115
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes/add_user
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(35431777471670996)
,p_process_sequence=>1
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Add User'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- create movie user ID',
'-- query movie_users table to check for existing user',
'-- if yes, return PK as user_id',
'-- if no, add new user to movie_users',
'declare',
'    l_user_id number;',
'begin',
'    select id into l_user_id from movie_users where username = :APP_USER;',
'',
'    :USER_ID := l_user_id;',
'',
'    exception',
'        when no_data_found then',
'        insert into movie_users',
'                (username)',
'            values',
'                (:APP_USER)',
'            returning',
'                id into :USER_ID;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_version_scn=>72374368
);
end;
/
prompt --application/shared_components/logic/application_items/user_id
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(35431513697654520)
,p_name=>'USER_ID'
,p_protection_level=>'I'
,p_version_scn=>72374162
);
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
prompt --application/pages/page_groups
begin
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(35179731847852515)
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
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(35174336902852395)
,p_name=>'Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(35174507582852396)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>1
);
end;
/
prompt --application/shared_components/navigation/breadcrumbentry
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
null;
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(35175208554852410)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'24.2'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4072363937200175119
,p_is_locked=>false
,p_current_theme_style_id=>2721322117358710262
,p_default_page_template=>4072355960268175073
,p_default_dialog_template=>2100407606326202693
,p_error_template=>2101157952850466385
,p_printer_friendly_template=>4072355960268175073
,p_login_template=>2101157952850466385
,p_default_button_template=>4072362960822175091
,p_default_region_template=>4072358936313175081
,p_default_chart_template=>4072358936313175081
,p_default_form_template=>4072358936313175081
,p_default_reportr_template=>4072358936313175081
,p_default_tabform_template=>4072358936313175081
,p_default_wizard_template=>4072358936313175081
,p_default_menur_template=>2531463326621247859
,p_default_listr_template=>4072358936313175081
,p_default_irr_template=>2100526641005906379
,p_default_report_template=>2538654340625403440
,p_default_label_template=>1609121967514267634
,p_default_menu_template=>4072363345357175094
,p_default_calendar_template=>4072363550766175095
,p_default_list_template=>4072361143931175087
,p_default_nav_list_template=>2526754704087354841
,p_default_top_nav_list_temp=>2526754704087354841
,p_default_side_nav_list_temp=>2467739217141810545
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>2126429139436695430
,p_default_dialogr_template=>4501440665235496320
,p_default_option_label=>1609121967514267634
,p_default_required_label=>1609122147107268652
,p_default_navbar_list_template=>2847543055748234966
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/24.2/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_options
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
prompt --application/shared_components/logic/build_options
begin
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(35173729037852390)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>72037027
);
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
prompt --application/shared_components/security/authentications/oracle_apex_accounts
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(35174053711852393)
,p_name=>'Oracle APEX Accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>72037029
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
wwv_flow_imp_page.create_page(
 p_id=>0
,p_name=>'Global Page'
,p_step_title=>'Global Page'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_page_component_map=>'14'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'SnoopyFilm'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':root {',
'    /* Updating movie title size to make it more prominent */',
'    --a-cv-title-font-size: 24px;',
'    --a-cv-title-line-height: 1.5;',
'}',
'',
'    /* Update default width of images */',
'    .a-CardView-items--row .has-media {',
'    grid-template-columns: minmax(32px,128px) minmax(0,var(--a-cv-icon-spacer,44px)) 1fr minmax(0,auto);',
'}'))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35187337317852571)
,p_plug_name=>'SnoopyFilm'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2674017834225413037
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35405236186955131)
,p_plug_name=>'Watchlist'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISTINCT ID,',
'        movie_id,',
'       user_id,',
'       watched_yn,',
'       watched,',
'       case when watched_yn = ''Y'' then ''Watched'' end as WATCHED_LABEL,',
'       case when watched_yn = ''Y''',
'            then ''Marked as watched '' || apex_util.get_since(watched)',
'            else ''Added to watchlist '' || apex_util.get_since(created)',
'            end as movie_status,',
'       title,',
'       poster_url,',
'       release_date,',
'       to_char(release_date, ''YYYY'') as release_year,',
'       floor( to_char(release_date, ''YYYY'') / 10) * 10 as decade,',
'       runtime,',
'       vote_average,',
'       created,',
'       to_char(created, ''MM/YYYY'') as created_on,',
'       created_by,',
'       updated,',
'       updated_by',
'  from watchlist',
' where user_id = :USER_ID'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(35405366330955132)
,p_region_id=>wwv_flow_imp.id(35405236186955131)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Release Year: &RELEASE_YEAR.',
'<br>',
'Rating: &VOTE_AVERAGE.'))
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'WATCHED_LABEL'
,p_badge_column_name=>'WATCHED_LABEL'
,p_media_adv_formatting=>false
,p_media_source_type=>'DYNAMIC_URL'
,p_media_url_column_name=>'POSTER_URL'
,p_media_display_position=>'BODY'
,p_media_sizing=>'FIT'
,p_pk1_column_name=>'ID'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(35405463773955133)
,p_card_id=>wwv_flow_imp.id(35405366330955132)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::P3_ID,P3_PREVIOUS_PAGE_ID:&MOVIE_ID.,1'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35406387068955142)
,p_plug_name=>'Get Started'
,p_title=>'Get Started'
,p_parent_plug_id=>wwv_flow_imp.id(35405236186955131)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<strong>Welcome to your Watchlist!</strong>',
'<br>',
'<br>',
'To search for movies and add them to your list, click on the <strong>Add a Movie</strong> button above.'))
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from watchlist',
' where user_id = :USER_ID'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35405572369955134)
,p_plug_name=>'Filter'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_02'
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(35405236186955131)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(34973072169057935)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(35187337317852571)
,p_button_name=>'ADD_MOVIE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Movie'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2::'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35405674192955135)
,p_name=>'P1_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35405572369955134)
,p_prompt=>'Search'
,p_source=>'TITLE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35405797204955136)
,p_name=>'P1_WATCHED_YN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35405572369955134)
,p_prompt=>'Watched'
,p_source=>'WATCHED_YN'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:Yes;Y,No;N'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35405863599955137)
,p_name=>'P1_DECADE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35405572369955134)
,p_prompt=>'Decade'
,p_source=>'DECADE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35405913650955138)
,p_name=>'P1_RUNTIME'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35405572369955134)
,p_prompt=>'Runtime'
,p_source=>'RUNTIME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_lov=>'STATIC2:Over 2 hours;120|,90 minutes to 2 hours;90|120,Less than 90 minutes;|90'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'manual_entry', 'N',
  'select_multiple', 'N')).to_clob
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(34973187702057936)
,p_name=>'Refresh on Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(34973072169057935)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosecanceldialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(34973241880057937)
,p_event_id=>wwv_flow_imp.id(34973187702057936)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_imp_page.create_page(
 p_id=>2
,p_name=>'Movie Search'
,p_alias=>'MOVIE-SEARCH'
,p_step_title=>'Movie Search'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Set posters to be the same size/ratio */',
'.a-CardView-media--square:before {',
'    padding-top: 150%; /* 2:3 ratio */',
'}',
'',
'/* set position of the Card badge */',
'.a-CardView-badge {',
'    position: absolute;',
'    top: 12px;',
'    right: 12px;',
'    margin: 0;',
'}',
'',
'/* style the movie rating under the movie title */',
'    .movie-rating {',
'    margin-top: 4px;',
'}',
'',
'/* style both the movie rating and the star icon under the movie title */',
'.movie-rating,',
'.movie-rating .fa {',
'    font-size: 12px;',
'    line-height: inherit;',
'    vertical-align: bottom;',
'    opacity: 0.75;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(34971767335057922)
,p_plug_name=>'Popular Movies'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(35252385959233917)
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ads.id,',
'       ads.adult,',
'       ads.title,',
'       ads.video,',
'       ads.overview,',
'       ads.popularity,',
'       ads.vote_count,',
'       ads.poster_path,',
'       ads.release_date,',
'       ads.vote_average,',
'       ads.backdrop_path,',
'       ads.original_title,',
'       ads.original_language,',
'       case when w.watched_yn = ''Y'' then ''Watched''',
'            when w.watched_yn = ''N'' then ''Added''',
'            end as badge_label,',
'       case when w.watched_yn = ''N'' then ''u-success''',
'            end as badge_color',
'  from #APEX$SOURCE_DATA# ads',
'LEFT OUTER JOIN',
'    -- doing inline select to limit rows to current user',
'    (select * from watchlist where user_id = :USER_ID) w',
'    ON w.movie_id = ads.ID',
'',
''))
,p_source_post_processing=>'SQL'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>true
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P2_SEARCH'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(34971835879057923)
,p_region_id=>wwv_flow_imp.id(34971767335057922)
,p_layout_type=>'GRID'
,p_grid_column_count=>5
,p_title_adv_formatting=>false
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="movie-rating">',
'<span aria-hidden="true" class="fa fa-star"></span> &VOTE_AVERAGE.</div>',
''))
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_badge_column_name=>'BADGE_LABEL'
,p_badge_css_classes=>'&BADGE_COLOR.'
,p_media_adv_formatting=>false
,p_media_source_type=>'STATIC_URL'
,p_media_url=>'https://image.tmdb.org/t/p/w500&POSTER_PATH.'
,p_media_display_position=>'FIRST'
,p_media_appearance=>'SQUARE'
,p_media_sizing=>'COVER'
,p_pk1_column_name=>'ID'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(35403976607955118)
,p_card_id=>wwv_flow_imp.id(34971835879057923)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::P3_ID,P3_PREVIOUS_PAGE_ID:&ID.,2'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(34973804623057943)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(35253043463233917)
,p_page_plug_id=>wwv_flow_imp.id(34971767335057922)
,p_value_type=>'DEFAULT'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(34973950379057944)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(35253423066233917)
,p_page_plug_id=>wwv_flow_imp.id(34971767335057922)
,p_value_type=>'DEFAULT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(34972164607057926)
,p_plug_name=>'Searched Movies'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>20
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(35257938512233921)
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ads.id,',
'       ads.adult,',
'       ads.title,',
'       ads.video,',
'       ads.overview,',
'       ads.popularity,',
'       ads.vote_count,',
'       ads.poster_path,',
'       ads.release_date,',
'       ads.vote_average,',
'       ads.backdrop_path,',
'       ads.original_title,',
'       ads.original_language,',
'       case when w.watched_yn = ''Y'' then ''Watched''',
'            when w.watched_yn = ''N'' then ''Added''',
'            end as badge_label,',
'       case when w.watched_yn = ''N'' then ''u-success''',
'            end as badge_color',
'  from #APEX$SOURCE_DATA# ads',
'LEFT OUTER JOIN',
'    -- doing inline select to limit rows to current user',
'    (select * from watchlist where user_id = :USER_ID) w',
'    ON w.movie_id = ads.ID'))
,p_source_post_processing=>'SQL'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows=>25
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2_SEARCH'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(34972439411057929)
,p_region_id=>wwv_flow_imp.id(34972164607057926)
,p_layout_type=>'GRID'
,p_grid_column_count=>5
,p_title_adv_formatting=>false
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="movie-rating">',
'<span aria-hidden="true" class="fa fa-star"></span> &VOTE_AVERAGE.</div>',
''))
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_badge_column_name=>'BADGE_LABEL'
,p_badge_css_classes=>'&BADGE_COLOR.'
,p_media_adv_formatting=>false
,p_media_source_type=>'STATIC_URL'
,p_media_url=>'https://image.tmdb.org/t/p/w500&POSTER_PATH.'
,p_media_display_position=>'FIRST'
,p_media_appearance=>'SQUARE'
,p_media_sizing=>'COVER'
,p_pk1_column_name=>'ID'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(34973544774057940)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(35259488429233923)
,p_page_plug_id=>wwv_flow_imp.id(34972164607057926)
,p_value_type=>'DEFAULT'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(34973682488057941)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(35258623341233923)
,p_page_plug_id=>wwv_flow_imp.id(34972164607057926)
,p_value_type=>'DEFAULT'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(34973749694057942)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(35259079602233923)
,p_page_plug_id=>wwv_flow_imp.id(34972164607057926)
,p_value_type=>'ITEM'
,p_value=>'P2_SEARCH'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(34974066894057945)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(35259488429233923)
,p_page_plug_id=>wwv_flow_imp.id(34972164607057926)
,p_value_type=>'DEFAULT'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(34974166920057946)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(35258623341233923)
,p_page_plug_id=>wwv_flow_imp.id(34972164607057926)
,p_value_type=>'DEFAULT'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(34974222580057947)
,p_page_id=>2
,p_web_src_param_id=>wwv_flow_imp.id(35259079602233923)
,p_page_plug_id=>wwv_flow_imp.id(34972164607057926)
,p_value_type=>'DEFAULT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(34972884718057933)
,p_plug_name=>'Search Bar'
,p_region_css_classes=>'padding-sm'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34972946185057934)
,p_name=>'P2_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(34972884718057933)
,p_prompt=>'Search'
,p_placeholder=>unistr('Search for a movie\2026')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:js-hidePasswordVisibility:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>'Movie Details'
,p_alias=>'MOVIE-DETAILS'
,p_page_mode=>'MODAL'
,p_step_title=>'Movie Details'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35384207287944478)
,p_plug_name=>'Movie Details'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(35247269302233910)
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(35384744721944495)
,p_page_id=>3
,p_web_src_param_id=>wwv_flow_imp.id(35247895971233912)
,p_page_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_value_type=>'ITEM'
,p_value=>'P3_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35399723452944543)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35403516117955114)
,p_plug_name=>'Header'
,p_title=>'Header'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc:t-CardsRegion--styleB'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>20
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(35247269302233910)
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'       title,',
'       ''https://image.tmdb.org/t/p/w500''||poster_path as poster_url,',
'       ''https://image.tmdb.org/t/p/w500''||backdrop_path as backdrop_url,',
'       release_date,',
'       runtime,',
'       trunc(runtime/60) || ''hr '' ||',
'            extract (minute from numtodsinterval((runtime/60), ''HOUR'' )) || ''min''',
'            as runtime_friendly,',
'       vote_average,',
'       tagline',
'  from #APEX$SOURCE_DATA#'))
,p_source_post_processing=>'SQL'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(35403640419955115)
,p_region_id=>wwv_flow_imp.id(35403516117955114)
,p_layout_type=>'ROW'
,p_component_css_classes=>'movie-header-card'
,p_title_adv_formatting=>false
,p_title_column_name=>'TITLE'
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="movie-details">',
'    <span title="Release Date">Released &RELEASE_DATE.</span> &middot;',
'    <span title="Runtime">&RUNTIME_FRIENDLY.</span> &middot;',
'    <span title="&VOTE_AVERAGE. out of 10"><span class="fa fa-star" aria-hidden="true"></span> &VOTE_AVERAGE.</span>',
'</div>'))
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'URL'
,p_icon_image_url=>'&POSTER_URL.'
,p_icon_css_classes=>'w100 h150'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_media_source_type=>'DYNAMIC_URL'
,p_media_url_column_name=>'BACKDROP_URL'
,p_media_display_position=>'BACKGROUND'
,p_media_sizing=>'COVER'
,p_pk1_column_name=>'ID'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(35403784559955116)
,p_page_id=>3
,p_web_src_param_id=>wwv_flow_imp.id(35247895971233912)
,p_page_plug_id=>wwv_flow_imp.id(35403516117955114)
,p_value_type=>'DEFAULT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35403815900955117)
,p_plug_name=>'Overview'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_source=>'&P3_OVERVIEW.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35406089702955139)
,p_plug_name=>'CAST'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h1'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>40
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(35239736722233900)
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows=>10
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(35406161218955140)
,p_region_id=>wwv_flow_imp.id(35406089702955139)
,p_layout_type=>'GRID'
,p_grid_column_count=>5
,p_title_adv_formatting=>false
,p_title_column_name=>'CHARACTER'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>false
,p_body_column_name=>'NAME'
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
,p_media_source_type=>'STATIC_URL'
,p_media_url=>'https://image.tmdb.org/t/p/w500&PROFILE_PATH.'
,p_media_display_position=>'FIRST'
,p_media_appearance=>'SQUARE'
,p_media_sizing=>'COVER'
,p_pk1_column_name=>'ID'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(35406245106955141)
,p_page_id=>3
,p_web_src_param_id=>wwv_flow_imp.id(35240372137233903)
,p_page_plug_id=>wwv_flow_imp.id(35406089702955139)
,p_value_type=>'ITEM'
,p_value=>'P3_ID'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35404598740955124)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(35399723452944543)
,p_button_name=>'Remove_From_Watch_list'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Remove From Watch List'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35404689750955125)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(35399723452944543)
,p_button_name=>'Mark_Watched'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'i''ve watched This'
,p_button_position=>'NEXT'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35404460805955123)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(35399723452944543)
,p_button_name=>'Add_to_Watch_List'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add To Watch List'
,p_button_position=>'NEXT'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35400124066944543)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(35399723452944543)
,p_button_name=>'Back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(35404942527955128)
,p_branch_name=>'redirect to previous page'
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35385088400944501)
,p_name=>'P3_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35385444151944517)
,p_name=>'P3_ADULT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'ADULT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35385830479944518)
,p_name=>'P3_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'TITLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35386289782944520)
,p_name=>'P3_VIDEO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'VIDEO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35386641412944521)
,p_name=>'P3_BUDGET'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'BUDGET'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35387015180944523)
,p_name=>'P3_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'STATUS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35387434223944525)
,p_name=>'P3_IMDB_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'IMDB_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35387812677944526)
,p_name=>'P3_REVENUE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'REVENUE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35388217367944526)
,p_name=>'P3_RUNTIME'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'RUNTIME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35388683032944528)
,p_name=>'P3_TAGLINE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'TAGLINE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35389032606944528)
,p_name=>'P3_HOMEPAGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'HOMEPAGE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35389420119944529)
,p_name=>'P3_OVERVIEW'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'OVERVIEW'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35389879269944531)
,p_name=>'P3_POPULARITY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'POPULARITY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35390277670944531)
,p_name=>'P3_VOTE_COUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'VOTE_COUNT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35390658270944531)
,p_name=>'P3_POSTER_PATH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'POSTER_PATH'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35391031126944531)
,p_name=>'P3_RELEASE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'RELEASE_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35391402173944532)
,p_name=>'P3_VOTE_AVERAGE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'VOTE_AVERAGE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35391891168944532)
,p_name=>'P3_BACKDROP_PATH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'BACKDROP_PATH'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35392202422944534)
,p_name=>'P3_ORIGINAL_TITLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'ORIGINAL_TITLE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35392665050944534)
,p_name=>'P3_ORIGINAL_LANGUAGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'ORIGINAL_LANGUAGE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35393028036944534)
,p_name=>'P3_BELONGS_TO_COLLECTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_item_source_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_source=>'BELONGS_TO_COLLECTION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35405014429955129)
,p_name=>'P3_PREVIOUS_PAGE_ID'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(35384207287944478)
,p_prompt=>'Previous Page Id'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35401966585944551)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Add Movie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into watchlist',
'    (',
'        movie_id,',
'        user_id,',
'        watched_yn,',
'        title,',
'        poster_url,',
'        release_date,',
'        runtime,',
'        vote_average',
'    )',
'values',
'    (',
'        :P3_ID,',
'        :USER_ID,',
'        ''N'',',
'        :P3_TITLE,',
'        ''https://image.tmdb.org/t/p/w500''||:P3_POSTER_PATH,',
'        :P3_RELEASE_DATE,',
'        :P3_RUNTIME,',
'        :P3_VOTE_AVERAGE',
'    );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35404460805955123)
,p_internal_uid=>35401966585944551
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35404778089955126)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Remove Movie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from watchlist',
' where movie_id = :P3_ID',
'   and user_id = :USER_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35404598740955124)
,p_internal_uid=>35404778089955126
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35404888378955127)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'update Movie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update watchlist',
'   set watched_yn = ''Y'',',
'       watched = SYSDATE',
' where movie_id = :P3_ID',
'   and user_id = :USER_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35404689750955125)
,p_internal_uid=>35404888378955127
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35405187419955130)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'New'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35400124066944543)
,p_internal_uid=>35405187419955130
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35401503138944551)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(35384207287944478)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Movie Details'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35401503138944551
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_imp_page.create_page(
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'SnoopyFilm - Log In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2101157952850466385
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35180342663852531)
,p_plug_name=>'SnoopyFilm'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2674157997338192145
,p_plug_display_sequence=>10
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35182094601852553)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(35180342663852531)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'NEXT'
,p_button_alignment=>'LEFT'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35180801390852548)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35180342663852531)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="username"'
,p_label_alignment=>'RIGHT'
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35181234268852550)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35180342663852531)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="current-password"'
,p_label_alignment=>'RIGHT'
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35181674326852551)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(35180342663852531)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', '',
  'unchecked_value', '',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35184287284852559)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Set Username Cookie'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_AUTHENTICATION'
,p_attribute_04=>'SEND_LOGIN_USERNAME_COOKIE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35184287284852559
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(35184712766852559)
,p_page_process_id=>wwv_flow_imp.id(35184287284852559)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'lower( :P9999_USERNAME )'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(35185255887852560)
,p_page_process_id=>wwv_flow_imp.id(35184287284852559)
,p_page_id=>9999
,p_name=>'p_consent'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_REMEMBER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35182385550852554)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Login'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_AUTHENTICATION'
,p_attribute_04=>'LOGIN'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35182385550852554
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(35182817850852557)
,p_page_process_id=>wwv_flow_imp.id(35182385550852554)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'ITEM'
,p_value=>'P9999_USERNAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(35183359743852559)
,p_page_process_id=>wwv_flow_imp.id(35182385550852554)
,p_page_id=>9999
,p_name=>'p_password'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_PASSWORD'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(35183819005852559)
,p_page_process_id=>wwv_flow_imp.id(35182385550852554)
,p_page_id=>9999
,p_name=>'p_set_persistent_auth'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>3
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35186166216852560)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35186166216852560
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35185757607852560)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>35185757607852560
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(35454923795517278)
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
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
