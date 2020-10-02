/*=========================================================================
  Purpose  : 
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration
             
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  02.10.2020  D. Aust         Initial creation

=========================================================================*/
delete from xlib_jasperreports_demos;

REM INSERTING into JRI_TEST.XLIB_JASPERREPORTS_DEMOS
SET DEFINE OFF;
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE,DEMO_OUT_FILENAME) values ('TEST','Test (PDF / English)','test','Simple test report, passing one parameter and using the American locale, changes the NLS settings for numbers and currencies.','pdf','default','en_US',null,'parameter1','my parameter value','parameter2','p2','parameter3','p3',null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE,DEMO_OUT_FILENAME) values ('TEST_2','Test (PDF / German)','test','Simple test report, passing one parameter and using the German locale, changes the NLS settings for numbers and currencies.','pdf','default','de_DE',null,'parameter1','Parameter mit ü','parameter2','Parameter mit ä','parameter3','Parameter mit ß',null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE,DEMO_OUT_FILENAME) values ('TEST_1','Test (DOCx / English)','test','Simple test report, passing one parameter and using the American locale, changes the NLS settings for numbers and currencies.','docx','default','en_US',null,'parameter1','my parameter value','parameter2','p2','parameter3','p3',null,'test.docx');
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE,DEMO_OUT_FILENAME) values ('TEST_3','Test (PDF / Italy)','test','Simple test report, passing one parameter and using the Italian locale, changes the NLS settings for numbers and currencies.','pdf','default','it_IT',null,'parameter1','Parameter mit ü','parameter2','Parameter mit ä','parameter3','Parameter mit ß',null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE,DEMO_OUT_FILENAME) values ('TEST_IMAGES','Test with images','demo/test_images','Test report to include images from the filesystem.','pdf','default','en_US',null,'parameter1','my parameter value','parameter2','p2','parameter3','p3',null,null);


commit;
