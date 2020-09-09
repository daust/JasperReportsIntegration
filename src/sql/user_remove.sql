/*=========================================================================
  $Id: user_remove.sql 57 2013-05-13 07:09:51Z dietmar.aust $

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

spool user_remove.log

@@xlib_jasperreports/_user_remove.sql
@@xlib_http/_user_remove.sql
@@xlib_base/_user_remove.sql

prompt *** If there are remaining objects in the recyclebin, you can purge it 
prompt *** using the command:
prompt *** purge recyclebin;

spool off


