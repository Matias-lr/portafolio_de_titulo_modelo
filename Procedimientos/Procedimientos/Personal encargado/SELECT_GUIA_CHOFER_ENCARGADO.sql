--TRABAJADORES ENCARGADOS DE LOS TOUR - CHOFER - GUIA TURISTICO

-----------
--SELECT ENCARGADO 
-----------
CREATE OR REPLACE PROCEDURE encargado_select
is
BEGIN
    DECLARE 
    v_id_encargado NUMBER;
    v_nombre VARCHAR2(255);
    v_rut VARCHAR2(255);
    v_telefono NUMBER;
    v_foto VARCHAR2(255);
    v_activo CHAR;
   
   CURSOR encargado_cur is 
        SELECT id_encargado,nombre,rut,telefono,foto,activo FROM ENCARGADO;
    BEGIN 
   OPEN encargado_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH encargado_cur into v_id_encargado, v_nombre, v_rut,v_telefono,v_foto,v_activo; 
      EXIT WHEN encargado_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_encargado || ',"nombre":"' || v_nombre || '","rut":"' || v_rut  || '","telefono":' || v_telefono || ',"foto":"' || v_foto || '","activo":' ||v_activo ||' },'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE encargado_cur; 
END; 
END;


-----------
--SELECT ENCARGADO POR ID
-----------
CREATE OR REPLACE PROCEDURE encargado_id_select(
v_id_enc NUMBER)
is
BEGIN
    DECLARE 
    v_id_encargado NUMBER;
    v_nombre VARCHAR2(255);
    v_rut VARCHAR2(255);
    v_telefono NUMBER;
    v_foto VARCHAR2(255);
    v_activo CHAR;
   
   CURSOR encargado_id_cur is 
        SELECT id_encargado,nombre,rut,telefono,foto, activo FROM ENCARGADO
        WHERE id_encargado = v_id_enc;
    BEGIN 
   OPEN encargado_id_cur; 
   LOOP 
   FETCH encargado_id_cur into v_id_encargado, v_nombre, v_rut,v_telefono,v_foto,v_activo; 
      EXIT WHEN encargado_id_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_encargado || ',"nombre":"' || v_nombre || '","rut":"' || v_rut  || '","telefono":' || v_telefono || ',"foto":"' || v_foto || '","activo":' ||v_activo || '},'); 
   END LOOP; 
   CLOSE encargado_id_cur; 
END; 
END;


BEGIN
select_encargado();
END;

BEGIN
select_encargado_id(1);
END;



-----------
--SELECT GUIA TURISTICO 
-----------
CREATE OR REPLACE PROCEDURE guia_select
is
BEGIN
    DECLARE 
    v_id_guia NUMBER;
    v_nombre VARCHAR2(255);
    v_rut VARCHAR2(255);
    v_telefono NUMBER;
    v_foto VARCHAR2(255);
    v_activo CHAR;
   
   CURSOR guia_cur is 
        SELECT id_guia,nombre,rut,telefono,foto,activo FROM GUIA_TURISTICO;
    BEGIN 
   OPEN guia_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH guia_cur into v_id_guia, v_nombre, v_rut,v_telefono,v_foto,v_activo; 
      EXIT WHEN guia_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_guia || ',"nombre":"' || v_nombre || '","rut":"' || v_rut  || '","telefono":' || v_telefono || ',"foto":"' || v_foto || '","activo":' ||v_activo ||' },'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE guia_cur; 
END; 
END;


-----------
--SELECT GUIA TURISTICO  POR ID
-----------
CREATE OR REPLACE PROCEDURE guia_id_select(
v_id_g NUMBER)
is
BEGIN
    DECLARE 
    v_id_guia NUMBER;
    v_nombre VARCHAR2(255);
    v_rut VARCHAR2(255);
    v_telefono NUMBER;
    v_foto VARCHAR2(255);
    v_activo CHAR;
   
   CURSOR guia_cur_id is 
        SELECT id_guia,nombre,rut,telefono,foto,activo FROM GUIA_TURISTICO
        WHERE id_guia = v_id_g;
    BEGIN 
   OPEN guia_cur_id; 
   LOOP 
   FETCH guia_cur_id into v_id_guia, v_nombre, v_rut,v_telefono,v_foto,v_activo; 
      EXIT WHEN guia_cur_id%notfound; 
      dbms_output.put_line('{"id":'||v_id_guia || ',"nombre":"' || v_nombre || '","rut":"' || v_rut  || '","telefono":' || v_telefono || ',"foto":"' || v_foto || '","activo":' ||v_activo ||' },'); 
   END LOOP; 
   CLOSE guia_cur_id; 
END; 
END;

BEGIN
select_guia();
END;

BEGIN
select_guia_id(1);
END;


-----------
--SELECT CHOFER 
-----------
CREATE OR REPLACE PROCEDURE chofer_select
is
BEGIN
    DECLARE 
    v_id_chofer NUMBER;
    v_nombre VARCHAR2(255);
    v_rut VARCHAR2(255);
    v_telefono NUMBER;
    v_foto VARCHAR2(255);
    v_activo CHAR;
   
   CURSOR chofer_cur is 
        SELECT id_chofer,nombre,rut,telefono,foto,activo FROM CHOFER;
    BEGIN 
   OPEN chofer_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH chofer_cur into v_id_chofer, v_nombre, v_rut,v_telefono,v_foto,v_activo; 
      EXIT WHEN chofer_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_chofer || ',"nombre":"' || v_nombre || '","rut":"' || v_rut  || '","telefono":' || v_telefono || ',"foto":"' || v_foto || '","activo":' ||v_activo ||' },'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE chofer_cur; 
END; 
END;


-----------
--SELECT CHOFER  POR ID
-----------
CREATE OR REPLACE PROCEDURE chofer_id_select(
v_id_cho NUMBER)
is
BEGIN
    DECLARE 
    v_id_chofer NUMBER;
    v_nombre VARCHAR2(255);
    v_rut VARCHAR2(255);
    v_telefono NUMBER;
    v_foto VARCHAR2(255);
    v_activo CHAR;
   
   CURSOR chofer_cur_id is 
        SELECT id_chofer,nombre,rut,telefono,foto,activo FROM CHOFER
        WHERE id_chofer = v_id_cho;
    BEGIN 
   OPEN chofer_cur_id; 
   LOOP 
   FETCH chofer_cur_id into v_id_chofer, v_nombre, v_rut,v_telefono,v_foto,v_activo; 
      EXIT WHEN chofer_cur_id%notfound; 
      dbms_output.put_line('{"id":'||v_id_chofer || ',"nombre":"' || v_nombre || '","rut":"' || v_rut  || '","telefono":' || v_telefono || ',"foto":"' || v_foto || '","activo":' ||v_activo ||' },'); 
   END LOOP; 
   CLOSE chofer_cur_id; 
END; 
END;

