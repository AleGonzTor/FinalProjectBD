#TABLA DEPARTAMENTO
CREATE TABLE departamento 
(
    id_departamento INT AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    CONSTRAINT pk_departamento PRIMARY KEY (id_departamento)
);

#TABLA EMPLEADO
CREATE TABLE empleado  
(
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR (100) NOT NULL,
    telefono VARCHAR (20) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_departamento INT NOT NULL,
    CONSTRAINT empleado_email UNIQUE(email),
    CONSTRAINT fk_departamento_empleado
        FOREIGN KEY (id_departamento)
        REFERENCES departamento (id_departamento)
);
