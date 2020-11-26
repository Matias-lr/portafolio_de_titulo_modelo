set serveroutput on

CREATE OR REPLACE PROCEDURE depa_servi_imple
(v_id_departamento number)
is
BEGIN
    DECLARE
    v_id_depa NUMERIC;
    v_servicio VARCHAR2(70);
    v_implemento VARCHAR2(50);
    v_cant_imp NUMBER;
    CURSOR cursor_servi_imple IS
        SELECT id_departamento, sd.nombre as SERVICIOS, ide.nombre_implemento as IMPLEMENTO, did.cantidad_implemento FROM DEPARTAMENTO dep
        JOIN DETA_SERV_DEPA DSD ON dep.id_departamento= dsd.fk_id_departamento
        JOIN servicios_depa sd ON dsd.fk_id_servi_depa = sd.id_servi_depa
        JOIN deta_imp_depa did ON dep.id_departamento = did.fk_id_departamento
        JOIN implementos_departamento ide ON ide.id_implemento = did.fk_id_implemento
        where dep.id_departamento = v_id_departamento and dep.activo = 1;
    BEGIN
    OPEN cursor_servi_imple;
        DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH cursor_servi_imple into v_id_depa,v_servicio, v_implemento, v_cant_imp; 
      EXIT WHEN cursor_servi_imple%notfound; 
      dbms_output.put_line('{"id":'||v_id_depa ||',"servicio":"'||v_servicio|| '","implementos":"' || v_implemento || '","cantidadImplemento":' || v_cant_imp  || '},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE cursor_servi_imple; 
END;
END;

begin
    depa_servi_imple(1);
end;


CREATE OR REPLACE PROCEDURE edi_area_servi
(v_id_edificio number)
is
BEGIN
    DECLARE
    v_idd_edificio NUMERIC;
    v_nombre_servi VARCHAR2(70);
    v_descripcion_servi VARCHAR2(255);
    v_valor_servi NUMBER;
    CURSOR cursor_area_servi IS
        select id_edificio,se.nombre,se.descripcion,se.valor from edificio edi
        join servicio_extra se on se.fk_id_edificio = edi.id_edificio
        where edi.id_edificio = v_id_edificio and edi.activo = 1;
    BEGIN
    OPEN cursor_area_servi;
        DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH cursor_area_servi into v_idd_edificio, v_nombre_servi,v_descripcion_servi,v_valor_servi; 
      EXIT WHEN cursor_area_servi%notfound; 
      dbms_output.put_line('{"id":'||v_idd_edificio ||',"nombreServicio":"'|| v_nombre_servi  || '","descripcion":"' || v_descripcion_servi || '","valor":' || v_valor_servi || '},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE cursor_area_servi; 
END;
END;



begin
    edi_area_servi(1);
end;

