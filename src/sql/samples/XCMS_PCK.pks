CREATE OR REPLACE PACKAGE ISD_VK.xcms_pck
AS
/******************************************************************************
   NAME:       XCMS_PCK
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   0.1.0      28.02.2007  D. Aust          initiale Erstellung
******************************************************************************/
   PROCEDURE download_file (
      p_fil_id           IN   NUMBER,
      p_display_inline   IN   CHAR DEFAULT '1'
   );

   FUNCTION add_file_from_url (
      p_url                  IN   VARCHAR2,
      p_mime_type_override   IN   VARCHAR2 DEFAULT NULL
   )
      RETURN NUMBER;
END; 
/

