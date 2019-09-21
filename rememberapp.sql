-- MySQL dump 10.17  Distrib 10.3.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: rememberapp
-- ------------------------------------------------------
-- Server version	10.3.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Autenticacion_datospersonales`
--

DROP TABLE IF EXISTS `Autenticacion_datospersonales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Autenticacion_datospersonales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `tipoid` varchar(20) NOT NULL,
  `numeroid` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  `usuid_id` int(11) NOT NULL,
  `genero` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuid_id` (`usuid_id`),
  CONSTRAINT `Autenticacion_datospersonales_usuid_id_e1c82c88_fk_auth_user_id` FOREIGN KEY (`usuid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autenticacion_datospersonales`
--

LOCK TABLES `Autenticacion_datospersonales` WRITE;
/*!40000 ALTER TABLE `Autenticacion_datospersonales` DISABLE KEYS */;
/*!40000 ALTER TABLE `Autenticacion_datospersonales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Autenticacion_rol`
--

DROP TABLE IF EXISTS `Autenticacion_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Autenticacion_rol` (
  `rolid` int(11) NOT NULL AUTO_INCREMENT,
  `roltipo` varchar(50) NOT NULL,
  PRIMARY KEY (`rolid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autenticacion_rol`
--

LOCK TABLES `Autenticacion_rol` WRITE;
/*!40000 ALTER TABLE `Autenticacion_rol` DISABLE KEYS */;
INSERT INTO `Autenticacion_rol` VALUES (1,'Cuidador'),(2,'Paciente');
/*!40000 ALTER TABLE `Autenticacion_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Autenticacion_usuariorol`
--

DROP TABLE IF EXISTS `Autenticacion_usuariorol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Autenticacion_usuariorol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolid_id` int(11) NOT NULL,
  `usuid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Autenticacion_usuari_rolid_id_1719b3ca_fk_Autentica` (`rolid_id`),
  KEY `Autenticacion_usuariorol_usuid_id_14564100_fk_auth_user_id` (`usuid_id`),
  CONSTRAINT `Autenticacion_usuari_rolid_id_1719b3ca_fk_Autentica` FOREIGN KEY (`rolid_id`) REFERENCES `Autenticacion_rol` (`rolid`),
  CONSTRAINT `Autenticacion_usuariorol_usuid_id_14564100_fk_auth_user_id` FOREIGN KEY (`usuid_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autenticacion_usuariorol`
--

LOCK TABLES `Autenticacion_usuariorol` WRITE;
/*!40000 ALTER TABLE `Autenticacion_usuariorol` DISABLE KEYS */;
INSERT INTO `Autenticacion_usuariorol` VALUES (2,1,3),(3,2,4);
/*!40000 ALTER TABLE `Autenticacion_usuariorol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Blog_autor`
--

DROP TABLE IF EXISTS `Blog_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Blog_autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `fecha_eliminacion` date NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(120) NOT NULL,
  `imagen_referencial` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Blog_autor`
--

LOCK TABLES `Blog_autor` WRITE;
/*!40000 ALTER TABLE `Blog_autor` DISABLE KEYS */;
INSERT INTO `Blog_autor` VALUES (1,1,'2019-09-19','2019-09-19','2019-09-19','Jhonathan','Pérez Ortega','autores/jhonathan.jpg'),(2,1,'2019-09-19','2019-09-19','2019-09-19','Jhoan Alejandro','Morales Loaiza','blog/autores/IMG_20190625_123304.jpg'),(3,1,'2019-09-19','2019-09-19','2019-09-19','Santiago','Lemos Campaña','blog/autores/20190919_100008.jpg');
/*!40000 ALTER TABLE `Blog_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Blog_categoria`
--

DROP TABLE IF EXISTS `Blog_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Blog_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `fecha_eliminacion` date NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `imagen_referencial` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Blog_categoria`
--

LOCK TABLES `Blog_categoria` WRITE;
/*!40000 ALTER TABLE `Blog_categoria` DISABLE KEYS */;
INSERT INTO `Blog_categoria` VALUES (1,1,'2019-09-19','2019-09-19','2019-09-19','General','blog/categoria/general.jpg'),(2,1,'2019-09-19','2019-09-19','2019-09-19','Tratamientos','blog/categoria/tratamientos.jpg');
/*!40000 ALTER TABLE `Blog_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Blog_post`
--

DROP TABLE IF EXISTS `Blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `fecha_eliminacion` date NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `descripcion` longtext NOT NULL,
  `contenido` longtext NOT NULL,
  `imagen_referencial` varchar(255) NOT NULL,
  `publicado` tinyint(1) NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `autor_id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `titulo` (`titulo`),
  UNIQUE KEY `slug` (`slug`),
  KEY `Blog_post_autor_id_ec6d28f0_fk_Blog_autor_id` (`autor_id`),
  KEY `Blog_post_categoria_id_f02f83fd_fk_Blog_categoria_id` (`categoria_id`),
  CONSTRAINT `Blog_post_autor_id_ec6d28f0_fk_Blog_autor_id` FOREIGN KEY (`autor_id`) REFERENCES `Blog_autor` (`id`),
  CONSTRAINT `Blog_post_categoria_id_f02f83fd_fk_Blog_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `Blog_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Blog_post`
--

LOCK TABLES `Blog_post` WRITE;
/*!40000 ALTER TABLE `Blog_post` DISABLE KEYS */;
INSERT INTO `Blog_post` VALUES (6,1,'2019-09-19','2019-09-19','2019-09-19','Acusan a Pfizer de esconder que uno de sus medicamentos podría prevenir el alzhéimer.','pfizer','El análisis de cientos de miles de reclamaciones de seguros arrojó que una de las medicinas más populares de Pfeizer -Enbrel, un desinflamante empleado para tratar la artritis reumática- parecía reducir el riesgo de alzhéimer en un 64%. ¿Cuál fue la razón de la empresa para no comprobar ni compartir ese hallazgo?','<div>\r\n<p>Cuando en enero del a&ntilde;o pasado Pfizer anunci&oacute; que ya no seguir&iacute;a buscando nuevas medicinas para tratar el alzh&eacute;imer y la enfermedad de Parkinson, la decepci&oacute;n entre pacientes e investigadores fue f&aacute;cilmente explicable.Para ese entonces, el gigante farmac&eacute;utico estadounidense ya hab&iacute;a invertido infructuosamente millones de d&oacute;lares en la b&uacute;squeda de alternativas para el tratamiento del alzh&eacute;imer, llegando a la conclusi&oacute;n de que&nbsp;<strong>su dinero estar&iacute;a mejor invertido en otro lado.</strong></p>\r\n\r\n<p>Pfizer, de hecho, justific&oacute; la decisi&oacute;n como &quot;el resultado de un ejercicio de reasignaci&oacute;n de gastos para enfocarnos en aquellas &aacute;reas donde nuestra cartera de productos, y nuestra pericia cient&iacute;fica, son m&aacute;s fuertes&quot;. Pero, como acaba de develar&nbsp;<em>The Washington Post</em>, la empresa se cuid&oacute; de revelar que en su momento hab&iacute;a optado por no comprobar ni compartir los resultados de un estudio con&nbsp;<strong>potenciales grandes implicaciones para la batalla contra el&nbsp;</strong><strong>a</strong><strong>lzh</strong><strong>&eacute;</strong><strong>imer</strong>.</p>\r\n</div>','imagenes/post1.jpg',1,'2019-09-19',1,1),(7,1,'2019-09-19','2019-09-19','2019-09-19','Manejo de las finanzas cuando se tiene alzhéimer','finanzas','Actuar de forma temprana y poner en orden los asuntos económicos y legales son las recomendaciones para evitar situaciones que pongan en riesgo el patrimonio de un paciente con alzéhimer.','<div>\r\n<p>Tareas cotidianas como pagar una factura, contar el dinero para realizar una compra o recibir el cambio, empiezan a complicarse cuando una persona con alzh&eacute;imer pierde progresivamente su capacidad para razonar. Al tratarse de una enfermedad degenerativa, <strong>a medida que avanza surgen escenarios m&aacute;s complejos para el paciente y para sus familiares.</strong></p>\r\n\r\n<p>Ante estas situaciones, es muy importante <strong>emprender acciones tempranas para el manejo de las finanzas de la persona con alzh&eacute;imer</strong>. De acuerdo con el Instituto Nacional sobre el Envejecimiento de Estados Unidos, se trata de un tema complejo, pues no es f&aacute;cil aceptar esta dificultad y mucho menos ceder el control a otro sin sentir que se est&aacute; coartando su autonom&iacute;a, por lo que lo normal es que se muestre en desacuerdo.</p>\r\n\r\n<div>Sin embargo, una vez se confirma el diagn&oacute;stico, es necesario que los familiares se involucren, conversen con la persona para <strong>planear el futuro en temas jur&iacute;dicos y financieros</strong> e incluso tomen medidas tempranas, como poner l&iacute;mites a las cuentas bancarias para retiros y compras, o limitando el uso de dinero en efectivo, por ejemplo.</div>\r\n\r\n<p>Si la persona con alzh&eacute;imer ya no est&aacute; en capacidad de tomar adecuadamente sus decisiones, la recomendaci&oacute;n es asesorarse con un abogado para iniciar un proceso de interdicci&oacute;n por discapacidad mental. Luego de realizar una valoraci&oacute;n neuropsicol&oacute;gica, el juez designar&aacute; a otra persona como administradora de sus bienes y le entregar&aacute; el cuidado del paciente.</p>\r\n</div>','imagenes/post2.jpg',1,'2019-09-19',2,1),(8,1,'2019-09-19','2019-09-19','2019-09-19','Alzhéimer, una enfermedad de alto precio','precio','Aunque no hay cura probada ni tratamiento para prevenir el alzhéimer, el costo global de esta enfermedad podría equipararse a la economía entera de uno de los 20 países más grandes del mundo.','<div>\r\n<p>Se estima que m&aacute;s de 50 millones de personas en el mundo tienen alzh&eacute;imer, seg&uacute;n el informe mundial para 2018. Se trata de una cifra que supera el n&uacute;mero de habitantes de pa&iacute;ses como Espa&ntilde;a, Argentina o Colombia y cuya atenci&oacute;n representa grandes retos para familiares y comunidades, as&iacute; como para <strong>los sistemas de salud que deben afrontar una alta carga econ&oacute;mica debido a la enfermedad.</strong></p>\r\n\r\n<p>Este mismo reporte, elaborado anualmente por la federaci&oacute;n internacional de asociaciones de alzh&eacute;imer (ADI, por sus iniciales en ingl&eacute;s), estableci&oacute; que <strong>el costo global de la enfermedad fue de aproximadamente 1 bill&oacute;n de d&oacute;lares estadounidenses</strong>. Una suma que, si se tratara de un pa&iacute;s, ser&iacute;a la d&eacute;cimo sexta econom&iacute;a m&aacute;s grande del mundo, de acuerdo con los datos del Fondo Monetario Internacional para 2018.</p>\r\n\r\n<p>Este valor incluye los costos &lsquo;ocultos&rsquo; que hay detr&aacute;s de la enfermedad, pues, adem&aacute;s de la asistencia m&eacute;dica que brindan formalmente los sistemas de salud, hay que tener en cuenta el costo del cuidado informal por parte de familiares que dedican hasta 24 horas del d&iacute;a para la atenci&oacute;n de los pacientes, lo que se estima en, por lo menos, 82 mil millones de horas al a&ntilde;o.</p>\r\n\r\n<div><span style=\"color:#a90a19\"><strong>En Colombia, &iquest;cu&aacute;nto cuesta?</strong></span></div>\r\n\r\n<p>Aunque son pocos los estudios al respecto, el Centro de Estudios en Protecci&oacute;n Social y Econom&iacute;a de la Salud (Proesa) de la Universidad Icesi de Cali public&oacute; en 2014 una investigaci&oacute;n pionera en el tema.</p>\r\n\r\n<p>El an&aacute;lisis se enfoc&oacute; en la atenci&oacute;n recibida entre los a&ntilde;os 2011 y 2013, y arroj&oacute; que e<strong>l costo promedio para el sistema de salud es de 1.234 d&oacute;lares para un paciente solo con alzh&eacute;imer</strong> y de 2.385 d&oacute;lares para pacientes con esta enfermedad y otras afecciones cr&oacute;nicas, que son la mayor&iacute;a.</p>\r\n</div>','imagenes/post3.jpg',1,'2019-09-19',3,1),(9,1,'2019-09-19','2019-09-19','2019-09-19','Alzhéimer: ¿la periodontitis crónica influye en el desarrollo de la enfermedad?','periodontitis','Un grupo de científicos reveló un hallazgo que podría significar un avance en la comprensión de una de las enfermedades más misteriosas.','<p>En un estudio publicado en la revista Science Advances, los investigadores afirman que encontraron evidencia de la relaci&oacute;n entre una bacteria presente en la periodontitis cr&oacute;nica, un tipo de enfermedad de las enc&iacute;as muy com&uacute;n, y las personas que padecen Alzheimer.</p>\r\n\r\n<p>Los autores del estudio afirman que sus hallazgos ofrecen esperanza para una nueva forma de combatir la enfermedad, para la cual no hay cura y los tratamientos tienen una efectividad limitada.</p>\r\n\r\n<p><strong>&iquest;Qu&eacute; encontr&oacute; la investigaci&oacute;n?</strong><br />\r\n<br />\r\nLos cient&iacute;ficos analizaron el tejido cerebral, el l&iacute;quido cefalorraqu&iacute;deo y la saliva de pacientes vivos y muertos con diagn&oacute;stico y sospecha de que padecen la enfermedad de Alzheimer.</p>\r\n\r\n<p>Tras los an&aacute;lisis, en los cerebros de personas con alzh&eacute;imer, los investigadores hallaron la bacteriaPorphyromonas gingivalis, asociada con el desarrollo de la periodontitis cr&oacute;nica.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>La enfermedad de las enc&iacute;as inicia con una inflamaci&oacute;n llamada gingivitis, que de no tratarse adecuadamente puede evolucionar en una periodontitis.</p>\r\n\r\n<p>Antes, experimentos con ratones ya hab&iacute;an confirmado que las bacterias pod&iacute;an viajar de la boca hacia el cerebro, y mostraron que la prote&iacute;na t&oacute;xica que secretan, llamada gingipain, destruye las neuronas.</p>\r\n\r\n<p>Estas bacterias tambi&eacute;n aumentaron la producci&oacute;n de beta amiloide, un componente de las placas amiloides, cuya acumulaci&oacute;n est&aacute; usualmente asociada con el Alzheimer.</p>\r\n\r\n<p>Despu&eacute;s, los cient&iacute;ficos probaron en ratones medicamentos destinados a bloquear las prote&iacute;nas t&oacute;xicas y descubrieron que pod&iacute;an detener la degeneraci&oacute;n en el cerebro.</p>\r\n\r\n<p>&quot;Los hallazgos de este estudio ofrecen pruebas de que (la presencia de) Porphyromonas gingivalis y gingipains en el cerebro desempe&ntilde;an un papel central en la patog&eacute;nesis [desarrollo] de AD [enfermedad de Alzheimer], proporcionando un nuevo marco conceptual para el tratamiento de la enfermedad&quot;, dicen los autores de la investigaci&oacute;n.</p>','imagenes/pos4.jpg',1,'2019-09-19',1,1),(10,1,'2019-09-19','2019-09-19','2019-09-19','Demencia y alzhéimer, ¿son lo mismo?','demecia','En ocasiones estos términos se utilizan indiscriminadamente para referirse a síntomas como la pérdida de la memoria y de otras capacidades cognitivas. En realidad, se trata de conceptos distintos, aunque estrechamente relacionados.','<div>\r\n<p>Para resolver esta confusi&oacute;n, que es muy com&uacute;n entre las personas, es necesario remitirse a la definici&oacute;n cl&iacute;nica de ambos t&eacute;rminos. Como explica el neur&oacute;logo Fernando Jim&eacute;nez Colocasio, <strong>la demencia no es una enfermedad espec&iacute;fica,</strong> sino que se trata de un conjunto de s&iacute;ntomas asociados con el deterioro de las capacidades cognitivas superiores, como la memoria, el lenguaje, la concentraci&oacute;n, el razonamiento y el juicio.</p>\r\n\r\n<p><span style=\"color:#a90a19\"><strong>Alzh&eacute;imer, la demencia m&aacute;s frecuente y conocida</strong></span></p>\r\n\r\n<p>La demencia puede ser provocada por muchas condiciones diferentes, y, entre ellas, la m&aacute;s com&uacute;n, es la enfermedad de Alzheimer. Esta es una <strong>enfermedad neurodegenerativa progresiva, </strong>que se manifiesta con el deterioro de las capacidades cognitivas debido a la destrucci&oacute;n y muerte de las c&eacute;lulas nerviosas.</p>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<div>&nbsp;</div>\r\n\r\n<p>Inicialmente, una persona que desarrolla alzh&eacute;imer empieza a olvidar situaciones recientes, aunque conserva la memoria a largo plazo, hasta que los s&iacute;ntomas se agravan y con el avance de la enfermedad se deteriora significativamente esta capacidad. <strong>Aunque el principal factor de riesgo conocido es la edad, tambi&eacute;n puede presentarse de forma temprana por una predisposici&oacute;n gen&eacute;tica.</strong></p>\r\n\r\n<p><span style=\"color:#a90a19\"><strong>Otros tipos de demencia</strong></span></p>\r\n\r\n<p>El alzh&eacute;imer no es la &uacute;nica forma de demencia. Existen otras condiciones, cada una con una causa diferente y que afecta de maneras distintas al paciente. Entre las m&aacute;s comunes se encuentran:</p>\r\n\r\n<ul>\r\n	<li><strong>Demencia con cuerpos de Lewy</strong>: causa alucinaciones visuales y dificultades con el movimiento.</li>\r\n	<li><strong>Demencia frontotemporal:</strong> altera la personalidad y en ocasiones el lenguaje, pero no se afecta de forma importante la memoria.</li>\r\n	<li><strong>Demencia vascular:</strong> normalmente ocurre despu&eacute;s de un accidente cerebrovascular, debido a un da&ntilde;o ocasionado en un &aacute;rea del cerebro que afecte las funciones cognitivas.</li>\r\n	<li><strong>Demencia relacionada con el Parkinson: </strong>altera, principalmente, la atenci&oacute;n y el manejo de la informaci&oacute;n espacial. La pueden presentar algunos pacientes con la enfermedad de Parkinson.</li>\r\n</ul>\r\n</div>','imagenes/post4.jpg',1,'2019-09-19',2,1),(11,1,'2019-09-19','2019-09-19','2019-09-19','Ejercicio aeróbico regular retrasaría la progresión del alzhéimer para personas con mayor riesgo','ejercicio','Una media hora de ejercicio aeróbico cuatro o cinco veces por semana puede prevenir o retrasar el deterioro cognitivo en los adultos mayores que corren un alto riesgo de desarrollar enfermedad de Alzheimer, según un estudio publicado este martes en el Journal of Alzheimer’s Disease.','<p>&ldquo;Este es el primer ensayo aleatorizado y controlado&hellip; para evaluar los efectos del ejercicio sobre la estructura cerebral, la funci&oacute;n y la carga amiloidea en adultos mayores que tienen problemas de memoria, por lo tanto, altos riesgos de enfermedad de Alzheimer&rdquo;, dijo el autor principal Rong Zhang, un profesor de neurolog&iacute;a en el UT Southwestern Medical Center.</p>\r\n\r\n<p>El estudio fue un peque&ntilde;o ensayo de prueba de concepto de personas de 55 a&ntilde;os o m&aacute;s con deterioro cognitivo leve. Los sujetos fueron asignados al azar a 12 meses de ejercicio aer&oacute;bico o estiramiento y tonificaci&oacute;n. Seg&uacute;n los investigadores, tanto el ejercicio aer&oacute;bico como el estiramiento pueden prevenir o retrasar el deterioro cognitivo, pero el ejercicio aer&oacute;bico tuvo m&aacute;s beneficios para reducir la contracci&oacute;n del hipocampo que el estiramiento. El hipocampo es una regi&oacute;n del cerebro crucial para la memoria.</p>','imagenes/tratamiento1.jpg',1,'2019-09-19',3,2),(12,1,'2019-09-19','2019-09-19','2019-09-19','“Este es el primer ensayo aleatorizado y controlado… para evaluar los efectos del ejercicio sobre la estructura cerebral, la función y la carga amiloi','nuevotratamiento','Los científicos encontraron dos cadenas de aminoácidos que cuando se inyectan diariamente en ratones con la enfermedad mejoran significativamente la memoria de los ratones.','<p><strong>Dos a&ntilde;os despu&eacute;s de descubrir una forma de neutralizar una prote&iacute;na deshonesta</strong> relacionada con la enfermedad de Alzheimer, el distinguido profesor y neur&oacute;logo de la Universidad de Alberta Jack Jhamandas ha encontrado una nueva pieza del rompecabezas de la enfermedad de Alzheimer, acerc&aacute;ndolo a un tratamiento para la enfermedad.</p>\r\n\r\n<p>En un estudio publicado en Scientific Reports, Jhamandas y su equipo encontraron dos p&eacute;ptidos cortos, o cadenas de amino&aacute;cidos, que cuando se inyectan diariamente en ratones con la enfermedad de Alzheimer durante cinco semanas, mejoran significativamente la memoria de los ratones. El tratamiento tambi&eacute;n redujo algunos de los cambios f&iacute;sicos nocivos en el cerebro que est&aacute;n asociados con la enfermedad.</p>\r\n\r\n<p>&quot;En los ratones que recibieron las drogas, encontramos menos acumulaci&oacute;n de placa amiloide y una reducci&oacute;n en la inflamaci&oacute;n cerebral&quot;, dijo Jhamandas, quien tambi&eacute;n es miembro del Instituto de Neurociencia y Salud Mental.</p>\r\n\r\n<p>&quot;As&iacute; que esto fue muy interesante y emocionante porque nos mostr&oacute; que no solo se estaba mejorando la memoria en los ratones, sino que tambi&eacute;n se mejoraron enormemente los signos de patolog&iacute;a cerebral en la enfermedad de Alzheimer. Eso fue un poco sorprendente para nosotros&quot;.</p>','imagenes/tratamiento2.jpg',1,'2019-09-19',1,2);
/*!40000 ALTER TABLE `Blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Principal_contacto`
--

DROP TABLE IF EXISTS `Principal_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Principal_contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `fecha_eliminacion` date NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `asunto` varchar(100) NOT NULL,
  `mensaje` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Principal_contacto`
--

LOCK TABLES `Principal_contacto` WRITE;
/*!40000 ALTER TABLE `Principal_contacto` DISABLE KEYS */;
INSERT INTO `Principal_contacto` VALUES (80,1,'2019-09-18','2019-09-18','2019-09-18','jhonathan','jdjjd@gamsms.com','jdjjd','dhhdhd'),(81,1,'2019-09-19','2019-09-19','2019-09-19','dsgdsghgh','hgdsfhdf@dsghghsad.com','sdahghsda','hgsdaghsadgh'),(82,1,'2019-09-19','2019-09-19','2019-09-19','Santiago Lemos Campaña','slemos1502@gmail.com','Felicitaciones','Me gusta mucho la página.'),(83,1,'2019-09-19','2019-09-19','2019-09-19','kjsdnsdjfs','msdflkgd@hotmail.com','lskdnksndflskdf',',,sdnflksngknksmfkdsfs'),(84,1,'2019-09-19','2019-09-19','2019-09-19','kjsdnsdjfs','msdflkgd@hotmail.com','lskdnksndflskdf',',,sdnflksngknksmfkdsfs');
/*!40000 ALTER TABLE `Principal_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Principal_desarrollador`
--

DROP TABLE IF EXISTS `Principal_desarrollador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Principal_desarrollador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `fecha_eliminacion` date NOT NULL,
  `foto` varchar(100) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Principal_desarrollador`
--

LOCK TABLES `Principal_desarrollador` WRITE;
/*!40000 ALTER TABLE `Principal_desarrollador` DISABLE KEYS */;
INSERT INTO `Principal_desarrollador` VALUES (7,1,'2019-09-18','2019-09-19','2019-09-19','desarrolladores/jhonathan.jpg','Jhonathan Perez Ortega','Desarrollador','http://www.facebook.com/','http://www.twitter.com/','http://www.instagram.com/'),(9,1,'2019-09-19','2019-09-19','2019-09-19','desarrolladores/20190919_100008.jpg','Santiago Lemos Campaña','Desarrollador','http://www.facebook.com','http://www.twitter.com','http://www.instragram.com'),(10,1,'2019-09-19','2019-09-19','2019-09-19','desarrolladores/IMG_20190625_123304.jpg','Jhoan Alejandro Morales Loaiza','Desarrollador','http://www.facebook.com/','http://www.twitter.com/','http://www.instagram.com/');
/*!40000 ALTER TABLE `Principal_desarrollador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Principal_opinionesclientes`
--

DROP TABLE IF EXISTS `Principal_opinionesclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Principal_opinionesclientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `fecha_eliminacion` date NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `imagen_usuario` varchar(100) NOT NULL,
  `mensaje` longtext NOT NULL,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Principal_opinionesclientes`
--

LOCK TABLES `Principal_opinionesclientes` WRITE;
/*!40000 ALTER TABLE `Principal_opinionesclientes` DISABLE KEYS */;
INSERT INTO `Principal_opinionesclientes` VALUES (3,1,'2019-09-19','2019-09-19','2019-09-19','Jloaiza29','clientes/imagen-inicio_syIpJtR_KojIBMT.png','Excelente aplicación me ha servido mucho!','Paciente'),(4,1,'2019-09-19','2019-09-19','2019-09-19','Slemos22','clientes/pepe_qN3bTNs.png','Me ha gustado mucho la aplicación.','Cuidador');
/*!40000 ALTER TABLE `Principal_opinionesclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Principal_principal`
--

DROP TABLE IF EXISTS `Principal_principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Principal_principal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `fecha_eliminacion` date NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Principal_principal`
--

LOCK TABLES `Principal_principal` WRITE;
/*!40000 ALTER TABLE `Principal_principal` DISABLE KEYS */;
INSERT INTO `Principal_principal` VALUES (1,1,'2019-09-17','2019-09-17','2019-09-17','Bienvenido!','Si eres paciente en fase incial de Alzheimer o conoces a alguien, que padezca de dicha demencia, este es tu sitio!');
/*!40000 ALTER TABLE `Principal_principal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Principal_redessociales`
--

DROP TABLE IF EXISTS `Principal_redessociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Principal_redessociales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `fecha_eliminacion` date NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Principal_redessociales`
--

LOCK TABLES `Principal_redessociales` WRITE;
/*!40000 ALTER TABLE `Principal_redessociales` DISABLE KEYS */;
INSERT INTO `Principal_redessociales` VALUES (1,1,'2019-09-12','2019-09-12','2019-09-12','http://www.facebook.com','http://www.twitter.com','http://www.instagram.com');
/*!40000 ALTER TABLE `Principal_redessociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Principal_servicios`
--

DROP TABLE IF EXISTS `Principal_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Principal_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `fecha_eliminacion` date NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Principal_servicios`
--

LOCK TABLES `Principal_servicios` WRITE;
/*!40000 ALTER TABLE `Principal_servicios` DISABLE KEYS */;
INSERT INTO `Principal_servicios` VALUES (4,1,'2019-09-19','2019-09-19','2019-09-19','Ejercicios','Si eres paciente puedes desarrollar todos nuestros ejercicios disponibles, en nuestra aplicación web.'),(5,1,'2019-09-19','2019-09-19','2019-09-19','Pacientes','Con tu rol de paciente tendrás supervisión por parte de tu cuidador.'),(6,1,'2019-09-19','2019-09-19','2019-09-19','Cuidadores','Con tu rol de cuidador podrás vincular y monitorear al paciente.');
/*!40000 ALTER TABLE `Principal_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Principal_subscriptor`
--

DROP TABLE IF EXISTS `Principal_subscriptor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Principal_subscriptor` (
  `subid` int(11) NOT NULL AUTO_INCREMENT,
  `subemail` varchar(200) NOT NULL,
  PRIMARY KEY (`subid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Principal_subscriptor`
--

LOCK TABLES `Principal_subscriptor` WRITE;
/*!40000 ALTER TABLE `Principal_subscriptor` DISABLE KEYS */;
INSERT INTO `Principal_subscriptor` VALUES (31,'jhperez.ortega@gmail.com'),(32,'n.perez1@utp.edu.co'),(33,'slemos1502@gmail.com'),(34,'malovi322@gmail.com'),(35,'jperez_ortega@hotmail.com'),(36,'slemos45@hotmail.com');
/*!40000 ALTER TABLE `Principal_subscriptor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Principal_web`
--

DROP TABLE IF EXISTS `Principal_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Principal_web` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` tinyint(1) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `fecha_eliminacion` date NOT NULL,
  `nosotros` longtext NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(200) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Principal_web`
--

LOCK TABLES `Principal_web` WRITE;
/*!40000 ALTER TABLE `Principal_web` DISABLE KEYS */;
INSERT INTO `Principal_web` VALUES (1,1,'2019-09-12','2019-09-19','2019-09-19','Remember es una aplicación web dirigida a pacientes en fase inicial de Alzheimer, que quieran complementar su tratamiento con ejercicios de concentración, los cuales aportan al desarrollo cognitivo del paciente.','3167564144','suscripcionesremember@gmail.com','Cra 7a # 26-58 Pereira Risaralda');
/*!40000 ALTER TABLE `Principal_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Rol',7,'add_rol'),(26,'Can change Rol',7,'change_rol'),(27,'Can delete Rol',7,'delete_rol'),(28,'Can view Rol',7,'view_rol'),(29,'Can add Rol Usuario',8,'add_usuariorol'),(30,'Can change Rol Usuario',8,'change_usuariorol'),(31,'Can delete Rol Usuario',8,'delete_usuariorol'),(32,'Can view Rol Usuario',8,'view_usuariorol'),(33,'Can add Datos Persona',9,'add_datospersonales'),(34,'Can change Datos Persona',9,'change_datospersonales'),(35,'Can delete Datos Persona',9,'delete_datospersonales'),(36,'Can view Datos Persona',9,'view_datospersonales'),(37,'Can add Red Social',10,'add_redessociales'),(38,'Can change Red Social',10,'change_redessociales'),(39,'Can delete Red Social',10,'delete_redessociales'),(40,'Can view Red Social',10,'view_redessociales'),(41,'Can add Web',11,'add_web'),(42,'Can change Web',11,'change_web'),(43,'Can delete Web',11,'delete_web'),(44,'Can view Web',11,'view_web'),(45,'Can add Principal',12,'add_principal'),(46,'Can change Principal',12,'change_principal'),(47,'Can delete Principal',12,'delete_principal'),(48,'Can view Principal',12,'view_principal'),(49,'Can add Opinion Cliente',13,'add_opinionesclientes'),(50,'Can change Opinion Cliente',13,'change_opinionesclientes'),(51,'Can delete Opinion Cliente',13,'delete_opinionesclientes'),(52,'Can view Opinion Cliente',13,'view_opinionesclientes'),(53,'Can add Servicio',14,'add_servicios'),(54,'Can change Servicio',14,'change_servicios'),(55,'Can delete Servicio',14,'delete_servicios'),(56,'Can view Servicio',14,'view_servicios'),(57,'Can add Desarrollador',15,'add_desarrollador'),(58,'Can change Desarrollador',15,'change_desarrollador'),(59,'Can delete Desarrollador',15,'delete_desarrollador'),(60,'Can view Desarrollador',15,'view_desarrollador'),(61,'Can add Contacto',16,'add_contacto'),(62,'Can change Contacto',16,'change_contacto'),(63,'Can delete Contacto',16,'delete_contacto'),(64,'Can view Contacto',16,'view_contacto'),(65,'Can add Subscriptor',17,'add_subscriptor'),(66,'Can change Subscriptor',17,'change_subscriptor'),(67,'Can delete Subscriptor',17,'delete_subscriptor'),(68,'Can view Subscriptor',17,'view_subscriptor'),(69,'Can add Post',18,'add_post'),(70,'Can change Post',18,'change_post'),(71,'Can delete Post',18,'delete_post'),(72,'Can view Post',18,'view_post'),(73,'Can add Autor',19,'add_autor'),(74,'Can change Autor',19,'change_autor'),(75,'Can delete Autor',19,'delete_autor'),(76,'Can view Autor',19,'view_autor'),(77,'Can add Categoría',20,'add_categoria'),(78,'Can change Categoría',20,'change_categoria'),(79,'Can delete Categoría',20,'delete_categoria'),(80,'Can view Categoría',20,'view_categoria');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$lWIfCbCYnKnI$a3xwT8E8Hj582m8yhHQ14roL7SB1z88I8yw84AAt0rY=','2019-09-21 00:37:07.193402',1,'admin','','','admin@remember.com',1,1,'2019-09-12 15:19:08.930930'),(3,'pbkdf2_sha256$150000$n5yl45PZneyR$bj0nY7NN/210XrzaogYksy4bDsB+6B4WSGsOE02m75c=','2019-09-18 22:29:16.878133',0,'jhonathan','','','',0,1,'2019-09-18 22:20:41.357322'),(4,'pbkdf2_sha256$150000$afoBmtenLfcb$1Pxd0v8LT3E9P+SuXlkgeN0iG0X5GZxpssMMm77jMvs=','2019-09-18 22:30:51.911124',0,'natalia','','','',0,1,'2019-09-18 22:29:45.337132'),(5,'pbkdf2_sha256$150000$LMNtPlvzhLQ3$nhHEpPzJfgrB7klhg8EcDod7imMGL0ZVw0k4AhM2nj4=','2019-09-19 16:12:41.569103',0,'lemos','','','',0,1,'2019-09-19 16:12:05.854958');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-09-12 15:25:55.703401','1','http://www.facebook.com',1,'[{\"added\": {}}]',10,1),(2,'2019-09-12 15:26:47.650663','1','Rememberapp es una aplicación  Rememberapp es una aplicación  Rememberapp es una aplicación  Rememberapp es una aplicación',1,'[{\"added\": {}}]',11,1),(3,'2019-09-12 15:27:01.398912','1','Rememberapp es una aplicación  Rememberapp es una aplicación  Rememberapp es una aplicación  Rememberapp es una aplicación',2,'[]',11,1),(4,'2019-09-17 12:20:40.400641','1','Si eres paciente en fase incial de Alzheimer o conoces a alguien, que padezca de dicha demencia, este es tu sitio!',1,'[{\"added\": {}}]',12,1),(5,'2019-09-17 15:19:27.975647','1','Johan Morales',1,'[{\"added\": {}}]',15,1),(6,'2019-09-17 15:27:22.979855','2','Santiago Lemos',1,'[{\"added\": {}}]',15,1),(7,'2019-09-17 15:31:58.792933','3','Pepe Lotas',1,'[{\"added\": {}}]',15,1),(8,'2019-09-17 16:15:37.041727','3','Pepe Lotas',3,'',15,1),(9,'2019-09-17 16:15:37.166076','2','Santiago Lemos',3,'',15,1),(10,'2019-09-17 16:15:37.412406','1','Johan Morales',3,'',15,1),(11,'2019-09-17 16:16:22.939300','4','sddfs',1,'[{\"added\": {}}]',15,1),(12,'2019-09-17 16:16:46.562202','5','ewrewew',1,'[{\"added\": {}}]',15,1),(13,'2019-09-17 16:17:13.379324','5','ewrewew',3,'',15,1),(14,'2019-09-17 16:17:13.523485','4','sddfs',3,'',15,1),(15,'2019-09-17 16:20:18.549136','6','Santiago Lemos',1,'[{\"added\": {}}]',15,1),(16,'2019-09-17 16:20:49.622606','6','Santiago Lemos',3,'',15,1),(17,'2019-09-17 20:18:23.538036','2','Lemos gay',3,'',16,1),(18,'2019-09-17 20:18:23.661110','1','Lemos gay',3,'',16,1),(19,'2019-09-18 17:18:33.453081','44','ññ',3,'',16,1),(20,'2019-09-18 17:18:33.582938','43','sdfjdsj',3,'',16,1),(21,'2019-09-18 17:18:33.681584','42','sdfjdsj',3,'',16,1),(22,'2019-09-18 17:18:33.741688','41','sdfjdsj',3,'',16,1),(23,'2019-09-18 17:18:33.889536','40','jdsfjhdsh',3,'',16,1),(24,'2019-09-18 17:18:33.939018','39','jdsfjhdsh',3,'',16,1),(25,'2019-09-18 17:18:33.999381','38','jdsfjhdsh',3,'',16,1),(26,'2019-09-18 17:18:34.059763','37','d',3,'',16,1),(27,'2019-09-18 17:18:34.108804','36','d',3,'',16,1),(28,'2019-09-18 17:18:34.158265','35','d',3,'',16,1),(29,'2019-09-18 17:18:34.218670','34','d',3,'',16,1),(30,'2019-09-18 17:18:34.278818','33','sdhjdfs',3,'',16,1),(31,'2019-09-18 17:18:34.328280','32','sdhjdfs',3,'',16,1),(32,'2019-09-18 17:18:34.388612','31','jhdhjdsfhjdsf',3,'',16,1),(33,'2019-09-18 17:18:34.448865','30','jhdhjdsfhjdsf',3,'',16,1),(34,'2019-09-18 17:18:34.498148','29','fdjjdsjh',3,'',16,1),(35,'2019-09-18 17:18:34.547420','28','fdjjdsjh',3,'',16,1),(36,'2019-09-18 17:18:34.596668','27','hjdashjdash',3,'',16,1),(37,'2019-09-18 17:18:34.657046','26','hjdashjdash',3,'',16,1),(38,'2019-09-18 17:18:34.755772','25','hjdashjdash',3,'',16,1),(39,'2019-09-18 17:18:34.816167','24','fdsgdfgf',3,'',16,1),(40,'2019-09-18 17:18:34.876455','23','dhjdfhjdsf',3,'',16,1),(41,'2019-09-18 17:18:34.936733','22','sbdhfhj',3,'',16,1),(42,'2019-09-18 17:18:34.996965','21','sbdhfhj',3,'',16,1),(43,'2019-09-18 17:18:35.057547','20','shghdsghads@gmail.com',3,'',16,1),(44,'2019-09-18 17:18:35.117862','19','shghdsghads@gmail.com',3,'',16,1),(45,'2019-09-18 17:18:35.178293','18','shghdsghads@gmail.com',3,'',16,1),(46,'2019-09-18 17:18:35.238524','17','dfjhdf',3,'',16,1),(47,'2019-09-18 17:18:35.287804','16','dfjhdf',3,'',16,1),(48,'2019-09-18 17:18:35.348202','15','dsfgfgf',3,'',16,1),(49,'2019-09-18 17:18:35.408913','14','dsfgfgf',3,'',16,1),(50,'2019-09-18 17:18:35.482767','13','shjhdhjddsf',3,'',16,1),(51,'2019-09-18 17:18:35.575939','12','shjhdhjddsf',3,'',16,1),(52,'2019-09-18 17:18:35.625710','11','fsjjdjhds',3,'',16,1),(53,'2019-09-18 17:18:35.686040','10','gfdfgh',3,'',16,1),(54,'2019-09-18 17:18:35.746508','9','fndfdf',3,'',16,1),(55,'2019-09-18 17:18:35.865523','8','dsfjhhddsf',3,'',16,1),(56,'2019-09-18 17:18:35.914536','7','fhdjhdsfdsf',3,'',16,1),(57,'2019-09-18 17:18:35.963938','6','gdffd',3,'',16,1),(58,'2019-09-18 17:18:36.012983','5','gdffd',3,'',16,1),(59,'2019-09-18 17:18:36.062223','4','gdffd',3,'',16,1),(60,'2019-09-18 17:18:36.111516','3','Ensayo',3,'',16,1),(61,'2019-09-18 17:19:40.579957','45','\'',3,'',16,1),(62,'2019-09-18 17:21:01.485891','46','pérez',3,'',16,1),(63,'2019-09-18 20:10:03.545957','2','sshhhdjhds@gmail.com',3,'',17,1),(64,'2019-09-18 20:10:03.677889','1','sjhhjdsjhds@gmail.com',3,'',17,1),(65,'2019-09-18 20:57:56.688630','14','hsghgdshgsghsd@gmail.com',3,'',17,1),(66,'2019-09-18 20:57:56.857358','13','jdfsjhjhdsjhdskkhds@hotmail.com',3,'',17,1),(67,'2019-09-18 20:57:57.040499','12','shdhds@gmail.com',3,'',17,1),(68,'2019-09-18 20:57:57.089406','11','jperez_ortega@hotmail.com',3,'',17,1),(69,'2019-09-18 20:57:57.139118','10','jperez_ortega@hotmail.com',3,'',17,1),(70,'2019-09-18 20:57:57.188209','9','jhperez.ortega@gmail.com',3,'',17,1),(71,'2019-09-18 20:57:57.237478','8','hdfhjdf@gmail',3,'',17,1),(72,'2019-09-18 20:57:57.385559','7','jhonattan-1994@hotmail.com',3,'',17,1),(73,'2019-09-18 20:57:57.434734','6','jhonattan-1994@hotmail.com',3,'',17,1),(74,'2019-09-18 20:57:57.483553','5','jhonattan-1994@hotmail.com',3,'',17,1),(75,'2019-09-18 20:57:57.533265','4','jhonattan-1994@hotmail.com',3,'',17,1),(76,'2019-09-18 20:57:57.582531','3','jhonattan-1994@hotmail.com',3,'',17,1),(77,'2019-09-18 21:13:41.172569','23','sasjjjjhgkr32u327@gmail.com',3,'',17,1),(78,'2019-09-18 21:13:41.299427','22','jhperez.ortega@gmail.com',3,'',17,1),(79,'2019-09-18 21:13:41.348383','21','jhperez.ortega@gmail.com',3,'',17,1),(80,'2019-09-18 21:13:41.446821','20','jhperez.ortega@gmail.com',3,'',17,1),(81,'2019-09-18 21:13:41.545250','19','a32488543@gmail.com',3,'',17,1),(82,'2019-09-18 21:13:41.594710','18','dsfkhhgdghd@gmail.com',3,'',17,1),(83,'2019-09-18 21:13:41.644092','17','hshjhjehwhj23@gmail.com',3,'',17,1),(84,'2019-09-18 21:13:41.693455','16','jhperez.ortega@gmail.com',3,'',17,1),(85,'2019-09-18 21:13:41.742465','15','jhperez.ortega@gmail.com',3,'',17,1),(86,'2019-09-18 21:33:19.512754','30','sjkhjdshjdsfjhdsfj@gmail.com',3,'',17,1),(87,'2019-09-18 21:33:19.557725','29','sakjhiriudsfnjdksjdks@gmail.com',3,'',17,1),(88,'2019-09-18 21:33:19.606748','28','lhjdhkdfhfdjgkjdklsad@gmail.com',3,'',17,1),(89,'2019-09-18 21:33:19.655960','27','dsfjlhdfjjksa@gmail.com',3,'',17,1),(90,'2019-09-18 21:33:19.705122','26','jhdsfhjjhdgdhfjjhdf@gmail.com',3,'',17,1),(91,'2019-09-18 21:33:19.877470','25','hjfdhdf@gmail.com',3,'',17,1),(92,'2019-09-18 21:33:19.951348','24','jhperez.ortega@gmail.com',3,'',17,1),(93,'2019-09-18 21:33:59.461974','1','gsaghsadgh',1,'[{\"added\": {}}]',14,1),(94,'2019-09-18 21:34:07.343283','2','dfsjhjdjfs',1,'[{\"added\": {}}]',14,1),(95,'2019-09-18 21:34:14.645098','3','jhweeuyfhjds',1,'[{\"added\": {}}]',14,1),(96,'2019-09-18 21:34:46.659271','1','jkdsfjkjkfldjklfdljkgfjkljkljkfdjkldfs',1,'[{\"added\": {}}]',13,1),(97,'2019-09-18 21:35:37.614900','2','fjkldsjkfjdksjkldjklds',1,'[{\"added\": {}}]',13,1),(98,'2019-09-18 21:53:09.864058','79','jhdshsh',3,'',16,1),(99,'2019-09-18 21:53:09.928798','78','jkfdjkdsjk',3,'',16,1),(100,'2019-09-18 21:53:09.977803','77','jkfdjkdsjk',3,'',16,1),(101,'2019-09-18 21:53:10.026947','76','jkfdjkdsjk',3,'',16,1),(102,'2019-09-18 21:53:10.076283','75','jkfdjkdsjk',3,'',16,1),(103,'2019-09-18 21:53:10.224070','74','jsdjjdsj',3,'',16,1),(104,'2019-09-18 21:53:10.273437','73','hjsdahjs',3,'',16,1),(105,'2019-09-18 21:53:10.322651','72','dfnjdhhd',3,'',16,1),(106,'2019-09-18 21:53:10.371845','71','dfnjdhhd',3,'',16,1),(107,'2019-09-18 21:53:10.421223','70','jsadhjsahj',3,'',16,1),(108,'2019-09-18 21:53:10.470760','69','jkdjsaj',3,'',16,1),(109,'2019-09-18 21:53:10.569155','68','jkdjsaj',3,'',16,1),(110,'2019-09-18 21:53:10.618090','67','fjkfdjkjk',3,'',16,1),(111,'2019-09-18 21:53:10.667675','66','fjkfdjkjk',3,'',16,1),(112,'2019-09-18 21:53:10.716456','65','hsdhgs',3,'',16,1),(113,'2019-09-18 21:53:10.765749','64','hsdhgs',3,'',16,1),(114,'2019-09-18 21:53:10.815071','63','hsdhgs',3,'',16,1),(115,'2019-09-18 21:53:10.864509','62','d',3,'',16,1),(116,'2019-09-18 21:53:10.913749','61','d',3,'',16,1),(117,'2019-09-18 21:53:10.962781','60','jdsjksjk',3,'',16,1),(118,'2019-09-18 21:53:11.012099','59','jdsjksjk',3,'',16,1),(119,'2019-09-18 21:53:11.061197','58','jdsjksjk',3,'',16,1),(120,'2019-09-18 21:53:11.110425','57','jdsjksjk',3,'',16,1),(121,'2019-09-18 21:53:11.159681','56','sdhhjs',3,'',16,1),(122,'2019-09-18 21:53:11.209140','55','sdhhjs',3,'',16,1),(123,'2019-09-18 21:53:11.258395','54','jksjsdja',3,'',16,1),(124,'2019-09-18 21:53:11.307515','53','jksjsdja',3,'',16,1),(125,'2019-09-18 21:53:11.356744','52','jsdaj',3,'',16,1),(126,'2019-09-18 21:53:11.406387','51','jsdaj',3,'',16,1),(127,'2019-09-18 21:53:11.455387','50','jhhjsadh',3,'',16,1),(128,'2019-09-18 21:53:11.504652','49','sahghdsghas',3,'',16,1),(129,'2019-09-18 21:53:11.554035','48','sahghdsghas',3,'',16,1),(130,'2019-09-18 21:53:11.652503','47','sahghdsghas',3,'',16,1),(131,'2019-09-18 21:56:04.477359','7','Jhonathan',1,'[{\"added\": {}}]',15,1),(132,'2019-09-18 21:56:36.837395','8','Mechas',1,'[{\"added\": {}}]',15,1),(133,'2019-09-18 22:10:43.750378','8','Mechas',3,'',15,1),(134,'2019-09-18 22:11:30.893949','2','Slemos12',1,'[{\"added\": {}}]',4,1),(135,'2019-09-18 22:17:50.619611','1','Cuidador',1,'[{\"added\": {}}]',7,1),(136,'2019-09-18 22:17:57.135345','2','Paciente',1,'[{\"added\": {}}]',7,1),(137,'2019-09-18 22:18:07.570757','1','Cuidador-Slemos12',1,'[{\"added\": {}}]',8,1),(138,'2019-09-18 22:19:20.336393','2','Slemos12',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',4,1),(139,'2019-09-18 22:20:24.793151','2','Slemos12',3,'',4,1),(140,'2019-09-18 22:20:41.492927','3','jhonathan',1,'[{\"added\": {}}]',4,1),(141,'2019-09-18 22:21:55.978677','2','Cuidador-jhonathan',1,'[{\"added\": {}}]',8,1),(142,'2019-09-18 22:29:45.483257','4','natalia',1,'[{\"added\": {}}]',4,1),(143,'2019-09-18 22:30:35.225482','3','Paciente-natalia',1,'[{\"added\": {}}]',8,1),(144,'2019-09-19 15:02:07.397029','9','Santiago Lemos Campaña',1,'[{\"added\": {}}]',15,1),(145,'2019-09-19 15:06:03.676975','7','Jhonathan Perez Ortega',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',15,1),(146,'2019-09-19 15:09:59.618757','10','Jhoan Alejandro Morales Loaiza',1,'[{\"added\": {}}]',15,1),(147,'2019-09-19 15:11:45.769612','2','fjkldsjkfjdksjkldjklds',3,'',13,1),(148,'2019-09-19 15:11:45.907140','1','jkdsfjkjkfldjklfdljkgfjkljkljkfdjkldfs',3,'',13,1),(149,'2019-09-19 15:12:45.014278','3','Excelente aplicación me ha servido mucho!',1,'[{\"added\": {}}]',13,1),(150,'2019-09-19 15:13:21.808221','4','Me ha gustado mucho la aplicación.',1,'[{\"added\": {}}]',13,1),(151,'2019-09-19 15:23:49.175752','3','jhweeuyfhjds',3,'',14,1),(152,'2019-09-19 15:23:49.308737','2','dfsjhjdjfs',3,'',14,1),(153,'2019-09-19 15:23:49.407095','1','gsaghsadgh',3,'',14,1),(154,'2019-09-19 15:24:47.329014','4','Ejercicios',1,'[{\"added\": {}}]',14,1),(155,'2019-09-19 15:25:01.497698','4','Ejercicios',2,'[{\"changed\": {\"fields\": [\"descripcion\"]}}]',14,1),(156,'2019-09-19 15:37:32.676553','5','Pacientes',1,'[{\"added\": {}}]',14,1),(157,'2019-09-19 15:39:02.565760','6','Cuidadores',1,'[{\"added\": {}}]',14,1),(158,'2019-09-19 15:41:49.588912','1','Remember es una aplicación web dirigida a pacientes en fase inicial de Alzheimer, que quieran complementar su tratamiento con ejercicios de concentración, los cuales aportan al desarrollo cognitivo de',2,'[{\"changed\": {\"fields\": [\"nosotros\", \"email\"]}}]',11,1),(159,'2019-09-19 16:12:05.997246','5','lemos',1,'[{\"added\": {}}]',4,1),(160,'2019-09-19 21:45:44.647771','1','Pérez Ortega,Jhonathan',1,'[{\"added\": {}}]',19,1),(161,'2019-09-19 21:51:25.942099','1','Ensayo',1,'[{\"added\": {}}]',18,1),(162,'2019-09-19 21:53:56.797708','2','El carro volador no sería tan antiecológico cómo se creía',1,'[{\"added\": {}}]',18,1),(163,'2019-09-19 21:55:41.371550','3','Alzhéimer, una enfermedad de alto precio',1,'[{\"added\": {}}]',18,1),(164,'2019-09-19 21:58:48.279449','4','Ejercicio aeróbico regular retrasaría la progresión del alzhéimer para personas con mayor riesgo',1,'[{\"added\": {}}]',18,1),(165,'2019-09-19 22:02:48.489460','5','jhdsfhjdsf',1,'[{\"added\": {}}]',18,1),(166,'2019-09-19 22:52:40.606118','1','General',1,'[{\"added\": {}}]',20,1),(167,'2019-09-19 22:53:43.707452','2','Tratamientos',1,'[{\"added\": {}}]',20,1),(168,'2019-09-19 22:54:39.272059','5','jhdsfhjdsf',3,'',18,1),(169,'2019-09-19 22:54:39.397689','4','Ejercicio aeróbico regular retrasaría la progresión del alzhéimer para personas con mayor riesgo',3,'',18,1),(170,'2019-09-19 22:54:39.447015','3','Alzhéimer, una enfermedad de alto precio',3,'',18,1),(171,'2019-09-19 22:54:39.545628','2','El carro volador no sería tan antiecológico cómo se creía',3,'',18,1),(172,'2019-09-19 22:54:39.594628','1','Ensayo',3,'',18,1),(173,'2019-09-19 23:00:45.311691','2','Morales Loaiza,Jhoan Alejandro',1,'[{\"added\": {}}]',19,1),(174,'2019-09-19 23:01:02.316095','3','Lemos Campaña,Santiago',1,'[{\"added\": {}}]',19,1),(175,'2019-09-19 23:03:02.002694','6','Acusan a Pfizer de esconder que uno de sus medicamentos podría prevenir el alzhéimer.',1,'[{\"added\": {}}]',18,1),(176,'2019-09-19 23:04:25.135978','7','Manejo de las finanzas cuando se tiene alzhéimer',1,'[{\"added\": {}}]',18,1),(177,'2019-09-19 23:05:38.999516','8','Alzhéimer, una enfermedad de alto precio',1,'[{\"added\": {}}]',18,1),(178,'2019-09-19 23:07:33.890367','9','Alzhéimer: ¿la periodontitis crónica influye en el desarrollo de la enfermedad?',1,'[{\"added\": {}}]',18,1),(179,'2019-09-19 23:09:41.058151','10','Demencia y alzhéimer, ¿son lo mismo?',1,'[{\"added\": {}}]',18,1),(180,'2019-09-19 23:13:00.258456','11','Ejercicio aeróbico regular retrasaría la progresión del alzhéimer para personas con mayor riesgo',1,'[{\"added\": {}}]',18,1),(181,'2019-09-19 23:16:42.419476','12','“Este es el primer ensayo aleatorizado y controlado… para evaluar los efectos del ejercicio sobre la estructura cerebral, la función y la carga amiloi',1,'[{\"added\": {}}]',18,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'Autenticacion','datospersonales'),(7,'Autenticacion','rol'),(8,'Autenticacion','usuariorol'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(19,'Blog','autor'),(20,'Blog','categoria'),(18,'Blog','post'),(5,'contenttypes','contenttype'),(16,'Principal','contacto'),(15,'Principal','desarrollador'),(13,'Principal','opinionesclientes'),(12,'Principal','principal'),(10,'Principal','redessociales'),(14,'Principal','servicios'),(17,'Principal','subscriptor'),(11,'Principal','web'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-09-12 15:16:47.116935'),(2,'auth','0001_initial','2019-09-12 15:16:49.712741'),(3,'Autenticacion','0001_initial','2019-09-12 15:17:00.019583'),(4,'Autenticacion','0002_auto_20190912_1515','2019-09-12 15:17:04.624845'),(5,'Principal','0001_initial','2019-09-12 15:17:05.595147'),(6,'Principal','0002_principal','2019-09-12 15:17:06.009359'),(7,'Principal','0003_auto_20190903_2251','2019-09-12 15:17:06.069671'),(8,'Principal','0004_opinionesclientes','2019-09-12 15:17:06.533938'),(9,'Principal','0005_auto_20190904_1303','2019-09-12 15:17:06.599688'),(10,'Principal','0006_opinionesclientes_rol','2019-09-12 15:17:06.713071'),(11,'Principal','0007_servicios','2019-09-12 15:17:07.191931'),(12,'Principal','0008_auto_20190904_1645','2019-09-12 15:17:07.253520'),(13,'Principal','0009_remove_servicios_imagen','2019-09-12 15:17:08.155466'),(14,'admin','0001_initial','2019-09-12 15:17:08.613280'),(15,'admin','0002_logentry_remove_auto_add','2019-09-12 15:17:11.471306'),(16,'admin','0003_logentry_add_action_flag_choices','2019-09-12 15:17:11.547718'),(17,'contenttypes','0002_remove_content_type_name','2019-09-12 15:17:13.389926'),(18,'auth','0002_alter_permission_name_max_length','2019-09-12 15:17:13.586635'),(19,'auth','0003_alter_user_email_max_length','2019-09-12 15:17:13.717473'),(20,'auth','0004_alter_user_username_opts','2019-09-12 15:17:13.791273'),(21,'auth','0005_alter_user_last_login_null','2019-09-12 15:17:14.785898'),(22,'auth','0006_require_contenttypes_0002','2019-09-12 15:17:14.845653'),(23,'auth','0007_alter_validators_add_error_messages','2019-09-12 15:17:14.968025'),(24,'auth','0008_alter_user_username_max_length','2019-09-12 15:17:15.141823'),(25,'auth','0009_alter_user_last_name_max_length','2019-09-12 15:17:15.273721'),(26,'auth','0010_alter_group_name_max_length','2019-09-12 15:17:15.484630'),(27,'auth','0011_update_proxy_permissions','2019-09-12 15:17:15.576421'),(28,'sessions','0001_initial','2019-09-12 15:17:15.952999'),(29,'Principal','0010_desarrollador','2019-09-17 15:17:50.115472'),(30,'Principal','0011_auto_20190917_1547','2019-09-17 15:47:31.349492'),(31,'Principal','0012_auto_20190917_1733','2019-09-17 17:33:20.893401'),(32,'Principal','0013_subscriptor','2019-09-18 19:24:05.608547'),(33,'Blog','0001_initial','2019-09-19 17:35:53.122670'),(34,'Blog','0002_auto_20190919_2230','2019-09-19 22:30:33.721858'),(35,'Blog','0003_auto_20190919_2252','2019-09-19 22:52:21.147251'),(36,'Blog','0004_auto_20190919_2257','2019-09-19 22:57:47.532199'),(37,'Blog','0005_auto_20190919_2259','2019-09-19 22:59:46.716645');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4j9xog1yp1tzjujbl797ubxdk36dqpwd','YzljNTY1MTkxNWZkYmRiN2U1MzQ2MmI1ZGYwNjk1ODg1Y2Q1ZTE5OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MDE5Y2JiY2VjOWJlMjg1M2RiNmI4Y2FiOGRkYmRiNDMxZDBkYTMwIn0=','2019-10-02 22:30:52.017059'),('6dcxjskexr6gfbob109wvehwa49afscs','MzllMGQ0MzMzODM2MDdkM2ZlZDAyMWYxNDQ0ODJiNmE1MTg0NDhiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYyOTFlOTM4NDQ5ZGM1ODQ4OTY5MWFlMTkyOTMzMzhiNTE0NjRiIn0=','2019-10-03 14:55:10.277548'),('7f7mib70iaddm2mr6i244eow0mazctak','MzllMGQ0MzMzODM2MDdkM2ZlZDAyMWYxNDQ0ODJiNmE1MTg0NDhiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYyOTFlOTM4NDQ5ZGM1ODQ4OTY5MWFlMTkyOTMzMzhiNTE0NjRiIn0=','2019-10-01 12:19:41.104795'),('a7q68sozlxg0ch1wvmpq1fjjgghdc58z','MzllMGQ0MzMzODM2MDdkM2ZlZDAyMWYxNDQ0ODJiNmE1MTg0NDhiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYyOTFlOTM4NDQ5ZGM1ODQ4OTY5MWFlMTkyOTMzMzhiNTE0NjRiIn0=','2019-10-02 17:18:17.995141'),('gxt3mab8tmmaq9oxozb11yxbmc81okw6','MzllMGQ0MzMzODM2MDdkM2ZlZDAyMWYxNDQ0ODJiNmE1MTg0NDhiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYyOTFlOTM4NDQ5ZGM1ODQ4OTY5MWFlMTkyOTMzMzhiNTE0NjRiIn0=','2019-10-03 21:44:20.189657'),('h6enauoysflpqi7ahqv9y8ghtee029t1','MzllMGQ0MzMzODM2MDdkM2ZlZDAyMWYxNDQ0ODJiNmE1MTg0NDhiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYyOTFlOTM4NDQ5ZGM1ODQ4OTY5MWFlMTkyOTMzMzhiNTE0NjRiIn0=','2019-09-26 15:22:09.452816'),('ih785yx3ksexspruhyd4ppd19l6rze43','MzllMGQ0MzMzODM2MDdkM2ZlZDAyMWYxNDQ0ODJiNmE1MTg0NDhiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYyOTFlOTM4NDQ5ZGM1ODQ4OTY5MWFlMTkyOTMzMzhiNTE0NjRiIn0=','2019-10-01 16:15:23.940087'),('qfuyix31bs6aiob6q8b50ki23205gju6','NzNmNDE1NzI2NWE5MjQ0YzMzMmE0ZGM3ZDg0NjA4MjhmZjczNmZiMTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNjUxMWQzZGE1YjUxMmVmMzc3OTFjZGVmNjUzN2ZlZWFlZDNmZDMyIn0=','2019-10-03 16:12:41.718584'),('sthcnl0o44zy3k6n7omodq9xqobef55r','NzNmNDE1NzI2NWE5MjQ0YzMzMmE0ZGM3ZDg0NjA4MjhmZjczNmZiMTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNjUxMWQzZGE1YjUxMmVmMzc3OTFjZGVmNjUzN2ZlZWFlZDNmZDMyIn0=','2019-10-03 16:12:34.471059'),('v7tlav8s1ah6tionlrwwgw1aa10jftva','MzllMGQ0MzMzODM2MDdkM2ZlZDAyMWYxNDQ0ODJiNmE1MTg0NDhiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYyOTFlOTM4NDQ5ZGM1ODQ4OTY5MWFlMTkyOTMzMzhiNTE0NjRiIn0=','2019-10-02 19:24:18.978835'),('xxdts0ec5wyn2git3w4pb5xcqi3jpxl6','MzllMGQ0MzMzODM2MDdkM2ZlZDAyMWYxNDQ0ODJiNmE1MTg0NDhiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYyOTFlOTM4NDQ5ZGM1ODQ4OTY5MWFlMTkyOTMzMzhiNTE0NjRiIn0=','2019-10-01 20:18:10.265615');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 19:38:20
