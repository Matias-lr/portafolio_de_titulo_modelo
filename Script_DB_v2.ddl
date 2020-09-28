-- Generado por Oracle SQL Developer Data Modeler 18.2.0.179.0756
--   en:        2020-09-28 01:55:01 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE area_edificio CASCADE CONSTRAINTS;

DROP TABLE arriendo CASCADE CONSTRAINTS;

DROP TABLE check_in CASCADE CONSTRAINTS;

DROP TABLE check_out CASCADE CONSTRAINTS;

DROP TABLE chofer CASCADE CONSTRAINTS;

DROP TABLE comuna CASCADE CONSTRAINTS;

DROP TABLE departamento CASCADE CONSTRAINTS;

DROP TABLE deta_area_edi CASCADE CONSTRAINTS;

DROP TABLE deta_imp_depa CASCADE CONSTRAINTS;

DROP TABLE deta_serv_depa CASCADE CONSTRAINTS;

DROP TABLE detalle_pago CASCADE CONSTRAINTS;

DROP TABLE edificio CASCADE CONSTRAINTS;

DROP TABLE encargado CASCADE CONSTRAINTS;

DROP TABLE estado CASCADE CONSTRAINTS;

DROP TABLE estado_pago CASCADE CONSTRAINTS;

DROP TABLE guia_turistico CASCADE CONSTRAINTS;

DROP TABLE implementos_departamento CASCADE CONSTRAINTS;

DROP TABLE marca CASCADE CONSTRAINTS;

DROP TABLE modelo CASCADE CONSTRAINTS;

DROP TABLE multa CASCADE CONSTRAINTS;

DROP TABLE pago CASCADE CONSTRAINTS;

DROP TABLE region CASCADE CONSTRAINTS;

DROP TABLE servicio_de_transporte CASCADE CONSTRAINTS;

DROP TABLE servicio_extra CASCADE CONSTRAINTS;

DROP TABLE servicios_depa CASCADE CONSTRAINTS;

DROP TABLE tipo_multas CASCADE CONSTRAINTS;

DROP TABLE tipo_pago CASCADE CONSTRAINTS;

DROP TABLE tipo_usuario CASCADE CONSTRAINTS;

DROP TABLE token CASCADE CONSTRAINTS;

DROP TABLE tour CASCADE CONSTRAINTS;

DROP TABLE transporte CASCADE CONSTRAINTS;

DROP TABLE usuario CASCADE CONSTRAINTS;

DROP TABLE vehiculo CASCADE CONSTRAINTS;

CREATE TABLE area_edificio (
    id_area_edificio    NUMBER NOT NULL,
    nombre_implemento   VARCHAR2(50) NOT NULL
);

ALTER TABLE area_edificio ADD CONSTRAINT implementos_edificio_pk PRIMARY KEY ( id_area_edificio );

CREATE TABLE arriendo (
    id_arriendo            NUMBER NOT NULL,
    fecha_desde            DATE NOT NULL,
    fecha_hasta            DATE NOT NULL,
    acompañantes           NUMBER NOT NULL,
    precio                 NUMBER NOT NULL,
    fk_id_departamento     NUMBER NOT NULL,
    fk_id_turismo          NUMBER,
    fk_id_check_out        NUMBER NOT NULL,
    fk_id_servicio_extra   NUMBER,
    usuario_id_usu         NUMBER NOT NULL
);

ALTER TABLE arriendo ADD CONSTRAINT arriendo_pk PRIMARY KEY ( id_arriendo );

CREATE TABLE check_in (
    id_check_in      NUMBER NOT NULL,
    fecha_hora       DATE NOT NULL,
    validado         CHAR(1) NOT NULL,
    fk_id_arriendo   NUMBER NOT NULL
);

ALTER TABLE check_in ADD CONSTRAINT check_in_pk PRIMARY KEY ( id_check_in );

CREATE TABLE check_out (
    id_check_out   NUMBER NOT NULL,
    fecha_hora     DATE NOT NULL,
    validado       CHAR(1) NOT NULL
);

ALTER TABLE check_out ADD CONSTRAINT check_inv1_pk PRIMARY KEY ( id_check_out );

CREATE TABLE chofer (
    id_chofer   NUMBER NOT NULL,
    nombre      VARCHAR2(255) NOT NULL,
    rut         VARCHAR2(15) NOT NULL,
    foto        VARCHAR2(255)
);

ALTER TABLE chofer ADD CONSTRAINT chofer_pk PRIMARY KEY ( id_chofer );

CREATE TABLE comuna (
    id_comuna           NUMBER NOT NULL,
    nombre              VARCHAR2(255) NOT NULL,
    fk_id_descripcion   NUMBER NOT NULL
);

ALTER TABLE comuna ADD CONSTRAINT comuna_pk PRIMARY KEY ( id_comuna );

CREATE TABLE departamento (
    id_departamento       NUMBER NOT NULL,
    numero_habitaciones   NUMBER NOT NULL,
    metros_cuadrados      NUMBER NOT NULL,
    baños                 NUMBER NOT NULL,
    piso                  NUMBER NOT NULL,
    precio_noche          NUMBER NOT NULL,
    fk_id_edificio        NUMBER NOT NULL,
    fk_id_estado          NUMBER NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_departamento );

CREATE TABLE deta_area_edi (
    edificio_id_edificio             NUMBER NOT NULL,
    area_edificio_id_area_edificio   NUMBER NOT NULL,
    cantidad_implemento              NUMBER NOT NULL
);

CREATE TABLE deta_imp_depa (
    id_implemento         NUMBER NOT NULL,
    id_departamento       NUMBER NOT NULL,
    cantidad_implemento   NUMBER NOT NULL
);

CREATE TABLE deta_serv_depa (
    fk_id_servi_depa     NUMBER NOT NULL,
    fk_id_departamento   NUMBER NOT NULL
);

CREATE TABLE detalle_pago (
    id_detalle_pago   NUMBER NOT NULL,
    codigo            VARCHAR2(50) NOT NULL,
    fk_id_pago        NUMBER NOT NULL
);

ALTER TABLE detalle_pago ADD CONSTRAINT detalle_pago_pk PRIMARY KEY ( id_detalle_pago );

CREATE TABLE edificio (
    id_edificio          NUMBER NOT NULL,
    direccion_edificio   VARCHAR2(255) NOT NULL,
    telefono             NUMBER(15) NOT NULL,
    fk_id_comuna         NUMBER NOT NULL
);

ALTER TABLE edificio ADD CONSTRAINT edificio_pk PRIMARY KEY ( id_edificio );

CREATE TABLE encargado (
    id_encargado   NUMBER NOT NULL,
    nombre         VARCHAR2(100) NOT NULL
);

ALTER TABLE encargado ADD CONSTRAINT encargado_pk PRIMARY KEY ( id_encargado );

CREATE TABLE estado (
    id_estado     NUMBER NOT NULL,
    nombre        VARCHAR2(50) NOT NULL,
    descripcion   VARCHAR2(255) NOT NULL
);

ALTER TABLE estado ADD CONSTRAINT estado_pk PRIMARY KEY ( id_estado );

CREATE TABLE estado_pago (
    id_estado   NUMBER NOT NULL,
    nombre      VARCHAR2(50) NOT NULL
);

ALTER TABLE estado_pago ADD CONSTRAINT estado_pago_pk PRIMARY KEY ( id_estado );

CREATE TABLE guia_turistico (
    id_guia   NUMBER NOT NULL,
    nombre    VARCHAR2(255) NOT NULL
);

ALTER TABLE guia_turistico ADD CONSTRAINT guia_turistico_pk PRIMARY KEY ( id_guia );

CREATE TABLE implementos_departamento (
    id_implemento       NUMBER NOT NULL,
    nombre_implemento   VARCHAR2(50) NOT NULL,
    valor_implemento    NUMBER NOT NULL
);

ALTER TABLE implementos_departamento ADD CONSTRAINT implementos_departamento_pk PRIMARY KEY ( id_implemento );

CREATE TABLE marca (
    id_marca   NUMBER NOT NULL,
    nombre     VARCHAR2(255) NOT NULL
);

ALTER TABLE marca ADD CONSTRAINT marca_pk PRIMARY KEY ( id_marca );

CREATE TABLE modelo (
    id_modelo     NUMBER NOT NULL,
    nombre        VARCHAR2(255) NOT NULL,
    fk_id_marca   NUMBER NOT NULL
);

ALTER TABLE modelo ADD CONSTRAINT modelo_pk PRIMARY KEY ( id_modelo );

CREATE TABLE multa (
    id_multa                    NUMBER NOT NULL,
    fecha_creacion              DATE NOT NULL,
    periodo_de_gracia           NUMBER NOT NULL,
    fecha_expiracion_del_pago   DATE NOT NULL,
    fk_id_multas                NUMBER NOT NULL,
    fk_id_arriendo              NUMBER NOT NULL
);

ALTER TABLE multa ADD CONSTRAINT multa_pk PRIMARY KEY ( id_multa );

CREATE TABLE pago (
    id_pago          NUMBER NOT NULL,
    monto            NUMBER NOT NULL,
    fk_id_tipo       NUMBER NOT NULL,
    fk_id_arriendo   NUMBER NOT NULL,
    fk_id_estado     NUMBER NOT NULL
);

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( id_pago );

CREATE TABLE region (
    id_descripcion   NUMBER NOT NULL,
    nombre           VARCHAR2(255) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( id_descripcion );

CREATE TABLE servicio_de_transporte (
    id_servicio_transporte   NUMBER NOT NULL,
    fk_id_vehiculo           NUMBER NOT NULL,
    fk_id_chofer             NUMBER NOT NULL,
    fk_id_arriendo           NUMBER NOT NULL,
    fk_id_transporte         NUMBER NOT NULL
);

ALTER TABLE servicio_de_transporte ADD CONSTRAINT servicio_de_transporte_pk PRIMARY KEY ( id_servicio_transporte );

CREATE TABLE servicio_extra (
    id_servicio_extra   NUMBER NOT NULL,
    nombre              VARCHAR2(70) NOT NULL,
    descripcion         VARCHAR2(255) NOT NULL,
    valor               NUMBER NOT NULL,
    fk_id_encargado     NUMBER NOT NULL,
    fk_id_edificio      NUMBER NOT NULL
);

ALTER TABLE servicio_extra ADD CONSTRAINT servicio_extra_pk PRIMARY KEY ( id_servicio_extra );

CREATE TABLE servicios_depa (
    id_servi_depa   NUMBER NOT NULL,
    nombre          VARCHAR2(70) NOT NULL,
    descripcion     VARCHAR2(255) NOT NULL
);

ALTER TABLE servicios_depa ADD CONSTRAINT servicios_depa_pk PRIMARY KEY ( id_servi_depa );

CREATE TABLE tipo_multas (
    id_multas           NUMBER NOT NULL,
    nombre              VARCHAR2(50) NOT NULL,
    descripcion_multa   VARCHAR2(250) NOT NULL,
    monto               NUMBER NOT NULL,
    interes             FLOAT NOT NULL
);

ALTER TABLE tipo_multas ADD CONSTRAINT multas_pk PRIMARY KEY ( id_multas );

CREATE TABLE tipo_pago (
    id_tipo   NUMBER NOT NULL,
    nombre    VARCHAR2(255) NOT NULL
);

ALTER TABLE tipo_pago ADD CONSTRAINT tipo_pago_pk PRIMARY KEY ( id_tipo );

CREATE TABLE tipo_usuario (
    id_tipo_usu           NUMBER NOT NULL,
    nombre_tipo_usuario   VARCHAR2(50) NOT NULL
);

ALTER TABLE tipo_usuario ADD CONSTRAINT tipo_usuario_pk PRIMARY KEY ( id_tipo_usu );

CREATE TABLE token (
    id_token      NUMBER NOT NULL,
    token         VARCHAR2(100) NOT NULL,
    device_name   VARCHAR2(255) NOT NULL,
    adress        NUMBER NOT NULL,
    baned         CHAR(1) NOT NULL,
    fk_id_usu     NUMBER NOT NULL
);

ALTER TABLE token ADD CONSTRAINT token_pk PRIMARY KEY ( id_token );

CREATE TABLE tour (
    id_turismo       NUMBER NOT NULL,
    nombre           VARCHAR2(100) NOT NULL,
    descripcion      VARCHAR2(255) NOT NULL,
    lugar_visita     VARCHAR2(100) NOT NULL,
    valor            NUMBER NOT NULL,
    fecha_salida     DATE NOT NULL,
    fecha_llegada    DATE NOT NULL,
    fk_id_edificio   NUMBER NOT NULL,
    fk_id_guia       NUMBER NOT NULL
);

ALTER TABLE tour ADD CONSTRAINT turismo_pk PRIMARY KEY ( id_turismo );

CREATE TABLE transporte (
    id_transporte            NUMBER NOT NULL,
    nombre_transporte        VARCHAR2(255) NOT NULL,
    descripcion_transporte   VARCHAR2(255) NOT NULL,
    lugar_salida             VARCHAR2(255) NOT NULL,
    lugar_llegada            VARCHAR2(255) NOT NULL,
    salida                   DATE NOT NULL,
    llegada                  DATE NOT NULL,
    valor                    NUMBER NOT NULL,
    fk_id_edificio           NUMBER NOT NULL
);

ALTER TABLE transporte ADD CONSTRAINT transporte_pk PRIMARY KEY ( id_transporte );

CREATE TABLE usuario (
    id_usu           NUMBER NOT NULL,
    nombre           VARCHAR2(50) NOT NULL,
    password         VARCHAR2(255) NOT NULL,
    email            VARCHAR2(50) NOT NULL,
    foto             VARCHAR2(255),
    rut              VARCHAR2(15) NOT NULL,
    direccion        VARCHAR2(255) NOT NULL,
    telefono         VARCHAR2(15) NOT NULL,
    fk_id_tipo_usu   NUMBER NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usu );

CREATE TABLE vehiculo (
    id_vehiculo    NUMBER NOT NULL,
    puertas        NUMBER NOT NULL,
    maleta         CHAR 
--  WARNING: CHAR size not specified 
     NOT NULL,
    fk_id_modelo   NUMBER NOT NULL
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( id_vehiculo );

ALTER TABLE arriendo
    ADD CONSTRAINT arriendo_check_out_fk FOREIGN KEY ( fk_id_check_out )
        REFERENCES check_out ( id_check_out );

ALTER TABLE arriendo
    ADD CONSTRAINT arriendo_departamento_fk FOREIGN KEY ( fk_id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE servicio_de_transporte
    ADD CONSTRAINT arriendo_fk FOREIGN KEY ( fk_id_arriendo )
        REFERENCES arriendo ( id_arriendo );

ALTER TABLE arriendo
    ADD CONSTRAINT arriendo_servicio_extra_fk FOREIGN KEY ( fk_id_servicio_extra )
        REFERENCES servicio_extra ( id_servicio_extra );

ALTER TABLE arriendo
    ADD CONSTRAINT arriendo_tour_fk FOREIGN KEY ( fk_id_turismo )
        REFERENCES tour ( id_turismo );

ALTER TABLE arriendo
    ADD CONSTRAINT arriendo_usuario_fk FOREIGN KEY ( usuario_id_usu )
        REFERENCES usuario ( id_usu );

ALTER TABLE check_in
    ADD CONSTRAINT check_in_arriendo_fk FOREIGN KEY ( fk_id_arriendo )
        REFERENCES arriendo ( id_arriendo );

ALTER TABLE servicio_de_transporte
    ADD CONSTRAINT chofer_fk FOREIGN KEY ( fk_id_chofer )
        REFERENCES chofer ( id_chofer );

ALTER TABLE comuna
    ADD CONSTRAINT comuna_region_fk FOREIGN KEY ( fk_id_descripcion )
        REFERENCES region ( id_descripcion );

ALTER TABLE departamento
    ADD CONSTRAINT departamento_edificio_fk FOREIGN KEY ( fk_id_edificio )
        REFERENCES edificio ( id_edificio );

ALTER TABLE departamento
    ADD CONSTRAINT departamento_estado_fk FOREIGN KEY ( fk_id_estado )
        REFERENCES estado ( id_estado );

ALTER TABLE deta_imp_depa
    ADD CONSTRAINT departamento_fk FOREIGN KEY ( id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE deta_area_edi
    ADD CONSTRAINT deta_area_edi_area_edificio_fk FOREIGN KEY ( area_edificio_id_area_edificio )
        REFERENCES area_edificio ( id_area_edificio );

ALTER TABLE deta_area_edi
    ADD CONSTRAINT deta_area_edi_edificio_fk FOREIGN KEY ( edificio_id_edificio )
        REFERENCES edificio ( id_edificio );

ALTER TABLE detalle_pago
    ADD CONSTRAINT detalle_pago_pago_fk FOREIGN KEY ( fk_id_pago )
        REFERENCES pago ( id_pago );

ALTER TABLE deta_serv_depa
    ADD CONSTRAINT dt_departamento_fk FOREIGN KEY ( fk_id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE edificio
    ADD CONSTRAINT edificio_comuna_fk FOREIGN KEY ( fk_id_comuna )
        REFERENCES comuna ( id_comuna );

ALTER TABLE deta_imp_depa
    ADD CONSTRAINT implementos_departamento_fk FOREIGN KEY ( id_implemento )
        REFERENCES implementos_departamento ( id_implemento );

ALTER TABLE modelo
    ADD CONSTRAINT modelo_marca_fk FOREIGN KEY ( fk_id_marca )
        REFERENCES marca ( id_marca );

ALTER TABLE multa
    ADD CONSTRAINT multa_arriendo_fk FOREIGN KEY ( fk_id_arriendo )
        REFERENCES arriendo ( id_arriendo );

ALTER TABLE multa
    ADD CONSTRAINT multa_tipo_multas_fk FOREIGN KEY ( fk_id_multas )
        REFERENCES tipo_multas ( id_multas );

ALTER TABLE pago
    ADD CONSTRAINT pago_arriendo_fk FOREIGN KEY ( fk_id_arriendo )
        REFERENCES arriendo ( id_arriendo );

ALTER TABLE pago
    ADD CONSTRAINT pago_estado_pago_fk FOREIGN KEY ( fk_id_estado )
        REFERENCES estado_pago ( id_estado );

ALTER TABLE pago
    ADD CONSTRAINT pago_tipo_pago_fk FOREIGN KEY ( fk_id_tipo )
        REFERENCES tipo_pago ( id_tipo );

ALTER TABLE servicio_extra
    ADD CONSTRAINT servicio_extra_edificio_fk FOREIGN KEY ( fk_id_edificio )
        REFERENCES edificio ( id_edificio );

ALTER TABLE servicio_extra
    ADD CONSTRAINT servicio_extra_encargado_fk FOREIGN KEY ( fk_id_encargado )
        REFERENCES encargado ( id_encargado );

ALTER TABLE deta_serv_depa
    ADD CONSTRAINT servicios_depa_fk FOREIGN KEY ( fk_id_servi_depa )
        REFERENCES servicios_depa ( id_servi_depa );

ALTER TABLE token
    ADD CONSTRAINT token_usuario_fk FOREIGN KEY ( fk_id_usu )
        REFERENCES usuario ( id_usu );

ALTER TABLE tour
    ADD CONSTRAINT tour_guia_turistico_fk FOREIGN KEY ( fk_id_guia )
        REFERENCES guia_turistico ( id_guia );

ALTER TABLE transporte
    ADD CONSTRAINT transporte_edificio_fk FOREIGN KEY ( fk_id_edificio )
        REFERENCES edificio ( id_edificio );

ALTER TABLE servicio_de_transporte
    ADD CONSTRAINT transporte_fk FOREIGN KEY ( fk_id_transporte )
        REFERENCES transporte ( id_transporte );

ALTER TABLE tour
    ADD CONSTRAINT turismo_edificio_fk FOREIGN KEY ( fk_id_edificio )
        REFERENCES edificio ( id_edificio );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_tipo_usuario_fk FOREIGN KEY ( fk_id_tipo_usu )
        REFERENCES tipo_usuario ( id_tipo_usu );

ALTER TABLE servicio_de_transporte
    ADD CONSTRAINT vehiculo_fk FOREIGN KEY ( fk_id_vehiculo )
        REFERENCES vehiculo ( id_vehiculo );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_modelo_fk FOREIGN KEY ( fk_id_modelo )
        REFERENCES modelo ( id_modelo );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            33
-- CREATE INDEX                             0
-- ALTER TABLE                             65
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 1
