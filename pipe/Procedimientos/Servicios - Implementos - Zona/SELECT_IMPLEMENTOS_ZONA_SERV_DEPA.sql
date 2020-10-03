
SET SERVEROUTPUT ON
-----------
--SELECT AREA EDIFICIO 
-----------
CREATE OR REPLACE PROCEDURE area_edi_select
is
BEGIN
    DECLARE 
    v_id_area NUMBER;
    v_nombre VARCHAR2(255);
    
   CURSOR area_cur is 
        select id_area_edificio,nombre_implemento FROM AREA_EDIFICIO;
    BEGIN 
   OPEN area_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH area_cur into v_id_area, v_nombre; 
      EXIT WHEN area_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_area || ',"nombre":"'|| v_nombre ||'"},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE area_cur; 
END; 
END;

-----------
--SELECT AREA EDIFICIO POR ID
-----------
CREATE OR REPLACE PROCEDURE area_edi_id_select
(v_id_ar number)
is
BEGIN
    DECLARE 
    v_id_area NUMBER;
    v_nombre VARCHAR2(255);
    
   CURSOR area_cur_id is 
        select id_area_edificio,nombre_implemento FROM AREA_EDIFICIO
        WHERE id_area_edificio=v_id_ar;
    BEGIN 
   OPEN area_cur_id; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH area_cur_id into v_id_area, v_nombre; 
      EXIT WHEN area_cur_id%notfound; 
      dbms_output.put_line('{"id":'||v_id_area || ',"nombre":"'|| v_nombre ||'"},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE area_cur_id; 
END; 
END;


BEGIN
area_edi_select();
END;

BEGIN
area_edi_select_id(1);
END;


-----------
--SELECT IMPLEMENTOS DEPARTAMENTO
-----------
CREATE OR REPLACE PROCEDURE imple_depa_select
is
BEGIN
    DECLARE 
    v_id_implemento NUMBER;
    v_nombre VARCHAR2(50);
    v_valor NUMBER;
   CURSOR implemento_cur is 
        select id_implemento,nombre_implemento,valor_implemento FROM IMPLEMENTOS_DEPARTAMENTO;
    BEGIN 
   OPEN implemento_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH implemento_cur into v_id_implemento, v_nombre,v_valor; 
      EXIT WHEN implemento_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_implemento || ',"nombre":"'|| v_nombre ||'","valor":'|| v_valor ||'},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE implemento_cur; 
END; 
END;

-----------
--SELECT IMPLEMENTOS DEPARTAMENTO POR ID
-----------
CREATE OR REPLACE PROCEDURE imple_depa_id_select
(v_id_im number)
is
BEGIN
    DECLARE 
    v_id_implemento NUMBER;
    v_nombre VARCHAR2(50);
    v_valor NUMBER;
   CURSOR implemento_cur is 
        select id_implemento,nombre_implemento,valor_implemento FROM IMPLEMENTOS_DEPARTAMENTO
        WHERE id_implemento=v_id_im;
    BEGIN 
   OPEN implemento_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH implemento_cur into v_id_implemento, v_nombre,v_valor; 
      EXIT WHEN implemento_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_implemento || ',"nombre":"'|| v_nombre ||'","valor":'|| v_valor ||'},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE implemento_cur; 
END; 
END;

BEGIN
imple_depa_select();
END;

BEGIN
imple_depa_select_id(1);
END;


-----------
--SELECT SERVICIOS DEPARTAMENTO
-----------
CREATE OR REPLACE PROCEDURE serv_depa_select
is
BEGIN
    DECLARE 
    v_id_servi NUMBER;
    v_nombre VARCHAR2(70);
    v_descripcion VARCHAR2(255);
   CURSOR servi_depa_cur is 
        select id_servi_depa,nombre,descripcion FROM SERVICIOS_DEPA;
    BEGIN 
   OPEN servi_depa_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH servi_depa_cur into v_id_servi, v_nombre,v_descripcion; 
      EXIT WHEN servi_depa_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_servi || ',"nombre":"'|| v_nombre ||'","descripcion":"'|| v_descripcion ||'"},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE servi_depa_cur; 
END; 
END;


-----------
--SELECT SERVICIOS DEPARTAMENTO ID
-----------

CREATE OR REPLACE PROCEDURE serv_depa_id_select
(v_id_sd number)
is
BEGIN
    DECLARE 
    v_id_servi NUMBER;
    v_nombre VARCHAR2(70);
    v_descripcion VARCHAR2(255);
   CURSOR servi_depa_cur_id is 
        select id_servi_depa,nombre,descripcion FROM SERVICIOS_DEPA
        where id_servi_depa = v_id_sd;
    BEGIN 
   OPEN servi_depa_cur_id; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH servi_depa_cur_id into v_id_servi, v_nombre,v_descripcion; 
      EXIT WHEN servi_depa_cur_id%notfound; 
      dbms_output.put_line('{"id":'||v_id_servi || ',"nombre":"'|| v_nombre ||'","descripcion":"'|| v_descripcion ||'"},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE servi_depa_cur_id; 
END; 
END;


BEGIN
serv_depa_select();
END;

BEGIN
serv_depa_select_id(1);
END;
