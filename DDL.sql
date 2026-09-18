-- Generado por Oracle SQL Developer Data Modeler 24.3.0.240.1210
--   en:        2026-09-17 21:43:33 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE cargo CASCADE CONSTRAINTS;

DROP TABLE catalogo_producto CASCADE CONSTRAINTS;

DROP TABLE categoria CASCADE CONSTRAINTS;

DROP TABLE cliente CASCADE CONSTRAINTS;

DROP TABLE departamento CASCADE CONSTRAINTS;

DROP TABLE desglose_venta CASCADE CONSTRAINTS;

DROP TABLE empleado CASCADE CONSTRAINTS;

DROP TABLE estado_venta CASCADE CONSTRAINTS;

DROP TABLE marca CASCADE CONSTRAINTS;

DROP TABLE metodo_pago CASCADE CONSTRAINTS;

DROP TABLE municipio CASCADE CONSTRAINTS;

DROP TABLE pago CASCADE CONSTRAINTS;

DROP TABLE pais CASCADE CONSTRAINTS;

DROP TABLE persona CASCADE CONSTRAINTS;

DROP TABLE producto CASCADE CONSTRAINTS;

DROP TABLE tienda CASCADE CONSTRAINTS;

DROP TABLE tipo_identificacion CASCADE CONSTRAINTS;

DROP TABLE tipo_tienda CASCADE CONSTRAINTS;

DROP TABLE venta CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cargo (
    id_car     NUMBER NOT NULL,
    nombre_car VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE cargo ADD CONSTRAINT cargo_pk PRIMARY KEY ( id_car );

ALTER TABLE cargo ADD CONSTRAINT cargo_nombre_uk UNIQUE ( nombre_car );

CREATE TABLE catalogo_producto (
    id_ti                     NUMBER NOT NULL,
    id_pro                    NUMBER NOT NULL,
    precio_vigente_cat_pro    NUMBER(10, 2) NOT NULL,
    existencia_actual_cat_pro NUMBER(10) NOT NULL
)
LOGGING;

ALTER TABLE catalogo_producto ADD CONSTRAINT catalogo_producto_pk PRIMARY KEY ( id_ti,
                                                                                id_pro );

CREATE TABLE categoria (
    id_cat     NUMBER NOT NULL,
    nombre_cat VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id_cat );

ALTER TABLE categoria ADD CONSTRAINT categoria_nombre_uk UNIQUE ( nombre_cat );

CREATE TABLE cliente (
    id_cli                NUMBER NOT NULL,
    id_tip_ide            NUMBER,
    numero_identificacion VARCHAR2(30) NOT NULL,
    id_per                NUMBER NOT NULL
)
LOGGING;

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cli );

ALTER TABLE cliente ADD CONSTRAINT cliente_id_per_uk UNIQUE ( id_per );

ALTER TABLE cliente ADD CONSTRAINT cliente_identificacion_uk UNIQUE ( id_tip_ide,
                                                                      numero_identificacion );

CREATE TABLE departamento (
    id_dep     NUMBER NOT NULL,
    nombre_dep VARCHAR2(50) NOT NULL,
    id_pa      NUMBER
)
LOGGING;

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_dep );

ALTER TABLE departamento ADD CONSTRAINT departamento_nombre_uk UNIQUE ( nombre_dep,
                                                                        id_pa );

CREATE TABLE desglose_venta (
    id_ven                  NUMBER NOT NULL,
    id_pro                  NUMBER NOT NULL,
    cantidad_des_ven        NUMBER(10) NOT NULL,
    precio_unitario_des_ven NUMBER(10, 2) NOT NULL,
    subtotal_des_ven        NUMBER(10, 2) NOT NULL
)
LOGGING;

ALTER TABLE desglose_venta ADD CONSTRAINT desglose_venta_pk PRIMARY KEY ( id_ven,
                                                                          id_pro );

CREATE TABLE empleado (
    id_emp             NUMBER NOT NULL,
    fecha_contratacion DATE NOT NULL,
    id_ti              NUMBER,
    id_car             NUMBER,
    id_per             NUMBER NOT NULL
)
LOGGING;

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( id_emp );

ALTER TABLE empleado ADD CONSTRAINT empleado_id_per_uk UNIQUE ( id_per );

CREATE TABLE estado_venta (
    id_es_ven     NUMBER NOT NULL,
    nombre_es_ven VARCHAR2(20) NOT NULL
)
LOGGING;

ALTER TABLE estado_venta ADD CONSTRAINT estado_venta_pk PRIMARY KEY ( id_es_ven );

ALTER TABLE estado_venta ADD CONSTRAINT estado_venta_nombre_uk UNIQUE ( nombre_es_ven );

CREATE TABLE marca (
    id_mar     NUMBER NOT NULL,
    nombre_mar VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE marca ADD CONSTRAINT marca_pk PRIMARY KEY ( id_mar );

ALTER TABLE marca ADD CONSTRAINT marca_nombre_uk UNIQUE ( nombre_mar );

CREATE TABLE metodo_pago (
    id_met_pag     NUMBER NOT NULL,
    nombre_met_pag VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE metodo_pago ADD CONSTRAINT metodo_pago_pk PRIMARY KEY ( id_met_pag );

ALTER TABLE metodo_pago ADD CONSTRAINT metodo_pago_nombre_uk UNIQUE ( nombre_met_pag );

CREATE TABLE municipio (
    id_mun     NUMBER NOT NULL,
    nombre_mun VARCHAR2(50) NOT NULL,
    id_dep     NUMBER
)
LOGGING;

ALTER TABLE municipio ADD CONSTRAINT municipio_pk PRIMARY KEY ( id_mun );

ALTER TABLE municipio ADD CONSTRAINT municipio_nombre_uk UNIQUE ( nombre_mun,
                                                                  id_dep );

CREATE TABLE pago (
    id_pag     NUMBER NOT NULL,
    monto_pag  NUMBER(10, 2) NOT NULL,
    id_met_pag NUMBER,
    id_ven     NUMBER
)
LOGGING;

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( id_pag );

CREATE TABLE pais (
    id_pa     NUMBER NOT NULL,
    nombre_pa VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( id_pa );

ALTER TABLE pais ADD CONSTRAINT pais_nombre_uk UNIQUE ( nombre_pa );

CREATE TABLE persona (
    id_per        NUMBER NOT NULL,
    nombre_per    VARCHAR2(50) NOT NULL,
    apellido_per  VARCHAR2(50) NOT NULL,
    telefono      VARCHAR2(20),
    correo_per    VARCHAR2(100),
    direccion_per VARCHAR2(150),
    id_mun        NUMBER
)
LOGGING;

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( id_per );

ALTER TABLE persona ADD CONSTRAINT persona_correo_uk UNIQUE ( correo_per );

CREATE TABLE producto (
    id_pro          NUMBER NOT NULL,
    nombre_pro      VARCHAR2(100) NOT NULL,
    descripcion_pro VARCHAR2(200),
    id_cat          NUMBER,
    id_mar          NUMBER
)
LOGGING;

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_pro );

CREATE TABLE tienda (
    id_ti        NUMBER NOT NULL,
    nombre_ti    VARCHAR2(100) NOT NULL,
    direccion_ti VARCHAR2(150),
    telefono_ti  VARCHAR2(20),
    id_mun       NUMBER,
    id_tip_tie   NUMBER
)
LOGGING;

ALTER TABLE tienda ADD CONSTRAINT tienda_pk PRIMARY KEY ( id_ti );

CREATE TABLE tipo_identificacion (
    id_tip_ide     NUMBER NOT NULL,
    nombre_tip_ide VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE tipo_identificacion ADD CONSTRAINT tipo_identificacion_pk PRIMARY KEY ( id_tip_ide );

ALTER TABLE tipo_identificacion ADD CONSTRAINT tipo_identificacion_nombre_uk UNIQUE ( nombre_tip_ide );

CREATE TABLE tipo_tienda (
    id_tip_tie     NUMBER NOT NULL,
    nombre_tip_tie VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE tipo_tienda ADD CONSTRAINT tipo_tienda_pk PRIMARY KEY ( id_tip_tie );

ALTER TABLE tipo_tienda ADD CONSTRAINT tipo_tienda_nombre_uk UNIQUE ( nombre_tip_tie );

CREATE TABLE venta (
    id_ven    NUMBER NOT NULL,
    fecha_ven DATE NOT NULL,
    id_ti     NUMBER,
    id_emp    NUMBER,
    id_cli    NUMBER,
    id_es_ven NUMBER NOT NULL
)
LOGGING;

ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY ( id_ven );

ALTER TABLE catalogo_producto
    ADD CONSTRAINT catalogo_producto_producto_fk
        FOREIGN KEY ( id_pro )
            REFERENCES producto ( id_pro )
            NOT DEFERRABLE;

ALTER TABLE catalogo_producto
    ADD CONSTRAINT catalogo_producto_tienda_fk
        FOREIGN KEY ( id_ti )
            REFERENCES tienda ( id_ti )
            NOT DEFERRABLE;

ALTER TABLE cliente
    ADD CONSTRAINT cliente_persona_fk
        FOREIGN KEY ( id_per )
            REFERENCES persona ( id_per )
            NOT DEFERRABLE;

ALTER TABLE cliente
    ADD CONSTRAINT cliente_tipo_identificacion_fk
        FOREIGN KEY ( id_tip_ide )
            REFERENCES tipo_identificacion ( id_tip_ide )
            NOT DEFERRABLE;

ALTER TABLE departamento
    ADD CONSTRAINT departamento_pais_fk
        FOREIGN KEY ( id_pa )
            REFERENCES pais ( id_pa )
            NOT DEFERRABLE;

ALTER TABLE desglose_venta
    ADD CONSTRAINT desglose_venta_producto_fk
        FOREIGN KEY ( id_pro )
            REFERENCES producto ( id_pro )
            NOT DEFERRABLE;

ALTER TABLE desglose_venta
    ADD CONSTRAINT desglose_venta_venta_fk
        FOREIGN KEY ( id_ven )
            REFERENCES venta ( id_ven )
            NOT DEFERRABLE;

ALTER TABLE empleado
    ADD CONSTRAINT empleado_cargo_fk
        FOREIGN KEY ( id_car )
            REFERENCES cargo ( id_car )
            NOT DEFERRABLE;

ALTER TABLE empleado
    ADD CONSTRAINT empleado_persona_fk
        FOREIGN KEY ( id_per )
            REFERENCES persona ( id_per )
            NOT DEFERRABLE;

ALTER TABLE empleado
    ADD CONSTRAINT empleado_tienda_fk
        FOREIGN KEY ( id_ti )
            REFERENCES tienda ( id_ti )
            NOT DEFERRABLE;

ALTER TABLE municipio
    ADD CONSTRAINT municipio_departamento_fk
        FOREIGN KEY ( id_dep )
            REFERENCES departamento ( id_dep )
            NOT DEFERRABLE;

ALTER TABLE pago
    ADD CONSTRAINT pago_metodo_pago_fk
        FOREIGN KEY ( id_met_pag )
            REFERENCES metodo_pago ( id_met_pag )
            NOT DEFERRABLE;

ALTER TABLE pago
    ADD CONSTRAINT pago_venta_fk
        FOREIGN KEY ( id_ven )
            REFERENCES venta ( id_ven )
            NOT DEFERRABLE;

ALTER TABLE persona
    ADD CONSTRAINT persona_municipio_fk
        FOREIGN KEY ( id_mun )
            REFERENCES municipio ( id_mun )
            NOT DEFERRABLE;

ALTER TABLE producto
    ADD CONSTRAINT producto_categoria_fk
        FOREIGN KEY ( id_cat )
            REFERENCES categoria ( id_cat )
            NOT DEFERRABLE;

ALTER TABLE producto
    ADD CONSTRAINT producto_marca_fk
        FOREIGN KEY ( id_mar )
            REFERENCES marca ( id_mar )
            NOT DEFERRABLE;

ALTER TABLE tienda
    ADD CONSTRAINT tienda_municipio_fk
        FOREIGN KEY ( id_mun )
            REFERENCES municipio ( id_mun )
            NOT DEFERRABLE;

ALTER TABLE tienda
    ADD CONSTRAINT tienda_tipo_tienda_fk
        FOREIGN KEY ( id_tip_tie )
            REFERENCES tipo_tienda ( id_tip_tie )
            NOT DEFERRABLE;

ALTER TABLE venta
    ADD CONSTRAINT venta_cliente_fk
        FOREIGN KEY ( id_cli )
            REFERENCES cliente ( id_cli )
            NOT DEFERRABLE;

ALTER TABLE venta
    ADD CONSTRAINT venta_empleado_fk
        FOREIGN KEY ( id_emp )
            REFERENCES empleado ( id_emp )
            NOT DEFERRABLE;

ALTER TABLE venta
    ADD CONSTRAINT venta_estado_venta_fk
        FOREIGN KEY ( id_es_ven )
            REFERENCES estado_venta ( id_es_ven )
            NOT DEFERRABLE;

ALTER TABLE venta
    ADD CONSTRAINT venta_tienda_fk
        FOREIGN KEY ( id_ti )
            REFERENCES tienda ( id_ti )
            NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            19
-- CREATE INDEX                             0
-- ALTER TABLE                             55
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
-- WARNINGS                                 0
