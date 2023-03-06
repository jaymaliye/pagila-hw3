/*
 * Compute the number of customers who live outside of the US.
 */

SELECT 
    count(a.customer_id)
FROM 
    customer AS a
JOIN 
    address AS b USING(address_id)
JOIN 
    city AS c USING(city_id)
JOIN 
    country AS d USING(country_id)
WHERE
    d.country_id != 103;
