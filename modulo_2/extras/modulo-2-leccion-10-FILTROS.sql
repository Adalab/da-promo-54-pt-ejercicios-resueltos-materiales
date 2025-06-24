-- PAIR modulo-2-leccion-10-FILTROS
use northwind;

-- 1. Ciudades que empiezan con "A" o "B".

SELECT City,CompanyName,ContactName
FROM customers
WHERE City LIKE "A%" OR city LIKE "B%";

-- 2. Número de pedidos que han hecho en las ciudades que empiezan con L.

SELECT city AS ciudad, CompanyName AS empresa, ContactName AS persona_contacto, COUNT(orders.OrderID) AS numero_pedidos
FROM customers
INNER JOIN orders
ON customers.CustomerID = orders.CustomerID
GROUP BY city, CompanyName, ContactName
HAVING city LIKE 'L%';

-- 3. Todos los clientes cuyo "contact_title" no incluya "Sales".

SELECT ContactName, ContactTitle, CompanyName
FROM customers
WHERE ContactTitle NOT LIKE "%Sales%";

-- 4. Todos los clientes que no tengan una "A" en segunda posición en su nombre.

SELECT ContactName
FROM northwind.customers
where ContactName NOT like "_A%";

-- 5. Extraer toda la información sobre las compañias que tengamos en la BBDD

SELECT city, CompanyName, ContactName, 'Customers' AS Relationship
FROM customers
union 
SELECT city, CompanyName, ContactName, 'Suppliers'
FROM suppliers
ORDER BY city, CompanyName;

-- 6. Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".

select * from categories
WHERE description REGEXP "Sweet" OR description REGEXP  "sweet";


-- 7. Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la BBDD:

SELECT concat(LastName," ", FirstName) 
FROM northwind.employees
union
select ContactName from customers;
