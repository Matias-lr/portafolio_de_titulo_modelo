CREATE OR REPLACE PROCEDURE foto_depa_id_select
(v_id_depa number)
is
BEGIN
    DECLARE 
    v_id_foto NUMBER;
    v_foto VARCHAR2(255);
    v_id_depa_fk NUMBER;
    v_activo NUMBER;
    
   CURSOR foto_depa_cur_id is 
        select id_foto_dep,foto_dep,fk_id_departamento,activo FROM foto_depa
        WHERE fk_id_departamento=v_id_depa;
    BEGIN 
   OPEN foto_depa_cur_id; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH foto_depa_cur_id into v_id_foto, v_foto,v_id_depa_fk,v_activo; 
      EXIT WHEN foto_depa_cur_id%notfound; 
      dbms_output.put_line('{"id":'||v_id_foto || ',"foto":"'|| v_foto ||'","id_departamento":'|| v_id_depa_fk ||',"activo":'||v_activo || '},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE foto_depa_cur_id; 
END; 
END;


CREATE OR REPLACE PROCEDURE foto_edi_id_select
(v_id_edi number)
is
BEGIN
    DECLARE 
    v_id_foto NUMBER;
    v_foto VARCHAR2(255);
    v_id_edi_fk NUMBER;
    v_activo NUMBER;
    
   CURSOR foto_edi_cur_id is 
        select id_foto_edi,foto_edi,fk_id_edificio,activo FROM foto_edi
        WHERE fk_id_edificio=v_id_edi;
    BEGIN 
   OPEN foto_edi_cur_id; 
    DBMS_OUTPUT.put_line('[');
   LOOP 
   FETCH foto_edi_cur_id into v_id_foto, v_foto,v_id_edi_fk,v_activo; 
      EXIT WHEN foto_edi_cur_id%notfound; 
      dbms_output.put_line('{"id":'||v_id_foto || ',"foto":"'|| v_foto ||'","id_departamento":'|| v_id_edi_fk ||',"activo":'||v_activo || '},'); 
   END LOOP; 
   DBMS_OUTPUT.put_line(']');
   CLOSE foto_edi_cur_id; 
END; 
END;



