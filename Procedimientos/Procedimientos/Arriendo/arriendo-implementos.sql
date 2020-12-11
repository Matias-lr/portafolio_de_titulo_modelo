
CREATE OR REPLACE PROCEDURE arriendo_select
is
BEGIN
    DECLARE 
    v_id_arriendo NUMBER;
    v_fecha_arriendo DATE;
    v_acompaniantes NUMBER;
    v_precio NUMBER;
    v_id_depa number;
    v_habi_depa NUMBER;
    v_nombre_edi VARCHAR2(255);
    v_cliente VARCHAR(255);
    v_fecha_periodo DATE;
    v_activo CHAR;
    v_select_in varchar2(2000);
    v_numero_in number;
    v_checkin number;
    v_select_out varchar2(2000);
    v_numero_out number;
    v_checkout number;
   CURSOR arriendo_cur is 
        select id_arriendo,arr.fecha_arriendo,acompaniantes,precio,dep.id_departamento,DEP.numero_habitacion "NUMERO HABITACION DPTO",EDD.nombre AS "NOMBRE EDIFICIO",
        usu.nombre CLIENTE,arr.activo AS ACTIVO 
        FROM ARRIENDO ARR
        JOIN DEPARTAMENTO DEP on DEP.id_departamento=ARR.fk_id_departamento
        JOIN EDIFICIO EDD on EDD.id_edificio=DEP.fk_id_edificio
        JOIN USUARIO USU on USU.id_usu=ARR.fk_id_usu;

    BEGIN 
   OPEN arriendo_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH arriendo_cur into v_id_arriendo, v_fecha_arriendo,v_acompaniantes,v_precio,v_id_depa,v_habi_depa,v_nombre_edi,v_cliente,v_activo; 
      EXIT WHEN arriendo_cur%notfound; 
      
      v_select_in := ('select count(id_check_in) from check_in where fk_id_arriendo =' ||v_id_arriendo);
       execute immediate v_select_in into v_numero_in;
       
      if v_numero_in >= '1' then 
        v_checkin:=1;
      else
        v_checkin:=0;
      end if;  
 
 
      v_select_out := ('select count(id_check_out) from check_out where fk_id_arriendo =' ||v_id_arriendo);
      execute immediate v_select_out into v_numero_out;
       
      if v_numero_out >= '1' then 
        v_checkout:=1;
      else
        v_checkout:=0;
      end if;  
 
      
      dbms_output.put_line('{"id":'||v_id_arriendo || ',"fechaArriendo":"'|| v_fecha_arriendo  ||'","acompaniantes":'||v_acompaniantes||',"precio":'||v_precio|| ',"idDepartamento":'||v_id_depa ||',"departamento":'||v_habi_depa||
                            ',"edificio":"'|| v_nombre_edi||'","cliente":"'||v_cliente||'","activo":'|| v_activo || ',"tieneCheckin":' ||v_checkin ||',"tieneCheckout":' ||v_checkout ||'},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE arriendo_cur; 
END; 
END;

/

CREATE OR REPLACE PROCEDURE imple_depa_id_select
(v_id_im number)
is
BEGIN
    DECLARE 
    v_id_implemento NUMBER;
    v_nombre VARCHAR2(50);
    v_valor NUMBER;
    v_activo CHAR;
   CURSOR implemento_cur is 
        select id_implemento,nombre_implemento,valor_implemento,imd.activo FROM IMPLEMENTOS_DEPARTAMENTO imd
        join deta_imp_depa dip on dip.fk_id_implemento = imd.id_implemento
        join departamento dep on dep.id_departamento = dip.fk_id_departamento
        WHERE dep.id_departamento=v_id_im;
    BEGIN 
   OPEN implemento_cur; 
	DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH implemento_cur into v_id_implemento, v_nombre,v_valor,v_activo; 
      EXIT WHEN implemento_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_implemento || ',"nombre":"'|| v_nombre ||'","valor":'|| v_valor ||',"activo":'||v_activo || '},'); 
   END LOOP; 
	DBMS_OUTPUT.put_line('[');
   CLOSE implemento_cur; 
END; 
END;