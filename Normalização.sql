-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema normalizacao
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema normalizacao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `normalizacao` DEFAULT CHARACTER SET utf8 ;
USE `normalizacao` ;

-- -----------------------------------------------------
-- Table `normalizacao`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalizacao`.`Cliente` (
  `CPF` VARCHAR(14) NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `Nascimento` DATETIME NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalizacao`.`Veículo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalizacao`.`Veículo` (
  `Placa` VARCHAR(9) NOT NULL,
  `Veiculo` VARCHAR(20) NOT NULL,
  `Cor` VARCHAR(10) NOT NULL,
  `Diaria` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`Placa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `normalizacao`.`Locação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `normalizacao`.`Locação` (
  `Cód_locação` INT NOT NULL,
  `Placa` VARCHAR(9) NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  `Dias` INT NOT NULL,
  `TOTAL` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`Cód_locação`),
  INDEX `Placa_idx` (`Placa` ASC) VISIBLE,
  INDEX `CPF_idx` (`CPF` ASC) VISIBLE,
  CONSTRAINT `Placa`
    FOREIGN KEY (`Placa`)
    REFERENCES `normalizacao`.`Veículo` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CPF`
    FOREIGN KEY (`CPF`)
    REFERENCES `normalizacao`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
