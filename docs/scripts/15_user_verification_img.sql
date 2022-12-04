CREATE TABLE IF NOT EXISTS `user_verification_imgs` (
  `idverificationimg` int NOT NULL AUTO_INCREMENT,
  `idverificacion` int NOT NULL DEFAULT '0',
  `DNI_frontal` longtext NOT NULL,
  `DNI_posterior` longtext NOT NULL,
  `prueba_de_residencia` longtext NOT NULL,
  PRIMARY KEY (`idverificationimg`),
  KEY `idverification_fk` (`idverificacion`),
  CONSTRAINT `idverification_fk` FOREIGN KEY (`idverificacion`) REFERENCES `user_verifications` (`idverification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;