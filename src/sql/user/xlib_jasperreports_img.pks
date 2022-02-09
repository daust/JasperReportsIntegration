create or replace PACKAGE XLIB_JASPERREPORTS_IMG AS 
/*

 2.8.0   08.02.2022  D. Aust          #79: XLIB_HTTP http_version
                                        - added optional parameter for http version
*/
----------------------------------------------------------------------------
-- get_image: retrieves a report image from the server
----------------------------------------------------------------------------
   PROCEDURE get_image (
      p_url in varchar2, 
      p_image IN VARCHAR2,
      p_http_version        IN   utl_http.http_version_1_1%type default utl_http.http_version_1_1);

   procedure test;


END XLIB_JASPERREPORTS_IMG;
/
