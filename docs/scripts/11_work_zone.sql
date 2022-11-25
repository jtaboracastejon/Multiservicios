CREATE TABLE `nw202203`.`work_zones` (
  `idworkzone` INT NOT NULL AUTO_INCREMENT,
  `depto` VARCHAR(45) NOT NULL,
  `status` ENUM('DISP', 'NODISP') NOT NULL COMMENT 'Estado de la zona laboral si se esta operando o no.',
  PRIMARY KEY (`idworkzone`));

  CREATE TABLE `nw202203`.`work_municipalities` (
  `iddepto` INT NOT NULL,
  `municipality` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddepto`),
  CONSTRAINT `depto_municipalities`
    FOREIGN KEY (`iddepto`)
    REFERENCES `nw202203`.`work_zones` (`idworkzone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
