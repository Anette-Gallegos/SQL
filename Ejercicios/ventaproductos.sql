-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2022 a las 12:31:53
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
-- Base de datos: `ventaproductos`
--
create database `ventaproductos`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajeros`
--

CREATE TABLE `cajeros` (
  `Codigo` int(11) NOT NULL,
  `NomApels` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cajeros`
--

INSERT INTO `cajeros` (`Codigo`, `NomApels`) VALUES
(1, 'Catalina Tudela'),
(2, 'Felix Alcaide'),
(3, 'Dina de las Heras'),
(4, 'Paz Camino'),
(5, 'Paulina de La Rosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquinas_registradoras`
--

CREATE TABLE `maquinas_registradoras` (
  `Codigo` int(11) NOT NULL,
  `Piso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `maquinas_registradoras`
--

INSERT INTO `maquinas_registradoras` (`Codigo`, `Piso`) VALUES
(1, 5),
(2, 4),
(3, 3),
(4, 2),
(5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Precio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Codigo`, `Nombre`, `Precio`) VALUES
(1, 'Producto001', 34),
(2, 'Producto002', 64),
(3, 'Producto003', 12),
(4, 'Producto004', 50),
(5, 'Producto005', 54);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `Cajero` int(11) NOT NULL,
  `Maquina` int(11) NOT NULL,
  `Producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`Cajero`, `Maquina`, `Producto`) VALUES
(4, 4, 4),
(1, 1, 1),
(5, 5, 5),
(2, 2, 2),
(3, 3, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajeros`
--
ALTER TABLE `cajeros`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `maquinas_registradoras`
--
ALTER TABLE `maquinas_registradoras`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD KEY `FK_VENTA_CAJEROS` (`Cajero`),
  ADD KEY `FK_VENTA_MAQUINAS_REGISTRADORAS` (`Maquina`),
  ADD KEY `FK_VENTA_PRODUCTOS` (`Producto`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `FK_VENTA_CAJEROS` FOREIGN KEY (`Cajero`) REFERENCES `cajeros` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VENTA_MAQUINAS_REGISTRADORAS` FOREIGN KEY (`Maquina`) REFERENCES `maquinas_registradoras` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VENTA_PRODUCTOS` FOREIGN KEY (`Producto`) REFERENCES `productos` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
