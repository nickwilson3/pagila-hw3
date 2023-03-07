/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */

SELECT DISTINCT a.first_name, a.last_name
FROM actor a
INNER JOIN film_actor fa on fa.actor_id = a.actor_id
INNER JOIN film f on f.film_id = fa.film_id
INNER JOIN film_category fc on fc.film_id = f.film_id
INNER JOIN category c on c.category_id = fc.category_id
WHERE c.name IN ('Children') AND (a.first_name, a.last_name) NOT IN
(
SELECT a.first_name, a.last_name
FROM actor a
INNER JOIN film_actor fa on fa.actor_id = a.actor_id
INNER JOIN film f on f.film_id = fa.film_id
INNER JOIN film_category fc on fc.film_id = f.film_id
INNER JOIN category c on c.category_id = fc.category_id
WHERE c.name IN ('Horror')
)
ORDER BY a.last_name;
