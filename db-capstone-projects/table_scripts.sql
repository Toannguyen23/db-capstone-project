-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `CustomerFirtsName` VARCHAR(20) NULL,
  `CustomerLastName` VARCHAR(20) NULL,
  `PhoneNumber` CHAR(10) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staffs` (
  `StaffID` INT NOT NULL,
  `StaffName` VARCHAR(20) NULL,
  `Role` CHAR(10) NULL,
  `Salary` DECIMAL(8,2) NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `CustomerID` INT NULL,
  `StaffID` INT NULL,
  `Date` DATE NULL,
  `TableNumber` INT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `booking_fk_cus_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `booking_fk_staff_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `booking_fk_cus`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `booking_fk_staff`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDB`.`Staffs` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `BookingID` INT NULL,
  `Quantity` INT NULL,
  `TotalCost` DECIMAL(8,2) NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `order_fk_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `order_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDelivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDelivery` (
  `DeliveryID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `DeliveryDate` DATE NULL,
  `Status` CHAR(10) NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `order_fk_deliver_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `order_fk_deliver`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `MenuID` INT NOT NULL,
  `OrderID` INT NULL,
  `Cuisines` VARCHAR(20) NULL,
  `Starter` VARCHAR(20) NULL,
  `Course` VARCHAR(20) NULL,
  `Drink` VARCHAR(20) NULL,
  `Dessert` VARCHAR(20) NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `menu_fk_order_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `menu_fk_order`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
