create or replace PACKAGE "XLIB_JASPERREPORTS"
AS
/*=========================================================================
  Purpose  : 

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14

  $LastChangedDate: 2018-09-30 09:00:44 +0200 (So, 30 Sep 2018) $
  $LastChangedBy: dietmar.aust $

  Version  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           06.01.2010  D. Aust   Initial creation
           06.05.2011  D. Aust   added constants for xlsx and docx
           05.08.2012  D. Aust   added version 2.0.0 features:
                                 - direct printing
                                 - save file on server
           11.05.2013  D. Aust   added support for tunneling images for html
                                   exports only
  2.3.0.0  19.05.2014  D. Aust   - #294 - Fix chunked encoding problem in 
                                     xlib_http.get_report
                                 - added version information to this package
  2.4.0.0  15.10.2017  D. Aust   FEATURE: #3941 - Support for timeZones 
                                 (report parameter REPORT_TIME_ZONE)
  2.5.0.0  29.09.2018  D. Aust   FEATURE: #9 - Ability to set Printjob name (programmatically)   
  2.5.0.1  30.09.2018  D. Aust     fix bool2string issue
  2.6.1    01.10.2020  D. Aust   add get_default_configuration() and set_default_configuration()

=========================================================================*/

  -- version of this package
  version_c constant varchar2(20 char) := '2.6.1';   

   -- constants
   -- supported formats
   c_rep_format_pdf    CONSTANT VARCHAR2 (20) := 'pdf';
   c_rep_format_rtf    CONSTANT VARCHAR2 (20) := 'rtf';
   c_rep_format_xls    CONSTANT VARCHAR2 (20) := 'xls';
   c_rep_format_html   constant varchar2 (20) := 'html';
   c_rep_format_html2   CONSTANT VARCHAR2 (20) := 'html2';
   c_rep_format_csv    CONSTANT VARCHAR2 (20) := 'csv';
   c_rep_format_docx    CONSTANT VARCHAR2 (20) := 'docx';
   c_rep_format_pptx    CONSTANT VARCHAR2 (20) := 'pptx';
   c_rep_format_xlsx    CONSTANT VARCHAR2 (20) := 'xlsx';

   -- images uri
   --c_images_uri_tunnel constant varchar2(100 char) 
   --       := 'xlib_jasperreports_img.get_image?p_url=#REPORT_URL#&p_image=';
   -- #IMAGE_NAME# and #J2EE_CONTEXT# will be substituted on the J2EE server side
   m_jri_cookie_name_c      CONSTANT VARCHAR2 (50) := 'JRI_SESSIONID';
   m_jri_path_cookie_name_c CONSTANT VARCHAR2 (50) := 'JRI_PATH';   
   c_images_uri_tunnel constant varchar2(500 char) := 'wwv_flow.show?p_request=APPLICATION_PROCESS%3DJRI_SHOW_IMAGE&p_flow_id=#APP_ID#&p_flow_step_id=0&p_instance=#APP_SESSION#&x01=#IMAGE_NAME#';
   c_images_uri_no_tunnel constant varchar2(500 char) := '#J2EE_CONTEXT_PATH#/report_image?image=#IMAGE_NAME#';

   -- exceptions
   report_url_not_defined       EXCEPTION;

----------------------------------------------------------------------------
-- sets the url for the report server for all requests in the
-- current session
----------------------------------------------------------------------------
   PROCEDURE set_report_url (p_report_url IN VARCHAR2);

   FUNCTION get_report_url
      RETURN VARCHAR2;

----------------------------------------------------------------------------
-- set the image uri for html reports only!
----------------------------------------------------------------------------
   PROCEDURE set_images_uri (p_images_uri IN VARCHAR2 default null);
   procedure use_images_no_tunnel (p_server_uri in varchar2 default null, p_cookie_path varchar2 default null);
   function get_use_images_no_tunnel return boolean;

   FUNCTION get_images_uri
      return varchar2;
   FUNCTION get_cookie_path_no_tunnel
      RETURN VARCHAR2;


/**  make a callout with utl_http to the j2ee container running the
 *   JasperReportsIntegration web application
 *   => return the results
 *
 * @param p_rep_name      name of the report (needs a name.jasper file deployed on the server)
 * @param p_rep_format    report format, e.g. pdf, rtf, etc, see constants
 * @param p_data_source   data source name, needs to be configured in J2EE application
 * @param p_out_filename  filename if the file should be downloaded
 * @param p_rep_locale    report locale setting, e.g. de_DE or en_US
 * @param p_rep_encoding  encoding, e.g. UTF-8
 * @param p_additional_params additional parameters, e.g.: p1=1&p2=2
 * @param p_print_is_enabled shall the report be sent to the printer directly?
 * @param p_print_printer_name  name or substring of printer name
 * @param p_print_media   media used, either the paper size or the tray
 * @param p_print_copies  number of copies to be printed
 * @param p_print_duplex  duplex printing?
 * @param p_print_collate sorting the print output?
 * @param p_save_is_enabled shall the generated file be saved on the server?
 * @param p_rep_time_zone "time zone" parameter for the execution of the report, 
                          a list of valid entries can be found here:
                          https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
                          E.g.: Europe/Berlin, UCT, US/Central, US/Pacific, 
                          Etc/Greenwich, Europe/London
 * @param p_save_filename filename for the file to be saved on the server 
 * @param p_print_job_name name of the print job name, by default it uses: JasperReports - <report name>
 * 
 */
   PROCEDURE show_report (
      p_rep_name            IN   VARCHAR2 DEFAULT 'test',
      p_rep_format          IN   VARCHAR2 DEFAULT c_rep_format_pdf,
      p_data_source         IN   VARCHAR2 DEFAULT 'default',
      p_out_filename        IN   VARCHAR2 DEFAULT NULL,
      p_rep_locale          in   varchar2 default 'de_DE',
      p_rep_encoding        in   varchar2 default 'UTF-8',
      p_additional_params   in   varchar2 default null,
      p_print_is_enabled    in   boolean default false,
      p_print_printer_name  in   varchar2 default null,
      p_print_media         in   varchar2 default null,
      p_print_copies        in   number default 1,
      p_print_duplex        in   boolean default false,
      p_print_collate       in   boolean default false,
      p_save_is_enabled     in   boolean default false,
      p_save_filename       in   varchar2 default null,
      p_rep_time_zone       in   varchar2 default null,
      p_print_job_name      in   varchar2 default null
   );

   /* tunnels images for html reports */
   procedure show_image(p_image_name IN   VARCHAR2);


/**  run the report and return the result as a blob
 *
 * @param p_rep_name      name of the report (needs a name.jasper file deployed on the server)
 * @param p_rep_format    report format, e.g. pdf, rtf, etc, see constants
 * @param p_data_source   data source name, needs to be configured in J2EE application
 * @param p_out_filename  filename if the file should be downloaded
 * @param p_rep_locale    report locale setting, e.g. de_DE or en_US
 * @param p_rep_encoding  encoding, e.g. UTF-8
 * @param p_additional_params additional parameters, e.g.: p1=1&p2=2
 * @param p_print_is_enabled shall the report be sent to the printer directly?
 * @param p_print_printer_name  name or substring of printer name
 * @param p_print_media   media used, either the paper size or the tray
 * @param p_print_copies  number of copies to be printed
 * @param p_print_duplex  duplex printing?
 * @param p_print_collate sorting the print output?
 * @param p_save_is_enabled shall the generated file be saved on the server?
 * @param p_save_filename filename for the file to be saved on the server
 * @param p_rep_time_zone "time zone" parameter for the execution of the report, 
                          a list of valid entries can be found here:
                          https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
                          E.g.: Europe/Berlin, UCT, US/Central, US/Pacific, 
                          Etc/Greenwich, Europe/London
 * @param p_out_blob      the blob will be returned here
 * @param p_out_mime_type the proper mime type of the generated file 
 * @param p_print_job_name name of the print job name, by default it uses: JasperReports - <report name> 
 *
 */
   PROCEDURE get_report (
      p_rep_name            IN   VARCHAR2 DEFAULT 'test',
      p_rep_format          in   varchar2 default c_rep_format_pdf,
      p_data_source         IN   VARCHAR2 DEFAULT 'default',
      p_rep_locale          in   varchar2 default 'de_DE',
      p_rep_encoding        IN   VARCHAR2 DEFAULT 'UTF-8',
      p_additional_params   in   varchar2 default null,
      p_print_is_enabled    in   boolean default  false,
      p_print_printer_name  in   varchar2 default null,
      p_print_media         in   varchar2 default null,
      p_print_copies        in   number default 1,
      p_print_duplex        in   boolean default false,
      p_print_collate       in   boolean default false,
      p_save_is_enabled     in   boolean default false,
      p_save_filename       in   varchar2 default null,
      p_rep_time_zone       in   varchar2 default null,
      p_out_blob            IN OUT   BLOB,
      p_out_mime_type       IN OUT   VARCHAR2,
      p_print_job_name      in   varchar2 default null
   );
   
----------------------------------------------------------------------------
-- get default configuration
----------------------------------------------------------------------------
   FUNCTION get_default_configuration
      return xlib_jasperreports_conf%rowtype;
      
----------------------------------------------------------------------------
-- set default configuration
----------------------------------------------------------------------------
    PROCEDURE set_default_configuration(p_conf in out xlib_jasperreports_conf%rowtype);      

    PROCEDURE set_default_configuration (
    p_protocol                IN xlib_jasperreports_conf.conf_protocol%TYPE default 'http',
    p_server                  IN xlib_jasperreports_conf.conf_server%TYPE default 'localhost',
    p_port                    IN xlib_jasperreports_conf.conf_port%TYPE default '80',
    p_context_path            IN xlib_jasperreports_conf.conf_context_path%TYPE default 'jri',
    p_wallet_path             IN xlib_jasperreports_conf.conf_wallet_path%TYPE default null,
    p_wallet_pwd              IN xlib_jasperreports_conf.conf_wallet_pwd%TYPE default null,
    p_http_transfer_timeout   IN xlib_jasperreports_conf.conf_http_transfer_timeout%TYPE default 60);


END;
/
