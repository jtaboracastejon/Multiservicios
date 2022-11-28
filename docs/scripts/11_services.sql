CREATE TABLE nw202203.services (
	idservice TINYINT auto_increment NOT NULL,
	servicename varchar(50) NOT NULL,
	description varchar(100) NULL,
	imagepath varchar(250) NULL,
	status ENUM('ACT','INA') DEFAULT 'ACT' NOT NULL,
	CONSTRAINT services_pk PRIMARY KEY (idservice)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

CREATE TABLE nw202203.reviews_pag (
  idreviewpage int(11) NOT NULL AUTO_INCREMENT,
  iduserdetail int(11) NOT NULL,
  title varchar(50) DEFAULT NULL,
  review varchar(4000) NOT NULL,
  PRIMARY KEY (idreviewpage),
  KEY reviews_pag_FK (iduserdetail),
  CONSTRAINT reviews_pag_FK FOREIGN KEY (iduserdetail) REFERENCES user_details (iduserdetails)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;