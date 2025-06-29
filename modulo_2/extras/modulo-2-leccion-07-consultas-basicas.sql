-- PAIR modulo-2-leccion-07-consultas-basicas

USE northwind

-- Ejercicio 4: Conociendo a las empleadas:

/*  El objetivo de cualquier buena jefa (o trabajadora) en una empresa debería ser conocer bien a sus compañeras. 
Para lograrlo, vamos a diseñar una consulta SQL para obtener una lista con los datos de las empleadas y empleados 
de la empresa Northwind. Esta consulta incluirá los campos `employee_id`, `last_name` y `first_name`. 
*/

SELECT EmployeeID, LastName, FirstName 
FROM employees;

-- Ejercicio 5: Conociendo los productos más baratos:
/* Supongamos que en nuestro primer día en la empresa nos informan que están llevando a cabo
 una reestructuración del negocio. Nuestras compañeras nos comentan que, en estos momentos, Northwind 
 tiene una amplia gama de productos en venta, algunos de los cuales tienen un éxito limitado entre las clientas.

Nuestra primera tarea consiste en identificar aquellos productos (tabla products) cuyos precios por unidad oscilen
 entre 0 y 5 dólares, es decir, los productos más asequibles.*/
 
SELECT * FROM products  
WHERE UnitPrice >= 0.0 AND UnitPrice <= 5.0;

-- Ejercicio 6: Conociendo los productos que no tienen precio:
/*Para comprobar si los datos en la tabla products están correctos, nos interesa seleccionar aquellos productos 
que no tengan precio, porque lo hayan dejado vacio al introducir los datos (NULL).*/

SELECT * FROM products 
WHERE UnitPrice IS NULL;

-- Ejercicio 7: Comparando productos:
/* Ahora obtén los datos de aquellos productos con un precio menor a 15 dólares, pero sólo aquellos que tienen un ID 
menor que 20 (para tener una muestra significativa pero no tener que ver todos los productos existentes).*/

SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE ProductID < 20 AND UnitPrice < 15;

-- Ejercicio 8: Cambiando de operadores:
/* Ahora vamos a hacer la misma consulta que en ejercicio anterior, pero haciendo invirtiendo el uso de los operadores
 y queremos saber aquellos que tengan un precio superior a 15 dólares y un ID superior a 20..*/

SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE ProductID > 20 AND UnitPrice > 15;

-- Ejercicio 9:  Conociendo los paises a los que vendemos:
/*A Northwind le interesa conocer los datos de los países que hacen pedidos (orders) para focalizar el negocio en esas 
regiones y al mismo tiempo crear campañas de marketing para conseguir mejorar en las otras regiones. Realiza una consulta 
para obtener ese dato.*/

SELECT ShipCountry FROM Orders;

-- Ejercicio 10:  Conociendo el tipo de productos que vendemos en Northwind:
/*Crea una consulta que muestre los primeros 10 productos según su ID y que nos indique el nombre de dichos productos y sus precios.*/

SELECT ProductID, ProductName, UnitPrice FROM products 
ORDER BY ProductID
LIMIT 10;

-- Ejercicio 11: Ordenando los resultados:
/*  Ahora realiza la misma consulta pero que nos muestre los últimos 10 productos según su ID de manera descendiente.*/

SELECT ProductID, ProductName, UnitPrice FROM products 
ORDER BY ProductID DESC
LIMIT 10;

-- Ejercicio 12: Que pedidos tenemos en nuestra BBDD:
/* Últimamente ha habido algo de descontrol en la empresa a la hora de controlar los pedidos. Nos interesa conocer los 
distintos pedidos que hemos tenido (mostrar los valores únicos de ID en la tabla order_details).*/

SELECT DISTINCT OrderID FROM orderdetails;

-- Ejercicio 13: Qué pedidos han gastado más:
/* Una vez hemos inspeccionado el tipo de pedidos que tenemos en la empresa, desde la dirección nos piden conocer los 3 pedidos 
que han supuesto un mayor ingreso para la empresa. Crea una columna en esta consulta con el alias ImporteTotal. Nota: Utiliza unit_price 
.y quantity para calcular el importe total.*/

SELECT OrderID, (UnitPrice*Quantity) AS ImporteTotal  
FROM orderdetails   
ORDER BY ImporteTotal DESC
LIMIT 3;

-- Ejercicio 14: Los pedidos que están entre las posiciones 5 y 10 de nuestro *ranking*: 
/*Ahora, no sabemos bien por qué razón, desde el departamento de Ventas nos piden seleccionar el ID de los pedidos situados entre la 5 y 
la 10 mejor posición en cuanto al coste económico total ImporteTotal.*/

SELECT OrderID, (UnitPrice*Quantity) AS ImporteTotal  
FROM orderdetails   
ORDER BY ImporteTotal DESC
LIMIT 6  
OFFSET 4;

-- Ejercicio 15: Selecciona envios con retraso:

SELECT OrderID, OrderDate, ShippedDate, DATE_ADD(ShippedDate, INTERVAL 5 DAY) as FechaRetrasada 
FROM orders;

-- Ejercicio 16: Selecciona los productos más rentables:

SELECT product_id, product_name, unit_price 
FROM products  
WHERE unit_price BETWEEN 15 AND 50;

-- Ejercicio 17:  Selecciona los productos con unos precios dados:

SELECT *   
FROM products   
WHERE UnitPrice IN (20, 18, 19);
