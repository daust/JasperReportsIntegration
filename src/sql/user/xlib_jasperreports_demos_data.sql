/*=========================================================================
  Purpose  : 
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration
             
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  02.10.2020  D. Aust         Initial creation
  08.02.2022  D. Aust         Don't delete before inserting

=========================================================================*/
--delete from xlib_jasperreports_demos;

REM INSERTING into JRI_TEST.XLIB_JASPERREPORTS_DEMOS
SET DEFINE OFF;
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE,DEMO_OUT_FILENAME) values ('TEST_IMAGES_2','Test with images (html)','demo/test_images','Test report to include images from the filesystem.','html2','default','en_US',null,null,null,null,null,null,null,null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE,DEMO_OUT_FILENAME) values ('long_running','Long Running Report','demo/long-running-report','When setting the timeout to 10s it should abort the report with a timeout error message. If you choose a high value > 60 (which is the default), it should work.','pdf','default',null,null,null,null,null,null,null,null,null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE,DEMO_OUT_FILENAME) values ('qr_test','QR test','demo/qr',null,'pdf','default',null,null,null,null,null,null,null,null,null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE,DEMO_OUT_FILENAME) values ('TEST','Test (PDF / English)','test','Simple test report, passing one parameter and using the American locale, changes the NLS settings for numbers and currencies.','pdf','default','en_US',null,'parameter1','my parameter value','parameter2','p2','parameter3','p3',null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE,DEMO_OUT_FILENAME) values ('TEST_2','Test (PDF / German)','test','Simple test report, passing one parameter and using the German locale, changes the NLS settings for numbers and currencies.','pdf','default','de_DE',null,'parameter1','Ä Ö Ü - multiple Parameter','parameter2','ß','parameter3','ü',null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE,DEMO_OUT_FILENAME) values ('TEST_1','Test (DOCx / English)','test','Simple test report, passing one parameter and using the American locale, changes the NLS settings for numbers and currencies.','docx','default','en_US',null,'parameter1','my parameter value','parameter2','p2','parameter3','p3',null,'test.docx');
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE,DEMO_OUT_FILENAME) values ('TEST_3','Test (PDF / Italy)','test','Simple test report, passing one parameter and using the Italian locale, changes the NLS settings for numbers and currencies.','pdf','default','it_IT',null,null,null,null,null,null,null,null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE,DEMO_OUT_FILENAME) values ('TEST_IMAGES','Test with images','demo/test_images','Test report to include images from the filesystem.','pdf','default','en_US',null,null,null,null,null,null,null,null,null);


commit;
