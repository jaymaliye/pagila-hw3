/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

SELECT
    d.country,
    SUM(e.amount) AS total_payments
FROM
    customer AS a
JOIN
    address AS b USING(address_id)
JOIN
    city AS c USING(city_id)
JOIN
    country AS d USING(country_id)
JOIN
    payment AS e USING(customer_id)
GROUP BY 
    d.country
ORDER BY 
    SUM(e.amount) DESC,
    d.country;
    
