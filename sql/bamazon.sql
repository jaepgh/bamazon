-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bamazon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bamazon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bamazon` DEFAULT CHARACTER SET utf8 ;
USE `bamazon` ;

-- -----------------------------------------------------
-- Table `bamazon`.`nom_catergory_expenses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`nom_catergory_expenses` (
  `catergory_expenses_id` INT(11) NOT NULL AUTO_INCREMENT,
  `catergory_expenses_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`catergory_expenses_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bamazon`.`nom_departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`nom_departments` (
  `department_id` INT(11) NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bamazon`.`expenses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`expenses` (
  `expenses_id` INT(11) NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `expenses_value` FLOAT NOT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `department_id` INT(11) NOT NULL,
  `catergory_expenses_id` INT(11) NOT NULL,
  PRIMARY KEY (`expenses_id`),
  INDEX `fk_expenses_nom_departments1_idx` (`department_id` ASC) VISIBLE,
  INDEX `fk_expenses_nom_catergory_expenses1_idx` (`catergory_expenses_id` ASC) VISIBLE,
  CONSTRAINT `fk_expenses_nom_catergory_expenses1`
    FOREIGN KEY (`catergory_expenses_id`)
    REFERENCES `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_expenses_nom_departments1`
    FOREIGN KEY (`department_id`)
    REFERENCES `bamazon`.`nom_departments` (`department_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bamazon`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`products` (
  `item_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(100) NOT NULL,
  `price` FLOAT NOT NULL,
  `stock_quantity` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bamazon`.`product_departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`product_departament` (
  `product_sale_id` INT(11) NOT NULL AUTO_INCREMENT,
  `item_id` INT(11) NOT NULL,
  `department_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_sale_id`),
  INDEX `fk_product_departament_products1_idx` (`item_id` ASC) VISIBLE,
  INDEX `fk_product_departament_nom_departments1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_departament_nom_departments1`
    FOREIGN KEY (`department_id`)
    REFERENCES `bamazon`.`nom_departments` (`department_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_departament_products1`
    FOREIGN KEY (`item_id`)
    REFERENCES `bamazon`.`products` (`item_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bamazon`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`sales` (
  `sales_id` INT(11) NOT NULL AUTO_INCREMENT,
  `sales_date` DATETIME NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`sales_id`),
  INDEX `fk_sales_user1_idx` (`user_user_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bamazon`.`product_sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`product_sales` (
  `product_sales_id` INT(11) NOT NULL AUTO_INCREMENT,
  `sales_id` INT(11) NOT NULL,
  `item_id` INT(11) NOT NULL,
  PRIMARY KEY (`product_sales_id`),
  INDEX `fk_product_sales_sales1_idx` (`sales_id` ASC) VISIBLE,
  INDEX `fk_product_sales_products1_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_sales_products1`
    FOREIGN KEY (`item_id`)
    REFERENCES `bamazon`.`products` (`item_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_sales_sales1`
    FOREIGN KEY (`sales_id`)
    REFERENCES `bamazon`.`sales` (`sales_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bamazon`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`role` (
  `role_id` INT(11) NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bamazon`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(100) NOT NULL,
  `creation_date` DATETIME NOT NULL,
  `user_password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bamazon`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`user_role` (
  `user_role_id` INT(11) NOT NULL AUTO_INCREMENT,
  `role_role_id` INT(11) NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  `active` BIT(1) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  INDEX `fk_user_role_role1_idx` (`role_role_id` ASC) VISIBLE,
  INDEX `fk_user_role_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_role_role1`
    FOREIGN KEY (`role_role_id`)
    REFERENCES `bamazon`.`role` (`role_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `bamazon`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

USE `bamazon` ;

-- -----------------------------------------------------
-- Placeholder table for view `bamazon`.`low_inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`low_inventory` (`item_id` INT, `product_name` INT, `price` INT, `quantity` INT, `departament` INT);

-- -----------------------------------------------------
-- Placeholder table for view `bamazon`.`product_sales_departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`product_sales_departament` (`department_id` INT, `department_name` INT, `over_head_costs` INT, `product_sales` INT, `total_profit` INT);

-- -----------------------------------------------------
-- Placeholder table for view `bamazon`.`products_for_sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`products_for_sale` (`item_id` INT, `product_name` INT, `price` INT, `quantity` INT, `departament` INT);

-- -----------------------------------------------------
-- Placeholder table for view `bamazon`.`sale_departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`sale_departament` (`department_id` INT, `product_sales` INT);

-- -----------------------------------------------------
-- Placeholder table for view `bamazon`.`total_per_sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bamazon`.`total_per_sale` (`sales_id` INT, `total_sale` INT);

-- -----------------------------------------------------
-- procedure add_new_product
-- -----------------------------------------------------

DELIMITER $$
USE `bamazon`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_product`(IN `name` VARCHAR(100), IN `price` FLOAT, IN `quantity` INT, IN `departament_id` INT)
BEGIN
DECLARE id_prod INT;

INSERT INTO products (product_name, price, stock_quantity)
VALUES (`name`, `price`, `quantity` );

SELECT MAX(item_id) INTO id_prod FROM products WHERE product_name = `name` LIMIT 1;

INSERT INTO product_departament (item_id, department_id)
VALUES (id_prod, `departament_id` );


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure add_to_inventory
-- -----------------------------------------------------

DELIMITER $$
USE `bamazon`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_to_inventory`(IN `product_id` INT, IN `quantity` INT)
BEGIN

UPDATE products
SET stock_quantity = (stock_quantity + quantity)
WHERE item_id = product_id;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure buy_product
-- -----------------------------------------------------

DELIMITER $$
USE `bamazon`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `buy_product`(IN `product_id` INT, IN `quantity` INT)
BEGIN
DECLARE id_sale INT;

SELECT MAX(sales_id) INTO id_sale FROM sales;

UPDATE products
SET stock_quantity = (stock_quantity - `quantity`)
WHERE item_id = `product_id`;

WHILE `quantity` > 0 DO
	INSERT INTO product_sales (sales_id, item_id)
	VALUES (id_sale, `product_id` );
	SET `quantity` = `quantity` - 1;
END WHILE;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure get_user
-- -----------------------------------------------------

DELIMITER $$
USE `bamazon`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user`(IN `puser` VARCHAR(100), IN `pwd` VARCHAR(100))
BEGIN
SELECT users.user_id AS user_id, users.user_name AS user_name, role.role_id AS user_role
FROM users JOIN
user_role ON users.user_id = user_role.user_user_id
JOIN role ON user_role.role_role_id = role.role_id

WHERE user_role.active = 1 AND users.user_name = `puser`AND users.user_password = `pwd`;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure products_sale
-- -----------------------------------------------------

DELIMITER $$
USE `bamazon`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `products_sale`(IN `date` DATETIME, IN `id_user` INT)
BEGIN
INSERT INTO sales (sales_date, user_user_id)
VALUES (`date`, `id_user` );
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `bamazon`.`low_inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bamazon`.`low_inventory`;
USE `bamazon`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bamazon`.`low_inventory` AS select `bamazon`.`products`.`item_id` AS `item_id`,`bamazon`.`products`.`product_name` AS `product_name`,`bamazon`.`products`.`price` AS `price`,`bamazon`.`products`.`stock_quantity` AS `quantity`,`bamazon`.`nom_departments`.`department_name` AS `departament` from ((`bamazon`.`products` join `bamazon`.`product_departament` on((`bamazon`.`products`.`item_id` = `bamazon`.`product_departament`.`item_id`))) join `bamazon`.`nom_departments` on((`bamazon`.`product_departament`.`department_id` = `bamazon`.`nom_departments`.`department_id`))) where (`bamazon`.`products`.`stock_quantity` < 5);

-- -----------------------------------------------------
-- View `bamazon`.`product_sales_departament`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bamazon`.`product_sales_departament`;
USE `bamazon`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bamazon`.`product_sales_departament` AS select `bamazon`.`nom_departments`.`department_id` AS `department_id`,`bamazon`.`nom_departments`.`department_name` AS `department_name`,coalesce(round(sum(`bamazon`.`expenses`.`expenses_value`),2),0) AS `over_head_costs`,coalesce(`sale_departament`.`product_sales`,0) AS `product_sales`,(coalesce(`sale_departament`.`product_sales`,0) - coalesce(round(sum(`bamazon`.`expenses`.`expenses_value`),2),0)) AS `total_profit` from ((`bamazon`.`nom_departments` left join `bamazon`.`expenses` on((`bamazon`.`nom_departments`.`department_id` = `bamazon`.`expenses`.`department_id`))) left join `bamazon`.`sale_departament` on((`bamazon`.`nom_departments`.`department_id` = `sale_departament`.`department_id`))) group by `bamazon`.`nom_departments`.`department_id`;

-- -----------------------------------------------------
-- View `bamazon`.`products_for_sale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bamazon`.`products_for_sale`;
USE `bamazon`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bamazon`.`products_for_sale` AS select `bamazon`.`products`.`item_id` AS `item_id`,`bamazon`.`products`.`product_name` AS `product_name`,`bamazon`.`products`.`price` AS `price`,`bamazon`.`products`.`stock_quantity` AS `quantity`,`bamazon`.`nom_departments`.`department_name` AS `departament` from ((`bamazon`.`products` join `bamazon`.`product_departament` on((`bamazon`.`products`.`item_id` = `bamazon`.`product_departament`.`item_id`))) join `bamazon`.`nom_departments` on((`bamazon`.`product_departament`.`department_id` = `bamazon`.`nom_departments`.`department_id`)));

-- -----------------------------------------------------
-- View `bamazon`.`sale_departament`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bamazon`.`sale_departament`;
USE `bamazon`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bamazon`.`sale_departament` AS select `bamazon`.`product_departament`.`department_id` AS `department_id`,coalesce(round(sum(`bamazon`.`products`.`price`),2),0) AS `product_sales` from ((`bamazon`.`product_sales` join `bamazon`.`products` on((`bamazon`.`product_sales`.`item_id` = `bamazon`.`products`.`item_id`))) join `bamazon`.`product_departament` on((`bamazon`.`products`.`item_id` = `bamazon`.`product_departament`.`item_id`))) group by `bamazon`.`product_departament`.`department_id`;

-- -----------------------------------------------------
-- View `bamazon`.`total_per_sale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bamazon`.`total_per_sale`;
USE `bamazon`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bamazon`.`total_per_sale` AS select `bamazon`.`product_sales`.`sales_id` AS `sales_id`,round(sum(`bamazon`.`products`.`price`),2) AS `total_sale` from (`bamazon`.`product_sales` join `bamazon`.`products` on((`bamazon`.`product_sales`.`item_id` = `bamazon`.`products`.`item_id`))) group by `bamazon`.`product_sales`.`sales_id`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
