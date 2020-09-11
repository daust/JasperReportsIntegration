create or replace package body xlib_jasperreports_img as
/*
$Id: xlib_jasperreports_img.pkb 71 2017-10-15 16:25:51Z dietmar.aust $
*/
   m_module       VARCHAR2 (50)   := 'XLIB_JASPERREPORTS_IMG';
   

----------------------------------------------------------------------------
-- get_image: retrieves a report image from the server
----------------------------------------------------------------------------
   procedure get_image (p_url in varchar2, p_image in varchar2)
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
      xlib_http.display_url_raw (p_url => l_url);

   end;

procedure test
is
begin
  htp.p('test');
end;


END XLIB_JASPERREPORTS_IMG;
/
