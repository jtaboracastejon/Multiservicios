CREATE TABLE `pro_reviews` (
  `idreview` int(11) NOT NULL AUTO_INCREMENT,
  `idordenfac` int(11) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `rating` int(5) DEFAULT NULL,
  PRIMARY KEY (`idreview`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `qualities_prov` (
  `idqualities` int(11) NOT NULL AUTO_INCREMENT,
  `idreview` int(11) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  `knowledge` int(10) DEFAULT NULL,
  `attitude` int(10) DEFAULT NULL,
  `communication` int(10) DEFAULT NULL,
  `puntuality` int(10) DEFAULT NULL,
  `responsibility` int(10) DEFAULT NULL,
  PRIMARY KEY (`idqualities`),
  KEY `reviews_qualitys_idx` (`idreview`),
  CONSTRAINT `reviews_qualitys` FOREIGN KEY (`idreview`) REFERENCES `pro_reviews` (`idreview`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
