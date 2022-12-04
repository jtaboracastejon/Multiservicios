CREATE TABLE IF NOT EXISTS `user_verification_detail` (
  `iddetalleverificacion` int NOT NULL,
  `idverificacion_img` int NOT NULL,
  `iduser_revision` int NOT NULL,
  `observacion` int NOT NULL,
  `estado` enum('DNI_APR','DNI_DEN','RES_APR','RES_DEN','TOTAL_APR') NOT NULL,
  PRIMARY KEY (`iddetalleverificacion`),
  KEY `iddetalleverificacion_fk` (`idverificacion_img`),
  CONSTRAINT `iddetalleverificacion_fk` FOREIGN KEY (`idverificacion_img`) REFERENCES `user_verification_imgs` (`idverificationimg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;