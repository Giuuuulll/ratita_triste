/** 1. Listar el nombre de los Clientes, nombre de contacto y país donde viven. */
SELECT CustomerName, ContactName, Country FROM Customer;

/** 2. Del ejercicio 1 ordenarlo en forma descendente por nombre de contacto. */
SELECT CustomerName, ContactName, Country FROM Customer ORDER BY ContactName DESC;

/** 3. Listar CustomerName, ContactName, Address_Street, Address_Nro, Address_PostalCode, Address_City, Country de aquellos clientes que viven en Norway. */
SELECT CustomerName, ContactName, Address_Street, Address_Nro, Address_PostalCode, Address_City, Country 
FROM Customer WHERE Country = 'Norway';

/** 4. Mostrar el campo Country y CustomerName de aquellos clientes que terminen con la letra l. */
SELECT Country, CustomerName FROM Customer WHERE CustomerName LIKE '%l';

/** 5. Mostrar el campo Country y CustomerName de aquellos clientes que contengan la letra l en el país donde residen. */
SELECT Country, CustomerName FROM Customer WHERE Country LIKE '%l%';

/** 6. Listar CustomerName, ContactName, Address_Street, Address_Nro, Address_PostalCode de aquellos clientes que tienen el Address_PostalCode entre 2000 y 40000. */
SELECT CustomerName, ContactName, Address_Street, Address_Nro, Address_PostalCode 
FROM Customer WHERE Address_PostalCode BETWEEN '2000' AND '40000';

/** 7. Listar CustomerName, ContactName de aquellos clientes que tienen el Address_Nro 2122, 21, 124006, 774006, 3321. */
SELECT CustomerName, ContactName 
FROM Customer WHERE Address_Nro IN ('2122', '21', '124006', '774006', '3321');

/** 8. Mostrar el campo Country y CustomerName de aquellos clientes que terminen el Address_PostalCode mayor a 74006. */
SELECT Country, CustomerName 
FROM Customer WHERE Address_PostalCode > '74006';

/** 9. Listar CustomerName, ContactName, Address_Street, Address_Nro, Address_PostalCode, Address_City, Country de aquellos clientes que Country comienza con la combinación Dal. */
SELECT CustomerName, ContactName, Address_Street, Address_Nro, Address_PostalCode, Address_City, Country 
FROM Customer WHERE Country LIKE 'Dal%';

/** 10. Listar id_Customer, CustomerName, ContactName, con id_Customer de mayor a menor con los ID desde 6 hasta el 15 con aquellos CustomerName que contengan la letra a. */
SELECT id_Customer, CustomerName, ContactName 
FROM Customer WHERE id_Customer BETWEEN 6 AND 15 AND CustomerName LIKE '%a%' 
ORDER BY id_Customer DESC;
