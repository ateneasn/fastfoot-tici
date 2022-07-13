-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-07-2022 a las 18:27:54
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
(4, 'bebidas', 'icono-bebidas.png');

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
(1, 'Árabe de pastrón', ' Hojas amarga, queso crema, cebollas caramelizadas, pepinillos, pastrón en pan árabe. Precio por uni', 303, 'arabe-de-pastron.jpg(1657637415211).jpg'),
(2, 'Panqueque fresco', 'Hojas verdes, tomate y queso fresco tipo mozzarella. Precio por unidad', 300, 'panqueque-fresco.jpg(1657637475043).jpg'),
(3, 'Wrap de ternera', 'Berenjenas asadas, pimientos, carne de ternera, hojas verdes, perejil.', 600, 'wrap-de-ternera.jpg(1657637636042).jpg'),
(4, 'Yogures', 'Zanahoria, tomate o albahaca', 500, 'yogures.jpg(1657637668682).jpg'),
(5, 'Jugo de remolacha', 'Remolacha, zanahorias y jugo de mandarina', 300, 'jugo-de-remolacha.jpg(1657637708940).jpg'),
(6, 'Batido de kiwi', 'Licuado de kiwi con zumo de limón, menta y azúcar. Precio por unidad', 400, 'batido-de-kiwi.jpg(1657637744909).jpg'),
(7, 'Kiwi con tomate', 'kiwis, tomates, tomates cherry anaranjados, orégano seco, hojas de menta y albahaca', 500, 'kiwi-con-tomate.jpg(1657637781452).jpg'),
(8, 'Ensalada verde ', 'Remolacha, zanahorias y jugo de mandarina', 400, 'ensalada-verde.jpg(1657637817412).jpg'),
(9, 'Ensalada asada', 'Pimiento rojo, Berenjena, Tomate, Cebolla, Limón,Lima, Naranja, Comino molido, Perejil o tomillo, Pi', 600, 'ensalada-asada.jpg(1657637852075).jpg');

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
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
