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