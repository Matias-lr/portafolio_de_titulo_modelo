-----------
--SELECT VEHICULO
-----------
CREATE OR REPLACE PROCEDURE vehiculo_select
is
BEGIN
    DECLARE 
    v_id_vehiculo NUMBER;
    v_puertas NUMBER;
    v_maleta CHAR;
    v_patente VARCHAR2(6);
    v_modelo VARCHAR2(255);
    v_marca VARCHAR2(255);
   CURSOR vehiculo_cur is 
        SELECT id_vehiculo, puertas, maleta, patente, mo.nombre, mr.nombre 
        FROM VEHICULO VE
        JOIN MODELO mo on mo.id_modelo = ve.fk_id_modelo
        JOIN MARCA mr on mr.id_marca = mo. fk_id_marca;
    BEGIN 
   OPEN vehiculo_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH vehiculo_cur into v_id_vehiculo, v_puertas,v_maleta,v_patente,v_modelo,v_marca; 
      EXIT WHEN vehiculo_cur%notfound; 
      dbms_output.put_line('{id:'||v_id_vehiculo || ',puertas:'|| v_puertas ||',maleta:"'|| v_maleta ||'"patente:"'||v_patente||'"modelo:"'||v_modelo||'"marca:"'||v_marca||'"},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE vehiculo_cur; 
END; 
END;

select * from vehiculo;
SELECT id_vehiculo, puertas, maleta, patente, mo.nombre, mr.nombre 
FROM VEHICULO VE
JOIN MODELO mo on mo.id_modelo = ve.fk_id_modelo
JOIN MARCA mr on mr.id_marca = mo. fk_id_marca;

-----------
--SELECT SERVICIOS DEPARTAMENTO ID
-----------

CREATE OR REPLACE PROCEDURE vehiculo_select_id
(id_carro number)
is
BEGIN
    DECLARE 
    v_id_vehiculo NUMBER;
    v_puertas NUMBER;
    v_maleta CHAR;
    v_patente VARCHAR2(6);
    v_modelo VARCHAR2(255);
    v_marca VARCHAR2(255);
   CURSOR vehiculo_cur_id is 
        SELECT id_vehiculo, puertas, maleta, patente, mo.nombre, mr.nombre 
        FROM VEHICULO VE
        JOIN MODELO mo on mo.id_modelo = ve.fk_id_modelo
        JOIN MARCA mr on mr.id_marca = mo. fk_id_marca
        WHERE id_vehiculo=id_carro;
    BEGIN 
   OPEN vehiculo_cur_id; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH vehiculo_cur_id into v_id_vehiculo, v_puertas,v_maleta,v_patente,v_modelo,v_marca; 
      EXIT WHEN vehiculo_cur_id%notfound; 
      dbms_output.put_line('{id:'||v_id_vehiculo || ',puertas:'|| v_puertas ||',maleta:"'|| v_maleta ||'"patente:"'||v_patente||'"modelo:"'||v_modelo||'"marca:"'||v_marca||'"},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE vehiculo_cur_id; 
END; 
END;


BEGIN
vehiculo_select();
END;

BEGIN
vehiculo_select_id(1);
END;