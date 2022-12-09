CREATE TABLE nw202203.promotions (
	idpromotion int(11) auto_increment NOT NULL,
	idplan int(11) NOT NULL,
	idprovider int(11) NOT NULL,
	namepromotion varchar(100) NOT NULL,
	startdate datetime NOT NULL,
	enddate datetime NOT NULL,
	CONSTRAINT promotions_pk PRIMARY KEY (idpromotion),
	CONSTRAINT promotions_FK FOREIGN KEY (idprovider) REFERENCES nw202203.providers(idprovider),
	CONSTRAINT promotions_FK_1 FOREIGN KEY (idplan) REFERENCES nw202203.promotion_plan(idplan)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
