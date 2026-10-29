
CREATE TABLE habitacion 
(
  id_habitacion SERIAL, 
  numero VARCHAR(5) NOT NULL,
  estado CHAR(1) NOT NULL,
  CONSTRAINT pk_habitacion PRIMARY KEY (id_habitacion),
  CONSTRAINT u_numero UNIQUE(numero),
  CONSTRAINT chk_estado CHECK (estado IN ('D', 'O', 'M', 'L'))
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
  CONSTRAINT pk_huesped PRIMARY KEY (id_huesped),
  CONSTRAINT u_email UNIQUE(email),
  CONSTRAINT chk_tpo_documento CHECK (tpo_documento IN ('D', 'P', 'E'))
);

CREATE TABLE reserva
(
  id_reserva SERIAL,
  id_huesped INT NOT NULL,
  id_habitacion INT NOT NULL,
  fecha_checkin DATE NOT NULL,
  fecha_checkout DATE NOT NULL,
  estado CHAR(1) NOT NULL,
  CONSTRAINT pk_reserva PRIMARY KEY (id_reserva),
  CONSTRAINT fk_huesped FOREIGN KEY (id_huesped) REFERENCES huesped (id_huesped),
  CONSTRAINT fk_habitacion FOREIGN KEY (id_habitacion) REFERENCES habitacion (id_habitacion),
  CONSTRAINT chk_fechas CHECK (fecha_checkout > fecha_checkin)
);

#TABLA DEPARTAMENTO
CREATE TABLE departamento 
(
    id_departamento SERIAL,
    nombre VARCHAR(20) NOT NULL,
    CONSTRAINT pk_departamento PRIMARY KEY (id_departamento)
);

#TABLA EMPLEADO
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
);

#TABLA TURNO_TRABAJO
CREATE TABLE turno_trabajo
(
    id_turno SERIAL,
    nombre VARCHAR(20) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    CONSTRAINT pk_turno PRIMARY KEY (id_turno),
    CONSTRAINT chk_tiempo CHECK (hora_fin > hora_inicio AND (hora_fin - hora_inicio) <= '08:00:00'::INTERVAL)
);

#TABLA ASIGNACION_TRABAJO
CREATE TABLE asignacion_turno
(
    id_asignacion SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    id_empleado INT NOT NULL,
    id_turno_trabajo INT NOT NULL,
    CONSTRAINT fk_empleado
        FOREIGN KEY (id_empleado)
        REFERENCES empleado (id_empleado),
    CONSTRAINT fk_turno_trabajo
        FOREIGN KEY (id_turno_trabajo)
        REFERENCES turno_trabajo (id_turno)
);
