-------
--Procedure Eliminar General
-------


CREATE OR REPLACE PROCEDURE delete_general(
    v_nombre_tabla varchar2,
    v_id NUMBER)
    IS
    all_delete varchar2(1000);
    id_tabla varchar2(255);
BEGIN
      SELECT column_name into id_tabla FROM all_cons_columns WHERE constraint_name = (
      SELECT constraint_name FROM all_constraints 
      WHERE UPPER(table_name) = UPPER(v_nombre_tabla) AND CONSTRAINT_TYPE = 'P'
    );
     all_delete:='delete from '||v_nombre_tabla||' where '||id_tabla||' = '||v_id;
                        
    EXECUTE IMMEDIATE all_delete;
    
END;

BEGIN
  delete_general('VEHICULO','id_vehiculo',2);
END;

-------
--Procedure Update General
-------

CREATE OR REPLACE PROCEDURE update_general(
    v_nombre_tabla varchar2,
    v_set varchar2,
    v_id_columna number) 
    IS
    all_update varchar2(1000);
    id_tabla varchar2(255);
BEGIN
    SELECT column_name into id_tabla FROM all_cons_columns WHERE constraint_name = (
      SELECT constraint_name FROM all_constraints 
      WHERE UPPER(table_name) = UPPER(v_nombre_tabla) AND CONSTRAINT_TYPE = 'P'
    );
     all_update:='update '||v_nombre_tabla||' set '|| v_set ||' where '||id_tabla||'='||v_id_columna;
                        
    EXECUTE IMMEDIATE all_update;
END;

BEGIN
  update_general('DEPARTAMENTO','piso = 30, precio_noche = 100',1);
END;



-------
--Procedure Insertu General
-------

create or replace procedure insert_global
(v_tabla varchar2,v_insercion varchar2)
is
    v_string varchar2(255);
    v_query varchar2(10000);
begin
    for xd in (
    SELECT column_name
    FROM USER_TAB_COLUMNS
    WHERE table_name = UPPER(v_tabla)
    and column_name != (SELECT column_name FROM all_cons_columns WHERE constraint_name = (
      SELECT constraint_name FROM all_constraints 
      WHERE UPPER(table_name) = UPPER(v_tabla) AND CONSTRAINT_TYPE = 'P'
    )))
    loop
        v_string := v_string || '"'||  xd.column_name||'",';
    end loop;
    if v_string like '%,"ACTIVO"%' then
     v_string := replace(v_string,',"ACTIVO"','');
    end if;
    v_string := LPAD(v_string,length(v_string)-1);
    v_query := 'insert into ' || UPPER(v_tabla)||'(' || v_string||  ') values(' || v_insercion || ')';
    dbms_output.put_line(v_query);
    EXECUTE IMMEDIATE v_query;
end;



begin
insert_global('usuario','''matias'',''1234'',''email@email.com'',''hdjaskdhasjkd'',''hsdjakhdsjkad'',''dsjdhkshdjksd'',''dhsj'',1');
end;


begin
insert_global('arriendo','''to_date(''23-03-2020'',''dd-mm-yyy'')'',1,234000,2,null,null,1');
end;


begin
insert_global('arriendo','''23-03-2020'',1,234000,2,null,null,1');
end;