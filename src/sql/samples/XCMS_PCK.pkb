CREATE OR REPLACE PACKAGE BODY ISD_VK.xcms_pck
AS
   m_module             VARCHAR2 (50)   := 'XCMS_PCK';
   m_http_error_texts   OWA_UTIL.vc_arr;

   PROCEDURE download_file (
      p_fil_id           IN   NUMBER,
      p_display_inline   IN   CHAR DEFAULT '1'
   )
   AS
      v_mime        VARCHAR2 (255);
      v_length      NUMBER;
      v_file_name   VARCHAR2 (2000);
      lob_loc       BLOB;
   BEGIN
      SELECT fil_mime_type, fil_blob_content, fil_name,
             DBMS_LOB.getlength (fil_blob_content)
        INTO v_mime, lob_loc, v_file_name,
             v_length
        FROM xcms_files
       WHERE fil_id = p_fil_id;

      --
      -- set up HTTP header
      --
            -- use an NVL around the mime type and
            -- if it is a null set it to application/octect
            -- application/octect may launch a download window from windows
      OWA_UTIL.mime_header (NVL (v_mime, 'application/octet'), FALSE);
      -- set the size so the browser knows how much to download
      HTP.p ('Content-length: ' || v_length);

      -- the filename will be used by the browser if the users does a save as
      IF p_display_inline = '0'
      THEN
         HTP.p (   'Content-Disposition: attachment; filename="'
                || v_file_name
                || '"'
               );
      END IF;

      -- close the headers
      OWA_UTIL.http_header_close;
      -- download the BLOB
      WPG_DOCLOAD.download_file (lob_loc);
   END;

   FUNCTION add_file_from_url (
      p_url                  IN   VARCHAR2,
      p_mime_type_override   IN   VARCHAR2 DEFAULT NULL
   )
      RETURN NUMBER
   IS
      l_fil_id          NUMBER;
      l_http_request    UTL_HTTP.req;
      l_http_response   UTL_HTTP.resp;
      l_raw             RAW (32767);
      l_blob            BLOB;
      --
      l_proc            VARCHAR2 (100)  := m_module || '.ADD_FILE_FROM_URL';
      --
      l_mime_type       VARCHAR2 (100);
      l_mime_type_src   VARCHAR2 (100);
      l_header_name     VARCHAR2 (256);
      l_header_value    VARCHAR2 (1024);
   BEGIN
      -- Initialize the BLOB.
      DBMS_LOB.createtemporary (l_blob, FALSE);
      l_http_request     := UTL_HTTP.begin_request (p_url);
      l_http_response    := UTL_HTTP.get_response (l_http_request);

      FOR i IN 1 .. UTL_HTTP.get_header_count (l_http_response)
      LOOP
         UTL_HTTP.get_header (l_http_response,
                              i,
                              l_header_name,
                              l_header_value
                             );

         IF LOWER (l_header_name) = 'content-type'
         THEN
            l_mime_type_src    := l_header_value;
            l_mime_type        := l_mime_type_src;
         END IF;
      END LOOP;

      -- override mime type
      IF p_mime_type_override IS NOT NULL
      THEN
         l_mime_type    := p_mime_type_override;
      END IF;

      -- Copy the response into the BLOB.
      BEGIN
         LOOP
            UTL_HTTP.read_raw (l_http_response, l_raw, 32767);

            -- if text/html was returned, perhaps we have encountered a html
            -- error page
            IF l_mime_type_src = 'text/html'
            THEN
               FOR i IN 1 .. m_http_error_texts.COUNT
               LOOP
                  DBMS_OUTPUT.put_line (   'check_error:'
                                        || m_http_error_texts (i)
                                       );

                  IF INSTR (UTL_RAW.cast_to_varchar2 (l_raw),
                            m_http_error_texts (i)
                           ) > 0
                  THEN
                     raise_application_error (-20009, 'http error');
                  END IF;
               END LOOP;
            END IF;

            DBMS_LOB.writeappend (l_blob, UTL_RAW.LENGTH (l_raw), l_raw);
         END LOOP;
      EXCEPTION
         WHEN UTL_HTTP.end_of_body
         THEN
            UTL_HTTP.end_response (l_http_response);
      END;

      -- Insert the data into the table.
      INSERT INTO xcms_files
                  (fil_id, fil_blob_content, fil_mime_type
                  )
           VALUES (xcms_files_seq.NEXTVAL, l_blob, l_mime_type
                  )
        RETURNING fil_id
             INTO l_fil_id;

      -- Relase the resources associated with the temporary LOB.
      DBMS_LOB.freetemporary (l_blob);
      RETURN l_fil_id;
   EXCEPTION
      WHEN OTHERS
      THEN
         UTL_HTTP.end_response (l_http_response);
         DBMS_LOB.freetemporary (l_blob);
         xlog (l_proc, 'Error: ' || SQLERRM, 'ERROR');
         RAISE;
   END;
BEGIN
   m_http_error_texts (m_http_error_texts.COUNT + 1)    :=
                                                        'org.apache.catalina';
   m_http_error_texts (m_http_error_texts.COUNT + 1)    :=
                                                          'org.apache.tomcat';
END; 
/

