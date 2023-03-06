/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

WITH bacall_films AS (
    SELECT
        film_id
    FROM
        actor
    JOIN
        film_actor USING(actor_id)
    WHERE
        actor_id = 112
    ),

    bacall_1_actors AS (
    SELECT
        actor_id
    FROM
        film_actor
    WHERE
        film_id IN (SELECT * FROM bacall_films)
            AND actor_id != 112
        ),

    bacall_1_films AS (
    SELECT 
        *
    FROM
        actor
    JOIN 
        bacall_1_actors USING (actor_id)
    WHERE
        actor_id IN (SELECT * FROM bacall_1_actors) 
    ),  

    bacall_2_actors AS (
    SELECT
        actor_id
    FROM 
        film_actor
    WHERE
        film_id IN (SELECT film_id FROM bacall_1_films)
            AND actor_id NOT IN (SELECT * FROM bacall_1_actors)
            AND actor_id != 112 
        )    

SELECT
    DISTINCT CONCAT(a.first_name, ' ', a.last_name) AS "Actor Name"
FROM 
    bacall_2_actors
JOIN
    actor AS a USING(actor_id)
ORDER BY
    "Actor Name";
