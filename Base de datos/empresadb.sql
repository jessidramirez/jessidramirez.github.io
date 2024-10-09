-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2024 a las 05:56:09
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresadb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `cedula` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `cedula`, `nombre`, `correo`, `telefono`, `direccion`) VALUES
(1, '1100123456', 'Juan Pérez', 'juan.perez@example.com', '123456789', 'Av. Principal 123'),
(2, '2200234567', 'María López', 'maria.lopez@example.com', '987654321', 'Calle Secundaria 456'),
(3, '3300345678', 'Carlos Gómez', 'carlos.gomez@example.com', '1122334455', 'Calle Tercera 789'),
(4, '4400456789', 'Ana Torres', 'ana.torres@example.com', '2233445566', 'Calle Cuarta 111'),
(5, '5500567890', 'Luis Sánchez', 'luis.sanchez@example.com', '3344556677', 'Calle Quinta 222'),
(6, '6600678901', 'Laura Ramírez', 'laura.ramirez@example.com', '4455667788', 'Calle Sexta 333'),
(7, '7700789012', 'Sofía Jiménez', 'sofia.jimenez@example.com', '5566778899', 'Calle Séptima 444'),
(8, '8800890123', 'Diego Fernández', 'diego.fernandez@example.com', '6677889900', 'Calle Octava 555'),
(9, '9900901234', 'Gabriela Ruiz', 'gabriela.ruiz@example.com', '7788990011', 'Calle Novena 666'),
(10, '1011011121', 'Esteban Moreno', 'esteban.moreno@example.com', '8899001122', 'Calle Décima 777'),
(11, '1111111111', 'Patricia Castillo', 'patricia.castillo@example.com', '9988776655', 'Avenida Central 101'),
(12, '2222222222', 'Fernando Vargas', 'fernando.vargas@example.com', '8877665544', 'Boulevard Norte 202'),
(13, '3333333333', 'Martina Ortiz', 'martina.ortiz@example.com', '7766554433', 'Calle Sol 303'),
(14, '4444444444', 'Andrea Paredes', 'andrea.paredes@example.com', '6655443322', 'Avenida Libertad 404'),
(15, '5555555555', 'Javier Delgado', 'javier.delgado@example.com', '5544332211', 'Calle Luna 505'),
(16, '6666666666', 'Claudia León', 'claudia.leon@example.com', '4433221100', 'Calle Estrella 606'),
(17, '7777777777', 'Héctor Campos', 'hector.campos@example.com', '3322110099', 'Avenida del Parque 707'),
(18, '8888888888', 'Mónica Molina', 'monica.molina@example.com', '2211009988', 'Calle Primavera 808'),
(19, '9999999999', 'Rodrigo Gil', 'rodrigo.gil@example.com', '1100998877', 'Calle Invierno 909'),
(20, '1077087474', 'Isabel Díaz', 'isabel.diaz@example.com', '0099887766', 'Calle Verano 1010');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_tecnico` int(11) NOT NULL,
  `servicio` varchar(255) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`id`, `id_cliente`, `id_tecnico`, `servicio`, `fecha`) VALUES
(41, 1, 2, 'Instalación de sistema de seguridad', '2024-09-29'),
(43, 3, 3, 'Instalación de red de fibra óptica', '2024-09-27'),
(46, 6, 1, 'Instalación de sistema de videovigilancia', '2024-09-24'),
(47, 7, 2, 'Reparación de sistema de calefacción', '2024-09-23'),
(48, 8, 3, 'Instalación de sistema de alarma', '2024-09-22'),
(49, 9, 4, 'Reparación de circuito eléctrico', '2024-09-21'),
(50, 10, 5, 'Instalación de antena satelital', '2024-09-20'),
(51, 1, 2, 'Reparación de cableado de red', '2024-09-19'),
(52, 3, 1, 'Instalación de router WiFi', '2024-09-18'),
(53, 5, 3, 'Reparación de cámaras de seguridad', '2024-09-17'),
(54, 7, 4, 'Instalación de red de datos', '2024-09-16'),
(55, 9, 5, 'Reparación de sistema de seguridad', '2024-09-15'),
(56, 2, 2, 'Instalación de equipo de sonido', '2024-09-14'),
(57, 4, 1, 'Reparación de luces automáticas', '2024-09-13'),
(58, 6, 3, 'Instalación de sensores de movimiento', '2024-09-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `cedula` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `rol` enum('VISITANTE','ADMINISTRADOR') NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `cedula`, `nombre`, `correo`, `telefono`, `rol`, `contraseña`) VALUES
(1, '1234567890', 'Juan Pérez', 'juan.perez@example.com', '123456789', 'VISITANTE', '12345'),
(2, '9876543210', 'María López', 'maria.lopez@example.com', '987654321', 'ADMINISTRADOR', '12345'),
(3, '1122334455', 'Carlos Gómez', 'carlos.gomez@example.com', '1122334455', 'VISITANTE', '12345'),
(4, '2233445566', 'Ana Torres', 'ana.torres@example.com', '2233445566', 'ADMINISTRADOR', '12345'),
(5, '3344556677', 'Luis Sánchez', 'luis.sanchez@example.com', '3344556677', 'VISITANTE', '12345'),
(6, '4455667788', 'Laura Ramírez', 'laura.ramirez@example.com', '4455667788', 'VISITANTE', '12345'),
(7, '5566778899', 'Sofía Jiménez', 'sofia.jimenez@example.com', '5566778899', 'ADMINISTRADOR', '12345'),
(8, '6677889900', 'Diego Fernández', 'diego.fernandez@example.com', '6677889900', 'VISITANTE', '12345'),
(9, '7788990011', 'Gabriela Ruiz', 'gabriela.ruiz@example.com', '7788990011', 'VISITANTE', '12345'),
(10, '8899001122', 'Esteban Moreno', 'esteban.moreno@example.com', '8899001122', 'ADMINISTRADOR', '12345'),
(11, '9988776655', 'Patricia Castillo', 'patricia.castillo@example.com', '9988776655', 'VISITANTE', '12345'),
(12, '8877665544', 'Fernando Vargas', 'fernando.vargas@example.com', '8877665544', 'VISITANTE', '12345'),
(13, '7766554433', 'Martina Ortiz', 'martina.ortiz@example.com', '7766554433', 'ADMINISTRADOR', '12345'),
(14, '6655443322', 'Andrea Paredes', 'andrea.paredes@example.com', '6655443322', 'VISITANTE', '12345'),
(15, '5544332211', 'Javier Delgado', 'javier.delgado@example.com', '5544332211', 'VISITANTE', '12345'),
(16, '4433221100', 'Claudia León', 'claudia.leon@example.com', '4433221100', 'ADMINISTRADOR', '12345'),
(17, '3322110099', 'Héctor Campos', 'hector.campos@example.com', '3322110099', 'VISITANTE', '12345'),
(18, '2211009988', 'Monica Molina', 'monica.molina@example.com', '2211009988', 'VISITANTE', '12345'),
(19, '1100998877', 'Rodrigo Gil', 'rodrigo.gil@example.com', '1100998877', 'ADMINISTRADOR', '12345'),
(20, '0099887766', 'Isabel Díaz', 'isabel.diaz@example.com', '0099887766', 'VISITANTE', '12345'),
(25, '1077087474', 'Jessid Ramirez', '3053947115', 'jessid@example.', 'VISITANTE', '12345');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_tecnico` (`id_tecnico`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `ordenes_ibfk_2` FOREIGN KEY (`id_tecnico`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
