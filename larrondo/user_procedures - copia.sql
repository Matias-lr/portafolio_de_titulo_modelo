set serveroutput on;

create or replace procedure usuario_delete_procedure
(v_id usuario.id_usu%type)
as
begin
    delete from usuario where id_usu = v_id;
    commit;
end usuario_delete_procedure;

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

create or replace procedure insert_global
(v_tabla varchar2,v_insercion varchar2)
is
    v_string varchar2(255);
    v_query varchar2(255);
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
        v_string := v_string || xd.column_name || ',';
    end loop;
    v_string := LPAD(v_string,length(v_string)-1);
    v_query := 'insert into ' || UPPER(v_tabla) || '(' || v_string || ') values(' || v_insercion || ')';
    dbms_output.put_line(v_query);
    EXECUTE IMMEDIATE v_query;
end;

begin
insert_global('usuario','''matias'',''1234'',''email@email.com'',''hdjaskdhasjkd'',''hsdjakhdsjkad'',''dsjdhkshdjksd'',''dhsj'',0');
end;


