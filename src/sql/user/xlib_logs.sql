/*=========================================================================

  Purpose  : 
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration

  
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation

=========================================================================*/

CREATE TABLE "XLIB_LOGS"
   (	"LOG_ID" NUMBER,
	"LOG_MODULE" VARCHAR2(100 CHAR),
	"LOG_MSG" VARCHAR2(4000 CHAR),
	"LOG_TYPE" VARCHAR2(20 CHAR) DEFAULT 'DEBUG',
	"LOG_LEVEL" NUMBER DEFAULT 15,
	"LOG_CREATED_ON" DATE,
	"LOG_CREATED_BY" VARCHAR2(30 CHAR)
   ) ;
   
  ALTER TABLE "XLIB_LOGS" ADD CONSTRAINT "XLIB_LOGS_PK" PRIMARY KEY ("LOG_ID");

  CREATE INDEX "XLIB_LOGS_IDX1" ON "XLIB_LOGS" ("LOG_TYPE");

  CREATE INDEX "XLIB_LOGS_IDX2" ON "XLIB_LOGS" ("LOG_MODULE");

CREATE OR REPLACE TRIGGER XLIB_LOGS_bi_trg
   BEFORE INSERT
   ON XLIB_LOGS
   REFERENCING NEW AS NEW OLD AS OLD
   FOR EACH ROW
BEGIN
  IF :NEW.log_id IS NULL
  THEN
     SELECT XLIB_SEQ.NEXTVAL
       INTO :NEW.log_id
       FROM DUAL;
  END IF;
END;
/
SHOW ERRORS;
  
-- 13.05.2013: D. Aust
ALTER TABLE XLIB_LOGS  
MODIFY (LOG_CREATED_BY VARCHAR2(100 CHAR) );



