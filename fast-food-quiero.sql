-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-07-2022 a las 00:31:17
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
-- Base de datos: `fast-food-quiero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `imagen`) VALUES
(1, 'ensaladas', 'icono-ensaladas.png'),
(2, 'sandwiches', 'icono-sandwich.png'),
(3, 'wraps', 'icono-wrap.png'),
(4, 'bebidas', 'icono-bebidas.png'),
(5, 'frutas', 'frutas.png'),
(6, 'permitido', 'permitido.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_productos`
--

CREATE TABLE `categorias_productos` (
  `id_productos` bigint(10) NOT NULL,
  `id_categorias` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `ingredientes` varchar(100) NOT NULL,
  `precio` smallint(6) NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `ingredientes`, `precio`, `imagen`) VALUES
(1, 'DE CAMPO', 'Hojas verdes, jamón, queso, pa', 500, 'de-campo.png'),
(2, 'POLLO Y PALTA', 'Hojas verdes, variedad de tomates, cubos de queso, aceitunas negras, rillette de pollo y palta.', 600, 'pollo-y-palta.png'),
(3, 'CAESER', 'Mix de lechuga, zanahoria, parmesano, pechuguita de pollo, croutons y aderezo ceasar.', 600, 'caeser.png'),
(4, 'CAPRESSE', 'Variedad de tomates, aceitunas negras, mozzarella fresca y hojas de albahaca.', 600, 'capresse.png'),
(5, 'ATÚN', 'Pan integral con hojas amargas, atún natural, rodajas de tomate.', 450, 'atun.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias_productos`
--
ALTER TABLE `categorias_productos`
  ADD KEY `fk_categorias_productos_categorias` (`id_categorias`),
  ADD KEY `fk_categorias_productos_productos` (`id_productos`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias_productos`
--
ALTER TABLE `categorias_productos`
  ADD CONSTRAINT `fk_categorias_productos_categorias` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `fk_categorias_productos_productos` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
