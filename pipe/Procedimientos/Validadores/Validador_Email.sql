set SERVEROUTPUT on

create or replace procedure proce_email2 (v_email varchar2)
is
existe number;
v_id_usu number;
v_nombre varchar2(50);
v_contrasenia varchar2(255);
v_mail varchar2(50);
v_foto varchar2(255);
v_rut varchar2(15);
v_direccion varchar2(255);
v_telefono varchar2(15);
v_nombre_usu varchar2(50);
v_id_tipo NUMBER;
begin
v_id_usu:=0;
v_nombre:='';
v_contrasenia:='';
v_mail:='';
v_foto:='';
v_rut:='';
v_direccion:='';
v_telefono:='';
v_nombre_usu:='';
v_id_tipo:=0;
existe:=0;
select count(*) into existe from usuario where email = v_email;
  if existe>0 then 
    existe:=1;
  else
    existe:=0;
  end if;
    select id_usu,nombre,contrasenia, email,foto,rut,direccion,telefono, tp.nombre_tipo_usuario,tp.id_tipo_usu into v_id_usu,v_nombre,v_contrasenia,
           v_mail,v_foto,v_rut,v_direccion,v_telefono,v_nombre_usu,v_id_tipo
    from usuario us
    join tipo_usuario tp on tp.id_tipo_usu = us.fk_id_tipo_usu
    where email = v_email;
  dbms_output.put_line('{ "id_usu":'|| v_id_usu || ',"nombre":"' || v_nombre || '","contrasenia":"'||v_contrasenia || '","email":"'||v_mail || '","foto":"' || v_foto || '","rut":"' || v_rut || '","direccion":"' || v_direccion || '","telefono":"' ||v_telefono ||
                       '","tipoUsuario":"'  ||v_nombre_usu|| '","idTipoUsu":' || v_id_tipo || '}');
exception
      when no_data_found then
        v_id_usu := NULL;
        v_nombre := NULL;
        v_mail := NULL;
        v_foto := NULL;
        v_rut := NULL;
        v_direccion := NULL;
        v_telefono := NULL;
        v_nombre_usu := NULL;
        v_id_tipo := NULL;
  dbms_output.put_line(existe);
end;


begin
    proce_email2('pipeuchiha2005@gmail.com');
end;






