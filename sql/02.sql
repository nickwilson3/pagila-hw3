/*
 * Compute the country with the most customers in it. 
 */

SELECT country
FROM customer c
INNER JOIN address a ON a.address_id = c.address_id
INNER JOIN city ci ON ci.city_id = a.city_id
INNER JOIN country co ON co.country_id = ci.country_id
GROUP BY co.country
ORDER BY COUNT(*) DESC
LIMIT 1;
