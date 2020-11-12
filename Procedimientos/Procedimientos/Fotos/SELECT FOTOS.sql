CREATE OR REPLACE PROCEDURE foto_dep_select
is
BEGIN
    DECLARE 
    v_id_foto_dep NUMBER;
    v_foto_dep VARCHAR2(2000);
    v_fk_id_depa NUMBER;

   CURSOR dep_cur is 
       select id_foto_dep, foto_dep,fk_id_departamento from foto_depa;
    BEGIN 
   OPEN dep_cur; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH dep_cur into v_id_foto_dep, v_foto_dep,v_fk_id_depa; 
      EXIT WHEN dep_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_foto_dep || ',"foto":"'|| v_foto_dep ||'","departamento":'|| v_fk_id_depa ||'},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE dep_cur; 
END; 
END;

CREATE OR REPLACE PROCEDURE foto_edi_select
is
BEGIN
    DECLARE 
    v_id_foto_edi NUMBER;
    v_foto_edi VARCHAR2(2000);
    v_fk_id_edificio NUMBER;

   CURSOR edi_cur is 
       select id_foto_edi, foto_edi,fk_id_edificio from foto_edi;
    BEGIN 
   OPEN edi_cur; 
   LOOP 
   FETCH edi_cur into v_id_foto_edi, v_foto_edi,v_fk_id_edificio; 
      EXIT WHEN edi_cur%notfound; 
      dbms_output.put_line('{"id":'||v_id_foto_edi || ',"foto":"'|| v_foto_edi ||'","departamento":'|| v_fk_id_edificio ||'},'); 
   END LOOP; 
   CLOSE edi_cur; 
END; 
END;