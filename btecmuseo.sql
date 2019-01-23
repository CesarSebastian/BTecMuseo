-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-07-2016 a las 01:29:19
-- Versión del servidor: 5.7.9
-- Versión de PHP: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `btecmuseo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleservicios`
--

DROP TABLE IF EXISTS `detalleservicios`;
CREATE TABLE IF NOT EXISTS `detalleservicios` (
  `id_detalleServicio` varchar(6) NOT NULL,
  `Museos_id_museo` varchar(6) NOT NULL,
  `Servicios_idServicio` varchar(6) NOT NULL,
  PRIMARY KEY (`id_detalleServicio`,`Museos_id_museo`,`Servicios_idServicio`),
  KEY `fk_DetalleServicios_Museos1_idx` (`Museos_id_museo`),
  KEY `fk_DetalleServicios_Servicios1_idx` (`Servicios_idServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleservicios`
--

INSERT INTO `detalleservicios` (`id_detalleServicio`, `Museos_id_museo`, `Servicios_idServicio`) VALUES
('CDCT', 'UNIV', 'CDCT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallessalasexhibicion`
--

DROP TABLE IF EXISTS `detallessalasexhibicion`;
CREATE TABLE IF NOT EXISTS `detallessalasexhibicion` (
  `id_detallesSalasExhibicion` varchar(6) NOT NULL,
  `Museos_id_museo` varchar(6) NOT NULL,
  `SalasExhibicion_id_exhibicion` varchar(6) NOT NULL,
  PRIMARY KEY (`id_detallesSalasExhibicion`,`Museos_id_museo`,`SalasExhibicion_id_exhibicion`),
  KEY `fk_DetallesSalasExhibicion_Museos1_idx` (`Museos_id_museo`),
  KEY `fk_DetallesSalasExhibicion_SalasExhibicion1_idx` (`SalasExhibicion_id_exhibicion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detallessalasexhibicion`
--

INSERT INTO `detallessalasexhibicion` (`id_detallesSalasExhibicion`, `Museos_id_museo`, `SalasExhibicion_id_exhibicion`) VALUES
('COFU', 'CDCT', 'COFU'),
('ENUN', 'CDCT', 'ENUN'),
('ENVI', 'CDCT', 'ENVI'),
('TREN', 'CDCT', 'TREN'),
('BUPR', 'MUTE', 'BUPR'),
('CONS', 'MUTE', 'CONS'),
('ELCT', 'MUTE', 'ELCT'),
('PEPU', 'MUTE', 'PEPU'),
('QAKS', 'MUTE', 'QAKS'),
('AGEV', 'UNIV', 'AGEV'),
('CEMU', 'UNIV', 'CEMU'),
('ESMA', 'UNIV', 'ESMA'),
('MATE', 'UNIV', 'MATE'),
('PLJH', 'UNIV', 'PLJH'),
('RERE', 'UNIV', 'RERE'),
('UNIV', 'UNIV', 'UNIV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_imagenes`
--

DROP TABLE IF EXISTS `detalle_imagenes`;
CREATE TABLE IF NOT EXISTS `detalle_imagenes` (
  `Imagenes_idImagenes` int(11) NOT NULL,
  `Museos_id_museo` varchar(6) NOT NULL,
  PRIMARY KEY (`Imagenes_idImagenes`,`Museos_id_museo`),
  KEY `fk_Imagenes_has_Museos_Museos1_idx` (`Museos_id_museo`),
  KEY `fk_Imagenes_has_Museos_Imagenes1_idx` (`Imagenes_idImagenes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_imagenes`
--

INSERT INTO `detalle_imagenes` (`Imagenes_idImagenes`, `Museos_id_museo`) VALUES
(25, 'CDCT'),
(26, 'UNIV'),
(27, 'MUTE'),
(28, 'PMII'),
(29, 'MIDE'),
(30, 'MTEL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargados`
--

DROP TABLE IF EXISTS `encargados`;
CREATE TABLE IF NOT EXISTS `encargados` (
  `id_encargado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_encargado` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `descripcion_encargado` varchar(100) NOT NULL,
  `Museos_id_museo` varchar(6) NOT NULL,
  PRIMARY KEY (`id_encargado`,`Museos_id_museo`),
  KEY `fk_Encargados_Museos1_idx` (`Museos_id_museo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

DROP TABLE IF EXISTS `idiomas`;
CREATE TABLE IF NOT EXISTS `idiomas` (
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`nombre`) VALUES
('Aleman'),
('Chino mandarin'),
('Espanol'),
('Frances'),
('Ingles'),
('Japones'),
('Portugues'),
('Ruso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE IF NOT EXISTS `imagenes` (
  `idImagenes` int(11) NOT NULL AUTO_INCREMENT,
  `rutaLogo` varchar(200) DEFAULT NULL,
  `rutaFoto` varchar(200) NOT NULL,
  PRIMARY KEY (`idImagenes`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`idImagenes`, `rutaLogo`, `rutaFoto`) VALUES
(25, '../../imagenesSubidas/cedicyt.jpg', '../../imagenesSubidas/CDCI.jpg'),
(26, '../../imagenesSubidas/universumlogo.png', '../../imagenesSubidas/universumFoto.jpg'),
(27, '../../imagenesSubidas/logoMutec.jpg', '../../imagenesSubidas/Fotomutec.jpg'),
(28, '../../imagenesSubidas/papalote.jpg', '../../imagenesSubidas/4-PAPALOTE.jpg'),
(29, '../../imagenesSubidas/95163662-8mide.jpg', '../../imagenesSubidas/4fc3b41755504fachada_017_OK_ok.jpg'),
(30, '../../imagenesSubidas/ag_logo_museo.png', '../../imagenesSubidas/museotelegrafo.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipo/estados`
--

DROP TABLE IF EXISTS `municipo/estados`;
CREATE TABLE IF NOT EXISTS `municipo/estados` (
  `nombre_localidad` varchar(45) NOT NULL,
  PRIMARY KEY (`nombre_localidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `municipo/estados`
--

INSERT INTO `municipo/estados` (`nombre_localidad`) VALUES
('Alvaro Obregon'),
('Azcapotzalco'),
('Benito Juarez'),
('Coyoacan'),
('Cuajimalpa de Morelos'),
('Cuauhtemoc'),
('Gustavo A. Madero'),
('Iztacalco'),
('Iztapalapa'),
('La Magdalena Contreras '),
('Miguel Hidalgo'),
('Milpa Alta'),
('Tlahuac'),
('Tlalpan'),
('Venustiano Carranza'),
('Xochimilco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `museos`
--

DROP TABLE IF EXISTS `museos`;
CREATE TABLE IF NOT EXISTS `museos` (
  `id_museo` varchar(6) NOT NULL,
  `nombre_museo` varchar(45) NOT NULL,
  `direccion_museo` varchar(500) NOT NULL,
  `Horario` varchar(30) NOT NULL,
  `precio_entrada_museo` varchar(350) DEFAULT NULL,
  `Municipo/Estados_nombre_localidad` varchar(45) NOT NULL,
  PRIMARY KEY (`id_museo`,`Municipo/Estados_nombre_localidad`),
  KEY `fk_Museos_Municipo/Estados1_idx` (`Municipo/Estados_nombre_localidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `museos`
--

INSERT INTO `museos` (`id_museo`, `nombre_museo`, `direccion_museo`, `Horario`, `precio_entrada_museo`, `Municipo/Estados_nombre_localidad`) VALUES
('CDCT', 'Centro de DifusiÃ³n de Ciencia y TecnologÃ­a', 'Av. Zempoaltecas s/n Esq. Av. Manuel Salazar, Exhacienda el Rosario,C. P. 02420', '09:00 - 17:00', '$19.50 al pÃºblico en general, \r\n$9.00 para estudiantes y profesores en general, personas de la tercera edad.', 'Azcapotzalco'),
('MIDE', 'Museo Interactivo de EconomÃ­a', 'Tacuba 17 (entre BolÃ­var y Filomeno Mata)\r\nCentro HistÃ³rico\r\nMÃ©xico D.F. CP 06000', '09:00 - 18:00', 'AdmisiÃ³n general $70.00 Maestros, estudiantes y personas adultas mayores con credencial vigente del INAPAM $60.00 NiÃ±os menores de 5 aÃ±os Entrada gratuita', 'Cuauhtemoc'),
('MTEL', 'Museo del TelÃ©grafo', 'Tacuba 8 Centro CP 06620 Distrito Federal', '10:00 - 17:30', 'Entrada Gratuita.', 'Cuauhtemoc'),
('MUTE', 'Mutec', 'Avenida Grande del Bosque s/n, 2a. SecciÃ³n del Bosque de Chapultepec, 11870 Ciudad de MÃ©xico, D.F.', '09:00 - 17:00', 'Entrada Gratuita.', 'Alvaro Obregon'),
('PMII', 'PAPALOTE Museo Interactivo Infantil', 'Av Constituyentes 268, Daniel Garza, 11830 Ciudad de MÃ©xico, D.F.', '10:00 - 19:00', 'Exhibiciones $99, ADOâ€¢Megapantalla IMAX $99, domodigital $99.', 'Miguel Hidalgo'),
('UNIV', 'Universum', 'Circuito cultural de ciudad universitaria s/n col. copilco universidad c.p. 04510', '09:00 - 18:00', 'Entrada general: $70.00 NiÃ±os, estudiantes, maestros, miembros del INAPAM, trabajadores y exalumnos UNAM con credencial vigente*: $60.00', 'Alvaro Obregon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salasexhibicion`
--

DROP TABLE IF EXISTS `salasexhibicion`;
CREATE TABLE IF NOT EXISTS `salasexhibicion` (
  `id_exhibicion` varchar(6) NOT NULL,
  `nombre_exhibicion` varchar(100) NOT NULL,
  `descripcion_exhibicion` varchar(500) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  PRIMARY KEY (`id_exhibicion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `salasexhibicion`
--

INSERT INTO `salasexhibicion` (`id_exhibicion`, `nombre_exhibicion`, `descripcion_exhibicion`, `imagen`) VALUES
('AGEV', 'Agua, elemento de Vida', 'Sin agua la vida no es posible. Desde las primeras civilizaciones los rÃ­os y los mares seÃ±alaban los lÃ­mites de la expansiÃ³n humana, estos han sido fronteras, recursos de producciÃ³n, extracciÃ³n de riquezas y tambiÃ©n objeto de conflicto.  En la actualidad el crecimiento de la poblaciÃ³n y contaminaciÃ³n de las reservas han traÃ­do como consecuencia el incremento de la demanda de agua. ', '../../imagenesSubidas/salas/ft_agua.jpg'),
('BUPR', 'Buen Provecho', 'El Museo Semilla, DIF-Chihuahua y el Museo TecnolÃ³gico presentan a Usted esta exposiciÃ³n internacional desarrollada tanto en Europa como en MÃ©xico para reflexionar sobre las formas accesibles de alimentarnos sana y conscientemente.', '../../imagenesSubidas/salas/buen.jpg'),
('CEMU', 'El cerebro, nuestro puente con el mundo', 'El cerebro es el director de orquesta de nuestra vida. Este Ã³rgano nos permite sentir, pensar, imaginar, movernos, aprender, hablar y mucho mÃ¡s.\r\nEn esta sala podemos entrar en contacto con el complejo y maravilloso campo de las neurociencias. Se explica con gran detalle cÃ³mo estÃ¡ conformado el sistema nervioso, asÃ­ como los procesos que se generan para dar respuesta a todos los estÃ­mulos que nos rodean.', '../../imagenesSubidas/salas/cerebro.jpg'),
('COFU', 'Conceptos Fundamentales', 'En un recorrido de aproximadamente dos horas y media el visitante interactÃºa con diferentes aparatos y equipos que hacen visible lo invisible. Mostramos el concepto de energÃ­a y los mÃ©todos para cuantificarla en sus diferentes manifestaciones. ', '../../imagenesSubidas/salas/ctte.jpg'),
('CONS', 'Constructores', 'Constructores del MÃ©xico Moderno es una Muestra de catorce obras artÃ­sticas seleccionadas de la colecciÃ³n de la CFE producidas por una variedad de diez autores, con piezas producidas en distintas tÃ©cnicas, entre 1923 y 2002. ', '../../imagenesSubidas/salas/cons-titulo.jpg'),
('ELCT', 'Electropolis', 'Aprende en esta divertida exposiciÃ³n interactiva los principios bÃ¡sicos del Electromagnetismo; conoce el mundo de la electricidad y la historia de los personajes que la estudiaron y sus inventos; ademÃ¡s La Ciudad ElÃ©ctrica.', '../../imagenesSubidas/salas/electropolis.jpg'),
('ENUN', 'La EnergÃ­a en el Universo.', 'Espacio dedicado al Sol como fuente primaria de energÃ­a, exhibiÃ©ndose la relaciÃ³n continua del hombre con el Sol, la fÃ­sica de la energÃ­a en el cosmos, las manifestaciones directas de la energÃ­a solar, la acciÃ³n del Sol en la formaciÃ³n de fuentes de energÃ­a en la Tierra (petrÃ³leo, gas, madera y carbÃ³n, entre otros), el Sol como generador nuclear, los reactores nucleares, fisiÃ³n y fusiÃ³n.', '../../imagenesSubidas/salas/energy.jpg'),
('ENVI', 'La EnergÃ­a en la Vida.', 'Se presenta la relaciÃ³n intrÃ­nseca de la energÃ­a con todos los procesos de la vida, mostrÃ¡ndose en forma explÃ­cita el modo en que la energÃ­a se transforma y aprovecha en los diversos procesos vinculados a ella, con especial Ã©nfasis en el ser humano y su actividad cotidiana.', '../../imagenesSubidas/salas/cdtr.jpg'),
('ESMA', 'Estructura de la Materia', 'Comprender algunos fenÃ³menos fÃ­sicos a partir de la experimentaciÃ³n con luz, ondas, movimiento, cargas elÃ©ctricas, campos magnÃ©ticos. La sala muestra ademÃ¡s algunos fenÃ³menos que dieron origen a lo que hoy se conoce como mecÃ¡nica cuÃ¡ntica.', '../../imagenesSubidas/salas/estructura.jpg'),
('MATE', 'MatemÃ¡ticas', 'Las matemÃ¡ticas se desarrollaron para resolver necesidades prÃ¡cticas de la vida cotidiana como contar o medir, pero que ahora son una extensa colecciÃ³n de disciplinas y sus resultados representan el esfuerzo de mÃ¡s de 4000 aÃ±os de pensamiento. Las matemÃ¡ticas son una ciencia viva, acercarse a ellas permite entenderlas y estimular su desarrollo.', '../../imagenesSubidas/salas/ft_mate.jpg'),
('PEPU', 'Pura EnergÃ­a Pura', 'Pura EnergÃ­a Pura es la nueva exhibiciÃ³n interactiva del MUTEC que contiene informaciÃ³n sobre los procesos de generaciÃ³n, transmisiÃ³n, distribuciÃ³n y comercializaciÃ³n de la electricidad. Â¡Utiliza computadoras sensibles al tacto, simuladores, videojuegos, medios robÃ³ticos, animaciones y programas multimedia de gran poder didÃ¡ctico!', '../../imagenesSubidas/salas/energia.jpg'),
('PLJH', 'Planetario JosÃ© de la HerrÃ¡n', 'El Planetario muestra distintos objetos celestes a partir de una proyecciÃ³n digital. El visitante puede observar en el cielo nocturno completamente despejado, es decir, libre de contaminaciÃ³n atmosfÃ©rica y de luz artificial. Las funciones ofrecen tres temÃ¡ticas: La noche de hoy que proyecta el cielo nocturno del dÃ­a en que se visita el Planetario.', '../../imagenesSubidas/salas/planetario_img.jpg'),
('QAKS', 'Qarks', 'Es una exposiciÃ³n fotogrÃ¡fica que refiere los seis tipos o â€˜saboresâ€™ de quarks (manifestaciones subatÃ³micas fundamentales de la materia energÃ­a en su proceso de transformaciÃ³n bÃ¡sica) que se combinan de formas distintas para formar hadrones. Los dos hadrones mÃ¡s estables son el neutrÃ³n y el protÃ³n, que forman parte del nÃºcleo en el Ã¡tomo. ', '../../imagenesSubidas/salas/quarks.jpg'),
('RERE', 'R3 reduce, reutiliza, recicla', 'Todos los productos o servicios que consumimos provienen de la naturaleza. El uso indiscriminado de estos productos ha provocado serios daÃ±os a los ecosistemas y una constante pÃ©rdida de los recursos naturales. Ante este panorama, la sala tiene como objetivo propiciar la conciencia sobre nuestros hÃ¡bitos de consumo y promover la prÃ¡ctica de las 3 râ€™s: reduce, reutiliza y recicla.', '../../imagenesSubidas/salas/r3.jpg'),
('TREN', 'La TransformaciÃ³n de la EnergÃ­a.', 'Una muestra de la bÃºsqueda que hoy el hombre ha emprendido tratando de encontrar fuentes alternas de energÃ­a cada vez mÃ¡s limpias. Analizamos y explicamos con detalle los procesos de generaciÃ³n lde la electricidad a travÃ©s de la transformaciÃ³n de diferentes fuentes de energÃ­a, el aprovechamiento del petrÃ³leo en el desarrollo del transporte y sus consecuencias ecolÃ³gicas.', '../../imagenesSubidas/salas/fefe.jpg'),
('UNIV', 'Universo', 'Esta sala estÃ¡ dedicada a conocer los objetos que conforman el Universo, asÃ­ como la transformaciÃ³n constante en la que se encuentra. Para ello se abordan temas como el origen y evoluciÃ³n de las estrellas, las galaxias, la VÃ­a LÃ¡ctea, el Sistema Solar y los planetas extrasolares, es decir, los planetas que giran alrededor de otras estrellas. TambiÃ©n se mencionan algunos procedimientos e instrumentos que utilizan los astrÃ³nomos para estudiar los objetos del Universo. ', '../../imagenesSubidas/salas/universo.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE IF NOT EXISTS `servicios` (
  `idServicio` varchar(6) NOT NULL,
  `nombre_servicio` varchar(45) NOT NULL,
  `descripcion_servicio` varchar(100) NOT NULL,
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idServicio`, `nombre_servicio`, `descripcion_servicio`) VALUES
('CDCT', 'hyhyhy', 'lololo  ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `correo` varchar(60) NOT NULL,
  `contrasena` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`correo`, `contrasena`) VALUES
('admin@gmail.com', 'admin2510');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitasguiadas`
--

DROP TABLE IF EXISTS `visitasguiadas`;
CREATE TABLE IF NOT EXISTS `visitasguiadas` (
  `idVisitaguiada` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_visitante` varchar(80) NOT NULL,
  `numero_visitantes` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `idiomas_nombre` varchar(45) NOT NULL,
  `Museos_id_museo` varchar(6) NOT NULL,
  `Encargados_id_encargado` int(11) NOT NULL,
  PRIMARY KEY (`idVisitaguiada`,`idiomas_nombre`,`Museos_id_museo`,`Encargados_id_encargado`),
  KEY `fk_VisitasGuiadas_idiomas1_idx` (`idiomas_nombre`),
  KEY `fk_VisitasGuiadas_Museos1_idx` (`Museos_id_museo`),
  KEY `fk_VisitasGuiadas_Encargados1_idx` (`Encargados_id_encargado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleservicios`
--
ALTER TABLE `detalleservicios`
  ADD CONSTRAINT `fk_DetalleServicios_Museos1` FOREIGN KEY (`Museos_id_museo`) REFERENCES `museos` (`id_museo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DetalleServicios_Servicios1` FOREIGN KEY (`Servicios_idServicio`) REFERENCES `servicios` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detallessalasexhibicion`
--
ALTER TABLE `detallessalasexhibicion`
  ADD CONSTRAINT `fk_DetallesSalasExhibicion_Museos1` FOREIGN KEY (`Museos_id_museo`) REFERENCES `museos` (`id_museo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DetallesSalasExhibicion_SalasExhibicion1` FOREIGN KEY (`SalasExhibicion_id_exhibicion`) REFERENCES `salasexhibicion` (`id_exhibicion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_imagenes`
--
ALTER TABLE `detalle_imagenes`
  ADD CONSTRAINT `fk_Imagenes_has_Museos_Imagenes1` FOREIGN KEY (`Imagenes_idImagenes`) REFERENCES `imagenes` (`idImagenes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Imagenes_has_Museos_Museos1` FOREIGN KEY (`Museos_id_museo`) REFERENCES `museos` (`id_museo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `encargados`
--
ALTER TABLE `encargados`
  ADD CONSTRAINT `fk_Encargados_Museos1` FOREIGN KEY (`Museos_id_museo`) REFERENCES `museos` (`id_museo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `museos`
--
ALTER TABLE `museos`
  ADD CONSTRAINT `fk_Museos_Municipo/Estados1` FOREIGN KEY (`Municipo/Estados_nombre_localidad`) REFERENCES `municipo/estados` (`nombre_localidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `visitasguiadas`
--
ALTER TABLE `visitasguiadas`
  ADD CONSTRAINT `fk_VisitasGuiadas_Encargados1` FOREIGN KEY (`Encargados_id_encargado`) REFERENCES `encargados` (`id_encargado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_VisitasGuiadas_Museos1` FOREIGN KEY (`Museos_id_museo`) REFERENCES `museos` (`id_museo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_VisitasGuiadas_idiomas1` FOREIGN KEY (`idiomas_nombre`) REFERENCES `idiomas` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
