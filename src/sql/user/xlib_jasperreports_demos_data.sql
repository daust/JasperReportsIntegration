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


-- select /*insert*/ * from XLIB_JASPERREPORTS_DEMOS where demo_code='encrypt-pdf'

REM INSERTING into XLIB_JASPERREPORTS_DEMOS
SET DEFINE OFF;
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_OUT_FILENAME,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE) values ('TEST_IMAGES_2','Test with images (html)','demo/test_images','Test report to include images from the filesystem.','html2','default','en_US',null,null,null,null,null,null,null,null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_OUT_FILENAME,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE) values ('long_running','Long Running Report','demo/long-running-report','When setting the timeout to 10s it should abort the report with a timeout error message. If you choose a high value > 60 (which is the default), it should work.','pdf','default',null,null,null,null,null,null,null,null,null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_OUT_FILENAME,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE) values ('qr_test','QR test','demo/qr',null,'pdf','default',null,null,null,null,null,null,null,null,null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_OUT_FILENAME,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE) values ('TEST','Test (PDF / English)','test','Simple test report, passing one parameter and using the American locale, changes the NLS settings for numbers and currencies.','pdf','default','en_US',null,null,'parameter1','my parameter value','parameter2','p2','parameter3','p3',null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_OUT_FILENAME,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE) values ('TEST_2','Test (PDF / German)','test','Simple test report, passing one parameter and using the German locale, changes the NLS settings for numbers and currencies.','pdf','default','de_DE',null,null,'parameter1','Ä Ö Ü - multiple Parameter','parameter2','ß','parameter3','ü',null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_OUT_FILENAME,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE) values ('TEST_1','Test (DOCx / English)','test','Simple test report, passing one parameter and using the American locale, changes the NLS settings for numbers and currencies.','docx','default','en_US',null,'test.docx','parameter1','my parameter value','parameter2','p2','parameter3','p3',null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_OUT_FILENAME,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE) values ('TEST_3','Test (PDF / Italy)','test','Simple test report, passing one parameter and using the Italian locale, changes the NLS settings for numbers and currencies.','pdf','default','it_IT',null,null,null,null,null,null,null,null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_OUT_FILENAME,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE) values ('TEST_IMAGES','Test with images','demo/test_images','Test report to include images from the filesystem.','pdf','default','en_US',null,null,null,null,null,null,null,null,null);

-- issue-WITH-query
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_OUT_FILENAME,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE) values ('issue-with-query','Issue-With Query','demo/issue-with-query','Support for WITH clause queries','pdf','default',null,null,null,null,null,null,null,null,null,null);

-- encrypt-pdf
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_OUT_FILENAME,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE) values ('encrypt-pdf','Encrypt PDF','demo/encrypt-pdf','Encrypt and password-protect a generated PDF file. In the sample, both passwords are "123456" (without the quotes). 
See for details:
- http://jasperreports.sourceforge.net/sample.reference/pdfencrypt/index.html
- https://community.jaspersoft.com/wiki/how-configure-pdf-encryption-jasperreports-server-561','pdf','default',null,null,null,null,null,null,null,null,null,null);

-- Charts exporting images
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_OUT_FILENAME,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE) values ('TEST_CHART','Test with Chart','demo/charts','Test report to include charts as images','pdf','default','en_US',null,null,null,null,null,null,null,null,null);
Insert into XLIB_JASPERREPORTS_DEMOS (DEMO_CODE,DEMO_TITLE,DEMO_REPORT_NAME,DEMO_DESCRIPTION,DEMO_REPORT_FORMAT,DEMO_DATA_SOURCE,DEMO_REPORT_LOCALE,DEMO_REPORT_ENCODING,DEMO_OUT_FILENAME,DEMO_PARAM1_LABEL,DEMO_PARAM1_VALUE,DEMO_PARAM2_LABEL,DEMO_PARAM2_VALUE,DEMO_PARAM3_LABEL,DEMO_PARAM3_VALUE,DEMO_REPORT_TIME_ZONE) values ('TEST_CHART_HTML','Test with Chart','demo/charts','Test report to include charts as images','html2','default','en_US',null,null,null,null,null,null,null,null,null);


commit;
