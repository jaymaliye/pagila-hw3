/*
 * Compute the country with the most customers in it. 
 */

SELECT
    d.country
FROM
    customer AS a
JOIN
    address AS b USING(address_id)
JOIN
    city AS c USING(city_id)
JOIN
    country AS d USING(country_id)
WHERE
    d.country_id != 103
GROUP BY 
    d.country
ORDER BY 
    count(a.customer_id) DESC
LIMIT 
    1;
