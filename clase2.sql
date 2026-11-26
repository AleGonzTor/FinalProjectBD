--CREAR VALORES
INSERT INTO departamento (nombre)
VALUES
    ('Limpieza'),
    ('Atencion al Cliente'),
    ('Cocina'),
    ('Servicio'),
    ('Topico');
--ACTUALIZAR VALORES
UPDATE departamento
SET nombre = 'Gerente'
WHERE id_departamento = 5;

INSERT INTO turno_trabajo (nombre, hora_inicio, hora_fin)
VALUES
    ('Mañana', '06:00:00', '14:00:00'),
    ('Mañana Medio Tiempo', '06:00:00', '10:00:00'),
    ('Mañana Medio Tiempo 2', '10:00:00', '14:00:00'),
    ('Tarde', '14:00:00', '22:00:00'),
    ('Tarde Medio Tiempo', '14:00:00', '18:00:00'),
    ('Tarde Medio Tiempo 2', '18:00:00', '22:00:00'),
    ('Cierre Dia', '22:00:00', '24:00:00'),
    ('Inicio dia', '00:00:00', '06:00:00');
--ACTUALIZAR VALORES
UPDATE turno_trabajo
SET hora_inicio = '08:00:00'
WHERE id_turno = 1;



INSERT INTO empleado(nombre, apellido, email, telefono, telefono_trabajo, fecha_nacimiento, id_departamento)
VALUES
    ('Rigoberto', 'Nuñez', 'obed_nuñez@gmail.com', '+51 934324153', '+51 942120442', '2002-10-24', 1),
    ('Shounni', 'Nuzzi', 'shou_nuz@gmail.com', '+51 934248153', '+51 942643242', '2003-04-01',4),
    ('Samuel', 'Luque', 'samuel_luque@gmail.com', '+53 32144125', '+51 949372615', '2006-11-12',2),
    ('Dassi', 'Cris', 'dassi_cris@gmail.com', '+51 912434178', '+51 912746491', '1997-12-08',3),
    ('Smith', 'Lopez', 'slopez@gmail.com', '+51 978608647', '+51 917592625', '2000-01-20',5);
--ACTUALIZAR VALORES 
UPDATE empleado
SET telefono  = '+51 917570308'
WHERE id_empleado = 3;
UPDATE empleado
SET id_departamento  = 2
WHERE id_empleado = 1;


INSERT INTO asignacion_turno (fecha, id_empleado, id_turno_trabajo)
VALUES
    ('2024-12-25', 3, 4),
    ('2024-11-20', 4, 3),
    ('2025-05-01', 5, 7),
    ('2026-01-12', 1, 8),
    ('2025-03-24', 2, 6);
--ACTUALIZAR VALORES
UPDATE asignacion_turno
SET id_turno_trabajo = 1
WHERE id_asignacion = 4;


INSERT INTO habitacion(numero, estado) 
VALUES 
    ('A1', 'D'),
    ('A2', 'D'),
    ('D1', 'D'),
    ('A3', 'D'),
    ('B1', 'D');

INSERT INTO huesped(nombre, apellido, tpo_documento, nro_documento, telefono, email) 
VALUES 
    ('Alejandro', 'Gonzales', 'D', '72121003', '+51900568351', 'alegonzales20022005@gmail.com'),
    ('Ismael', 'Diaz', 'D', '88888888', '+51900000000', 'ismael.diaz@ucsp.edu.pe'),
    ('Alejandro', 'Pastor', 'D', '71111111', '+51900000002', 'alejandro.pastor@ucsp.edu.pe'),
    ('Carlos', 'Diaz', 'D', '72222222', '+51911111111', 'carlos.diaz.mamani@ucsp.edu.pe'),
    ('Projoy', 'Barua', 'P', 'L12345678', '+33750514435', 'projoy.barua@ucsp.edu.pe');

INSERT INTO reserva(id_huesped, id_habitacion, fecha_checkin, fecha_checkout, estado)
VALUES
    (1, 1, '2027-01-10', '2027-01-20', 'F'),
    (2, 2, '2027-01-14', '2027-01-18', 'F'),
    (3, 3, '2027-01-19', '2027-01-22', 'F'),
    (4, 4, '2027-02-1', '2027-02-20', 'F'),
    (5, 5, '2027-02-12', '2027-02-15', 'F');

INSERT INTO pago (id_reserva, monto, metodo_pago, estado)
VALUES
    (1, 500.00, 'TARJETA', 'C'),
    (2, 320.00, 'YAPE', 'C'),
    (3, 240.00, 'EFECTIVO', 'C'),
    (4, 950.00, 'TRANSFERENCIA', 'P'),
    (5, 210.00, 'TARJETA', 'C');

INSERT INTO proveedor (razon_social, ruc_nit, telefono, correo)
VALUES
    ('Suministros del Sur SAC', '20541236981', '+51 954111222', 'ventas@suministrosdelsur.pe'),
    ('Limpieza y Hogar EIRL', '20601928374', '+51 954333444', 'contacto@limpiezahogar.pe');

INSERT INTO inventario_insumo (nombre, unidad_medida, stock_actual, stock_minimo, id_proveedor)
VALUES
    ('Lejia Industrial', 'LT', 25.00, 10.00, 2),
    ('Sabanas de Algodon', 'UND', 40.00, 15.00, 1);


INSERT INTO comprobante_pago
(tipo_comprobante, nro_serie, subtotal, impuestos, id_pago)
VALUES
    ('B', 'B001-00001', 423.73, 76.27, 1),
    ('B', 'B001-00002', 271.19, 48.81, 2),
    ('F', 'F001-00001', 203.39, 36.61, 3),
    ('F', 'F001-00002', 805.08, 144.92, 4),
    ('B', 'B001-00003', 177.97, 32.03, 5);


INSERT INTO resena
(puntuacion, comentario, id_huesped, id_reserva)
VALUES
    (5, 'Excelente servicio y atencion.', 1, 1),
    (4, 'Habitacion comoda y buen servicio.', 2, 2),
    (5, 'Muy buena experiencia.', 3, 3),
    (3, 'La atencion podria mejorar.', 4, 4),
    (4, 'Instalaciones agradables.', 5, 5);

INSERT INTO encuesta_satisfaccion
(nivel_satisfaccion, comentarios_mejora, id_huesped)
VALUES
    ('5', 'Excelente servicio.', 1),
    ('4', 'Mejorar la rapidez de atencion.', 2),
    ('5', 'Muy buenas instalaciones.', 3),
    ('3', 'Mejorar el servicio de limpieza.', 4),
    ('4', 'Buena experiencia en general.', 5);


INSERT INTO solicitud_mantenimiento
(falla_descripcion, estado, id_habitacion, id_empleado_reporta)
VALUES
    ('Fuga de agua en el bano.', 'P', 1, 1),
    ('Aire acondicionado averiado.', 'E', 2, 2),
    ('Foco de habitacion averiado.', 'R', 3, 3),
    ('Problema con la cerradura.', 'P', 4, 4),
    ('Baja presion de agua en ducha.', 'E', 5, 5);


INSERT INTO orden_trabajo
(fecha_inicio, fecha_fin, observaciones,
 id_solicitud, id_empleado_responsable, id_insumo)
VALUES
    ('2026-11-10', NULL, 'Revision de tuberias.',
     1, 1, 1),

    ('2026-11-11', NULL, 'Reparacion del aire acondicionado.',
     2, 2, 2),

    ('2026-11-12', '2026-11-12 11:30:00', 'Cambio de foco.',
     3, 3, 2),

    ('2026-11-13', NULL, 'Revision de cerradura.',
     4, 4, NULL),

    ('2026-11-14', NULL, 'Revision de ducha y tuberias.',
     5, 5, 1);
