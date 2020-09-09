/*=========================================================================
  $Id: _sys_cre_user.sql 57 2013-05-13 07:09:51Z dietmar.aust $

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

define USERNAME=&&1
define PWD=&&2
define DEFAULT_TABLESPACE=&&3
define TEMP_TABLESPACE=&&4

CREATE USER &&USERNAME IDENTIFIED BY &&PWD DEFAULT TABLESPACE &&DEFAULT_TABLESPACE TEMPORARY TABLESPACE &&TEMP_TABLESPACE;

