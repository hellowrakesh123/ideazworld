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
  `item_type` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
CREATE  TABLE `location` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `address` VARCHAR(500) NULL ,
  `locality` VARCHAR(45) NULL ,
  `land_mark` VARCHAR(55) NULL ,
  `city` VARCHAR(45) NOT NULL ,
  `state` VARCHAR(45) NOT NULL ,
  `country` VARCHAR(45) NOT NULL ,
  `zip_code` VARCHAR(45) NULL ,
  `created_time` TIMESTAMP NOT NULL ,
  `created_by` VARCHAR(45) NOT NULL ,
  `updated_time` TIMESTAMP NOT NULL ,
  `updated_by` VARCHAR(45) NOT NULL ,
  `lock_version` INT NOT NULL ,
  `active` INT(1) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `item`
-- -----------------------------------------------------
CREATE  TABLE `item` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NOT NULL ,
  `ref` VARCHAR(45) NOT NULL ,
  `ref_type` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(500) NOT NULL ,
  `item_type` VARCHAR(45) NOT NULL ,
  `item_condition` VARCHAR(45) NOT NULL ,
  `category` VARCHAR(45) NOT NULL ,
  `sub_category` VARCHAR(45) NOT NULL ,
  `location_id` INT NOT NULL ,
  `market_price` INT NULL ,
  `expected_price` INT NOT NULL ,
  `share_contact` INT(1) NULL ,
  `status` VARCHAR(45) NOT NULL ,
  `status_message` VARCHAR(500) NULL ,
  `brand_id` INT NULL ,
  `created_time` TIMESTAMP NOT NULL ,
  `created_by` VARCHAR(45) NOT NULL ,
  `updated_time` TIMESTAMP NOT NULL ,
  `updated_by` VARCHAR(45) NOT NULL ,
  `lock_version` INT NOT NULL ,
  `active` INT(1) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `lock_version_UNIQUE` (`lock_version` ASC) ,
  INDEX `fk_item_location_idx` (`location_id` ASC) ,
  INDEX `fk_item_brand_idx` (`brand_id` ASC) ,
  CONSTRAINT `fk_item_location`
    FOREIGN KEY (`location_id` )
    REFERENCES `location` (`id` ),
  CONSTRAINT `fk_item_brand`
    FOREIGN KEY (`brand_id` )
    REFERENCES `brand` (`id` )
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `book`
-- -----------------------------------------------------
CREATE  TABLE `book` (
  `item_id` INT NOT NULL ,
  `isbn` VARCHAR(100) NULL ,
  `language` VARCHAR(45) NULL ,
  `subject` VARCHAR(45) NULL ,
  PRIMARY KEY (`item_id`) ,
  INDEX `fk_book_item_idx` (`item_id` ASC) ,
  CONSTRAINT `fk_book_item`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `publication_brand`
-- -----------------------------------------------------
CREATE  TABLE `publication_brand` (
  `brand_id` INT NOT NULL ,
  `author` VARCHAR(45) NULL ,
  PRIMARY KEY (`brand_id`) ,
  INDEX `fk_publication_brand_brand_idx` (`brand_id` ASC) ,
  CONSTRAINT `fk_publication_brand_brand`
    FOREIGN KEY (`brand_id` )
    REFERENCES `brand` (`id` )
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `attachment`
-- -----------------------------------------------------
CREATE  TABLE `attachment` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(500) NULL ,
  `content` BLOB NOT NULL ,
  `item_id` INT NOT NULL ,
  `created_time` TIMESTAMP NOT NULL ,
  `created_by` VARCHAR(45) NOT NULL ,
  `updated_time` TIMESTAMP NOT NULL ,
  `updated_by` VARCHAR(45) NOT NULL ,
  `lock_version` INT NOT NULL ,
  `active` INT(1) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_attachment_item_idx` (`item_id` ASC) ,
  CONSTRAINT `fk_attachment_item`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` )
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `tag`
-- -----------------------------------------------------
CREATE  TABLE `tag` (
 `id` INT NOT NULL AUTO_INCREMENT ,  
 `name` VARCHAR(100) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `item_tags`
-- -----------------------------------------------------
CREATE  TABLE `item_tags` (
  `item_id` INT NOT NULL ,
  `tag_id` INT NOT NULL ,
  INDEX `fk_item_tags_item_idx` (`item_id` ASC) ,
  INDEX `fk_item_tags_tag_idx` (`tag_id` ASC) ,
  PRIMARY KEY (`item_id`, `tag_id`) ,
  CONSTRAINT `fk_item_tags_item`
    FOREIGN KEY (`item_id` )
    REFERENCES `item` (`id` ),
  CONSTRAINT `fk_item_tags_tag`
    FOREIGN KEY (`tag_id` )
    REFERENCES `tag` (`id` )
    )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `meta_data`
-- -----------------------------------------------------
CREATE  TABLE `meta_data` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(500) NULL ,
  `type` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
CREATE  TABLE `user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(100) NOT NULL ,
  `name` VARCHAR(50) NULL ,
  `contact_number` INT NULL ,
  `share_contact` INT(1) NULL ,
  `location_id` INT NOT NULL ,
  `created_time` TIMESTAMP NOT NULL ,
  `created_by` VARCHAR(45) NOT NULL ,
  `updated_time` TIMESTAMP NOT NULL ,
  `updated_by` VARCHAR(45) NOT NULL ,
  `lock_version` INT NOT NULL ,
  `active` INT(1) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  INDEX `fk_user_location_idx` (`location_id` ASC) ,
  CONSTRAINT `fk_user_location`
    FOREIGN KEY (`location_id` )
    REFERENCES `location` (`id` )
    )
ENGINE = InnoDB;