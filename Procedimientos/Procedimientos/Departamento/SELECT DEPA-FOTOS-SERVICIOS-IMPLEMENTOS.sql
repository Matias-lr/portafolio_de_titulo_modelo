

CREATE OR REPLACE PROCEDURE depa_id_edificio_select
(v_ed number)
is
BEGIN
    DECLARE 
   v_id_departamento NUMBER;
   v_nombre VARCHAR2(70);
    v_id_servicio number;
    v_cantidad number;
    v_nombre_imple varchar2(50);
    v_id_imple number;
    v_servicio varchar2(3000);
    v_implemento varchar2(3000);
    v_num_habitacion NUMBER;
   v_numero_habitaciones NUMBER; 
   v_metros_cuadrados NUMBER;
   v_banios NUMBER; 
   v_piso NUMBER;
   v_precio_noche NUMBER;
   v_nombre_edificio VARCHAR2(256);
   v_nombre_es VARCHAR2(256);
   v_foto varchar2(2000);
   v_id_foto number;
   v_foto_dep varchar2(2000);
   v_arreglo_foto varchar2(3000);
   
   CURSOR prueba_cur is 
     SELECT id_departamento,numero_habitacion,numero_habitaciones,metros_cuadrados,banios,piso,precio_noche,dep.foto,edi.direccion_edificio ,es.nombre as ESTADO FROM DEPARTAMENTO dep
        JOIN ESTADO es on es.id_estado = dep.fk_id_estado
        JOIN EDIFICIO edi on edi.id_edificio = dep.fk_id_edificio
        where dep.activo = 1 and edi.id_edificio=v_ed;
    
    CURSOR prueba_cur_1 is 
        select sd.id_servi_depa, sd.nombre
        from departamento dep
        JOIN DETA_SERV_DEPA serv on dep.id_departamento = serv.fk_id_departamento
        JOIN servicios_depa sd on serv.fk_id_servi_depa = sd.id_servi_depa
        JOIN EDIFICIO edi on edi.id_edificio = dep.fk_id_edificio
        where dep.activo = 1 and edi.id_edificio=v_ed;
          
    CURSOR prueba_cur_2 is
        SELECT id_implemento,ide.nombre_implemento as IMPLEMENTO, did.cantidad_implemento FROM DEPARTAMENTO dep
        JOIN deta_imp_depa did ON dep.id_departamento = did.fk_id_departamento
        jOIN implementos_departamento ide ON ide.id_implemento = did.fk_id_implemento
        JOIN EDIFICIO edi on edi.id_edificio = dep.fk_id_edificio
        where dep.activo = 1 and edi.id_edificio=v_ed;

    CURSOR fotos_cur is
        SELECT fd.id_foto_dep, fd.foto_dep FROM foto_depa fd
        join departamento dp on dp.id_departamento = fd.fk_id_departamento 
        JOIN EDIFICIO edi on edi.id_edificio = dp.fk_id_edificio
        WHERE edi.id_edificio =v_ed and fd.activo=1;
    BEGIN 
   OPEN prueba_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH prueba_cur into v_id_departamento,v_num_habitacion,v_numero_habitaciones,v_metros_cuadrados,v_banios,v_piso,v_precio_noche,v_foto,v_nombre_edificio,v_nombre_es; 
      EXIT WHEN prueba_cur%notfound;
          v_servicio:='';
      OPEN prueba_cur_1;
        LOOP
            FETCH prueba_cur_1 into v_id_servicio,v_nombre;
            EXIT WHEN prueba_cur_1%notfound;
            v_servicio:= v_servicio || '{"idServicio":' || v_id_servicio|| ',"nombre":"'|| v_nombre ||'"},';
        END LOOP;
      CLOSE prueba_cur_1;
      OPEN prueba_cur_2;
        LOOP
            FETCH prueba_cur_2 into v_id_imple,v_nombre_imple, v_cantidad ;
            EXIT WHEN prueba_cur_2%notfound;
            v_implemento:= v_implemento || '{"idImplemento":' ||v_id_imple || ', "nombreImplemento":"' || v_nombre_imple || '","cantidad":' ||v_cantidad || '},';
            
        END LOOP;
      CLOSE prueba_cur_2;
      OPEN fotos_cur;
        LOOP
            FETCH fotos_cur into v_id_foto,v_foto_dep;
            EXIT WHEN fotos_cur%notfound;
            v_arreglo_foto:= v_arreglo_foto || '{"idFoto":' ||v_id_foto || ',"foto":"' || v_foto_dep || '"},';
        END LOOP;
      CLOSE fotos_cur;
        dbms_output.put_line('{"id":'||v_id_departamento || ',"num_habitacion":'||v_num_habitacion|| ',"num_habitaciones":' || v_numero_habitaciones || ',"metros_cuadradros":' || v_metros_cuadrados  || ',"banios":' || v_banios || ',"piso":' || v_piso || ',"precio_noche":' || v_precio_noche || ',"foto":"' ||v_foto || '","edificio":"' || v_nombre_edificio || '","estado":"' || v_nombre_es|| '","servicio": [' ||v_servicio ||'],"implemento": ['||v_implemento ||'],"fotos": [' || v_arreglo_foto|| ']},');
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE prueba_cur; 
END; 
END;


begin 
    depa_id_edificio_select(1);
end;



