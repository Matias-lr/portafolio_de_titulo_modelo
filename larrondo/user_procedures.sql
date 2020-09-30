create or replace procedure usuario_create_procedure
(v_nombre usuario.nombre%type,
v_password usuario.password%type,
v_email usuario.email%type,
v_foto usuario.foto%type,
v_rut usuario.rut%type,
v_direccion usuario.direccion%type,
v_telefono usuario.telefono%type,
v_id_tipo usuario.fk_id_tipo_usu%type)
as
begin
    insert into usuario(nombre,password,email,foto,rut,direccion,telefono,fk_id_tipo_usu)
    values(v_nombre,v_password,v_email,v_foto,v_rut,v_direccion,v_telefono,v_id_tipo);
    commit;

end usuario_create_procedure;

create or replace procedure usuario_delete_procedure
(v_id usuario.id_usu%type)
as
begin
    delete from usuario where id_usu = v_id;
    commit;
end usuario_delete_procedure;

create or replace function user_select_function
(tabla varchar2)
return TABLE
is
begin
    execute IMMEDIATE 'select * from usuario';
end;



CREATE OR REPLACE PROCEDURE update_general(
    v_nombre_tabla varchar2,
    v_nombre_columna varchar2,
    v_n_columna varchar2,
    v_nombre_id varchar2,
    v_id_columna number) 
    IS
    all_update varchar2(1000);
    id_tabla varchar2(255);
BEGIN
    SELECT column_name into id_tabla FROM all_cons_columns WHERE constraint_name = (
      SELECT constraint_name FROM all_constraints 
      WHERE UPPER(table_name) = UPPER(v_nombre_tabla) AND CONSTRAINT_TYPE = 'P'
    );
    dbms_output.put_line(id_tabla);
     --all_update:='update '||v_nombre_tabla||' set '||v_nombre_columna||'= '||v_n_columna||' where '||v_nombre_id||'='||v_id_columna;
                        
    --EXECUTE IMMEDIATE all_update;
END;

BEGIN
  update_general('DEPARTAMENTO','piso',100,'id_departamento',1);
END;