create or replace PACKAGE XLIB_JASPERREPORTS_IMG AS 
/*
$Id: xlib_jasperreports_img.pks 71 2017-10-15 16:25:51Z dietmar.aust $
*/
----------------------------------------------------------------------------
-- get_image: retrieves a report image from the server
----------------------------------------------------------------------------
   PROCEDURE get_image (p_url in varchar2, p_image IN VARCHAR2);
   
   procedure test;
   

END XLIB_JASPERREPORTS_IMG;
/
