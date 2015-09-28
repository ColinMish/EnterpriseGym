-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Enterprise_Gym
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Enterprise_Gym
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Enterprise_Gym` DEFAULT CHARACTER SET latin1 ;
USE `Enterprise_Gym` ;

-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`Quiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`Quiz` (
  `idQuiz` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `points` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idQuiz`)  COMMENT '',
  UNIQUE INDEX `idQuiz_UNIQUE` (`idQuiz` ASC)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`Question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`Question` (
  `idQuestion` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `question` VARCHAR(500) NOT NULL COMMENT '',
  `number` INT(10) UNSIGNED NOT NULL COMMENT '',
  `answerOne` VARCHAR(500) NOT NULL COMMENT '',
  `answerTwo` VARCHAR(500) NOT NULL COMMENT '',
  `answerThree` VARCHAR(500) NOT NULL COMMENT '',
  `answerFour` VARCHAR(500) NOT NULL COMMENT '',
  `correctAnswer` INT(11) NOT NULL COMMENT '',
  `Quiz_idQuiz` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`idQuestion`)  COMMENT '',
  UNIQUE INDEX `idQuestion_UNIQUE` (`idQuestion` ASC)  COMMENT '',
  INDEX `fk_Question_Quiz1_idx` (`Quiz_idQuiz` ASC)  COMMENT '',
  CONSTRAINT `fk_Question_Quiz1`
    FOREIGN KEY (`Quiz_idQuiz`)
    REFERENCES `Enterprise_Gym`.`Quiz` (`idQuiz`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`accessToken`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`accessToken` (
  `idaccessToken` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `description` VARCHAR(500) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idaccessToken`)  COMMENT '',
  UNIQUE INDEX `idaccessToken_UNIQUE` (`idaccessToken` ASC)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`accessToken_has_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`accessToken_has_account` (
  `accessToken_idaccessToken` INT(11) NOT NULL COMMENT '',
  `account_idaccount` INT(10) UNSIGNED NOT NULL COMMENT '',
  PRIMARY KEY (`accessToken_idaccessToken`, `account_idaccount`)  COMMENT '',
  INDEX `fk_accessToken_has_account_account1_idx` (`account_idaccount` ASC)  COMMENT '',
  INDEX `fk_accessToken_has_account_accessToken1_idx` (`accessToken_idaccessToken` ASC)  COMMENT '',
  CONSTRAINT `fk_accessToken_has_account_accessToken1`
    FOREIGN KEY (`accessToken_idaccessToken`)
    REFERENCES `Enterprise_Gym`.`accessToken` (`idaccessToken`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`account` (
  `idaccount` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `username` VARCHAR(200) NOT NULL COMMENT '',
  `password` VARCHAR(500) NOT NULL COMMENT '',
  `salt` VARCHAR(1000) NULL DEFAULT NULL COMMENT '',
  `date_joined` DATE NOT NULL COMMENT '',
  `date_active` DATE NULL DEFAULT NULL COMMENT '',
  `temp` TINYINT(1) NULL DEFAULT '0' COMMENT '',
  `reset_token` VARCHAR(200) NULL DEFAULT NULL COMMENT '',
  `token_expire` TIMESTAMP NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idaccount`)  COMMENT '',
  UNIQUE INDEX `username_UNIQUE` (`username` ASC)  COMMENT '',
  UNIQUE INDEX `token_expire_UNIQUE` (`token_expire` ASC)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 60
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`theme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`theme` (
  `idtheme` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `points` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`idtheme`)  COMMENT '',
  UNIQUE INDEX `idtheme_UNIQUE` (`idtheme` ASC)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`event` (
  `idevent` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `description` VARCHAR(1000) NULL DEFAULT NULL COMMENT '',
  `date` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `eventcol` INT(11) NULL DEFAULT NULL COMMENT '',
  `theme_idtheme` INT(11) NOT NULL COMMENT '',
  `image` LONGBLOB NULL DEFAULT NULL COMMENT '',
  `image_length` INT(11) NULL DEFAULT NULL COMMENT '',
  `image_type` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `location` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `end_date` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `points` INT(11) NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (`idevent`)  COMMENT '',
  UNIQUE INDEX `idevent_UNIQUE` (`idevent` ASC)  COMMENT '',
  INDEX `fk_event_theme_idx` (`theme_idtheme` ASC)  COMMENT '',
  CONSTRAINT `fk_event_theme`
    FOREIGN KEY (`theme_idtheme`)
    REFERENCES `Enterprise_Gym`.`theme` (`idtheme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`user` (
  `iduser` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `first_name` VARCHAR(45) NOT NULL COMMENT '',
  `last_name` VARCHAR(45) NOT NULL COMMENT '',
  `gender` VARCHAR(6) NULL DEFAULT NULL COMMENT '',
  `country` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `university` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `school` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `subject` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `year` YEAR NULL DEFAULT NULL COMMENT '',
  `email` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `account_idaccount` INT(10) UNSIGNED NOT NULL COMMENT '',
  `matriculation` INT(11) NULL DEFAULT NULL COMMENT '',
  `action_points` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `practice_points` INT(11) NULL DEFAULT '0' COMMENT '',
  `virtual_points` INT(11) NULL DEFAULT '0' COMMENT '',
  `project_points` INT(11) NULL DEFAULT '0' COMMENT '',
  `theory_points` INT(11) NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (`iduser`)  COMMENT '',
  UNIQUE INDEX `iduser_UNIQUE` (`iduser` ASC)  COMMENT '',
  INDEX `fk_user_account1_idx` (`account_idaccount` ASC)  COMMENT '',
  CONSTRAINT `fk_user_account1`
    FOREIGN KEY (`account_idaccount`)
    REFERENCES `Enterprise_Gym`.`account` (`idaccount`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 42
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`event_has_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`event_has_user` (
  `event_idevent` INT(11) NOT NULL COMMENT '',
  `user_iduser` INT(11) NOT NULL COMMENT '',
  `attended` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (`event_idevent`, `user_iduser`)  COMMENT '',
  INDEX `fk_event_has_user_user1_idx` (`user_iduser` ASC)  COMMENT '',
  INDEX `fk_event_has_user_event1_idx` (`event_idevent` ASC)  COMMENT '',
  CONSTRAINT `fk_event_has_user_event1`
    FOREIGN KEY (`event_idevent`)
    REFERENCES `Enterprise_Gym`.`event` (`idevent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_event_has_user_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `Enterprise_Gym`.`user` (`iduser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Enterprise_Gym`.`newsItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Enterprise_Gym`.`newsItem` (
  `idnewsItem` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `title` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `story` VARCHAR(1000) NULL DEFAULT NULL COMMENT '',
  `image` LONGBLOB NULL DEFAULT NULL COMMENT '',
  `dateAdded` DATE NOT NULL COMMENT '',
  `image_type` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `image_length` INT(11) NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (`idnewsItem`)  COMMENT '',
  UNIQUE INDEX `idnewsItem_UNIQUE` (`idnewsItem` ASC)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 77
DEFAULT CHARACTER SET = latin1;

USE `Enterprise_Gym` ;

-- -----------------------------------------------------
-- procedure AddIndividualTheme
-- -----------------------------------------------------

DELIMITER $$
USE `Enterprise_Gym`$$
CREATE DEFINER=`davidkenny`@`134.36.154.%` PROCEDURE `AddIndividualTheme`()
BEGIN
IF NOT EXISTS (SELECT idtheme FROM theme WHERE idtheme = 1) THEN INSERT INTO theme 
	(idtheme, name, points) Value (1, 'Action', 10);
    END IF;
    
    IF NOT EXISTS (SELECT idtheme FROM theme WHERE idtheme = 2) THEN INSERT INTO theme 
	(idtheme, name, points) Value (2, 'Practice', 10);
    END IF;
    
    IF NOT EXISTS (SELECT idtheme FROM theme WHERE idtheme = 3) THEN INSERT INTO theme 
	(idtheme, name, points) Value (3, 'Virtual', 10);
    END IF;
    
    IF NOT EXISTS (SELECT idtheme FROM theme WHERE idtheme = 4) THEN INSERT INTO theme 
	(idtheme, name, points) Value (4, 'Project', 10);
    END IF;
    
    IF NOT EXISTS (SELECT idtheme FROM theme WHERE idtheme = 5) THEN INSERT INTO theme 
	(idtheme, name, points) Value (5, 'Theory', 10);
    END IF;
    

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure AddIndividualTokens
-- -----------------------------------------------------

DELIMITER $$
USE `Enterprise_Gym`$$
CREATE DEFINER=`davidkenny`@`134.36.154.%` PROCEDURE `AddIndividualTokens`()
BEGIN
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 1) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (1, 'Can manage quizes');
    END IF;
    
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 2) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (2, 'Can manage news itemns');
    END IF;
    
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 3) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (3, 'Can manage event items');
    END IF;
    
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 4) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value  (4, 'Can ok participan attendance for an event');
    END IF;
    
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 5) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (5, 'Can access charts');
    END IF;
    
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 6) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (6, 'Can give out token');
    END IF;
    
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 7) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (7, 'Can manage theme scores');
    END IF;
        
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure AddThemes
-- -----------------------------------------------------

DELIMITER $$
USE `Enterprise_Gym`$$
CREATE DEFINER=`davidkenny`@`134.36.154.%` PROCEDURE `AddThemes`()
BEGIN
	IF (SELECT count(*) FROM theme)< 5 THEN CALL AddIndividaulTheme;
    END IF;
    
	IF (SELECT count(*) FROM theme)= 0 THEN INSERT INTO theme (idtheme, name, points) Value
		((1, 'Action', 10),(2, 'Practice', 10), (3, 'Virtual', 10), 
		(4, 'Project', 10), (5, 'Theory', 10));
        END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure AddTokens
-- -----------------------------------------------------

DELIMITER $$
USE `Enterprise_Gym`$$
CREATE DEFINER=`davidkenny`@`134.36.154.%` PROCEDURE `AddTokens`()
BEGIN

IF (SELECT count(*) FROM accessToken) < 7 THEN CALL AddIndividualTokens;
	END IF;

IF (SELECT count(*) FROM accessToken) = 0 THEN INSERT INTO accessToken (idaccessToken, description) value 
    ((1, 'Can manage quizes'), (2, 'Can manage news itemns'), (3, 'Can manage event items'), 
    (4, 'Can ok participan attendance for an event'), (5, 'Can access charts'), (6, 'Can give out token'),
    (7, 'Can manage theme scores'));
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure RemoveResetToken
-- -----------------------------------------------------

DELIMITER $$
USE `Enterprise_Gym`$$
CREATE DEFINER=`davidkenny`@`134.36.154.%` PROCEDURE `RemoveResetToken`()
BEGIN
	UPDATE account 
	SET reset_token = null 
    WHERE token_expire < current_timestamp - interval '12' hour;

	UPDATE account 
SET 
    token_expire = NULL
WHERE
    token_expire < CURRENT_TIMESTAMP - INTERVAL '12' HOUR;
    
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
