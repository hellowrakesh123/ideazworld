--This script creates the database schema and tables including foreign key references and indeces.

CREATE SCHEMA IF NOT EXISTS `amber-db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `amber-db` ;

-- -----------------------------------------------------
-- Table `amber-db`.`brand`
-- -----------------------------------------------------
CREATE  TABLE `brand` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `year` INT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
CREATE  TABLE `item` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `created_time` TIMESTAMP NOT NULL ,
  `created-by` VARCHAR(45) NOT NULL ,
  `updated-time` TIMESTAMP NOT NULL ,
  `updated-by` VARCHAR(45) NOT NULL ,
  `lock_version` INT NOT NULL ,
  `active` TINYINT(1) NOT NULL ,
  `name` VARCHAR(100) NOT NULL ,
  `ref_id` VARCHAR(45) NOT NULL ,
  `ref_type` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(500) NOT NULL ,
  `item_type` VARCHAR(45) NOT NULL ,
  `item_condition` VARCHAR(45) NOT NULL ,
  `category` VARCHAR(45) NOT NULL ,
  `sub_category` VARCHAR(45) NOT NULL ,
  `market_price` INT NULL ,
  `expected_price` INT NOT NULL ,
  `share_contact` TINYINT(1) NULL ,
  `status` VARCHAR(45) NOT NULL ,
  `status_message` VARCHAR(500) NULL ,
  `brand_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `lock_version_UNIQUE` (`lock_version` ASC) ,
  INDEX `fk_item_brand1_idx` (`brand_id` ASC) ,
  CONSTRAINT `fk_item_brand1`
    FOREIGN KEY (`brand_id` )
    REFERENCES `brand` (`id` )
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `book`
-- -----------------------------------------------------
CREATE  TABLE `book` (
  `isbn` VARCHAR(100) NULL ,
  `language` VARCHAR(45) NULL ,
  `subject` VARCHAR(45) NULL ,
  `item_id` INT NOT NULL ,
  INDEX `fk_book_item1_idx` (`item_id` ASC) ,
  CONSTRAINT `fk_book_item1`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `publication_brand`
-- -----------------------------------------------------
CREATE  TABLE `publication_brand` (
  `author` VARCHAR(45) NULL ,
  `brand_id` INT NOT NULL ,
  INDEX `fk_publication_brand_brand1_idx` (`brand_id` ASC) ,
  CONSTRAINT `fk_publication_brand_brand1`
    FOREIGN KEY (`brand_id` )
    REFERENCES `brand` (`id` )
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
CREATE  TABLE `location` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `created-by` VARCHAR(45) NOT NULL ,
  `active` TINYINT(1) NOT NULL ,
  `lock_version` INT NOT NULL ,
  `updated-by` VARCHAR(45) NOT NULL ,
  `updated-time` TIMESTAMP NOT NULL ,
  `created_time` TIMESTAMP NOT NULL ,
  `address` VARCHAR(500) NULL ,
  `locality` VARCHAR(45) NULL ,
  `land_mark` VARCHAR(55) NULL ,
  `city` VARCHAR(45) NOT NULL ,
  `state` VARCHAR(45) NOT NULL ,
  `country` VARCHAR(45) NOT NULL ,
  `zip_code` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `attachment`
-- -----------------------------------------------------
CREATE  TABLE `attachment` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `created-by` VARCHAR(45) NOT NULL ,
  `active` TINYINT(1) NOT NULL ,
  `lock_version` INT NOT NULL ,
  `updated-by` VARCHAR(45) NOT NULL ,
  `updated-time` TIMESTAMP NOT NULL ,
  `created_time` TIMESTAMP NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(500) NULL ,
  `content` BLOB NOT NULL ,
  `item_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_attachment_item1_idx` (`item_id` ASC) ,
  CONSTRAINT `fk_attachment_item1`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `tag`
-- -----------------------------------------------------
CREATE  TABLE `tag` (
  `name` INT NOT NULL ,
  PRIMARY KEY (`name`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `item_tags`
-- -----------------------------------------------------
CREATE  TABLE `item_tags` (
  `item_id` INT NOT NULL ,
  `tag_name` INT NOT NULL ,
  INDEX `fk_item_tags_item1_idx` (`item_id` ASC) ,
  INDEX `fk_item_tags_tag1_idx` (`tag_name` ASC) ,
  PRIMARY KEY (`item_id`, `tag_name`) ,
  CONSTRAINT `fk_item_tags_item1`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` ),
  CONSTRAINT `fk_item_tags_tag1`
    FOREIGN KEY (`tag_name` )
    REFERENCES `tag` (`name` )
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `item_location`
-- -----------------------------------------------------
CREATE  TABLE `item_location` (
  `item_id` INT NOT NULL ,
  `location_id` INT NOT NULL ,
  INDEX `fk_item_location_item1_idx` (`item_id` ASC) ,
  INDEX `fk_item_location_location1_idx` (`location_id` ASC) ,
  PRIMARY KEY (`item_id`, `location_id`) ,
  CONSTRAINT `fk_item_location_item1`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` ),
  CONSTRAINT `fk_item_location_location1`
    FOREIGN KEY (`location_id` )
    REFERENCES `location` (`id` )
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `meta_data`
-- -----------------------------------------------------
CREATE  TABLE `meta_data` (
  `name` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(500) NULL ,
  `type` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`name`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
CREATE  TABLE `user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `active` TINYINT(1) NOT NULL ,
  `created_time` TIMESTAMP NOT NULL ,
  `updated-time` TIMESTAMP NOT NULL ,
  `updated-by` VARCHAR(45) NOT NULL ,
  `lock_version` INT NOT NULL ,
  `created-by` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(100) NOT NULL ,
  `name` VARCHAR(50) NULL ,
  `contact_number` INT NULL ,
  `share_contact` TINYINT(1) NULL ,
  `location_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  INDEX `fk_user_location1_idx` (`location_id` ASC) ,
  CONSTRAINT `fk_user_location1`
    FOREIGN KEY (`location_id` )
    REFERENCES `location` (`id` )
    )
ENGINE = InnoDB;
