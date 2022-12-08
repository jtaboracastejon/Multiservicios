CREATE TABLE nw202203.cart (
	idcart int(11) auto_increment NOT NULL,
	usercod bigint(10) NOT NULL,
	idprice int(11) NOT NULL,
	crrcant int(11) NOT NULL,
	crrprice int(11) NOT NULL,
	created datetime NULL,
	updated datetime NULL,
	CONSTRAINT cart_pk PRIMARY KEY (idcart),
	CONSTRAINT usercod_FK FOREIGN KEY (usercod) REFERENCES nw202203.usuario(usercod),
	CONSTRAINT cart_FK FOREIGN KEY (idprice) REFERENCES nw202203.prices(idprice)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE nw202203.transaction (
	idtransaction int(11) auto_increment NOT NULL,
	usercod bigint(10) NOT NULL,
	idprice int(11) NOT NULL,
	crrcant int(11) NOT NULL,
	crrprice int(11) NOT NULL,
	created datetime NULL,
	updated datetime NULL,
	CONSTRAINT transaction_pk PRIMARY KEY (idtransaction),
	CONSTRAINT transaction_FK_1 FOREIGN KEY (usercod) REFERENCES nw202203.usuario(usercod),
	CONSTRAINT transaction_FK_2 FOREIGN KEY (idprice) REFERENCES nw202203.prices(idprice)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

