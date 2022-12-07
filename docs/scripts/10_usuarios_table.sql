CREATE TABLE `usuario` (
  `usercod` bigint(10) NOT NULL AUTO_INCREMENT,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  `token` varchar(100) DEFAULT NULL,
  `tokenexp` datetime DEFAULT NULL,
  `tokenest` varchar(3) DEFAULT NULL,
  `emailverified` enum('ITSNV','ITSV') NOT NULL DEFAULT 'ITSNV',
  PRIMARY KEY (`usercod`),
  UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

CREATE TABLE `user_details` (
  `iduserdetail` int(11) NOT NULL AUTO_INCREMENT,
  `usercod` bigint(20) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `idworkzone` int(11) NOT NULL,
  `imgprofile` varchar(200) DEFAULT NULL,
  `imgportada` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`iduserdetail`),
  KEY `usercod_userdtdeails_idx` (`usercod`),
  KEY `workzone_userdetalil_idx` (`idworkzone`),
  CONSTRAINT `usercod_userdtdeails` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

