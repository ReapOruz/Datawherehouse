-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2020 a las 02:52:56
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `datawherehouse`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_cliente`
--

CREATE TABLE `dim_cliente` (
  `id` int(9) NOT NULL,
  `documento` varchar(25) NOT NULL,
  `nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dim_cliente`
--

INSERT INTO `dim_cliente` (`id`, `documento`, `nombre`) VALUES
(1, '1234587', 'Daniel Espinosa'),
(2, '9587445', 'Maria Garcia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_detalle`
--

CREATE TABLE `dim_detalle` (
  `id_factura` int(9) NOT NULL,
  `producto_id` int(9) NOT NULL,
  `cantidad` int(9) NOT NULL,
  `precio` decimal(25,0) NOT NULL,
  `total` decimal(25,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dim_detalle`
--

INSERT INTO `dim_detalle` (`id_factura`, `producto_id`, `cantidad`, `precio`, `total`) VALUES
(1, 1, 2, '10000', '20000'),
(2, 3, 1, '2000000', '2000000'),
(1, 1, 2, '10000', '20000'),
(2, 3, 1, '2000000', '2000000'),
(3, 4, 3, '1500000', '4500000'),
(3, 2, 1, '500000', '500000'),
(3, 4, 3, '1500000', '4500000'),
(3, 2, 1, '500000', '500000'),
(4, 2, 5, '800000', '4000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_factura`
--

CREATE TABLE `dim_factura` (
  `id` int(9) NOT NULL,
  `estado_pago` int(1) NOT NULL,
  `numerofactura` varchar(25) NOT NULL,
  `fecha` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dim_factura`
--

INSERT INTO `dim_factura` (`id`, `estado_pago`, `numerofactura`, `fecha`) VALUES
(1, 1, 'Fac001', '2020/11/01'),
(2, 0, 'Fac002', '2020/09/21'),
(3, 1, 'Fac003', '2020/11/15'),
(4, 1, 'Fac004', '2020/10/12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_producto`
--

CREATE TABLE `dim_producto` (
  `id` int(9) NOT NULL,
  `nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dim_producto`
--

INSERT INTO `dim_producto` (`id`, `nombre`) VALUES
(1, 'Audifonos'),
(2, 'Celular'),
(3, 'Portatil'),
(4, 'Televisor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hechosfact_venta`
--

CREATE TABLE `hechosfact_venta` (
  `id` int(9) NOT NULL,
  `fac_id` int(9) NOT NULL,
  `estado_pago` int(1) NOT NULL,
  `cliente_id` int(9) NOT NULL,
  `fecha` varchar(25) NOT NULL,
  `producto_id` int(9) NOT NULL,
  `cantidad` int(9) NOT NULL,
  `total` decimal(25,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `hechosfact_venta`
--

INSERT INTO `hechosfact_venta` (`id`, `fac_id`, `estado_pago`, `cliente_id`, `fecha`, `producto_id`, `cantidad`, `total`) VALUES
(1, 1, 1, 1, '2020/11/01', 1, 2, '20000'),
(2, 2, 0, 2, '2020/09/21', 3, 1, '2000000'),
(3, 3, 1, 1, '2020/11/15', 4, 3, '4500000'),
(4, 3, 1, 1, '2020/11/15', 2, 1, '500000'),
(5, 4, 1, 1, '2020/10/12', 2, 5, '4000000');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dim_cliente`
--
ALTER TABLE `dim_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dim_detalle`
--
ALTER TABLE `dim_detalle`
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `dim_factura`
--
ALTER TABLE `dim_factura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dim_producto`
--
ALTER TABLE `dim_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hechosfact_venta`
--
ALTER TABLE `hechosfact_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fac_id` (`fac_id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dim_cliente`
--
ALTER TABLE `dim_cliente`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `dim_factura`
--
ALTER TABLE `dim_factura`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `dim_producto`
--
ALTER TABLE `dim_producto`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `hechosfact_venta`
--
ALTER TABLE `hechosfact_venta`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dim_detalle`
--
ALTER TABLE `dim_detalle`
  ADD CONSTRAINT `dim_detalle_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `dim_factura` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dim_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `dim_producto` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `hechosfact_venta`
--
ALTER TABLE `hechosfact_venta`
  ADD CONSTRAINT `hechosfact_venta_ibfk_1` FOREIGN KEY (`fac_id`) REFERENCES `dim_factura` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `hechosfact_venta_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `dim_producto` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `hechosfact_venta_ibfk_3` FOREIGN KEY (`cliente_id`) REFERENCES `dim_cliente` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
