------------------
--SELECT USUARIO GENERAL
-----------------
CREATE OR REPLACE PROCEDURE usuario_select
is
BEGIN
    DECLARE 
    v_id_usu NUMBER;
    v_nombre VARCHAR2(50);
    v_contrasenia VARCHAR2(255);
    v_email VARCHAR2(50);
    v_foto VARCHAR2(255);
    v_rut VARCHAR2(15);
    v_direccion VARCHAR2(255);
    v_telefono VARCHAR2(15);
    v_usuario_tipo VARCHAR2(50);
    v_activo CHAR;
   CURSOR usuario_cur is 
        SELECT id_usu,nombre,contrasenia,email,foto,rut,direccion,telefono,tp.nombre_tipo_usuario AS "TIPO USUARIO", usu.activo
        FROM USUARIO USU
        JOIN TIPO_USUARIO TP on TP.id_tipo_usu = usu.fk_id_tipo_usu;
    BEGIN 
   OPEN usuario_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH usuario_cur into v_id_usu, v_nombre,v_contrasenia,v_email,v_foto,v_rut,v_direccion,v_telefono,v_usuario_tipo,v_activo; 
      EXIT WHEN usuario_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_usu || ',"nombre":"'|| v_nombre ||'","contrasenia":"'|| v_contrasenia ||'","email":"'||v_email||'","foto":"'||v_foto||'","rut":"'||v_rut||'","direccion":"'||v_direccion||
                            '","telefono":"'||v_telefono||'","tipoUsuario":"'||v_usuario_tipo||'","activo":' ||v_activo || '},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE usuario_cur; 
END; 
END;


------------------
--SELECT USUARIO POR ID
-----------------
CREATE OR REPLACE PROCEDURE usuario_id_select
(v_id_usuario NUMBER)
is
BEGIN
    DECLARE 
    v_id_usu NUMBER;
    v_nombre VARCHAR2(50);
    v_contrasenia VARCHAR2(255);
    v_email VARCHAR2(50);
    v_foto VARCHAR2(255);
    v_rut VARCHAR2(15);
    v_direccion VARCHAR2(255);
    v_telefono VARCHAR2(15);
    v_usuario_tipo VARCHAR2(50);
    v_activo CHAR;
   CURSOR usuario_id_cur is 
        SELECT id_usu,nombre,contrasenia,email,foto,rut,direccion,telefono,tp.nombre_tipo_usuario AS "TIPO USUARIO", usu.activo 
        FROM USUARIO USU
        JOIN TIPO_USUARIO TP on TP.id_tipo_usu = usu.fk_id_tipo_usu
        WHERE id_usu=v_id_usuario;
    BEGIN 
   OPEN usuario_id_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH usuario_id_cur into v_id_usu, v_nombre,v_contrasenia,v_email,v_foto,v_rut,v_direccion,v_telefono,v_usuario_tipo,v_activo; 
      EXIT WHEN usuario_id_cur%notfound; 
         dbms_output.put_line('{"id":'||v_id_usu || ',"nombre":"'|| v_nombre ||'","contrasenia":"'|| v_contrasenia ||'","email":"'||v_email||'","foto":"'||v_foto||'","rut":"'||v_rut||'","direccion":"'||v_direccion||
                            '","telefono":"'||v_telefono||'","tipoUsuario":"'||v_usuario_tipo||'","activo":' ||v_activo || '},');  
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE usuario_id_cur; 
END; 
END;

------------------
--SELECT USUARIO POR TIPO USUARIO
-----------------
CREATE OR REPLACE PROCEDURE usuario_tipo_select
(v_id_tipo_usu NUMBER)
is
BEGIN
    DECLARE 
    v_id_usu NUMBER;
    v_nombre VARCHAR2(50);
    v_contrasenia VARCHAR2(255);
    v_email VARCHAR2(50);
    v_foto VARCHAR2(255);
    v_rut VARCHAR2(15);
    v_direccion VARCHAR2(255);
    v_telefono VARCHAR2(15);
    v_usuario_tipo VARCHAR2(50);
    v_activo CHAR;
   CURSOR usuario_tipo_cur is 
        SELECT id_usu,nombre,contrasenia,email,foto,rut,direccion,telefono,tp.nombre_tipo_usuario AS "TIPO USUARIO", usu.activo
        FROM USUARIO USU
        JOIN TIPO_USUARIO TP on TP.id_tipo_usu = usu.fk_id_tipo_usu
        WHERE tp.id_tipo_usu=v_id_tipo_usu;
    BEGIN 
   OPEN usuario_tipo_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH usuario_tipo_cur into v_id_usu, v_nombre,v_contrasenia,v_email,v_foto,v_rut,v_direccion,v_telefono,v_usuario_tipo,v_activo; 
      EXIT WHEN usuario_tipo_cur%notfound; 
        dbms_output.put_line('{"id":'||v_id_usu || ',"nombre":"'|| v_nombre ||'","contrasenia":"'|| v_contrasenia ||'","email":"'||v_email||'","foto":"'||v_foto||'","rut":"'||v_rut||'","direccion":"'||v_direccion||
                            '","telefono":"'||v_telefono||'","tipoUsuario":"'||v_usuario_tipo||'","activo":' || v_activo || '},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE usuario_tipo_cur; 
END; 
END;

-----------------------

-----------------------
BEGIN
    usuario_select();
END;

BEGIN
    usuario_select_id(2);
END;

BEGIN
    usuario_select_tipo(1);
END;
-----------------------
-----------------------
SELECT id_usu,nombre,contrasenia,email,foto,rut,direccion,telefono,tp.nombre_tipo_usuario AS "TIPO USUARIO"
FROM USUARIO USU
JOIN TIPO_USUARIO TP on TP.id_tipo_usu = usu.fk_id_tipo_usu;