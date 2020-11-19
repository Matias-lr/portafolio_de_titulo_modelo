set serveroutput on;

CREATE OR REPLACE PROCEDURE edificio_select
is
BEGIN
    DECLARE 
    v_id_edificio NUMBER;
    v_nombre VARCHAR2(255);
    v_direccion VARCHAR2(255);
    v_telefono NUMBER(15);
    v_comuna VARCHAR2(255);
    v_region VARCHAR2(255);
    v_activo CHAR;

   CURSOR edificio_cur is 
        SELECT id_edificio, EF.nombre,direccion_edificio,telefono,CO.nombre COMUNA,RE.nombre REGION, EF.activo ACTIVO
        FROM EDIFICIO EF
        JOIN COMUNA CO on CO.id_comuna=EF.fk_id_comuna
        JOIN REGION RE on RE.id_region=CO.fk_id_region
        where ef.activo =1;
       
    BEGIN 
   OPEN edificio_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH edificio_cur into v_id_edificio, v_nombre,v_direccion,v_telefono,v_comuna,v_region,v_activo; 
      EXIT WHEN edificio_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_edificio || ',"nombre":"'|| v_nombre ||'","direccion":"'|| v_direccion ||'","telefono":'||v_telefono||',"comuna":"'||v_comuna||'","region":"'||v_region|| '","activo":' || v_activo|| '},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE edificio_cur; 
END; 
END;


CREATE OR REPLACE PROCEDURE edificio_id_select
(id_edi NUMBER)
is
BEGIN
    DECLARE 
    v_id_edificio NUMBER;
    v_nombre VARCHAR2(255);
    v_direccion VARCHAR2(255);
    v_telefono NUMBER(15);
    v_comuna VARCHAR2(255);
    v_region VARCHAR2(255);
    v_activo CHAR;
   CURSOR edificio_id_cur is 
        SELECT id_edificio, EF.nombre,direccion_edificio,telefono,CO.nombre COMUNA,RE.nombre REGION, EF.activo ACTIVO
        FROM EDIFICIO EF
        JOIN COMUNA CO on CO.id_comuna=EF.fk_id_comuna
        JOIN REGION RE on RE.id_region=CO.fk_id_region
        WHERE id_edificio=id_edi;
    BEGIN 
   OPEN edificio_id_cur; 
   LOOP 
   FETCH edificio_id_cur into v_id_edificio, v_nombre,v_direccion,v_telefono,v_comuna,v_region,v_activo; 
      EXIT WHEN edificio_id_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_edificio || ',"nombre":"'|| v_nombre ||'","direccion":"'|| v_direccion ||'","telefono":'||v_telefono||',"comuna":"'||v_comuna||'","region":"'||v_region|| '","activo":' ||v_activo || '},'); 
   END LOOP; 
   CLOSE edificio_id_cur; 
END; 
END;

CREATE OR REPLACE PROCEDURE edificio_nombre_select
(nombre_edi varchar2)
is
BEGIN
    DECLARE 
    v_id_edificio NUMBER;
    v_nombre VARCHAR2(255);
    v_direccion VARCHAR2(255);
    v_telefono NUMBER(15);
    v_comuna VARCHAR2(255);
    v_region VARCHAR2(255);
    v_activo CHAR;
   CURSOR edificio_id_cur is 
        SELECT id_edificio, EF.nombre,direccion_edificio,telefono,CO.nombre COMUNA,RE.nombre REGION, EF.activo ACTIVO
        FROM EDIFICIO EF
        JOIN COMUNA CO on CO.id_comuna=EF.fk_id_comuna
        JOIN REGION RE on RE.id_region=CO.fk_id_region
        WHERE EF.nombre=nombre_edi;
    BEGIN 
   OPEN edificio_id_cur; 
   LOOP 
   FETCH edificio_id_cur into v_id_edificio, v_nombre,v_direccion,v_telefono,v_comuna,v_region,v_activo; 
      EXIT WHEN edificio_id_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_edificio || ',"nombre":"'|| v_nombre ||'","direccion":"'|| v_direccion ||'","telefono":'||v_telefono||',"comuna":"'||v_comuna||'","region":"'||v_region|| '","activo":' ||v_activo || '},'); 
   END LOOP; 
   CLOSE edificio_id_cur; 
END; 
END;


/*

BEGIN
    edificio_select();
END;

BEGIN
    edificio_select_id(1);
END;

select * from edificio;

BEGIN
    edificio_nombre_select('edificio');
END;

*/