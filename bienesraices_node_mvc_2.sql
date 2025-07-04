/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `mensajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(200) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `propiedadId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `usuarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propiedadId` (`propiedadId`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`propiedadId`) REFERENCES `propiedades` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `precios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `propiedades` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `habitaciones` int NOT NULL,
  `estacionamiento` int NOT NULL,
  `wc` int NOT NULL,
  `calle` varchar(60) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `precioId` int DEFAULT NULL,
  `categoriaId` int DEFAULT NULL,
  `usuarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `precioId` (`precioId`),
  KEY `categoriaId` (`categoriaId`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `propiedades_ibfk_1` FOREIGN KEY (`precioId`) REFERENCES `precios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `propiedades_ibfk_2` FOREIGN KEY (`categoriaId`) REFERENCES `categorias` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `propiedades_ibfk_3` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `categorias` (`id`, `nombre`, `createdAt`, `updatedAt`) VALUES
(1, 'Casa', '2025-06-24 02:02:23', '2025-06-24 02:02:23');
INSERT INTO `categorias` (`id`, `nombre`, `createdAt`, `updatedAt`) VALUES
(2, 'Departamento', '2025-06-24 02:02:23', '2025-06-24 02:02:23');
INSERT INTO `categorias` (`id`, `nombre`, `createdAt`, `updatedAt`) VALUES
(3, 'Bodega', '2025-06-24 02:02:23', '2025-06-24 02:02:23');
INSERT INTO `categorias` (`id`, `nombre`, `createdAt`, `updatedAt`) VALUES
(4, 'Terreno', '2025-06-24 02:02:23', '2025-06-24 02:02:23'),
(5, 'Cabana', '2025-06-24 02:02:23', '2025-06-24 02:02:23');

INSERT INTO `mensajes` (`id`, `mensaje`, `createdAt`, `updatedAt`, `propiedadId`, `usuarioId`) VALUES
(1, 'me interesa la propiedad\r\n', '2025-07-02 18:21:20', '2025-07-02 18:21:20', '358cd22b-2240-4554-9c23-f65a76cdb601', 2);


INSERT INTO `precios` (`id`, `nombre`, `createdAt`, `updatedAt`) VALUES
(1, '0 - $10,000 USD', '2025-06-24 02:02:23', '2025-06-24 02:02:23');
INSERT INTO `precios` (`id`, `nombre`, `createdAt`, `updatedAt`) VALUES
(2, '$10,000 - $30,000 USD', '2025-06-24 02:02:23', '2025-06-24 02:02:23');
INSERT INTO `precios` (`id`, `nombre`, `createdAt`, `updatedAt`) VALUES
(3, '$30,000 - $50,000 USD', '2025-06-24 02:02:23', '2025-06-24 02:02:23');
INSERT INTO `precios` (`id`, `nombre`, `createdAt`, `updatedAt`) VALUES
(4, '$50,000 - $75,000 USD', '2025-06-24 02:02:23', '2025-06-24 02:02:23'),
(5, '$75,000 - $100,000 USD', '2025-06-24 02:02:23', '2025-06-24 02:02:23'),
(6, '$100,000 - $150,000 USD', '2025-06-24 02:02:23', '2025-06-24 02:02:23'),
(7, '$150,000 - $200,000 USD', '2025-06-24 02:02:23', '2025-06-24 02:02:23'),
(8, '$200,000 - $300,000 USD', '2025-06-24 02:02:23', '2025-06-24 02:02:23'),
(9, '$300,000 - $500,000 USD', '2025-06-24 02:02:23', '2025-06-24 02:02:23'),
(10, '+ $500,000 USD', '2025-06-24 02:02:23', '2025-06-24 02:02:23');

INSERT INTO `propiedades` (`id`, `titulo`, `descripcion`, `habitaciones`, `estacionamiento`, `wc`, `calle`, `lat`, `lng`, `imagen`, `publicado`, `createdAt`, `updatedAt`, `precioId`, `categoriaId`, `usuarioId`) VALUES
('358cd22b-2240-4554-9c23-f65a76cdb601', 'Casa en la playa', 'Descripcion', 4, 4, 4, '843 Cordova Ave', '34.046445006526', '-118.171361032022', '0.380g39p6dg1iuud9ugi.jpg', 1, '2025-06-29 17:55:35', '2025-07-03 23:53:36', 4, 1, 1);


INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `token`, `confirmado`, `createdAt`, `updatedAt`) VALUES
(1, 'Juan', 'juan@juan.com', '$2b$10$0KX6x1tpVQEKEfDsy/9DJOXMYrsGl7lAA0UeGZpMpqU9UcV1VsXey', NULL, 1, '2025-06-24 02:02:23', '2025-06-24 02:02:23');
INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `token`, `confirmado`, `createdAt`, `updatedAt`) VALUES
(2, 'asdf', 'asdf@asdf.com', '$2b$10$uJfA2sl/.5POTK/Ciy6vveZyN1FlbKkVSQ.cCiEArpqXwp0MZeYM2', NULL, 1, '2025-07-02 18:12:11', '2025-07-02 18:12:18');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;