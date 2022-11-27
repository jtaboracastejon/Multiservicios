CREATE TABLE nw202203.user_verifications (
	idverification INT(11) auto_increment NOT NULL,
	usercod bigint(11) NOT NULL,
	DNI varchar(100) NOT NULL,
	address varchar(250) NOT NULL,
	statusprocess ENUM('VERIFICADO','NO VERIFICADO','DENEGADO') NOT NULL,
	CONSTRAINT user_verifications_pk PRIMARY KEY (idverification),
	CONSTRAINT user_verifications_FK FOREIGN KEY (usercod) REFERENCES nw202203.usuario(usercod)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
