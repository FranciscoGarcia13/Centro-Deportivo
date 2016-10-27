SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `gimnasio` ;
CREATE SCHEMA IF NOT EXISTS `gimnasio` DEFAULT CHARACTER SET latin1 ;
USE `gimnasio` ;

-- -----------------------------------------------------
-- Table `gimnasio`.`actividad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`actividad` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`actividad` (
  `idACTIVIDAD` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `tipo` VARCHAR(45) NOT NULL ,
  `duracion` VARCHAR(45) NOT NULL ,
  `hora de inicio` VARCHAR(45) NOT NULL ,
  `hora de termino` VARCHAR(45) NOT NULL ,
  `dia` DATE NOT NULL ,
  `nivel` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idACTIVIDAD`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`sucursal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`sucursal` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`sucursal` (
  `idSUCURSAL` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `SUCURSALcol` VARCHAR(10) NULL DEFAULT NULL ,
  `calle` VARCHAR(60) NOT NULL ,
  `colonia` VARCHAR(50) NOT NULL ,
  `Delegacion` VARCHAR(50) NOT NULL ,
  `CodePos` INT(6) NOT NULL ,
  `estado` VARCHAR(30) NOT NULL ,
  `tel` VARCHAR(15) NOT NULL ,
  `mail` VARCHAR(80) NOT NULL ,
  PRIMARY KEY (`idSUCURSAL`) )
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`administrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`administrador` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`administrador` (
  `idADMINISTRADOR` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `SUCURSAL_idSUCURSAL` INT(11) NOT NULL ,
  `direc` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`idADMINISTRADOR`, `SUCURSAL_idSUCURSAL`) ,
  INDEX `fk_ADMINISTRADOR_SUCURSAL1_idx` (`SUCURSAL_idSUCURSAL` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`area` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`area` (
  `idAREA` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `tipo` VARCHAR(45) NULL ,
  `ancho` FLOAT NULL ,
  `largo` FLOAT NULL ,
  `capacidad` INT(11) NULL DEFAULT NULL ,
  `responsable` VARCHAR(45) NULL DEFAULT NULL ,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`idAREA`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`area_has_actividad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`area_has_actividad` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`area_has_actividad` (
  `AREA_idAREA` INT(11) NOT NULL ,
  `ACTIVIDAD_idACTIVIDAD` INT(11) NOT NULL ,
  PRIMARY KEY (`AREA_idAREA`, `ACTIVIDAD_idACTIVIDAD`) ,
  INDEX `fk_AREA_has_ACTIVIDAD_ACTIVIDAD1_idx` (`ACTIVIDAD_idACTIVIDAD` ASC) ,
  INDEX `fk_AREA_has_ACTIVIDAD_AREA1_idx` (`AREA_idAREA` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`curso` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`curso` (
  `idCURSO` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `tipo` VARCHAR(45) NOT NULL ,
  `duracion` VARCHAR(45) NOT NULL ,
  `inicio` DATE NOT NULL ,
  `termino` DATE NOT NULL ,
  `nivel` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idCURSO`) ,
  UNIQUE INDEX `idCURSO_UNIQUE` (`idCURSO` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`area_has_curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`area_has_curso` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`area_has_curso` (
  `AREA_idAREA` INT(11) NOT NULL ,
  `CURSO_idCURSO` INT(11) NOT NULL ,
  PRIMARY KEY (`AREA_idAREA`, `CURSO_idCURSO`) ,
  INDEX `fk_AREA_has_CURSO_CURSO1_idx` (`CURSO_idCURSO` ASC) ,
  INDEX `fk_AREA_has_CURSO_AREA1_idx` (`AREA_idAREA` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`membresia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`membresia` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`membresia` (
  `idMEMBRESIA` INT(11) NOT NULL AUTO_INCREMENT ,
  `fecha_registro` DATE NULL DEFAULT NULL ,
  `tipo` VARCHAR(45) NULL DEFAULT NULL ,
  `servicios` VARCHAR(45) NULL DEFAULT NULL ,
  `caducidad` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`idMEMBRESIA`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`usuario_final`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`usuario_final` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`usuario_final` (
  `idUSUARIO_FINAL` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `rfc` VARCHAR(45) NULL DEFAULT NULL ,
  `inicio` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`idUSUARIO_FINAL`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`cliente` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`cliente` (
  `idCLIENTE` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `curp` VARCHAR(45) NOT NULL ,
  `tipo` VARCHAR(45) NOT NULL ,
  `correo` VARCHAR(45) NOT NULL ,
  `direccion` VARCHAR(80) NULL DEFAULT NULL ,
  `USUARIO_FINAL_idUSUARIO_FINAL` INT(11) NOT NULL ,
  `MEMBRESIA_idMEMBRESIA` INT(11) NOT NULL ,
  PRIMARY KEY (`idCLIENTE`, `USUARIO_FINAL_idUSUARIO_FINAL`, `MEMBRESIA_idMEMBRESIA`) ,
  INDEX `fk_CLIENTE_USUARIO_FINAL1_idx` (`USUARIO_FINAL_idUSUARIO_FINAL` ASC) ,
  INDEX `fk_CLIENTE_MEMBRESIA1_idx` (`MEMBRESIA_idMEMBRESIA` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`instructor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`instructor` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`instructor` (
  `idINSTRUCTOR` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `disiplina` VARCHAR(45) NOT NULL ,
  `curp` VARCHAR(45) NOT NULL ,
  `nss` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idINSTRUCTOR`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`instructor_has_actividad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`instructor_has_actividad` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`instructor_has_actividad` (
  `INSTRUCTOR_idINSTRUCTOR` INT(11) NOT NULL ,
  `ACTIVIDAD_idACTIVIDAD` INT(11) NOT NULL ,
  PRIMARY KEY (`INSTRUCTOR_idINSTRUCTOR`, `ACTIVIDAD_idACTIVIDAD`) ,
  INDEX `fk_INSTRUCTOR_has_ACTIVIDAD_ACTIVIDAD1_idx` (`ACTIVIDAD_idACTIVIDAD` ASC) ,
  INDEX `fk_INSTRUCTOR_has_ACTIVIDAD_INSTRUCTOR1_idx` (`INSTRUCTOR_idINSTRUCTOR` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`instructor_has_curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`instructor_has_curso` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`instructor_has_curso` (
  `INSTRUCTOR_idINSTRUCTOR` INT(11) NOT NULL ,
  `CURSO_idCURSO` INT(11) NOT NULL ,
  PRIMARY KEY (`INSTRUCTOR_idINSTRUCTOR`, `CURSO_idCURSO`) ,
  INDEX `fk_INSTRUCTOR_has_CURSO_CURSO1_idx` (`CURSO_idCURSO` ASC) ,
  INDEX `fk_INSTRUCTOR_has_CURSO_INSTRUCTOR1_idx` (`INSTRUCTOR_idINSTRUCTOR` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`servicio` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`servicio` (
  `idSERVICIO` INT(11) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `tipo` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idSERVICIO`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`membresia_has_servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`membresia_has_servicio` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`membresia_has_servicio` (
  `MEMBRESIA_idMEMBRESIA` INT(11) NOT NULL ,
  `SERVICIO_idSERVICIO` INT(11) NOT NULL ,
  PRIMARY KEY (`MEMBRESIA_idMEMBRESIA`, `SERVICIO_idSERVICIO`) ,
  INDEX `fk_MEMBRESIA_has_SERVICIO_SERVICIO1_idx` (`SERVICIO_idSERVICIO` ASC) ,
  INDEX `fk_MEMBRESIA_has_SERVICIO_MEMBRESIA1_idx` (`MEMBRESIA_idMEMBRESIA` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`sucursal_has_area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`sucursal_has_area` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`sucursal_has_area` (
  `SUCURSAL_idSUCURSAL` INT(11) NOT NULL ,
  `AREA_idAREA` INT(11) NOT NULL ,
  PRIMARY KEY (`SUCURSAL_idSUCURSAL`, `AREA_idAREA`) ,
  INDEX `fk_SUCURSAL_has_AREA_AREA1_idx` (`AREA_idAREA` ASC) ,
  INDEX `fk_SUCURSAL_has_AREA_SUCURSAL_idx` (`SUCURSAL_idSUCURSAL` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`sucursal_has_cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`sucursal_has_cliente` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`sucursal_has_cliente` (
  `SUCURSAL_idSUCURSAL` INT(11) NOT NULL ,
  `CLIENTE_idCLIENTE` INT(11) NOT NULL ,
  PRIMARY KEY (`SUCURSAL_idSUCURSAL`, `CLIENTE_idCLIENTE`) ,
  INDEX `fk_SUCURSAL_has_CLIENTE_CLIENTE1_idx` (`CLIENTE_idCLIENTE` ASC) ,
  INDEX `fk_SUCURSAL_has_CLIENTE_SUCURSAL1_idx` (`SUCURSAL_idSUCURSAL` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `gimnasio`.`sucursal_has_instructor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gimnasio`.`sucursal_has_instructor` ;

CREATE  TABLE IF NOT EXISTS `gimnasio`.`sucursal_has_instructor` (
  `SUCURSAL_idSUCURSAL` INT(11) NOT NULL ,
  `INSTRUCTOR_idINSTRUCTOR` INT(11) NOT NULL ,
  PRIMARY KEY (`SUCURSAL_idSUCURSAL`, `INSTRUCTOR_idINSTRUCTOR`) ,
  INDEX `fk_SUCURSAL_has_INSTRUCTOR_INSTRUCTOR1_idx` (`INSTRUCTOR_idINSTRUCTOR` ASC) ,
  INDEX `fk_SUCURSAL_has_INSTRUCTOR_SUCURSAL1_idx` (`SUCURSAL_idSUCURSAL` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
