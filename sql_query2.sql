# Find out the number of documentaries with deleted scenes.

SELECT COUNT(*) AS TotalFilms
FROM category ,film_category,film 
WHERE film_category.film_id = film.film_id
AND category.category_id = film_category.category_id
AND category.name = "Documentary"
AND film.special_features LIKE '%Deleted Scenes%';

# Find out the number of sci-fi movies rented by the store managed by Jon Stephens.

SELECT COUNT(DISTINCT film.film_id) TotalFilms
FROM rental, inventory,store, staff, film, category, film_category
WHERE film_category.film_id = film.film_id
AND category.category_id = film_category.category_id
AND film.film_id = inventory.film_id
AND inventory.inventory_id = rental.inventory_id
AND inventory.store_id = store.store_id
AND store.store_id = staff.store_id
AND staff.first_name="Jon"
AND staff.last_name= "Stephens";

#Find out the total sales from Animation movies.

SELECT SUM(total_sales) AS TOTALSALES
FROM sales_by_film_category
WHERE category = "Animation";

# Find out the top 3 rented category of movies by “PATRICIA JOHNSON”.

SELECT film.title , COUNT(film.film_id)
FROM film,film_actor,actor,rental,inventory
WHERE rental.inventory_id = inventory.inventory_id
AND inventory.film_id = film.film_id
AND film.film_id = film_actor.film_id
AND film_actor.actor_id = actor.actor_id
AND actor.first_name = "PATRICIA"
AND actor.last_name = "JOHNSON"
GROUP BY film.title
ORDER BY COUNT(film.film_id) DESC
LIMIT 3;

#Find out the number of R rated movies rented by “SUSAN WILSON”.

SELECT COUNT(film.film_id) AS TOTALFILMS
FROM film,customer_list ,rental ,inventory
WHERE customer_list.ID = rental.customer_id
AND inventory.inventory_id = film.film_id
AND rental.inventory_id = inventory.inventory_id
AND customer_list.name = "SUSAN WILSON"
AND film.rating = "R";