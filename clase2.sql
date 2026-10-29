--CREAR VALORES
INSERT INTO departamento (nombre)
VALUES
    ('Limpieza'),
    ('Atencion al Cliente'),
    ('Cocina'),
    ('Servicio'),
    ('Topico');

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

INSERT INTO empleado(nombre, apellido, email, telefono, fecha_nacimiento, id_departamento)
VALUES
    ('Rigoberto', 'Nuñez', 'obed_nuñez@gmail.com', '+51 934324153', '2002-10-24', 1),
    ('Shounni', 'Nuzzi', 'shou_nuz@gmail.com', '+51 934248153', '2003-04-01',4),
    ('Samuel', 'Luque', 'samuel_luque@gmail.com', '+53 32144125', '2006-11-12',2),
    ('Dassi', 'Cris', 'dassi_cris@gmail.com', '+51 912434178', '1997-12-08',3),
    ('Smith', 'Lopez', 'slopez@gmail.com', '+51 978608647', '2000-01-20',5);

INSERT INTO asignacion_turno (fecha, id_empleado, id_turno_trabajo)
VALUES
    ('2024-12-25', 3, 4),
    ('2024-11-20', 4, 3),
    ('2025-05-01', 5, 7),
    ('2026-01-12', 1, 8),
    ('2025-03-24', 2, 6);

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

INSERT INTO comprobante_pago (tipo_comprobante, nro_serie,
	fecha_emision, subtotal, impuestos, id_pago)
VALUES
	('B', 'ABOPE1345', '2026-10-11',
	121.12, 1.21, 455),
	('F', 'SQWDE1345', '2026-10-23',
	1222.12, 1.21, 456),
	('B', 'ABNMF1345', '2026-10-12',
	140.12, 1.21, 457),
	('F', 'YUCKGE1345', '2026-10-09',
	127.12, 1.21, 458),
	('B', 'LZXCE1345', '2026-10-21',
	112.12, 1.21, 459);

-- SELECT * FROM comprobante_pago;

INSERT INTO resena (puntuacion, comentario,
	fecha_resena, id_huesped, id_reserva)
VALUES
	(2, 'No me gustó', '2026-10-01', 100, 200),
	(4, 'Me gustó', '2026-10-02', 101, 200),
	(2, 'No me gustó', '2026-10-03', 102, 200),
	(5, 'Me gustó', '2026-10-04', 103, 200),
	(1, 'No me gustó', '2026-10-05', 104, 200);

select * from resena;

	