/*=========================================================================
  Purpose  : 
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration
              
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation
  29.09.2020  D. Aust         simplified installation / removal scripts
  01.10.2020  D. Aust         Added configuration table XLIB_JASPERREPORTS_CONF

=========================================================================*/

set serveroutput on size unlimited;
set sqlblanklines on;

column filename new_value new_filename noprint;
select 'logs/user_install_'||to_char(sysdate,'YYYY-MM-DD-HH24-MI')||'.log' filename from dual;
spool "&NEW_FILENAME";

set timing off
set define off

prompt *** sequence XLIB_SEQ
@@user/xlib_seq.sql

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ Tables
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@user/xlib_logs.sql
@@user/xlib_jasperreports_conf.sql
@@user/xlib_jasperreports_demos.sql

-- data
@@user/xlib_jasperreports_conf_data.sql
@@user/xlib_jasperreports_demos_data.sql

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ Package Headers
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set define off
@@user/xlib_log.pks
show errors;
@@user/xlib_http.pks
show errors;
@@user/xlib_jasperreports.pks
show errors;
@@user/xlib_jasperreports_img.pks
show errors;

set define on

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ Procedures
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@user/xlog.sql
show errors;

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ Package Bodies
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set define off
@@user/xlib_http.pkb
show errors;
@@user/xlib_jasperreports.pkb
show errors;
@@user/xlib_jasperreports_img.pkb
show errors;
@@user/xlib_log.pkb
show errors;

set define on

prompt *** grant xlib_jasperreports_img to public
grant execute on xlib_jasperreports_img to public;


prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ recompile schema
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

begin
  dbms_utility.compile_schema(schema      => sys_context('USERENV', 'CURRENT_SCHEMA'), 
                              compile_all => false);
end;
/

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ any invalid objects?
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SELECT   object_name, object_type
    FROM all_objects
   WHERE owner = SYS_CONTEXT ('USERENV', 'CURRENT_SCHEMA')
     AND status = 'INVALID'
ORDER BY 1;

commit;

spool off
