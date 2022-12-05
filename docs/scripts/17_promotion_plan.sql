CREATE TABLE nw202203.promotion_plan (
	idplan int(11) auto_increment NOT NULL,
	days int(11) NOT NULL,
	price int NOT NULL,
	CONSTRAINT Amor_eterno_pk PRIMARY KEY (idplan)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;
