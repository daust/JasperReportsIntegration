define APPLICATION_SCHEMA=&&1
define SERVER_NAME=&&2

prompt ** This script will give &&APPLICATION_SCHEMA. access to server &&SERVER_NAME.
prompt ** for ALL ports. Do you want that? 
prompt **
prompt ** Continue with <enter> and hit <ctrl>+<break> to cancel

pause;

-- when you only want to allow access to a specific port, please use lower_port
-- and upper_port
BEGIN
   DBMS_NETWORK_ACL_ADMIN.
    append_host_ace (
      HOST   => '&&SERVER_NAME.',
      --lower_port => 443,
      --upper_port => 443,
      ace    => xs$ace_type (privilege_list   => xs$name_list ('http'),
                             principal_name   => '&&APPLICATION_SCHEMA.',
                             principal_type   => xs_acl.ptype_db));
END;
/
COMMIT;

prompt ** has the user &&APPLICATION_SCHEMA. access to server &&SERVER_NAME. ?
  SELECT HOST,
         LOWER_PORT,
         UPPER_PORT,
         ACE_ORDER,
         PRINCIPAL,
         PRINCIPAL_TYPE,
         GRANT_TYPE,
         INVERTED_PRINCIPAL,
         PRIVILEGE,
         START_DATE,
         END_DATE
    FROM (SELECT ACES.*, DBMS_NETWORK_ACL_UTILITY.CONTAINS_HOST ('&&SERVER_NAME.', HOST) PRECEDENCE
            FROM DBA_HOST_ACES ACES)
   WHERE PRECEDENCE IS NOT NULL and principal='&&APPLICATION_SCHEMA.'
ORDER BY PRECEDENCE DESC,
         LOWER_PORT NULLS LAST,
         UPPER_PORT NULLS LAST,
         ACE_ORDER;

/* for removal
BEGIN
   DBMS_NETWORK_ACL_ADMIN.
    remove_host_ace (
      HOST         => '&&SERVER_NAME.',
      lower_port   => NULL,
      upper_port   => NULL,
      ace          => xs$ace_type (privilege_list   => xs$name_list ('http'),
                                   principal_name   => '&&APPLICATION_SCHEMA.',
                                   principal_type   => xs_acl.ptype_db));
END;
/
*/



