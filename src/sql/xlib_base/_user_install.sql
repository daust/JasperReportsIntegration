/*=========================================================================
  $Id: _user_install.sql 56 2013-05-13 07:06:46Z dietmar.aust $

  Purpose  : XLIB base objects
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14
             
  $LastChangedDate: 2013-05-13 09:06:46 +0200 (Mon, 13 May 2013) $
  $LastChangedBy: dietmar.aust $ 
  
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation

=========================================================================*/

WHENEVER SQLERROR EXIT SQL.SQLCODE

define VERSION=0.8.0.0
set define off

prompt *** sequence XLIB_SEQ
@@xlib_seq.sql

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ XLIB_LOGS
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@xlib_logs.sql
@@xlib_log.pks
show errors;
@@xlib_log.pkb
show errors;
@@xlog.sql
show errors;

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ XLIB_COMPONENTS
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@xlib_components.sql
@@xlib_component.pks
show errors
@@xlib_component.pkb
show errors

@@xlib_vc2_array_t.sql

set define on

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ register XLIB_BASE in the component registry
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

BEGIN
   xlib_component.set_component (p_name            => 'XLIB_BASE',
                                 p_version         => '&&VERSION',
                                 p_depends_on      => NULL
                                );
END;
/

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ recompile schema
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

begin
  dbms_utility.compile_schema(sys_context('USERENV', 'CURRENT_SCHEMA'));
end;
/
alter package xlib_component compile;


prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ any invalid objects?
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SELECT   object_name, object_type
    FROM all_objects
   WHERE owner = SYS_CONTEXT ('USERENV', 'CURRENT_SCHEMA')
     AND status = 'INVALID'
ORDER BY 1;

commit;

