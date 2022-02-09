create or replace PACKAGE BODY      "XLIB_HTTP"
AS
/*=========================================================================

  Purpose  : Make http callouts

  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration

 Version Date        Author           Comment
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         19.02.2007  D. Aust          initial creation
         07.08.2008  D. Aust          - added check_get_request
                                      - display_url_raw: pass all request headers
                                          to the client
         05.08.2012  D. Aust		      suppress mime header TRANSFER-ENCODING,
                                        causes lots of problems with XMLDB listener
                                        and others choking.
 2.3.0.0 19.05.2014  D. Aust          - #294 - Fix chunked encoding problem in 
                                          xlib_http.get_report
                                      - added version information to this package
 2.3.0.0 09.05.2015  D. Aust          pass JSESSIONID from backend J2EE server to client 
                                        for image rendering in html reports                                         
 2.6.1   28.09.2020  D. Aust          #40 - APEX 20.1 security bundle (PSE 30990551) 
                                        rejects response header "Cache-Control: private"
 2.6.2   13.10.2020  D. Aust          - added function check_acl()
 2.8.0   08.02.2022  D. Aust          #79: XLIB_HTTP http_version
                                        - added optional parameter for http version

=========================================================================*/

   m_module   VARCHAR2 (50) := 'XLIB_HTTP';

   PROCEDURE display_url_raw (
      p_url                       VARCHAR2,
      p_mime_type_override   IN   VARCHAR2 DEFAULT NULL,
      p_charset              IN   VARCHAR2 DEFAULT NULL,
      p_header_name_arr      IN   vc_arr_t default g_empty_vc_arr,
      p_header_value_arr     IN   vc_arr_t default g_empty_vc_arr,
      p_http_version         IN   utl_http.http_version_1_1%type default utl_http.http_version_1_1
   )
   IS
      l_http_request       UTL_HTTP.req;
      l_http_response      UTL_HTTP.resp;
      l_blob               BLOB;
      l_raw                RAW (32767);
      l_buffer_size        NUMBER          := 32767;
      --
      l_proc               VARCHAR2 (100)  := m_module || '.DISPLAY_URL_RAW';
      --
      l_mime_type          VARCHAR2 (100);
      l_header_name        VARCHAR2 (256);
      l_header_value       VARCHAR2 (1024);
      l_jsession           VARCHAR2 (256);
      l_path               VARCHAR2 (1024);
      --
      l_header_name_arr    vc_arr_t;
      l_header_value_arr   vc_arr_t;
      --
      l_msg                varchar2(32767);
   BEGIN
      xlog (l_proc, 'show url: ' || p_url);
      --htp.flush();
      --htp.init();

      -- Initialize the BLOB.
      DBMS_LOB.createtemporary (l_blob, FALSE);

      l_http_request := UTL_HTTP.begin_request (url          => p_url,
                                                method       => 'GET',
                                                http_version => p_http_version);

      utl_http.set_header (l_http_request, 'Connection', 'Keep-Alive');

      -- pass additional headers to the target service
      for i in 1..p_header_name_arr.count loop
        xlog(l_proc, 'pass additional headers to target service: '|| p_header_name_arr(i) ||': '||p_header_value_arr(i));
        utl_http.set_header(l_http_request, p_header_name_arr(i), p_header_value_arr(i));
      end loop;

      -- get response from target service
      l_http_response := UTL_HTTP.get_response (l_http_request);

      FOR i IN 1 .. UTL_HTTP.get_header_count (l_http_response)
      LOOP
         UTL_HTTP.get_header (l_http_response,
                              i,
                              l_header_name,
                              l_header_value
                             );
         -- store header value in arr
         l_header_name_arr (i) := l_header_name;
         l_header_value_arr (i) := l_header_value;

         IF LOWER (l_header_name) = 'content-type'
         THEN
            l_mime_type := l_header_value;
            xlog(l_proc, 'content-type from server: ' || l_mime_type);
         END IF;
      END LOOP;

      -- override mime type
      IF p_mime_type_override IS NOT NULL
      THEN
         l_mime_type := p_mime_type_override;
      END IF;

      -- Copy the response into the BLOB.
      BEGIN
         LOOP
            UTL_HTTP.read_raw (l_http_response, l_raw, l_buffer_size);
            DBMS_LOB.writeappend (l_blob, UTL_RAW.LENGTH (l_raw), l_raw);
         END LOOP;
      EXCEPTION
         WHEN UTL_HTTP.end_of_body
         THEN
            UTL_HTTP.end_response (l_http_response);
      END;

      xlog(l_proc, 'set content-type: ' || l_mime_type);
      OWA_UTIL.mime_header (ccontent_type      => l_mime_type,
                            bclose_header      => FALSE,
                            ccharset           => p_charset
                           );

      FOR i IN 1 .. l_header_name_arr.COUNT
      LOOP
         IF UPPER (l_header_name_arr (i)) IN
                              ('CONTENT-LENGTH', 'CONTENT-TYPE', 'MIME-TYPE', 'TRANSFER-ENCODING',
                               'STRICT-TRANSPORT-SECURITY', 'CACHE-CONTROL', 'PRAGMA', 'EXPIRES')
         THEN
            --xlog (l_proc, 'skip header ' || l_header_name_arr (i));
            null;
         ELSE
            if upper(l_header_name_arr(i)) = 'SET-COOKIE' and l_header_value_arr (i) like 'JSESSIONID%' then 
              xlog(l_proc , 'JSESSION_ID found !!!:'||l_header_value_arr (i));
              --extract path
              l_jsession := regexp_substr(l_header_value_arr (i), 'JSESSIONID=(.*);[ ]*Path',1, 1,'i',1);
              l_path := regexp_substr(l_header_value_arr (i), ';[ ]*Path=(.*)',1, 1,'i',1);

              xlog(l_proc, 'xx:full:'||l_header_value_arr (i)|| '; xx:session:'||l_jsession || '; xx:path:'||l_path);             
            else
              l_header_value := l_header_value_arr (i);
            end if;
            xlog (l_proc,
                  'set header:'
               || l_header_name_arr (i)
               || ': '
               || l_header_value
              );
            HTP.p (l_header_name_arr (i) || ': ' || l_header_value);
         END IF;
      END LOOP;

      -- JSESSION Cookies ausgeben
      -- if using tunnel, then the cookie is JRI_JSESSIONID
      -- if not using tunnel, then cookie is JSESSIONID directly
      --
      if xlib_jasperreports.get_use_images_no_tunnel=false then 
          l_msg := 'Set-Cookie: ' || xlib_jasperreports.m_jri_cookie_name_c || '=' || l_jsession;
          xlog (l_proc, 'set header:' || l_msg );
          HTP.p (l_msg);
          l_msg := 'Set-Cookie: ' || xlib_jasperreports.m_jri_path_cookie_name_c || '=' || l_path;
          xlog (l_proc, 'set header:' || l_msg );
          HTP.p (l_msg);
      else
          l_msg := 'Set-Cookie: JSESSIONID=' || l_jsession;
          if xlib_jasperreports.get_cookie_path_no_tunnel is not null then 
            l_msg := l_msg || '; Path=' || xlib_jasperreports.get_cookie_path_no_tunnel;
          end if;
          xlog (l_proc, 'set header:' || l_msg );
          HTP.p (l_msg);
      end if;

      -- set content length
      HTP.p ('Content-length: ' || DBMS_LOB.getlength (l_blob));
      OWA_UTIL.http_header_close;
      WPG_DOCLOAD.download_file (l_blob);
      -- Relase the resources associated with the temporary LOB.
      DBMS_LOB.freetemporary (l_blob);
   EXCEPTION
      WHEN UTL_HTTP.end_of_body
      THEN
         UTL_HTTP.end_response (l_http_response);
         DBMS_LOB.freetemporary (l_blob);
         RAISE;
      WHEN OTHERS
      THEN
         xlog (l_proc, 'Error: ' || SQLERRM, 'ERROR');
         RAISE;
   END;

   PROCEDURE retrieve_blob_from_url (
      p_url             IN   VARCHAR2,
      o_blob            OUT  BLOB,
      o_mime_type       OUT  VARCHAR2,
      p_http_version    IN   utl_http.http_version_1_1%type default utl_http.http_version_1_1
   )
   IS
      l_http_request    UTL_HTTP.req;
      l_http_response   UTL_HTTP.resp;
      l_raw             RAW (32767);
      --
      l_proc            VARCHAR2 (100)
                                     := m_module || '.RETRIEVE_BLOB_FROM_URL';
      --
      l_header_name     VARCHAR2 (256);
      l_header_value    VARCHAR2 (1024);
   BEGIN
      -- Initialize the BLOB.
      dbms_lob.createtemporary (o_blob, false);
      l_http_request := utl_http.begin_request (url          => p_url,
                                                method       => 'GET',
                                                http_version => p_http_version);

      l_http_response := UTL_HTTP.get_response (l_http_request);

      FOR i IN 1 .. UTL_HTTP.get_header_count (l_http_response)
      LOOP
         UTL_HTTP.get_header (l_http_response,
                              i,
                              l_header_name,
                              l_header_value
                             );

         IF LOWER (l_header_name) = 'content-type'
         THEN
            o_mime_type := l_header_value;
         END IF;
      END LOOP;

      -- Copy the response into the BLOB.
      BEGIN
         LOOP
            UTL_HTTP.read_raw (l_http_response, l_raw, 32767);
            DBMS_LOB.writeappend (o_blob, UTL_RAW.LENGTH (l_raw), l_raw);
         END LOOP;
      EXCEPTION
         WHEN UTL_HTTP.end_of_body
         THEN
            UTL_HTTP.end_response (l_http_response);
      END;
   -- Relase the resources associated with the temporary LOB.
   --DBMS_LOB.freetemporary (l_blob);
   EXCEPTION
      WHEN OTHERS
      THEN
         UTL_HTTP.end_response (l_http_response);
         DBMS_LOB.freetemporary (o_blob);
         xlog (l_proc, 'Error: ' || SQLERRM, 'ERROR');
         RAISE;
   END;

   FUNCTION escape_form_data (s VARCHAR2)
      RETURN VARCHAR2
   IS
      l_s   VARCHAR2 (500 CHAR);

      FUNCTION r (s VARCHAR2, c VARCHAR2)
         RETURN VARCHAR2
      IS
      BEGIN
         RETURN REPLACE (s, c, '%' || TRIM (TO_CHAR (ASCII (c), 'XX')));
      END;
   BEGIN
      l_s := s;
      l_s := REPLACE (l_s, ' ', '+');
      l_s := r (l_s, chr(37));  -- %
      l_s := r (l_s, chr(37));  -- /
      l_s := r (l_s, chr(63));  -- ?
      l_s := r (l_s, chr(38));  -- &
      l_s := r (l_s, chr(228));  -- ‰
      l_s := r (l_s, chr(196));  -- ƒ
      l_s := r (l_s, chr(246));  -- ˆ
      l_s := r (l_s, chr(214));  -- ÷
      l_s := r (l_s, chr(252));  -- ¸
      l_s := r (l_s, chr(220));  -- ‹
      l_s := r (l_s, chr(223));  -- ﬂ
      RETURN l_s;
   END;

   FUNCTION check_get_request (p_url VARCHAR2)
      RETURN CHAR
   IS
      l_clob   CLOB;
   BEGIN
      IF p_url IS NULL
      THEN
         RETURN c_fail;
      END IF;

      SELECT HTTPURITYPE (p_url).getclob ()
        INTO l_clob
        FROM DUAL;

      /*SELECT c_success
        INTO l_ret
        FROM DUAL
       WHERE EXISTS (SELECT HTTPURITYPE (p_url).getclob ()
                       FROM DUAL);
                       */
      RETURN c_success;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN c_fail;
   END;

   FUNCTION check_acl (p_url VARCHAR2)
      RETURN CHAR
   IS
      l_clob   CLOB;
   BEGIN
      IF p_url IS NULL
      THEN
         RETURN c_fail;
      END IF;

      SELECT HTTPURITYPE (p_url).getclob ()
        INTO l_clob
        FROM DUAL;

      /*SELECT c_success
        INTO l_ret
        FROM DUAL
       WHERE EXISTS (SELECT HTTPURITYPE (p_url).getclob ()
                       FROM DUAL);
                       */
      RETURN c_success;
   EXCEPTION
      WHEN OTHERS
      THEN
         -- acl problem
         if sqlcode=24247 then
           RETURN c_fail;
         else
            -- no acl problem
            return c_success;
         end if;
   END;
END;
/
