CREATE TABLE nw202203.suscriptions (
	idsuscription int auto_increment NOT NULL,
	startdate datetime NOT NULL,
	enddate datetime NOT NULL,
	CONSTRAINT suscriptions_pk PRIMARY KEY (idsuscription)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

ALTER TABLE nw202203.usuario ADD idsuscription int(11) NULL;
ALTER TABLE nw202203.usuario ADD CONSTRAINT usuario_FK FOREIGN KEY (idsuscription) REFERENCES nw202203.suscriptions(idsuscription);