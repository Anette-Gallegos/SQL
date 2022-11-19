-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2022 a las 19:21:53
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `investigadores`
--

create database investigadores;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `NumSerie` char(4) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Facultad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`NumSerie`, `Nombre`, `Facultad`) VALUES
('abcd', 'Equipo001', 1),
('efgh', 'Equipo002', 2),
('ijkl', 'Equipo003', 3),
('mnop', 'Equipo004', 4),
('qrst', 'Equipo005', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`Codigo`, `Nombre`) VALUES
(1, 'Facultad001'),
(2, 'Facultad002'),
(3, 'Facultad003'),
(4, 'Facultad004'),
(5, 'Facultad005'),
(6, 'Facultad006'),
(7, 'Facultad007');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `investigadores`
--

CREATE TABLE `investigadores` (
  `DNI` varchar(8) NOT NULL,
  `NomApels` varchar(255) DEFAULT NULL,
  `Facultad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `investigadores`
--

INSERT INTO `investigadores` (`DNI`, `NomApels`, `Facultad`) VALUES
('00000001', 'Juan Perez', 1),
('00000002', 'Maria Lupa', 2),
('00000003', 'Pancrasio Juarez', 3),
('00000004', 'Jose Jose', 4),
('00000005', 'Chayanne', 5),
('00000006', 'Hanna Banana', 7),
('00000007', 'Zacarías Flores Del Campo', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `DNI` varchar(8) NOT NULL,
  `NumSerie` char(4) NOT NULL,
  `Comienzo` datetime DEFAULT NULL,
  `Fin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`DNI`, `NumSerie`, `Comienzo`, `Fin`) VALUES
('00000001', 'abcd', '2022-11-01 06:09:29', '2022-11-29 09:17:29'),
('00000002', 'efgh', '2021-11-26 10:41:39', '2022-11-30 09:35:03'),
('00000001', 'ijkl', '2022-12-13 11:10:03', '2022-12-31 14:10:03'),
('00000001', 'mnop', '2022-12-31 14:44:26', '2023-01-25 11:10:03'),
('00000001', 'qrst', '2022-12-05 12:10:03', '2022-12-10 19:10:03'),
('00000004', 'mnop', '2022-11-01 13:18:11', '2022-11-30 13:18:11'),
('00000004', 'efgh', '2022-11-30 13:18:11', '2022-12-31 13:18:11');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`NumSerie`),
  ADD KEY `FK_EQUIPOS_FACULTAD` (`Facultad`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `investigadores`
--
ALTER TABLE `investigadores`
  ADD PRIMARY KEY (`DNI`),
  ADD KEY `FK_INVESTIGADORES_FACULTAD` (`Facultad`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD KEY `FK_RESERVA_INVESTIGADORES` (`DNI`),
  ADD KEY `FK_RESERVA_EQUIPOS` (`NumSerie`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `FK_EQUIPOS_FACULTAD` FOREIGN KEY (`Facultad`) REFERENCES `facultad` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `investigadores`
--
ALTER TABLE `investigadores`
  ADD CONSTRAINT `FK_INVESTIGADORES_FACULTAD` FOREIGN KEY (`Facultad`) REFERENCES `facultad` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `FK_RESERVA_EQUIPOS` FOREIGN KEY (`NumSerie`) REFERENCES `equipos` (`NumSerie`),
  ADD CONSTRAINT `FK_RESERVA_INVESTIGADORES` FOREIGN KEY (`DNI`) REFERENCES `investigadores` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
