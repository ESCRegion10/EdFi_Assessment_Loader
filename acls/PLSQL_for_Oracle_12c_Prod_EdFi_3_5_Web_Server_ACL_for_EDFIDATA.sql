-- 
-- For Oracle 12c Prod, EdFi Web Server ACL for EDFIDATA to 10.20.11.50:443
-- ACL name (edfi_web_server_file.xml) for ACL to the EdFi 3.5 web server (10.20.11.50 port 443)
--
-- Run as 'SYS'
--
-- Date          Author                Remarks
-- 01/08/21      T. Esposito           original version  
--

declare
    l_acl_name varchar2(100) := 'edfi_web_server_file.xml';
begin
  begin
    dbms_network_acl_admin.drop_acl(
      acl =>       l_acl_name
    );
  exception 
    when others then null; -- ACL does not exist yet
  end;
  
  -- Privilege to connect to a host
  dbms_network_acl_admin.create_acl(
    acl =>         l_acl_name,
    description => 'Accessing EdFi 3.5 web server',
    principal =>   upper('EDFIDATA'),    -- DB Schema (grantee)
    is_grant =>    true,
    privilege =>   'connect',
    start_date  => SYSDATE - 1, 
    end_date  =>   null
  );
 
  -- Privilege to resolve a hostname (DNS lookup)
  dbms_network_acl_admin.add_privilege(
    acl =>         l_acl_name,
    principal =>   upper('EDFIDATA'),    -- DB Schema (grantee)
    is_grant  =>   true,
    privilege =>   'resolve',
    start_date  => SYSDATE - 1, 
    end_date  =>   null
  );
  
-- Privilege to connect to the 3.5 web server 10.20.11.50 port 443)
  dbms_network_acl_admin.assign_acl(
    acl =>         l_acl_name,
    host =>        '10.20.11.50',  -- 3.5 web server (10.20.11.50 port 443)
    lower_port =>  400,
    upper_port =>  1000
  );

end;
/
    
commit
/
