-----------
--INSERT ENCARGADO 
-----------

CREATE OR REPLACE PROCEDURE insert_encargado(
v_id_encargado NUMBER,
v_nombre VARCHAR2,
v_rut VARCHAR2,
v_telefono NUMBER,
v_foto VARCHAR2)
IS
BEGIN
INSERT INTO ENCARGADO(id_encargado,nombre,rut,telefono,foto)
VALUES(v_id_encargado,v_nombre,v_rut,v_telefono ,v_foto);
END ;

BEGIN
  insert_encargado(3,'Matias Larrondo','16737826-9',98765432,'Foto Matias');
END;

SELECT * FROM ENCARGADO;

-----------
--INSERT GUIA
-----------

CREATE OR REPLACE PROCEDURE insert_guia(
v_id_guia NUMBER,
v_nombre VARCHAR2,
v_rut VARCHAR2,
v_telefono NUMBER,
v_foto VARCHAR2)
IS
BEGIN
INSERT INTO GUIA_TURISTICO(id_guia,nombre,rut,telefono,foto)
VALUES(v_id_guia,v_nombre,v_rut,v_telefono ,v_foto);
END ;

BEGIN
  insert_guia(3,'Matias Larrondo','16737826-9',98765432,'Foto Matias');
END;

SELECT * FROM GUIA_TURISTICO;


-----------
--INSERT CHOFER
-----------

CREATE OR REPLACE PROCEDURE insert_chofer(
v_id_chofer NUMBER,
v_nombre VARCHAR2,
v_rut VARCHAR2,
v_telefono NUMBER,
v_foto VARCHAR2)
IS
BEGIN
INSERT INTO CHOFER(id_chofer,nombre,rut,telefono,foto)
VALUES(v_id_chofer,v_nombre,v_rut,v_telefono ,v_foto);
END ;

BEGIN
  insert_chofer(3,'Matias Larrondo','16737826-9',98765432,'Foto Matias');
END;

SELECT * FROM CHOFER;
