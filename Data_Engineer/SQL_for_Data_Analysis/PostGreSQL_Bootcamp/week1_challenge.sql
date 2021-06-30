/*1*/
SELECT f.film_id, f.title, f.rating FROM film f WHERE f.rating <> 'NC-17';
/*2*/
SELECT a.address, a.postal_code FROM  address a WHERE a.district = 'Michigan';
/*3*/
SELECT p.payment_id, p.customer_id, p.amount, p.payment_date FROM payment p
WHERE p.payment_date BETWEEN '2007-02-18 00:00:00' AND '2007-02-20 00:00:00';
/*4*/
SELECT * FROM customer c WHERE c.last_name IN ('Williams','Taylor','Andrews');/*runs faster*/
SELECT * FROM customer c WHERE c.last_name = 'Williams'
							OR c.last_name = 'Taylor'
							OR c.last_name = 'Andrews';
/*5*/
SELECT r.rental_id,r.customer_id FROM rental r 
WHERE r.rental_date >= '2005-05-26 00:00:00' AND r.rental_date < '2005-05-29 00:00:00'

SELECT r.rental_id,r.customer_id FROM rental r 
WHERE r.rental_date BETWEEN '2005-05-26 00:00:00' AND '2005-05-28 23:59:59';