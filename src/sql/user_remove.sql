/*=========================================================================

  Purpose  : Removes all database objects regarding JasperReportsIntegration:
             XLIB_HTTP
             XLIB_JASPERREPORTS
             XLIB_JASPERREPORTS_CONF
             XLIB_JASPERREPORTS_DEMOS
             XLIB_COMPONENT
             XLIB_COMPONENTS
             XLIB_LOG
             XLIB_LOGS
             XLOG
             XLIB_SEQ
             XLIB_JASPERREPORTS_IMG (Package)
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             https://github.com/daust/JasperReportsIntegration

  
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation
  29.09.2020  D. Aust         simplified installation / removal scripts
  01.10.2020  D. Aust         Added configuration table XLIB_JASPERREPORTS_CONF
  08.02.2022  D. Aust         #76 Adding XLIB_JASPERREPORTS_IMG to the _remove_user.sql script
                              - also added XLIB_JASPERREPORTS_DEMOS

=========================================================================*/

set serveroutput on size unlimited;
set sqlblanklines on;

column filename new_value new_filename noprint;
select 'logs/user_remove_'||to_char(sysdate,'YYYY-MM-DD-HH24-MI')||'.log' filename from dual;
spool "&NEW_FILENAME";

column object_name format a30;
column object_type format a30;

prompt 
prompt   The following objects will be removed: 
prompt 

  select object_name, object_type
    from user_objects 
   where object_name in ('XLIB_HTTP', 'XLIB_JASPERREPORTS', 'XLIB_JASPERREPORTS_CONF', 'XLIB_JASPERREPORT_DEMOS'
                       , 'XLIB_COMPONENT', 'XLIB_COMPONENTS', 'XLIB_LOG', 'XLIB_LOGS', 'XLOG', 'XLIB_SEQ' 
                       , 'XLIB_JASPERREPORTS_IMG', 'XLIB_JASPERREPORTS_DEMOS')
   order by 1;
   
/*
select object_name, object_type
    from user_objects 
   where object_name like 'XLIB%';
*/

prompt   Are you sure?

prompt *** Use <ctrl><break> to cancel and <enter> to continue ***
prompt 
pause;

declare
  l_sql varchar2(32767);
begin
    for rec in (  
              select object_name, object_type
                from user_objects 
               where object_name in ('XLIB_HTTP', 'XLIB_JASPERREPORTS', 'XLIB_JASPERREPORTS_CONF', 'XLIB_JASPERREPORT_DEMOS'
                                   , 'XLIB_COMPONENT', 'XLIB_COMPONENTS', 'XLIB_LOG', 'XLIB_LOGS', 'XLOG', 'XLIB_SEQ'
                                   , 'XLIB_JASPERREPORTS_IMG', 'XLIB_JASPERREPORTS_DEMOS')
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

spool off
exit



