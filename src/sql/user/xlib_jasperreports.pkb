CREATE OR REPLACE PACKAGE BODY "XLIB_JASPERREPORTS"
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


   m_module       constant varchar2 (100) := $$plsql_unit;
   m_report_url   VARCHAR2 (32767) := NULL;
   m_images_uri   VARCHAR2 (32767) := NULL;
   m_use_images_no_tunnel boolean := false;
   m_cookie_path_no_tunnel varchar2(200 char) := null;

   -- convert boolean to 'true' or 'false'
   FUNCTION bool2string (b IN BOOLEAN)
      RETURN VARCHAR2
   IS
   BEGIN
      IF b
      THEN
         RETURN 'true';
      ELSE
         RETURN 'false';
      END IF;
   END;

    procedure setup_configuration_defaults
    is
      l_conf xlib_jasperreports_conf%rowtype;
      l_timeout PLS_INTEGER;
    begin
        l_conf := get_default_configuration();
        
        -- override report url if not defined
        if m_report_url is null then
          m_report_url := l_conf.conf_protocol || '://'||l_conf.conf_server||':'||l_conf.conf_port||'/'||l_conf.conf_context_path||'/report';
          xlog(p_module => m_module, p_msg => 'Override report url from defaults: '|| m_report_url, p_type=> 'DEBUG');
        end if;
        
        -- set wallet path and pwd
        -- will ALWAYS override the settings, will ignore previous calls to set_wallet
        if lower(m_report_url) like 'https%' then
            utl_http.set_wallet(l_conf.conf_wallet_path, l_conf.conf_wallet_pwd);
            xlog(p_module => m_module, p_msg => 'Override wallet location/pwd from defaults', p_type=> 'DEBUG');
        end if;
        
        -- override http transfer timeout it not defined
        utl_http.get_transfer_timeout( timeout => l_timeout );
        if l_timeout is null then
            utl_http.set_transfer_timeout(l_conf.conf_http_transfer_timeout);
            xlog(p_module => m_module, p_msg => 'Override http transfer timeout from defaults: '|| l_conf.conf_http_transfer_timeout, p_type=> 'DEBUG');
        end if;
        
    end;

   PROCEDURE dump_all_cookies
   IS
      l_proc       VARCHAR2 (100) := m_module || '.dump_all_cookies';
      l_name_arr   OWA_COOKIE.vc_arr;
      l_vals_arr   OWA_COOKIE.vc_arr;
      l_vals_ret   INTEGER;
   BEGIN
      xlog (l_proc, 'start');
      OWA_COOKIE.get_all (names => l_name_arr, vals => l_vals_arr, num_vals => l_vals_ret);

      xlog (l_proc, '#num of cookies: ' || l_vals_ret);

      FOR i IN 1 .. l_name_arr.COUNT
      LOOP
         xlog (l_proc, i || ':' || l_name_arr (i) || '=' || l_vals_arr (i));
      END LOOP;

      xlog (l_proc, 'end');
   END;

   ----------------------------------------------------------------------------
   -- sets the url for the report server for all requests in the
   -- current session
   ----------------------------------------------------------------------------
   PROCEDURE set_report_url (p_report_url IN VARCHAR2)
   IS
   BEGIN
      xlog ('set_report_url:', p_report_url);
      m_report_url := p_report_url;
   END;

   FUNCTION get_report_url
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN m_report_url;
   END;

   ----------------------------------------------------------------------------
   -- sets the images_uri only for http reports!
   ----------------------------------------------------------------------------
   PROCEDURE set_images_uri (p_images_uri IN VARCHAR2)
   IS
   BEGIN
      m_images_uri := p_images_uri;
   END;
   
   /* use the images from the application server when both /ords and /jri are 
      installed on the same application server 
      
      the p_server_uri parameter is rarely used, only when they are not run on the same application server
      and the uri differs. But that comes with a lot of CORS and other cookie issues. 
    */
   procedure use_images_no_tunnel (p_server_uri in varchar2 default null, p_cookie_path varchar2 default null)
   is
   begin
     m_use_images_no_tunnel := true;
     m_cookie_path_no_tunnel := p_cookie_path;
     
     -- the placeholders #J2EE_CONTEXT_PATH# and #IMAGE_NAME# will be replaced 
     -- inside the J2EE application with the current values of the deployment
     set_images_uri( p_images_uri => p_server_uri || '#J2EE_CONTEXT_PATH#/report_image?image=#IMAGE_NAME#');
   end;
   
   function get_use_images_no_tunnel return boolean
   is
   begin
     return m_use_images_no_tunnel;
   end;

    FUNCTION get_cookie_path_no_tunnel
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN m_cookie_path_no_tunnel;
   END;


   FUNCTION get_images_uri
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN m_images_uri;
   END;

   FUNCTION compute_images_uri_tunnel
      RETURN VARCHAR2
   IS
      l_uri   VARCHAR2 (32767 CHAR);
   BEGIN
      --l_uri := sys_context( 'userenv', 'current_schema' )
      --                                  || '.' || c_images_uri_tunnel;

      /*
          c_images_uri_tunnel
              :='xlib_jasperreports_img.get_image?p_url=#REPORT_URL#&p_image=';
       */

      --l_uri := replace(l_uri, '#REPORT_URL#', APEX_UTIL.URL_ENCODE(m_report_url));
      --l_uri := replace(l_uri, '#REPORT_URL#', m_report_url);

      --   c_images_uri_tunnel constant varchar2(100 char) := 'wwv_flow.show?p_request=APPLICATION_PROCESS%3DJRI_SHOW_IMAGE&p_flow_id=#APP_ID#&p_flow_step_id=0&p_instance=#APP_SESSION#&x01=#IMG_NAME#';
      l_uri := c_images_uri_tunnel;
      l_uri := REPLACE (l_uri, '#APP_ID#', v ('APP_ID'));
      l_uri := REPLACE (l_uri, '#APP_SESSION#', v ('APP_SESSION'));

      xlog ('compute tunnel', l_uri);

      RETURN l_uri;
   END;

   ----------------------------------------------------------------------------
   -- displays an image for html reports
   ----------------------------------------------------------------------------
   PROCEDURE show_image (p_image_name IN VARCHAR2)
   IS
      l_proc               VARCHAR2 (100) := m_module || '.show_image';
      l_url                VARCHAR2 (32767);

      l_header_name_arr    xlib_http.vc_arr_t;
      l_header_value_arr   xlib_http.vc_arr_t;

      PROCEDURE get_headers_to_pass2j2ee (p_header_name_arr    OUT xlib_http.vc_arr_t,
                                          p_header_value_arr   OUT xlib_http.vc_arr_t)
      IS
         l_proc                 VARCHAR2 (100) := m_module || '.get_headers_to_pass2j2ee';
         jsession_cookie        OWA_COOKIE.cookie;
         jsession_path_cookie   OWA_COOKIE.cookie;
      BEGIN
         jsession_cookie := OWA_COOKIE.get (name => m_jri_cookie_name_c);
         jsession_path_cookie := OWA_COOKIE.get (name => m_jri_path_cookie_name_c);

         xlog (l_proc, 'show jsession_id and path: ');
         xlog (l_proc, jsession_cookie.vals (1));
         xlog (l_proc, jsession_path_cookie.vals (1));


         p_header_name_arr (p_header_name_arr.COUNT + 1) := 'Cookie';
         p_header_value_arr (p_header_value_arr.COUNT + 1) :=
            'JSESSIONID=' || jsession_cookie.vals (1) || ';Path=' || jsession_path_cookie.vals (1);
      --xlog(l_proc, 'end');
      EXCEPTION
         WHEN OTHERS
         THEN
            xlog (l_proc, DBMS_UTILITY.format_error_backtrace, 'ERROR');
      END;
   BEGIN
      xlog (l_proc, 'start: ### SHOW IMAGE: ' || p_image_name);
      dump_all_cookies;
      
      -- pick up defaults from table xlib_jasperreports_conf
      setup_configuration_defaults();

      -------------------------------------------------------
      -- assert valid values for the input variables
      -------------------------------------------------------
      IF m_report_url IS NULL
      THEN
         RAISE report_url_not_defined;
      END IF;

      -------------------------------------------------------
      -- construct URL
      -------------------------------------------------------
      -- _image?image=img_0_0_15&uuid=b41eb881-7ca5-4919-bd8f-5afa8d10b398
      l_url := m_report_url || '_image';
      l_url := l_url || '?image=' || p_image_name;
      l_url := l_url || '&JSESSIONID=' || OWA_COOKIE.get (name => m_jri_cookie_name_c).vals (1);

      -------------------------------------------------------
      -- determine cookies for calling the j2ee server
      -- JSESSIONID needs to be passed, the path needs to
      -- be modified for the j2ee server context
      -------------------------------------------------------
      get_headers_to_pass2j2ee (p_header_name_arr => l_header_name_arr, p_header_value_arr => l_header_value_arr);

      -------------------------------------------------------
      -- call J2EE server
      -------------------------------------------------------
      xlib_http.
       display_url_raw (p_url => l_url, p_header_name_arr => l_header_name_arr, p_header_value_arr => l_header_value_arr);
   END;



   ----------------------------------------------------------------------------
   -- make a callout with utl_http to the j2ee container running the
   -- JasperReportsIntegration webapp
   -- => return the results
   ----------------------------------------------------------------------------
   PROCEDURE show_report (p_rep_name             IN VARCHAR2 DEFAULT 'test',
                          p_rep_format           IN VARCHAR2 DEFAULT c_rep_format_pdf,
                          p_data_source          IN VARCHAR2 DEFAULT 'default',
                          p_out_filename         IN VARCHAR2 DEFAULT NULL,
                          p_rep_locale           IN VARCHAR2 DEFAULT 'de_DE',
                          p_rep_encoding         IN VARCHAR2 DEFAULT 'UTF-8',
                          p_additional_params    IN VARCHAR2 DEFAULT NULL,
                          p_print_is_enabled     IN BOOLEAN DEFAULT FALSE,
                          p_print_printer_name   IN VARCHAR2 DEFAULT NULL,
                          p_print_media          IN VARCHAR2 DEFAULT NULL,
                          p_print_copies         IN NUMBER DEFAULT 1,
                          p_print_duplex         IN BOOLEAN DEFAULT FALSE,
                          p_print_collate        IN BOOLEAN DEFAULT FALSE,
                          p_save_is_enabled      IN BOOLEAN DEFAULT FALSE,
                          p_save_filename        IN VARCHAR2 DEFAULT NULL,
                          p_rep_time_zone        IN VARCHAR2 DEFAULT NULL,
                          p_print_job_name       IN VARCHAR2 DEFAULT NULL)
   IS
      l_proc   VARCHAR2 (100) := m_module || '.SHOW_REPORT';
      l_url    VARCHAR2 (32767);
   BEGIN
      -- pick up defaults from table xlib_jasperreports_conf
      setup_configuration_defaults();
   
      -------------------------------------------------------
      -- assert valid values for the input variables
      -------------------------------------------------------
      IF m_report_url IS NULL
      THEN
         xlog(p_module => m_module, p_msg => 'The report url is empty', p_type=> 'ERROR');
         
         RAISE report_url_not_defined;
      END IF;

      -------------------------------------------------------
      -- construct URL
      -------------------------------------------------------
      l_url := m_report_url;
      l_url := l_url || '?_repName=' || p_rep_name;
      l_url := l_url || '&_repFormat=' || p_rep_format;
      l_url := l_url || '&_dataSource=' || p_data_source;
      l_url := l_url || '&_outFilename=' || p_out_filename;
      l_url := l_url || '&_repLocale=' || p_rep_locale;
      l_url := l_url || '&_repEncoding=' || p_rep_encoding;
      l_url := l_url || '&_repTimeZone=' || APEX_UTIL.URL_ENCODE (p_rep_time_zone);

      -- per default use the tunnel through the database
      IF m_images_uri IS NULL OR m_images_uri = c_images_uri_tunnel
      THEN
         -- tunnel through database
         l_url := l_url || '&_imagesURI=' || APEX_UTIL.URL_ENCODE (compute_images_uri_tunnel);
      ELSE
         -- use parameter, mostly for direct access to servlet
         l_url := l_url || '&_imagesURI=' || APEX_UTIL.URL_ENCODE (m_images_uri);
      END IF;

      -- direct printing
      l_url := l_url || '&_printIsEnabled=' || bool2string (p_print_is_enabled);
      l_url := l_url || '&_printPrinterName=' || p_print_printer_name;
      l_url := l_url || '&_printPrinterTray=' || p_print_media;
      l_url := l_url || '&_printCopies=' || p_print_copies;
      l_url := l_url || '&_printDuplex=' || bool2string (p_print_duplex);
      l_url := l_url || '&_printCollate=' || bool2string (p_print_collate);
      l_url := l_url || '&_printJobName=' || p_print_job_name;

      -- save file on server
      l_url := l_url || '&_saveIsEnabled=' || bool2string (p_save_is_enabled);
      l_url := l_url || '&_saveFileName=' || p_save_filename;

      -- additional report parameter passed?
      IF (p_additional_params IS NOT NULL)
      THEN
         l_url := l_url || '&' || p_additional_params;
      END IF;

      -------------------------------------------------------
      -- call J2EE server
      -------------------------------------------------------
      xlib_http.display_url_raw (p_url => l_url);
   END;

   ----------------------------------------------------------------------------
   -- run the report and return the result as a blob
   ----------------------------------------------------------------------------
   PROCEDURE get_report (p_rep_name             IN     VARCHAR2 DEFAULT 'test',
                         p_rep_format           IN     VARCHAR2 DEFAULT c_rep_format_pdf,
                         p_data_source          IN     VARCHAR2 DEFAULT 'default',
                         p_rep_locale           IN     VARCHAR2 DEFAULT 'de_DE',
                         p_rep_encoding         IN     VARCHAR2 DEFAULT 'UTF-8',
                         p_additional_params    IN     VARCHAR2 DEFAULT NULL,
                         p_print_is_enabled     IN     BOOLEAN DEFAULT FALSE,
                         p_print_printer_name   IN     VARCHAR2 DEFAULT NULL,
                         p_print_media          IN     VARCHAR2 DEFAULT NULL,
                         p_print_copies         IN     NUMBER DEFAULT 1,
                         p_print_duplex         IN     BOOLEAN DEFAULT FALSE,
                         p_print_collate        IN     BOOLEAN DEFAULT FALSE,
                         p_save_is_enabled      IN     BOOLEAN DEFAULT FALSE,
                         p_save_filename        IN     VARCHAR2 DEFAULT NULL,
                         p_rep_time_zone        IN     VARCHAR2 DEFAULT NULL,
                         p_out_blob             IN OUT BLOB,
                         p_out_mime_type        IN OUT VARCHAR2,
                         p_print_job_name       IN     VARCHAR2 DEFAULT NULL)
   IS
      l_proc   VARCHAR2 (100) := m_module || '.GET_REPORT';
      l_url    VARCHAR2 (32767);
   BEGIN
      -- pick up defaults from table xlib_jasperreports_conf
      setup_configuration_defaults();
      
      -------------------------------------------------------
      -- assert valid values for the input variables
      -------------------------------------------------------
      IF m_report_url IS NULL
      THEN
         RAISE report_url_not_defined;
      END IF;

      -------------------------------------------------------
      -- construct URL
      -------------------------------------------------------
      l_url := m_report_url;
      l_url := l_url || '?_repName=' || p_rep_name;
      l_url := l_url || '&_repFormat=' || p_rep_format;
      l_url := l_url || '&_dataSource=' || p_data_source;
      l_url := l_url || '&_repLocale=' || p_rep_locale;
      l_url := l_url || '&_repEncoding=' || p_rep_encoding;
      l_url := l_url || '&_repTimeZone=' || APEX_UTIL.URL_ENCODE (p_rep_time_zone);

      -- per default use the tunnel through the database
      IF m_images_uri IS NULL OR m_images_uri = c_images_uri_tunnel
      THEN
         -- tunnel through database
         l_url := l_url || '&_imagesURI=' || APEX_UTIL.URL_ENCODE (compute_images_uri_tunnel);
      ELSE
         -- use parameter, mostly for direct access to servlet
         l_url := l_url || '&_imagesURI=' || APEX_UTIL.URL_ENCODE (m_images_uri);
      END IF;

      -- direct printing
      l_url := l_url || '&_printIsEnabled=' || bool2string (p_print_is_enabled);
      l_url := l_url || '&_printPrinterName=' || p_print_printer_name;
      l_url := l_url || '&_printPrinterTray=' || p_print_media;
      l_url := l_url || '&_printCopies=' || p_print_copies;
      l_url := l_url || '&_printDuplex=' || bool2string (p_print_duplex);
      l_url := l_url || '&_printCollate=' || bool2string (p_print_collate);
      l_url := l_url || '&_printJobName=' || p_print_job_name;

      -- save file on server
      l_url := l_url || '&_saveIsEnabled=' || bool2string (p_save_is_enabled);
      l_url := l_url || '&_saveFileName=' || p_save_filename;

      -- additional report parameter passed?
      IF (p_additional_params IS NOT NULL)
      THEN
         l_url := l_url || '&' || p_additional_params;
      END IF;

      -------------------------------------------------------
      -- call Tomcat
      -------------------------------------------------------
      xlib_http.retrieve_blob_from_url (p_url => l_url, o_blob => p_out_blob, o_mime_type => p_out_mime_type);
   END;

   ----------------------------------------------------------------------------
   -- get default configuration
   ----------------------------------------------------------------------------
   FUNCTION get_default_configuration
      RETURN xlib_jasperreports_conf%ROWTYPE
   IS
      l_conf   xlib_jasperreports_conf%ROWTYPE;
   BEGIN
      SELECT *
        INTO l_conf
        FROM xlib_jasperreports_conf
       WHERE conf_id = 'MAIN';

      RETURN l_conf;
   END;

   ----------------------------------------------------------------------------
   -- set default configuration
   ----------------------------------------------------------------------------
   PROCEDURE set_default_configuration (p_conf IN OUT xlib_jasperreports_conf%ROWTYPE)
   IS
   BEGIN
      p_conf.conf_id := 'MAIN';

      UPDATE xlib_jasperreports_conf
         SET row = p_conf
       WHERE conf_id = p_conf.conf_id;
   END;


   PROCEDURE set_default_configuration (
      p_protocol                IN xlib_jasperreports_conf.conf_protocol%TYPE default 'http',
      p_server                  IN xlib_jasperreports_conf.conf_server%TYPE default 'localhost',
      p_port                    IN xlib_jasperreports_conf.conf_port%TYPE default '80',
      p_context_path            IN xlib_jasperreports_conf.conf_context_path%TYPE default 'jri',
      p_wallet_path             IN xlib_jasperreports_conf.conf_wallet_path%TYPE default null,
      p_wallet_pwd              IN xlib_jasperreports_conf.conf_wallet_pwd%TYPE default null,
      p_http_transfer_timeout   IN xlib_jasperreports_conf.conf_http_transfer_timeout%TYPE default 60)
   IS
   BEGIN
      UPDATE xlib_jasperreports_conf
         SET conf_protocol = p_protocol,
             conf_server = p_server,
             conf_port = p_port,
             conf_context_path = p_context_path,
             conf_wallet_path = p_wallet_path,
             conf_wallet_pwd = p_wallet_pwd,
             conf_http_transfer_timeout = p_http_transfer_timeout
       WHERE conf_id = 'MAIN';
   END;
END;
/
