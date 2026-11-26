
CREATE TABLE habitacion 
(
  id_habitacion SERIAL, 
  numero VARCHAR(5) NOT NULL,
  estado CHAR(1) NOT NULL,
  CONSTRAINT pk_habitacion 
      PRIMARY KEY (id_habitacion),
  CONSTRAINT u_numero 
      UNIQUE(numero),
  CONSTRAINT chk_estado 
      CHECK (estado IN ('D', 'O', 'M', 'L'))
);

CREATE TABLE huesped
(
  id_huesped SERIAL,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20) NOT NULL,
  tpo_documento CHAR(1) NOT NULL,
  nro_documento VARCHAR(10) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL,
  CONSTRAINT pk_huesped 
      PRIMARY KEY (id_huesped),
  CONSTRAINT u_email 
      UNIQUE(email),
  CONSTRAINT chk_tpo_documento 
      CHECK (tpo_documento IN ('D', 'P', 'E'))
);

CREATE TABLE reserva
(
  id_reserva SERIAL,
  id_huesped INT NOT NULL,
  id_habitacion INT NOT NULL,
  fecha_checkin DATE NOT NULL,
  fecha_checkout DATE NOT NULL,
  estado CHAR(1) NOT NULL,
  CONSTRAINT pk_reserva 
      PRIMARY KEY (id_reserva),
  CONSTRAINT fk_huesped
      FOREIGN KEY (id_huesped)
      REFERENCES huesped (id_huesped)
      ON UPDATE CASCADE
      ON DELETE RESTRICT,
  CONSTRAINT fk_habitacion
      FOREIGN KEY (id_habitacion)
      REFERENCES habitacion (id_habitacion)
      ON UPDATE CASCADE
      ON DELETE RESTRICT,
  CONSTRAINT chk_fechas 
      CHECK (fecha_checkout > fecha_checkin)
);

-- TABLA DEPARTAMENTO
CREATE TABLE departamento 
(
    id_departamento SERIAL,
    nombre VARCHAR(20) NOT NULL,
    CONSTRAINT pk_departamento PRIMARY KEY (id_departamento)
);

-- TABLA EMPLEADO
CREATE TABLE empleado  
(
    id_empleado SERIAL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_departamento INT NOT NULL,
    CONSTRAINT pk_empleado PRIMARY KEY (id_empleado),
    CONSTRAINT empleado_email UNIQUE(email),
    CONSTRAINT fk_departamento_empleado
        FOREIGN KEY (id_departamento)
        REFERENCES departamento (id_departamento)
        ON UPDATE CASCADE
        ON DELETE SET RESTRICT
);

-- TABLA TURNO_TRABAJO
CREATE TABLE turno_trabajo
(
    id_turno SERIAL,
    nombre VARCHAR(30) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    CONSTRAINT pk_turno PRIMARY KEY (id_turno),
    CONSTRAINT chk_tiempo CHECK (hora_fin > hora_inicio AND (hora_fin - hora_inicio) <= '08:00:00'::INTERVAL)
);

-- TABLA ASIGNACION_TRABAJO
CREATE TABLE asignacion_turno
(
    id_asignacion SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    id_empleado INT NOT NULL,
    id_turno_trabajo INT NOT NULL,
    CONSTRAINT fk_empleado
        FOREIGN KEY (id_empleado)
        REFERENCES empleado (id_empleado)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_turno_trabajo
        FOREIGN KEY (id_turno_trabajo)
        REFERENCES turno_trabajo (id_turno)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- SOLICITUD DE MANTENIMIENTO
CREATE TABLE solicitud_mantenimiento
(
    id_solicitud SERIAL,
    falla_descripcion VARCHAR(255) NOT NULL,
    fecha_reporte TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado CHAR(1) NOT NULL,
    id_habitacion INT NOT NULL,
    id_empleado_reporta INT NOT NULL,

    CONSTRAINT pk_solicitud_mantenimiento
        PRIMARY KEY (id_solicitud),
    CONSTRAINT fk_solicitud_habitacion
        FOREIGN KEY (id_habitacion)
        REFERENCES habitacion (id_habitacion)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_solicitud_empleado
        FOREIGN KEY (id_empleado_reporta)
        REFERENCES empleado (id_empleado)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT chk_estado_solicitud
        CHECK (estado IN ('P', 'E', 'R'))
);


-- PAGO
CREATE TABLE pago
(
    id_pago SERIAL,
    id_reserva INT NOT NULL,
    monto NUMERIC(10,2) NOT NULL,
    fecha_pago TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    metodo_pago VARCHAR(20) NOT NULL,
    estado CHAR(1) NOT NULL DEFAULT 'P',
    CONSTRAINT pk_pago 
        PRIMARY KEY (id_pago),
    CONSTRAINT fk_pago_reserva
        FOREIGN KEY (id_reserva)
        REFERENCES reserva (id_reserva)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT chk_monto_pago 
        CHECK (monto > 0),
    CONSTRAINT chk_metodo_pago 
        CHECK (metodo_pago IN ('EFECTIVO', 'TARJETA', 'TRANSFERENCIA', 'YAPE')),
    CONSTRAINT chk_estado_pago 
        CHECK (estado IN ('P', 'C', 'A'))
);


-- COMPROBANTE DE PAGO
CREATE TABLE comprobante_pago
(
    id_comprobante SERIAL,
    tipo_comprobante CHAR(1) NOT NULL,
    nro_serie VARCHAR(10) NOT NULL,
    fecha_emision TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    subtotal NUMERIC(10,2) NOT NULL,
    impuestos NUMERIC(10,2) NOT NULL,
    id_pago INT NOT NULL,

    CONSTRAINT pk_comprobante_pago
        PRIMARY KEY (id_comprobante),
    CONSTRAINT fk_comprobante_pago
        FOREIGN KEY (id_pago)
        REFERENCES pago (id_pago)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT chk_importes_comprobante
        CHECK (subtotal >= 0 AND impuestos >= 0),
    CONSTRAINT u_comprobante_serie
        UNIQUE (tipo_comprobante, nro_serie)
);


-- RESEÑA
CREATE TABLE resena
(
    id_resena SERIAL,
    puntuacion INT NOT NULL,
    comentario VARCHAR(500),
    fecha_resena TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_huesped INT NOT NULL,
    id_reserva INT NOT NULL,

    CONSTRAINT pk_resena
        PRIMARY KEY (id_resena),
    CONSTRAINT fk_resena_huesped
        FOREIGN KEY (id_huesped)
        REFERENCES huesped (id_huesped)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_resena_reserva
        FOREIGN KEY (id_reserva)
        REFERENCES reserva (id_reserva)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT chk_puntuacion_resena
        CHECK (puntuacion BETWEEN 1 AND 5)
);


-- ENCUESTA DE SATISFACCION
CREATE TABLE encuesta_satisfaccion
(
    id_encuesta SERIAL,
    nivel_satisfaccion CHAR(1) NOT NULL,
    comentarios_mejora VARCHAR(500),
    fecha_envio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_huesped INT NOT NULL,

    CONSTRAINT pk_encuesta_satisfaccion
        PRIMARY KEY (id_encuesta),
    CONSTRAINT fk_encuesta_huesped
        FOREIGN KEY (id_huesped)
        REFERENCES huesped (id_huesped)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT chk_nivel_satisfaccion
        CHECK (nivel_satisfaccion IN ('1', '2', '3', '4', '5'))
);


-- PROVEEDOR
CREATE TABLE proveedor
(
    id_proveedor SERIAL,
    razon_social VARCHAR(100) NOT NULL,
    ruc_nit VARCHAR(20) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) NOT NULL,

    CONSTRAINT pk_proveedor
        PRIMARY KEY (id_proveedor),
    CONSTRAINT u_proveedor_ruc
        UNIQUE (ruc_nit),
    CONSTRAINT u_proveedor_correo
        UNIQUE (correo)
);


-- INVENTARIO DE INSUMOS
CREATE TABLE inventario_insumo
(
    id_insumo SERIAL,
    nombre VARCHAR(100) NOT NULL,
    unidad_medida VARCHAR (5) NOT NULL,
    stock_actual INT NOT NULL DEFAULT 0,
    stock_minimo INT NOT NULL DEFAULT 0,
    id_proveedor INT NOT NULL,

    CONSTRAINT pk_inventario_insumo
        PRIMARY KEY (id_insumo),
    CONSTRAINT fk_insumo_proveedor
        FOREIGN KEY (id_proveedor)
        REFERENCES proveedor (id_proveedor)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT chk_stock_insumo
        CHECK (stock_actual >= 0 AND stock_minimo >= 0)
);



-- ORDEN DE TRABAJO
CREATE TABLE orden_trabajo
(
    id_orden SERIAL,
    fecha_inicio DATE NOT NULL,
    fecha_fin TIMESTAMP,
    observaciones VARCHAR(255),
    id_solicitud INT NOT NULL,
    id_empleado_responsable INT NOT NULL,
    id_insumo INT,
    CONSTRAINT pk_orden_trabajo
        PRIMARY KEY (id_orden),
    CONSTRAINT fk_orden_solicitud
        FOREIGN KEY (id_solicitud)
        REFERENCES solicitud_mantenimiento (id_solicitud)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_orden_empleado
        FOREIGN KEY (id_empleado_responsable)
        REFERENCES empleado (id_empleado)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT fk_orden_insumo
        FOREIGN KEY (id_insumo)
        REFERENCES inventario_insumo (id_insumo)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT chk_fechas_orden
        CHECK (
            fecha_fin IS NULL
            OR fecha_fin >= fecha_inicio
        )
);
