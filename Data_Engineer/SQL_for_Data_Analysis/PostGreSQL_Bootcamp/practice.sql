SELECT * FROM film LIMIT 10;

SELECT f.title, f.rating, f.rental_rate FROM film f;

SELECT c.customer_id, c.first_name, c.last_name, c.store_id FROM customer c;
SELECT * FROM payment;
SELECT a.address, a.district FROM address a;

SELECT f.film_id, f.title FROM film f WHERE f.length < 60;
SELECT DISTINCT f.rating FROM film f;
SELECT f.title FROM film f WHERE f.rating IN ('G','PG-13');
SELECT COUNT(*) FROM film f WHERE f.rating IN ('G','PG-13');/*401*/

SELECT COUNT(*) FROM film f WHERE f.rating = 'G' OR f.rating = 'PG-13';/*401*/

SELECT c.customer_id, c.store_id, c.email FROM customer c WHERE 
c.first_name = 'Nancy' AND c.last_name = 'Thomas';

SELECT f.film_id, f.title, f.description FROM film f 
WHERE f.rating IN ('G','PG-13','NC-17');

SELECT c.first_name, c.last_name FROM customer c WHERE c.last_name IN 
('Smith','Miller','Taylor','King');

SELECT c.first_name, c.last_name, c.email FROM customer c WHERE c.first_name IN 
('Janice','Mildred','Jared', 'Angela'); 

SELECT * FROM film f LIMIT 10;

SELECT f.title, f.description, f.rental_rate FROM film f 
WHERE f.description LIKE '%Drama%';

SELECT  c.customer_id, c.first_name, c.last_name, c.email
FROM customer c WHERE c.first_name ILIKE 'Gwen%';

SELECT * FROM film f WHERE f.title ILIKE '_he%';

SELECT f.title, f.description FROM film f WHERE f.title NOT LIKE 'A';

SELECT f.title FROM film f WHERE f.rating = 'PG-13' LIMIT 5;

SELECT * FROM payment p LIMIT 10;

SELECT f.film_id, f.title, f.rental_rate, f.length FROM 
film f WHERE f.rental_rate >= 2.99 ORDER BY f.length DESC LIMIT 10;


SELECT c.customer_id, c.first_name, c.last_name FROM customer c 
WHERE c.store_id = 1 ORDER BY c.last_name;

SELECT * FROM payment p LIMIT 5;


SELECT c.customer_id, c.first_name, c.last_name, p.payment_id, p.amount FROM customer c INNER JOIN 
payment p ON c.customer_id = p.customer_id WHERE p.payment_date BETWEEN '2007-02-18 08:00:00' 
AND '2007-02-25 17:00:00' ORDER BY c.customer_id;

SELECT i.inventory_id, f.film_id, f.title FROM film f INNER JOIN 
inventory i ON f.film_id = i.film_id WHERE i.store_id = 1;

SELECT a.address, c.first_name, c.last_name FROM customer c 
INNER JOIN address a ON c.address_id = a.address_id WHERE 
(c.first_name = 'Barbara' AND c.last_name = 'Jones') OR
(c.first_name = 'Deborah' AND c.last_name = 'Walker');

SELECT a.address, c.first_name, c.last_name FROM customer c 
INNER JOIN address a ON c.address_id = a.address_id WHERE 
c.first_name || ' ' || c.last_name IN ('Barbara Jones', 'Deborah Walker');


SELECT c.customer_id, c.email, r.rental_id, r.rental_date FROM customer c INNER JOIN rental r ON 
c.customer_id = r.customer_id WHERE r.staff_id = 1 ORDER BY r.rental_date DESC;




