CREATE TABLE nw202203.imgwork (
	idimg int(11) auto_increment NOT NULL,
	idprovider int(11) NOT NULL,
	imgpath varchar(100) NOT NULL,
	created datetime DEFAULT NOW() NOT NULL,
	CONSTRAINT imgwork_pk PRIMARY KEY (idimg),
	CONSTRAINT imgwork_FK FOREIGN KEY (idprovider) REFERENCES nw202203.providers(idprovider)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE nw202203.orders (
	idorder int(11) NOT NULL,
	iduser_cli bigint(10) NULL,
	iduser_prov bigint(10) NULL,
	idservice tinyint(4) NULL,
	descriptionwork varchar(500) NULL,
	enddate datetime NOT NULL,
	status enum('ACT','CANC','ANU','FIN', 'EPR') DEFAULT 'ACT' NULL,
	CONSTRAINT orders_pk PRIMARY KEY (idorder),
	CONSTRAINT orders_FK FOREIGN KEY (idservice) REFERENCES nw202203.services(idservice),
	CONSTRAINT orders_FK_1 FOREIGN KEY (iduser_cli) REFERENCES nw202203.usuario(usercod),
	CONSTRAINT orders_FK_2 FOREIGN KEY (iduser_prov) REFERENCES nw202203.usuario(usercod)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;