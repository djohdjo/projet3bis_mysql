/*Projet 3 bis :  

on travaille la conception de la base de données (avec 10 tables) et la compétence d'acquisition des données. 
-- Ici, on va remplir les tables avec des données aléatoires (MAIS PARLANTES)
-- Votre obj final est de mettre le brief projet dans un repo Gitlab après avoir testé avec des Qry que ça marche
-- Exemples de Qry  :  Quel client a acheté tel produit de chez tel magasin à telle date ?



utile pour le random 

https://richbenner.com/2019/02/test-data-python-faker/

https://www.generatedata.com/#generator



https://dev.mysql.com/doc/refman/5.7/en/mathematical-functions.html#function_rand

https://dev.mysql.com/doc/refman/5.7/en/mathematical-functions.html#function_rand



- random : fonction : Renvoie une valeur aléatoire v dans la plage 0 <= v <1.0.

	UPDATE tableName SET columnName = FLOOR( 1 + RAND( ) *3 );

- NB: RAND () produit des valeurs flottantes aléatoires comprises entre 0 et 1.

	UPDATE tableName SET columnName = FLOOR(RAND( ) + RAND( ));


	SELECT * FROM table1, table2 WHERE a=b AND c<d ORDER BY RAND() LIMIT 1000;


- mise à jour des enregistrements de table avec des numéros de téléphone aléatoires

	DECLARE @OrderDetailID INT
	DECLARE @Phone VARCHAR(100)
	DECLARE MY_CURSOR CURSOR LOCAL STATIC READ_ONLY FORWARD_ONLY
	FOR
		SELECT DISTINCT
				OrderDetailID
		FROM    dbo.OrderDetailTBL

	OPEN MY_CURSOR
	FETCH NEXT FROM MY_CURSOR INTO @OrderDetailID
	WHILE @@FETCH_STATUS = 0 
		BEGIN 
		--Do something with Id here
			SET @Phone = '(' + CONVERT(VARCHAR(3), CONVERT(NUMERIC(3, 0), RAND()
				* 899)) + ') ' + CONVERT(VARCHAR(3), CONVERT(NUMERIC(3, 0), RAND()
				* 899)) + '-' + CONVERT(VARCHAR(4), CONVERT(NUMERIC(4, 0), RAND()
				* 8999))


			UPDATE  dbo.OrderDetailTBL
			SET     ShippingPhone = @Phone
			WHERE   OrderDetailID = @OrderDetailID
			FETCH NEXT FROM MY_CURSOR INTO @OrderDetailID
		END
	CLOSE MY_CURSOR
	DEALLOCATE MY_CURSOR


	- mettre à jour une colonne avec un nombre aléatoire entre une plage et le type -Ve

	UPDATE DataBase.TableName
	SET Column = ((4 * RAND()) - (4 * RAND()))
	WHERE IndexColumn > 0; -- here I have taken range between 4 to -4



- aleatoire mise à jour

- https://www.tutorialspoint.com/mysql-update-with-random-number-between-1-3

- La syntaxe pour mettre à jour une colonne avec un nombre aléatoire compris entre 1 et 3 est la suivante -

	update yourTableName set yourColumnName=FLOOR(1+RAND()*3);

- Pour comprendre la syntaxe ci-dessus, créons d'abord un tableau. La requête pour créer une table est la suivante -

	mysql> create table UpdateNumber1To3
	-> (
	-> MyNumber int
	-> );
	Query OK, 0 rows affected (0.61 sec)

- Insérer des enregistrements dans la table en utilisant la commande insert. La requête est la suivante -

	mysql> insert into UpdateNumber1To3 values(100);
	Query OK, 1 row affected (0.16 sec)

	mysql> insert into UpdateNumber1To3 values(140);
	Query OK, 1 row affected (0.25 sec)

- Afficher tous les enregistrements de la table en utilisant l'instruction select. La requête est la suivante -

	mysql> select *from UpdateNumber1To3;

- Voici la requête pour mettre à jour les valeurs de la colonne MyNumber de 1 à 3 -

	mysql> update UpdateNumber1To3 set Number=FLOOR(1+RAND()*3);
	Query OK, 3 rows affected (0.19 sec)
	Rows matched: 3 Changed: 3 Warnings: 0

- Laissez-nous vérifier la table une fois de plus. La requête est la suivante -

mysql> SELECT *FROM UpdateNumber1To3;



*/
use myproduction;

-- Qry  : SELECT random

SELECT * FROM customers, products WHERE a=b AND c<d ORDER BY RAND() LIMIT 1000;

SELECT * FROM customers ORDER BY RAND();

SELECT phone, RAND(3) FROM customers;



-- random

SELECT 
     t.first_name, t.last_name, t.phone, t.email, t.street, t.city, t.state, t.zip_code
FROM
    customers AS t
ORDER BY RAND()
LIMIT 5;



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