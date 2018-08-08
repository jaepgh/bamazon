-- -----------------------------------------------------
-- User Inserts
-- -----------------------------------------------------
INSERT INTO `bamazon`.`users` (`user_id`, `user_name`, `creation_date`, `user_password`) VALUES ('1', 'anonymous', '2018-08-03 00:00:00', 'master');
INSERT INTO `bamazon`.`users` (`user_id`, `user_name`, `creation_date`, `user_password`) VALUES ('2', 'manager1', '2018-08-03 00:00:00', 'root');
INSERT INTO `bamazon`.`users` (`user_id`, `user_name`, `creation_date`, `user_password`) VALUES ('3', 'supervisor1', '2018-08-03 00:00:00', 'root');

-- -----------------------------------------------------
-- Role Inserts
-- -----------------------------------------------------
INSERT INTO `bamazon`.`role` (`role_id`, `role_name`) VALUES ('1', 'User');
INSERT INTO `bamazon`.`role` (`role_id`, `role_name`) VALUES ('2', 'Manager');
INSERT INTO `bamazon`.`role` (`role_id`, `role_name`) VALUES ('3', 'Supervisor ');

-- -----------------------------------------------------
-- User-Role Inserts
-- -----------------------------------------------------

INSERT INTO `bamazon`.`user_role` (`user_role_id`, `role_role_id`, `user_user_id`, `active`) VALUES ('1', '1', '1', b'1');
INSERT INTO `bamazon`.`user_role` (`user_role_id`, `role_role_id`, `user_user_id`, `active`) VALUES ('2', '2', '2', b'1');
INSERT INTO `bamazon`.`user_role` (`user_role_id`, `role_role_id`, `user_user_id`, `active`) VALUES ('3', '3', '3', b'1');

-- -----------------------------------------------------
-- Sales Inserts
-- -----------------------------------------------------

INSERT INTO `bamazon`.`sales` (`sales_id`, `sales_date`, `user_user_id`) VALUES ('1', '2018-08-01 00:00:00', '1');
INSERT INTO `bamazon`.`sales` (`sales_id`, `sales_date`, `user_user_id`) VALUES ('2', '2018-08-02 00:00:00', '1');
INSERT INTO `bamazon`.`sales` (`sales_id`, `sales_date`, `user_user_id`) VALUES ('3', '2018-08-03 00:00:00', '1');
INSERT INTO `bamazon`.`sales` (`sales_id`, `sales_date`, `user_user_id`) VALUES ('4', '2018-07-05 00:00:00', '1');
INSERT INTO `bamazon`.`sales` (`sales_id`, `sales_date`, `user_user_id`) VALUES ('5', '2018-07-05 00:00:00', '1');
INSERT INTO `bamazon`.`sales` (`sales_id`, `sales_date`, `user_user_id`) VALUES ('6', '2018-07-05 00:00:00', '1');
INSERT INTO `bamazon`.`sales` (`sales_id`, `sales_date`, `user_user_id`) VALUES ('7', '2018-07-05 00:00:00', '1');
INSERT INTO `bamazon`.`sales` (`sales_id`, `sales_date`, `user_user_id`) VALUES ('8', '2018-07-05 00:00:00', '1');
INSERT INTO `bamazon`.`sales` (`sales_id`, `sales_date`, `user_user_id`) VALUES ('9', '2018-07-05 00:00:00', '1');
INSERT INTO `bamazon`.`sales` (`sales_id`, `sales_date`, `user_user_id`) VALUES ('10', '2018-07-05 00:00:00', '1');

-- -----------------------------------------------------
-- Products Inserts
-- -----------------------------------------------------

INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('1', 'Maybelline TattooStudio Brow', '7.94', '10');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('2', 'Eyeshadow Pencil ,Sefter Beauty Pro Highlighter Eye Shadow Stick Cosmetic Lying Silkworm Big Smokey ', '1.99', '12');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('3', 'Winnie the Pooh Plush Soft Toy', '29.95', '20');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('4', 'Madden NFL 19: Hall of Fame Edition - PlayStation 4', '79.99', '15');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('5', 'Minecraft: New Nintendo 3DS Edition - Nintendo 3DS', '29.49', '8');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('6', 'GYY 8 Inch Chef Knife', '10.99', '19');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('7', 'HOMWE Kitchen Cutting Board', '14.97', '19');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('8', 'OXO Good Grips 3-in-1 Avocado Slicer, Green', '9.99', '25');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('9', 'Ninja Professional 72oz Countertop Blender ', '89.99', '15');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('10', 'Can Opener', '11.71', '25');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('11', 'Craftsman 450-Piece Mechanic Tool Set', '215.96', '10');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('12', 'DEWALT DWMT73807 Accessory Tool Kit, 15 Piece', '25.11', '23');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('13', 'Leatherman - Wingman Multitool, Stainless Steel (831426)', '49.95', '15');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('15', 'Some', '15', '8');
INSERT INTO `bamazon`.`products` (`item_id`, `product_name`, `price`, `stock_quantity`) VALUES ('16', 'lolo', '10', '15');

-- -----------------------------------------------------
-- Products-Sale Inserts
-- -----------------------------------------------------

INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('1', '1', '1');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('2', '1', '2');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('3', '1', '3');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('4', '2', '7');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('5', '2', '6');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('6', '3', '5');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('7', '3', '5');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('8', '3', '11');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('9', '3', '11');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('10', '4', '1');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('11', '4', '1');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('12', '4', '2');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('13', '4', '2');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('14', '4', '2');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('15', '8', '5');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('16', '8', '5');
INSERT INTO `bamazon`.`product_sales` (`product_sales_id`, `sales_id`, `item_id`) VALUES ('17', '9', '6');

-- -----------------------------------------------------
-- Departments Inserts
-- -----------------------------------------------------

INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('1', 'Appliances');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('2', 'Apps & Games');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('3', 'Arts, Crafts & Sewing');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('4', 'Automotive Parts & Accessories');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('5', 'Baby');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('6', 'Beauty & Personal Care');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('7', 'Books');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('8', 'CDs & Vinyl');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('9', 'Cell Phones & Accessories');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('10', 'Clothing, Shoes & Jewelry');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('11', 'Computers');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('12', 'Electronics');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('13', 'Garden & Outdoor');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('14', 'Grocery');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('15', 'Home & Kitchen');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('16', 'Musical Instruments');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('17', 'Sports & Outdoors');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('18', 'Tools & Home Improvement');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('19', 'Toys & Games');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('20', 'Vehicles');
INSERT INTO `bamazon`.`nom_departments` (`department_id`, `department_name`) VALUES ('21', 'Video Games');

-- -----------------------------------------------------
-- Category Expenses Inserts
-- -----------------------------------------------------

INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('1', 'Telephone and utility bills');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('2', 'Internet and web hosting');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('3', 'Advertising');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('4', 'Professional fees');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('5', 'Banking services');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('6', 'Postage and shipping fees');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('7', 'Office supplies and equipmen');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('8', 'Overtime pay');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('9', 'Health plans');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('10', 'Business insurance');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('11', 'Repairs & Maintenance');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('12', 'Gas & Electrical');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('13', 'Transportation');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('14', 'Investments');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('15', 'Property taxes');
INSERT INTO `bamazon`.`nom_catergory_expenses` (`catergory_expenses_id`, `catergory_expenses_name`) VALUES ('16', 'Rent');

-- -----------------------------------------------------
-- Product Department Inserts
-- -----------------------------------------------------

INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('1', '1', '6');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('2', '2', '6');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('3', '3', '5');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('4', '4', '21');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('5', '5', '21');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('6', '6', '15');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('7', '7', '15');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('8', '8', '15');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('9', '9', '1');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('10', '10', '15');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('11', '11', '18');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('12', '12', '18');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('13', '13', '18');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('14', '15', '5');
INSERT INTO `bamazon`.`product_departament` (`product_sale_id`, `item_id`, `department_id`) VALUES ('15', '16', '2');


-- -----------------------------------------------------
-- Category Expenses Inserts
-- -----------------------------------------------------

INSERT INTO `bamazon`.`expenses` (`expenses_id`, `date`, `expenses_value`, `description`, `department_id`, `catergory_expenses_id`) VALUES ('1', '2018-08-01 00:00:00', '15.25', 'Utilities July', '18', '1');
INSERT INTO `bamazon`.`expenses` (`expenses_id`, `date`, `expenses_value`, `description`, `department_id`, `catergory_expenses_id`) VALUES ('2', '2018-07-15 00:00:00', '12.99', 'Intenet service July', '18', '2');
INSERT INTO `bamazon`.`expenses` (`expenses_id`, `date`, `expenses_value`, `description`, `department_id`, `catergory_expenses_id`) VALUES ('3', '2018-08-01 00:00:00', '30.5', 'Intenet service July', '15', '2');
INSERT INTO `bamazon`.`expenses` (`expenses_id`, `date`, `expenses_value`, `description`, `department_id`, `catergory_expenses_id`) VALUES ('4', '2018-07-15 00:00:00', '12.5', 'New equipment', '15', '7');
INSERT INTO `bamazon`.`expenses` (`expenses_id`, `date`, `expenses_value`, `description`, `department_id`, `catergory_expenses_id`) VALUES ('5', '2018-08-01 00:00:00', '45.25', 'Intenet service July', '1', '2');
INSERT INTO `bamazon`.`expenses` (`expenses_id`, `date`, `expenses_value`, `description`, `department_id`, `catergory_expenses_id`) VALUES ('6', '2018-07-15 00:00:00', '32.85', 'Mailing products', '6', '6');
INSERT INTO `bamazon`.`expenses` (`expenses_id`, `date`, `expenses_value`, `description`, `department_id`, `catergory_expenses_id`) VALUES ('7', '2018-07-15 00:00:00', '16.5', 'Utilities June', '21', '12');
INSERT INTO `bamazon`.`expenses` (`expenses_id`, `date`, `expenses_value`, `description`, `department_id`, `catergory_expenses_id`) VALUES ('8', '2018-08-01 00:00:00', '15.9', 'Utilities June', '5', '1');
