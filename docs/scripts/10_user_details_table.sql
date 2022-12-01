CREATE TABLE `user_details` (
  `iduserdetails` int NOT NULL AUTO_INCREMENT,
  `usercod` bigint NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `idworkzone` int NOT NULL,
  `imgprofile` varchar(200) DEFAULT NULL,
  `img_portada` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`iduserdetails`),
  KEY `user_userdetail_key_idx` (`usercod`) /*!80000 INVISIBLE */,
  KEY `user_workzone_key_idx` (`idworkzone`),
  CONSTRAINT `user_userdetail_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`),
  CONSTRAINT `user_workzone_key` FOREIGN KEY (`idworkzone`) REFERENCES `work_zones` (`idworkzone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
