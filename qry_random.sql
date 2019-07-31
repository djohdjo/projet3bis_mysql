use myproduction;

SELECT 
     t.first_name, t.last_name, t.phone, t.email, t.street, t.city, t.state, t.zip_code
FROM
    customers AS t
ORDER BY RAND()
LIMIT 5;
