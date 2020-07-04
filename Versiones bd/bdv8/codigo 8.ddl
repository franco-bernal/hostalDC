-- Generado por Oracle SQL Developer Data Modeler 18.1.0.082.1035
--   en:        2020-07-04 15:31:50 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE cliente (
    rut_emp              VARCHAR2(20) NOT NULL,
    nom_emp              VARCHAR2(30) NOT NULL,
    tele_emp             VARCHAR2(30) NOT NULL,
    dir_emp              VARCHAR2(40) NOT NULL,
    usuario_id_usuario   INTEGER NOT NULL
);

CREATE UNIQUE INDEX cliente__idx ON
    cliente (
        usuario_id_usuario
    ASC );

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( rut_emp );

CREATE TABLE configuracion (
    iva   INTEGER NOT NULL
);

CREATE TABLE detalle_pedido (
    cantidad                 INTEGER NOT NULL,
    orden_pedido_id_pedido   INTEGER NOT NULL,
    productos_id_producto    INTEGER
);

CREATE TABLE empleado (
    rut_empleado         VARCHAR2(20) NOT NULL,
    nombre               VARCHAR2(20) NOT NULL,
    apellido             VARCHAR2(20) NOT NULL,
    usuario_id_usuario   INTEGER NOT NULL
);

CREATE UNIQUE INDEX empleado__idx ON
    empleado (
        usuario_id_usuario
    ASC );

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( rut_empleado );

CREATE TABLE factura (
    cod_factura     INTEGER NOT NULL,
    descripcion     VARCHAR2(50) NOT NULL,
    fecha_pago      DATE,
    fecha_factura   DATE NOT NULL
);

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY ( cod_factura );

CREATE TABLE habitacion (
    num_hab                INTEGER NOT NULL,
    accesorio              VARCHAR2(50),
    disponibilidad         VARCHAR2(30) NOT NULL,
    tipo_hab_id_tipo_hab   INTEGER NOT NULL
);

ALTER TABLE habitacion ADD CONSTRAINT habitacion_pk PRIMARY KEY ( num_hab );

CREATE TABLE huesped (
    rut_huesped                  VARCHAR2(20) NOT NULL,
    nombre                       VARCHAR2(20) NOT NULL,
    apellido                     VARCHAR2(20) NOT NULL,
    orden_compra_codigo_compra   INTEGER NOT NULL,
    habitacion_num_hab           INTEGER
);

ALTER TABLE huesped ADD CONSTRAINT huesped_pk PRIMARY KEY ( rut_huesped );

CREATE TABLE minuta (
    id_minuta                 INTEGER NOT NULL,
    titulo                    VARCHAR2(30) NOT NULL,
    f_creado                  DATE NOT NULL,
    detalle                   VARCHAR2(100) NOT NULL,
    tipo_minuta_id_tipo_min   INTEGER NOT NULL
);

ALTER TABLE minuta ADD CONSTRAINT minuta_pk PRIMARY KEY ( id_minuta );

CREATE TABLE orden_compra (
    codigo_compra             INTEGER NOT NULL,
    f_inicio                  DATE,
    f_fin                     DATE NOT NULL,
    f_compra                  DATE NOT NULL,
    precio_total              INTEGER NOT NULL,
    tipo_hab_id_tipo_hab      INTEGER NOT NULL,
    tipo_minuta_id_tipo_min   INTEGER NOT NULL,
    cliente_rut_emp           VARCHAR2(20) NOT NULL
);

ALTER TABLE orden_compra ADD CONSTRAINT orden_compra_pk PRIMARY KEY ( codigo_compra );

CREATE TABLE orden_pedido (
    id_pedido               INTEGER NOT NULL,
    f_emicion               DATE NOT NULL,
    f_recepcion             DATE,
    estado                  INTEGER,
    proveedor_rut           VARCHAR2(20),
    empleado_rut_empleado   VARCHAR2(20)
);

ALTER TABLE orden_pedido ADD CONSTRAINT orden_pedido_pk PRIMARY KEY ( id_pedido );

CREATE TABLE productos (
    id_producto     INTEGER NOT NULL,
    nombre          VARCHAR2(15) NOT NULL,
    detalle         VARCHAR2(20) NOT NULL,
    valor           INTEGER NOT NULL,
    proveedor_rut   VARCHAR2(20) NOT NULL
);

ALTER TABLE productos ADD CONSTRAINT productos_pk PRIMARY KEY ( id_producto );

CREATE TABLE proveedor (
    rut                  VARCHAR2(20) NOT NULL,
    nom_empresa          VARCHAR2(30) NOT NULL,
    rubro                VARCHAR2(30) NOT NULL,
    usuario_id_usuario   INTEGER NOT NULL
);

CREATE UNIQUE INDEX proveedor__idx ON
    proveedor (
        usuario_id_usuario
    ASC );

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( rut );

CREATE TABLE tipo_hab (
    id_tipo_hab   INTEGER NOT NULL,
    nom_tipo      VARCHAR2(20) NOT NULL,
    valor_hab     INTEGER NOT NULL
);

ALTER TABLE tipo_hab ADD CONSTRAINT tipo_hab_pk PRIMARY KEY ( id_tipo_hab );

CREATE TABLE tipo_minuta (
    id_tipo_min    INTEGER NOT NULL,
    nom_tipo       VARCHAR2(30) NOT NULL,
    valor_minuta   INTEGER NOT NULL
);

ALTER TABLE tipo_minuta ADD CONSTRAINT tipo_minuta_pk PRIMARY KEY ( id_tipo_min );

CREATE TABLE usuario (
    id_usuario    INTEGER NOT NULL,
    nom_usuario   VARCHAR2(40) NOT NULL,
    clave         VARCHAR2(10) NOT NULL,
    correo        VARCHAR2(40) NOT NULL,
    permiso       INTEGER NOT NULL,
    conexion      INTEGER
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE detalle_pedido
    ADD CONSTRAINT detalle_pedido_orden_pedido_fk FOREIGN KEY ( orden_pedido_id_pedido )
        REFERENCES orden_pedido ( id_pedido );

ALTER TABLE detalle_pedido
    ADD CONSTRAINT detalle_pedido_productos_fk FOREIGN KEY ( productos_id_producto )
        REFERENCES productos ( id_producto );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE habitacion
    ADD CONSTRAINT habitacion_tipo_hab_fk FOREIGN KEY ( tipo_hab_id_tipo_hab )
        REFERENCES tipo_hab ( id_tipo_hab );

ALTER TABLE huesped
    ADD CONSTRAINT huesped_habitacion_fk FOREIGN KEY ( habitacion_num_hab )
        REFERENCES habitacion ( num_hab );

ALTER TABLE huesped
    ADD CONSTRAINT huesped_orden_compra_fk FOREIGN KEY ( orden_compra_codigo_compra )
        REFERENCES orden_compra ( codigo_compra );

ALTER TABLE minuta
    ADD CONSTRAINT minuta_tipo_minuta_fk FOREIGN KEY ( tipo_minuta_id_tipo_min )
        REFERENCES tipo_minuta ( id_tipo_min );

ALTER TABLE orden_compra
    ADD CONSTRAINT orden_compra_cliente_fk FOREIGN KEY ( cliente_rut_emp )
        REFERENCES cliente ( rut_emp );

ALTER TABLE orden_compra
    ADD CONSTRAINT orden_compra_tipo_hab_fk FOREIGN KEY ( tipo_hab_id_tipo_hab )
        REFERENCES tipo_hab ( id_tipo_hab );

ALTER TABLE orden_compra
    ADD CONSTRAINT orden_compra_tipo_minuta_fk FOREIGN KEY ( tipo_minuta_id_tipo_min )
        REFERENCES tipo_minuta ( id_tipo_min );

ALTER TABLE orden_pedido
    ADD CONSTRAINT orden_pedido_empleado_fk FOREIGN KEY ( empleado_rut_empleado )
        REFERENCES empleado ( rut_empleado );

ALTER TABLE orden_pedido
    ADD CONSTRAINT orden_pedido_proveedor_fk FOREIGN KEY ( proveedor_rut )
        REFERENCES proveedor ( rut );

ALTER TABLE productos
    ADD CONSTRAINT productos_proveedor_fk FOREIGN KEY ( proveedor_rut )
        REFERENCES proveedor ( rut );

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             3
-- ALTER TABLE                             28
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
