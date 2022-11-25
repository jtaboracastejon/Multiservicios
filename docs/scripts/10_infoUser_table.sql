CREATE TABLE `info_usuarios`
 (`usercod` bigint NOT NULL,
 `nombres` varchar(50) NOT NULL,
 `apellidos` varchar(50) NOT NULL,
 `telefono` varchar(20) NOT NULL,
 `direccion` varchar(150) NOT NULL,
 `zona_laboral` varchar(100) NOT NULL COMMENT 'Zona laboral donde trabaja la empresa',
 PRIMARY KEY (`usercod`),CONSTRAINT `usercod_info` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
