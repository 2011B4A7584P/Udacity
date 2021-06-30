/*1*/
SELECT f.film_id, f.title FROM film f WHERE f.rating = 'G' AND f.rental_rate BETWEEN
2.99 AND 4.99 ORDER BY f.length LIMIT 5;

/*2*/
/*a*/
SELECT * FROM actor a WHERE a.last_name LIKE 'Jo%' ORDER BY a.last_name, a.actor_id;
/*b*/
SELECT a.actor_id FROM actor a WHERE a.last_name LIKE 'Jo%' ORDER BY a.last_name DESC, a.actor_id
DESC LIMIT 1;

/*3*/
SELECT * FROM city c WHERE c.city ILIKE '%gas%' OR c.city ILIKE '%he%' ORDER BY c.country_id DESC;

/*4*/
SELECT a.address FROM address a WHERE a.phone LIKE '%10' ORDER BY a.city_id;

/*5*/
SELECT * 
FROM payment p 
WHERE 
		p.amount IN (0.99,4.99,8.99) AND
		p.payment_date BETWEEN '2007-02-16 08:00:00' AND '2007-02-16 17:00:00'
LIMIT 10;		