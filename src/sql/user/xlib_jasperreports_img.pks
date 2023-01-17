create or replace PACKAGE XLIB_JASPERREPORTS_IMG AS 
/*

 2.8.0   08.02.2022  D. Aust          #79: XLIB_HTTP http_version
                                        - added optional parameter for http version
 2.10.1  16.01.2023  D. Aust          #123: Backport constant for Oracle 11
*/
----------------------------------------------------------------------------
-- get_image: retrieves a report image from the server
----------------------------------------------------------------------------
   PROCEDURE get_image (
      p_url in varchar2, 
      p_image IN VARCHAR2,
      p_http_version        IN   xlib_http.http_version_1_1%type default xlib_http.http_version_1_1);

   procedure test;


END XLIB_JASPERREPORTS_IMG;
/
