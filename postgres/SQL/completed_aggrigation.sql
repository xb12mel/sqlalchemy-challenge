SELECT * FROM film;
SELECT COUNT(film_id) FROM film;

-- Counts the total number of films and renames the column "Total Films"
SELECT COUNT(film_id) AS "TOTAL FILMS"

FROM film;

-- Groups the films by ratings and counts each group as well as renames the column "Total Films"
SELECT rating, COUNT(film_id) AS "Total Films"
FROM film
GROUP BY rating;

-- find the total rental period for all films
SELECT AVG(rental_duration) AS "Average Rental Period"
From film;
-- Show the average rental rate for all movies
SELECT rental_duration, AVG (rental_rate) AS "Average Rental Rate"
FROM film
GROUP BY rental_duration;
-- Show the max rental rate for all movies
SELECT rental_duration, MIN(rental_rate) AS "Min rentalrate"
FROM film
GROUP BY rental_duration;

SELECT rental_duration, MAX(rental_rate) AS "Max rental rate"
FROM film
GROUP BY rental_duration;

SELECT rating, AVG(rental_rate) AS "Max rental rate"
FROM film
GROUP BY rating;

SELECT SUM(replacement_cost) FROM film;
-- find out how much to replace all of the movies in the db
SELECT rating, SUM(replacement_cost)
FROM film
GROUP BY rating;
-- return the lengt of the longest movie
SELECT MAX(length) FROM film;

-- show the average rental rate in decending order
SELECT rental_rate, ROUND(AVG(length), 2) AS "average length"
FROM film
GROUP BY rental_rate
ORDER BY "average length" DESC;

-- show the average rental rate in asending order
SELECT rental_rate, ROUND(AVG(length), 2) AS "average length"
FROM film
GROUP BY rental_rate
ORDER BY "average length" ASC;

SELECT title, film_id
FROM film
WHERE title = 'EARLY HOME';

SELECT *
FROM inventory
WHERE film_id = 268;

-- run subquery on the same data as the two separate quiries above
SELECT i.inventory_id, i.film_id, i.store_id
FROM inventory i
JOIN film f
ON (i.film_id= f.film_id) 

SELECT *
FROM inventory
WHERE film_id IN 
(
	SELECT film_id
	FROM film
	WHERE title='EARLY HOME'
)

