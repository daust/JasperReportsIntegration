/*=========================================================================
  $Id: xlib_status_sys.sql 57 2013-05-13 07:09:51Z dietmar.aust $

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


SET serveroutput on size 10000

DECLARE
   PROCEDURE output_xlib_status (p_username IN VARCHAR2)
   IS
      TYPE ref_cur_t IS REF CURSOR;

      cur              ref_cur_t;
      l_comp_name      VARCHAR2 (100);
      l_comp_version   VARCHAR2 (100);
   BEGIN
      DBMS_OUTPUT.put_line ('_');
      DBMS_OUTPUT.put_line ('_');
      DBMS_OUTPUT.put_line ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
      DBMS_OUTPUT.put_line ('~~ SCHEMA: ' || p_username);
      DBMS_OUTPUT.put_line ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');

      OPEN cur FOR    'select comp_name, comp_version from '
                   || p_username
                   || '.xlib_components order by comp_name';

      LOOP
         FETCH cur
          INTO l_comp_name, l_comp_version;

         EXIT WHEN cur%NOTFOUND;
         DBMS_OUTPUT.put_line (   '~  '
                               || rpad(l_comp_name, 25, ' ')
                               || l_comp_version
                              );
      END LOOP;

      CLOSE cur;
   END;
BEGIN
   FOR cur IN (SELECT *
                 FROM all_users u
                WHERE EXISTS (
                         SELECT NULL
                           FROM all_objects
                          WHERE owner = u.username
                            AND object_name = 'XLIB_COMPONENTS')
				 order by username)
   LOOP
      output_xlib_status (cur.username);
   END LOOP;
END;
/