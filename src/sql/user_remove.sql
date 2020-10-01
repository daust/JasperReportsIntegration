/*=========================================================================
  $Id: user_remove.sql 57 2013-05-13 07:09:51Z dietmar.aust $

  Purpose  : Removes all database objects regarding JasperReportsIntegration:
             XLIB_HTTP
             XLIB_JASPERREPORTS
             XLIB_COMPONENT
             XLIB_COMPONENTS
             XLIB_LOG
             XLIB_LOGS
             XLOG
             XLIB_SEQ
  
  License  : Copyright (c) 2010 Dietmar Aust (opal-consulting.de)
             Licensed under a BSD style license (license.txt)
             http://www.opal-consulting.de/pls/apex/f?p=20090928:14
             
  $LastChangedDate: 2013-05-13 09:09:51 +0200 (Mon, 13 May 2013) $
  $LastChangedBy: dietmar.aust $ 
  
  Date        Author          Comment
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  06.01.2010  D. Aust         Initial creation
  29.09.2020  D. Aust         simplified installation / removal scripts

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
   where object_name in ('XLIB_HTTP', 'XLIB_JASPERREPORTS', 'XLIB_COMPONENT', 'XLIB_COMPONENTS', 'XLIB_LOG', 'XLIB_LOGS', 'XLOG', 'XLIB_SEQ')
   order by 1;

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
               where object_name in ('XLIB_HTTP', 'XLIB_JASPERREPORTS', 'XLIB_COMPONENT', 'XLIB_COMPONENTS', 'XLIB_LOG', 'XLIB_LOGS', 'XLOG', 'XLIB_SEQ')
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



