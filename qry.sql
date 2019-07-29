/*Projet 3 bis :  on travaille la conception de la base de données (avec 10 tables) et la compétence d'acquisition des données. 
-- Ici, on va remplir les tables avec des données aléatoires (MAIS PARLANTES)
-- Votre obj final est de mettre le brief projet dans un repo Gitlab après avoir testé avec des Qry que ça marche
-- Exemples de Qry  :  Quel client a acheté tel produit de chez tel magasin à telle date ?
*/
use myproduction;

-- Qry  : SELECT 

SELECT *
FROM customers
INNER JOIN orders ON customers.customer_id =
orders.order_id;

-- Qry  : SELECT

SELECT *
FROM customers
INNER JOIN products ON customers.customer_id = products.product_id;


-- Qry  : SELECT

SELECT last_name, first_name, email FROM customers ORDER BY last_name ;



SELECT DISTINCT last_name FROM customers ORDER BY last_name ;

SELECT DISTINCT state, city FROM customers WHERE state IS NOT NULL ORDER BY state , city;

SELECT state, city FROM customers WHERE state IS NOT NULL ORDER BY state , city;