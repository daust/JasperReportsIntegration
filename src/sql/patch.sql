/*
$Id: patch.sql 71 2017-10-15 16:25:51Z dietmar.aust $
*/

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

