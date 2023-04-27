SHOW DATABASES;
USE evidencia_3;

/*CONSULTA 1: Listado de unidades*/
SELECT * FROM UNIDAD
ORDER BY CATEGORIA_ID_CATEGORIA ASC;

/*CONSULTA 2: Listado de operadores en activo*/
SELECT * FROM OPERADOR
WHERE ACTIVO = 'S'
ORDER BY APELLIDO ASC;

/*CONSULTA 3:  Listado de trayectos iniciados y concluídos en una locación específica para un rango
de fechas a indicar*/
SELECT t.id_trayecto, u.modelo, t.fecha_hora_salida, t.fecha_hora_llegada, l.nombre as
loc_salida, l2.nombre as loc_destino
FROM trayecto t
JOIN unidad u ON t.id_unidad = u.id_unidad
JOIN locacion l ON t.id_locacion_salida = l.id_locacion
JOIN locacion l2 ON t.id_locacion_destino = l2.id_locacion
WHERE (t.fecha_hora_salida BETWEEN '2023-03-05 10:00:00' AND '2023-03-05 20:00:00')
AND l.nombre = 'MONTERREY';

/*CONSULTA 4: Listado de trayectos en curso*/
SELECT id_trayecto, id_unidad, fecha_hora_salida, fecha_hora_llegada, estatus_viaje FROM
TRAYECTO
WHERE estatus_viaje = 'EN CURSO';

/*CONSULTA 5: Listado de unidades ordenado por la cantidad de trayectos realizados*/
SELECT u.id_unidad, u.modelo, u.placa, COUNT(t.id_trayecto) AS cantidad_trayectos
FROM unidad u
LEFT JOIN trayecto t ON u.id_unidad = t.id_unidad
GROUP BY u.id_unidad, u.modelo, u.placa
ORDER BY cantidad_trayectos DESC;

/*CONSULTA 6: Listado de operadores que ingresaron en un rango de fechas a indicar*/
SELECT id_operador,nombre,fecha_ingreso from operador 
where (fecha_ingreso > '2019-12-31' and fecha_ingreso < '2022-12-31');

/*CONSULTA 7: Trayectos iniciados y concluídos para un rango de fechas*/
SELECT id_trayecto, id_unidad, fecha_hora_salida, fecha_hora_llegada, estatus_viaje 
FROM trayecto
WHERE estatus_viaje IN ('EN CURSO', 'COMPLETADO')
AND fecha_hora_salida >= '2023-03-04 00:00:00'
AND fecha_hora_llegada <= '2023-03-06 00:00:00';


/*PROCEDIMIENTO ALMACENADO*/
DELIMITER //
CREATE PROCEDURE venta_boletos(IN i_trayecto INT,IN i_cantidad INT)
BEGIN
    DECLARE ventas INT;
    DECLARE estado_unidad varchar(45);
    DECLARE r_unidad INT;
	DECLARE r_categoria INT;
    DECLARE capacidad_unidad INT;
    
    SELECT boletos_vendidos INTO ventas FROM trayecto WHERE id_trayecto = i_trayecto;
    SELECT estatus_viaje INTO estado_unidad FROM trayecto WHERE id_trayecto = i_trayecto;
    
    IF estado_unidad = 'PENDIENTE' THEN
		SELECT id_unidad INTO r_unidad FROM trayecto WHERE id_trayecto = i_trayecto;
        SELECT CATEGORIA_id_categoria INTO r_categoria FROM unidad WHERE id_unidad = r_unidad;
        SELECT capacidad_maxima INTO capacidad_unidad FROM categoria WHERE id_categoria = r_categoria;
        
        IF (ventas + i_cantidad) <= capacidad_unidad THEN
			UPDATE trayecto SET boletos_vendidos = boletos_vendidos + i_cantidad WHERE id_trayecto = i_trayecto;
		ELSE
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficientes asientos disponibles';
		END IF;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Trayecto no disponible';
	END IF;
END //
DELIMITER ;

CALL venta_boletos(4,40);