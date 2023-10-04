-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbfirst` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema persoonsite
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema persoonsite
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `persoonsite` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gameraccount` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dbfirst` ;

-- -----------------------------------------------------
-- Table `dbfirst`.`bol.com`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`bol.com` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`bol.com` (
  `idBol.com` INT UNSIGNED NOT NULL,
  `producten` VARCHAR(45) NOT NULL,
  `Werknemers` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idBol.com`),
  UNIQUE INDEX `idBol.com_UNIQUE` (`idBol.com` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`mediamarkt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`mediamarkt` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`mediamarkt` (
  `idMediamarkt` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idMediamarkt`),
  UNIQUE INDEX `idMediamarkt_UNIQUE` (`idMediamarkt` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `persoonsite` ;

-- -----------------------------------------------------
-- Table `persoonsite`.`bezorgbussen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `persoonsite`.`bezorgbussen` ;

CREATE TABLE IF NOT EXISTS `persoonsite`.`bezorgbussen` (
  `idBezorgbussen` INT UNSIGNED NOT NULL,
  `Meegenomenpaketten` VARCHAR(45) NOT NULL,
  `Bezorgmomenten` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idBezorgbussen`),
  UNIQUE INDEX `idBezorgbussen_UNIQUE` (`idBezorgbussen` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `persoonsite`.`locaties`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `persoonsite`.`locaties` ;

CREATE TABLE IF NOT EXISTS `persoonsite`.`locaties` (
  `idlocaties` INT UNSIGNED NOT NULL,
  `Adres` VARCHAR(45) NOT NULL,
  `Woonplaats` VARCHAR(45) NOT NULL,
  `Ontvanger` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idlocaties`),
  UNIQUE INDEX `idlocaties_UNIQUE` (`idlocaties` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `persoonsite`.`paketjes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `persoonsite`.`paketjes` ;

CREATE TABLE IF NOT EXISTS `persoonsite`.`paketjes` (
  `idPaketjes` INT UNSIGNED NOT NULL,
  `berzorgadres` VARCHAR(45) NOT NULL,
  `gewicht` VARCHAR(45) NOT NULL,
  `locaties_idlocaties` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idPaketjes`, `locaties_idlocaties`),
  UNIQUE INDEX `idPaketjes_UNIQUE` (`idPaketjes` ASC) VISIBLE,
  INDEX `fk_paketjes_locaties1_idx` (`locaties_idlocaties` ASC) VISIBLE,
  CONSTRAINT `fk_paketjes_locaties1`
    FOREIGN KEY (`locaties_idlocaties`)
    REFERENCES `persoonsite`.`locaties` (`idlocaties`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `persoonsite`.`bezorgbussen_has_paketjes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `persoonsite`.`bezorgbussen_has_paketjes` ;

CREATE TABLE IF NOT EXISTS `persoonsite`.`bezorgbussen_has_paketjes` (
  `bezorgbussen_idBezorgbussen` INT UNSIGNED NOT NULL,
  `paketjes_idPaketjes` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`bezorgbussen_idBezorgbussen`, `paketjes_idPaketjes`),
  INDEX `fk_bezorgbussen_has_paketjes_paketjes1_idx` (`paketjes_idPaketjes` ASC) VISIBLE,
  INDEX `fk_bezorgbussen_has_paketjes_bezorgbussen_idx` (`bezorgbussen_idBezorgbussen` ASC) VISIBLE,
  CONSTRAINT `fk_bezorgbussen_has_paketjes_bezorgbussen`
    FOREIGN KEY (`bezorgbussen_idBezorgbussen`)
    REFERENCES `persoonsite`.`bezorgbussen` (`idBezorgbussen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bezorgbussen_has_paketjes_paketjes1`
    FOREIGN KEY (`paketjes_idPaketjes`)
    REFERENCES `persoonsite`.`paketjes` (`idPaketjes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `gameraccount` ;

-- -----------------------------------------------------
-- Table `gameraccount`.`gamerprofiel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`gamerprofiel` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`gamerprofiel` (
  `idgamerprofiel` INT UNSIGNED NOT NULL,
  `gamertag` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `profielfoto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idgamerprofiel`),
  UNIQUE INDEX `idusername_UNIQUE` (`idgamerprofiel` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameraccount`.`abonnement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`abonnement` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`abonnement` (
  `idAbonnement` INT NOT NULL,
  `Xboxgamepass` VARCHAR(45) NOT NULL,
  `Playstationplus` VARCHAR(45) NOT NULL,
  `Nintendoonline` VARCHAR(45) NOT NULL,
  `gamerprofiel_idgamerprofiel` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idAbonnement`),
  INDEX `fk_abonnement_gamerprofiel_idx` (`gamerprofiel_idgamerprofiel` ASC) VISIBLE,
  CONSTRAINT `fk_abonnement_gamerprofiel`
    FOREIGN KEY (`gamerprofiel_idgamerprofiel`)
    REFERENCES `gameraccount`.`gamerprofiel` (`idgamerprofiel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameraccount`.`games`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`games` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`games` (
  `idGames` INT UNSIGNED NOT NULL,
  `Achievementsbehaald` VARCHAR(45) NOT NULL,
  `Game` VARCHAR(45) NOT NULL,
  `Beschikbareachievements` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGames`),
  UNIQUE INDEX `idGames_UNIQUE` (`idGames` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameraccount`.`gamerprofiel_has_games`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gameraccount`.`gamerprofiel_has_games` ;

CREATE TABLE IF NOT EXISTS `gameraccount`.`gamerprofiel_has_games` (
  `gamerprofiel_idgamerprofiel` INT UNSIGNED NOT NULL,
  `games_idGames` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`gamerprofiel_idgamerprofiel`, `games_idGames`),
  INDEX `fk_gamerprofiel_has_games_games1_idx` (`games_idGames` ASC) VISIBLE,
  INDEX `fk_gamerprofiel_has_games_gamerprofiel1_idx` (`gamerprofiel_idgamerprofiel` ASC) VISIBLE,
  CONSTRAINT `fk_gamerprofiel_has_games_gamerprofiel1`
    FOREIGN KEY (`gamerprofiel_idgamerprofiel`)
    REFERENCES `gameraccount`.`gamerprofiel` (`idgamerprofiel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gamerprofiel_has_games_games1`
    FOREIGN KEY (`games_idGames`)
    REFERENCES `gameraccount`.`games` (`idGames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
