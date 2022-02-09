create or replace package body xlib_jasperreports_img as
/*

 2.8.0   08.02.2022  D. Aust          #79: XLIB_HTTP http_version
                                        - added optional parameter for http version
*/
   m_module       constant varchar2 (100) := $$plsql_unit;


----------------------------------------------------------------------------
-- get_image: retrieves a report image from the server
----------------------------------------------------------------------------
   procedure get_image (
      p_url in varchar2, 
      p_image in varchar2,
      p_http_version        IN   utl_http.http_version_1_1%type default utl_http.http_version_1_1)
   is
      l_url         varchar2 (32767); 
      l_proc   VARCHAR2 (100)   := m_module || '.GET_IMAGE';
   begin

      -------------------------------------------------------
      -- construct URL
      -------------------------------------------------------
      l_url := p_url;
      -- use image servlet
      l_url := l_url || '_image?image=' || p_image;
      -- use images directory /report_tmp/
      --l_url := l_url || '_tmp/' || p_image;

      -------------------------------------------------------
      -- call J2EE server
      -------------------------------------------------------
      xlog(l_proc, l_url);
      xlib_http.display_url_raw (p_url => l_url, p_http_version => p_http_version);

   end;

procedure test
is
begin
  htp.p('test');
end;


END XLIB_JASPERREPORTS_IMG;
/
