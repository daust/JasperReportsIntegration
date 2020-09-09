/*=========================================================================
  $Id: _user_install.sql 57 2013-05-13 07:09:51Z dietmar.aust $

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

WHENEVER SQLERROR EXIT SQL.SQLCODE

define VERSION=0.8.0.0

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ check installation requirements
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

BEGIN
  xlib_component.verify_required_component(  p_comp_name => 'XLIB_BASE' 
                                           , p_comp_version_min => '0.8.0.0');
END;
/

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ XLIB_HTTP
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set define off
@@xlib_http.pks
show errors;
@@xlib_http.pkb
show errors;
set define on

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ register XLIB_HTTP in the component registry
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

BEGIN
   xlib_component.set_component (p_name            => 'XLIB_HTTP',
                                 p_version         => '&&VERSION',
                                 p_depends_on      => 'XLIB_BASE'
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
