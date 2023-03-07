/*
 * Compute the number of customers who live outside of the US.
 */

SELECT COUNT(*)
FROM customer c
INNER JOIN address a ON a.address_id = c.address_id
INNER JOIN city ci ON ci.city_id = a.city_id
INNER JOIN country co ON co.country_id = ci.country_id
WHERE co.country != 'United States';
