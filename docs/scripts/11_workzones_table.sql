CREATE TABLE `municipalities` (
  `idmunicipality` int(11) NOT NULL AUTO_INCREMENT,
  `municipality` varchar(20) NOT NULL,
  PRIMARY KEY (`idmunicipality`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `departments` (
  `iddepto` tinyint(4) NOT NULL AUTO_INCREMENT,
  `department` varchar(20) NOT NULL,
  PRIMARY KEY (`iddepto`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
CREATE TABLE `work_zones` (
  `idworkzone` int(11) NOT NULL AUTO_INCREMENT,
  `iddepto` tinyint(4) NOT NULL,
  `idmunicipality` int(11) NOT NULL,
  `status` enum('DIS','NODIS') DEFAULT NULL,
  PRIMARY KEY (`idworkzone`),
  KEY `workzone_depto_key_idx` (`iddepto`),
  KEY `workzone_municipalities_key_idx` (`idmunicipality`),
  CONSTRAINT `workzone_depto_key` FOREIGN KEY (`iddepto`) REFERENCES `departments` (`iddepto`),
  CONSTRAINT `workzone_municipalities_key` FOREIGN KEY (`idmunicipality`) REFERENCES `municipalities` (`idmunicipality`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

