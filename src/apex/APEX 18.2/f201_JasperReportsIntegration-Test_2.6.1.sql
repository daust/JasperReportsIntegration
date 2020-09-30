prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_180200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2018.05.24'
,p_release=>'18.2.0.00.12'
,p_default_workspace_id=>1642578097982918
,p_default_application_id=>201
,p_default_owner=>'JRI_TEST'
);
end;
/
 
prompt APPLICATION 201 - Jasper Reports Integration Test (v2.6.1)
--
-- Application Export:
--   Application:     201
--   Name:            Jasper Reports Integration Test (v2.6.1)
--   Date and Time:   13:33 Wednesday September 30, 2020
--   Exported By:     ADMIN
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         18.2.0.00.12
--   Instance ID:     270101937255479
--

-- Application Statistics:
--   Pages:                      8
--     Items:                   26
--     Processes:                8
--     Regions:                 31
--     Buttons:                  6
--   Shared Components:
--     Logic:
--       Items:                  2
--       Processes:              3
--       Build Options:          2
--     Navigation:
--       Tab Sets:               1
--         Tabs:                 5
--       Lists:                  1
--       Breadcrumbs:            1
--         Entries:              6
--       NavBar Entries:         1
--     Security:
--       Authentication:         3
--     User Interface:
--       Themes:                 2
--       Templates:
--         Page:                24
--         Region:              51
--         Label:               10
--         List:                34
--         Popup LOV:            2
--         Calendar:             6
--         Breadcrumb:           4
--         Button:              11
--         Report:              17
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
,p_display_id=>nvl(wwv_flow_application_install.get_application_id,201)
,p_owner=>nvl(wwv_flow_application_install.get_schema,'JRI_TEST')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Jasper Reports Integration Test (v2.6.1)')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'DUMMY')
,p_page_view_logging=>'YES'
,p_checksum_salt_last_reset=>'20200930133154'
,p_bookmark_checksum_function=>'MD5'
,p_max_session_length_sec=>28800
,p_compatibility_mode=>'5.1'
,p_html_escaping_mode=>'B'
,p_flow_language=>'de'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(56538027943997553)
,p_populate_roles=>'A'
,p_logout_url=>'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&amp;p_next_flow_page_sess=&APP_ID.:1'
,p_application_tab_set=>1
,p_logo_image=>'TEXT:JasperReportsIntegration - Test (v#APP_VERSION#)'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'2.6.1'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>unistr('Diese Anwendung ist aktuell nicht verf\00FCgbar.')
,p_exact_substitutions_only=>'Y'
,p_deep_linking=>'Y'
,p_runtime_api_usage=>'T:O:W'
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'P'
,p_substitution_string_01=>'G_PROTOCOL'
,p_substitution_value_01=>'http'
,p_substitution_string_02=>'G_SERVER'
,p_substitution_value_02=>'localhost'
,p_substitution_string_03=>'G_PORT'
,p_substitution_value_03=>'8090'
,p_substitution_string_04=>'G_CONTEXT_PATH'
,p_substitution_value_04=>'JasperReportsIntegration'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20200930133154'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists/menu_samples
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(13274509416463482)
,p_name=>'Menu - Samples'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(13274721394463508)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Show report and branch to other page'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:::'
,p_list_text_01=>'Show a report in a separate window for download and branches back to another page at the same time.'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3'
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45453936578316286)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45454004876316286)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IG'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45454105989316287)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'classic'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45454207478316287)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_RICH_TEXT_EDITOR'
,p_attribute_01=>'N'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45454370491316287)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'LEGACY'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45454467231316287)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(45454518519316287)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SELECT_LIST'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
wwv_flow_api.create_icon_bar_item(
 p_id=>wwv_flow_api.id(56538318557997554)
,p_icon_sequence=>200
,p_icon_subtext=>'Abmelden'
,p_icon_target=>'&LOGOUT_URL.'
,p_icon_image_alt=>'Abmelden'
,p_icon_height=>32
,p_icon_width=>32
,p_icon_height2=>24
,p_icon_width2=>24
,p_nav_entry_is_feedback_yn=>'N'
,p_icon_bar_disp_cond_type=>'CURRENT_LOOK_IS_1'
,p_cell_colspan=>1
);
end;
/
prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(13875601142195330)
,p_process_sequence=>-100
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set development environment URLs'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'  this is just a convenience routine during development, so that I don''t have to switch the URLs all the time. ',
'*/',
'-- set defaults',
':p0_protocol := ''http'';',
':p0_server := ''192.168.2.165'';',
':p0_port := ''8089'';',
':p0_context_path := ''JasperReportsIntegration-EclipseTest'';'))
,p_process_error_message=>'Error'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P0_SERVER is null',
'and',
'owa_util.get_cgi_env(''host'')=''opal-dev-min:8080'''))
,p_process_when_type=>'PLSQL_EXPRESSION'
);
end;
/
prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(17365838443406753)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'compute urls'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- set defaults',
':p0_protocol := nvl(:p0_protocol,:g_protocol);',
':p0_server := nvl(:p0_server,:g_server);',
':p0_port := nvl(:p0_port,:g_port);',
':p0_context_path := nvl(:p0_context_path,:g_context_path);',
'',
':P0_SERVER_URL := :p0_protocol ||',
'         ''://'' ||',
'         :p0_server ||',
'         '':'' ||',
'         :p0_port;',
'',
':P0_INTEGRATION_CONTEXT_URL := :p0_server_url ||',
'         ''/'' ||',
'         :p0_context_path;',
'',
':P0_REPORT_URL := :P0_INTEGRATION_CONTEXT_URL ||',
'         ''/'' ||',
'         ''report'';'))
,p_process_error_message=>'#SQLERRM#'
);
end;
/
prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(13705118987991477)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'JRI_SHOW_IMAGE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'xlib_jasperreports.set_report_url(:p0_report_url);',
'xlib_jasperreports.show_image(p_image_name => apex_application.g_x01);'))
);
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(13694725372756270)
,p_name=>'FSP_AFTER_LOGIN_URL'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(56548121896862249)
,p_name=>'F_TMP_1'
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
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(56539706670997671)
,p_tab_set=>'TS1'
,p_tab_sequence=>10
,p_tab_name=>'T_HOME'
,p_tab_text=>'Home'
,p_tab_step=>1
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(26288906345518251)
,p_tab_set=>'TS1'
,p_tab_sequence=>20
,p_tab_name=>'T_INSTALLATION'
,p_tab_text=>'Verify Setup'
,p_tab_step=>4
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(26291380819523420)
,p_tab_set=>'TS1'
,p_tab_sequence=>50
,p_tab_name=>'T_USAGE'
,p_tab_text=>'Report Tester'
,p_tab_step=>5
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(13272621170542032)
,p_tab_set=>'TS1'
,p_tab_sequence=>70
,p_tab_name=>'T_SAMPLES'
,p_tab_text=>'Samples'
,p_tab_step=>3
,p_tab_also_current_for_pages=>'6'
,p_required_patch=>wwv_flow_api.id(30127784219510676)
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(17382561056449350)
,p_tab_set=>'TS1'
,p_tab_sequence=>80
,p_tab_name=>'Logs'
,p_tab_text=>'Logs'
,p_tab_step=>2
);
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/pages/page_groups
begin
null;
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/navigationspfad
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(56539424029997642)
,p_name=>' Navigationspfad'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(13273118757542042)
,p_parent_id=>wwv_flow_api.id(56539816682997678)
,p_short_name=>'Samples'
,p_link=>'f?p=&FLOW_ID.:3:&SESSION.'
,p_page_id=>3
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(13274323285449149)
,p_parent_id=>wwv_flow_api.id(13273118757542042)
,p_short_name=>'Show report and branch to other page'
,p_link=>'f?p=&FLOW_ID.:6:&SESSION.'
,p_page_id=>6
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(17382943826449351)
,p_parent_id=>wwv_flow_api.id(56539816682997678)
,p_short_name=>'Logs'
,p_link=>'f?p=&FLOW_ID.:2:&SESSION.'
,p_page_id=>2
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(26289401638518254)
,p_parent_id=>0
,p_short_name=>'Installation'
,p_link=>'f?p=&FLOW_ID.:4:&SESSION.'
,p_page_id=>4
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(26291894004523420)
,p_parent_id=>0
,p_short_name=>'Usage'
,p_link=>'f?p=&FLOW_ID.:5:&SESSION.'
,p_page_id=>5
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(56539816682997678)
,p_parent_id=>0
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.'
,p_page_id=>1
);
end;
/
prompt --application/shared_components/user_interface/templates/page/login
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17321340089409358)
,p_theme_id=>22
,p_name=>'Login'
,p_internal_name=>'LOGIN'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="login">',
'  <div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'  <div id="login-main">#REGION_POSITION_02##BODY##REGION_POSITION_03#</div>',
'</div>',
''))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0"'
,p_theme_class_id=>6
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
,p_template_comment=>'18'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/no_tabs_left_sidebar_fixedwidth_div_based
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17321535586409361)
,p_theme_id=>22
,p_name=>'No Tabs - Left Sidebar (fixed-width / DIV based)'
,p_internal_name=>'NO_TABS_LEFT_SIDEBAR_FIXEDWIDTH_/_DIV_BASED'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="header">',
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>',
'  #REGION_POSITION_07#',
'  <div id="navbar">',
'    #NAVIGATION_BAR#',
'    <div class="app-user">#WELCOME_USER#</div>',
'    #REGION_POSITION_08#',
'  </div>',
'</div>',
'<div id="tabs">',
'  <div class="frame">',
'    <div class="bg">',
'      <div class="tab-holder">',
'        &nbsp;',
'      </div>',
'    </div>',
'  </div>',
'</div>',
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>',
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div id="body">',
'  <div id="two-col-sb-left">',
'    <div id="left-sidebar">#REGION_POSITION_02#</div>',
'    <div id="main-sb-left">',
'      #BODY##REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="footer"><div class="content">',
'<div id="customize">#CUSTOMIZE#</div>',
'<div class="app-version">#APP_VERSION#</div>',
'<div class="clear"></div>',
'  #REGION_POSITION_05#',
'</div></div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>'summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/no_tabs_left_and_right_sidebar_fixedwidth_div_left_and_optional_tablebased_right
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17321835681409361)
,p_theme_id=>22
,p_name=>'No Tabs - Left and Right Sidebar (fixed-width / DIV left and optional table-based right)'
,p_internal_name=>'NO_TABS_LEFT_AND_RIGHT_SIDEBAR_FIXEDWIDTH_/_DIV_LEFT_AND_OPTIONAL_TABLEBASED_RIGHT'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="header">',
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>',
'  #REGION_POSITION_07#',
'  <div id="navbar">',
'    <div class="app-user">#WELCOME_USER#</div>',
'    #NAVIGATION_BAR#',
'    #REGION_POSITION_08#',
'  </div>',
'</div>',
'<div id="tabs">',
'  <div class="frame">',
'    <div class="bg">',
'      <div class="tab-holder">',
'        &nbsp;',
'      </div>',
'    </div>',
'  </div>',
'</div>',
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>',
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div id="body">',
'  <div id="three-col">',
'    <div id="left-sidebar">#REGION_POSITION_02#</div>',
'    <div id="two-col-tbl">',
'      <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">',
'        <tbody>',
'          <tr>',
'            <td class="tbl-main" width="100%">#BODY#</td>',
'            <td class="tbl-sidebar">#REGION_POSITION_03#</td>     ',
'          </tr>',
'        </tbody>',
'      </table>',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="footer"><div class="content">',
'<div id="customize">#CUSTOMIZE#</div>',
'<div class="app-version">#APP_VERSION#</div>',
'<div class="clear"></div>',
'  #REGION_POSITION_05#',
'</div></div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>'summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/no_tabs_right_sidebar_fixedwidth_div_based
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17322147266409361)
,p_theme_id=>22
,p_name=>'No Tabs - Right Sidebar (fixed-width / DIV based)'
,p_internal_name=>'NO_TABS_RIGHT_SIDEBAR_FIXEDWIDTH_/_DIV_BASED'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="header">',
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>',
'  #REGION_POSITION_07#',
'  <div id="navbar">',
'    <div class="app-user">#WELCOME_USER#</div>',
'    #NAVIGATION_BAR#',
'    #REGION_POSITION_08#',
'  </div>',
'</div>',
'<div id="tabs">',
'  <div class="frame">',
'    <div class="bg">',
'      <div class="tab-holder">',
'        &nbsp;',
'      </div>',
'    </div>',
'  </div>',
'</div>',
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>',
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div id="body">',
'  <div id="two-col">',
'    <div id="sidebar">#REGION_POSITION_03#</div>     ',
'    <div id="main">#REGION_POSITION_02##BODY#</div>',
'  </div>',
'</div>',
''))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="footer"><div class="content">',
'<div id="customize">#CUSTOMIZE#</div>',
'<div class="app-version">#APP_VERSION#</div>',
'<div class="clear"></div>',
'  #REGION_POSITION_05#',
'</div></div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/no_tabs_right_sidebar_optional_tablebased
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17322454697409361)
,p_theme_id=>22
,p_name=>'No Tabs - Right Sidebar (optional / table-based)'
,p_internal_name=>'NO_TABS_RIGHT_SIDEBAR_OPTIONAL_/_TABLEBASED'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="header">',
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>',
'  #REGION_POSITION_07#',
'  <div id="navbar">',
'    <div class="app-user">#WELCOME_USER#</div>',
'    #NAVIGATION_BAR#',
'    #REGION_POSITION_08#',
'  </div>',
'</div>',
'<div id="tabs">',
'  <div class="frame">',
'    <div class="bg">',
'      <div class="tab-holder">',
'      </div>',
'    </div>',
'  </div>',
'</div>',
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>',
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div id="body">',
'  <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">',
'    <tbody>',
'      <tr>',
'        <td class="tbl-main" width="100%">#REGION_POSITION_02##BODY#</td>',
'        <td class="tbl-sidebar">#REGION_POSITION_03#</td>     ',
'      </tr>',
'    </tbody>',
'  </table>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="footer"><div class="content">',
'<div id="customize">#CUSTOMIZE#</div>',
'<div class="app-version">#APP_VERSION#</div>',
'<div class="clear"></div>',
'  #REGION_POSITION_05#',
'</div></div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="error_container">',
'	<div class="rounded-corner-region-blank-alt">',
'		<div class="rc-gray-top">',
'			<div class="rc-gray-top-r"></div>',
'		</div>',
'		<div class="rc-body">',
'			<div class="rc-body-r">',
'				<div class="rc-content-main">',
'					<div class="sErrorText">',
'					<strong>#ADDITIONAL_INFO#</strong>',
'					<strong>#MESSAGE#</strong>',
'					<p>',
'						<button onclick="#BACK_LINK#" class="button-default" type="button">',
'						  <span>#OK#</span>',
'						</button>',
'					</p>',
'					</div>',
'					<div class="clear"></div>',
'				</div>',
'				<div class="clear"></div>',
'			</div>',
'		</div>',
'		<div class="rc-bottom">',
'			<div class="rc-bottom-r"></div>',
'		</div>',
'	</div>',
'</div>'))
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/one_level_tabs_left_sidebar_fixedwidth_div_based
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17322734533409362)
,p_theme_id=>22
,p_name=>'One Level Tabs - Left Sidebar (fixed-width / DIV based)'
,p_internal_name=>'ONE_LEVEL_TABS_LEFT_SIDEBAR_FIXEDWIDTH_/_DIV_BASED'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="header">',
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>',
'  #REGION_POSITION_07#',
'  <div id="navbar">',
'    <div class="app-user">#WELCOME_USER#</div>',
'    #NAVIGATION_BAR#',
'    #REGION_POSITION_08#',
'  </div>',
'</div>',
'<ul id="tabs">',
'#TAB_CELLS#',
'<li class="last"><span></span></li>',
'</ul>',
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>',
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div id="body">',
'  <div id="two-col-sb-left">',
'    <div id="left-sidebar">#REGION_POSITION_02#</div>',
'    <div id="main-sb-left">',
'      #BODY##REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="footer"><div class="content">',
'<div id="customize">#CUSTOMIZE#</div>',
'<div class="app-version">#APP_VERSION#</div>',
'<div class="clear"></div>',
'  #REGION_POSITION_05#',
'</div></div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_non_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>16
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/one_level_tabs_left_and_right_sidebar_fixedwidth_div_left_and_optional_tablebased_right
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17323044035409362)
,p_theme_id=>22
,p_name=>'One Level Tabs - Left and Right Sidebar (fixed-width / DIV left and optional table-based right)'
,p_internal_name=>'ONE_LEVEL_TABS_LEFT_AND_RIGHT_SIDEBAR_FIXEDWIDTH_/_DIV_LEFT_AND_OPTIONAL_TABLEBASED_RIGHT'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="header">',
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>',
'  #REGION_POSITION_07#',
'  <div id="navbar">',
'    <div class="app-user">#WELCOME_USER#</div>',
'    #NAVIGATION_BAR#',
'    #REGION_POSITION_08#',
'  </div>',
'</div>',
'<ul id="tabs">',
'#TAB_CELLS#',
'<li class="last"><span></span></li>',
'</ul>',
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>',
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div id="body">',
'  <div id="three-col">',
'    <div id="left-sidebar">#REGION_POSITION_02#</div>',
'    <div id="two-col-tbl">',
'      <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">',
'        <tbody>',
'          <tr>',
'            <td class="tbl-main" width="100%">#BODY#</td>',
'            <td class="tbl-sidebar">#REGION_POSITION_03#</td>     ',
'          </tr>',
'        </tbody>',
'      </table>',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="footer"><div class="content">',
'<div id="customize">#CUSTOMIZE#</div>',
'<div class="app-version">#APP_VERSION#</div>',
'<div class="clear"></div>',
'  #REGION_POSITION_05#',
'</div></div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_non_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>16
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/one_level_tabs_right_sidebar_fixedwidth_div_based
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17323354655409362)
,p_theme_id=>22
,p_name=>'One Level Tabs - Right Sidebar (fixed-width / DIV based)'
,p_internal_name=>'ONE_LEVEL_TABS_RIGHT_SIDEBAR_FIXEDWIDTH_/_DIV_BASED'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="header">',
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>',
'  #REGION_POSITION_07#',
'  <div id="navbar">',
'    <div class="app-user">#WELCOME_USER#</div>',
'    #NAVIGATION_BAR#',
'    #REGION_POSITION_08#',
'  </div>',
'</div>',
'<ul id="tabs">',
'#TAB_CELLS#',
'<li class="last"><span></span></li>',
'</ul>',
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>',
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div id="body">',
'  <div id="two-col">',
'    <div id="sidebar">#REGION_POSITION_03#</div>     ',
'    <div id="main">#REGION_POSITION_02##BODY#</div>',
'  </div>',
'</div>',
''))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="footer"><div class="content">',
'<div id="customize">#CUSTOMIZE#</div>',
'<div class="app-version">#APP_VERSION#</div>',
'<div class="clear"></div>',
'  #REGION_POSITION_05#',
'</div></div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_non_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>8
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/one_level_tabs_right_sidebar_optional_tablebased
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17323635730409362)
,p_theme_id=>22
,p_name=>'One Level Tabs - Right Sidebar (optional / table-based)'
,p_internal_name=>'ONE_LEVEL_TABS_RIGHT_SIDEBAR_OPTIONAL_/_TABLEBASED'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="header">',
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>',
'  #REGION_POSITION_07#',
'  <div id="navbar">',
'    <div class="app-user">#WELCOME_USER#</div>',
'    #NAVIGATION_BAR#',
'    #REGION_POSITION_08#',
'  </div>',
'</div>',
'<ul id="tabs">',
'#TAB_CELLS#',
'<li class="last"><span></span></li>',
'</ul>',
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>',
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div id="body">',
'  <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">',
'    <tbody>',
'      <tr>',
'        <td class="tbl-main" width="100%">#REGION_POSITION_02##BODY#</td>',
'        <td class="tbl-sidebar">#REGION_POSITION_03#</td>     ',
'      </tr>',
'    </tbody>',
'  </table>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="footer"><div class="content">',
'<div id="customize">#CUSTOMIZE#</div>',
'<div class="app-version">#APP_VERSION#</div>',
'<div class="clear"></div>',
'  #REGION_POSITION_05#',
'</div></div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_non_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="navbar-link">#TEXT#</a></div>'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/popup
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17323958377409362)
,p_theme_id=>22
,p_name=>'Popup'
,p_internal_name=>'POPUP'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'<title>#TITLE#</title>',
'<link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD# class="pop-up-body">#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">',
'<tr>',
'<td width="100%" valign="top"><div class="t1messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>',
'<td valign="top">#REGION_POSITION_03#<br /></td>',
'</tr>',
'</table>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE##DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div class="t1success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>'
,p_notification_message=>'<div class="t1notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>'
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#">#TEXT#</a>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>4
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/printer_friendly
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17324253802409363)
,p_theme_id=>22
,p_name=>'Printer Friendly'
,p_internal_name=>'PRINTER_FRIENDLY'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="header">',
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>',
'  #REGION_POSITION_07#',
'  <div id="navbar">',
'    <div class="app-user">#WELCOME_USER#</div>',
'    #REGION_POSITION_08#',
'  </div>',
'</div>',
'<div id="body">',
'  <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">',
'    <tbody>',
'      <tr>',
'        <td class="tbl-sidebar" style="padding-right: 10px;">#REGION_POSITION_02#</td>     ',
'        <td class="tbl-main" width="100%">#BODY#</td>',
'        <td class="tbl-sidebar">#REGION_POSITION_03#</td>     ',
'      </tr>',
'    </tbody>',
'  </table>',
'</div>',
''))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>5
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
,p_template_comment=>'3'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/two_level_tabs_left_sidebar_fixedwidth_div_based
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17324546693409371)
,p_theme_id=>22
,p_name=>'Two Level Tabs - Left Sidebar (fixed-width / DIV based)'
,p_internal_name=>'TWO_LEVEL_TABS_LEFT_SIDEBAR_FIXEDWIDTH_/_DIV_BASED'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
' #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="header">',
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>',
'  #REGION_POSITION_07#',
'  <div id="navbar">',
'    <div class="app-user">#WELCOME_USER#</div>',
'    #NAVIGATION_BAR#',
'    #REGION_POSITION_08#',
'  </div>',
'  <div id="parent-tabs">',
'    <div class="tab-holder">#PARENT_TAB_CELLS#</div>',
'  </div>',
'</div>',
'<ul id="tabs">',
'#TAB_CELLS#',
'<li class="last"><span></span></li>',
'</ul>',
'',
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>',
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div id="body">',
'  <div id="two-col-sb-left">',
'    <div id="left-sidebar">#REGION_POSITION_02#</div>',
'    <div id="main-sb-left">',
'      #BODY##REGION_POSITION_03#',
'    </div>',
'  </div>',
'</div>',
''))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="footer"><div class="content">',
'<div id="customize">#CUSTOMIZE#</div>',
'<div class="app-version">#APP_VERSION#</div>',
'<div class="clear"></div>',
'  #REGION_POSITION_05#',
'</div></div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_non_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_top_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="current"><div>',
'#TAB_LABEL##TAB_INLINE_EDIT#',
'</div></div>',
'',
''))
,p_top_non_curr_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="noncurrent"><div>',
'<a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</div></div>',
'',
'',
'',
'',
''))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>18
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/two_level_tabs_left_and_right_sidebar_fixedwidth_div_left_and_optional_tablebased_right
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17324857350409371)
,p_theme_id=>22
,p_name=>'Two Level Tabs - Left and Right Sidebar (fixed-width / DIV left and optional table-based right)'
,p_internal_name=>'TWO_LEVEL_TABS_LEFT_AND_RIGHT_SIDEBAR_FIXEDWIDTH_/_DIV_LEFT_AND_OPTIONAL_TABLEBASED_RIGHT'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
' #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="header">',
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>',
'  #REGION_POSITION_07#',
'  <div id="navbar">',
'    <div class="app-user">#WELCOME_USER#</div>',
'    #NAVIGATION_BAR#',
'    #REGION_POSITION_08#',
'  </div>',
'  <div id="parent-tabs">',
'    <div class="tab-holder">#PARENT_TAB_CELLS#</div>',
'  </div>',
'</div>',
'<ul id="tabs">',
'#TAB_CELLS#',
'<li class="last"><span></span></li>',
'</ul>',
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>',
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div id="body">',
'  <div id="three-col">',
'    <div id="left-sidebar">#REGION_POSITION_02#</div>',
'    <div id="two-col-tbl">',
'      <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">',
'        <tbody>',
'          <tr>',
'            <td class="tbl-main" width="100%">#BODY#</td>',
'            <td class="tbl-sidebar">#REGION_POSITION_03#</td>     ',
'          </tr>',
'        </tbody>',
'      </table>',
'    </div>',
'  </div>',
'</div>',
''))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="footer"><div class="content">',
'<div id="customize">#CUSTOMIZE#</div>',
'<div class="app-version">#APP_VERSION#</div>',
'<div class="clear"></div>',
'  #REGION_POSITION_05#',
'</div></div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_non_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_top_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="current"><div>',
'#TAB_LABEL##TAB_INLINE_EDIT#',
'</div></div>',
'',
''))
,p_top_non_curr_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="noncurrent"><div>',
'<a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</div></div>',
'',
'',
'',
'',
''))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>18
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/two_level_tabs_right_sidebar_fixedwidth_div_based
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17325148454409371)
,p_theme_id=>22
,p_name=>'Two Level Tabs - Right Sidebar (fixed-width / DIV based)'
,p_internal_name=>'TWO_LEVEL_TABS_RIGHT_SIDEBAR_FIXEDWIDTH_/_DIV_BASED'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
' #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="header">',
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>',
'  #REGION_POSITION_07#',
'  <div id="navbar">',
'    <div class="app-user">#WELCOME_USER#</div>',
'    #NAVIGATION_BAR#',
'    #REGION_POSITION_08#',
'  </div>',
'  <div id="parent-tabs">',
'    <div class="tab-holder">#PARENT_TAB_CELLS#</div>',
'  </div>',
'</div>',
'<ul id="tabs">',
'#TAB_CELLS#',
'<li class="last"><span></span></li>',
'</ul>',
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>',
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div id="body">',
'  <div id="two-col">',
'    <div id="sidebar">#REGION_POSITION_03#</div>     ',
'    <div id="main">#REGION_POSITION_02##BODY#</div>',
'  </div>',
'</div>',
''))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="footer"><div class="content">',
'<div id="customize">#CUSTOMIZE#</div>',
'<div class="app-version">#APP_VERSION#</div>',
'<div class="clear"></div>',
'  #REGION_POSITION_05#',
'</div></div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_non_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_top_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="current"><div>',
'#TAB_LABEL##TAB_INLINE_EDIT#',
'</div></div>',
'',
''))
,p_top_non_curr_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="noncurrent"><div>',
'<a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</div></div>',
'',
'',
'',
'',
''))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>2
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/two_level_tabs_right_sidebar_optional_tablebased
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(17325450581409385)
,p_theme_id=>22
,p_name=>'Two Level Tabs - Right Sidebar (optional / table-based)'
,p_internal_name=>'TWO_LEVEL_TABS_RIGHT_SIDEBAR_OPTIONAL_/_TABLEBASED'
,p_is_popup=>false
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<html lang="&BROWSER_LANGUAGE." xmlns="http://www.w3.org/1999/xhtml" xmlns:htmldb="http://htmldb.oracle.com" xmlns:apex="http://apex.oracle.com">',
'<head>',
'  <title>#TITLE#</title>',
'  <link rel="icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
'  <link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">',
' #APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" />',
'  <!--[if IE]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie.css" type="text/css" /><![endif]-->',
'  <!--[if IE 6]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie6.css" type="text/css" /><![endif]-->',
'  <!--[if IE 7]><link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0_ie7.css" type="text/css" /><![endif]-->',
'</head>',
'<body #ONLOAD#>',
'<!--[if lte IE 6]><div id="outdated-browser">#OUTDATED_BROWSER#</div><![endif]-->',
'#FORM_OPEN#',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="header">',
'  <div id="logo"><a href="#HOME_LINK#">#LOGO##REGION_POSITION_06#</a></div>',
'  #REGION_POSITION_07#',
'  <div id="navbar">',
'    <div class="app-user">#WELCOME_USER#</div>',
'    #NAVIGATION_BAR#',
'    #REGION_POSITION_08#',
'  </div>',
'  <div id="parent-tabs">',
'    <div class="tab-holder">#PARENT_TAB_CELLS#</div>',
'  </div>',
'</div>',
'<ul id="tabs">',
'#TAB_CELLS#',
'<li class="last"><span></span></li>',
'</ul>',
'<div id="topbar">#REGION_POSITION_01##REGION_POSITION_04#</div>',
'<div id="messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#</div>',
'<div id="body">',
'  <table class="tbl-body" cellspacing="0" cellpadding="0" border="0" summary="">',
'    <tbody>',
'      <tr>',
'        <td class="tbl-main" width="100%">#REGION_POSITION_02##BODY#</td>',
'        <td class="tbl-sidebar">#REGION_POSITION_03#</td>     ',
'      </tr>',
'    </tbody>',
'  </table>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="footer"><div class="content">',
'<div id="customize">#CUSTOMIZE#</div>',
'<div class="app-version">#APP_VERSION#</div>',
'<div class="clear"></div>',
'  #REGION_POSITION_05#',
'</div></div>',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="success" id="success-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''success-message'')" style="float:right;" class="remove-message" alt="" />',
'  #SUCCESS_MESSAGE#',
'</div>'))
,p_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_non_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="#TAB_STATUS#">',
'<a class="tab_link" href="#TAB_LINK#"><span></span>#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</li>'))
,p_top_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="current"><div>',
'#TAB_LABEL##TAB_INLINE_EDIT#',
'</div></div>',
'',
''))
,p_top_non_curr_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="noncurrent"><div>',
'<a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#',
'</div></div>',
'',
'',
'',
'',
''))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="notification" id="notification-message">',
'  <img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''notification-message'')"  style="float:right;" class="remove-message" alt="" />#MESSAGE#',
'</div>'))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<div class="navbar-entry"><a href="#LINK#" class="t1NavigationBar">#TEXT#</a></div>'
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>2
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/no_tabs_with_sidebar
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(56531013849997418)
,p_theme_id=>15
,p_name=>'No Tabs With Sidebar'
,p_internal_name=>'NO_TABS_WITH_SIDEBAR'
,p_is_popup=>false
,p_body_title=>'#BODY_TITLE#'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_15/theme_V2.css" type="text/css" />',
'</head>',
'<body #ONLOAD#>#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td><div class="t15logo">#LOGO#</div><br />#REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td><div class="t15NavBar"><span class="t15NavBarItem">&USER.</span>#NAVIGATION_BAR#</div><br />#REGION_POSITION_08#</td>',
'</tr>',
'</table>',
'<br style="clear:both;"/>',
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td width="100%" class="t15pagelinecenter"><img src="#IMAGE_PREFIX#themes/theme_15/page_line_center.gif" alt="" /></td>',
'</tr>',
'<tr class="t15PageTopLine">',
'<td>#REGION_POSITION_01#</td>',
'</tr>',
'</table>',
'<br />',
'<table width="100%" summary="" height="70%" cellspacing="0" cellpadding="0" border="0">',
'	<tr>',
'        <td valign="top"><table cellspacing="0" cellpadding="0" border="0" class="t15Sidebar" summary="">',
'<td class="L"><img src="#IMAGE_PREFIX#themes/theme_15/left_curve.gif" alt=""/></td>',
'<td class="C" width="100%"><br /></td>',
'<td class="R" align="right"><img src="#IMAGE_PREFIX#themes/theme_15/right_curve.gif" alt=""/></td>',
'<tr><td colspan="3" class="B">#REGION_POSITION_02#</td></tr>',
'<tr>',
'<td class="L"><img src="#IMAGE_PREFIX#themes/theme_15/left_curve_bottom.gif" alt=""/></td>',
'<td class="C" width="100%"><br /></td>',
'<td class="R" align="right"><img src="#IMAGE_PREFIX#themes/theme_15/right_curve_bottom.gif" alt=""/></td>',
'</tr>',
'</table></td>',
'	<td align="right" valign="top"><img src="#IMAGE_PREFIX#f_spacer.gif" width="15" height="3" alt="" /></td>',
'	<td class="t15PageBody"><div class="t15Messages" align="center">#GLOBAL_NOTIFICATION##NOTIFICATION_MESSAGE##SUCCESS_MESSAGE#</div>#BODY##REGION_POSITION_04#</td>',
'	<td align="right" valign="top"><img src="#IMAGE_PREFIX#f_spacer.gif" width="15" height="3" alt="" /></td>',
'	<td class="t15RightBar" align="right" valign="top">#REGION_POSITION_03#</td>',
'</tr>',
'</table>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<hr />',
'<div class="t15customize">#CUSTOMIZE#</div>',
'<br />',
'#REGION_POSITION_05#',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div class="t15Success">#SUCCESS_MESSAGE#</div>'
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t15Notification">#MESSAGE#</div>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t15NavBarItem">#TEXT#</a>',
''))
,p_region_table_cattributes=>'width="100%"  summary=""'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/two_level_tabs
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(56531133622997432)
,p_theme_id=>15
,p_name=>'Two Level Tabs'
,p_internal_name=>'TWO_LEVEL_TABS'
,p_is_popup=>false
,p_body_title=>'<!--#BODY_TITLE#-->'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_15/theme_V2.css" type="text/css" />',
'</head>',
'<body #ONLOAD#>#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="97%" align="center">',
'<tr>',
'<td><div class="t15logo">#LOGO#</div><br />#REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td><div class="t15NavBar"><span class="t15NavBarItem">&USER.</span>#NAVIGATION_BAR#</div><br />#REGION_POSITION_08#</td>',
'</tr>',
'</table>',
'<br style="clear:both;"/>',
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td><table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr><td width="100%"><br /></td>#PARENT_TAB_CELLS#</tr>',
'</table></td>',
'</tr>',
'<tr>',
'<td width="100%" style="background-color:#336699">#TAB_CELLS#</td>',
'</tr>',
'<tr class="t15PageTopLine"><td>#REGION_POSITION_01#</td></tr>',
'</table>',
'<br />',
'<table width="100%" summary="" height="70%" cellspacing="0" cellpadding="0" border="0">',
'	<tr>',
'	<td align="right" valign="top"><img src="#IMAGE_PREFIX#f_spacer.gif" width="15" height="3" alt="" /></td>',
'	<td class="t15PageBody"><div class="t15Messages" align="center">#GLOBAL_NOTIFICATION##NOTIFICATION_MESSAGE##SUCCESS_MESSAGE#</div>#BODY##REGION_POSITION_02##REGION_POSITION_04#</td>',
'	<td align="right" valign="top"><img src="#IMAGE_PREFIX#f_spacer.gif" width="15" height="3" alt="" /></td>',
'	<td class="t15RightBar" align="right" valign="top">#REGION_POSITION_03#</td>',
'</tr>',
'</table>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<hr />',
'<div class="t15customize">#CUSTOMIZE#</div>',
'<br />',
'#REGION_POSITION_05#',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t15Success">#SUCCESS_MESSAGE#</div>',
''))
,p_current_tab=>'<a class="t15ChildTabCurrent" href="#TAB_LINK#">#TAB_LABEL#</a>'
,p_non_current_tab=>'<a class="t15ChildTab" href="#TAB_LINK#">#TAB_LABEL#</a>'
,p_top_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_open_c.gif" alt="" /></td>',
'<td class="t15CurrentTabCenter"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>',
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_close_c.gif" alt="" /></td>'))
,p_top_non_curr_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_open.gif" alt="" /></td>',
'<td class="t15TabCenter"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>',
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_close.gif" alt="" /></td>'))
,p_notification_message=>'<div class="t15Notification">#MESSAGE#</div>'
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t15NavBarItem">#TEXT#</a>',
''))
,p_region_table_cattributes=>'width="100%" summary=""'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>2
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/printer_friendly_002
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(56531202608997432)
,p_theme_id=>15
,p_name=>'Printer Friendly'
,p_internal_name=>'PRINTER_FRIENDLY'
,p_is_popup=>false
,p_body_title=>'<!--#BODY_TITLE#-->'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_15/theme_V2.css" type="text/css" />',
'</head>',
'<body #ONLOAD#>#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">',
'<tr>',
'<td valign="top">#LOGO##REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td valign="top">#REGION_POSITION_08#</td>',
'</table>',
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">',
'<tr>',
'<td width="100%" valign="top">',
'<div style="border:1px solid black;">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>',
'#BODY##REGION_POSITION_04#</td>',
'<td valign="top">#REGION_POSITION_03#<br /></td>',
'</tr>',
'</table>',
'#REGION_POSITION_05#'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t15Success">#SUCCESS_MESSAGE#</div>',
''))
,p_notification_message=>'<div class="t15Notification">#MESSAGE#</div>'
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="t15NavBarItem">#TEXT#</a>'
,p_region_table_cattributes=>'width="100%"'
,p_theme_class_id=>5
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/one_level_tabs
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(56531316643997432)
,p_theme_id=>15
,p_name=>'One Level Tabs'
,p_internal_name=>'ONE_LEVEL_TABS'
,p_is_popup=>false
,p_body_title=>'#BODY_TITLE#'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<title>#TITLE#</title>',
'<style type="text/css">',
'<!--',
'.space{ height:5px; }',
'.code {',
'	font-family: "Courier New", Courier, monospace;',
'	background-color: #CFE0F1;',
'	font-size: 12px;',
'}',
'-->',
'</style>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_15/theme_V2.css" type="text/css" />',
'</head>',
'<body #ONLOAD#>#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td><div class="t15logo">#LOGO#</div><br />#REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td><div class="t15NavBar"><span class="t15NavBarItem">&USER.</span>#NAVIGATION_BAR#</div><br />#REGION_POSITION_08#</td>',
'</tr>',
'</table>',
'<br style="clear:both;"/>',
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td><table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr><td width="100%"><br /></td>#TAB_CELLS#</tr>',
'</table></td>',
'</tr>',
'<tr>',
'<td width="100%" class="t15pagelinecenter"><img src="#IMAGE_PREFIX#themes/theme_15/page_line_center.gif" alt="" /></td>',
'</tr>',
'<tr class="t15PageTopLine"><td>#REGION_POSITION_01#</td></tr>',
'</table>',
'<br />',
'<table width="100%" summary="" height="70%" cellspacing="0" cellpadding="0" border="0">',
'	<tr>',
'	<td class="t15PageBody"><div class="t15Messages" align="center">#GLOBAL_NOTIFICATION##NOTIFICATION_MESSAGE##SUCCESS_MESSAGE#</div>#BODY##REGION_POSITION_02##REGION_POSITION_04#</td>',
'	<td align="right" valign="top"><img src="#IMAGE_PREFIX#f_spacer.gif" width="15" height="3" alt="" /></td>',
'	<td class="t15RightBar" align="right" valign="top">#REGION_POSITION_03#</td>',
'</tr>',
'</table>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<hr />',
'Version #APP_VERSION# / Dietmar Aust (<a href="http://www.opal-consulting.de" target="_blank">www.opal-consulting.de</a>)',
'<div class="t15customize">#CUSTOMIZE#</div>',
'<br />',
'#REGION_POSITION_05#',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t15Success">#SUCCESS_MESSAGE#</div>',
''))
,p_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_open_c.gif" alt="" /></td>',
'<td class="t15CurrentTabCenter"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>',
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_close_c.gif" alt="" /></td>'))
,p_non_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_open.gif" alt="" /></td>',
'<td class="t15TabCenter"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>',
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_close.gif" alt="" /></td>'))
,p_notification_message=>'<div class="t15Notification">#MESSAGE#</div>'
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="t15NavBarItem">#TEXT#</a>'
,p_region_table_cattributes=>'width="100%" summary=""'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/no_tabs
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(56531427052997432)
,p_theme_id=>15
,p_name=>'No Tabs'
,p_internal_name=>'NO_TABS'
,p_is_popup=>false
,p_body_title=>'#BODY_TITLE#'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_15/theme_V2.css" type="text/css" />',
'</head>',
'<body #ONLOAD#>#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td><div class="t15logo">#LOGO#</div><br />#REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td><div class="t15NavBar"><span class="t15NavBarItem">&USER.</span>#NAVIGATION_BAR#</div><br />#REGION_POSITION_08#</td>',
'</tr>',
'</table>',
'<br style="clear:both;"/>',
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td width="100%" class="t15pagelinecenter"><img src="#IMAGE_PREFIX#themes/theme_15/page_line_center.gif" alt="" /></td>',
'</tr>',
'<tr class="t15PageTopLine">',
'<td>#REGION_POSITION_01#</td>',
'</tr>',
'</table>',
'<br />',
'<table width="100%" summary="" height="70%" cellspacing="0" cellpadding="0" border="0">',
'	<tr>',
'	<td class="t15PageBody"><div class="t15Messages" align="center">#GLOBAL_NOTIFICATION##NOTIFICATION_MESSAGE##SUCCESS_MESSAGE#</div>#BODY##REGION_POSITION_02##REGION_POSITION_04#</td>',
'	<td align="right" valign="top"><img src="#IMAGE_PREFIX#f_spacer.gif" width="15" height="3" alt="" /></td>',
'	<td class="t15RightBar" align="right" valign="top">#REGION_POSITION_03#</td>',
'</tr>',
'</table>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<hr />',
'<div class="t15customize">#CUSTOMIZE#</div>',
'<br />',
'#REGION_POSITION_05#',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t15Success">#SUCCESS_MESSAGE#</div>',
''))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t15Notification">#MESSAGE#</div>',
''))
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="t15NavBarItem">#TEXT#</a>'
,p_region_table_cattributes=>'width="100%" summary=""'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/one_level_tabs_with_sidebar
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(56531531431997432)
,p_theme_id=>15
,p_name=>'One Level Tabs with Sidebar'
,p_internal_name=>'ONE_LEVEL_TABS_WITH_SIDEBAR'
,p_is_popup=>false
,p_body_title=>'#BODY_TITLE#'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_15/theme_V2.css" type="text/css" />',
'</head>',
'<body #ONLOAD#>#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="97%" align="center">',
'<tr>',
'<td><div class="t15logo">#LOGO#</div><br />#REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td><div class="t15NavBar"><span class="t15NavBarItem">&USER.</span>#NAVIGATION_BAR#</div><br />#REGION_POSITION_08#</td>',
'</tr>',
'</table>',
'<br style="clear:both;"/>',
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td><table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr><td width="100%"><br /></td>#TAB_CELLS#</tr>',
'</table></td>',
'</tr>',
'<tr>',
'<td width="100%" class="t15pagelinecenter"><img src="#IMAGE_PREFIX#themes/theme_15/page_line_center.gif" alt="" /></td>',
'</tr>',
'<tr class="t15PageTopLine"><td>#REGION_POSITION_01#</td></tr>',
'</table>',
'<br />',
'<table width="100%" summary="" height="70%" cellspacing="0" cellpadding="0" border="0">',
'	<tr>',
'        <td valign="top">',
'<table cellspacing="0" cellpadding="0" border="0" class="t15Sidebar" summary="">',
'<tr>',
'<td class="L"><img src="#IMAGE_PREFIX#themes/theme_15/left_curve.gif" alt=""/></td>',
'<td class="C" width="100%"><br /></td>',
'<td class="R" align="right"><img src="#IMAGE_PREFIX#themes/theme_15/right_curve.gif" alt=""/></td>',
'</tr>',
'<tr><td colspan="3" class="B">#REGION_POSITION_02#</td></tr>',
'<tr>',
'<td class="L"><img src="#IMAGE_PREFIX#themes/theme_15/left_curve_bottom.gif" alt=""/></td>',
'<td class="C" width="100%"><br /></td>',
'<td class="R" align="right"><img src="#IMAGE_PREFIX#themes/theme_15/right_curve_bottom.gif" alt=""/></td>',
'</tr>',
'</table>',
'</td>',
'	<td align="right" valign="top"><img src="#IMAGE_PREFIX#f_spacer.gif" width="15" height="3" alt="" /></td>',
'	<td class="t15PageBody"><div class="t15Messages" align="center">#GLOBAL_NOTIFICATION##NOTIFICATION_MESSAGE##SUCCESS_MESSAGE#</div>#BODY##REGION_POSITION_04#</td>',
'	<td align="right" valign="top"><img src="#IMAGE_PREFIX#f_spacer.gif" width="15" height="3" alt="" /></td>',
'	<td class="t15RightBar" align="right" valign="top">#REGION_POSITION_03#</td>',
'</tr>',
'</table>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<hr />',
'<div class="t15customize">#CUSTOMIZE#</div>',
'<br />',
'#REGION_POSITION_05#',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div class="t15Success">#SUCCESS_MESSAGE#</div>'
,p_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_open_c.gif" alt="" /></td>',
'<td class="t15CurrentTabCenter"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>',
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_close_c.gif" alt="" /></td>'))
,p_non_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_open.gif" alt="" /></td>',
'<td class="t15TabCenter"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>',
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_close.gif" alt="" /></td>'))
,p_notification_message=>'<div class="t15Notification">#MESSAGE#</div>'
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>'<a href="#LINK#" class="t15NavBarItem">#TEXT#</a>'
,p_region_table_cattributes=>'width="100%"  summary=""'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>16
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/two_level_tabs_with_side_bar
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(56531611125997437)
,p_theme_id=>15
,p_name=>'Two Level Tabs with Side Bar'
,p_internal_name=>'TWO_LEVEL_TABS_WITH_SIDE_BAR'
,p_is_popup=>false
,p_body_title=>'<!--#BODY_TITLE#-->'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_15/theme_V2.css" type="text/css" />',
'</head>',
'<body #ONLOAD#>#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="97%" align="center">',
'<tr>',
'<td><div class="t15logo">#LOGO#</div><br />#REGION_POSITION_06#</td>',
'<td width="100%" valign="top">#REGION_POSITION_07#</td>',
'<td><div class="t15NavBar"><span class="t15NavBarItem">&USER.</span>#NAVIGATION_BAR#</div><br />#REGION_POSITION_08#</td>',
'</tr>',
'</table>',
'<br style="clear:both;"/>',
'<table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr>',
'<td><table summary="" cellpadding="0" cellspacing="0" border="0" width="100%">',
'<tr><td width="100%"><br /></td>#PARENT_TAB_CELLS#</tr>',
'</table></td>',
'</tr>',
'<tr>',
'<td width="100%" style="background-color:#336699">#TAB_CELLS#</td>',
'</tr>',
'<tr class="t15PageTopLine"><td>#REGION_POSITION_01#</td></tr>',
'</table>',
'<br />',
'<table width="100%" summary="" height="70%" cellspacing="0" cellpadding="0" border="0">',
'	<tr>',
'        <td valign="top">',
'<table cellspacing="0" cellpadding="0" border="0" class="t15Sidebar" summary="">',
'<tr>',
'<td class="L"><img src="#IMAGE_PREFIX#themes/theme_15/left_curve.gif" alt=""/></td>',
'<td class="C" width="100%"><br /></td>',
'<td class="R" align="right"><img src="#IMAGE_PREFIX#themes/theme_15/right_curve.gif" alt=""/></td>',
'</tr>',
'<tr><td colspan="3" class="B">#REGION_POSITION_02#</td></tr>',
'<tr>',
'<td class="L"><img src="#IMAGE_PREFIX#themes/theme_15/left_curve_bottom.gif" alt=""/></td>',
'<td class="C" width="100%"><br /></td>',
'<td class="R" align="right"><img src="#IMAGE_PREFIX#themes/theme_15/right_curve_bottom.gif" alt=""/></td>',
'</tr>',
'</table>',
'</td>',
'	<td align="right" valign="top"><img src="#IMAGE_PREFIX#f_spacer.gif" width="15" height="3" alt="" /></td>',
'	<td class="t15PageBody"><div class="t15Messages" align="center">#GLOBAL_NOTIFICATION##NOTIFICATION_MESSAGE##SUCCESS_MESSAGE#</div>#BODY##REGION_POSITION_04#</td>',
'	<td align="right" valign="top"><img src="#IMAGE_PREFIX#f_spacer.gif" width="15" height="3" alt="" /></td>',
'	<td class="t15RightBar" align="right" valign="top">#REGION_POSITION_03#</td>',
'</tr>',
'</table>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<hr />',
'<div class="t15customize">#CUSTOMIZE#</div>',
'<br />',
'#REGION_POSITION_05#',
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>'<div class="t15Success">#SUCCESS_MESSAGE#</div>'
,p_current_tab=>'<a class="t15ChildTabCurrent" href="#TAB_LINK#">#TAB_LABEL#</a>'
,p_non_current_tab=>'<a class="t15ChildTab" href="#TAB_LINK#">#TAB_LABEL#</a>'
,p_top_current_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_open_c.gif" alt="" /></td>',
'<td class="t15CurrentTabCenter"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>',
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_close_c.gif" alt="" /></td>'))
,p_top_non_curr_tab=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_open.gif" alt="" /></td>',
'<td class="t15TabCenter"><a href="#TAB_LINK#">#TAB_LABEL#</a></td>',
'<td><img src="#IMAGE_PREFIX#themes/theme_15/tab_close.gif" alt="" /></td>'))
,p_notification_message=>'<div class="t15Notification">#MESSAGE#</div>'
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t15NavBarItem">#TEXT#</a>',
''))
,p_region_table_cattributes=>'width="100%" summary=""'
,p_sidebar_def_reg_pos=>'REGION_POSITION_02'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>18
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/popup_002
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(56531722169997437)
,p_theme_id=>15
,p_name=>'Popup'
,p_internal_name=>'POPUP'
,p_is_popup=>false
,p_body_title=>'#BODY_TITLE#'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_15/theme_V2.css" type="text/css" />',
'</head>',
'<body #ONLOAD#>#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="padding:10px;text-align:left;" valign="top">#BODY#</div>',
''))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body> ',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t15Success">#SUCCESS_MESSAGE#</div>',
'',
''))
,p_notification_message=>'<div class="t15Notification">#MESSAGE#</b>'
,p_navigation_bar=>'#BAR_BODY#'
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t15NavBarItem">#TEXT#</a>',
''))
,p_region_table_cattributes=>'width="100%"'
,p_theme_class_id=>4
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/page/login_002
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(56531806356997437)
,p_theme_id=>15
,p_name=>'Login'
,p_internal_name=>'LOGIN'
,p_is_popup=>false
,p_body_title=>'#BODY_TITLE#'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE." xmlns:htmldb="http://htmldb.oracle.com">',
'<head>',
'<meta http-equiv="x-ua-compatible" content="IE=edge" />',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#TEMPLATE_CSS#',
'#THEME_STYLE_CSS#',
'#APPLICATION_CSS#',
'#PAGE_CSS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#HEAD#',
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_15/theme_V2.css" type="text/css" />',
'</head>',
'<body #ONLOAD#>#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#NOTIFICATION_MESSAGE##SUCCESS_MESSAGE#',
'<table border="0" summary="" align="center" style="margin:100px auto;width:50%;">',
'<tr>',
'<td>#BODY#',
'#REGION_POSITION_01#',
'#REGION_POSITION_02#',
'#REGION_POSITION_03#',
'#REGION_POSITION_04#',
'#REGION_POSITION_05#',
'#REGION_POSITION_06#',
'#REGION_POSITION_07#',
'#REGION_POSITION_08#</td>',
'</tr>',
'</table>',
'',
''))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#GENERATED_CSS#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t15Notification">#MESSAGE#</div>',
''))
,p_region_table_cattributes=>'width="100%"'
,p_theme_class_id=>6
,p_grid_type=>'TABLE'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/button/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(17325751309409385)
,p_template_name=>'Button'
,p_internal_name=>'BUTTON'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" onclick="#LINK#" class="button-default" type="button">',
'  <span>#LABEL#</span>',
'</button>'))
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>22
);
end;
/
prompt --application/shared_components/user_interface/templates/button/hot_button_black
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(17325944880409386)
,p_template_name=>'Hot Button (Black)'
,p_internal_name=>'HOT_BUTTON_BLACK'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" onclick="#LINK#" class="button-alt5" type="button">',
'  <span>#LABEL#</span>',
'</button>'))
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_theme_id=>22
);
end;
/
prompt --application/shared_components/user_interface/templates/button/hot_button_blue
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(17326158433409386)
,p_template_name=>'Hot Button (Blue)'
,p_internal_name=>'HOT_BUTTON_BLUE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" onclick="#LINK#" class="button-alt1" type="button">',
'  <span>#LABEL#</span>',
'</button>'))
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_theme_id=>22
);
end;
/
prompt --application/shared_components/user_interface/templates/button/hot_button_yellow
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(17326339583409386)
,p_template_name=>'Hot Button (Yellow)'
,p_internal_name=>'HOT_BUTTON_YELLOW'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" onclick="#LINK#" class="button-alt4" type="button">',
'  <span>#LABEL#</span>',
'</button>'))
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_theme_id=>22
);
end;
/
prompt --application/shared_components/user_interface/templates/button/small_button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(17326548831409386)
,p_template_name=>'Small Button'
,p_internal_name=>'SMALL_BUTTON'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" onclick="#LINK#" class="button-alt2" type="button">',
'  <span>#LABEL#</span>',
'</button>'))
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_template_comment=>'XP Square FFFFFF'
,p_theme_id=>22
);
end;
/
prompt --application/shared_components/user_interface/templates/button/small_hot_button_blue
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(17326744589409386)
,p_template_name=>'Small Hot Button (Blue)'
,p_internal_name=>'SMALL_HOT_BUTTON_BLUE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" onclick="#LINK#" class="button-alt3" type="button">',
'  <span>#LABEL#</span>',
'</button>'))
,p_translate_this_template=>'N'
,p_theme_class_id=>2
,p_template_comment=>'Standard Button'
,p_theme_id=>22
);
end;
/
prompt --application/shared_components/user_interface/templates/button/small_hot_button_yellow
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(17326938910409386)
,p_template_name=>'Small Hot Button (Yellow)'
,p_internal_name=>'SMALL_HOT_BUTTON_YELLOW'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button value="#LABEL#" onclick="#LINK#" class="button-alt6" type="button">',
'  <span>#LABEL#</span>',
'</button>'))
,p_translate_this_template=>'N'
,p_theme_class_id=>2
,p_template_comment=>'Standard Button'
,p_theme_id=>22
);
end;
/
prompt --application/shared_components/user_interface/templates/button/button_alternative_2
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(56531931349997437)
,p_template_name=>'Button, Alternative 2'
,p_internal_name=>'BUTTON,_ALTERNATIVE_2'
,p_template=>'<a href="#LINK#" class="t15Button2">#LABEL#</a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>15
);
end;
/
prompt --application/shared_components/user_interface/templates/button/button_alternative_1
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(56532011423997446)
,p_template_name=>'Button, Alternative 1'
,p_internal_name=>'BUTTON,_ALTERNATIVE_1'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table class="t15Button1" cellspacing="0" cellpadding="0" border="0"  summary="">',
'<tr>',
'<td class="t15L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_15/button_left.gif" alt="" width="4" height="24" /></a></td>',
'<td class="t15C"><a href="#LINK#">#LABEL#</a></td>',
'<td class="t15R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_15/button_right.gif" width="4" height="24" alt="" /></a></td>',
'</tr>',
'</table>'))
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_template_comment=>'BLAF style, rounded on left side only. Uses classes in platform2.css or /css/einstein.css'
,p_theme_id=>15
);
end;
/
prompt --application/shared_components/user_interface/templates/button/button_002
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(56532105108997446)
,p_template_name=>'Button'
,p_internal_name=>'BUTTON'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table class="t15Button" cellspacing="0" cellpadding="0" border="0"  summary=""><tr>',
'<td class="t15L"><img src="#IMAGE_PREFIX#themes/theme_15/button-l.gif" alt="" /></td>',
'<td class="t15C"><a href="#LINK#">#LABEL#</a></td>',
'<td class="t15R"><img src="#IMAGE_PREFIX#themes/theme_15/button-r.gif" alt="" /></td>',
'</tr></table>'))
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>15
);
end;
/
prompt --application/shared_components/user_interface/templates/button/button_alternative_3
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(56532219454997446)
,p_template_name=>'Button, Alternative 3'
,p_internal_name=>'BUTTON,_ALTERNATIVE_3'
,p_template=>'<a href="#LINK#" class="t15Button3">#LABEL#</a>'
,p_translate_this_template=>'N'
,p_theme_class_id=>2
,p_template_comment=>'Standard Button'
,p_theme_id=>15
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17327142303409386)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="blank-region">',
'#BODY#',
'<div class="clear"></div>',
'</div>'))
,p_page_plug_template_name=>'Blank Region'
,p_internal_name=>'BLANK_REGION'
,p_theme_id=>22
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/borderless_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17327443195409398)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="borderless-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="bl-top">',
'    <div class="bl-title">#TITLE#</div>',
'    <div class="bl-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'  </div>',
'  <div class="bl-body">#BODY#</div>',
'</div>',
'<div class="clear"></div>'))
,p_page_plug_template_name=>'Borderless Region'
,p_internal_name=>'BORDERLESS_REGION'
,p_theme_id=>22
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Use this region template when you want to contain content without a border.',
'',
'TITLE=YES',
'BUTTONS=YES',
'100% WIDTH=NO'))
);
end;
/
prompt --application/shared_components/user_interface/templates/region/borderless_region_no_title
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17327759627409398)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="borderless-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="bl-top">',
'    ',
'    <div class="bl-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'  </div>',
'  <div class="bl-body">#BODY#</div>',
'</div>',
'<div class="clear"></div>'))
,p_page_plug_template_name=>'Borderless Region - No Title'
,p_internal_name=>'BORDERLESS_REGION_NO_TITLE'
,p_theme_id=>22
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Use this region template when you want to contain content without a border.',
'',
'TITLE=YES',
'BUTTONS=YES',
'100% WIDTH=NO'))
);
end;
/
prompt --application/shared_components/user_interface/templates/region/bracketed_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17328056743409398)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="bracketed-region brackets" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="bk-top">',
'    <div class="bk-top-r">',
'      <div class="bk-title">#TITLE#</div>',
'      <div class="bk-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'    </div>',
'  </div>',
'  <div class="bk-body">#BODY#</div>',
'  <div class="bk-bottom">',
'    <div class="bk-bottom-r">&nbsp;</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Bracketed Region'
,p_internal_name=>'BRACKETED_REGION'
,p_theme_id=>22
,p_theme_class_id=>18
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Use this region template when you want to contain content with a bracket UI.',
'',
'TITLE=YES',
'BUTTONS=YES',
'100% WIDTH=NO'))
);
end;
/
prompt --application/shared_components/user_interface/templates/region/breadcrumb_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17328333600409399)
,p_layout=>'TABLE'
,p_template=>'<div class="breadcrumb-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'Breadcrumb Region'
,p_internal_name=>'BREADCRUMB_REGION'
,p_theme_id=>22
,p_theme_class_id=>6
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Use this region template to contain breadcrumb menus.  Breadcrumb menus are implemented using breadcrumbs.  Breadcrumb menus are designed to displayed in #REGION_POSITION_01#'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/button_region_with_title
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17328655401409408)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region-blank" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top">',
'    <div class="rc-gray-top-r"></div>',
'  </div>',
'  <div class="rc-body">',
'    <div class="rc-body-r">',
'      <div class="rc-content-main">',
'        <div class="rc-left">',
'          <h3>#TITLE#</h3>',
'        </div>',
'        <div class="rc-right">',
'#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'        </div>',
'        <div class="clear"></div>',
'      </div>',
'    </div>',
'  </div>',
'  <div class="rc-bottom">',
'    <div class="rc-bottom-r"></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Button Region with Title'
,p_internal_name=>'BUTTON_REGION_WITH_TITLE'
,p_theme_id=>22
,p_theme_class_id=>4
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/button_region_without_title
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17328957280409408)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region-blank" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top">',
'    <div class="rc-gray-top-r"></div>',
'  </div>',
'  <div class="rc-body">',
'    <div class="rc-body-r">',
'      <div class="rc-content-main">',
'        <div class="rc-left">',
'          #BODY#',
'        </div>',
'        <div class="rc-right">',
'#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'        </div>',
'        <div class="clear"></div>',
'      </div>',
'    </div>',
'  </div>',
'  <div class="rc-bottom">',
'    <div class="rc-bottom-r"></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Button Region without Title'
,p_internal_name=>'BUTTON_REGION_WITHOUT_TITLE'
,p_theme_id=>22
,p_theme_class_id=>17
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/centered_tab_set_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17329259291409408)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="tSC">',
'  #BODY#',
'</div>',
'<div class="tSF">',
'  <div class="tSFO">',
'    <div class="tSFI">',
'    </div>',
'  </div>',
'</div>',
''))
,p_page_plug_template_name=>'Centered Tab Set Region'
,p_internal_name=>'CENTERED_TAB_SET_REGION'
,p_theme_id=>22
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/chart_list
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17329539356409408)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top"><div class="rc-gray-top-r">',
'    <div class="rc-title">#TITLE#</div>',
'    <div class="rc-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'  </div></div>',
'  <div class="rc-body"><div class="rc-body-r"><div class="rc-content-main">',
'     <div class="rc-image"><img src="#IMAGE_PREFIX#themes/theme_22/images/report_icon.png" alt="" /></div>',
'      <div class="rc-content">#BODY#</div>',
'<div class="clear"></div>',
'</div>',
'</div></div>',
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>',
'</div>'))
,p_page_plug_template_name=>'Chart List'
,p_internal_name=>'CHART_LIST'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>22
,p_theme_class_id=>29
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/chart_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17329842275409409)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top"><div class="rc-gray-top-r">',
'    <div class="rc-title">#TITLE#</div>',
'  </div></div>',
'  <div class="rc-body"><div class="rc-body-r">',
'<div class="rc-content-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'<div class="rc-content-main">#BODY#<div class="clear"></div></div></div></div>',
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>',
'</div>'))
,p_page_plug_template_name=>'Chart Region'
,p_internal_name=>'CHART_REGION'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>22
,p_theme_class_id=>30
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/form_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17330148237409409)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top"><div class="rc-gray-top-r">',
'    <div class="rc-title">#TITLE#</div>',
'  </div></div>',
'  <div class="rc-body"><div class="rc-body-r">',
'<div class="rc-content-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'<div class="rc-content-main">',
'#BODY#<div class="clear"></div></div></div></div>',
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>',
'</div>'))
,p_page_plug_template_name=>'Form Region'
,p_internal_name=>'FORM_REGION'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>22
,p_theme_class_id=>8
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/hide_and_show_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17330446778409409)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="hide-show-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="hide-show-top">',
'    <div class="hide-show-title"><a href="javascript:hideShow(''region#REGION_SEQUENCE_ID#'',''shIMG#REGION_SEQUENCE_ID#'',''#IMAGE_PREFIX#themes/theme_22/images/right_arrow.png'',''#IMAGE_PREFIX#themes/theme_22/images/down_arrow.png'');" class="t1HideandSho'
||'wRegionLink"><img src="#IMAGE_PREFIX#themes/theme_22/images/right_arrow.png" ',
'  id="shIMG#REGION_SEQUENCE_ID#" alt="" /></a> #TITLE#</div>',
'    <div class="hide-show-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'  </div>',
'<div class="hide" id="region#REGION_SEQUENCE_ID#" style="float:left;">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Hide and Show Region'
,p_internal_name=>'HIDE_AND_SHOW_REGION'
,p_theme_id=>22
,p_theme_class_id=>1
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Gray Head, white body'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/navigation_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17330741439409409)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="navigation-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'    <h3>#TITLE#</h3>',
'  <div>',
'    #BODY#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Navigation Region'
,p_internal_name=>'NAVIGATION_REGION'
,p_theme_id=>22
,p_theme_class_id=>5
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/navigation_region_alternative_1
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17331054913409409)
,p_layout=>'TABLE'
,p_template=>'<div class="navigation-region-alt" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'Navigation Region, Alternative 1'
,p_internal_name=>'NAVIGATION_REGION,_ALTERNATIVE_1'
,p_theme_id=>22
,p_theme_class_id=>16
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/nested_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17331356595409409)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region-nested" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'	<div class="nr-top">',
'		<div class="nr-top-r">',
'    <div class="nr-title">#TITLE#</div>',
'    <div class="nr-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'		</div>',
'	</div>',
'	<div class="nr-body">',
'		<div class="nr-content-main">',
'			#BODY#',
'			<div class="clear"></div>',
'		</div>',
'	</div>',
'</div>'))
,p_page_plug_template_name=>'Nested Region'
,p_internal_name=>'NESTED_REGION'
,p_theme_id=>22
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Use this region template when you want to contain content without a border.',
'',
'TITLE=YES',
'BUTTONS=YES',
'100% WIDTH=NO'))
);
end;
/
prompt --application/shared_components/user_interface/templates/region/region_without_buttons_and_titles
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17331657839409409)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="borderless-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="bl-body">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Region without Buttons and Titles'
,p_internal_name=>'REGION_WITHOUT_BUTTONS_AND_TITLES'
,p_theme_id=>22
,p_theme_class_id=>19
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/region_without_title
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17331941178409409)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="borderless-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="bl-top">',
'    <div class="bl-title">&nbsp;</div>',
'    <div class="bl-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'  </div>',
'  <div class="bl-body">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'Region without Title'
,p_internal_name=>'REGION_WITHOUT_TITLE'
,p_theme_id=>22
,p_theme_class_id=>11
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/report_filter_single_row
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17332250053409409)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table class="apex_finderbar" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'<tbody>',
'<tr>',
'<td class="apex_finderbar_left_top" valign="top"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8" alt=""  class="spacer" alt="" /></td>',
'<td class="apex_finderbar_middle" rowspan="3" valign="middle"><img src="#IMAGE_PREFIX#htmldb/builder/builder_find.png" /></td>',
'<td class="apex_finderbar_middle" rowspan="3" valign="middle" style="">#BODY#</td>',
'<td class="apex_finderbar_left" rowspan="3" width="10"><br /></td>',
'<td class="apex_finderbar_buttons" rowspan="3" valign="middle" nowrap="nowrap"><span class="apex_close">#CLOSE#</span><span>#EDIT##CHANGE##DELETE##CREATE##CREATE2##COPY##PREVIOUS##NEXT##EXPAND##HELP#</span></td>',
'</tr>',
'<tr><td class="apex_finderbar_left_middle"><br /></td></tr>',
'<tr>',
'<td class="apex_finderbar_left_bottom" valign="bottom"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8"  class="spacer" alt="" /></td>',
'</tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Report Filter - Single Row'
,p_internal_name=>'REPORT_FILTER_SINGLE_ROW'
,p_theme_id=>22
,p_theme_class_id=>31
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/report_list
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17332545141409410)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region-alt" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top"><div class="rc-gray-top-r">',
'    <div class="rc-title">#TITLE#</div>',
'  </div></div>',
'  <div class="rc-body"><div class="rc-body-r">',
'<div class="rc-content-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'    <div class="rc-content-main">',
'    #BODY#',
'    </div>',
'  </div></div>',
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>',
'</div>'))
,p_page_plug_template_name=>'Report List'
,p_internal_name=>'REPORT_LIST'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>22
,p_theme_class_id=>29
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/reports_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17332845056409410)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top"><div class="rc-gray-top-r">',
'    <div class="rc-title">#TITLE#</div>',
'  </div></div>',
'  <div class="rc-body"><div class="rc-body-r">',
'<div class="rc-content-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'<div class="rc-content-main">#BODY#<div class="clear"></div></div></div></div>',
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>',
'</div> '))
,p_page_plug_template_name=>'Reports Region'
,p_internal_name=>'REPORTS_REGION'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>22
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/reports_region_100_width
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17333159174409410)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region float-left-100pct" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top"><div class="rc-gray-top-r">',
'    <div class="rc-title">#TITLE#</div>',
'  </div></div>',
'  <div class="rc-body"><div class="rc-body-r">',
'<div class="rc-content-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'<div class="rc-content-main">#BODY#<div class="clear"></div></div></div></div>',
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>',
'</div>',
''))
,p_page_plug_template_name=>'Reports Region 100% Width'
,p_internal_name=>'REPORTS_REGION_100%_WIDTH'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>22
,p_theme_class_id=>13
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/reports_region_no_title
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17333461960409410)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region-blank-white" id="#REGION_STATIC_ID#"  #REGION_ATTRIBUTES#>',
'	<div class="rc-gray-top">',
'		<div class="rc-gray-top-r"></div>',
'	</div>',
'	<div class="rc-body">',
'		<div class="rc-body-r">',
'			<div class="rc-content-main">',
'				#BODY#',
'				<div class="clear"></div>',
'			</div>',
'			<div class="rc-content-buttons">',
'				#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'			</div>',
'			<div class="clear"></div>',
'		</div>',
'	</div>',
'	<div class="rc-bottom">',
'		<div class="rc-bottom-r"></div>',
'	</div>',
'</div>'))
,p_page_plug_template_name=>'Reports Region No Title'
,p_internal_name=>'REPORTS_REGION_NO_TITLE'
,p_theme_id=>22
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/reports_region_no_title_alternative_1
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17333740624409410)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region-blank-alt" id="#REGION_STATIC_ID#"  #REGION_ATTRIBUTES#>',
'	<div class="rc-gray-top">',
'		<div class="rc-gray-top-r"></div>',
'	</div>',
'	<div class="rc-body">',
'		<div class="rc-body-r">',
'			<div class="rc-content-main">',
'				#BODY#',
'				<div class="clear"></div>',
'			</div>',
'			<div class="rc-content-buttons">',
'				#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'			</div>',
'			<div class="clear"></div>',
'		</div>',
'	</div>',
'	<div class="rc-bottom">',
'		<div class="rc-bottom-r"></div>',
'	</div>',
'</div>'))
,p_page_plug_template_name=>'Reports Region No Title, Alternative 1'
,p_internal_name=>'REPORTS_REGION_NO_TITLE,_ALTERNATIVE_1'
,p_theme_id=>22
,p_theme_class_id=>10
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/reports_region_alternative_1
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17334061330409410)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region-alt" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top"><div class="rc-gray-top-r">',
'    <div class="rc-title">#TITLE#</div>',
'  </div></div>',
'  <div class="rc-body"><div class="rc-body-r">',
'<div class="rc-content-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'<div class="rc-content-main">#BODY#<div class="clear"></div>',
'<div class="clear"></div>',
'</div>',
'</div></div>',
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>',
'</div>'))
,p_page_plug_template_name=>'Reports Region, Alternative 1'
,p_internal_name=>'REPORTS_REGION,_ALTERNATIVE_1'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>22
,p_theme_class_id=>10
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/sidebar_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17334362203409410)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="sidebar-region">',
'<div class="rounded-corner-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top"><div class="rc-gray-top-r">',
'    <div class="rc-title">#TITLE#</div>',
'  </div></div>',
'  <div class="rc-body"><div class="rc-body-r">',
'<div class="rc-content-main">#BODY#<div class="clear"></div></div></div></div>',
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>',
'</div> ',
'</div>'))
,p_page_plug_template_name=>'Sidebar Region'
,p_internal_name=>'SIDEBAR_REGION'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>22
,p_theme_class_id=>2
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table border="0" cellpadding="0" cellspacing="0">',
'        <tr>',
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tl_img.gif" border="0" width="4" height="18" alt="" /></td>',
'          <td bgcolor="#000000" height="1"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>',
'          <td rowspan="2" valign="top" width="4" bgcolor="#FF0000"><img src="#IMAGE_PREFIX#tr_img.gif" border="0" width="4" height="18" alt="" /></td>',
'        </tr>',
'        <tr>',
'          <td bgcolor="#FF0000" height="16">',
'            <table border="0" cellpadding="0" cellspacing="0" width="100%">',
'              <tr>',
'                <td align=middle valign="top">',
'                  <div align="center">',
'                     <font color="#ffffff" face="Arial, Helvetica, sans-serif" size="1">',
'                      <b>#TITLE# </b></font></div>',
'                </td>',
'              </tr>',
'            </table>',
'          </td>',
'        </tr>',
'</table>',
'<table border="0" cellpadding="0" cellspacing="0">',
'   <tr>',
'   <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'   <td valign="top" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="146" height="1" border="0" alt="" /><br />',
'            <table border="0" cellpadding="1" cellspacing="0" width="146" summary="">',
'              <tr>',
'                <td colspan="2">',
'                  <table border="0" cellpadding="2" cellspacing="0" width="124" summary="">',
'                    <tr>',
'                      <td>&nbsp;</td>',
'                      <td valign="top" width="106">',
'                        <P><FONT face="arial, helvetica" size="1">',
'                            #BODY#',
'                           </font>',
'                        </P>',
'                      </td>',
'                    </tr>',
'                  </table>',
'            </table>',
'          </td>',
'          <td bgcolor="#000000" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'          <td bgcolor="#9a9c9a" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'          <td bgcolor="#b3b4b3" width="1" height="96"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'        </tr>',
'      </table>',
'      <table border="0" cellpadding="0" cellspacing="0">',
'        <tr>',
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#bl_img.gif" border="0" width="4" height="6" alt="" /></td>',
'          <td bgcolor="#ffffff" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="142" height="1" border="0" alt="" /></td>',
'          <td rowspan="4" valign="top" width="4"><img src="#IMAGE_PREFIX#br_img.gif" border="0" width="4" height="6" alt="" /></td>',
'        </tr>',
'        <tr>',
'          <td bgcolor="#000000" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'        </tr>',
'        <tr>',
'          <td bgcolor="#9a9c9a" width="1"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'        </tr>',
'        <tr>',
'          <td bgcolor="#b3b4b3" width="1" height="2"><img src="#IMAGE_PREFIX#stretch.gif" width="1" height="1" border="0" alt="" /></td>',
'        </tr>',
'</table>',
''))
);
end;
/
prompt --application/shared_components/user_interface/templates/region/sidebar_region_alternative_1
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17334649764409410)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="sidebar-region">',
'<div class="rounded-corner-region-alt" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top"><div class="rc-gray-top-r">',
'    <div class="rc-title">#TITLE#</div>',
'  </div></div>',
'  <div class="rc-body"><div class="rc-body-r">',
'<div class="rc-content-main">#BODY#<div class="clear"></div></div></div></div>',
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>',
'</div> ',
'</div>'))
,p_page_plug_template_name=>'Sidebar Region, Alternative 1'
,p_internal_name=>'SIDEBAR_REGION,_ALTERNATIVE_1'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>22
,p_theme_class_id=>3
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/sidebar_region_bordered
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17334932023409411)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region-blank-white sidebar-alt2" id="#REGION_STATIC_ID#"  #REGION_ATTRIBUTES#>',
'	<div class="rc-gray-top">',
'		<div class="rc-gray-top-r"></div>',
'	</div>',
'	<div class="rc-body">',
'		<div class="rc-body-r">',
'			<div class="rc-content-main">',
'				#BODY#',
'				<div class="clear"></div>',
'			</div>',
'			<div class="rc-content-buttons">',
'				#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'			</div>',
'			<div class="clear"></div>',
'		</div>',
'	</div>',
'	<div class="rc-bottom">',
'		<div class="rc-bottom-r"></div>',
'	</div>',
'</div>'))
,p_page_plug_template_name=>'Sidebar Region, Bordered'
,p_internal_name=>'SIDEBAR_REGION,_BORDERED'
,p_theme_id=>22
,p_theme_class_id=>3
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/sidebar_region_bordered_alternative
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17335247488409411)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region-blank-alt sidebar-alt2" id="#REGION_STATIC_ID#"  #REGION_ATTRIBUTES#>',
'	<div class="rc-gray-top">',
'		<div class="rc-gray-top-r"></div>',
'	</div>',
'	<div class="rc-body">',
'		<div class="rc-body-r">',
'			<div class="rc-content-main">',
'				#BODY#',
'				<div class="clear"></div>',
'			</div>',
'			<div class="rc-content-buttons">',
'				#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'			</div>',
'			<div class="clear"></div>',
'		</div>',
'	</div>',
'	<div class="rc-bottom">',
'		<div class="rc-bottom-r"></div>',
'	</div>',
'</div>'))
,p_page_plug_template_name=>'Sidebar Region, Bordered Alternative'
,p_internal_name=>'SIDEBAR_REGION,_BORDERED_ALTERNATIVE'
,p_theme_id=>22
,p_theme_class_id=>3
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17335553776409411)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region-wizard" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top"><div class="rc-gray-top-r">',
'    <div class="rc-title">#TITLE#</div>',
'<div class="rc-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'  </div></div>',
'  <div class="rc-body"><div class="rc-body-r">',
'<div class="rc-content-main">#BODY#<div class="clear"></div></div></div></div>',
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Region'
,p_internal_name=>'WIZARD_REGION'
,p_theme_id=>22
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_region_with_icon
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(17335862307409411)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="rounded-corner-region-wizard" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="rc-gray-top"><div class="rc-gray-top-r">',
'    <div class="rc-title">#TITLE#</div>',
'<div class="rc-buttons">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</div>',
'  </div></div>',
'  <div class="rc-body"><div class="rc-body-r">',
'<div class="rc-content-main">#BODY#<div class="clear"></div></div></div></div>',
'  <div class="rc-bottom"><div class="rc-bottom-r"></div></div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Region with Icon'
,p_internal_name=>'WIZARD_REGION_WITH_ICON'
,p_theme_id=>22
,p_theme_class_id=>20
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/button_region_without_title_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56532314559997446)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" border="0" summary="" class="t15ButtonRegionwithoutTitle" id="#REGION_ID#">',
'<tr>',
'<td class="t15ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>',
'</tr>',
'</table>',
'#BODY#'))
,p_page_plug_template_name=>'Button Region without Title'
,p_internal_name=>'BUTTON_REGION_WITHOUT_TITLE'
,p_theme_id=>15
,p_theme_class_id=>17
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/borderless_region_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56532429495997459)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t15BorderlessRegion" id="#REGION_ID#">',
'<tr>',
'<td class="t15RegionHeader">#TITLE#</td>',
'<td align="right" class="t15ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>',
'</tr>',
'<tr>',
'<td class="t15Body" colspan="2">#BODY#</td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'Borderless Region'
,p_internal_name=>'BORDERLESS_REGION'
,p_theme_id=>15
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/sidebar_region_alternative_1_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56532502984997459)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" class="t15SidebarRegionAlt1" summary="" id="#REGION_ID#">',
'<tr class="t15RegionHeader">',
'<th class="L" valign="top"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="10" alt="" /></th>',
'<th class="C">#TITLE#</th>',
'<th class="R" valign="top"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="10" alt="" /></th>',
'</tr>',
'<tr>',
'<td colspan="3" class="t15Body">#BODY#<img src="#IMAGE_PREFIX#1px_trans.gif" width="200" height="1" alt="" /></td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'Sidebar Region, Alternative 1'
,p_internal_name=>'SIDEBAR_REGION,_ALTERNATIVE_1'
,p_theme_id=>15
,p_theme_class_id=>3
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/navigation_region_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56532617724997459)
,p_layout=>'TABLE'
,p_template=>'<div class="t15NavigationRegion" id="#REGION_ID#">#BODY#<img src="#IMAGE_PREFIX#1px_trans.gif" width="200" height="1" alt="" class="vsp" /></div>'
,p_page_plug_template_name=>'Navigation Region'
,p_internal_name=>'NAVIGATION_REGION'
,p_theme_id=>15
,p_theme_class_id=>5
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/sidebar_region_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56532708150997459)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" class="t15SidebarRegion" summary="" id="#REGION_ID#">',
'<tr class="t15RegionHeader">',
'<th class="L" valign="top"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="10" alt="" /></th>',
'<th class="C">#TITLE#</th>',
'<th class="R" valign="top"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="10" alt="" /></th>',
'</tr>',
'<tr>',
'<td colspan="3" class="t15Body">#BODY#<img src="#IMAGE_PREFIX#1px_trans.gif" width="200" height="1" alt="" /></td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'Sidebar Region'
,p_internal_name=>'SIDEBAR_REGION'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>15
,p_theme_class_id=>2
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/bracketed_region_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56532832493997459)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t15BracketedRegion" id="#REGION_ID#">',
'<tr>',
'    <td class="t15RegionHeader">#TITLE#</td>',
'</tr>',
'<tr>',
'    <td class="t15Bracket"><table summary=""><tr><td class="t15ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr></table></td>',
'</tr>',
'<tr><td class="t15Body">#BODY#</td></tr>',
'</table>'))
,p_page_plug_template_name=>'Bracketed Region'
,p_internal_name=>'BRACKETED_REGION'
,p_theme_id=>15
,p_theme_class_id=>18
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/breadcrumb_region_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56532925014997460)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_ID#" class="t15breadcrumb">#BODY#</div>'
,p_page_plug_template_name=>'Breadcrumb Region'
,p_internal_name=>'BREADCRUMB_REGION'
,p_theme_id=>15
,p_theme_class_id=>6
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/list_region_with_icon_chart_list
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56533003924997460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t15ListRegionwithIcon" id="#REGION_ID#">',
'<tr>',
'<td class="t15RegionHeader">#TITLE#</td>',
'',
'<td align="right" class="t15ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>',
'<tr>',
'<td class="t15Body" colspan="2"><table cellpadding="0" cellspacing="0" border="0" summary="" ><tr><td valign="top"><img src="#IMAGE_PREFIX#themes/theme_15/monitor_icons_graph.gif" alt=""/></td>',
'<td>#BODY#</td></tr></table></td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'List Region with Icon - Chart List'
,p_internal_name=>'LIST_REGION_WITH_ICON_CHART_LIST'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>15
,p_theme_class_id=>29
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/region_without_title_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56533104607997460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table summary="" id="#REGION_ID#">',
'<tr>',
'<td align="right">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>',
'</tr>',
'<tr>',
'<td align="left" class="t15instructiontext">#BODY#</td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'Region without Title'
,p_internal_name=>'REGION_WITHOUT_TITLE'
,p_theme_id=>15
,p_theme_class_id=>11
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_region_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56533205186997460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table class="t15WizardRegion" id="#REGION_ID#" summary="">',
'<thead class="t15RegionHeader">',
'<tr>',
'<th class="t15RegionTitle">#TITLE#</th>',
'<td align="right" class="t15ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>',
'</tr>',
'</thead>',
'<tbody>',
'<tr><td colspan="2" class="t15Body">#BODY#</td></tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Wizard Region'
,p_internal_name=>'WIZARD_REGION'
,p_theme_id=>15
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/navigation_region_alternative_1_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56533302341997460)
,p_layout=>'TABLE'
,p_template=>'<div class="t15NavigationRegionAlternative1" id="#REGION_ID#"><h2 class="t15RegionHeader">#TITLE#</h2><div class="t15Body">#BODY#<img src="#IMAGE_PREFIX#1px_trans.gif" width="200" height="1" alt="" class="vsp" /></div></div>'
,p_page_plug_template_name=>'Navigation Region, Alternative 1'
,p_internal_name=>'NAVIGATION_REGION,_ALTERNATIVE_1'
,p_theme_id=>15
,p_theme_class_id=>16
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/region_without_buttons_and_titles_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56533418191997460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table summary="" cellpadding="0" cellspacing="0" border="0" class="t15RegionwithoutButtonsandTitles" id="#REGION_ID#">',
'<tr>',
'<td class="t15Body">#BODY#</td>',
'</tr>',
'</table>',
'',
''))
,p_page_plug_template_name=>'Region without Buttons and Titles'
,p_internal_name=>'REGION_WITHOUT_BUTTONS_AND_TITLES'
,p_theme_id=>15
,p_theme_class_id=>19
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/reports_region_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56533516268997460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table width="100%" border="0" cellspacing="0" cellpadding="0" id="#REGION_ID#" class="t15ReportsRegion" summary="">',
'<tr>',
'<td valign="bottom" class="t15RegionHeader">#TITLE#</td>',
'<td align="right" class="t15ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>',
'<tr>',
'<td colspan="2" valign="top" class="t15Body">#BODY#</td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'Reports Region'
,p_internal_name=>'REPORTS_REGION'
,p_theme_id=>15
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/chart_region_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56533603958997460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t15ChartRegion" id="#REGION_ID#">',
'<tr>',
'<td class="t15RegionHeader">#TITLE#</td>',
'<td align="right" class="t15ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>',
'<tr>',
'<td class="t15Body" colspan="2">#BODY#</td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'Chart Region'
,p_internal_name=>'CHART_REGION'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>15
,p_theme_class_id=>30
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/list_region_with_icon_report_list
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56533722239997460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t15ListRegionwithIcon" id="#REGION_ID#">',
'<tr>',
'<td class="t15RegionHeader">#TITLE#</td>',
'',
'<td align="right" class="t15ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>',
'<tr>',
'<td class="t15Body" colspan="2"><table cellpadding="0" cellspacing="0" border="0" summary="" ><tr>',
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_15/provisioning_reports.gif" alt=""/></td>',
'<td>#BODY#</td></tr></table></td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'List Region with Icon - Report List'
,p_internal_name=>'LIST_REGION_WITH_ICON_REPORT_LIST'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>15
,p_theme_class_id=>29
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/hide_and_show_region_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56533802752997460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t15HideandShowRegion" id="#REGION_ID#">',
'<tr>',
'<td><table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">',
'<tr>',
'<td class="t15RegionHeader"><a style="margin-left:5px;" href="javascript:hideShow(''region#REGION_SEQUENCE_ID#'',''shIMG#REGION_SEQUENCE_ID#'',''#IMAGE_PREFIX#themes/theme_15/rollup_plus_dgray.gif'',''#IMAGE_PREFIX#themes/theme_15/rollup_minus_dgray.gif'');"'
||' class="t15HideandShowRegionLink"><img src="#IMAGE_PREFIX#themes/theme_15/rollup_plus_dgray.gif" ',
'  id="shIMG#REGION_SEQUENCE_ID#" alt="" /></a>#TITLE#</td>',
'<td class="t15ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>',
'</tr>',
'</table></td>',
'</tr>',
'<tr>',
'<td class="t15Body"><div class="t15Hide" id="region#REGION_SEQUENCE_ID#">#BODY#</div></td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'Hide and Show Region'
,p_internal_name=>'HIDE_AND_SHOW_REGION'
,p_theme_id=>15
,p_theme_class_id=>1
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Gray Head, white body'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_region_with_icon_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56533926166997460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table class="t15WizardRegion" id="#REGION_ID#" summary="">',
'<thead class="t15RegionHeader">',
'<tr>',
'<th class="t15RegionTitle">#TITLE#</th>',
'<td align="right" class="t15ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>',
'</tr>',
'</thead>',
'<tbody>',
'<tr><td colspan="2" class="t15Body">#BODY#</td></tr>',
'</tbody>',
'</table>'))
,p_page_plug_template_name=>'Wizard Region with Icon'
,p_internal_name=>'WIZARD_REGION_WITH_ICON'
,p_theme_id=>15
,p_theme_class_id=>20
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/reports_region_100_width_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56534027572997460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" border="0" summary="" width="100%" class="t15ReportsRegion100Width" id="#REGION_ID#">',
'<tr>',
'<td class="t15RegionHeader">#TITLE#</td>',
'<td align="right" class="t15ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>',
'</tr>',
'<tr>',
'<td class="t15Body" colspan="2">#BODY#</td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'Reports Region 100% Width'
,p_internal_name=>'REPORTS_REGION_100%_WIDTH'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>15
,p_theme_class_id=>13
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/form_region_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56534126062997460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table class="t15FormRegion" cellspacing="0"  border="0" summary="layout" id="#REGION_ID#">',
'<tr>',
'<td class="t15RegionHeader">#TITLE#</td>',
'<td align="right" class="t15ButtonHolder">#CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>',
'</tr>',
'<tr class="t15Body">',
'<td colspan="2" class="t15Body">#BODY#</td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'Form Region'
,p_internal_name=>'FORM_REGION'
,p_theme_id=>15
,p_theme_class_id=>8
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/reports_region_alternative_1_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56534215378997460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t15ReportsRegionAlternative1" id="#REGION_ID#">',
'<tr>',
'<td class="t15RegionHeader">#TITLE#</td>',
'<td class="t15ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td></tr>',
'<tr>',
'<td class="t15Body" colspan="2">#BODY#</td>',
'</tr>',
'</table>'))
,p_page_plug_template_name=>'Reports Region, Alternative 1'
,p_internal_name=>'REPORTS_REGION,_ALTERNATIVE_1'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>15
,p_theme_class_id=>10
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/button_region_with_title_002
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(56534306270997460)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" border="0" summary="" class="t15ButtonRegionwithTitle" id="#REGION_ID#">',
'<tr>',
'<td class="t15RegionHeader">#TITLE#</td>',
'</tr>',
'<tr>',
'<td class="t15ButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>',
'</tr>',
'</table>#BODY#'))
,p_page_plug_template_name=>'Button Region with Title'
,p_internal_name=>'BUTTON_REGION_WITH_TITLE'
,p_theme_id=>15
,p_theme_class_id=>4
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/button_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17336150386409411)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button value="#TEXT#" onclick="javascript:location.href=''#LINK#''" class="button-alt1" type="button">',
'  <span>#TEXT#</span>',
'</button>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button value="#TEXT#" onclick="javascript:location.href=''#LINK#''" class="button-default" type="button">',
'  <span>#TEXT#</span>',
'</button>'))
,p_list_template_name=>'Button List'
,p_internal_name=>'BUTTON_LIST'
,p_theme_id=>22
,p_theme_class_id=>6
,p_list_template_before_rows=>'<div class="button-list">'
,p_list_template_after_rows=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/centered_tab_set
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17336435165409412)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'          <li class="#LIST_STATUS#">',
'            <a href="#LINK#"><span>#TEXT#</span></a>',
'          </li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'          <li class="#LIST_STATUS#">',
'            <a href="#LINK#"><span>#TEXT#</span></a>',
'          </li>'))
,p_list_template_name=>'Centered Tab Set'
,p_internal_name=>'CENTERED_TAB_SET'
,p_theme_id=>22
,p_theme_class_id=>7
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="tS">',
'  <div class="tSO">',
'    <div class="tSI">',
'      <div class="tSU">',
'        <ul>'))
,p_list_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'         </ul>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/dhtml_tree
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17336756980409412)
,p_list_template_current=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'DHTML Tree'
,p_internal_name=>'DHTML_TREE'
,p_theme_id=>22
,p_theme_class_id=>23
,p_list_template_before_rows=>'<ul class="dhtmlTree">'
,p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_noncurr_w_child=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_curr_w_child=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li><a href="#LINK#">#TEXT#</a></li>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/hierarchical_expanding
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17337035432409412)
,p_list_template_current=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Hierarchical Expanding'
,p_internal_name=>'HIERARCHICAL_EXPANDING'
,p_theme_id=>22
,p_theme_class_id=>22
,p_list_template_before_rows=>'<ul class="dhtmlTree">'
,p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_sub_list_item_noncurrent=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif"  align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_noncurr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_curr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/horizontal_images_with_label_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17337335992409412)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="list-item-current">',
'  <div class="list-item-image"><a href="#LINK#" class="current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / ></a></div>',
'  <div class="list-item-label"><a href="#LINK#" class="current">#TEXT#</a></div>',
'</div>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="list-item">',
'  <div class="list-item-image"><a href="#LINK#" class="current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / ></a></div>',
'  <div class="list-item-label"><a href="#LINK#" class="current">#TEXT#</a></div>',
'</div>'))
,p_list_template_name=>'Horizontal Images with Label List'
,p_internal_name=>'HORIZONTAL_IMAGES_WITH_LABEL_LIST'
,p_theme_id=>22
,p_theme_class_id=>4
,p_list_template_before_rows=>'<div class="horizontal-images-list">'
,p_list_template_after_rows=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/horizontal_links_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17337655367409412)
,p_list_template_current=>'<a href="#LINK#" class="current">#TEXT#</a>'
,p_list_template_noncurrent=>'<a href="#LINK#">#TEXT#</a>'
,p_list_template_name=>'Horizontal Links List'
,p_internal_name=>'HORIZONTAL_LINKS_LIST'
,p_theme_id=>22
,p_theme_class_id=>3
,p_list_template_before_rows=>'<div class="horizontal-links-list">'
,p_list_template_after_rows=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/horizontal_tabs_rounded_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17337962316409412)
,p_list_template_current=>'<li class="#LIST_STATUS#"><a href="#LINK#"><span>#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="#LIST_STATUS#"><a href="#LINK#"><span>#TEXT#</span></a></li>'
,p_list_template_name=>'Horizontal Tabs Rounded List'
,p_internal_name=>'HORIZONTAL_TABS_ROUNDED_LIST'
,p_theme_id=>22
,p_theme_class_id=>7
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="sHTabs">',
'	<div class="sHTabsInner">',
'		<ul>'))
,p_list_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'		</ul>',
'	</div>',
'</div>'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/horizontal_tabs_rounded_list_full_width
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17338260380409413)
,p_list_template_current=>'<li class="#LIST_STATUS#"><a href="#LINK#"><span>#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="#LIST_STATUS#"><a href="#LINK#"><span>#TEXT#</span></a></li>'
,p_list_template_name=>'Horizontal Tabs Rounded List (Full Width)'
,p_internal_name=>'HORIZONTAL_TABS_ROUNDED_LIST_FULL_WIDTH'
,p_theme_id=>22
,p_theme_class_id=>7
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="sHFWTabs">',
'<div class="sHTabs">',
'	<div class="sHTabsInner">',
'		<ul>'))
,p_list_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'			<li class="last"></li>',
'		</ul>',
'	</div>',
'</div>',
'</div>'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/page_level_tabs_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17338532492409413)
,p_list_template_current=>'<li class="#LIST_STATUS#"><a href="#LINK#"><span></span>#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li class="#LIST_STATUS#"><a href="#LINK#"><span></span>#TEXT#</a></li>'
,p_list_template_name=>'Page Level Tabs List'
,p_internal_name=>'PAGE_LEVEL_TABS_LIST'
,p_theme_id=>22
,p_theme_class_id=>7
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="sBTabs">',
'	<div class="sBTabsInner">',
'		<ul>'))
,p_list_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'			<li class="last"></li>',
'		</ul>',
'	</div>',
'</div>'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/pull_down_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17338842479409413)
,p_list_template_current=>'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Pull Down Menu'
,p_internal_name=>'PULL_DOWN_MENU'
,p_theme_id=>22
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">'
,p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="dhtmlMenuSep2"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt="" class="dhtmlMenuSep2" /></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_22/images/menu-small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" />',
'</li>'))
,p_item_templ_noncurr_w_child=>'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_22/images/menu-small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>'
,p_sub_templ_curr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>'
,p_sub_templ_noncurr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" / ></a></li>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/pull_down_menu_with_image
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17339162383409413)
,p_list_template_current=>'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a><'
||'/div>'
,p_list_template_noncurrent=>'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  "/></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a>'
||'</div>'
,p_list_template_name=>'Pull Down Menu with Image'
,p_internal_name=>'PULL_DOWN_MENU_WITH_IMAGE'
,p_theme_id=>22
,p_theme_class_id=>21
,p_list_template_before_rows=>'<div class="dhtmlMenuLG">'
,p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="S#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt="" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom3(thi'
||'s,''S#LIST_ITEM_ID#'',''#LIST_ITEM_ID#'',false)" />',
'<a href="#LINK#" class="dhtmlBottom">#TEXT#</a>',
'</div>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="dhtmlMenuItem"><a href="#LINK#" id="#LIST_ITEM_ID#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR#  /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom3(th'
||'is,''S#LIST_ITEM_ID#'',''#LIST_ITEM_ID#'',false)" />',
'<a href="#LINK#" class="dhtmlBottom">#TEXT#</a>',
'</div>'))
,p_sub_templ_curr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''S#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>'
,p_sub_templ_noncurr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''S#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/tabbed_navigation_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17339445020409413)
,p_list_template_current=>'<li class="active"><a href="#LINK#"><span>#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#"><span>#TEXT#</span></a></li>'
,p_list_template_name=>'Tabbed Navigation List'
,p_internal_name=>'TABBED_NAVIGATION_LIST'
,p_theme_id=>22
,p_theme_class_id=>7
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="sHorizontalTabs">',
'	<div class="sHorizontalTabsInner">',
'		<ul>'))
,p_list_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'		</ul>',
'	</div>',
'</div>'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/vertical_images_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17339751637409413)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="list-item-current">',
'  <div class="list-item-image"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / ></div>',
'  <div class="list-item-label"><a href="#LINK#" class="current">#TEXT#</a></div>',
'</div>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="list-item">',
'  <div class="list-item-image"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" / ></div>',
'  <div class="list-item-label"><a href="#LINK#" class="current">#TEXT#</a></div>',
'</div>'))
,p_list_template_name=>'Vertical Images List'
,p_internal_name=>'VERTICAL_IMAGES_LIST'
,p_theme_id=>22
,p_theme_class_id=>5
,p_list_template_before_rows=>'<div class="vertical-images-list">'
,p_list_template_after_rows=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/vertical_ordered_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17340039910409413)
,p_list_template_current=>'<li class="current">#TEXT#</li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Ordered List'
,p_internal_name=>'VERTICAL_ORDERED_LIST'
,p_theme_id=>22
,p_theme_class_id=>2
,p_list_template_before_rows=>'<ol class="vertical-ordered-List">'
,p_list_template_after_rows=>'</ol>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/vertical_sidebar_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17340349504409415)
,p_list_template_current=>'<li class="active"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Sidebar List'
,p_internal_name=>'VERTICAL_SIDEBAR_LIST'
,p_theme_id=>22
,p_theme_class_id=>19
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="vertical-sidebar-list">',
'<ul>'))
,p_list_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'</div>'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17340532544409415)
,p_list_template_current=>'<li class="current"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Unordered List with Bullets'
,p_internal_name=>'VERTICAL_UNORDERED_LIST_WITH_BULLETS'
,p_theme_id=>22
,p_theme_class_id=>1
,p_list_template_before_rows=>'<ul class="vertical-unordered-list-with-bullets-alt">'
,p_list_template_after_rows=>'</ul>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets_alternative
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17340849953409415)
,p_list_template_current=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Unordered List with Bullets, Alternative'
,p_internal_name=>'VERTICAL_UNORDERED_LIST_WITH_BULLETS,_ALTERNATIVE'
,p_theme_id=>22
,p_theme_class_id=>1
,p_list_template_before_rows=>'<ul class="vertical-unordered-list-with-bullets">'
,p_list_template_after_rows=>'</ul>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/vertical_unordered_list_without_bullets
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17341146890409415)
,p_list_template_current=>'<li class="current">#TEXT#</li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Unordered List without Bullets'
,p_internal_name=>'VERTICAL_UNORDERED_LIST_WITHOUT_BULLETS'
,p_theme_id=>22
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="vertical-unordered-list-without-bullets">'
,p_list_template_after_rows=>'</ul>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/wizard_progress_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17341432618409415)
,p_list_template_current=>'<li class="current">#TEXT#</li>'
,p_list_template_noncurrent=>'<li class="non-current">#TEXT#</li>'
,p_list_template_name=>'Wizard Progress List'
,p_internal_name=>'WIZARD_PROGRESS_LIST'
,p_theme_id=>22
,p_theme_class_id=>17
,p_list_template_before_rows=>'<div class="wizard-progress-list" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_between_items=>'<li class="progress-indicator">&nbsp;</li>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/wizard_progress_list_horizontal_train
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(17341733839409415)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    <li class="#LIST_STATUS#">',
'      <span>#TEXT#</span>',
'    </li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    <li class="#LIST_STATUS#">',
'      <span>#TEXT#</span>',
'    </li>'))
,p_list_template_name=>'Wizard Progress List, Horizontal Train'
,p_internal_name=>'WIZARD_PROGRESS_LIST,_HORIZONTAL_TRAIN'
,p_theme_id=>22
,p_theme_class_id=>17
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="sHorizontalProgressList">',
'  <ul>'))
,p_list_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  </ul>',
'</div>'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/dhtml_menu_with_sublist
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56534419068997460)
,p_list_template_current=>'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'DHTML Menu with Sublist'
,p_internal_name=>'DHTML_MENU_WITH_SUBLIST'
,p_theme_id=>15
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">'
,p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="dhtmlMenuSep2"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt="" class="dhtmlMenuSep2" /></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>'
,p_item_templ_noncurr_w_child=>'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>'
,p_sub_templ_curr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#themes/theme_13/menu_open_right.gif" /></a'
||'></li>'
,p_sub_templ_noncurr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#themes/theme_13/menu_open_right.gif" /></a'
||'></li>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/dhtml_tree_002
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56534534871997470)
,p_list_template_current=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'DHTML Tree'
,p_internal_name=>'DHTML_TREE'
,p_theme_id=>15
,p_theme_class_id=>22
,p_list_template_before_rows=>'<ul class="dhtmlTree">'
,p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_sub_list_item_noncurrent=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif"  align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_noncurr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  alt="" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_curr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" alt="" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" /><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/dhtml_list_image_with_sublist
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56534632791997470)
,p_list_template_current=>'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>'
,p_list_template_noncurrent=>'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>'
,p_list_template_name=>'DHTML List (Image) with Sublist'
,p_internal_name=>'DHTML_LIST_IMAGE_WITH_SUBLIST'
,p_theme_id=>15
,p_theme_class_id=>21
,p_list_template_before_rows=>'<div class="dhtmlMenuLG">'
,p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_'
||'ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>'
,p_item_templ_noncurr_w_child=>'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_'
||'ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>'
,p_sub_templ_curr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>'
,p_sub_templ_noncurr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/vertical_unordered_list_without_bullet
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56534726662997470)
,p_list_template_current=>'<li class="t15current">#TEXT#</li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Unordered List without Bullet'
,p_internal_name=>'VERTICAL_UNORDERED_LIST_WITHOUT_BULLET'
,p_theme_id=>15
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t15VerticalUnorderedListwithoutBullet">'
,p_list_template_after_rows=>'</ul>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/horizontal_images_with_label_list_002
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56534834642997470)
,p_list_template_current=>'<td class="t15current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" /><br />#TEXT#</td>'
,p_list_template_noncurrent=>'<td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" /></a><br /><a href="#LINK#">#TEXT#</a></td>'
,p_list_template_name=>'Horizontal Images with Label List'
,p_internal_name=>'HORIZONTAL_IMAGES_WITH_LABEL_LIST'
,p_theme_id=>15
,p_theme_class_id=>4
,p_list_template_before_rows=>'<table cellspacing="0" cellpadding="0" border="0" class="t15HorizontalImageswithLabelList" summary=""><tr>'
,p_list_template_after_rows=>'</tr></table>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/horizontal_links_list_002
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56534916982997470)
,p_list_template_current=>'<a href="#LINK#" class="t15Current">&gt;#TEXT#&lt;</a>'
,p_list_template_noncurrent=>'<a href="#LINK#">#TEXT#</a>'
,p_list_template_name=>'Horizontal Links List'
,p_internal_name=>'HORIZONTAL_LINKS_LIST'
,p_theme_id=>15
,p_theme_class_id=>3
,p_list_template_before_rows=>'<div class="t15HorizontalLinksList">'
,p_list_template_after_rows=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/vertical_images_list_002
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56535010638997471)
,p_list_template_current=>'<tr><td class="t15current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" /></td></tr>'
,p_list_template_noncurrent=>'<tr><td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" /></a></td></tr>'
,p_list_template_name=>'Vertical Images List'
,p_internal_name=>'VERTICAL_IMAGES_LIST'
,p_theme_id=>15
,p_theme_class_id=>5
,p_list_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="0" class="t15VerticalImagesList">'
,p_list_template_after_rows=>'</table>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/vertical_ordered_list_002
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56535104074997473)
,p_list_template_current=>'<li class="t15current"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Ordered List'
,p_internal_name=>'VERTICAL_ORDERED_LIST'
,p_theme_id=>15
,p_theme_class_id=>2
,p_list_template_before_rows=>'<ol class="t15VerticalOrderedList">'
,p_list_template_after_rows=>'</ol>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/tabbed_navigation_list_002
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56535209125997473)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<td valign="bottom" class="t15SepL"><img src="#IMAGE_PREFIX#themes/theme_15/tab_list_left_cap.gif" /></td>',
'<td class="t15CurrentListTab"><a class="t15CurrentListTab" href="#LINK#">#TEXT#</a></td>',
'<td valign="bottom" class="t15SepR"><img src="#IMAGE_PREFIX#themes/theme_15/tab_list_right_cap.gif" /></td>'))
,p_list_template_noncurrent=>'<td><a href="#LINK#">#TEXT#</a></td>'
,p_list_template_name=>'Tabbed Navigation List'
,p_internal_name=>'TABBED_NAVIGATION_LIST'
,p_theme_id=>15
,p_theme_class_id=>7
,p_list_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0"  summary="" width="100%" class="t15TabbedNavigationList"><tbody><tr><td class="t15LeftTabList">&nbsp;&nbsp;&nbsp;&nbsp;</td>'
,p_list_template_after_rows=>'<td class="t14EndCap" width="100%">&nbsp;</td></tr></tbody></table>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullets_002
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56535302619997473)
,p_list_template_current=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Unordered List with Bullets'
,p_internal_name=>'VERTICAL_UNORDERED_LIST_WITH_BULLETS'
,p_theme_id=>15
,p_theme_class_id=>1
,p_list_template_before_rows=>'<ul class="t15noIndent">'
,p_list_template_after_rows=>'</ul>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/button_list_002
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56535431093997473)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table class="t15Button" cellspacing="0" cellpadding="0" border="0"  summary="">',
'<tr>',
'<td class="t15L"><img src="#IMAGE_PREFIX#themes/theme_15/button-l.gif" alt="" /></td>',
'<td class="t15C"><a href="#LINK#" style="font-weight:bold;">>#TEXT#<</a></td>',
'<td class="t15R"><img src="#IMAGE_PREFIX#themes/theme_15/button-r.gif" alt="" /></td>',
'</tr>',
'</table>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table class="t15Button" cellspacing="0" cellpadding="0" border="0"  summary="">',
'<tr>',
'<td class="t15L"><img src="#IMAGE_PREFIX#themes/theme_15/button-l.gif" alt="" /></td>',
'<td class="t15C"><a href="#LINK#">#TEXT#</a></td>',
'<td class="t15R"><img src="#IMAGE_PREFIX#themes/theme_15/button-r.gif" alt="" /></td>',
'</tr>',
'</table>'))
,p_list_template_name=>'Button List'
,p_internal_name=>'BUTTON_LIST'
,p_theme_id=>15
,p_theme_class_id=>6
,p_list_template_before_rows=>'<div class="t15ButtonList">'
,p_list_template_after_rows=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/wizard_progress_list_002
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56535530852997473)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<tr><td class="t15Current">#TEXT#</td></tr>',
'<tr><td class="t15CurrentImage"><img src="#IMAGE_PREFIX#arrow_down.gif" width="7" height="6" alt="" /></td></tr>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<tr><td>#TEXT#</td></tr>',
'<tr><td class="t15Image"><img src="#IMAGE_PREFIX#arrow_down.gif" width="7" height="6" alt="" /></td></tr>'))
,p_list_template_name=>'Wizard Progress List'
,p_internal_name=>'WIZARD_PROGRESS_LIST'
,p_theme_id=>15
,p_theme_class_id=>17
,p_list_template_before_rows=>'<table class="t15WizardProgressList" cellpadding="0" cellspacing="0" border="0" summary="">'
,p_list_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<tr><td align="center">Done</td></tr>',
'</table>'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/tree_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56535605890997473)
,p_list_template_current=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Tree List'
,p_internal_name=>'TREE_LIST'
,p_theme_id=>15
,p_theme_class_id=>23
,p_list_template_before_rows=>'<ul class="htmlTree">'
,p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>'
,p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_item_templ_noncurr_w_child=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_curr_w_child=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li><a href="#LINK#">#TEXT#</a></li>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/vertical_sidebar_list_002
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(56535718660997473)
,p_list_template_current=>'<li><a href="#LINK#" class="t15Current">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Vertical Sidebar List'
,p_internal_name=>'VERTICAL_SIDEBAR_LIST'
,p_theme_id=>15
,p_theme_class_id=>19
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t15VerticalSidebarList">',
''))
,p_list_template_after_rows=>'</ul>'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/borderless_report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(17342049083409416)
,p_row_template_name=>'Borderless Report'
,p_internal_name=>'BORDERLESS_REPORT'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#<tr>',
'<td><table class="report-borderless" cellpadding="0" border="0" cellspacing="0" summary="">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table><div class="CSV">#EXTERNAL_LINK##CSV_LINK#</div></td>',
'</tr>',
'#PAGINATION#',
'</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th class="header"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>'
,p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>'
,p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>'
,p_theme_id=>22
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(17342049083409416)
,p_row_template_before_first=>'<tr #HIGHLIGHT_ROW#>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/fixed_headers
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(17342541968409416)
,p_row_template_name=>'Fixed Headers'
,p_internal_name=>'FIXED_HEADERS'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data" #COLUMN_WIDTH#><p #COLUMN_WIDTH#>#COLUMN_VALUE#</p></td>'
,p_row_template2=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data-alt" #COLUMN_WIDTH#><p #COLUMN_WIDTH#>#COLUMN_VALUE#</p></td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table border="0" cellpadding="0" cellspacing="0" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" class="report-holder">#TOP_PAGINATION#',
'<tr>',
'<td><div class="fixed-header-report"><table cellpadding="0" border="0" cellspacing="0" summary="">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</tbody></table></div><div class="CSV">#EXTERNAL_LINK##CSV_LINK#</div></td>',
'</tr>',
'#PAGINATION#',
'</table>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<thead>',
''))
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="header" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>',
''))
,p_row_template_display_cond1=>'ODD_ROW_NUMBERS'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'ODD_ROW_NUMBERS'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>',
''))
,p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>'
,p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>'
,p_row_style_mouse_over=>'#d8e4f0'
,p_row_style_checked=>'#d8e4f0'
,p_theme_id=>22
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(17342541968409416)
,p_row_template_before_first=>'<tr #HIGHLIGHT_ROW#>'
,p_row_template_after_last=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</tr>',
''))
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/horizontal_border
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(17343047841409416)
,p_row_template_name=>'Horizontal Border'
,p_internal_name=>'HORIZONTAL_BORDER'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" border="0" cellspacing="0" summary="" class="horizontal-border" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#',
'<tr>',
'<td><table cellpadding="0" cellspacing="0" border="0" class="report-standard" summary="">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table><div class="CSV">#EXTERNAL_LINK##CSV_LINK#</div></td>',
'</tr>',
'#PAGINATION#',
'</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="header">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>'
,p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>'
,p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>'
,p_row_style_checked=>'#ccc'
,p_theme_id=>22
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(17343047841409416)
,p_row_template_before_first=>'<tr #HIGHLIGHT_ROW#>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/one_column_unordered_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(17343548321409417)
,p_row_template_name=>'One Column Unordered List'
,p_internal_name=>'ONE_COLUMN_UNORDERED_LIST'
,p_row_template1=>'<li>#COLUMN_VALUE#</li>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">',
'#TOP_PAGINATION#',
'<tr><td><ul class="t1OneColumnUnorderedList">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul><div class="t1CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>',
'#PAGINATION#',
'</table>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>'
,p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>'
,p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>'
,p_theme_id=>22
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(17343548321409417)
,p_row_template_before_first=>'OMIT'
,p_row_template_after_last=>'OMIT'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/search_results_report_select_link_text_link_target_detail1_detail2_last_modified
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(17344054731409417)
,p_row_template_name=>'Search Results Report (SELECT link_text, link_target, detail1, detail2, last_modified)'
,p_internal_name=>'SEARCH_RESULTS_REPORT_SELECT_LINK_TEXT,_LINK_TARGET,_DETAIL1,_DETAIL2,_LAST_MODIFIED'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li>',
'<span class="title"><a href="#2#">#1#</a></span>',
'<span class="description"><span class="last_modified">#5#</span>#3#</span>',
'<span class="type">#4#</span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="sSearchResultsReport">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul> ',
'#PAGINATION#'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>'
,p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>'
,p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>'
,p_theme_id=>22
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/standard
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(17344347028409417)
,p_row_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="data">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#',
'<tr>',
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="report-standard">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table><div class="CSV">#EXTERNAL_LINK##CSV_LINK#</div></td>',
'</tr>',
'#PAGINATION#',
'</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="header">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>'
,p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>'
,p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>'
,p_row_style_mouse_over=>'#F0F0F0'
,p_row_style_checked=>'#E8E8E8'
,p_theme_id=>22
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(17344347028409417)
,p_row_template_before_first=>'<tr #HIGHLIGHT_ROW#>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/standard_alternating_row_colors
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(17344855160409417)
,p_row_template_name=>'Standard, Alternating Row Colors'
,p_internal_name=>'STANDARD,_ALTERNATING_ROW_COLORS'
,p_row_template1=>'<td class="data"#ALIGNMENT#>#COLUMN_VALUE#</td>'
,p_row_template2=>'<td class="dataalt"#ALIGNMENT#>#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table border="0" cellpadding="0" cellspacing="0" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" class="report-holder">#TOP_PAGINATION#<tr><td>',
'<table border="0" cellpadding="0" cellspacing="0" class="report-standard-alternatingrowcolors" summary="" >'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table><div class="CSV">#EXTERNAL_LINK##CSV_LINK#</div></td>',
'</tr>',
'#PAGINATION#',
'</table>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th class="header"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'ODD_ROW_NUMBERS'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'ODD_ROW_NUMBERS'
,p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>'
,p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>'
,p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>'
,p_theme_id=>22
,p_theme_class_id=>5
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(17344855160409417)
,p_row_template_before_first=>'<tr #HIGHLIGHT_ROW#>'
,p_row_template_after_last=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</tr>',
''))
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/two_column_portlet
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(17345346964409417)
,p_row_template_name=>'Two Column Portlet'
,p_internal_name=>'TWO_COLUMN_PORTLET'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="report-row">',
'  <div class="report-col-hdr">#1#</div>',
'  <div class="report-col-val">#2#</div>',
'</div>'))
,p_row_template_before_rows=>'<div class="two-col-report-portlet" #REPORT_ATTRIBUTES# id="#REGION_ID#">'
,p_row_template_after_rows=>'</div>'
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>22
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_div
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(17345635310409417)
,p_row_template_name=>'Value Attribute Pairs - Div'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_DIV'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="report-row">',
'  <div class="report-col-hdr">#COLUMN_HEADER#</div>',
'  <div class="report-col-val">#COLUMN_VALUE#</div>',
'</div>'))
,p_row_template_before_rows=>'<div class="two-col-report-portlet">'
,p_row_template_after_rows=>'</div>'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>22
,p_theme_class_id=>6
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_table
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(17345946463409418)
,p_row_template_name=>'Value Attribute Pairs - Table'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_TABLE'
,p_row_template1=>'<tr><th class="header">#COLUMN_HEADER#</th><td class="data">#COLUMN_VALUE#</td></tr>'
,p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" class="ValueAttributePairsParent">#TOP_PAGINATION#<tr><td><table cellpadding="0" cellspacing="0" border="0" summary="" class="ValueAttribu'
||'tePairs">'
,p_row_template_after_rows=>'</table><div class="CSV">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT#</a>'
,p_previous_page_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS#</a>'
,p_next_set_template=>'<a href="#LINK#" class="sPaginationNext">#PAGINATION_NEXT_SET#</a>'
,p_previous_set_template=>'<a href="#LINK#" class="sPaginationPrev">#PAGINATION_PREVIOUS_SET#</a>'
,p_theme_id=>22
,p_theme_class_id=>6
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/standard_report
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(56535825040997473)
,p_row_template_name=>'Standard Report'
,p_internal_name=>'STANDARD_REPORT'
,p_row_template1=>'<td class="t15data" #ALIGNMENT#>#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>'<table class="t15standard" summary="Report">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<tr>',
'    <td colspan="99" class="t15afterrows">',
'        <span class="left">#EXTERNAL_LINK##CSV_LINK#</span>',
'        <table style="float:right;text-align:right;" summary="pagination">#PAGINATION#</table>',
'    </td>',
'</tr></table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th class="t15header" #ALIGNMENT#>#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_row_style_mouse_over=>'#cfe0f1'
,p_row_style_checked=>'#cfe0f1'
,p_theme_id=>15
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(56535825040997473)
,p_row_template_before_first=>'<tr #HIGHLIGHT_ROW#>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/borderless
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(56535913535997481)
,p_row_template_name=>'Borderless'
,p_internal_name=>'BORDERLESS'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t15data">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#',
'<tr><td><table class="t15borderless" cellpadding="0" border="0" cellspacing="0" summary="">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PAGINATION#',
'</table><span class="left">#EXTERNAL_LINK##CSV_LINK#</span></td></tr></table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th class="t15header"#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_row_style_mouse_over=>'#cfe0f1'
,p_row_style_checked=>'#cfe0f1'
,p_theme_id=>15
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_row_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t1reportborderless{ }',
'.t1reportborderless .t1reportheader{ }',
'.t1reportborderless .t1reportdata{ }'))
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(56535913535997481)
,p_row_template_before_first=>'<tr #HIGHLIGHT_ROW#>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/horizontal_border_002
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(56536020345997481)
,p_row_template_name=>'Horizontal Border'
,p_internal_name=>'HORIZONTAL_BORDER'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t15data">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#',
'<tr>',
'<td><table cellpadding="0" cellspacing="0" border="0" class="t15horizontalborder" summary="">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<tr>',
'    <td colspan="99" class="t15afterrows">',
'        <span class="left">#EXTERNAL_LINK##CSV_LINK#</span>',
'        <table style="float:right;text-align:right;" summary="pagination"><tr><td></td></tr>#PAGINATION#</table>',
'    </td>',
'</tr></table></td></tr></table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t15header">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_row_style_mouse_over=>'#cfe0f1'
,p_row_style_checked=>'#cfe0f1'
,p_theme_id=>15
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(56536020345997481)
,p_row_template_before_first=>'<tr #HIGHLIGHT_ROW#>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(56536122684997481)
,p_row_template_name=>'Value Attribute Pairs'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<tr><th class="t15header">#COLUMN_HEADER#</th><td class="t15data">#COLUMN_VALUE#</td></tr>',
''))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" border="0" cellspacing="0" summary="">',
'#TOP_PAGINATION#',
'<tr><td><table cellpadding="0" cellspacing="0" border="0" summary="" class="t15ValueAttributePairs">'))
,p_row_template_after_rows=>'</table>#EXTERNAL_LINK#</td></tr>#PAGINATION#</table>'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_theme_id=>15
,p_theme_class_id=>6
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(56536122684997481)
,p_row_template_before_first=>'OMIT'
,p_row_template_after_last=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<tr><td colspan="2" class="t15seperate"><hr /></td></tr>',
''))
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/standard_report_with_alt_row_colors
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(56536214008997481)
,p_row_template_name=>'Standard Report (with alt row colors)'
,p_internal_name=>'STANDARD_REPORT_WITH_ALT_ROW_COLORS'
,p_row_template1=>'<td class="t15data"#ALIGNMENT#>#COLUMN_VALUE#</td>'
,p_row_template2=>'<td class="t15dataalt"#ALIGNMENT#>#COLUMN_VALUE#</td>'
,p_row_template3=>'<td bgcolor="red" class="alt"#ALIGNMENT#>#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>'<table class="t15standardalternatingrowcolors" cellpadding="0" cellspacing="0" summary="">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<tr>',
'    <td colspan="99" class="t15afterrows">',
'        <span class="left">#EXTERNAL_LINK##CSV_LINK#</span>',
'        <table style="float:right;text-align:right;" summary="pagination">#PAGINATION#</table>',
'    </td>',
'</tr>',
'</table>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th class="t15header" #ALIGNMENT#>#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'EVEN_ROW_NUMBERS'
,p_row_template_display_cond2=>'ODD_ROW_NUMBERS'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'EVEN_ROW_NUMBERS'
,p_row_style_mouse_over=>'#cfe0f1'
,p_row_style_checked=>'#cfe0f1'
,p_theme_id=>15
,p_theme_class_id=>5
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(56536214008997481)
,p_row_template_before_first=>'<tr #HIGHLIGHT_ROW#>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/one_column_unordered_list_002
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(56536320890997481)
,p_row_template_name=>'One Column Unordered List'
,p_internal_name=>'ONE_COLUMN_UNORDERED_LIST'
,p_row_template1=>'<li>#COLUMN_VALUE#</li>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellpadding="0" cellspacing="0" summary="">',
'#TOP_PAGINATION#',
'<tr><td><ul class="t1OneColumnUnorderedList">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>#EXTERNAL_LINK##CSV_LINK#</td></tr>',
'#PAGINATION#',
'</table>'))
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_theme_id=>15
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(56536320890997481)
,p_row_template_before_first=>'OMIT'
,p_row_template_after_last=>'OMIT'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/standard_report_ppr
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(56536428240997481)
,p_row_template_name=>'Standard Report (PPR)'
,p_internal_name=>'STANDARD_REPORT_PPR'
,p_row_template1=>'<td class="t15data" #ALIGNMENT#>#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table summary="" border="0" cellpadding="0" border="0"><tr><td colspan="2"><table class="t15standard" summary="" border="0" cellpadding="0" border="0">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</tr></table></td></tr>',
'<tr>',
'	<td valign="top">#EXTERNAL_LINK##CSV_LINK#</td>',
'	<td valign="top" align="right"><table summary="" align="right">#PAGINATION#</table></td>',
'</tr>',
'</table>',
'',
'<script language=JavaScript type=text/javascript>',
'<!--',
'init_htmlPPRReport(''#REGION_ID#'');',
'',
'//-->',
'</script>',
'</htmldb:#REGION_ID#>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th class="t15header" #ALIGNMENT#>#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><img src="/i/jtfunexe.gif" alt="" /></a>'
,p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><img src="/i/jtfupree.gif" alt=""/></a>'
,p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><img src="/i/jtfunexe.gif" alt="" /></a>'
,p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><img src="/i/jtfupree.gif" alt=""/></a>'
,p_row_style_mouse_over=>'#cfe0f1'
,p_row_style_checked=>'#cfe0f1'
,p_theme_id=>15
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(56536428240997481)
,p_row_template_before_first=>'<tr #HIGHLIGHT_ROW#>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/label/no_label
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(17346256126409418)
,p_template_name=>'No Label'
,p_internal_name=>'NO_LABEL'
,p_template_body1=>'<span class="hidden-label">'
,p_template_body2=>'</span>'
,p_on_error_before_label=>'<div class="t1InlineError">'
,p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>'
,p_theme_id=>22
,p_theme_class_id=>13
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(17346335252409418)
,p_template_name=>'Optional'
,p_internal_name=>'OPTIONAL'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" tabindex="999"><span class="optional">'
,p_template_body2=>'</span></label>'
,p_on_error_before_label=>'<div class="t1InlineError">'
,p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>'
,p_theme_id=>22
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_with_help
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(17346441206409418)
,p_template_name=>'Optional with help'
,p_internal_name=>'OPTIONAL_WITH_HELP'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" tabindex="999"><a class="optional-w-help" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">'
,p_template_body2=>'</a></label>'
,p_on_error_before_label=>'<div class="t1InlineError">'
,p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>'
,p_theme_id=>22
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(17346551320409418)
,p_template_name=>'Required'
,p_internal_name=>'REQUIRED'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_22/images/required.png" alt="#VALUE_REQUIRED#" tabindex="999" /> <span class="required">'
,p_template_body2=>'</span></label>'
,p_on_error_before_label=>'<div class="t1InlineError">'
,p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>'
,p_theme_id=>22
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_with_help
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(17346662877409418)
,p_template_name=>'Required with help'
,p_internal_name=>'REQUIRED_WITH_HELP'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" tabindex="999"><a class="required-w-help" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999"><img src="#IMAGE_PREFIX#themes/theme_22/images/required.png" alt="#VALUE_REQUI'
||'RED#" tabindex="999" /> '
,p_template_body2=>'</a></label>'
,p_on_error_before_label=>'<div class="t1InlineError">'
,p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>'
,p_theme_id=>22
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/no_label_002
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(56536531891997482)
,p_template_name=>'No Label'
,p_internal_name=>'NO_LABEL'
,p_template_body1=>'<span class="t15NoLabel">'
,p_template_body2=>'</span>'
,p_theme_id=>15
,p_theme_class_id=>13
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_002
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(56536631142997493)
,p_template_name=>'Required'
,p_internal_name=>'REQUIRED'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><img src="#IMAGE_PREFIX#themes/theme_15/requiredicon_status2.gif" alt="" /><span class="t15required">'
,p_template_body2=>'</span></label>'
,p_theme_id=>15
,p_theme_class_id=>4
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_label_with_help
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(56536705056997495)
,p_template_name=>'Required Label with Help'
,p_internal_name=>'REQUIRED_LABEL_WITH_HELP'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><img src="#IMAGE_PREFIX#themes/theme_15/requiredicon_status2.gif" alt="" /><a class="t15requiredwithhelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">'
,p_template_body2=>'</a></label>'
,p_theme_id=>15
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_002
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(56536803303997495)
,p_template_name=>'Optional'
,p_internal_name=>'OPTIONAL'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><span class="t15Optional">'
,p_template_body2=>'</span></label>'
,p_theme_id=>15
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_label_with_help
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(56536903519997495)
,p_template_name=>'Optional Label with Help'
,p_internal_name=>'OPTIONAL_LABEL_WITH_HELP'
,p_template_body1=>'<a class="t15optionalwithhelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">'
,p_template_body2=>'</a>'
,p_theme_id=>15
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumb_menu
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(17346735300409418)
,p_name=>'Breadcrumb Menu'
,p_internal_name=>'BREADCRUMB_MENU'
,p_before_first=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="breadcrumb_container">',
'	<ul>',
'		<li class="open"><span></span></li>'))
,p_current_page_option=>'		<li class="active"><a href="#LINK#">#NAME#</a></li>'
,p_non_current_page_option=>'		<li><a href="#LINK#">#NAME#</a></li>'
,p_between_levels=>'		<li class="sep"><span></span></li>'
,p_after_last=>wwv_flow_string.join(wwv_flow_t_varchar2(
'		<li class="close"><span></span></li>',
'	</ul>',
'</div>'))
,p_max_levels=>12
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>22
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/hierarchical_menu
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(17346837636409418)
,p_name=>'Hierarchical Menu'
,p_internal_name=>'HIERARCHICAL_MENU'
,p_before_first=>'<ul class="t1HierarchicalMenu">'
,p_current_page_option=>'<li class="t1current">#NAME#</li>'
,p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>11
,p_start_with_node=>'CHILD_MENU'
,p_theme_id=>22
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/hierarchical_menu_002
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(56537011009997495)
,p_name=>'Hierarchical Menu'
,p_internal_name=>'HIERARCHICAL_MENU'
,p_before_first=>'<ul class="t15HierarchicalMenu">'
,p_current_page_option=>'<li class="t15current"><a href="#LINK#">#NAME#</a></li>'
,p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>11
,p_start_with_node=>'CHILD_MENU'
,p_theme_id=>15
,p_theme_class_id=>2
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumbs
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(56537133478997506)
,p_name=>'Breadcrumbs'
,p_internal_name=>'BREADCRUMBS'
,p_before_first=>'<ul>'
,p_current_page_option=>'<li class="t15Current"><span>#NAME#</span></li>'
,p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>'
,p_between_levels=>'<li><span>></span></li>'
,p_after_last=>'</ul>'
,p_max_levels=>12
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>15
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(17347536185409420)
,p_popup_icon=>'#IMAGE_PREFIX#themes/theme_22/images/sPopupLOVIcon.png'
,p_popup_icon_attr=>'alt="Popup Lov"'
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#APEX_JAVASCRIPT#',
'<link rel="shortcut icon" href="#IMAGE_PREFIX#favicon.ico" type="image/x-icon">  <link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_22/css/theme_4_0.css" type="text/css" media="all"/>',
'',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="pop-up-lov"'
,p_before_field_text=>'<div class="t1PopupHead">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_find_button_text=>'Search'
,p_close_button_text=>'Close'
,p_next_button_text=>'Next >'
,p_prev_button_text=>'< Previous'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'400'
,p_height=>'450'
,p_result_row_x_of_y=>'<div style="padding:5px 10px; font-size:10px;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>500
,p_before_result_set=>'<div class="t1PopupBody">'
,p_theme_id=>22
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(56537802616997515)
,p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif'
,p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"'
,p_page_name=>'Popup LOV'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#APEX_JAVASCRIPT#',
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_15/theme_V2.css" type="text/css" />',
'',
'',
'</head>'))
,p_page_body_attr=>'onload="first_field()" style="margin:0;"'
,p_before_field_text=>'<div class="t15PopupHead">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_find_button_text=>'Search'
,p_close_button_text=>'Close'
,p_next_button_text=>'Next &gt;'
,p_prev_button_text=>'&lt; Previous'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'400'
,p_height=>'450'
,p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>500
,p_before_result_set=>'<div class="t15PopupBody">'
,p_theme_id=>15
,p_theme_class_id=>1
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(17346957518409418)
,p_cal_template_name=>'Calendar'
,p_internal_name=>'CALENDAR'
,p_day_of_week_format=>'<th class="DayOfWeek">#IDAY#</th>'
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="CalendarHolder"> ',
' <tr>',
'   <td class="MonthTitle">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="0" class="Calendar">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>',
''))
,p_day_title_format=>'<div class="DayTitle">#DD#</div>'
,p_day_open_format=>'<td class="Day" valign="top">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" class="Today">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="WeekendDayTitle">#DD#</div>'
,p_weekend_open_format=>'<td valign="top" class="WeekendDay">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="NonDayTitle">#DD#</div>'
,p_nonday_open_format=>'<td class="NonDay" valign="top">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="WeekCalendarHolder">',
'<tr>',
'<td class="MonthTitle" id="test">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_weekly_day_of_week_format=>'<th class="DayOfWeek">#IDAY#<br>#MM#/#DD#</th>'
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="0" class="WeekCalendar">'
,p_weekly_month_close_format=>'</table></td></tr></table>'
,p_weekly_day_open_format=>'<td class="Day" valign="top">'
,p_weekly_day_close_format=>'<br /></td>'
,p_weekly_today_open_format=>'<td class="Today" valign="top">'
,p_weekly_weekend_open_format=>'<td valign="top" class="NonDay">'
,p_weekly_weekend_close_format=>'<br /></td>'
,p_weekly_time_open_format=>'<th class="Hour">'
,p_weekly_time_close_format=>'<br /></th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th class="DayOfWeek">#IDAY# #DD#/#MM#</th>'
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>',
''))
,p_daily_month_open_format=>'<table border="0" cellpadding="2" cellspacing="0" summary="0" class="DayCalendar">'
,p_daily_month_close_format=>'</table></td> </tr> </table>'
,p_daily_day_open_format=>'<td valign="top" class="Day">'
,p_daily_day_close_format=>'<br /></td>'
,p_daily_today_open_format=>'<td valign="top" class="Today">'
,p_daily_time_open_format=>'<th class="Hour">'
,p_daily_time_close_format=>'<br /></th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="CalendarHolder"> ',
' <tr>',
'   <td class="MonthTitle">#WTITLE#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_cust_day_of_week_format=>'<th class="DayOfWeek">#IDAY#</th>'
,p_cust_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="0" class="Calendar">'
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>',
''))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<div class="DayTitle">#DD#</div>'
,p_cust_day_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" class="Day" valign="top">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" valign="top" class="Today">'
,p_cust_nonday_title_format=>'<div class="NonDayTitle">#DD#</div>'
,p_cust_nonday_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" class="NonDay" valign="top">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<div class="WeekendDayTitle">#DD#</div>'
,p_cust_weekend_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" valign="top" class="WeekendDay">'
,p_cust_weekend_close_format=>'</td>'
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th class="Hour">'
,p_cust_time_close_format=>'<br /></th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="WeekCalendarHolder">',
'<tr>',
'<td class="MonthTitle" id="test">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_cust_wk_day_of_week_format=>'<th class="DayOfWeek">#IDAY#<br>#MM#/#DD#</th>'
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="0" class="WeekCalendar">'
,p_cust_wk_month_close_format=>'</table></td></tr></table>'
,p_cust_wk_day_open_format=>'<td style="#COL_WIDTH_PIX# #COL_WIDTH_PER#" class="Day" valign="top">'
,p_cust_wk_day_close_format=>'<br /></td>'
,p_cust_wk_today_open_format=>'<td style="#COL_WIDTH_PIX# #COL_WIDTH_PER#" class="Today" valign="top">'
,p_cust_wk_weekend_open_format=>'<td style="#COL_WIDTH_PIX# #COL_WIDTH_PER#" valign="top" class="NonDay">'
,p_cust_wk_weekend_close_format=>'<br /></td>'
,p_cust_month_day_height_pix=>'75'
,p_cust_week_day_width_per=>'14'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>22
,p_theme_class_id=>1
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar_alternative_1
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(17347139378409419)
,p_cal_template_name=>'Calendar, Alternative 1'
,p_internal_name=>'CALENDAR,_ALTERNATIVE_1'
,p_day_of_week_format=>'<th valign="bottom" class="DayOfWeek">#IDAY#</th>'
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="CalendarAlternative1Holder"> ',
' <tr>',
'   <td class="MonthTitle">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="0" class="CalendarAlternative1">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>',
''))
,p_day_title_format=>'<div class="DayTitle">#DD#</div>'
,p_day_open_format=>'<td class="Day" valign="top" height="100" height="100">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" class="Today">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="WeekendDayTitle">#DD#</div>'
,p_weekend_open_format=>'<td valign="top" class="WeekendDay">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="NonDayTitle">#DD#</div>'
,p_nonday_open_format=>'<td class="NonDay" valign="top">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="WeekCalendarAlternative1Holder">',
'<tr>',
'<td class="MonthTitle">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_weekly_day_of_week_format=>'<th class="DayOfWeek">#IDAY#<br>#MM#/#DD#</th>'
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="0" class="WeekCalendarAlternative1">'
,p_weekly_month_close_format=>'</table></td></tr></table>'
,p_weekly_day_open_format=>'<td class="Day" valign="top">'
,p_weekly_day_close_format=>'<br /></td>'
,p_weekly_today_open_format=>'<td class="Today" valign="top">'
,p_weekly_weekend_open_format=>'<td valign="top" class="NonDay">'
,p_weekly_weekend_close_format=>'<br /></td>'
,p_weekly_time_open_format=>'<th class="Hour">'
,p_weekly_time_close_format=>'<br /></th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th class="DayOfWeek">#IDAY# #DD#/#MM#</th>'
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="DayCalendarAlternative1Holder"> <tr><td class="MonthTitle">#IMONTH# #DD#, #YYYY#</td></tr><tr><td>',
''))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="0" class="DayCalendarAlternative1">'
,p_daily_month_close_format=>'</table></td> </tr> </table>'
,p_daily_day_open_format=>'<td valign="top" class="Day">'
,p_daily_day_close_format=>'<br /></td>'
,p_daily_today_open_format=>'<td valign="top" class="Today">'
,p_daily_time_open_format=>'<th class="Hour">'
,p_daily_time_close_format=>'<br /></th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="CalendarAlternative1Holder"> ',
' <tr>',
'   <td class="MonthTitle">#WTITLE#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_cust_day_of_week_format=>'<th valign="bottom" class="DayOfWeek">#IDAY#</th>'
,p_cust_month_open_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table border="0" cellpadding="0" cellspacing="4" summary="0" class="CalendarAlternative1">',
''))
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>'))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr>'
,p_cust_day_title_format=>'<div class="DayTitle">#DD#</div>'
,p_cust_day_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" class="Day" valign="top" height="100" height="100">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" valign="top" class="Today">'
,p_cust_nonday_title_format=>'<div class="NonDayTitle">#DD#</div>'
,p_cust_nonday_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" class="NonDay" valign="top">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<div class="WeekendDayTitle">#DD#</div>'
,p_cust_weekend_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" valign="top" class="WeekendDay">'
,p_cust_weekend_close_format=>'</td>'
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th class="Hour">'
,p_cust_time_close_format=>'<br /></th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="4" cellpadding="0" border="0" summary="" class="WeekCalendarAlternative1Holder">',
'<tr>',
'<td class="MonthTitle" id="test">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_cust_wk_day_of_week_format=>'<th class="DayOfWeek">#IDAY#<br>#MM#/#DD#</th>'
,p_cust_wk_month_open_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table border="0" cellpadding="0" cellspacing="4" summary="0" class="WeekCalendarAlternative1">',
''))
,p_cust_wk_month_close_format=>'</table></td></tr></table>'
,p_cust_wk_day_open_format=>'<td style="#COL_WIDTH_PIX# #COL_WIDTH_PER#" class="Day" valign="top">'
,p_cust_wk_day_close_format=>'<br /></td>'
,p_cust_wk_today_open_format=>'<td style="#COL_WIDTH_PIX# #COL_WIDTH_PER#" class="Today" valign="top">'
,p_cust_wk_weekend_open_format=>'<td style="#COL_WIDTH_PIX# #COL_WIDTH_PER#" valign="top" class="NonDay">'
,p_cust_wk_weekend_close_format=>'<br /></td>'
,p_cust_month_day_height_pix=>'100'
,p_cust_week_day_width_pix=>'100'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>22
,p_theme_class_id=>2
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/small_calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(17347356869409419)
,p_cal_template_name=>'Small Calendar'
,p_internal_name=>'SMALL_CALENDAR'
,p_day_of_week_format=>'<th class="day-of-week">#DY#</th>'
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="small-calendar-holder"> ',
' <tr>',
'   <td class="month-title">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="" class="small-calendar">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>'))
,p_day_title_format=>'<div class="day-title">#DD#</div>'
,p_day_open_format=>'<td class="day" valign="top">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" class="today">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="weekend-day-title">#DD#</div>'
,p_weekend_open_format=>'<td valign="top" class="weekend-day">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="non-day-title">#DD#</div>'
,p_nonday_open_format=>'<td class="non-day" valign="top">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="SmallWeekCalendarHolder">',
'<tr>',
'<td class="MonthTitle" id="test">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_weekly_day_of_week_format=>'<th class="DayOfWeek">#DY#<br />#MM#/#DD#</th>'
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="0" class="SmallWeekCalendar">'
,p_weekly_month_close_format=>'</table></td></tr></table>'
,p_weekly_day_open_format=>'<td class="Day" valign="top"><div class="inner">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t1Today" valign="top"><div class="inner">'
,p_weekly_weekend_open_format=>'<td valign="top" class="NonDay"><div class="inner">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th class="Hour">'
,p_weekly_time_close_format=>'<br /></th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th class="DayOfWeek">#DY# #DD#/#MM#</th>'
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="SmallDayCalendarHolder"> <tr> <td class="MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr><tr><td>',
''))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="0" class="SmallDayCalendar">'
,p_daily_month_close_format=>'</table></td></tr></table>'
,p_daily_day_open_format=>'<td valign="top" class="Day">'
,p_daily_day_close_format=>'<br /></td>'
,p_daily_today_open_format=>'<td valign="top" class="Today">'
,p_daily_time_open_format=>'<th class="Hour">'
,p_daily_time_close_format=>'<br /></th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="2" cellpadding="0" border="0" summary="" class="small-calendar-holder"> ',
' <tr>',
'   <td class="month-title">#WTITLE#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_cust_day_of_week_format=>'<th class="day-of-week">#DY#</th>'
,p_cust_month_open_format=>'<table border="0" cellpadding="0" cellspacing="2" summary="" class="small-calendar">'
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>'))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr>'
,p_cust_day_title_format=>'<div class="day-title">#DD#</div>'
,p_cust_day_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" class="day" valign="top">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" valign="top" class="today">'
,p_cust_nonday_title_format=>'<div class="non-day-title">#DD#</div>'
,p_cust_nonday_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" class="non-day" valign="top">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<div class="weekend-day-title">#DD#</div>'
,p_cust_weekend_open_format=>'<td style="#COL_HEIGHT_PIX# #COL_HEIGHT_PER#" valign="top" class="weekend-day">'
,p_cust_weekend_close_format=>'</td>'
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th class="Hour">'
,p_cust_time_close_format=>'<br /></th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="2" cellpadding="0" border="0" summary="" class="SmallWeekCalendarHolder">',
'<tr>',
'<td class="MonthTitle" id="test">#WTITLE#</td>',
'</tr>',
'<tr>',
'<td>'))
,p_cust_wk_day_of_week_format=>'<th class="DayOfWeek">#DY#<br />#MM#/#DD#</th>'
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="2" summary="0" class="SmallWeekCalendar">'
,p_cust_wk_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>'))
,p_cust_wk_day_open_format=>'<td style="#COL_WIDTH_PIX# #COL_WIDTH_PER#" class="Day" valign="top">'
,p_cust_wk_day_close_format=>'<br /></td>'
,p_cust_wk_today_open_format=>'<td style="#COL_WIDTH_PIX# #COL_WIDTH_PER#" class="t1Today" valign="top">'
,p_cust_wk_weekend_open_format=>'<td style="#COL_WIDTH_PIX# #COL_WIDTH_PER#" valign="top" class="NonDay">'
,p_cust_wk_weekend_close_format=>'<br /></td>'
,p_cust_month_day_height_pix=>'14'
,p_cust_month_day_height_per=>'14'
,p_cust_week_day_width_pix=>'40'
,p_cust_week_day_width_per=>'14'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>22
,p_theme_class_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar_002
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(56537205611997506)
,p_cal_template_name=>'Calendar'
,p_internal_name=>'CALENDAR'
,p_translate_this_template=>'Y'
,p_day_of_week_format=>'<th class="t15DayOfWeek">#IDAY#</th>'
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t15StandardCalHolder"> ',
' <tr>',
'   <td class="t15MonthTitle">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t15StandardCal">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>',
''))
,p_day_title_format=>'<div class="t15DayTitle">#DD#</div>'
,p_day_open_format=>'<td class="t15Day" valign="top">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td><!--CAN YOU SEE THIS? #4-->'
,p_today_open_format=>'<td valign="top" class="t15Today">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="t15WeekendDayTitle">#DD#</div>'
,p_weekend_open_format=>'<td valign="top" class="t15WeekendDay">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td><!--CAN YOU SEE THIS? #3-->'
,p_nonday_title_format=>'<div class="t15NonDayTitle">#DD#</div>'
,p_nonday_open_format=>'<td class="t15NonDay" valign="top">'
,p_nonday_close_format=>'</td><!--CAN YOU SEE THIS? #2-->'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> <!--CAN YOU SEE THIS? #1-->'
,p_daily_title_format=>'<th width="14%" class="calheader">#IDAY#</th>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>15
,p_theme_class_id=>1
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar_alternative_1_002
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(56537419943997514)
,p_cal_template_name=>'Calendar, Alternative 1'
,p_internal_name=>'CALENDAR,_ALTERNATIVE_1'
,p_day_of_week_format=>'<th class="t15DayOfWeek">#IDAY#</th>'
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t15CalendarAlternative1Holder"> ',
' <tr>',
'   <td class="t15MonthTitle">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t15CalendarAlternative1">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table></td>',
'</tr>',
'</table>',
''))
,p_day_title_format=>'<div class="t15DayTitle">#DD#</div>'
,p_day_open_format=>'<td class="t15Day" valign="top">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" class="t15Today">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="t15WeekendDayTitle">#DD#</div>'
,p_weekend_open_format=>'<td valign="top" class="t15WeekendDay">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="t15NonDayTitle">#DD#</div></td>'
,p_nonday_open_format=>'<td class="t15NonDay" valign="top">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>15
,p_theme_class_id=>2
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/small_calendar_002
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(56537632447997514)
,p_cal_template_name=>'Small Calendar'
,p_internal_name=>'SMALL_CALENDAR'
,p_translate_this_template=>'Y'
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t15SmallCalendarHolder"> ',
' <tr>',
'   <td class="t15MonthTitle">#IMONTH# #YYYY#</td>',
' </tr>',
' <tr>',
' <td>'))
,p_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t15SmallCalendar">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</tr></table></td>',
'</tr>',
'</table>',
''))
,p_day_title_format=>'<div class="t15DayTitle">#DD#</div>'
,p_day_open_format=>'<td class="t15Day" valign="top">#TITLE_FORMAT##DATA#'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td valign="top" class="t15Today">#TITLE_FORMAT##DATA#'
,p_weekend_title_format=>'<div class="t15WeekendDayTitle">#DD#</div>'
,p_weekend_open_format=>'<td valign="top" class="t15WeekendDay">#TITLE_FORMAT##DATA#'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<div class="t15NonDayTitle">#DD#</div></td>'
,p_nonday_open_format=>'<td class="t15NonDay" valign="top">'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<th width="14%" class="calheader">#IDAY#</th>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'#DATA#'
,p_theme_id=>15
,p_theme_class_id=>3
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(17347742153409420)
,p_theme_id=>22
,p_theme_name=>'Bluejay'
,p_theme_internal_name=>'BLUEJAY'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'T'
,p_nav_bar_type=>'NAVBAR'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(17323635730409362)
,p_error_template=>wwv_flow_api.id(17322454697409361)
,p_printer_friendly_template=>wwv_flow_api.id(17324253802409363)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(17321340089409358)
,p_default_button_template=>wwv_flow_api.id(17325751309409385)
,p_default_region_template=>wwv_flow_api.id(17332845056409410)
,p_default_chart_template=>wwv_flow_api.id(17329842275409409)
,p_default_form_template=>wwv_flow_api.id(17330148237409409)
,p_default_reportr_template=>wwv_flow_api.id(17332845056409410)
,p_default_tabform_template=>wwv_flow_api.id(17332845056409410)
,p_default_wizard_template=>wwv_flow_api.id(17335553776409411)
,p_default_menur_template=>wwv_flow_api.id(17328333600409399)
,p_default_listr_template=>wwv_flow_api.id(17329539356409408)
,p_default_irr_template=>wwv_flow_api.id(17331657839409409)
,p_default_report_template=>wwv_flow_api.id(17344347028409417)
,p_default_label_template=>wwv_flow_api.id(17346441206409418)
,p_default_menu_template=>wwv_flow_api.id(17346735300409418)
,p_default_list_template=>wwv_flow_api.id(17340532544409415)
,p_default_option_label=>wwv_flow_api.id(17346441206409418)
,p_default_required_label=>wwv_flow_api.id(17346662877409418)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(22),'')
,p_css_file_urls=>'#IMAGE_PREFIX#legacy_ui/css/5.0#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(56537915355997521)
,p_theme_id=>15
,p_theme_name=>'Light Blue'
,p_theme_internal_name=>'LIGHT_BLUE'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'T'
,p_nav_bar_type=>'NAVBAR'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(56531316643997432)
,p_error_template=>wwv_flow_api.id(56531806356997437)
,p_printer_friendly_template=>wwv_flow_api.id(56531202608997432)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(56531806356997437)
,p_default_button_template=>wwv_flow_api.id(56532105108997446)
,p_default_region_template=>wwv_flow_api.id(56533516268997460)
,p_default_chart_template=>wwv_flow_api.id(56533603958997460)
,p_default_form_template=>wwv_flow_api.id(56534126062997460)
,p_default_reportr_template=>wwv_flow_api.id(56533516268997460)
,p_default_tabform_template=>wwv_flow_api.id(56533516268997460)
,p_default_wizard_template=>wwv_flow_api.id(56533205186997460)
,p_default_menur_template=>wwv_flow_api.id(56532925014997460)
,p_default_listr_template=>wwv_flow_api.id(56533516268997460)
,p_default_report_template=>wwv_flow_api.id(56535825040997473)
,p_default_label_template=>wwv_flow_api.id(56536903519997495)
,p_default_menu_template=>wwv_flow_api.id(56537133478997506)
,p_default_calendar_template=>wwv_flow_api.id(56537205611997506)
,p_default_list_template=>wwv_flow_api.id(56535302619997473)
,p_default_option_label=>wwv_flow_api.id(56536903519997495)
,p_default_required_label=>wwv_flow_api.id(56536705056997495)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(15),'')
,p_css_file_urls=>'#IMAGE_PREFIX#legacy_ui/css/5.0#MIN#.css?v=#APEX_VERSION#'
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
prompt --application/shared_components/user_interface/theme_display_points
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
prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(13875107675168826)
,p_build_option_name=>'DEVELOPMENT_MODE'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Run against the macbook development instance.'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(30127784219510676)
,p_build_option_name=>'DISABLED'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
);
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
prompt --application/shared_components/security/authentications/application_express
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(56538027943997553)
,p_name=>'Application Express'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_attribute_15=>'56538027943997553'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'f?p=&APP_ID.:101:&SESSION.'
,p_logout_url=>'f?p=&APP_ID.:1'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_comments=>'ID-Daten von internem Application Express Account und Anmeldeseite in dieser Anwendung verwenden.'
);
end;
/
prompt --application/shared_components/security/authentications/database
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(56538116772997554)
,p_name=>'DATABASE'
,p_scheme_type=>'NATIVE_DAD'
,p_attribute_15=>'56538116772997554'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_comments=>'Datenbank-Authentifizierung verwenden (Benutzer von DAD identifiziert).'
);
end;
/
prompt --application/shared_components/security/authentications/database_account
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(56538206377997554)
,p_name=>'DATABASE ACCOUNT'
,p_scheme_type=>'NATIVE_DB_ACCOUNTS'
,p_attribute_15=>'56538206377997554'
,p_invalid_session_type=>'URL'
,p_invalid_session_url=>'f?p=&APP_ID.:101:&SESSION.'
,p_logout_url=>'f?p=&APP_ID.:1'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_comments=>'Verwenden Sie Datenbank-Account-ID-Daten.'
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(64731510056518)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>true
,p_is_default=>true
,p_theme_id=>22
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>0
,p_nav_list_template_options=>'#DEFAULT#'
,p_include_legacy_javascript=>'PRE18:18'
,p_include_jquery_migrate=>true
,p_nav_bar_type=>'NAVBAR'
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
,p_user_interface_id=>wwv_flow_api.id(64731510056518)
,p_name=>'0'
,p_step_title=>'0'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DIETMAR.AUST'
,p_last_upd_yyyymmddhh24miss=>'20150412124102'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17349058172020115)
,p_plug_name=>'J2EE Server URL'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17332845056409410)
,p_plug_display_sequence=>0
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>2
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'These values ar used to communicate with the J2EE server <br>',
'using utl_http. You can change them permanently <br>',
'by editing the application properties (substitution strings <br>',
'<span style="font-family: Courier New,Courier,monospace;">G_PROTOCOL, G_SERVER, G_PORT, G_CONTEXT_PATH</span>)',
'or set different values just for this session:',
'<br /><br />'))
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'2,3,6,101'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17355262523210578)
,p_plug_name=>'info'
,p_parent_plug_id=>wwv_flow_api.id(17349058172020115)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17351142682072361)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(17355262523210578)
,p_button_name=>'SET_URL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(17325751309409385)
,p_button_image_alt=>'Set Url'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17349635016041729)
,p_name=>'P0_INTEGRATION_CONTEXT_URL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(17355262523210578)
,p_prompt=>' J2EE Server URL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>3
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_api.id(17346335252409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17364454757364075)
,p_name=>'P0_PROTOCOL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(17355262523210578)
,p_prompt=>'Protocol'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:http,https'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17364631339366788)
,p_name=>'P0_SERVER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(17355262523210578)
,p_prompt=>'Server'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17364836533368340)
,p_name=>'P0_PORT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(17355262523210578)
,p_prompt=>'Port'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17365044845370688)
,p_name=>'P0_CONTEXT_PATH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(17355262523210578)
,p_prompt=>'Context Path'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>45
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17366459960441255)
,p_name=>'P0_SERVER_URL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(17355262523210578)
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17376737058106360)
,p_name=>'P0_REPORT_URL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(17355262523210578)
,p_prompt=>'Full report url'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>3
,p_cAttributes=>'nowrap'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_colspan=>1
,p_rowspan=>1
,p_field_template=>wwv_flow_api.id(17346335252409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(64731510056518)
,p_tab_set=>'TS1'
,p_name=>'Home'
,p_step_title=>'Home'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Home'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_welcome_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.t15ReportsRegion{width: 500px;}',
'</style>'))
,p_autocomplete_on_off=>'ON'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script>',
'function myEscape(pStr){',
'alert(escape(pStr));',
'return escape(pStr);',
'}',
'',
'function showUrl(pUrl){',
'var win = window.open( ''http://daust3.opal-consulting.de:7777/pls/apex/f?p=&APP_ID.:0:&APP_SESSION.:APPLICATION_PROCESS=prc_show_url:::F_TMP_1:''  + myEscape(pUrl));',
'}',
'</script>',
'',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>unistr('F\00FCr diese Seite ist keine Hilfe verf\00FCgbar.')
,p_last_updated_by=>'DIETMAR.AUST'
,p_last_upd_yyyymmddhh24miss=>'20120805230040'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(31752884018429270)
,p_plug_name=>'Jasper Reports Integration'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17332845056409410)
,p_plug_display_sequence=>21
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<p>This is the test application for the <a href="http://www.opal-consulting.de/apex/f?p=20090928:4" target="_blank">Jasper Reports Integration</a> kit provided by <a href="http://www.opal-consulting.de/" target="_blank">Opal-Consulting</a>. </p>',
'<p>It will help you with the installation, troubleshooting and serves as a report tester.</p>',
'<p>Using these functionalities you can can integrate your user defined reports (using iReport Designer to create an JasperReports .jasper file) in an APEX application. </p>',
'<p>Regarding the Jasper Reports Integration you can reach me at <a href="mailto:freetools@opal-consulting.de?subject=Jasper Reports Integration">freetools@opal-consulting.de</a></p>',
'<p>Have fun, <br />',
'~Dietmar. </p>',
''))
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_column_width=>'valign=top'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56539928879997695)
,p_plug_name=>'Navigationspfade'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17328333600409399)
,p_plug_display_sequence=>1
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_menu_id=>wwv_flow_api.id(56539424029997642)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(17346735300409418)
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(64731510056518)
,p_tab_set=>'TS1'
,p_name=>'Logs'
,p_step_title=>'Logs'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title=>'Logs'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'DIETMAR.AUST'
,p_last_upd_yyyymmddhh24miss=>'20120806140853'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17382638105449350)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17328333600409399)
,p_plug_display_sequence=>1
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_menu_id=>wwv_flow_api.id(56539424029997642)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(17346735300409418)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17383041650449351)
,p_plug_name=>'Logs'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17331657839409409)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>'select * from xlib_logs'
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(17383150988449351)
,p_name=>'Logs'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_pivot=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_owner=>'DIETMAR.AUST'
,p_internal_uid=>1
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17383341855449353)
,p_db_column_name=>'LOG_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Log Id'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'LOG_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17383434828449355)
,p_db_column_name=>'LOG_MODULE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Log Module'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'LOG_MODULE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17383547030449355)
,p_db_column_name=>'LOG_MSG'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Log Msg'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'LOG_MSG'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17383662501449355)
,p_db_column_name=>'LOG_TYPE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Log Type'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'LOG_TYPE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17383738230449355)
,p_db_column_name=>'LOG_LEVEL'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Log Level'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'LOG_LEVEL'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17383860227449355)
,p_db_column_name=>'LOG_CREATED_ON'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Log Created On'
,p_allow_pivot=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD.MM.YYYY_HH24:MI:SS'
,p_tz_dependent=>'N'
,p_static_id=>'LOG_CREATED_ON'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(17383962277449355)
,p_db_column_name=>'LOG_CREATED_BY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Log Created By'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'LOG_CREATED_BY'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(17384045929449529)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'64294'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'LOG_ID:LOG_MODULE:LOG_MSG:LOG_CREATED_ON:LOG_CREATED_BY:LOG_TYPE'
,p_sort_column_1=>'LOG_ID'
,p_sort_direction_1=>'DESC'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(64731510056518)
,p_tab_set=>'TS1'
,p_name=>'Samples'
,p_step_title=>'Samples'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DIETMAR.AUST'
,p_last_upd_yyyymmddhh24miss=>'20150412123831'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13272831151542033)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17328333600409399)
,p_plug_display_sequence=>1
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_menu_id=>wwv_flow_api.id(56539424029997642)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(17346735300409418)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13275025376463537)
,p_plug_name=>'Samples'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17334362203409410)
,p_plug_display_sequence=>11
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_list_id=>wwv_flow_api.id(13274509416463482)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(17340849953409415)
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_api.create_page(
 p_id=>4
,p_user_interface_id=>wwv_flow_api.id(64731510056518)
,p_tab_set=>'TS1'
,p_name=>'Verify Setup'
,p_step_title=>'Verify Setup'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_welcome_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.t15ReportsRegion{width: 500px;}',
'</style>'))
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20200930132843'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17362656610298392)
,p_plug_name=>'Check 2: Are the required network privileges set (ACL)?'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17332845056409410)
,p_plug_display_sequence=>31
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_column_width=>'valign=top'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17362857667298393)
,p_plug_name=>'Detail Validation'
,p_parent_plug_id=>wwv_flow_api.id(17362656610298392)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17327142303409386)
,p_plug_display_sequence=>181
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_dummy varchar2(1);',
'  l_str varchar2(32767);',
'  l_clob   clob;',
'  l_sqlerrm varchar2(32767);',
'begin',
'    -- code for Oracle 11g',
'    $IF DBMS_DB_VERSION.ver_le_11 $THEN',
'        l_str := q''[',
'              ',
'        Error occured: #SQLERRM#<br>',
'        <br>',
'        Please issue the following statement as SYS:<br>',
'        <br>',
'        <br>',
'        <div style="font-family: Consolas,Courier;">',
'        declare<br>',
'        &nbsp;&nbsp;&nbsp; l_acl_name varchar2(100) :=',
'        ''JasperReportsIntegration-#USER#.xml'';<br>',
'        begin<br>',
'        &nbsp; begin<br>',
'        &nbsp;&nbsp;&nbsp; dbms_network_acl_admin.drop_acl(<br>',
'        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acl',
'        =&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_acl_name<br>',
'        &nbsp;&nbsp;&nbsp; );<br>',
'        &nbsp; exception <br>',
'        &nbsp;&nbsp;&nbsp; when others then null; -- ACL does not exist yet<br>',
'        &nbsp; end;<br>',
'        &nbsp; <br>',
'        &nbsp; -- Privilege to connect to a host<br>',
'        &nbsp; dbms_network_acl_admin.create_acl(<br>',
'        &nbsp;&nbsp;&nbsp; acl',
'        =&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_acl_name,<br>',
'        &nbsp;&nbsp;&nbsp; description =&gt; ''Accessing the local host for',
'        printing with Tomcat'',<br>',
'        &nbsp;&nbsp;&nbsp; principal =&gt;&nbsp;&nbsp; upper(''#USER#''), -- DB',
'        Schema (grantee)<br>',
'        &nbsp;&nbsp;&nbsp; is_grant =&gt;&nbsp;&nbsp;&nbsp; true,<br>',
'        &nbsp;&nbsp;&nbsp; privilege =&gt;&nbsp;&nbsp; ''connect'',<br>',
'        &nbsp;&nbsp;&nbsp; start_date&nbsp; =&gt; null, <br>',
'        &nbsp;&nbsp;&nbsp; end_date&nbsp; =&gt;&nbsp;&nbsp; null<br>',
'        &nbsp; );<br>',
'        &nbsp; <br>',
'        &nbsp; -- Privilege to resolve a hostname (DNS lookup)<br>',
'        &nbsp; DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(<br>',
'        &nbsp;&nbsp;&nbsp; acl',
'        =&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_acl_name,<br>',
'        &nbsp;&nbsp;&nbsp; principal =&gt;&nbsp;&nbsp; upper(''#USER#''), -- DB',
'        Schema (grantee)<br>',
'        &nbsp;&nbsp;&nbsp; is_grant&nbsp; =&gt;&nbsp;&nbsp; true,<br>',
'        &nbsp;&nbsp;&nbsp; privilege =&gt;&nbsp;&nbsp; ''resolve'',<br>',
'        &nbsp;&nbsp;&nbsp; start_date&nbsp; =&gt; null, <br>',
'        &nbsp;&nbsp;&nbsp; end_date&nbsp; =&gt;&nbsp;&nbsp; null<br>',
'        &nbsp; );<br>',
'        &nbsp; <br>',
'        &nbsp; -- Privilege to connect to localhost<br>',
'        &nbsp; dbms_network_acl_admin.assign_acl(<br>',
'        &nbsp;&nbsp;&nbsp; acl',
'        =&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_acl_name,<br>',
'        &nbsp;&nbsp;&nbsp; host =&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
'        ''127.0.0.1'',<br>',
'        &nbsp;&nbsp;&nbsp; lower_port =&gt;&nbsp; 80,<br>',
'        &nbsp;&nbsp;&nbsp; upper_port =&gt;&nbsp; 10000<br>',
'        &nbsp; );<br>',
'        <br>',
'        &nbsp; -- Privilege to connect to localhost<br>',
'        &nbsp; dbms_network_acl_admin.assign_acl(<br>',
'        &nbsp;&nbsp;&nbsp; acl',
'        =&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_acl_name,<br>',
'        &nbsp;&nbsp;&nbsp; host =&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
'        ''localhost'',<br>',
'        &nbsp;&nbsp;&nbsp; lower_port =&gt;&nbsp; 80,<br>',
'        &nbsp;&nbsp;&nbsp; upper_port =&gt;&nbsp; 10000<br>',
'        &nbsp; );<br>',
'        <br>',
'        &nbsp; -- Privilege to connect to #HOST#<br>',
'        &nbsp; dbms_network_acl_admin.assign_acl(<br>',
'        &nbsp;&nbsp;&nbsp; acl',
'        =&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l_acl_name,<br>',
'        &nbsp;&nbsp;&nbsp; host =&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
'        ''#HOST#'',<br>',
'        &nbsp;&nbsp;&nbsp; lower_port =&gt;&nbsp; 80,<br>',
'        &nbsp;&nbsp;&nbsp; upper_port =&gt;&nbsp; 10000<br>',
'        &nbsp; );<br>',
'        &nbsp; <br>',
'        end;<br>',
'        /<br>',
'        &nbsp;&nbsp;&nbsp; <br>',
'        commit<br>',
'        /<br>',
'        </div>      ',
'              ',
'              ]'';',
'    $ELSE -- code for 12c and above',
'        l_str := q''[',
'              ',
' Error occured: #SQLERRM#<br>',
'<br>',
'Please issue the following statement as SYS:<br>',
'<br>',
'<div style="font-family: Consolas,Courier;">',
'<div style="color: #000000;background-color: #ffffff;font-family: Menlo, Monaco, ''Courier New'', monospace;font-weight: normal;font-size: 12px;line-height: 18px;white-space: pre;"><div><span style="color: #0000ff;">BEGIN</span></div><div><span style="'
||'color: #000000;"> DBMS_NETWORK_ACL_ADMIN.</span></div><div><span style="color: #000000;"> append_host_ace (</span></div><div><span style="color: #000000;"> HOST =&gt; </span><span style="color: #a31515;">''#HOST#''</span><span style="color: #000000;">,'
||'</span></div><div><span style="color: #000000;"> </span><span style="color: #008000;">--lower_port =&gt; 443,</span></div><div><span style="color: #000000;"> </span><span style="color: #008000;">--upper_port =&gt; 443,</span></div><div><span style="c'
||'olor: #000000;"> ace =&gt; xs$ace_type (privilege_list =&gt; xs$name_list (</span><span style="color: #a31515;">''http''</span><span style="color: #000000;">),</span></div><div><span style="color: #000000;"> principal_name =&gt; </span><span style="col'
||'or: #a31515;">''#USER#''</span><span style="color: #000000;">,</span></div><div><span style="color: #000000;"> principal_type =&gt; xs_acl.ptype_db));</span></div><div><span style="color: #0000ff;">END</span><span style="color: #000000;">;</span></div>'
||'<div><span style="color: #000000;">/</span></div><div><span style="color: #795e26;">COMMIT</span><span style="color: #000000;"><br>/<br></span></div>',
'</div></div>  ',
'              ',
'              ]'';',
'    $END',
'',
'',
'  SELECT HTTPURITYPE (:p0_server_url).getclob ()',
'    INTO l_clob',
'    from dual;',
'',
'  -- ok',
'  htp.p(''All tests PASSED.'');',
'  ',
'exception',
'  when others then',
'    l_sqlerrm := sqlerrm;',
'    ',
'    -- ACL problem',
'    if instr(l_sqlerrm, ''ORA-24247'')>0 then',
'      ',
'      l_str := replace(l_str, ''#SQLERRM#'', l_sqlerrm);',
'      l_str := replace(l_str, ''#USER#'', sys_context(''userenv'', ''current_user''));',
'      l_str := replace(l_str, ''#HOST#'', :p0_server);',
'',
'      htp.p(l_str);',
'    else',
'      -- no ACL problem',
'      -- ok',
'      htp.p(''All tests PASSED.'');',
'',
'    end if;',
'  ',
'end;',
'',
'',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>wwv_flow_api.id(17344347028409417)
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17369359801904847)
,p_plug_name=>'Check 5: Is the J2EE application JasperReportsIntegration deployed?'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17332845056409410)
,p_plug_display_sequence=>91
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17369560408904850)
,p_plug_name=>'Detail Validation'
,p_parent_plug_id=>wwv_flow_api.id(17369359801904847)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17327142303409386)
,p_plug_display_sequence=>201
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_dummy varchar2(1);',
'  l_str varchar2(32767);',
'  l_clob   clob;',
'  l_sqlerrm varchar2(32767);',
'begin',
'  SELECT HTTPURITYPE (:p0_integration_context_url).getclob ()',
'    INTO l_clob',
'    from dual;',
'',
'  -- ok',
'  htp.p(''All tests PASSED.'');',
'  ',
'exception',
'  when others then',
'    l_sqlerrm := sqlerrm;',
'    ',
'      l_str := q''[',
'      ',
'Error occured: #SQLERRM#<br>',
'<br>',
'We couldn''t make a successful connection to #SERVER_URL#.<br>',
'',
'<br />',
'<span style="font-size: 130%; font-weight: bold;">This can be ignored when the  the parameter infoPageIsEnabled=false is set in the application.properties file. Then the J2EE server will respond with an 403 error code for security reasons.</span>',
'<br><br />',
'',
'Please make sure the J2EE application (JasperReportsIntegration.war) is',
'deployed and can be accessed.',
'   ',
'      ',
'      ]'';',
'      l_str := replace(l_str, ''#SQLERRM#'', l_sqlerrm);',
'      l_str := replace(l_str, ''#USER#'', sys_context(''userenv'', ''current_user''));',
'      l_str := replace(l_str, ''#SERVER_URL#'', :p0_integration_context_url);',
'',
'      htp.p(l_str);',
'',
'end;',
'',
'',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>wwv_flow_api.id(17344347028409417)
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17371344179947585)
,p_plug_name=>'Check 6: Is the data source "default" configured properly?'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17332845056409410)
,p_plug_display_sequence=>101
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17371533641947586)
,p_plug_name=>'Detail Validation'
,p_parent_plug_id=>wwv_flow_api.id(17371344179947585)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17327142303409386)
,p_plug_display_sequence=>201
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_dummy varchar2(1);',
'  l_str varchar2(32767);',
'  l_clob   clob;',
'  l_sqlerrm varchar2(32767);',
'  l_url varchar2(32767) := :p0_integration_context_url || ''/test?_dataSource=default'';',
'begin',
'  SELECT HTTPURITYPE (l_url).getclob ()',
'    INTO l_clob',
'    from dual;',
'',
'  -- ok',
'  htp.p(''All tests PASSED.'');',
'  ',
'exception',
'  when others then',
'    l_sqlerrm := sqlerrm;',
'    ',
'      l_str := q''[',
'      ',
'Error occured: #SQLERRM#<br>',
'<br>',
'We couldn''t make a successful connection to #URL#.<br>',
'',
'<br />',
'<span style="font-size: 130%; font-weight: bold;">This can be ignored when the  the parameter infoPageIsEnabled=false is set in the application.properties file. Then the J2EE server will respond with an 403 error code for security reasons.</span>',
'<br><br />',
'',
'It seems like the data source default is not configured properly. <br>',
'   ',
'      ',
'      ]'';',
'      l_str := replace(l_str, ''#SQLERRM#'', l_sqlerrm);',
'      l_str := replace(l_str, ''#USER#'', sys_context(''userenv'', ''current_user''));',
'      l_str := replace(l_str, ''#URL#'', l_url);',
'',
'      htp.p(l_str);',
'',
'end;',
'',
'',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>wwv_flow_api.id(17344347028409417)
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17375237657049813)
,p_plug_name=>'Check 7: Does the test report return a result for the data source "default"?'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17332845056409410)
,p_plug_display_sequence=>211
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17375442613049813)
,p_plug_name=>'Detail Validation'
,p_parent_plug_id=>wwv_flow_api.id(17375237657049813)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17327142303409386)
,p_plug_display_sequence=>201
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_dummy varchar2(1);',
'  l_str varchar2(32767);',
'  l_clob   clob;',
'  l_sqlerrm varchar2(32767);',
'  l_url varchar2(32767) := :p0_integration_context_url || ''/report?_dataSource=default'';',
'begin',
'  SELECT HTTPURITYPE (l_url).getclob ()',
'    INTO l_clob',
'    from dual;',
'',
'  -- ok',
'  htp.p(''All tests PASSED.'');',
'  ',
'exception',
'  when others then',
'    l_sqlerrm := sqlerrm;',
'    ',
'      l_str := q''[',
'      ',
'Error occured: #SQLERRM#<br>',
'<br>',
'We couldn''t make a successful connection to #URL#.<br>',
'<br>',
'It seems like the data source default is not configured properly. <br>',
'   ',
'      ',
'      ]'';',
'      l_str := replace(l_str, ''#SQLERRM#'', l_sqlerrm);',
'      l_str := replace(l_str, ''#USER#'', sys_context(''userenv'', ''current_user''));',
'      l_str := replace(l_str, ''#URL#'', l_url);',
'',
'      htp.p(l_str);',
'',
'end;',
'',
'',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>wwv_flow_api.id(17344347028409417)
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26289103904518251)
,p_plug_name=>'Installation'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17328333600409399)
,p_plug_display_sequence=>1
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_menu_id=>wwv_flow_api.id(56539424029997642)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(17346735300409418)
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(26311502713976717)
,p_name=>'Installation status'
,p_template=>wwv_flow_api.id(17332845056409410)
,p_display_sequence=>11
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT   *',
'    FROM (SELECT 1 step, ''Step 1: Grant execute on utl_http'' step_name,',
'                 status, ''*'' required',
'            FROM (SELECT DECODE (installed,',
'                                 1, ''/i/Fndokay1.gif'',',
'                                 ''/i/FNDCANCE.gif''',
'                                ) status',
'                    FROM (SELECT SUM (CASE',
'                                         WHEN owner = ''SYS''',
'                                         AND grantee = ''#OWNER#''',
'                                         AND table_name = ''UTL_HTTP''',
'                                         AND PRIVILEGE = ''EXECUTE''',
'                                            THEN 1',
'                                         ELSE 0',
'                                      END',
'                                     ) installed',
'                            FROM user_tab_privs))',
'          UNION',
'          SELECT 2 step, ''Step 2: Install XLIB packages'' step_name, status,',
'                 ''*'' required',
'            FROM (SELECT DECODE (installed,',
'                                 2, ''/i/Fndokay1.gif'',',
'                                 ''/i/FNDCANCE.gif''',
'                                ) status',
'                    FROM (SELECT SUM',
'                                    (CASE',
'                                        WHEN OBJECT_NAME IN',
'                                                   (''XLIB_HTTP'', ''XLIB_JASPERREPORTS'')',
'                                           THEN 1',
'                                        ELSE 0',
'                                     END',
'                                    ) installed',
'                            FROM user_objects ',
'                           WHERE status=''VALID''',
'                             AND object_type=''PACKAGE''))',
'          UNION',
'          SELECT 3 step, ''Step 3: Install Tomcat'' step_name, status,',
'                 ''*'' required',
'            FROM (SELECT DECODE (installed,',
'                                 1, ''/i/Fndokay1.gif'',',
'                                 ''/i/FNDCANCE.gif''',
'                                ) status',
'                    FROM (SELECT xlib_http.check_get_request',
'                                                 (:P0_INTEGRATION_CONTEXT_URL || ''''',
'                                                 ) installed',
'                            FROM DUAL))',
'          UNION',
'          SELECT 4 step, ''Step 4: Install JasperReportsIntegration'' step_name,',
'                 status, ''*'' required',
'            FROM (SELECT DECODE (installed,',
'                                 1, ''/i/Fndokay1.gif'',',
'                                 ''/i/FNDCANCE.gif''',
'                                ) status',
'                    FROM (SELECT xlib_http.check_get_request',
'                                       (   :P0_INTEGRATION_CONTEXT_URL',
'                                        || ''''',
'                                       ) installed',
'                            FROM DUAL))',
'          UNION',
'          SELECT 6 step, ''Step 6: Install sample application'' step_name,',
'                 status, ''&nbsp;'' required',
'            FROM (SELECT DECODE (installed,',
'                                 2, ''/i/Fndokay1.gif'',',
'                                 ''/i/FNDCANCE.gif''',
'                                ) status',
'                    FROM (SELECT SUM',
'                                    (CASE',
'                                        WHEN object_name IN',
'                                               (''DEMO_ORDERS'',',
'                                                ''DEMO_CUSTOMERS'')',
'                                           THEN 1',
'                                        ELSE 0',
'                                     END',
'                                    ) installed',
'                            FROM user_objects))',
'          )',
'ORDER BY step'))
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(17344347028409417)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'Keine Daten gefunden'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_sort_null=>'F'
,p_query_asc_image_attr=>'width="13" height="12" alt=""'
,p_query_desc_image_attr=>'width="13" height="12" alt=""'
,p_plug_query_strip_html=>'Y'
,p_required_patch=>wwv_flow_api.id(30127784219510676)
);
wwv_flow_api.set_region_column_width(
 p_id=>wwv_flow_api.id(26311502713976717)
,p_plug_column_width=>'valign=top'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26311795279976720)
,p_query_column_id=>1
,p_column_alias=>'STEP'
,p_column_display_sequence=>1
,p_column_heading=>'Step id'
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26311883230976721)
,p_query_column_id=>2
,p_column_alias=>'STEP_NAME'
,p_column_display_sequence=>2
,p_column_heading=>'Step'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26311989171976721)
,p_query_column_id=>3
,p_column_alias=>'STATUS'
,p_column_display_sequence=>4
,p_column_heading=>'Status'
,p_column_html_expression=>'<img src="#STATUS#" />'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(26318700738108578)
,p_query_column_id=>4
,p_column_alias=>'REQUIRED'
,p_column_display_sequence=>3
,p_column_heading=>'Required'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26316485576009598)
,p_plug_name=>'Check 3: Are the required PL/SQL packages installed?'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17332845056409410)
,p_plug_display_sequence=>51
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17367862366640628)
,p_plug_name=>'Detail Validation'
,p_parent_plug_id=>wwv_flow_api.id(26316485576009598)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17327142303409386)
,p_plug_display_sequence=>191
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_dummy number;',
'  l_cnt number;',
'  l_str varchar2(23767);',
'begin',
'  select count(*)',
'    into l_cnt',
'    from user_objects',
'   where object_name in (''XLIB_JASPERREPORTS'', ''XLIB_HTTP'')',
'     and object_type = ''PACKAGE''',
'     and status = ''VALID'';',
'',
'  if l_cnt=2 then',
'    -- ok',
'    htp.p(''All tests PASSED.'');',
'  else',
'    l_str := ''The packages <span style="font-family: Consolas;">XLIB_HTTP</span> and',
'<span style="font-family: Consolas;">XLIB_JASPERREPORTS</span> are not',
'installed or not valid. These are required.<br>',
'<br>',
'They have to be installed in the application schema <span',
'style="font-family: Consolas;">#USER#</span>.',
'<br>'';',
'',
'    l_str := replace(l_str, ''#USER#'', sys_context(''userenv'', ''current_user''));',
'    htp.p(l_str);    ',
'  end if;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>wwv_flow_api.id(17344347028409417)
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26320684377122790)
,p_plug_name=>'Check 1: Do we have EXECUTE privileges on UTL_HTTP?'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17332845056409410)
,p_plug_display_sequence=>21
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_column_width=>'valign=top'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17361137807160497)
,p_plug_name=>'Detail Validation'
,p_parent_plug_id=>wwv_flow_api.id(26320684377122790)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17327142303409386)
,p_plug_display_sequence=>181
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_dummy varchar2(1);',
'  l_str varchar2(32767);',
'begin',
'  select null ',
'    into l_dummy',
'    from user_tab_privs',
'   where owner=''SYS''',
'     and grantee=sys_context(''userenv'', ''current_user'')',
'     and table_name=''UTL_HTTP''',
'     and privilege=''EXECUTE'';',
'',
'  -- ok',
'  htp.p(''All tests PASSED.'');',
'exception',
'  when no_data_found then',
'    l_str := ''Please issue the following command as SYS:',
'    <br />',
'    <br />',
'    GRANT EXECUTE ON SYS.UTL_HTTP TO #USER#;'';',
'',
'    l_str := replace(l_str, ''#USER#'', sys_context(''userenv'', ''current_user''));',
'    htp.p(l_str);    ',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>wwv_flow_api.id(17344347028409417)
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26326290929247678)
,p_plug_name=>'Step 3: Install Tomcat - configure URL'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>131
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>'<div class="space"></div>'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26332883693548365)
,p_plug_name=>'Check 4: Can the talk to the J2EE server?'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17332845056409410)
,p_plug_display_sequence=>81
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17368360222810308)
,p_plug_name=>'Detail Validation'
,p_parent_plug_id=>wwv_flow_api.id(26332883693548365)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17327142303409386)
,p_plug_display_sequence=>201
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_dummy varchar2(1);',
'  l_str varchar2(32767);',
'  l_clob   clob;',
'  l_sqlerrm varchar2(32767);',
'begin',
'  SELECT HTTPURITYPE (:p0_server_url).getclob ()',
'    INTO l_clob',
'    from dual;',
'',
'  -- ok',
'  htp.p(''All tests PASSED.'');',
'  ',
'exception',
'  when others then',
'    l_sqlerrm := sqlerrm;',
'    ',
'--    if instr(l_sqlerrm, ''ORA-12541'')>0 then',
'      l_str := q''[',
'      ',
'Error occured: #SQLERRM#<br>',
'<br>',
'We couldn''t make a successful connection to <span style="font-size: 130%; font-weight: bold;">#SERVER_URL#</span>.<br /><br />',
'<span style="font-size: 130%; font-weight: bold;">This can be ignored when the other tests are successful. Sometimes the J2EE server doesn''t have a working index page (mostly for security reasons).</span>',
'<br><br />',
'Please make sure: <br>',
'<ul>',
'<li>The J2EE server is up and accepting connections</li>',
'<li>The firewalls allow the communication from the database to the',
'J2EE server (if not installed locally)</li>',
'</ul>',
'   ',
'      ',
'      ]'';',
'      l_str := replace(l_str, ''#SQLERRM#'', l_sqlerrm);',
'      l_str := replace(l_str, ''#USER#'', sys_context(''userenv'', ''current_user''));',
'      l_str := replace(l_str, ''#SERVER_URL#'', :p0_server_url);',
'',
'      htp.p(l_str);',
'--    end if;',
'  ',
'end;',
'',
'',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_row_template=>wwv_flow_api.id(17344347028409417)
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(26361907148848509)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(26311502713976717)
,p_button_name=>'BTN_REFRESH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(17325751309409385)
,p_button_image_alt=>'Refresh'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(26362182929848509)
,p_branch_action=>'f?p=&FLOW_ID.:4:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(26361907148848509)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(26337300774642671)
,p_branch_action=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>99
,p_save_state_before_branch_yn=>'Y'
);
null;
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(64731510056518)
,p_tab_set=>'TS1'
,p_name=>'USAGE'
,p_step_title=>'Usage'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_html_page_onload=>'onLoad="xlibJasperDemo_makeDemoUrl();"'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_welcome_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style type="text/css">',
'<!--',
'.myTable {',
'	margin: 0px;',
'	/*border: thin solid #000000;*/',
'	border-collapse:collapse;',
'}',
'.myTable td, .myTable th{ ',
'    border: 1px solid black;',
'	padding: 2px;',
'}',
'.myTable th{ ',
'    background-color:#CCCCCC;',
'}',
'',
'-->',
'</style>'))
,p_autocomplete_on_off=>'ON'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script>',
'',
'function setValue(pItemName, pValue){',
'  $x(pItemName).value = pValue;',
'  xlibJasperDemo_makeDemoUrl();',
'',
'  return false;',
'}',
'',
'function xlibJasperDemo_generateUrl(pBaseUrl, pRepName, pRepFormat, pDataSource, pOutFilename, pRepLocale, pRepEncoding, pAdditionalParams){',
'  var url;',
'',
'  url = pBaseUrl;',
'  url = url + "?_repName=" + pRepName;',
'  url = url + "&_repFormat=" + pRepFormat;',
'  url = url + "&_dataSource=" + pDataSource;',
'  url = url + "&_outFilename=" + pOutFilename;',
'  url = url + "&_repLocale=" + pRepLocale;',
'  url = url + "&_repEncoding=" + pRepEncoding;',
'  if (pAdditionalParams)  url = url + "&" + pAdditionalParams;',
'',
'  return url;',
'}',
'',
'function xlibJasperDemo_makeDemoUrl(){ ',
'  $x(''P5_REPORT_URL'').value=xlibJasperDemo_generateUrl($x(''P5_JASPER_REPORT_URL'').value, $x(''P5_REP_NAME'').value, $x(''P5_REP_FORMAT'').value, $x(''P5_DATA_SOURCE'').value, $x(''P5_OUT_FILENAME'').value, $x(''P5_REP_LOCALE'').value, $x(''P5_REP_ENCODING'').val'
||'ue, $x(''P5_ADDITIONAL_PARAMS'').value );',
'}',
'',
'function xlibShowUrl(pUrl){',
'  window.open(pUrl);',
'  ',
'  return false; ',
'}',
'',
'function xlibShowUrlTunnel(pUrl){',
'  var newUrl;',
'',
'  alert(pUrl);',
'   // !!! use encodeURIComponent, not escape !!!',
'  newUrl = encodeURIComponent(pUrl.replace(/:/gi,''|''));',
'  alert(newUrl);',
'  newUrl = ''f?p=&APP_ID.:0:&APP_SESSION.:APPLICATION_PROCESS=prc_show_url:::F_TMP_1:'' + newUrl;',
'',
'  alert(newUrl);',
'  window.open(newUrl);',
'  ',
'  return false; ',
'}',
'',
'',
'</script>'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#REPORT_TESTER td{',
'  vertical-align: top;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DIETMAR.AUST'
,p_last_upd_yyyymmddhh24miss=>'20181002195526'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(17384557235519005)
,p_plug_name=>'Info'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17332845056409410)
,p_plug_display_sequence=>21
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This report tester will only pass the parameters to the J2EE',
'application. <br>',
'<br>',
'The different parameters are explained in the local report tester as part of the J2EE application: <a href="&P0_INTEGRATION_CONTEXT_URL." target="_new">&P0_INTEGRATION_CONTEXT_URL.</a><br>'))
,p_plug_query_row_template=>wwv_flow_api.id(17344347028409417)
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26291581053523420)
,p_plug_name=>'Usage'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17328333600409399)
,p_plug_display_sequence=>1
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_menu_id=>wwv_flow_api.id(56539424029997642)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(17346735300409418)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(26406201775509334)
,p_plug_name=>'Report tester'
,p_region_name=>'REPORT_TESTER'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17332845056409410)
,p_plug_display_sequence=>31
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17376338658097369)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(26406201775509334)
,p_button_name=>'SHOW_REPORT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(17325751309409385)
,p_button_image_alt=>'Show Report'
,p_button_position=>'TOP_AND_BOTTOM'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(17377339228163807)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(26406201775509334)
,p_button_name=>'GET_REPORT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(17325751309409385)
,p_button_image_alt=>'Get Report as BLOB, then Show'
,p_button_position=>'TOP_AND_BOTTOM'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(13692704968627381)
,p_branch_action=>'f?p=&APP_ID.:5:&SESSION.:SHOW_REPORT:&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(17376338658097369)
,p_branch_sequence=>999
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 12-APR-2015 12:19 by DIETMAR.AUST'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(13693432597729955)
,p_branch_action=>'f?p=&APP_ID.:5:&SESSION.:GET_REPORT:&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(17377339228163807)
,p_branch_sequence=>1009
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 12-APR-2015 12:36 by DIETMAR.AUST'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(26452383822308417)
,p_branch_action=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1029
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 07-AUG-2008 16:28 by ADMIN'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3500721319475207)
,p_name=>'P5_REP_TIME_ZONE'
,p_item_sequence=>18
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_prompt=>'p_rep_time_zone'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'Europe/Berlin'
,p_quick_pick_value_01=>'Europe/Berlin'
,p_quick_pick_label_02=>'Europe/London'
,p_quick_pick_value_02=>'Europe/London'
,p_quick_pick_label_03=>'US/Central'
,p_quick_pick_value_03=>'US/Central'
,p_quick_pick_label_04=>'US/Pacific'
,p_quick_pick_value_04=>'US/Pacific'
,p_quick_pick_label_05=>'Etc/Greenwich'
,p_quick_pick_value_05=>'Etc/Greenwich'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17379034997257210)
,p_name=>'P5_PRINT_IS_ENABLED'
,p_item_sequence=>39
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_prompt=>'p_print_is_enabled'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:;1'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17379244001259779)
,p_name=>'P5_PRINT_PRINTER_NAME'
,p_item_sequence=>49
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_prompt=>'p_print_printer_name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17379451274261903)
,p_name=>'P5_PRINT_MEDIA'
,p_item_sequence=>69
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_prompt=>'p_print_media'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17379658892264083)
,p_name=>'P5_PRINT_COPIES'
,p_item_sequence=>79
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_prompt=>'p_print_copies'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17381335830342566)
,p_name=>'P5_PRINT_DUPLEX'
,p_item_sequence=>89
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_prompt=>'p_print_duplex'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:;1'
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17381542756344558)
,p_name=>'P5_PRINT_COLLATE'
,p_item_sequence=>99
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_prompt=>'p_print_collate'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:;1'
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17381751414347013)
,p_name=>'P5_SAVE_IS_ENABLED'
,p_item_sequence=>119
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_prompt=>'p_save_is_enabled'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:;1'
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(17381958686349144)
,p_name=>'P5_SAVE_FILENAME'
,p_item_sequence=>129
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_prompt=>'p_save_filename'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26407487015514542)
,p_name=>'P5_REP_NAME'
,p_item_sequence=>3
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_item_default=>'test'
,p_prompt=>'p_rep_name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'test with logo'
,p_quick_pick_value_01=>'demo/test2'
,p_quick_pick_label_02=>'test with logo and blob images'
,p_quick_pick_value_02=>'demo/orders'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26408096711517340)
,p_name=>'P5_REP_FORMAT'
,p_item_sequence=>4
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_item_default=>'PDF'
,p_prompt=>'p_rep_format'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:pdf;pdf,rtf;rtf,docx;docx,xls;xls,xlsx;xlsx,csv;csv,pptx;pptx,html (JRHtmlExporter);html,html2 (new HTMLExporter 5.0);html2'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26409294765526173)
,p_name=>'P5_DATA_SOURCE'
,p_item_sequence=>5
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_item_default=>'default'
,p_prompt=>'p_data_source'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26410786238533235)
,p_name=>'P5_OUT_FILENAME'
,p_item_sequence=>6
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_prompt=>'p_out_filename'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'myTest.pdf'
,p_quick_pick_value_01=>'myTest.pdf'
,p_quick_pick_label_02=>'myTest.rtf'
,p_quick_pick_value_02=>'myTest.rtf'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26411597320536442)
,p_name=>'P5_REP_LOCALE'
,p_item_sequence=>7
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_item_default=>'de_DE'
,p_prompt=>'p_rep_locale'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'de_DE'
,p_quick_pick_value_01=>'de_DE'
,p_quick_pick_label_02=>'en_US'
,p_quick_pick_value_02=>'en_US'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26415985985589887)
,p_name=>'P5_REP_ENCODING'
,p_item_sequence=>8
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_item_default=>'UTF-8'
,p_prompt=>'p_rep_encoding'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>1
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'ISO-8859-1'
,p_quick_pick_value_01=>'ISO-8859-1'
,p_quick_pick_label_02=>'ISO-8859-15'
,p_quick_pick_value_02=>'ISO-8859-15'
,p_quick_pick_label_03=>'UTF-8'
,p_quick_pick_value_03=>'UTF-8'
,p_quick_pick_label_04=>'Windows-1252'
,p_quick_pick_value_04=>'Windows-1252'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26421290412685807)
,p_name=>'P5_ADDITIONAL_PARAMS'
,p_item_sequence=>29
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_prompt=>'p_additional_params'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>50
,p_cMaxlength=>2000
,p_cHeight=>5
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(44961649771206115)
,p_name=>'P5_PRINT_JOB_NAME'
,p_item_sequence=>109
,p_item_plug_id=>wwv_flow_api.id(26406201775509334)
,p_prompt=>'p_print_job_name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cAttributes=>'nowrap'
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13696018451557601)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set image handler'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--xlib_jasperreports.set_images_uri(xlib_jasperreports.c_images_uri_no_tunnel);',
'xlib_jasperreports.set_images_uri(xlib_jasperreports.c_images_uri_tunnel);',
'null;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13692119728622241)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'show report - render'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_proc varchar2(100) := ''show report'';',
'  l_report_url varchar2(32767 char) := :p0_report_url;',
'BEGIN',
'  xlog (l_proc, ''url (orig):'' || l_report_url);',
'',
'  xlib_jasperreports.set_report_url(l_report_url);',
'  xlib_jasperreports.show_report (p_rep_name => apex_util.url_encode(:p5_rep_name),',
'          p_rep_format          => apex_util.url_encode(:p5_rep_format),',
'          p_data_source         => apex_util.url_encode(:p5_data_source),',
'          p_out_filename        => apex_util.url_encode(:p5_out_filename),',
'          p_rep_locale          => apex_util.url_encode(:p5_rep_locale),',
'          p_rep_encoding        => apex_util.url_encode(:p5_rep_encoding),',
'          p_additional_params   => :p5_additional_params,',
'          p_print_is_enabled    => case when :p5_print_is_enabled=''1'' then true else false end,',
'          p_print_printer_name  => apex_util.url_encode(:p5_print_printer_name),',
'          p_print_media         => apex_util.url_encode(:p5_print_media),',
'          p_print_copies        => apex_util.url_encode(:p5_print_copies),',
'          p_print_duplex        => case when :p5_print_duplex=''1'' then true else false end,',
'          p_print_collate       => case when :p5_print_collate=''1'' then true else false end,',
'          p_save_is_enabled     => case when :p5_save_is_enabled=''1'' then true else false end,',
'          p_save_filename       => apex_util.url_encode(:p5_save_filename),',
'          p_rep_time_zone       => apex_util.url_encode(:p5_rep_time_zone),',
'          p_print_job_name      => apex_util.url_encode(:p5_print_job_name)',
'          );',
'  ',
'  -- this was used before apex 4.1',
'  --apex_application.g_unrecoverable_error := true;',
'  apex_application.stop_apex_engine;',
'',
'exception',
'  when others then ',
'    xlog(l_proc, substr(dbms_utility.format_error_backtrace,1,3500), ''ERROR'');',
'    raise;',
'end;'))
,p_process_when=>'SHOW_REPORT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30127509368508435)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'get report as blob, then show'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   l_blob        BLOB;',
'   l_mime_type   VARCHAR2 (100);',
'   ',
'   l_proc varchar2(100) := ''get report as blob, then show'';',
'BEGIN',
'   xlog (l_proc, ''url (orig):'' || :p0_report_url);',
'   ',
'   ------------------------------------------------------------------------',
'   -- generate the report and return in BLOB',
'   ------------------------------------------------------------------------',
'   xlib_jasperreports.set_report_url (:p0_report_url);',
'   xlib_jasperreports.get_report(p_rep_name => apex_util.url_encode(:p5_rep_name),',
'          p_rep_format          => apex_util.url_encode(:p5_rep_format),',
'          p_data_source         => apex_util.url_encode(:p5_data_source),',
'          p_rep_locale          => apex_util.url_encode(:p5_rep_locale),',
'          p_rep_encoding        => apex_util.url_encode(:p5_rep_encoding),',
'          p_additional_params   => :p5_additional_params,',
'          p_print_is_enabled    => case when :p5_print_is_enabled=''1'' then true else false end,',
'          p_print_printer_name  => apex_util.url_encode(:p5_print_printer_name),',
'          p_print_media         => apex_util.url_encode(:p5_print_media),',
'          p_print_copies        => apex_util.url_encode(:p5_print_copies),',
'          p_print_duplex        => case when :p5_print_duplex=''1'' then true else false end,',
'          p_print_collate       => case when :p5_print_collate=''1'' then true else false end,',
'          p_save_is_enabled     => case when :p5_save_is_enabled=''1'' then true else false end,',
'          p_save_filename       => apex_util.url_encode(:p5_save_filename),',
'          p_rep_time_zone       => apex_util.url_encode(:p5_rep_time_zone),',
'          p_out_blob            => l_blob,',
'          p_out_mime_type       => l_mime_type,',
'          p_print_job_name      => apex_util.url_encode(:p5_print_job_name));',
'   ',
'   ------------------------------------------------------------------------',
'   -- set mime header',
'   ------------------------------------------------------------------------',
'   htp.flush;',
'   htp.init;',
'   OWA_UTIL.mime_header (ccontent_type      => l_mime_type,',
'                         bclose_header      => FALSE);',
'   ------------------------------------------------------------------------',
'   -- set content length',
'   ------------------------------------------------------------------------',
'   HTP.p (''Content-length: '' || DBMS_LOB.getlength (l_blob));',
'   OWA_UTIL.http_header_close;',
'   ------------------------------------------------------------------------',
'   -- download the file and display in browser',
'   ------------------------------------------------------------------------',
'   WPG_DOCLOAD.download_file (l_blob);',
'   ------------------------------------------------------------------------',
'   -- release resources',
'   ------------------------------------------------------------------------',
'   DBMS_LOB.freetemporary (l_blob);',
'   ------------------------------------------------------------------------',
'   -- stop rendering of APEX page',
'   ------------------------------------------------------------------------',
'  -- this was used before apex 4.1',
'  --apex_application.g_unrecoverable_error := true;',
'  apex_application.stop_apex_engine;',
'EXCEPTION',
'   WHEN OTHERS',
'   THEN',
'      xlog (l_proc, SQLERRM, ''ERROR'');',
'      RAISE;',
'END;'))
,p_process_when_button_id=>wwv_flow_api.id(17377339228163807)
,p_process_when=>'GET_REPORT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(64731510056518)
,p_tab_set=>'TS1'
,p_name=>'Samples > Show report and branch to other page'
,p_step_title=>'Samples > Show report and branch to other page'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DIETMAR.AUST'
,p_last_upd_yyyymmddhh24miss=>'20150412123831'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13274002803449143)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17328333600409399)
,p_plug_display_sequence=>1
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'BELOW'
,p_menu_id=>wwv_flow_api.id(56539424029997642)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(17346735300409418)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(13275631280498269)
,p_plug_name=>'Call Report'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17332845056409410)
,p_plug_display_sequence=>11
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(13275802453508803)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(13275631280498269)
,p_button_name=>'SHOW_REPORT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(17325751309409385)
,p_button_image_alt=>'Show Report'
,p_button_position=>'TOP'
,p_button_redirect_url=>'javascript:apex.submit(''SHOW_REPORT'');apex.submit(''BRANCH_TO_HOME'');'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(13276706692841169)
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'BRANCH_TO_HOME'
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 27-JUN-2014 01:49 by DIETMAR.AUST'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(13276103304745599)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'show report'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_proc varchar2(100) := ''show report'';',
'BEGIN',
'  xlog (l_proc, ''url (orig):'' || :p0_report_url);',
'',
'  xlib_jasperreports.set_report_url(:P0_report_url);',
'  xlib_jasperreports.show_report (p_rep_name => ''test'',',
'          p_rep_format          => xlib_jasperreports.c_rep_format_pdf,',
'          p_data_source         => ''default'',',
'          p_out_filename        => ''test.pdf''',
'          );',
'',
'  apex_application.g_unrecoverable_error := true;',
'',
'exception',
'  when others then ',
'    xlog(l_proc, sqlerrm, ''ERROR'');',
'    raise;',
'end;'))
,p_process_when_button_id=>wwv_flow_api.id(13275802453508803)
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(64731510056518)
,p_name=>'Anmelden'
,p_alias=>'LOGIN'
,p_step_title=>'Anmelden'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>wwv_flow_api.id(17321340089409358)
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_last_updated_by=>'DIETMAR.AUST'
,p_last_upd_yyyymmddhh24miss=>'20150412124141'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(56538626247997581)
,p_plug_name=>'Anmelden'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(56538916703997624)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(56538626247997581)
,p_button_name=>'P101_LOGIN'
,p_button_static_id=>'P101_LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(17325751309409385)
,p_button_image_alt=>'Login'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_request_source=>'LOGIN'
,p_request_source_type=>'STATIC'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_grid_row_span=>1
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56538726941997610)
,p_name=>'P101_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(56538626247997581)
,p_prompt=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_cHeight=>1
,p_colspan=>2
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(56538823419997624)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(56538626247997581)
,p_prompt=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_cHeight=>1
,p_colspan=>1
,p_rowspan=>1
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(17346441206409418)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(56539131043997640)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Benutzername-Cookie festlegen'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'owa_util.mime_header(''text/html'', FALSE);',
'owa_cookie.send(',
'    name=>''LOGIN_USERNAME_COOKIE'',',
'    value=>lower(:P101_USERNAME));',
'exception when others then null;',
'end;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(56539006154997631)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_custom_auth_std.login(',
'    P_UNAME       => :P101_USERNAME,',
'    P_PASSWORD    => :P101_PASSWORD,',
'    P_SESSION_ID  => v(''APP_SESSION''),',
'    P_FLOW_PAGE   => :APP_ID||'':1''',
'    );'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(56539314255997642)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>unistr('Seiten-Cache-Inhalt l\00F6schen')
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(56539234664997642)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Benutzername-Cookie abrufen'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v varchar2(255) := null;',
'    c owa_cookie.cookie;',
'begin',
'   c := owa_cookie.get(''LOGIN_USERNAME_COOKIE'');',
'   :P101_USERNAME := c.vals(1);',
'exception when others then null;',
'end;'))
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(31817680301535289)
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
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
