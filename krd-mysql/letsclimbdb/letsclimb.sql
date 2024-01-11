-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema letsclimbdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `letsclimbdb` ;

-- -----------------------------------------------------
-- Schema letsclimbdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `letsclimbdb` DEFAULT CHARACTER SET utf8 ;
USE `letsclimbdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `username` VARCHAR(75) NOT NULL,
  `password` VARCHAR(2000) NOT NULL,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `creation_ts` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `image_file_path` VARCHAR(7000) NULL,
  `image_file_name` VARCHAR(7000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `climb`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `climb` ;

CREATE TABLE IF NOT EXISTS `climb` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `grade` VARCHAR(5) NULL,
  `style` VARCHAR(20) NULL,
  `pitches` INT NULL,
  `danger` VARCHAR(20) NULL,
  `description` TEXT NULL,
  `state_abbreviation` CHAR(2) NULL,
  `area_name` VARCHAR(150) NULL,
  `crag_name` VARCHAR(400) NULL,
  `crag_longitude` DOUBLE NULL,
  `crag_latitude` DOUBLE NULL,
  `is_ticked` TINYINT NULL,
  `stars` SMALLINT NULL,
  `first_send_date` DATE NULL,
  `image_file_path` VARCHAR(7000) NULL,
  `image_file_name` VARCHAR(7000) NULL,
  `creation_ts` TIMESTAMP NULL,
  `revision_ts` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_climb_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_climb_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `attempt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `attempt` ;

CREATE TABLE IF NOT EXISTS `attempt` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `did_send` TINYINT NULL,
  `description` TEXT NULL,
  `creation_ts` TIMESTAMP NULL,
  `revision_ts` TIMESTAMP NULL,
  `climb_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_attempt_climb1_idx` (`climb_id` ASC),
  CONSTRAINT `fk_attempt_climb1`
    FOREIGN KEY (`climb_id`)
    REFERENCES `climb` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grade` ;

CREATE TABLE IF NOT EXISTS `grade` (
  `id` INT NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boulder_grade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boulder_grade` ;

CREATE TABLE IF NOT EXISTS `boulder_grade` (
  `id` INT NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `style`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `style` ;

CREATE TABLE IF NOT EXISTS `style` (
  `id` INT NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `danger`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `danger` ;

CREATE TABLE IF NOT EXISTS `danger` (
  `id` INT NOT NULL,
  `name` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `attempt_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `attempt_image` ;

CREATE TABLE IF NOT EXISTS `attempt_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file_path` VARCHAR(7000) NULL,
  `file_name` VARCHAR(7000) NULL,
  `attempt_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_attempt_image_attempt1_idx` (`attempt_id` ASC),
  CONSTRAINT `fk_attempt_image_attempt1`
    FOREIGN KEY (`attempt_id`)
    REFERENCES `attempt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS letsclimb@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'letsclimb'@'localhost' IDENTIFIED BY 'letsclimb';
GRANT ALTER, SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'letsclimb'@'localhost';
GRANT ALL ON * TO 'letsclimb'@'localhost';

SET SQL_MODE = '';
DROP USER IF EXISTS letsclimb;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'letsclimb' IDENTIFIED BY 'letsclimb';
GRANT ALTER, SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'letsclimb';
GRANT ALL ON * TO 'letsclimb';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `letsclimbdb`;
INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `creation_ts`, `is_active`, `role`, `image_file_path`, `image_file_name`) VALUES (1, 'kylerobison15@gmail.com', 'KyleRobison', '$2a$10$NEt1zBWjgeIkNWoKLI2AJuB57kjnGJ56TJmPQSa7E016Uo1FbKmHK', 'Kyle', 'Robison', '2023-12-20 17:45:37', 1, 'admin', NULL, NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `creation_ts`, `is_active`, `role`, `image_file_path`, `image_file_name`) VALUES (2, 'eegates1015@gmail.com', 'ErinRobison', '$2a$10$NEt1zBWjgeIkNWoKLI2AJuB57kjnGJ56TJmPQSa7E016Uo1FbKmHK', 'Erin', 'Robison', '2023-12-20 17:45:37', 1, 'user', NULL, NULL);
INSERT INTO `user` (`id`, `email`, `username`, `password`, `first_name`, `last_name`, `creation_ts`, `is_active`, `role`, `image_file_path`, `image_file_name`) VALUES (3, 'joesmith@example.com', 'JoeSmith', '$2a$10$NEt1zBWjgeIkNWoKLI2AJuB57kjnGJ56TJmPQSa7E016Uo1FbKmHK', 'Joe', 'Smith', '2023-12-20 17:45:37', 1, 'user', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `climb`
-- -----------------------------------------------------
START TRANSACTION;
USE `letsclimbdb`;
INSERT INTO `climb` (`id`, `user_id`, `name`, `grade`, `style`, `pitches`, `danger`, `description`, `state_abbreviation`, `area_name`, `crag_name`, `crag_longitude`, `crag_latitude`, `is_ticked`, `stars`, `first_send_date`, `image_file_path`, `image_file_name`, `creation_ts`, `revision_ts`) VALUES (1, 1, 'North Chimney', '5.9', 'Trad', 5, NULL, 'This is probably the easiest route on Castleton, and is a fantastic climb. To reach, hike up the talus as for the Kor-Ingalls, when you reach the base, walk around to the north end of the tower and traverse out on a ledge to the base of the chimney which is right on the left hand corner of the North Face. ', 'UT', 'Castle Valley', 'Castleton Tower', 38.651, -109.3678, 1, 4, '2023-10-12', NULL, NULL, '2023-12-19 17:45:37', '2023-12-19 17:45:37');
INSERT INTO `climb` (`id`, `user_id`, `name`, `grade`, `style`, `pitches`, `danger`, `description`, `state_abbreviation`, `area_name`, `crag_name`, `crag_longitude`, `crag_latitude`, `is_ticked`, `stars`, `first_send_date`, `image_file_path`, `image_file_name`, `creation_ts`, `revision_ts`) VALUES (2, 1, 'Bastille Crack', '5.7+', 'Trad', 4, 'PG', 'One of the most classic climbs in the country, it begins right off the road on the Bastille, a 350\' cliff on the left as you enter the canyon. Often crowded, a weekday is probably the best time to attempt this climb.\n\nThe climb is north facing and in the shade until mid-afternoon. As Jim Erickson said in his classic 1980 Rocky Heights guidebook, \"avoid it like the plague if the weather is not warm, or you will shiver away much of its charm.\"', 'CO', 'Eldorado Canyon', 'The Bastille', 39.9307, -105.283, 1, 4, '2023-10-12', NULL, NULL, '2023-12-19 17:45:37', '2023-12-19 17:45:37');
INSERT INTO `climb` (`id`, `user_id`, `name`, `grade`, `style`, `pitches`, `danger`, `description`, `state_abbreviation`, `area_name`, `crag_name`, `crag_longitude`, `crag_latitude`, `is_ticked`, `stars`, `first_send_date`, `image_file_path`, `image_file_name`, `creation_ts`, `revision_ts`) VALUES (3, 1, 'Rewritten', '5.7+', 'Trad', 6, NULL, 'This is another excellent classic on Redgarden. Six pitches takes you to the summit of the Middle Buttress via Rebuffat\'s Arete. Start at the base of the West Chimney below the Middle Buttress about 15 feet left of an alcove.', 'CO', 'Eldorado Canyon', 'Redgarden Wall', 39.93149, -105.28398, 1, 4, '2023-10-12', NULL, NULL, '2023-12-19 17:45:37', '2023-12-19 17:45:37');
INSERT INTO `climb` (`id`, `user_id`, `name`, `grade`, `style`, `pitches`, `danger`, `description`, `state_abbreviation`, `area_name`, `crag_name`, `crag_longitude`, `crag_latitude`, `is_ticked`, `stars`, `first_send_date`, `image_file_path`, `image_file_name`, `creation_ts`, `revision_ts`) VALUES (4, 1, 'Time Stand Still', '5.10b', 'Sport', 7, NULL, 'This is a nice and varied seven pitch route that zigzags it\'s way up Devils Head Rock. A 70 meter rope is required to rappel the route. Otherwise, you\'ll need to walk off after the 6th pitch', 'CO', 'Devil\'s Head', 'Devil\'s Head Rock', 39.25393, -105.08976, 0, 4, '2023-10-12', NULL, NULL, '2023-12-19 17:45:37', '2023-12-19 17:45:37');

COMMIT;


-- -----------------------------------------------------
-- Data for table `attempt`
-- -----------------------------------------------------
START TRANSACTION;
USE `letsclimbdb`;
INSERT INTO `attempt` (`id`, `date`, `did_send`, `description`, `creation_ts`, `revision_ts`, `climb_id`) VALUES (1, '2023-09-24', 0, 'Got wind and rained out unfortunately.', '2023-12-19 17:45:37', '2023-12-19 17:45:37', 1);
INSERT INTO `attempt` (`id`, `date`, `did_send`, `description`, `creation_ts`, `revision_ts`, `climb_id`) VALUES (2, '2023-10-12', 1, 'Absoultely incredible. I\'ve always wanted to climb Castelton Tower since the moment I saw it my first time in Moab. Erin and I finally did it!', '2023-12-19 17:45:37', '2023-12-19 17:45:37', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `grade`
-- -----------------------------------------------------
START TRANSACTION;
USE `letsclimbdb`;
INSERT INTO `grade` (`id`, `name`) VALUES (1, '5.4');
INSERT INTO `grade` (`id`, `name`) VALUES (2, '5.5');
INSERT INTO `grade` (`id`, `name`) VALUES (3, '5.6');
INSERT INTO `grade` (`id`, `name`) VALUES (4, '5.7');
INSERT INTO `grade` (`id`, `name`) VALUES (5, '5.7+');
INSERT INTO `grade` (`id`, `name`) VALUES (6, '5.8-');
INSERT INTO `grade` (`id`, `name`) VALUES (7, '5.8');
INSERT INTO `grade` (`id`, `name`) VALUES (8, '5.8+');
INSERT INTO `grade` (`id`, `name`) VALUES (9, '5.9-');
INSERT INTO `grade` (`id`, `name`) VALUES (10, '5.9');
INSERT INTO `grade` (`id`, `name`) VALUES (11, '5.9+');
INSERT INTO `grade` (`id`, `name`) VALUES (12, '5.10-');
INSERT INTO `grade` (`id`, `name`) VALUES (13, '5.10');
INSERT INTO `grade` (`id`, `name`) VALUES (14, '5.10+');
INSERT INTO `grade` (`id`, `name`) VALUES (15, '5.10a');
INSERT INTO `grade` (`id`, `name`) VALUES (16, '5.10b');
INSERT INTO `grade` (`id`, `name`) VALUES (17, '5.10c');
INSERT INTO `grade` (`id`, `name`) VALUES (18, '5.10d');
INSERT INTO `grade` (`id`, `name`) VALUES (19, '5.11-');
INSERT INTO `grade` (`id`, `name`) VALUES (20, '5.11');
INSERT INTO `grade` (`id`, `name`) VALUES (21, '5.11+');
INSERT INTO `grade` (`id`, `name`) VALUES (22, '5.11a');
INSERT INTO `grade` (`id`, `name`) VALUES (23, '5.11b');
INSERT INTO `grade` (`id`, `name`) VALUES (24, '5.11c');
INSERT INTO `grade` (`id`, `name`) VALUES (25, '5.11d');
INSERT INTO `grade` (`id`, `name`) VALUES (26, '5.12-');
INSERT INTO `grade` (`id`, `name`) VALUES (27, '5.12');
INSERT INTO `grade` (`id`, `name`) VALUES (28, '5.12+');
INSERT INTO `grade` (`id`, `name`) VALUES (29, '5.12a');
INSERT INTO `grade` (`id`, `name`) VALUES (30, '5.12b');
INSERT INTO `grade` (`id`, `name`) VALUES (31, '5.12c');
INSERT INTO `grade` (`id`, `name`) VALUES (32, '5.12d');
INSERT INTO `grade` (`id`, `name`) VALUES (34, '5.13-');
INSERT INTO `grade` (`id`, `name`) VALUES (35, '5.13');
INSERT INTO `grade` (`id`, `name`) VALUES (36, '5.13+');
INSERT INTO `grade` (`id`, `name`) VALUES (37, '5.13a');
INSERT INTO `grade` (`id`, `name`) VALUES (38, '5.13b');
INSERT INTO `grade` (`id`, `name`) VALUES (39, '5.13c');
INSERT INTO `grade` (`id`, `name`) VALUES (40, '5.13d');
INSERT INTO `grade` (`id`, `name`) VALUES (41, '5.14-');
INSERT INTO `grade` (`id`, `name`) VALUES (42, '5.14');
INSERT INTO `grade` (`id`, `name`) VALUES (43, '5.14+');
INSERT INTO `grade` (`id`, `name`) VALUES (44, '5.14a');
INSERT INTO `grade` (`id`, `name`) VALUES (45, '5.14b');
INSERT INTO `grade` (`id`, `name`) VALUES (46, '5.14c');
INSERT INTO `grade` (`id`, `name`) VALUES (47, '5.14d');
INSERT INTO `grade` (`id`, `name`) VALUES (48, '5.15-');
INSERT INTO `grade` (`id`, `name`) VALUES (49, '5.15');
INSERT INTO `grade` (`id`, `name`) VALUES (50, '5.15+');
INSERT INTO `grade` (`id`, `name`) VALUES (51, '5.15a');
INSERT INTO `grade` (`id`, `name`) VALUES (52, '5.15b');
INSERT INTO `grade` (`id`, `name`) VALUES (53, '5.15c');
INSERT INTO `grade` (`id`, `name`) VALUES (54, '5.15d');

COMMIT;


-- -----------------------------------------------------
-- Data for table `boulder_grade`
-- -----------------------------------------------------
START TRANSACTION;
USE `letsclimbdb`;
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (1, 'V0');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (2, 'V1');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (3, 'V2');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (4, 'V3');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (5, 'V4');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (6, 'V5');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (7, 'V6');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (8, 'V7');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (9, 'V8');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (10, 'V9');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (11, 'V10');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (12, 'V11');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (13, 'V12');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (14, 'V13');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (15, 'V14');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (16, 'V15');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (17, 'V16');
INSERT INTO `boulder_grade` (`id`, `name`) VALUES (18, 'V17');

COMMIT;


-- -----------------------------------------------------
-- Data for table `style`
-- -----------------------------------------------------
START TRANSACTION;
USE `letsclimbdb`;
INSERT INTO `style` (`id`, `name`) VALUES (1, 'Trad');
INSERT INTO `style` (`id`, `name`) VALUES (2, 'Sport');
INSERT INTO `style` (`id`, `name`) VALUES (3, 'Boulder');
INSERT INTO `style` (`id`, `name`) VALUES (4, 'Ice');
INSERT INTO `style` (`id`, `name`) VALUES (5, 'Mixed');

COMMIT;


-- -----------------------------------------------------
-- Data for table `danger`
-- -----------------------------------------------------
START TRANSACTION;
USE `letsclimbdb`;
INSERT INTO `danger` (`id`, `name`) VALUES (1, 'PG');
INSERT INTO `danger` (`id`, `name`) VALUES (2, 'PG-13');
INSERT INTO `danger` (`id`, `name`) VALUES (3, 'R');
INSERT INTO `danger` (`id`, `name`) VALUES (4, 'X');

COMMIT;


-- -----------------------------------------------------
-- Data for table `attempt_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `letsclimbdb`;
INSERT INTO `attempt_image` (`id`, `file_path`, `file_name`, `attempt_id`) VALUES (1, NULL, NULL, 2);
INSERT INTO `attempt_image` (`id`, `file_path`, `file_name`, `attempt_id`) VALUES (2, NULL, NULL, 2);
INSERT INTO `attempt_image` (`id`, `file_path`, `file_name`, `attempt_id`) VALUES (3, NULL, NULL, 2);
INSERT INTO `attempt_image` (`id`, `file_path`, `file_name`, `attempt_id`) VALUES (4, NULL, NULL, 2);

COMMIT;

