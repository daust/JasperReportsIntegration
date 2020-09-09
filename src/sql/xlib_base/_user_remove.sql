/*=========================================================================
  $Id: _user_remove.sql 56 2013-05-13 07:06:46Z dietmar.aust $

  Purpose  : 
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14
             
  $LastChangedDate: 2013-05-13 09:06:46 +0200 (Mon, 13 May 2013) $
  $LastChangedBy: dietmar.aust $ 
  
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation

=========================================================================*/

drop procedure xlog;
drop package xlib_log;
drop table xlib_logs;

drop package xlib_component;
drop table xlib_components;

drop sequence xlib_seq;

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ any objects left?
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SELECT   object_name, object_type
    FROM all_objects
   WHERE owner = SYS_CONTEXT ('USERENV', 'CURRENT_SCHEMA')
ORDER BY 1;

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ to remove all objects from the recyclebin, enter
prompt ~~ purge recyclebin;
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

commit;