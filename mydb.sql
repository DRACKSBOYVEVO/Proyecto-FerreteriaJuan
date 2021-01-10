-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2019 a las 09:30:28
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_cliente`
--

CREATE TABLE `table_cliente` (
  `idCliente` int(11) NOT NULL,
  `Nombre_Cliente` varchar(45) NOT NULL,
  `Apellido_Cliente` varchar(45) NOT NULL,
  `razon_s_Cliente` varchar(200) NOT NULL,
  `ruc_Cliente` varchar(45) NOT NULL,
  `direccion_Cliente` varchar(100) NOT NULL,
  `telefono_Cliente` varchar(20) NOT NULL,
  `correo_Cliente` varchar(45) NOT NULL,
  `table_facturas_No_Facturas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_facturas`
--

CREATE TABLE `table_facturas` (
  `No_Facturas` int(11) NOT NULL,
  `cliente` varchar(11) NOT NULL,
  `fecha` date NOT NULL,
  `totals` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `table_facturas`
--

INSERT INTO `table_facturas` (`No_Facturas`, `cliente`, `fecha`, `totals`) VALUES
(1, 'Pedro ', '2019-05-07', '5000'),
(1001, 'Pedro ', '2019-05-07', '5000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_productos`
--

CREATE TABLE `table_productos` (
  `idProductos` int(10) NOT NULL,
  `nombreProductos` varchar(45) NOT NULL,
  `preciosProductos` float NOT NULL,
  `descripcionProductos` varchar(200) NOT NULL,
  `preciocompraProductos` float NOT NULL,
  `Difererencia` float NOT NULL,
  `table_ventas_idVentas` int(10) NOT NULL,
  `table_facturas_No_Facturas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_proveedor`
--

CREATE TABLE `table_proveedor` (
  `id_guia` int(11) NOT NULL,
  `punto_par` varchar(45) NOT NULL,
  `punto_lle` varchar(45) NOT NULL,
  `fecha_traslado` date NOT NULL,
  `costo_min` int(11) NOT NULL,
  `nom_empresa_transportes` varchar(45) NOT NULL,
  `ruc_empresa_transportes` varchar(45) NOT NULL,
  `marca_num_placa` varchar(45) NOT NULL,
  `nro_cons_inscripcion` varchar(45) NOT NULL,
  `nro_lic_conductor` varchar(45) NOT NULL,
  `tipo_num_comp_pago` varchar(45) NOT NULL,
  `cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_proveedor_has_table_productos`
--

CREATE TABLE `table_proveedor_has_table_productos` (
  `table_proveedor_id_guia` int(11) NOT NULL,
  `table_productos_idProductos` int(10) NOT NULL,
  `table_productos_table_ventas_idVentas` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_ventas`
--

CREATE TABLE `table_ventas` (
  `idVentas` int(10) NOT NULL,
  `No_Facturas` int(11) NOT NULL,
  `Productos` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `importe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `pasword` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `telefono` int(10) NOT NULL,
  `table_facturas_No_Facturas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `pasword`, `tipo`, `nombres`, `apellidos`, `telefono`, `table_facturas_No_Facturas`) VALUES
(55, 'admin', 'admin', 'Tarjeta de Identidad', 'juan', 'bedoya', 456975, 1001);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `table_cliente`
--
ALTER TABLE `table_cliente`
  ADD PRIMARY KEY (`idCliente`,`table_facturas_No_Facturas`),
  ADD KEY `fk_table_cliente_table_facturas1_idx` (`table_facturas_No_Facturas`);

--
-- Indices de la tabla `table_facturas`
--
ALTER TABLE `table_facturas`
  ADD PRIMARY KEY (`No_Facturas`);

--
-- Indices de la tabla `table_productos`
--
ALTER TABLE `table_productos`
  ADD PRIMARY KEY (`idProductos`,`table_ventas_idVentas`,`table_facturas_No_Facturas`),
  ADD KEY `fk_table_productos_table_ventas_idx` (`table_ventas_idVentas`),
  ADD KEY `fk_table_productos_table_facturas1_idx` (`table_facturas_No_Facturas`);

--
-- Indices de la tabla `table_proveedor`
--
ALTER TABLE `table_proveedor`
  ADD PRIMARY KEY (`id_guia`);

--
-- Indices de la tabla `table_proveedor_has_table_productos`
--
ALTER TABLE `table_proveedor_has_table_productos`
  ADD PRIMARY KEY (`table_proveedor_id_guia`,`table_productos_idProductos`,`table_productos_table_ventas_idVentas`),
  ADD KEY `fk_table_proveedor_has_table_productos_table_productos1_idx` (`table_productos_idProductos`,`table_productos_table_ventas_idVentas`),
  ADD KEY `fk_table_proveedor_has_table_productos_table_proveedor1_idx` (`table_proveedor_id_guia`);

--
-- Indices de la tabla `table_ventas`
--
ALTER TABLE `table_ventas`
  ADD PRIMARY KEY (`idVentas`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`,`table_facturas_No_Facturas`),
  ADD KEY `fk_usuario_table_facturas1_idx` (`table_facturas_No_Facturas`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `table_cliente`
--
ALTER TABLE `table_cliente`
  ADD CONSTRAINT `fk_table_cliente_table_facturas1` FOREIGN KEY (`table_facturas_No_Facturas`) REFERENCES `table_facturas` (`No_Facturas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `table_productos`
--
ALTER TABLE `table_productos`
  ADD CONSTRAINT `fk_table_productos_table_facturas1` FOREIGN KEY (`table_facturas_No_Facturas`) REFERENCES `table_facturas` (`No_Facturas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table_productos_table_ventas` FOREIGN KEY (`table_ventas_idVentas`) REFERENCES `table_ventas` (`idVentas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `table_proveedor_has_table_productos`
--
ALTER TABLE `table_proveedor_has_table_productos`
  ADD CONSTRAINT `fk_table_proveedor_has_table_productos_table_productos1` FOREIGN KEY (`table_productos_idProductos`,`table_productos_table_ventas_idVentas`) REFERENCES `table_productos` (`idProductos`, `table_ventas_idVentas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table_proveedor_has_table_productos_table_proveedor1` FOREIGN KEY (`table_proveedor_id_guia`) REFERENCES `table_proveedor` (`id_guia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_table_facturas1` FOREIGN KEY (`table_facturas_No_Facturas`) REFERENCES `table_facturas` (`No_Facturas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
