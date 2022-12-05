CREATE TABLE nw202203.suscriptions (
	idsuscription int(11) auto_increment NOT NULL,
	startdate datetime NOT NULL,
	enddate datetime NOT NULL,
	CONSTRAINT suscriptions_pk PRIMARY KEY (idsuscription)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE nw202203.promotions (
	idpromotion int(11) auto_increment NOT NULL,
	startdate datetime NOT NULL,
	enddate datetime NOT NULL,
	CONSTRAINT promotions_pk PRIMARY KEY (idpromotion)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

ALTER TABLE nw202203.providers ADD idsuscription int(11) NULL;
ALTER TABLE nw202203.providers ADD idpromotion int(11) NULL;
ALTER TABLE nw202203.providers ADD CONSTRAINT idpromotions_FK FOREIGN KEY (idpromotion) REFERENCES nw202203.promotions(idpromotion);
ALTER TABLE nw202203.providers ADD CONSTRAINT idsuscriptions_FK FOREIGN KEY (idsuscription) REFERENCES nw202203.suscriptions(idsuscription);
