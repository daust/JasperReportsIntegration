create or replace PACKAGE BODY "XLIB_JASPERREPORTS"
AS
/*=========================================================================
  $Id: xlib_jasperreports.pkb 134 2018-09-30 07:00:44Z dietmar.aust $

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
                                 
=========================================================================*/


   m_module       VARCHAR2 (50)   := 'XLIB_JASPERREPORTS';
   m_report_url   varchar2 (32767) := null;
   m_images_uri   varchar2 (32767) := null;

    -- convert boolean to 'true' or 'false'
    function bool2string(b in boolean) return varchar2
    is
    begin
      if b then 
        return 'true';
      else
        return 'false';
      end if;
    end;

  procedure dump_all_cookies
  is
    l_proc   VARCHAR2 (100)   := m_module || '.dump_all_cookies';
    l_name_arr owa_cookie.vc_arr;
    l_vals_arr owa_cookie.vc_arr;
    l_vals_ret INTEGER;

  begin
    xlog(l_proc, 'start');
    owa_cookie.get_all(
      names          => l_name_arr,
      vals           => l_vals_arr,
      num_vals       => l_vals_ret);
      
    xlog(l_proc, '#num of cookies: '|| l_vals_ret);
    for i in 1..l_name_arr.count loop
      xlog(l_proc, i||':'||l_name_arr(i)||'='||l_vals_arr(i));
    end loop;
    
    xlog(l_proc, 'end');
  end;

----------------------------------------------------------------------------
-- sets the url for the report server for all requests in the
-- current session
----------------------------------------------------------------------------
   PROCEDURE set_report_url (p_report_url IN VARCHAR2)
   IS
   BEGIN
      xlog('set_report_url:',p_report_url);
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
   begin
      m_images_uri := p_images_uri;
   END;

   FUNCTION get_images_uri
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN m_images_uri;
   END;
   
   function compute_images_uri_tunnel return varchar2
   is
     l_uri varchar2(32767 char);
   begin
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
     l_uri := replace(l_uri, '#APP_ID#', v('APP_ID'));
     l_uri := replace(l_uri, '#APP_SESSION#', v('APP_SESSION'));
     
     xlog('compute tunnel', l_uri);
     
     return l_uri;
   end;

----------------------------------------------------------------------------
-- displays an image for html reports
----------------------------------------------------------------------------
   procedure show_image(p_image_name IN   VARCHAR2)
   is
      l_proc   VARCHAR2 (100)   := m_module || '.show_image';
      l_url    varchar2 (32767);
      
      l_header_name_arr  xlib_http.vc_arr_t;
      l_header_value_arr xlib_http.vc_arr_t;
      
      procedure get_headers_to_pass2j2ee(
        p_header_name_arr      OUT   xlib_http.vc_arr_t,
        p_header_value_arr     OUT   xlib_http.vc_arr_t)
      is  
        l_proc   VARCHAR2 (100)   := m_module || '.get_headers_to_pass2j2ee';
        jsession_cookie owa_cookie.cookie;
        jsession_path_cookie owa_cookie.cookie;
      begin
        
        
        jsession_cookie := owa_cookie.get( name => m_jri_cookie_name_c);
        jsession_path_cookie := owa_cookie.get( name => m_jri_path_cookie_name_c );  
        
        xlog(l_proc, 'show jsession_id and path: ');
        xlog(l_proc, jsession_cookie.vals(1));
        xlog(l_proc, jsession_path_cookie.vals(1));
        
        
        p_header_name_arr(p_header_name_arr.count+1) := 'Cookie';
        p_header_value_arr(p_header_value_arr.count+1) := 'JSESSIONID=' ||
          jsession_cookie.vals(1) || ';Path=' || jsession_path_cookie.vals(1);
        
        --xlog(l_proc, 'end');
      exception
        when others then 
          xlog(l_proc, dbms_utility.format_error_backtrace, 'ERROR');
      end;
      
   BEGIN
      xlog(l_proc, 'start: ### SHOW IMAGE: '||p_image_name);
      dump_all_cookies;
   
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
      l_url := l_url || '&JSESSIONID='||owa_cookie.get( name => m_jri_cookie_name_c).vals(1);
      
      -------------------------------------------------------
      -- determine cookies for calling the j2ee server
      -- JSESSIONID needs to be passed, the path needs to 
      -- be modified for the j2ee server context
      -------------------------------------------------------
      get_headers_to_pass2j2ee(
        p_header_name_arr      => l_header_name_arr,
        p_header_value_arr     => l_header_value_arr);

      -------------------------------------------------------
      -- call J2EE server
      -------------------------------------------------------
      xlib_http.display_url_raw (p_url => l_url,
                                 p_header_name_arr  => l_header_name_arr, 
                                 p_header_value_arr => l_header_value_arr);
      
   END;


----------------------------------------------------------------------------
-- make a callout with utl_http to the j2ee container running the
-- JasperReportsIntegration webapp
-- => return the results
----------------------------------------------------------------------------
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
   )
   is
      l_proc   VARCHAR2 (100)   := m_module || '.SHOW_REPORT';
      l_url    varchar2 (32767);
            
   BEGIN
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
      l_url := l_url || '&_outFilename=' || p_out_filename;
      l_url := l_url || '&_repLocale=' || p_rep_locale;
      l_url := l_url || '&_repEncoding=' || p_rep_encoding;
      l_url := l_url || '&_repTimeZone=' || APEX_UTIL.URL_ENCODE(p_rep_time_zone);

      -- per default use the tunnel through the database
      if m_images_uri is null or m_images_uri = c_images_uri_tunnel then
        -- tunnel through database
        l_url := l_url || '&_imagesURI=' || APEX_UTIL.URL_ENCODE(compute_images_uri_tunnel);
      else
        -- use parameter, mostly for direct access to servlet
        l_url := l_url || '&_imagesURI=' || APEX_UTIL.URL_ENCODE(m_images_uri);
      end if;
      
      -- direct printing
      l_url := l_url || '&_printIsEnabled=' || bool2string(p_print_is_enabled);
      l_url := l_url || '&_printPrinterName=' || p_print_printer_name;
      l_url := l_url || '&_printPrinterTray=' || p_print_media;
      l_url := l_url || '&_printCopies=' || p_print_copies;
      l_url := l_url || '&_printDuplex=' || bool2string(p_print_duplex);
      l_url := l_url || '&_printCollate=' || bool2string(p_print_collate);
      l_url := l_url || '&_printJobName=' || p_print_job_name;
      
      -- save file on server
      l_url := l_url || '&_saveIsEnabled=' || bool2string(p_save_is_enabled);
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
   )
   IS
      l_proc        VARCHAR2 (100)   := m_module || '.GET_REPORT';
      l_url         VARCHAR2 (32767);
   BEGIN
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
      l_url := l_url || '&_repTimeZone=' || APEX_UTIL.URL_ENCODE(p_rep_time_zone);

      -- per default use the tunnel through the database
      if m_images_uri is null or m_images_uri = c_images_uri_tunnel then
        -- tunnel through database
        l_url := l_url || '&_imagesURI=' || APEX_UTIL.URL_ENCODE(compute_images_uri_tunnel);
      else
        -- use parameter, mostly for direct access to servlet
        l_url := l_url || '&_imagesURI=' || APEX_UTIL.URL_ENCODE(m_images_uri);
      end if;
      
      -- direct printing
      l_url := l_url || '&_printIsEnabled=' || bool2string(p_print_is_enabled);
      l_url := l_url || '&_printPrinterName=' || p_print_printer_name;
      l_url := l_url || '&_printPrinterTray=' || p_print_media;
      l_url := l_url || '&_printCopies=' || p_print_copies;
      l_url := l_url || '&_printDuplex=' || bool2string(p_print_duplex);
      l_url := l_url || '&_printCollate=' || bool2string(p_print_collate);
      l_url := l_url || '&_printJobName=' || p_print_job_name;
      
      -- save file on server
      l_url := l_url || '&_saveIsEnabled=' || bool2string(p_save_is_enabled);
      l_url := l_url || '&_saveFileName=' || p_save_filename;
      
      -- additional report parameter passed?
      IF (p_additional_params IS NOT NULL)
      THEN
         l_url := l_url || '&' || p_additional_params;
      END IF;

      -------------------------------------------------------
      -- call Tomcat
      -------------------------------------------------------
      xlib_http.retrieve_blob_from_url (p_url            => l_url,
                                        o_blob           => p_out_blob,
                                        o_mime_type      => p_out_mime_type
                                       );
   END;
      
END;
/
