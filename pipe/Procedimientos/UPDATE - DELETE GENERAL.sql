-------
--Procedure Eliminar General
-------

CREATE OR REPLACE PROCEDURE delete_general(
    v_nombre_tabla varchar2,
    v_id_columna varchar2,
    v_id NUMBER)
    IS
    all_delete varchar2(1000);
BEGIN
     all_delete:='delete from '||v_nombre_tabla||' where '||v_id_columna||' = '||v_id;
                        
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
    v_nombre_columna varchar2,
    v_n_columna varchar2,
    v_nombre_id varchar2,
    v_id_columna number) 
    IS
    all_update varchar2(1000);
BEGIN
     all_update:='update '||v_nombre_tabla||' set '||v_nombre_columna||'= '||v_n_columna||' where '||v_nombre_id||'='||v_id_columna;
                        
    EXECUTE IMMEDIATE all_update;
END;

BEGIN
  update_general('DEPARTAMENTO','piso',100,'id_departamento',1);
END;