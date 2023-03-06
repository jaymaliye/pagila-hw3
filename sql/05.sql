/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

WITH ac_actors AS (
    SELECT
        *
    FROM
        film_actor
    WHERE 
        film_actor.film_id IN (
            SELECT 
                film_id
            FROM 
                film
            WHERE title = 'AMERICAN CIRCUS'    
        )
    ),

    ac_actor_films AS (
        SELECT 
            film_actor.film_id
        FROM 
            ac_actors
        JOIN 
            film_actor USING(actor_id)
        GROUP BY 
            film_actor.film_id
        HAVING 
            COUNT(ac_actors.actor_id) >= 2
        )

SELECT 
    title
FROM
    film
JOIN 
    ac_actor_films USING(film_id)
ORDER BY 
    title;
    
