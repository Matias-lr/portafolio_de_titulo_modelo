
CREATE OR REPLACE PROCEDURE depa_numero_edificio_select
(numero_depa NUMBER,
 nombre_edi VARCHAR2)
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
   v_foto varchar2(2000);
   v_edificio_dire VARCHAR2(256);
   v_nombre_es VARCHAR2(256);
   v_nombre_edificio VARCHAR(255);
   v_activo char;
   
   CURSOR departamento_cur is 
     SELECT id_departamento,numero_habitacion,numero_habitaciones,metros_cuadrados,banios,piso,precio_noche,dep.foto,edi.direccion_edificio ,es.nombre ,edi.nombre, dep.activo FROM DEPARTAMENTO dep
        JOIN ESTADO es on es.id_estado = dep.fk_id_estado
        JOIN EDIFICIO edi on edi.id_edificio = dep.fk_id_edificio
        WHERE edi.nombre = nombre_edi AND dep.numero_habitacion=numero_depa;
    BEGIN 
   OPEN departamento_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH departamento_cur into v_id_departamento,v_num_habitacion, v_numero_habitaciones, v_metros_cuadrados,v_banios,v_piso,v_precio_noche,v_foto,v_edificio_dire,v_nombre_es,v_nombre_edificio, v_activo; 
      EXIT WHEN departamento_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_departamento ||',"num_habitacion":'||v_num_habitacion|| ',"num_habitaciones":' || v_numero_habitaciones || ',"metros_cuadradros":' || v_metros_cuadrados  || ',"banios":' || v_banios || ',"piso":' || v_piso || ',"precio_noche":' || v_precio_noche || ',"foto":"' ||v_foto || '","edificio":"' || v_edificio_dire || '","estado":"' || v_nombre_es|| '","nombreEdificio":"' ||v_nombre_edificio || '","activo":' ||v_activo || '},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line('],');
   CLOSE departamento_cur; 
END; 
END;


/*
begin
depa_numero_edificio_select(2,'edificio');
end;
*/