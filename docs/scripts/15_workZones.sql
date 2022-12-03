CREATE TABLE `municipalities` (
  `idmunicipality` int NOT NULL AUTO_INCREMENT,
  `municipality` varchar(20) NOT NULL,
  PRIMARY KEY (`idmunicipality`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `departments` (
  `iddepto` tinyint NOT NULL AUTO_INCREMENT,
  `department` varchar(20) NOT NULL,
  PRIMARY KEY (`iddepto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `work_zones` (
  `idworkzone` int NOT NULL AUTO_INCREMENT,
  `iddepto` tinyint NOT NULL,
  `idmunicipality` int NOT NULL,
  `status` enum('DIS','NODIS') DEFAULT NULL,
  PRIMARY KEY (`idworkzone`),
  KEY `workzone_depto_key_idx` (`iddepto`),
  KEY `workzone_municipalities_key_idx` (`idmunicipality`),
  CONSTRAINT `workzone_depto_key` FOREIGN KEY (`iddepto`) REFERENCES `departments` (`iddepto`),
  CONSTRAINT `workzone_municipalities_key` FOREIGN KEY (`idmunicipality`) REFERENCES `municipalities` (`idmunicipality`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

