declare
 -- l_content varchar2(200) := 'client_id=QJzxHpMUfDbc&client_secret=6bc0AqBdCaaRINkU5dnrqd3e&grant_type=client_credentials';
  l_clob 	CLOB;
  l_buffer         varchar2(32767);
  l_amount         number:= 32000;
  l_offset         number:= 1;
begin
	apex_web_service.oauth_authenticate(
        p_token_url     => 'https://ods3.region10.org/ods-2023/oauth/token',--https://ods3proxy.region10.org/richardson/ods-2023/oauth/token
        p_client_id     => 'QJzxHpMUfDbc',
        p_client_secret => '6bc0AqBdCaaRINkU5dnrqd3e');
		
		dbms_output.put_line('Token '||APEX_WEB_SERVICE.g_oauth_token.token);
		dbms_output.put_line('Reason ' ||APEX_WEB_SERVICE.g_reason_phrase);
		dbms_output.put_line('status '||apex_web_service.g_status_code);
    apex_web_service.set_request_headers(
        p_name_01        => 'Authorization',
        p_value_01       => 'Bearer '||APEX_WEB_SERVICE.g_oauth_token.token);
		
		l_clob := apex_web_service.make_rest_request(p_url => 'https://ods3.region10.org/ods-2023/data/v3/ed-fi/schools' --localEducationAgencies
																								, p_http_method => 'GET'
																								--, p_wallet_path => 'file:/u01/app/oracle/admin/OCIPrdDB_lfi12f/apex_wallet'
																								);
		dbms_output.put_line('status schools '||apex_web_service.g_status_code);
		for i in 1.. apex_web_service.g_headers.count loop
      dbms_output.put_line(apex_web_service.g_headers(i).name||' : '||apex_web_service.g_headers(i).value);
			
    end loop;
		
   /* begin
        loop
            dbms_lob.read( l_clob, l_amount, l_offset, l_buffer );
            dbms_output.put_line(l_buffer);
            l_offset := l_offset + l_amount;
            l_amount := 32000;
        end loop;
    exception
        when no_data_found then
            null;
    end;*/
end;


