/* Ejercicio 1: Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente y el nombre de la compañia de la tabla Customers. */

USE northwind; 

WITH customernameiD AS (SELECT customer_id, company_name FROM customers) 
SELECT * FROM customernameiD;


/* Ejercicio 2: Selecciona solo los de que vengan de "Germany". Ampliemos un poco la query anterior. 
En este caso, queremos un resultado similar al anterior, pero solo queremos los que pertezcan a "Germany".*/

WITH customernameiD AS (SELECT customer_id, company_name, country FROM customers) 
SELECT customer_id, company_name FROM customernameiD WHERE country = 'Germany';

/* Ejercicio 3: Extraed el id de las facturas y su fecha de cada cliente. En este caso queremos extraer todas 
las facturas que se han emitido a un cliente, su fecha la compañia a la que pertenece. */

WITH clientorder AS(SELECT customer_id, company_name, order_id, order_date FROM customers INNER JOIN orders USING (customer_id)) 
SELECT * FROM clientorder;

/* Ejercicio 4: Contad el número de facturas por cliente. Mejoremos la query anterior. 
En este caso queremos saber el número de facturas emitidas por cada cliente.*/

WITH clientorder AS(SELECT customer_id, company_name, order_id FROM customers INNER JOIN orders USING (customer_id)) 
SELECT customer_id, company_name, COUNT(order_id) AS numero_facturas FROM clientorder GROUP BY customer_id;


/* Ejercicio 5: Cuál la cantidad media pedida de todos los productos ProductID.
Necesitaréis extraer la suma de las cantidades por cada producto y calcular la media.*/

WITH clientorder AS(SELECT product_id, quantity, product_name FROM products INNER JOIN order_details USING (product_id)) 
SELECT AVG(quantity), product_id,product_name FROM clientorder GROUP BY product_name;

/* Ejercicio 6: Usando una CTE, extraer el nombre de las diferentes categorías de productos, con su precio medio, máximo y mínimo. */

WITH categorias_precio AS (
SELECT category_name, unit_price, category_id 
FROM categories 
INNER JOIN products 
USING (category_id))
SELECT AVG(unit_price), MAX(unit_price), MIN(unit_price), category_name
FROM categorias_precio
GROUP BY category_id;

/* Ejercicio 7: La empresa nos ha pedido que busquemos el nombre de cliente, su teléfono y el número de pedidos que ha hecho cada uno de ellos. */

WITH client_phone_orders AS (
SELECT company_name, phone, order_id, customer_id
FROM customers
INNER JOIN orders
USING (customer_id))
SELECT company_name, COUNT(order_id) AS numero_pedidos
FROM client_phone_orders 
GROUP BY customer_id;

/* Ejercicio 8: Modifica la cte del ejercicio anterior, úsala en una subconsulta para saber el nombre del cliente y su teléfono, para aquellos 
clientes que hayan hecho más de 6 pedidos en el año 1998. */

WITH client_phone_orders AS (
SELECT company_name, phone, order_id, customer_id, shipped_date
FROM customers
INNER JOIN orders
USING (customer_id))
SELECT order_id, company_name, shipped_date
FROM client_phone_orders 
WHERE YEAR(shipped_date) = 1998 IN(
SELECT YEAR(shipped_date)
FROM client_phone_orders
GROUP BY company_name
HAVING COUNT(order_id)>6);

/* 9.Modifica la consulta anterior para obtener los mismos resultados pero con los pedidos por año que ha hecho cada cliente.
*/

WITH client_phone_orders AS (
SELECT company_name, phone, order_id, customer_id, shipped_date
FROM customers
INNER JOIN orders
USING (customer_id))
SELECT order_id, company_name, YEAR(shipped_date), count(order_id)
FROM client_phone_orders
GROUP BY company_name, YEAR(shipped_date)
HAVING COUNT(order_id)>6;









