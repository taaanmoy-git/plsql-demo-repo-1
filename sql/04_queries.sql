\echo All customers
SELECT customer_id, first_name, last_name, email, phone, city, created_at
FROM infosys.customer
ORDER BY customer_id;

\echo Customers in Seattle
SELECT customer_id, first_name, last_name, email
FROM infosys.customer
WHERE city = 'Seattle'
ORDER BY last_name, first_name;

\echo Customer count by city
SELECT city, COUNT(*) AS customer_count
FROM infosys.customer
GROUP BY city
ORDER BY city;

\echo Total customers from the customer API
SELECT infosys.customer_count() AS customer_count
