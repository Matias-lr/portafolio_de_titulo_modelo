--TRIGER
create or replace trigger area_autoincrement_id
    before insert on area_edificio
    for each row 
begin
    :new.id_area_edificio := area_edificio_seq.nextval;
end;
/

create or replace trigger arriendo_autoincrement_id
    before insert on arriendo
    for each row 
begin
    :new.id_arriendo := arriendo_seq.nextval;
end;
/

create or replace trigger check_in_autoincrement_id
    before insert on check_in
    for each row 
begin
    :new.id_check_in := check_in_seq.nextval;
end;
/

create or replace trigger check_out_autoincrement_id
    before insert on check_out
    for each row 
begin
    :new.id_check_out := check_out_seq.nextval;
end;
/

create or replace trigger chofer_autoincrement_id
    before insert on chofer
    for each row 
begin
    :new.id_chofer := chofer_seq.nextval;
end;
/

create or replace trigger comuna_autoincrement_id
    before insert on comuna
    for each row 
begin
    :new.id_comuna := comuna_seq.nextval;
end;
/

create or replace trigger departamento_autoincrement_id
    before insert on departamento
    for each row 
begin
    :new.id_departamento := departamento_seq.nextval;
end;
/

create or replace trigger detalle_pago_autoincrement_id
    before insert on detalle_pago
    for each row 
begin
    :new.id_detalle_pago := detalle_pago_seq.nextval;
end;
/

create or replace trigger edificio_autoincrement_id
    before insert on edificio
    for each row 
begin
    :new.id_edificio := edificio_seq.nextval;
end;
/

create or replace trigger encargado_autoincrement_id
    before insert on encargado
    for each row 
begin
    :new.id_encargado := encargado_seq.nextval;
end;
/

create or replace trigger estado_autoincrement_id
    before insert on estado
    for each row 
begin
    :new.id_estado := estado_seq.nextval;
end;
/

create or replace trigger estado_pago_autoincrement_id
    before insert on estado_pago
    for each row 
begin
    :new.id_estado := estado_pago_seq.nextval;
end;
/
--
create or replace trigger foto_dep_autoincrement_id
    before insert on foto_depa
    for each row 
begin
    :new.id_foto_dep := foto_dep_seq.nextval;
end;
/
create or replace trigger foto_edi_autoincrement_id
    before insert on foto_edi
    for each row 
begin
    :new.id_foto_edi := foto_edi_seq.nextval;
end;
/

--
create or replace trigger guia_turistico_auto_id
    before insert on guia_turistico
    for each row 
begin
    :new.id_guia := guia_turistico_seq.nextval;
end;
/

create or replace trigger imple_depa_auto_id
    before insert on implementos_departamento
    for each row 
begin
    :new.id_implemento := implementos_departamento_seq.nextval;
end;
/

create or replace trigger marca_autoincrement_id
    before insert on marca
    for each row 
begin
    :new.id_marca := marca_seq.nextval;
end;
/

create or replace trigger modelo_autoincrement_id
    before insert on modelo
    for each row 
begin
    :new.id_modelo := modelo_seq.nextval;
end;
/

create or replace trigger multa_autoincrement_id
    before insert on multa
    for each row 
begin
    :new.id_multa := multa_seq.nextval;
end;
/

create or replace trigger pago_autoincrement_id
    before insert on pago
    for each row 
begin
    :new.id_pago := pago_seq.nextval;
end;
/

create or replace trigger region_autoincrement_id
    before insert on region
    for each row 
begin
    :new.id_region := region_seq.nextval;
end;
/

create or replace trigger serv_tran_auto_id
    before insert on servicio_de_transporte
    for each row 
begin
    :new.id_servicio_transporte := servicio_de_transporte_seq.nextval;
end;
/

create or replace trigger serv_extra_auto_id
    before insert on servicio_extra
    for each row 
begin
    :new.id_servicio_extra := servicio_extra_seq.nextval;
end;
/

create or replace trigger servicios_depa_auto_id
    before insert on servicios_depa
    for each row 
begin
    :new.id_servi_depa := servicios_depa_seq.nextval;
end;
/

create or replace trigger tipo_multas_autoincrement_id
    before insert on tipo_multas
    for each row 
begin
    :new.id_multas := tipo_multas_seq.nextval;
end;
/

create or replace trigger tipo_pago_autoincrement_id
    before insert on tipo_pago
    for each row 
begin
    :new.id_tipo := tipo_pago_seq.nextval;
end;
/

create or replace trigger tipo_usuario_autoincrement_id
    before insert on tipo_usuario
    for each row 
begin
    :new.id_tipo_usu := tipo_usuario_seq.nextval;
end;
/

create or replace trigger token_autoincrement_id
    before insert on token
    for each row 
begin
    :new.id_token := token_seq.nextval;
end;
/

create or replace trigger tour_autoincrement_id
    before insert on tour
    for each row 
begin
    :new.id_turismo := tour_seq.nextval;
end;
/

create or replace trigger transporte_autoincrement_id
    before insert on transporte
    for each row 
begin
    :new.id_transporte := transporte_seq.nextval;
end;
/

create or replace trigger usuario_autoincrement_id
    before insert on usuario
    for each row 
begin
    :new.id_usu := usuario_seq.nextval;
end;
/

create or replace trigger vehiculo_autoincrement_id
    before insert on vehiculo
    for each row 
begin
    :new.id_vehiculo := vehiculo_seq.nextval;
end;
/

create or replace trigger fecha_autoincrement_id
    before insert on fecha_peri_arr
    for each row 
begin
    :new.id_fecha_periodo := fecha_arriendo_seq.nextval;
end;
/
--estado secuencia






