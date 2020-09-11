-- http://sql-plsql-de.blogspot.com/2008/11/mehr-sicherheit-in-oracle11g-plsql.html

define APPLICATION_SCHEMA=&&1

declare
	l_acl_name varchar2(100) := 'JasperReportsIntegration-&&APPLICATION_SCHEMA..xml';
begin
  begin
    dbms_network_acl_admin.drop_acl(
      acl =>         l_acl_name
    );
  exception 
    when others then null; -- ACL does not exist yet
  end;
  
  -- Privilege to connect to a host
  dbms_network_acl_admin.create_acl(
    acl =>         l_acl_name,
    description => 'Accessing the local host for printing with Tomcat',
    principal =>   upper('&&APPLICATION_SCHEMA'), -- DB Schema (grantee)
    is_grant =>    true,
    privilege =>   'connect',
    start_date  => null, 
    end_date  =>   null
  );
  
  -- Privilege to resolve a hostname (DNS lookup)
  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(
    acl =>         l_acl_name,
    principal =>   upper('&&APPLICATION_SCHEMA'), -- DB Schema (grantee)
    is_grant  =>   true,
    privilege =>   'resolve',
    start_date  => null, 
    end_date  =>   null
  );
  
  -- Privilege to connect to localhost
  dbms_network_acl_admin.assign_acl(
    acl =>         l_acl_name,
    host =>        '127.0.0.1',
    lower_port =>  80,
    upper_port =>  10000
  );

  -- Privilege to connect to localhost
  dbms_network_acl_admin.assign_acl(
    acl =>         l_acl_name,
    host =>        'localhost',
    lower_port =>  80,
    upper_port =>  10000
  );
  
end;
/
    
commit
/