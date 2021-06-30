-- 
-- For Oracle 12c Prod, EdFi 3.5 ODS Proxy Server ACL for EDFIDATA to 192.168.100.16:80
-- ACL name (edfi_ods_proxy_server_file.xml) for ACL to the EdFi 3.5 ODS proxy server (192.168.100.16 port 80)
--
-- Run as 'SYS'
--
-- Date          Author                Remarks
-- 01/08/21      T. Esposito           original version  
--

declare
    l_acl_name varchar2(100) := 'edfi_ods_proxy_server_file.xml';
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
  
-- Privilege to connect to the 3.5 ods proxy server 192.168.100.16 port 80)
  dbms_network_acl_admin.assign_acl(
    acl =>         l_acl_name,
    host =>        '192.168.100.16',  -- 3.5 ods proxy server (192.168.100.16 port 80)
    lower_port =>  80,
    upper_port =>  500
  );

end;
/
    
commit
/
