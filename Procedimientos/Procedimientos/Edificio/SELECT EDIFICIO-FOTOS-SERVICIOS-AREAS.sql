set serveroutput on;
CREATE OR REPLACE PROCEDURE edificio_id_select
(id_edi NUMBER)
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
    
   CURSOR edificio_id_cur is 
        SELECT id_edificio, EF.nombre,direccion_edificio,telefono,foto,CO.nombre COMUNA,RE.nombre REGION, EF.activo ACTIVO
        FROM EDIFICIO EF
        JOIN COMUNA CO on CO.id_comuna=EF.fk_id_comuna
        JOIN REGION RE on RE.id_region=CO.fk_id_region
        WHERE id_edificio=id_edi;
    
    CURSOR area_cur is
        select ae.id_area_edificio,ae.nombre_implemento,dae.cantidad_implemento from edificio edi
        left join deta_area_edi dae on dae.fk_id_edificio = edi.id_edificio
        left join area_edificio ae on ae.id_area_edificio = dae.fk_id_area_edificio
        where edi.id_edificio = id_edi; 
        
    CURSOR servicio_cur is
        select id_servicio_extra,nombre,descripcion,valor from servicio_extra
        where fk_id_edificio = id_edi;
        
    CURSOR foto_cur is
        select id_foto_edi,foto_edi from foto_edi
        where fk_id_edificio = id_edi and activo=1;
    BEGIN 
   OPEN edificio_id_cur; 
   LOOP 
   FETCH edificio_id_cur into v_id_edificio, v_nombre,v_direccion,v_telefono,v_foto,v_comuna,v_region,v_activo; 
      EXIT WHEN edificio_id_cur%notfound; 
      
      OPEN area_cur;
          LOOP
            FETCH area_cur into v_idarea,v_implemento_nombre,v_cantidad_implemento;
            EXIT WHEN area_cur%notfound;
             v_areas:= v_areas || '{"idArea":' || v_idarea|| ',"nombre":"'|| v_implemento_nombre ||'","cantiad":' ||v_cantidad_implemento || '},';
            
          END LOOP;
      CLOSE area_cur;
      
      OPEN servicio_cur;
          LOOP
            FETCH servicio_cur into v_idservicio,v_nombre_servicio,v_descripcion,v_valor_servicio;
            EXIT WHEN servicio_cur%notfound;
             v_servicios:= v_servicios || '{"idServicio":' || v_idservicio|| ',"nombre":"'|| v_nombre_servicio ||'","descripcion":' ||v_descripcion || '","valor":'||v_valor_servicio || '},';
            
          END LOOP;
      CLOSE servicio_cur;
      
      OPEN foto_cur;
          LOOP
            FETCH foto_cur into v_i_foto_edi,v_foto_edi;
            EXIT WHEN foto_cur%notfound;
            v_fotos:= v_fotos || '{"idFoto":' ||v_i_foto_edi || ',"foto":"' || v_foto_edi || '"},';

            
          END LOOP;
      CLOSE foto_cur;
        
      dbms_output.put_line('{"id":'||v_id_edificio || ',"nombre":"'|| v_nombre ||'","direccion":"'|| v_direccion || '","telefono":'||v_telefono||',"servicio": [' ||v_servicios ||'],"areas": ['||v_areas ||'],"fotos": [' || v_fotos|| '],"fotoEdificio":"'||v_foto ||'","comuna":"'||v_comuna||'","region":"'||v_region|| '","activo":' ||v_activo || '},'); 
   END LOOP; 
   CLOSE edificio_id_cur; 
END; 
END;

begin
    edificio_id_select(1);
end;

/*
insert into deta_area_edi values (1,1,2,1);
insert into deta_area_edi values (1,2,1,1);
insert into deta_area_edi values (1,3,1,1);
insert into deta_area_edi values (1,4,1,1);

insert into foto_edi values(1,'Fotito edificio',1,1);
insert into foto_edi values(2,'Fotito 2',1,1);
insert into foto_edi values(3,'Fotito 3',1,1);

        
select ae.nombre_implemento,dae.cantidad_implemento from edificio edi
left join deta_area_edi dae on dae.fk_id_edificio = edi.id_edificio
left join area_edificio ae on ae.id_area_edificio = dae.fk_id_area_edificio
where edi.id_edificio = 1; 

select nombre,descripcion,valor from servicio_extra
where fk_id_edificio = 1;

select id_foto_edi,foto_edi from foto_edi
where fk_id_edificio = 1 and activo=1;
**/