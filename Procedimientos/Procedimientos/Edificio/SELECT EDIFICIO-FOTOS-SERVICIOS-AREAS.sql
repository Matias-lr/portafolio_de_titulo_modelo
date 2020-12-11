set serveroutput on;



CREATE OR REPLACE FUNCTION area_funcion
(id_edi int)  return varchar
 IS
    area_cur varchar(2000);
 BEGIN  
    DECLARE
    id_area int;
    nombre_implemento varchar2(50);
    cantidad_implemento number;
    v_area_cursor varchar(2000);
    
    CURSOR cursor_area is
        SELECT ae.id_area_edificio,ae.nombre_implemento,dae.cantidad_implemento from edificio edi
        JOIN deta_area_edi dae on dae.fk_id_edificio = edi.id_edificio
        JOIN area_edificio ae on ae.id_area_edificio = dae.fk_id_area_edificio
        WHERE id_edificio = id_edi;    
     begin   
    OPEN cursor_area;
        LOOP
            FETCH cursor_area into id_area,nombre_implemento,cantidad_implemento;
            EXIT WHEN cursor_area%notfound;
             v_area_cursor:= v_area_cursor || '{"idArea":' || id_area|| ',"nombre":"'|| nombre_implemento ||'","cantidad":' ||cantidad_implemento || '},';
            area_cur := v_area_cursor;
        END LOOP;
    CLOSE cursor_area;
    end;
    
    
   return area_cur;
 end area_funcion; 
/

CREATE OR REPLACE FUNCTION servicio_function
 (id_edi int) return varchar
 IS
    servicio_fun varchar2(2000);
BEGIN 
    DECLARE
    id_servicio number;
    nombre_servicio varchar2(70);
    decripcion_servicio varchar2(255);
    valor number;
    v_servicios VARCHAR2(2000);
    
    CURSOR servicio_cur is
        select se.id_servicio_extra,se.nombre,se.descripcion,se.valor from servicio_extra se
        join edificio edi on edi.id_edificio = se.fk_id_edificio
        where fk_id_edificio = id_edi; 
    BEGIN
    OPEN servicio_cur;
        LOOP
            FETCH servicio_cur INTO id_servicio,nombre_servicio,decripcion_servicio,valor;
            EXIT WHEN servicio_cur%notfound;
            v_servicios:= v_servicios || '{"idServicio":' || id_servicio|| ',"nombre":"'|| nombre_servicio ||'","descripcion":"' ||decripcion_servicio || '","valor":'||valor || '},';
            servicio_fun:=v_servicios;
        END LOOP;
    END;
    RETURN servicio_fun;
END servicio_function;
/
 
CREATE OR REPLACE FUNCTION foto_function
 (id_edi int) return varchar
 IS
    foto_fun varchar2(2000);
BEGIN 
    DECLARE
    id_foto number;
    foto varchar2(70);
    v_fotos VARCHAR2(2000);
    
    CURSOR foto_cur is
        select id_foto_edi,foto_edi from foto_edi;
    BEGIN
    OPEN foto_cur;
        LOOP
            FETCH foto_cur INTO id_foto,foto;
            EXIT WHEN foto_cur%notfound;
             v_fotos:= v_fotos || '{"idFoto":' ||id_foto || ',"foto":"' || foto || '"},';
            foto_fun:=v_fotos;
        END LOOP;
    END;
    RETURN foto_fun;
END foto_function;
/




CREATE OR REPLACE PROCEDURE edificio_select
is
BEGIN
    DECLARE 
    v_id_edificio NUMBER;
    v_nombre VARCHAR2(255);
    v_direccion VARCHAR2(255);
    v_telefono NUMBER(15);
    v_foto varchar2(2000);
    v_comuna VARCHAR2(255);
    v_region VARCHAR2(255);
    v_activo CHAR;
    v_implemento_nombre varchar2(50);
    v_cantidad_implemento number;
    v_nombre_servicio varchar2(70);
    v_descripcion varchar2(255);
    v_valor_servicio number;
    v_i_foto_edi number;
    v_foto_edi varchar2(2000);
    v_fotos varchar2(2000);
    v_areas varchar2(2000);
    v_servicios varchar2(2000);
    v_idarea number;
    v_idservicio number;
    v_fotos_coma varchar2(2000);
    v_areas_coma varchar2(2000);
    v_servicios_coma varchar2(2000);
    v_jsonF varchar2(4000);
    
   CURSOR edificio_id_cur is 
        SELECT id_edificio, EF.nombre,direccion_edificio,telefono,foto,CO.nombre COMUNA,RE.nombre REGION, EF.activo ACTIVO
        FROM EDIFICIO EF
        JOIN COMUNA CO on CO.id_comuna=EF.fk_id_comuna
        JOIN REGION RE on RE.id_region=CO.fk_id_region;                  
    CURSOR foto_cur is
        select id_foto_edi,foto_edi from foto_edi;
    BEGIN 
   OPEN edificio_id_cur; 
   DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH edificio_id_cur into v_id_edificio, v_nombre,v_direccion,v_telefono,v_foto,v_comuna,v_region,v_activo; 
      EXIT WHEN edificio_id_cur%notfound; 
      
        v_areas:= area_funcion(v_id_edificio);
        v_servicios:= servicio_function(v_id_edificio);
        v_fotos:= foto_function(v_id_edificio);
        
      v_jsonF := '{"id":'||v_id_edificio || ',"nombre":"'|| v_nombre ||'","direccion":"'|| v_direccion || '","telefono":'||v_telefono||',"servicio": [' || v_servicios ||'],"areas": ['||v_areas ||'],"fotos": [' || v_fotos|| '],"fotoEdificio":"'||v_foto ||'","comuna":"'||v_comuna||'","region":"'||v_region|| '","activo":' ||v_activo || '},';
      v_jsonF := REPLACE(v_jsonF,',]',']');
      dbms_output.put_line(v_jsonF); 
   END LOOP; 
    DBMS_OUTPUT.put_line(']');
   CLOSE edificio_id_cur; 
END; 
END;


/*
insert into deta_area_edi values (1,1,2,1);
insert into deta_area_edi values (1,2,1,1);
insert into deta_area_edi values (1,3,1,1);
insert into deta_area_edi values (1,4,1,1);

insert into foto_edi values(1,'Fotito edificio',1,1);
insert into foto_edi values(2,'Fotito 2',1,1);
insert into foto_edi values(3,'Fotito 3',1,1);

select * from edificio;
insert into edificio values(2,'direccion',56912345678,1,'edificio','foto',1);
insert into edificio values(2,'edificio','direccion','+56912345678','foto',1,1);
insert into edificio values(3,'edificio','direccion','+56912345678','foto',1,1);
insert into edificio values(4,'edificio','direccion','+56912345678','foto',1,1);
insert into edificio values(5,'edificio','direccion','+56912345678','foto',1,1);
        
select ae.nombre_implemento,dae.cantidad_implemento from edificio edi
left join deta_area_edi dae on dae.fk_id_edificio = edi.id_edificio
left join area_edificio ae on ae.id_area_edificio = dae.fk_id_area_edificio
where edi.id_edificio = 1; 

select nombre,descripcion,valor from servicio_extra
where fk_id_edificio = 1;

select id_foto_edi,foto_edi from foto_edi
where fk_id_edificio = 1 and activo=1;
*/