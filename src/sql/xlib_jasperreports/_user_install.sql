/*=========================================================================
  $Id: _user_install.sql 56 2013-05-13 07:06:46Z dietmar.aust $

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

WHENEVER SQLERROR EXIT SQL.SQLCODE

define VERSION=0.8.0.1

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ check installation requirements
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

BEGIN
  xlib_component.verify_required_component(p_comp_name => 'XLIB_BASE', p_comp_version_min => '0.8.0.0');
  xlib_component.verify_required_component(p_comp_name => 'XLIB_HTTP', p_comp_version_min => '0.8.0.0');
END;
/

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ XLIB_JASPERREPORTS
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set define off
@@xlib_jasperreports.pks
show errors;
@@xlib_jasperreports_img.pks
show errors;
@@xlib_jasperreports.pkb
show errors;
@@xlib_jasperreports_img.pkb
show errors;
set define on

prompt *** grant xlib_jasperreports_img to public
@_grants.sql


prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ register XLIB_JASPERREPORTS in the component registry
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

BEGIN
   xlib_component.set_component (p_name            => 'XLIB_JASPERREPORTS',
                                 p_version         => '&&VERSION',
                                 p_depends_on      => 'XLIB_BASE:XLIB_HTTP'
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
