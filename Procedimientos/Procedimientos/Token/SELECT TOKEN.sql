select id_token, token, device_name,adress,baned,fk_id_usu from token;

insert into token values(2,'token2','device','direccion','n',1);

 SET serveroutput ON

-----------
--SELECT TOKEN
-----------
CREATE OR REPLACE PROCEDURE token_select
is
BEGIN
    DECLARE 
    v_id_token NUMBER;
    v_token VARCHAR2(1000);
    v_device_name VARCHAR2(255);
    v_adress VARCHAR2(255);
    v_baned CHAR;
    v_id_usuario NUMBER;
   CURSOR token_cur is 
       select id_token, token, device_name,adress,baned,fk_id_usu from token;
    BEGIN 
   OPEN token_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH token_cur into v_id_token, v_token,v_device_name,v_adress,v_baned,v_id_usuario; 
      EXIT WHEN token_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_token || ',"token":"'|| v_token ||'","deviceName":"'|| v_device_name ||'","adress":"'||v_adress||'","baned":"'||v_baned||'","idUsuario":'||v_id_usuario||'},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE token_cur; 
END; 
END;


-----------
--SELECT TOKEN ID
-----------
CREATE OR REPLACE PROCEDURE token_id_select
(v_id_t number)
is
BEGIN
    DECLARE 
    v_id_token NUMBER;
    v_token VARCHAR2(1000);
    v_device_name VARCHAR2(255);
    v_adress VARCHAR2(255);
    v_baned CHAR;
    v_id_usuario NUMBER;
   CURSOR token_id_cur is 
       select id_token, token, device_name,adress,baned,fk_id_usu from token
       where id_token = v_id_t;
    BEGIN 
   OPEN token_id_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH token_id_cur into v_id_token, v_token,v_device_name,v_adress,v_baned,v_id_usuario; 
      EXIT WHEN token_id_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_token || ',"token":"'|| v_token ||'","deviceName":"'|| v_device_name ||'","adress":"'||v_adress||'","baned":"'||v_baned||'","idUsuario":'||v_id_usuario||'},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE token_id_cur; 
END; 
END;

-----------
--SELECT TOKEN ID USUARIO
-----------
CREATE OR REPLACE PROCEDURE token_id_usu_select
(v_id_usu number)
is
BEGIN
    DECLARE 
    v_id_token NUMBER;
    v_token VARCHAR2(1000);
    v_device_name VARCHAR2(255);
    v_adress VARCHAR2(255);
    v_baned CHAR;
    v_id_usuario NUMBER;
   CURSOR token_id_usu_cur is 
       select id_token, token, device_name,adress,baned,fk_id_usu from token
       where fk_id_usu = v_id_usu;
    BEGIN 
   OPEN token_id_usu_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH token_id_usu_cur into v_id_token, v_token,v_device_name,v_adress,v_baned,v_id_usuario; 
      EXIT WHEN token_id_usu_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_token || ',"token":"'|| v_token ||'","deviceName":"'|| v_device_name ||'","adress":"'||v_adress||'","baned":"'||v_baned||'","idUsuario":'||v_id_usuario||'},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE token_id_usu_cur; 
END; 
END;

----------
--
----------

CREATE OR REPLACE PROCEDURE token_token_select
(v_s_token varchar2)
is
BEGIN
    DECLARE 
    v_id_token NUMBER;
    v_token VARCHAR2(1000);
    v_device_name VARCHAR2(255);
    v_adress VARCHAR2(255);
    v_baned CHAR;
    v_id_usuario NUMBER;
   CURSOR token_tk_cur is 
       select id_token, token, device_name,adress,baned,fk_id_usu from token
       where token = v_s_token;
    BEGIN 
   OPEN token_tk_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH token_tk_cur into v_id_token, v_token,v_device_name,v_adress,v_baned,v_id_usuario; 
      EXIT WHEN token_tk_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_token || ',"token":"'|| v_token ||'","deviceName":"'|| v_device_name ||'","adress":"'||v_adress||'","baned":"'||v_baned||'","idUsuario":'||v_id_usuario||'},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE token_tk_cur; 
END; 
END;

BEGIN
    token_token_select('token');
END;


BEGIN
    token_select();
END;

BEGIN
    token_id_select(1);
END;

BEGIN
    token_id_usu_select(1);
END;