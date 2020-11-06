SET SERVEROUTPUT ON


-----------------------
--Procedure llamar departamentos
-----------------------
CREATE OR REPLACE PROCEDURE departamento_select
is
BEGIN
    DECLARE 
   v_id_departamento NUMBER;
   v_num_habitacion NUMBER;
   v_numero_habitaciones NUMBER; 
   v_metros_cuadrados NUMBER;
   v_banios NUMBER; 
   v_piso NUMBER;
   v_precio_noche NUMBER;
   v_nombre_edificio VARCHAR2(256);
   v_nombre_es VARCHAR2(256);

   
   CURSOR departamento_cur is 
     SELECT id_departamento,numero_habitacion,numero_habitaciones,metros_cuadrados,banios,piso,precio_noche,edi.direccion_edificio ,es.nombre FROM DEPARTAMENTO dep
        JOIN ESTADO es on es.id_estado = dep.fk_id_estado
        JOIN EDIFICIO edi on edi.id_edificio = dep.fk_id_edificio
        
    BEGIN 
   OPEN departamento_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH departamento_cur into v_id_departamento,v_num_habitacion, v_numero_habitaciones, v_metros_cuadrados,v_banios,v_piso,v_precio_noche,v_nombre_edificio,v_nombre_es; 
      EXIT WHEN departamento_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_departamento ||',"num_habitacion":'||v_num_habitacion|| ',"num_habitaciones":' || v_numero_habitaciones || ',"metros_cuadradros":' || v_metros_cuadrados  || ',"banios":' || v_banios || ',"piso":' || v_piso || ',"precio_noche":' || v_precio_noche || ',"edificio":"' || v_nombre_edificio || '","estado":' || v_nombre_es||'"},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE departamento_cur; 
END; 
END;

     SELECT id_departamento,numero_habitacion,numero_habitaciones,metros_cuadrados,banios,piso,precio_noche,edi.direccion_edificio ,es.nombre, ft.foto_dep FROM DEPARTAMENTO dep
        JOIN ESTADO es on es.id_estado = dep.fk_id_estado
        JOIN EDIFICIO edi on edi.id_edificio = dep.fk_id_edificio
        JOIN FOTO_DEPA ft on ft.fk_id_departamento = dep.id_departamento;

-----------------------
--Procedure llamar departamentos por id
-----------------------

CREATE OR REPLACE PROCEDURE departamento_id_select
(v_id_dep number)
is
BEGIN
    DECLARE 
   v_id_departamento NUMBER; 
   v_num_habitacion NUMBER;
   v_numero_habitaciones NUMBER; 
   v_metros_cuadrados NUMBER;
   v_banios NUMBER; 
   v_piso NUMBER;
   v_precio_noche NUMBER;
   v_nombre_edificio VARCHAR2(256);
   v_nombre_es VARCHAR2(256);

   
   CURSOR departamento_cur_id is 
     SELECT id_departamento,numero_habitacion,numero_habitaciones,metros_cuadrados,banios,piso,precio_noche,edi.direccion_edificio ,es.nombre FROM DEPARTAMENTO dep
        JOIN ESTADO es on es.id_estado = dep.fk_id_estado
        JOIN EDIFICIO edi on edi.id_edificio = dep.fk_id_edificio
    BEGIN 
   OPEN departamento_cur_id; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH departamento_cur_id into v_id_departamento,v_num_habitacion, v_numero_habitaciones, v_metros_cuadrados,v_banios,v_piso,v_precio_noche,v_nombre_edificio,v_nombre_es; 
      EXIT WHEN departamento_cur_id%notfound; 
      dbms_output.put_line('{"id":'||v_id_departamento ||',"num_habitacion":'||v_num_habitacion|| ',"num_habitaciones":' || v_numero_habitaciones || ',"metros_cuadradros":' || v_metros_cuadrados  || ',"banios":' || v_banios || ',"piso":' || v_piso || ',"precio_noche":' || v_precio_noche || ',"edificio":"' || v_nombre_edificio || '","estado":' || v_nombre_es||'"},'); 
   END LOOP; 
    DBMS_OUTPUT.put_line(']');
   CLOSE departamento_cur_id; 
END; 
END;


-----------------------
--Procedure llamar departamentos por estado
-----------------------

CREATE OR REPLACE PROCEDURE departamento_estado_select
(v_id_estado_depa number)
is
BEGIN
    DECLARE 
   v_id_departamento NUMBER; 
   v_num_habitacion NUMBER;
   v_numero_habitaciones NUMBER; 
   v_metros_cuadrados NUMBER;
   v_banios NUMBER; 
   v_piso NUMBER;
   v_precio_noche NUMBER;
   v_nombre_edificio VARCHAR2(256);
   v_nombre_es VARCHAR2(256);
   v_foto_depa VARCHAR2(2000);

   
   CURSOR departamento_cur_estado is 
     SELECT id_departamento,numero_habitacion,numero_habitaciones,metros_cuadrados,banios,piso,precio_noche,edi.direccion_edificio ,es.nombre, ft.foto_dep FROM DEPARTAMENTO dep
        JOIN ESTADO es on es.id_estado = dep.fk_id_estado
        JOIN EDIFICIO edi on edi.id_edificio = dep.fk_id_edificio
        JOIN FOTO_DEPA ft on ft.fk_id_departamento = dep.id_departamento
    WHERE es.id_estado = v_id_estado_depa;
    BEGIN 
   OPEN departamento_cur_estado; 
   DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH departamento_cur_estado into v_id_departamento,v_num_habitacion, v_numero_habitaciones, v_metros_cuadrados,v_banios,v_piso,v_precio_noche,v_nombre_edificio,v_nombre_es,v_foto_depa; 
      EXIT WHEN departamento_cur_estado%notfound; 
      dbms_output.put_line('{"id":'||v_id_departamento ||',"num_habitacion":'||v_num_habitacion|| ',"num_habitaciones":' || v_numero_habitaciones || ',"metros_cuadradros":' || v_metros_cuadrados  || ',"banios":' || v_banios || ',"piso":' || v_piso || ',"precio_noche":' || v_precio_noche || ',"edificio":"' || v_nombre_edificio || '","estado":' || v_nombre_es||'","foto":'|| v_foto_depa||'"},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE departamento_cur_estado; 
END; 
END;

---------------
---------------
BEGIN
    select_depa();
END;

BEGIN
    select_depa_id(1);
END;

BEGIN
    select_depa_estado(1);
END;


      