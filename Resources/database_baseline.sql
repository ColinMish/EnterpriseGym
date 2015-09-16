-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Enterprise_Gym
-- -----------------------------------------------------
-- Schema used for Group 5 Enterprise Gym database
DROP SCHEMA IF EXISTS `Enterprise_Gym` ;

-- -----------------------------------------------------
-- Schema Enterprise_Gym
--
-- Schema used for Group 5 Enterprise Gym database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Enterprise_Gym` ;
USE `Enterprise_Gym` ;

-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`accessToken`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Enterprise_Gym`.`accessToken` ;

CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`accessToken` (
  `idaccessToken` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `level` INT NULL COMMENT '',
  `description` VARCHAR(500) NULL COMMENT '',
  PRIMARY KEY (`idaccessToken`)  COMMENT '',
  UNIQUE INDEX `idaccessToken_UNIQUE` (`idaccessToken` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Enterprise_Gym`.`account` ;

CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`account` (
  `idaccount` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `username` VARCHAR(200) NOT NULL COMMENT '',
  `password` VARCHAR(500) NOT NULL COMMENT '',
  `accessToken_idaccessToken` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idaccount`, `accessToken_idaccessToken`)  COMMENT '',
  UNIQUE INDEX `username_UNIQUE` (`username` ASC)  COMMENT '',
  INDEX `fk_account_accessToken1_idx` (`accessToken_idaccessToken` ASC)  COMMENT '',
  CONSTRAINT `fk_account_accessToken1`
    FOREIGN KEY (`accessToken_idaccessToken`)
    REFERENCES `Enterprise_Gym`.`accessToken` (`idaccessToken`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Enterprise_Gym`.`user` ;

CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `first name` VARCHAR(45) NOT NULL COMMENT '',
  `last name` VARCHAR(45) NOT NULL COMMENT '',
  `gender` VARCHAR(6) NOT NULL COMMENT '',
  `country` VARCHAR(45) NULL COMMENT '',
  `university` VARCHAR(45) NULL COMMENT '',
  `school` VARCHAR(45) NULL COMMENT '',
  `year` YEAR NULL COMMENT '',
  `email` VARCHAR(45) NULL COMMENT '',
  `account_idaccount` INT UNSIGNED NOT NULL COMMENT '',
  `matriculation` INT NULL COMMENT '',
  `points` INT NOT NULL DEFAULT 0 COMMENT '',
  PRIMARY KEY (`iduser`)  COMMENT '',
  UNIQUE INDEX `iduser_UNIQUE` (`iduser` ASC)  COMMENT '',
  INDEX `fk_user_account1_idx` (`account_idaccount` ASC)  COMMENT '',
  CONSTRAINT `fk_user_account1`
    FOREIGN KEY (`account_idaccount`)
    REFERENCES `Enterprise_Gym`.`account` (`idaccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`theme`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Enterprise_Gym`.`theme` ;

CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`theme` (
  `idtheme` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `points` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idtheme`)  COMMENT '',
  UNIQUE INDEX `idtheme_UNIQUE` (`idtheme` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Enterprise_Gym`.`event` ;

CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`event` (
  `idevent` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NULL COMMENT '',
  `decription` VARCHAR(1000) NULL COMMENT '',
  `date` DATE NULL COMMENT '',
  `eventcol` INT NULL COMMENT '',
  `theme_idtheme` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idevent`)  COMMENT '',
  UNIQUE INDEX `idevent_UNIQUE` (`idevent` ASC)  COMMENT '',
  INDEX `fk_event_theme_idx` (`theme_idtheme` ASC)  COMMENT '',
  CONSTRAINT `fk_event_theme`
    FOREIGN KEY (`theme_idtheme`)
    REFERENCES `Enterprise_Gym`.`theme` (`idtheme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`newsItem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Enterprise_Gym`.`newsItem` ;

CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`newsItem` (
  `idnewsItem` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NULL COMMENT '',
  `story` VARCHAR(1000) NULL COMMENT '',
  `image` BLOB NULL COMMENT '',
  `event_idevent` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idnewsItem`)  COMMENT '',
  UNIQUE INDEX `idnewsItem_UNIQUE` (`idnewsItem` ASC)  COMMENT '',
  INDEX `fk_newsItem_event1_idx` (`event_idevent` ASC)  COMMENT '',
  CONSTRAINT `fk_newsItem_event1`
    FOREIGN KEY (`event_idevent`)
    REFERENCES `Enterprise_Gym`.`event` (`idevent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`event_has_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Enterprise_Gym`.`event_has_user` ;

CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`event_has_user` (
  `event_idevent` INT NOT NULL COMMENT '',
  `user_iduser` INT NOT NULL COMMENT '',
  `attended` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '',
  PRIMARY KEY (`event_idevent`, `user_iduser`)  COMMENT '',
  INDEX `fk_event_has_user_user1_idx` (`user_iduser` ASC)  COMMENT '',
  INDEX `fk_event_has_user_event1_idx` (`event_idevent` ASC)  COMMENT '',
  CONSTRAINT `fk_event_has_user_event1`
    FOREIGN KEY (`event_idevent`)
    REFERENCES `Enterprise_Gym`.`event` (`idevent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_user_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `Enterprise_Gym`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
