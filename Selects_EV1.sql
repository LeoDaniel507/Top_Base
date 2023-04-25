/*Listado de unidades*/
SELECT * FROM UNIDAD
ORDER BY CATEGORIA_ID_CATEGORIA ASC;


/*Listado de operadores en activo*/
SELECT * FROM OPERADOR 
WHERE ACTIVO = 'S' 
ORDER BY APELLIDO ASC;

select * from operador;

UPDATE operador
SET activo = 'N'
WHERE id_operador IN (1, 3, 5, 10);

/*Listado de trayectos iniciados y concluídos en una locación específica para un rango de fechas a indicar*/

SELECT t.id_trayecto, u.modelo, t.fecha_hora_salida, t.fecha_hora_llegada, l.nombre as loc_salida, l2.nombre as loc_destino
FROM trayecto t
JOIN unidad u ON t.id_unidad = u.id_unidad
JOIN locacion l ON t.id_locacion_salida = l.id_locacion
JOIN locacion l2 ON t.id_locacion_destino = l2.id_locacion
WHERE (t.fecha_hora_salida BETWEEN '2023-03-05 10:00:00' AND '2023-03-05 20:00:00')
AND l.nombre = 'MONTERREY';


/*istado de trayectos en curso*/
SELECT id_trayecto, id_unidad, fecha_hora_salida, fecha_hora_llegada, estatus_viaje FROM TRAYECTO
WHERE estatus_viaje = 'EN CURSO';


/*Listado de unidades ordenado por la cantidad de trayectos realizados*/
SELECT u.id_unidad, u.modelo, u.placa, COUNT(t.id_trayecto) AS cantidad_trayectos
FROM unidad u
LEFT JOIN trayecto t ON u.id_unidad = t.id_unidad
GROUP BY u.id_unidad, u.modelo, u.placa
ORDER BY cantidad_trayectos DESC;

select * from unidad;

select * from trayecto;

/*Registro de boletos vendidos*/

ALTER TABLE Categoria ADD Boletos_Disponibles INT DEFAULT 250;

DELIMITER //
CREATE PROCEDURE restar_boletos(IN id_categoria_param INT, IN cantidad INT)
BEGIN
    DECLARE disponibles INT;
    SELECT boletos_disponibles INTO disponibles FROM categoria WHERE id_categoria = id_categoria_param;
    IF disponibles >= cantidad THEN
        UPDATE categoria SET boletos_disponibles = boletos_disponibles - cantidad WHERE id_categoria = id_categoria_param;
    ELSE
        UPDATE categoria SET boletos_disponibles = 0 WHERE id_categoria = id_categoria_param;
    END IF;
END //
DELIMITER ;

CALL restar_boletos(3, 9);


