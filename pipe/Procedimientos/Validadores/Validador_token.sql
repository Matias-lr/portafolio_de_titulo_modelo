set SERVEROUTPUT on

create or replace procedure proce_token (v_token_existe varchar2)
is
existe number;
v_id_token NUMBER;
v_token VARCHAR2(100);
v_device VARCHAR2(255);
v_adress NUMBER;
v_baniao CHAR;
begin
v_id_token:=0;
v_token:='';
v_device:='';
v_adress:=0;
v_baniao:='';
existe:=0;
select count(*) into existe from token where token = v_token_existe;
  if existe>0 then 
    existe:=1;
  else
    existe:=0;
  end if;
select id_token, token, device_name,adress,baned into v_id_token,v_token,v_device,v_adress,v_baniao from token where token = v_token_existe;
    dbms_output.put_line('{ "id_token":'|| v_id_token || ',"token":"' || v_token || '","device":"'||v_device || '","adresss":' || v_adress || ',"baned":"' || v_baniao || '"}');
exception
      when no_data_found then
        v_id_token := NULL;
        v_token := NULL;
        v_device := NULL;
        v_adress := NULL;
        v_baniao := NULL;
dbms_output.put_line(existe);
end;
begin
    proce_token('token');
end;

select * from token;

insert into token values (1,'token','compuPipe',1,'N',1);

