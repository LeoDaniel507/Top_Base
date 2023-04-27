SHOW DATABASES;
USE evidencia_3;

INSERT INTO locacion (id_locacion, nombre)
VALUES
(1, 'Ciudad de México'),
(2, 'Guadalajara'),
(3, 'Monterrey'),
(4, 'Puebla'),
(5, 'Tijuana'),
(6, 'León'),
(7, 'Mérida'),
(8, 'Cancún'),
(9, 'Toluca'),
(10, 'Villahermosa'),
(11, 'Aguascalientes'),
(12, 'Chihuahua'),
(13, 'Cuernavaca'),
(14, 'Hermosillo'),
(15, 'Querétaro'),
(16, 'San Luis Potosí'),
(17, 'Zacatecas'),
(18, 'Acapulco'),
(19, 'Ensenada'),
(20, 'La Paz');

INSERT INTO categoria (id_categoria, nombre_categoria, capacidad_maxima)
VALUES
(1, 'Básico', 40),
(2, 'Comfort', 65),
(3, 'De lujo', 100);


INSERT INTO unidad (id_unidad, modelo, placa, activo, CATEGORIA_id_categoria)
VALUES
(1, 'Sedán', 'ABC-123', 'S', 1),
(2, 'SUV', 'DEF-456', 'S', 2),
(3, 'Pickup', 'GHI-789', 'S', 1),
(4, 'Sedán', 'JKL-012', 'S', 3),
(5, 'SUV', 'MNO-345', 'S', 2),
(6, 'Pickup', 'PQR-678', 'S', 1),
(7, 'Sedán', 'STU-901', 'S', 1),
(8, 'SUV', 'VWX-234', 'S', 2),
(9, 'Pickup', 'YZA-567', 'S', 1),
(10, 'Sedán', 'BCD-890', 'S', 3);



INSERT INTO operador (id_operador, apellido, nombre, fecha_nacimiento, fecha_ingreso, nss, activo)
VALUES
(1, 'García', 'Juan', '1990-05-21', '2010-01-01', '123456789', 'S'),
(2, 'Pérez', 'María', '1985-10-12', '2012-03-15', '987654321', 'S'),
(3, 'Martínez', 'Pedro', '1992-07-03', '2014-06-20', '246813579', 'S'),
(4, 'Rodríguez', 'Laura', '1998-02-14', '2016-09-05', '135792468', 'S'),
(5, 'González', 'Lucas', '1987-12-30', '2017-11-11', '468135792', 'S'),
(6, 'Fernández', 'Ana', '1995-04-18', '2018-08-01', '579246813', 'S'),
(7, 'López', 'Javier', '1989-09-08', '2019-05-25', '321987654', 'S'),
(8, 'Sánchez', 'Sofía', '1993-06-27', '2020-02-14', '987321654', 'S'),
(9, 'Hernández', 'Diego', '1991-03-16', '2021-01-01', '456789123', 'S'),
(10, 'Díaz', 'Carolina', '1997-08-02', '2022-02-20', '789456123', 'S');

INSERT INTO trayecto (id_trayecto, id_unidad, fecha_hora_salida, fecha_hora_llegada, id_locacion_salida, id_locacion_destino, id_operador, id_asistente, estatus_viaje,boletos_vendidos) VALUES
(1, 3, '2023-03-05 08:00:00', '2023-03-05 09:30:00', 2, 4, 5, 6, 'COMPLETADO', 39), /*40*/
(2, 4, '2023-03-05 10:00:00', '2023-03-05 12:00:00', 1, 3, 6, 7, 'COMPLETADO',90), /*100*/
(3, 2, '2023-03-05 13:00:00', '2023-03-05 15:00:00', 5, 1, 7, 8, 'PENDIENTE',0), /*65*/
(4, 1, '2023-03-05 16:00:00', '2023-03-05 18:00:00', 3, 2, 8, 9, 'PENDIENTE',0), /*40*/
(5, 3, '2023-03-06 09:00:00', '2023-03-06 10:30:00', 2, 4, 5, 6, 'COMPLETADO',35), /*40*/
(6, 4, '2023-03-06 11:00:00', '2023-03-06 13:00:00', 1, 3, 6, 7, 'COMPLETADO',87), /*100*/
(7, 2, '2023-03-06 14:00:00', '2023-03-06 16:00:00', 5, 1, 7, 8, 'EN CURSO',55), /*65*/
(8, 1, '2023-03-06 17:00:00', '2023-03-06 19:00:00', 3, 2, 8, 9, 'EN CURSO',30), /*40*/
(9, 3, '2023-03-07 08:00:00', '2023-03-07 09:30:00', 2, 4, 5, 6, 'COMPLETADO',37), /*40*/
(10, 4, '2023-03-07 10:00:00', '2023-03-07 12:00:00', 1, 3, 6, 7, 'EN CURSO',79); /*100*/
