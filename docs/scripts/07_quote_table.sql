CREATE TABLE nw202203.quotes (    
	quoteId BIGINT(18) auto_increment NOT NULL,
	quote varchar(512) NULL,
	author varchar(128) NULL,
	status char(3) NULL,
	created DATETIME NULL,
	updated DATETIME NULL,
	CONSTRAINT quotes_pk PRIMARY KEY (quoteid)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
