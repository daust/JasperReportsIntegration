/*=========================================================================
  Purpose  : Upgrades an existing installation to the newest release. 

             Should the table(s) already exist, then it is ok to get ORA- errors
             which indicate that the object already exists and also that the 
             data cannot be inserted again. This is expected. 
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration
             
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  01.10.2020  D. Aust         Added configuration table XLIB_JASPERREPORTS_CONF
                              Added demo table XLIB_JASPERREPORT_DEMOS
                              
  08.02.2022  D. Aust         Documented the expected ORA- errors 

=========================================================================*/

set serveroutput on size unlimited;

column filename new_value new_filename noprint;
select 'logs/patch_'||to_char(sysdate,'YYYY-MM-DD-HH24-MI')||'.log' filename from dual;
spool "&NEW_FILENAME";

set define '^'

prompt ====================================================================
prompt == drop obsolete objects first: xlib_component, xlib_components
prompt ====================================================================

declare
  l_sql varchar2(32767);
begin
    for rec in (  
              select object_name, object_type
                from user_objects 
               where object_name in ('XLIB_COMPONENT', 'XLIB_COMPONENTS')
                 and object_type not in ('PACKAGE BODY')
               order by 1
             ) loop
             
        l_sql := 'drop ' || rec.object_type|| ' ' || rec.object_name;
        if rec.object_type='TABLE' 
            then l_sql := l_sql || ' purge'; 
        end if;
        
        dbms_output.put_line( l_sql );
        execute immediate l_sql;
        
    end loop;
end;
/

prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
prompt ~~ Tables
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

prompt *** You will get ORA-Errors when the tables already exist
prompt ***   ORA-00955: object exists
prompt ***   ORA-02260: primary key exists
prompt ***   ORA-00001: Unique Constraint (XLIB_JASPERREPORTS_CONF_PK) violated
prompt *** They can be safely ignored

@@user/xlib_jasperreports_conf.sql
@@user/xlib_jasperreports_demos.sql

-- data
@@user/xlib_jasperreports_conf_data.sql
@@user/xlib_jasperreports_demos_data.sql


prompt ====================================================================
prompt == Package Headers
prompt ====================================================================

prompt xlib_http
@@user/xlib_http.pks
show errors

prompt xlib_jasperreports
@@user/xlib_jasperreports.pks
show errors

prompt xlib_jasperreports_img
@@user/xlib_jasperreports_img.pks
show errors

prompt ====================================================================
prompt == Package Bodies
prompt ====================================================================

prompt xlib_http
@@user/xlib_http.pkb
show errors

prompt xlib_jasperreports
@@user/xlib_jasperreports.pkb
show errors

prompt xlib_jasperreports_img
@@user/xlib_jasperreports_img.pkb
show errors

prompt *** recompile objects
EXEC DBMS_UTILITY.compile_schema(schema => user, compile_all => false);

prompt *** Invalid objects ***
column object_name format a30;
column object_type format a20;
select object_name, object_type from user_objects where status='INVALID'
/

spool off;

exit;

