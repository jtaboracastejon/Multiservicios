CREATE TABLE nw202203.providers (
	idprovider INT(11) auto_increment NOT NULL,
	iduserdetail INT(11) NOT NULL,
	idservice TINYINT(4) NOT NULL,
	decription varchar(500) NOT NULL,
	status ENUM('ACT','INA') DEFAULT 'ACT' NOT NULL,
	datecreate datetime DEFAULT NOW() NULL,
	CONSTRAINT providers_pk PRIMARY KEY (idprovider),
	CONSTRAINT providers_FK FOREIGN KEY (iduserdetail) REFERENCES nw202203.user_details(iduserdetail),
	CONSTRAINT providers_FK_1 FOREIGN KEY (idservice) REFERENCES nw202203.services(idservice)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE `reviews_prov` (
  `idresena` int(11) NOT NULL AUTO_INCREMENT,
  `iduserdetail` int(11) DEFAULT NULL,
  `idprovider` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `review` varchar(4000) DEFAULT NULL,
  `rating` int(5) DEFAULT NULL,
  PRIMARY KEY (`idresena`),
  KEY `userd_reviews_idx` (`iduserdetail`),
  KEY `prov_reviews_idx` (`idprovider`),
  CONSTRAINT `prov_reviews` FOREIGN KEY (`idprovider`) REFERENCES `providers` (`idprovider`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userd_reviews` FOREIGN KEY (`iduserdetail`) REFERENCES `user_details` (`iduserdetail`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;