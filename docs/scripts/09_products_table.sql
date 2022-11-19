CREATE TABLE nw202203.products (
	productId BIGINT(16) auto_increment NOT NULL,
	barcode varchar(20) NULL,
	description varchar(100) NULL,
	brandId BIGINT NOT NULL,
	categoryId BIGINT NOT NULL,
	status varchar(10) NULL,
	created DATETIME NULL,
	updated DATETIME NULL,
	CONSTRAINT products_pk PRIMARY KEY (productId)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
