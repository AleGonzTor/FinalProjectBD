WITH nueva_solicitud AS (
    INSERT INTO solicitud_mantenimiento (
        falla_descripcion,
        estado,
        id_habitacion,
        id_empleado_reporta
    )
    VALUES (
        'Fuga de agua en el lavamanos',
        'P',
        1,
        1
    )
    RETURNING id_solicitud
)

INSERT INTO orden_trabajo (
    fecha_inicio,
    observaciones,
    id_solicitud,
    id_empleado_responsable,
    id_insumo
)
SELECT
    CURRENT_DATE,
    'Revisar tuberia y reparar fuga',
    id_solicitud,
    2,
    1
FROM nueva_solicitud

RETURNING id_orden, id_solicitud;


WITH solicitud_actualizada AS (
    UPDATE solicitud_mantenimiento
    SET estado = 'E'
    WHERE id_solicitud = 6
    RETURNING id_solicitud
)

UPDATE orden_trabajo
SET
    id_empleado_responsable = 3,
    observaciones = 'Reparacion de fuga en proceso'
FROM solicitud_actualizada
WHERE orden_trabajo.id_solicitud =
      solicitud_actualizada.id_solicitud

RETURNING
    orden_trabajo.id_orden,
    orden_trabajo.id_solicitud,
    orden_trabajo.id_empleado_responsable,
    orden_trabajo.observaciones;


WITH reserva_creada AS (
    INSERT INTO reserva (
        id_huesped,
        id_habitacion,
        fecha_checkin,
        fecha_checkout,
        estado
    )
    SELECT
        h.id_huesped,
        hab.id_habitacion,
        DATE '2027-03-10',
        DATE '2027-03-12',
        'F'
    FROM huesped h
    CROSS JOIN habitacion hab
    WHERE h.id_huesped = 3
      AND hab.id_habitacion = 3
      AND NOT EXISTS (
          SELECT 1
          FROM reserva r
          WHERE r.id_habitacion = hab.id_habitacion
            AND r.fecha_checkin < DATE '2027-03-12'
            AND r.fecha_checkout > DATE '2027-03-10'
      )
    RETURNING id_reserva
),

pago_creado AS (
    INSERT INTO pago (
        id_reserva,
        monto,
        metodo_pago,
        estado
    )
    SELECT
        id_reserva,
        300.00,
        'YAPE',
        'C'
    FROM reserva_creada
    RETURNING id_pago, id_reserva
)

INSERT INTO comprobante_pago (
    tipo_comprobante,
    nro_serie,
    subtotal,
    impuestos,
    id_pago
)
SELECT
    'B',
    'B001-00006',
    254.24,
    45.76,
    id_pago
FROM pago_creado

RETURNING
    id_comprobante,
    tipo_comprobante,
    nro_serie,
    id_pago;
