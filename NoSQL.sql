--CREAMOS EL ARCHIVO JSON PARA LA TABLA orden_trabajo
ALTER TABLE orden_trabajo
ADD COLUMN detalle_ejecucion JSONB;

UPDATE orden_trabajo
SET detalle_ejecucion = '{
  "tipo_falla" : "plomeria",
    "zona": "lavamanos",
    "diagnostico": "Revision y reparacion de fuga de agua",
    "requiere_insumo": true,
    "prioridad": "alta"
}'
WHERE id_empleado_responsable = 1;

UPDATE orden_trabajo
SET detalle_ejecucion = '{
  "tipo_falla" : "electrico",
    "zona": "aire acondicionado",
    "diagnostico": "Revision y reparacion del aire acondicionado",
    "requiere_insumo": true,
    "prioridad": "media"
}'
WHERE id_empleado_responsable = 2;

UPDATE orden_trabajo
SET detalle_ejecucion = '{
  "tipo_falla" : "electrico",
    "zona": "foco",
    "diagnostico": "Cambio de foco",
    "requiere_insumo": true,
    "prioridad": "baja"
}'
WHERE id_empleado_responsable = 3;

UPDATE orden_trabajo
SET detalle_ejecucion = '{
  "tipo_falla" : "cerradura",
    "zona": "puerta",
    "diagnostico": "Cambio de cerradura",
    "requiere_insumo": true,
    "prioridad": "alta"
}'
WHERE id_empleado_responsable = 4;

UPDATE orden_trabajo
SET detalle_ejecucion = '{
  "tipo_falla" : "plomeria",
    "zona": "ducha",
    "diagnostico": "Revision y reparacion de baja presion de agua",
    "requiere_insumo": false,
    "prioridad": "baja"
}'
WHERE id_empleado_responsable = 5;
