/*=========================================================================
  $Id: xlib_components.sql 57 2013-05-13 07:09:51Z dietmar.aust $

  Purpose  : 
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14
             
  $LastChangedDate: 2013-05-13 09:09:51 +0200 (Mon, 13 May 2013) $
  $LastChangedBy: dietmar.aust $ 
  
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation

=========================================================================*/

CREATE TABLE "XLIB_COMPONENTS"
   (	"COMP_ID" NUMBER,
	"COMP_NAME" VARCHAR2(100 CHAR),
	"COMP_VERSION" VARCHAR2(50 CHAR),
	"COMP_VERSION_LABEL" VARCHAR2(50 CHAR),
	"COMP_DEPENDS_ON" VARCHAR2(4000 CHAR)
   ) ;
   
  ALTER TABLE "XLIB_COMPONENTS" ADD CONSTRAINT "XLIB_COMPONENTS_PK" PRIMARY KEY ("COMP_ID");
  
  ALTER TABLE "XLIB_COMPONENTS" ADD CONSTRAINT "XLIB_COMPONENTS_U01" UNIQUE ("COMP_NAME");
  
  


