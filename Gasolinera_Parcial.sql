-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-05-2023 a las 18:42:18
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Gasolinera_Parcial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `id_Clientes` int(12) NOT NULL,
  `Nombre_C` varchar(45) NOT NULL,
  `Apellido_C` varchar(45) NOT NULL,
  `Telefono_C` varchar(20) NOT NULL,
  `Correo_C` varchar(50) NOT NULL,
  `Dirrecion_C` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Clientes`
--

INSERT INTO `Clientes` (`id_Clientes`, `Nombre_C`, `Apellido_C`, `Telefono_C`, `Correo_C`, `Dirrecion_C`) VALUES
(1, 'Vanessa', 'Kiramman', '99281631', 'KiramanVan@piltover.co', 'piltover-piso819'),
(2, 'Gordo que', 'Fuma', '27163191', 'GordoFumador@Cancer.com', 'Patio Bonito'),
(3, 'Vicktor', 'LLoryd', '6431831', 'Vicktor@gmail.com', 'Avenida siempre viva'),
(4, 'Homero', 'Chino', '6431831', 'HomeroPerochino@vhina.com', 'Avenida siempre viva'),
(5, 'Katerine', 'Espinosa', '898836476', 'ModestMouse@vangmal.co', 'Devil work House');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleados`
--

CREATE TABLE `Empleados` (
  `id_Empleados` int(12) NOT NULL,
  `Nombre_E` varchar(50) NOT NULL,
  `Apellido_E` varchar(50) NOT NULL,
  `Dirreccion_E` varchar(50) NOT NULL,
  `Telefono_E` varchar(20) NOT NULL,
  `Correo_E` varchar(50) NOT NULL,
  `Cargo_Empleado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Empleados`
--

INSERT INTO `Empleados` (`id_Empleados`, `Nombre_E`, `Apellido_E`, `Dirreccion_E`, `Telefono_E`, `Correo_E`, `Cargo_Empleado`) VALUES
(1, 'Esteban', 'zanahorea', 'Avenida 123 Calle panamericana', '3872541', 'zanahoriafresca@mercado.com', 'expendedor||Gasolinero'),
(2, 'Luz Marina', 'Caicedo', 'Galaxia de la imaginacion', '15991734', 'Imaginacion@mercado.com', 'Expendedora||Gasolinera'),
(3, 'Maria Lucia', 'Moralesea', 'Calle Gutem free', '3187649', 'MariaLuesca@mercado.com', 'Técnica de mantenimiento'),
(4, 'Miguel', 'Barbosa', 'Carreta 78 Usmekistan', '983541', 'Usmekisan@mercado.com', 'Conductor camionero cisterna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Factura`
--

CREATE TABLE `Factura` (
  `id_Factura` int(12) NOT NULL,
  `FkClientes` int(12) NOT NULL,
  `PrecioTotal` int(50) NOT NULL,
  `CantidadTotal` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Factura`
--

INSERT INTO `Factura` (`id_Factura`, `FkClientes`, `PrecioTotal`, `CantidadTotal`) VALUES
(1, 2, 10000, 2),
(2, 3, 25500, 1),
(3, 1, 50000, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
--

CREATE TABLE `Productos` (
  `id_Productos` int(12) NOT NULL,
  `Nombre_Producto` varchar(45) NOT NULL,
  `Precio_Unitario` int(45) NOT NULL,
  `Cantidad_Disponible` int(45) NOT NULL,
  `Fk_Ventas` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Productos`
--

INSERT INTO `Productos` (`id_Productos`, `Nombre_Producto`, `Precio_Unitario`, `Cantidad_Disponible`, `Fk_Ventas`) VALUES
(1, 'Gasolina Premium', 18000, 500, 1),
(2, 'Disel', 9940, 497, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ventas`
--

CREATE TABLE `Ventas` (
  `Id_Ventas` int(12) NOT NULL,
  `Fk_Factura` int(12) NOT NULL,
  `Fk_Empleados` int(12) NOT NULL,
  `Hora_Venta` varchar(6) NOT NULL,
  `Fecha_Venta` varchar(24) NOT NULL,
  `Descripcion_Venta` varchar(60) NOT NULL,
  `Cantidad_Vendida` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Ventas`
--

INSERT INTO `Ventas` (`Id_Ventas`, `Fk_Factura`, `Fk_Empleados`, `Hora_Venta`, `Fecha_Venta`, `Descripcion_Venta`, `Cantidad_Vendida`) VALUES
(1, 3, 1, '3:43', '04/02/2023', 'Tanqueo de Gasolina', 3),
(2, 2, 3, '1:41', '05/12/2022', 'Caja de cigarrillos', 6),
(3, 2, 2, '6:39', '05/10/2023', 'Tanqueo de disel', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`id_Clientes`);

--
-- Indices de la tabla `Empleados`
--
ALTER TABLE `Empleados`
  ADD PRIMARY KEY (`id_Empleados`);

--
-- Indices de la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD PRIMARY KEY (`id_Factura`),
  ADD KEY `FkClientes` (`FkClientes`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`id_Productos`),
  ADD KEY `Fk_Ventas` (`Fk_Ventas`);

--
-- Indices de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD PRIMARY KEY (`Id_Ventas`),
  ADD KEY `Fk_Factura` (`Fk_Factura`),
  ADD KEY `Fk_Empleados` (`Fk_Empleados`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `id_Clientes` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Empleados`
--
ALTER TABLE `Empleados`
  MODIFY `id_Empleados` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `Factura`
--
ALTER TABLE `Factura`
  MODIFY `id_Factura` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `id_Productos` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Ventas`
--
ALTER TABLE `Ventas`
  MODIFY `Id_Ventas` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD CONSTRAINT `Factura_ibfk_1` FOREIGN KEY (`FkClientes`) REFERENCES `Clientes` (`id_Clientes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD CONSTRAINT `Productos_ibfk_1` FOREIGN KEY (`Fk_Ventas`) REFERENCES `Ventas` (`id_Ventas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Ventas`
--
ALTER TABLE `Ventas`
  ADD CONSTRAINT `Ventas_ibfk_1` FOREIGN KEY (`Fk_Empleados`) REFERENCES `Empleados` (`id_Empleados`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Ventas_ibfk_2` FOREIGN KEY (`Fk_Factura`) REFERENCES `Factura` (`id_Factura`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
