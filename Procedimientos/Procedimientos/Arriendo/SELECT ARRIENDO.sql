---------------
--SELECT ARRIENDO GENERAL
---------------

CREATE OR REPLACE PROCEDURE arriendo_select
is
BEGIN
    DECLARE 
    v_id_arriendo NUMBER;
    v_fecha_arriendo DATE;
    v_acompaniantes NUMBER;
    v_precio NUMBER;
    v_habi_depa NUMBER;
    v_nombre_edi VARCHAR2(255);
    v_tour_name VARCHAR2(255);
    v_fecha_in DATE;
    v_in_valida CHAR;
    v_fecha_out DATE;
    v_out_valida CHAR;
    v_servicio VARCHAR(255);
    v_cliente VARCHAR(255);
    v_fecha_periodo DATE;
    v_activo CHAR;
   CURSOR arriendo_cur is 
        select id_arriendo,arr.fecha_arriendo,acompaniantes,precio,DEP.numero_habitacion "NUMERO HABITACION DPTO",EDD.nombre AS "NOMBRE EDIFICIO",
        TUR.nombre AS "NOMBRE TOUR",cin.fecha_hora AS "FECHA CHECK IN",cin.validado AS "CHECK IN VALIDADO",cout.fecha_hora AS "HORA CHECK OUT",cout.validado AS "CHECK OUT VALIDADO",se.nombre AS "SERVICIO EXTRA",usu.nombre CLIENTE,
        fpa.fecha_periodo AS "FECHA ARRIENDO" ,arr.activo AS ACTIVO 
        FROM ARRIENDO ARR
        JOIN DEPARTAMENTO DEP on DEP.id_departamento=ARR.fk_id_departamento
        JOIN EDIFICIO EDD on EDD.id_edificio=DEP.fk_id_edificio
        JOIN TOUR TUR on TUR.id_turismo = ARR.fk_id_turismo
        JOIN CHECK_OUT COUT on cout.fk_id_arriendo=arr.id_arriendo
        JOIN SERVICIO_EXTRA SE on SE.id_servicio_extra=ARR.fk_id_servicio_extra
        JOIN USUARIO USU on USU.id_usu=ARR.fk_id_usu
        JOIN CHECK_IN CIN on CIN.fk_id_arriendo = ARR.id_arriendo
        JOIN FECHA_PERI_ARR FPA on fpa.fk_id_arriendo = arr.id_arriendo;
    BEGIN 
   OPEN arriendo_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH arriendo_cur into v_id_arriendo, v_fecha_arriendo,v_acompaniantes,v_precio,v_habi_depa,v_nombre_edi,v_tour_name,v_fecha_in,v_in_valida,v_fecha_out,v_out_valida,v_servicio,v_cliente,v_fecha_periodo,v_activo; 
      EXIT WHEN arriendo_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_arriendo || ',"fechaArriendo":"'|| v_fecha_arriendo  ||'","acompaniantes":'||v_acompaniantes||',"precio":'||v_precio||',"departamento":'||v_habi_depa||
                            ',"edificio":"'|| v_nombre_edi||'","tour":"'||v_tour_name||'","fechaCheckIn":"'||v_fecha_in||'","checkInValidado":"'||v_in_valida||'","fechaCheckOut":"'||v_fecha_out||'","checkOutValidado":"'||v_out_valida||
                            '","nombreServicio":"'||v_servicio||'","cliente":"'||v_cliente||'","periodoArriendo":"'|| v_fecha_periodo ||'","activo":'|| v_activo || '},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE arriendo_cur; 
END; 
END;
--------------------------
--------------------------
--------------------------
BEGIN
    arriendo_select();
END;
---------------------------
---------------------------
---------------------------




select id_arriendo,arr.fecha_arriendo,acompaniantes,precio,DEP.numero_habitacion "NUMERO HABITACION DPTO",EDD.nombre AS "NOMBRE EDIFICIO",
    TUR.nombre AS "NOMBRE TOUR",cin.fecha_hora AS "FECHA CHECK IN",cin.validado AS "CHECK IN VALIDADO",cout.fecha_hora AS "HORA CHECK OUT",cout.validado AS "CHECK OUT VALIDADO",se.nombre AS "SERVICIO EXTRA",usu.nombre CLIENTE,
    fpa.fecha_periodo AS "FECHA ARRIENDO" ,arr.activo AS ACTIVO 
        FROM ARRIENDO ARR
        JOIN DEPARTAMENTO DEP on DEP.id_departamento=ARR.fk_id_departamento
        JOIN EDIFICIO EDD on EDD.id_edificio=DEP.fk_id_edificio
        JOIN TOUR TUR on TUR.id_turismo = ARR.fk_id_turismo
        JOIN CHECK_OUT COUT on cout.fk_id_arriendo=arr.id_arriendo
        JOIN SERVICIO_EXTRA SE on SE.id_servicio_extra=ARR.fk_id_servicio_extra
        JOIN USUARIO USU on USU.id_usu=ARR.fk_id_usu
        JOIN CHECK_IN CIN on CIN.fk_id_arriendo = ARR.id_arriendo
        JOIN FECHA_PERI_ARR FPA on fpa.fk_id_arriendo = arr.id_arriendo;
        
        
    select id_arriendo,arr.fecha_arriendo,acompaniantes,precio,DEP.numero_habitacion "NUMERO HABITACION DPTO",EDD.nombre AS "NOMBRE EDIFICIO",
    TUR.nombre AS "NOMBRE TOUR",cin.fecha_hora AS "FECHA CHECK IN",cin.validado AS "CHECK IN VALIDADO",cout.fecha_hora AS "HORA CHECK OUT",cout.validado AS "CHECK OUT VALIDADO",se.nombre AS "SERVICIO EXTRA",usu.nombre CLIENTE,
    fpa.fecha_periodo AS "FECHA ARRIENDO" ,arr.activo AS ACTIVO 
        FROM ARRIENDO ARR
        JOIN DEPARTAMENTO DEP on DEP.id_departamento=ARR.fk_id_departamento
        JOIN EDIFICIO EDD on EDD.id_edificio=DEP.fk_id_edificio
        JOIN TOUR TUR on TUR.id_turismo = ARR.fk_id_turismo
        left JOIN CHECK_OUT COUT on cout.fk_id_arriendo=arr.id_arriendo
        JOIN SERVICIO_EXTRA SE on SE.id_servicio_extra=ARR.fk_id_servicio_extra
        JOIN USUARIO USU on USU.id_usu=ARR.fk_id_usu
        JOIN CHECK_IN CIN on CIN.fk_id_arriendo = ARR.id_arriendo
        JOIN FECHA_PERI_ARR FPA on fpa.fk_id_arriendo = arr.id_arriendo;
        
        




