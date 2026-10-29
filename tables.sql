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
