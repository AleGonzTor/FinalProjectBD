from fastapi import FastAPI
import psycopg

app = FastAPI()

database = "hotel"
admin = "alej"

@app.post("/reserva")
def reserva():
    with psycopg.connect(dbname = database, user = admin) as db:
        with db.cursor() as sql:
            sql.execute("""
                WITH reserva AS (
                    INSERT INTO reserva
                        (id_huesped, id_habitacion, fecha_checkin,
                         fecha_checkout, estado)
                    VALUES
                        (3, 3, DATE '2027-03-10',
                         DATE '2027-03-12', 'F')
                    RETURNING id_reserva
                ),
                pago AS (
                    INSERT INTO pago (id_reserva, monto, metodo_pago, estado)
                    SELECT id_reserva, 300, 'YAPE', 'C'
                    FROM reserva
                    RETURNING id_pago
                )
                INSERT INTO comprobante_pago
                    (tipo_comprobante, nro_serie, subtotal, impuestos, id_pago)
                SELECT 'B', 'B001-00006', 254.24, 45.76, id_pago
                FROM pago
                RETURNING id_comprobante
            """)
            comprobante = sql.fetchone()[0]

    return {"comprobante": comprobante}
