-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2020 a las 13:38:49
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wiki`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anime`
--

CREATE TABLE `anime` (
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(300) NOT NULL,
  `capitulo` int(11) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `anime`
--

INSERT INTO `anime` (`nombre`, `imagen`, `capitulo`, `descripcion`, `categoria`, `user`) VALUES
('Jojo\'s', 'https://i.blogs.es/464068/jojo-s-bizarre-adventure/1366_521.jpg', 60, 'lsdasvkjwkjwKJCVsjkvhjksnvjsfjknsajkcnasjdkncjkasdncjkcdsnkjsacdnjksndvjknsdkjvnsdkjvkjsdnvkjnsdvkjnsdvjknsdvkjnsdvkjnsdkjvnsdddddddddddddddddddddddddddddddaklsjkascjkascjlascjascmlkasclkasncklansclknasclknaslcnlkasnclknaslcnklasncnasncnlkascklkalsncklnasclknalnksclknasclknaslknasclknascklnasclknasclknasclnkaslknasclknasclknafnaoiv.', 'Shonen', 'Quenichi'),
('Kenichi', 'https://vignette.wikia.nocookie.net/kenichila/images/2/23/Kenichi_Shirahama_OVA.jpg/revision/latest?cb=20140217181201&path-prefix=es', 55, 'asdasfagafas', 'Shonen', 'Quenichi'),
('Kiba', 'https://wallpapercave.com/wp/k14NQK9.png', 50, '.\r\n.\r\n.\r\n.\r\n.\r\n.\r\n.\r\n.\r\n.\r\n.\r\n..\r\n', 'Fantasia', 'Quenichi'),
('Sword Art Online', 'https://pulpfictioncine.com/download/multimedia.normal.bc0c0af0b030507b.7761725f6f665f756e646572776f726c645f6e6f726d616c2e6a7067.jpg', 40, 'Sword Art Online es una serie de novelas ligeras japonesas escritas por Reki Kawahara e ilustradas por Abec. A partir de estas, se han creado diversas adaptaciones, tanto de cómic como de anime.?', 'Fantasia', 'Hola');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporada`
--

CREATE TABLE `temporada` (
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(300) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `capitulo` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `anime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `temporada`
--

INSERT INTO `temporada` (`nombre`, `imagen`, `descripcion`, `capitulo`, `user`, `anime`) VALUES
('Diamond is unbreakable', 'https://vignette.wikia.nocookie.net/jojo/images/d/d3/JoJos_Bizarre_Adventure_-_Diamond_Is_Unbreakable.jpg/revision/latest?cb=20160828164845&path-prefix=es', 'asfasfasfasfasf', 35, 'Quenichi', 'Jojo\'s'),
('Phantom Blood', 'https://vignette.wikia.nocookie.net/jojo/images/b/b1/Volume_1.jpg/revision/latest/top-crop/width/360/height/450?cb=20180718154155&path-prefix=es', 'Phantom Blood es la primera parte del manga JoJo\'s Bizarre Adventure. Corresponde a los volúmenes 1-5, con un total de 44 capítulos; mientras que en el anime abarca los primeros 9 episodios', 25, 'Hola', 'Jojo\'s'),
('Vento aureo', 'https://animeblix.com/uploads/2019/02/0059380.698477001550105978_l.jpg', 'asdfaskasfkaslknlkjasnclkasf', 40, 'Quenichi', 'Jojo\'s');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `user` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`user`, `password`, `email`, `fecha_ingreso`, `categoria`) VALUES
('Hola', '$2a$04$.m6kMgoj2uAqU0h9IujiDeGtwpD7YwQ7ELcE1WHc47pFnmoANCfK2', 'danielcaos@ufps.edu.co', '2020-06-11', 'Accion'),
('Quenichi', '$2a$04$vuGdWyUwL46XtzsmhkDjD.hvwmYJW8AaguI0FxUJeefm9QZ0GIgUy', 'dacaos1999@gmail.com', '2020-06-10', 'Shonen');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anime`
--
ALTER TABLE `anime`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `animeusuario` (`user`);

--
-- Indices de la tabla `temporada`
--
ALTER TABLE `temporada`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `temporadausuario` (`user`),
  ADD KEY `temporadaanime` (`anime`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`user`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anime`
--
ALTER TABLE `anime`
  ADD CONSTRAINT `animeusuario` FOREIGN KEY (`user`) REFERENCES `usuario` (`user`);

--
-- Filtros para la tabla `temporada`
--
ALTER TABLE `temporada`
  ADD CONSTRAINT `temporadaanime` FOREIGN KEY (`anime`) REFERENCES `anime` (`nombre`),
  ADD CONSTRAINT `temporadausuario` FOREIGN KEY (`user`) REFERENCES `usuario` (`user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
