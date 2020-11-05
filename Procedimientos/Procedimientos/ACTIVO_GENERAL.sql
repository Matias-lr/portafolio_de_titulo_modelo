set serveroutput on;
CREATE OR REPLACE PROCEDURE activo_general(
    v_nombre_tabla varchar2,   
    v_id NUMBER)
    IS
    change_activo varchar2(1000);
    v_nombre_id varchar2(200);
    v_activo CHAR(1);
    v_num_activo varchar2(200);
    v_valor char(1);
    
BEGIN
    v_valor:=0;
    
    SELECT column_name into v_nombre_id FROM all_cons_columns WHERE constraint_name = (
      SELECT constraint_name FROM all_constraints 
      WHERE UPPER(table_name) = UPPER(v_nombre_tabla) AND CONSTRAINT_TYPE = 'P');
      
      v_num_activo:=('select activo from '|| v_nombre_tabla || ' where ' ||v_nombre_id || ' = ' ||v_id);
      execute immediate v_num_activo into v_activo;
      
      if v_activo = '1' then 
        v_valor:=0;
      else
        v_valor:=1;
      end if;     
          change_activo:='update '||v_nombre_tabla|| ' SET ACTIVO = '||v_valor||' where '||v_nombre_id||' = '||v_id;                      
    EXECUTE IMMEDIATE change_activo;
    
END;






