CREATE TABLE nw202203.brands (
	brandId BIGINT auto_increment NOT NULL,
	brand varchar(50) NOT NULL,
	created DATETIME NULL,
	updated DATETIME NULL,
	CONSTRAINT brands_pk PRIMARY KEY (brandId)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
