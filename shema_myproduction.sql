
-- -----------------------------------------------------
-- Schema myproduction
-- -----------------------------------------------------

DROP SCHEMA IF EXISTS myproduction ;

CREATE SCHEMA IF NOT EXISTS myproduction DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE myproduction ;



-- -----------------------------------------------------
-- Table categories
-- -----------------------------------------------------

DROP TABLE IF EXISTS categories ;

CREATE TABLE IF NOT EXISTS categories (
  category_id INT NOT NULL AUTO_INCREMENT,
  category_name VARCHAR(25) NOT NULL,
  PRIMARY KEY (category_id));



-- -----------------------------------------------------
-- Table brands
-- -----------------------------------------------------

DROP TABLE IF EXISTS brands ;

CREATE TABLE IF NOT EXISTS brands (
  brand_id INT NOT NULL AUTO_INCREMENT,
  brand_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (brand_id),
);


-- -----------------------------------------------------
-- Table customers
-- -----------------------------------------------------
DROP TABLE IF EXISTS customers ;

CREATE TABLE IF NOT EXISTS customers (
  customer_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  phone VARCHAR(50),
  email VARCHAR(50) NOT NULL,
  street VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(20) NOT NULL,
  zip_code INT(5) NOT NULL,
  PRIMARY KEY (customer_id));


-- -----------------------------------------------------
-- Table stores
-- -----------------------------------------------------
DROP TABLE IF EXISTS stores ;

CREATE TABLE IF NOT EXISTS stores (
  store_id INT NOT NULL AUTO_INCREMENT,
  store_name VARCHAR(25) NOT NULL,
  phone VARCHAR(50),
  email VARCHAR(50) NOT NULL,
  street VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(20) NOT NULL,
  zip_code INT(5) NOT NULL,
  PRIMARY KEY (store_id)
 );


-- -----------------------------------------------------
-- Table staffs
-- -----------------------------------------------------
DROP TABLE IF EXISTS staffs ;

CREATE TABLE IF NOT EXISTS staffs (
  staff_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone VARCHAR(50),
  active ENUM('0', '1') NOT NULL,
  store_id INT NOT NULL,
  manager_id INT NOT NULL,
  PRIMARY KEY (staff_id ));
 


-- -----------------------------------------------------
-- Table orders
-- -----------------------------------------------------
DROP TABLE IF EXISTS orders ;

CREATE TABLE IF NOT EXISTS orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  order_status BOOLEAN NOT NULL,
  order_date DATE NOT NULL,
  required_date DATE NOT NULL,
  shipped_date DATE NOT NULL,
  customer_id INT NOT NULL,
  staff_id INT NOT NULL,
  store_id INT NOT NULL,
  PRIMARY KEY (order_id, staff_id, customer_id, store_id));


-- -----------------------------------------------------
-- Table products
-- -----------------------------------------------------
DROP TABLE IF EXISTS products ;

CREATE TABLE IF NOT EXISTS products (
  product_id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(100) NOT NULL,
  model_year SMALLINT(6) NOT NULL,
  list_price DECIMAL(10,0) NOT NULL,
  brand_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (product_id, brand_id, category_id));


-- -----------------------------------------------------
-- Table stocks
-- -----------------------------------------------------
DROP TABLE IF EXISTS stocks ;

CREATE TABLE IF NOT EXISTS stocks (
  stock_id INT NOT NULL AUTO_INCREMENT,
  quantity INT(3) NOT NULL,
  product_id INT NOT NULL,
  store_id INT NOT NULL,
  PRIMARY KEY (stock_id, product_id, store_id));


-- -----------------------------------------------------
-- Table order_items
-- -----------------------------------------------------
DROP TABLE IF EXISTS order_items ;

CREATE TABLE IF NOT EXISTS order_items (
  item_id INT NOT NULL AUTO_INCREMENT,
  quantity INT(3) NOT NULL,
  list_price DECIMAL NOT NULL,
  discount DECIMAL NOT NULL,
  product_id INT NOT NULL,
  order_id INT NOT NULL,
  PRIMARY KEY (item_id, product_id, order_id));


