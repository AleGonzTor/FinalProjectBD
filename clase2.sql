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
