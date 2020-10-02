/*=========================================================================
  Purpose  : 
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration
             
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  02.10.2020  D. Aust         Initial creation

=========================================================================*/

--drop table xlib_jasperreports_demos purge;

CREATE TABLE xlib_jasperreports_demos
   (	DEMO_CODE VARCHAR2(20 CHAR),
      DEMO_TITLE VARCHAR2(100 CHAR),
      DEMO_REPORT_NAME VARCHAR2(400 CHAR),
      DEMO_DESCRIPTION VARCHAR2(4000 CHAR),
      DEMO_REPORT_FORMAT VARCHAR2(50 CHAR),
      DEMO_DATA_SOURCE VARCHAR2(100 CHAR),
      DEMO_REPORT_LOCALE VARCHAR2(50 CHAR),
      DEMO_REPORT_ENCODING VARCHAR2(50 CHAR),
      DEMO_OUT_FILENAME varchar2(500 char),
      DEMO_PARAM1_LABEL VARCHAR2(50 CHAR),
      DEMO_PARAM1_VALUE VARCHAR2(2000 CHAR),
      DEMO_PARAM2_LABEL VARCHAR2(50 CHAR),
      DEMO_PARAM2_VALUE VARCHAR2(2000 CHAR),
      DEMO_PARAM3_LABEL VARCHAR2(50 CHAR),
      DEMO_PARAM3_VALUE VARCHAR2(2000 CHAR),
      DEMO_REPORT_TIME_ZONE VARCHAR2(50 CHAR)
      );

ALTER TABLE xlib_jasperreports_demos ADD CONSTRAINT XLIB_DEMO_PK PRIMARY KEY (DEMO_CODE);

