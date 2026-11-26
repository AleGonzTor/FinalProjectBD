
SELECT
    p.metodo_pago,
    COUNT(p.id_pago) AS cantidad_pagos,
    COUNT(DISTINCT r.id_reserva) AS cantidad_reservas,
    COUNT(DISTINCT h.id_huesped) AS cantidad_huespedes,

    COALESCE(
        SUM(p.monto) FILTER (WHERE p.estado = 'C'),
        0
    ) AS total_recaudado,

    COALESCE(
        SUM(p.monto) FILTER (WHERE p.estado = 'P'),
        0
    ) AS total_pendiente,

    COALESCE(
        SUM(p.monto) FILTER (WHERE p.estado = 'A'),
        0
    ) AS total_anulado

FROM pago p
INNER JOIN reserva r
    ON p.id_reserva = r.id_reserva
INNER JOIN huesped h
    ON r.id_huesped = h.id_huesped

GROUP BY p.metodo_pago

HAVING COALESCE(
    SUM(p.monto) FILTER (WHERE p.estado = 'C'),
    0
) > 0

ORDER BY total_recaudado DESC;
