-- CONTRAINTES 

-- NOT NULL rend obligatoire les champs

/* modifier la table pour toutes les tables à la creation avec ALTER ET MODIFY
-- DEFAULT (valeur par defaut) : ALTER colonne SET DEFAULT 0;
-- pour le supprimer : ALTER active DROP DEFAULT;
-- pour vérification : CHECK 
-- par exemle :  phone VARCHAR(50) NOT NULL CHECK(phone <=10000) 
-- ou utile pour un produit qui n'aurait pas de prix négatif donc CHECK(prix > 0), on utilisera cette commande : ALTER TABLE nomtable ADD CHECK(prix > 0);
*/
/*
cle d'unicite
-- UNIQUE : valeur d'un champs unique sur un champs : ALTER TABLE nomtable ADD UNIQUE(email);
-- sur plusieurs champs : ALTER TABLE nomtable ADD CONSTRAINT UC_userid UNIQUE(email, user_name);
-- pour le supprimer : ALTER TABLE nomtable DROP INDEX UC_userid;
*/
/* 
-- si oublie de mettre une clé primaire exemple : ALTER TABLE nomtable ADD PRIMARY KEY(id_staff);

-- key clé étrangère :
pour ajouter : ALTER TABLE nontable ADD CONSTRAINT fk_manager1 FOREIGN KEY (staffs) REFERENCES staffs(staff_id);

pour supprimer : ALTER TABLE nontable
ADD CONSTRAINT fk_manager1 FOREIGN KEY (staffs) REFERENCES staffs(staff_id);

*/


-- -----------------------------------------------------
-- Table brands
-- -----------------------------------------------------


--ALTER TABLE brands;
--si on veut chager un champs on rajoute le champs à modifier
-- on peut le rendre sans obligation, ici exemple avec : ALTER TABLE brands MODIFY brand_name VARCHAR(20);


-- -----------------------------------------------------
-- Table categories
-- -----------------------------------------------------


--ALTER TABLE categories;


-- -----------------------------------------------------
-- Table customers
-- -----------------------------------------------------

--unique
ALTER TABLE customers ADD UNIQUE(email);
ALTER TABLE customers ADD UNIQUE(phone);


-- -----------------------------------------------------
-- Table stores
-- -----------------------------------------------------

--unique
ALTER TABLE stores ADD UNIQUE(email);
ALTER TABLE stores ADD UNIQUE(phone);



-- -----------------------------------------------------
-- Table staffs
-- -----------------------------------------------------


--ALTER TABLE staffs;

--contrainte sur 
-- si NOT NULL n'est pas activé : MODIFY active BOOLEAN NOT NULL,
-- si on veut ajouter DEFAULT a 0 : ALTER active SET DEFAULT 0;

-- si on veut le supprimer : ALTER active DROP DEFAULT;
--rajout clé étrangère

ALTER TABLE staffs ADD
    CONSTRAINT fk_manager1
    FOREIGN KEY (manager_id) REFERENCES staffs(staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE staffs ADD CONSTRAINT fk_staffs_stores1 FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE NO ACTION ON UPDATE CASCADE;

--ALTER TABLE staffs
--ADD CONSTRAINT fk_manager1 FOREIGN KEY (staffs) REFERENCES staffs(staff_id);

--pour supprimer : ALTER TABLE staffs DROP FOREIGN KEY fk_orders_staffs1;

ALTER TABLE staffs ADD UNIQUE(email);
ALTER TABLE staffs ADD UNIQUE(phone);


-- -----------------------------------------------------
-- Table orders
-- -----------------------------------------------------


--ALTER TABLE orders;

--contrainte sur 
--order_status BOOLEAN NOT NULL DEFAULT 0;

ALTER TABLE orders MODIFY shipped_date DATE;


--rajout clé étrangère
ALTER TABLE orders ADD 
  CONSTRAINT fk_orders_customers1 FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_orders_staffs1 FOREIGN KEY (staff_id) REFERENCES staffs (staff_id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_orders_stores1 FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE NO ACTION ON UPDATE CASCADE;
  
  --suppression
  
ALTER TABLE orders
DROP FOREIGN KEY fk_orders_customers1;

ALTER TABLE orders
DROP FOREIGN KEY fk_orders_staffs1;

ALTER TABLE orders
DROP FOREIGN KEY fk_orders_stores1;


-- -----------------------------------------------------
-- Table products
-- -----------------------------------------------------


--ALTER TABLE products;

--rajout clé étrangère
ALTER TABLE products ADD CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES categories (category_id) ON DELETE NO ACTION ON UPDATE CASCADE,
CONSTRAINT fk_products_brands1 FOREIGN KEY (brand_id) REFERENCES brands (brand_id) ON DELETE NO ACTION ON UPDATE CASCADE;

-- -----------------------------------------------------
-- Table stocks
-- -----------------------------------------------------

--ALTER TABLE stocks;

--rajout clé étrangère
ALTER TABLE stocks ADD CONSTRAINT fk_stocks_products1 FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE stocks ADD CONSTRAINT fk_stocks_stores1 FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE

-- -----------------------------------------------------
-- Table order_items
-- -----------------------------------------------------

--ALTER TABLE order_items;


--rajout clé étrangère
ALTER TABLE order_items ADD
CONSTRAINT fk_order_items_products1 FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE NO ACTION ON UPDATE CASCADE,
CONSTRAINT fk_order_items_orders1 FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE NO ACTION ON UPDATE CASCADE;
