/* 1. Lista el nombre de todos los productos que hay en la tabla producto. */
SELECT nombre FROM producto;
/* 2. Lista los nombres y los precios de todos los productos de la tabla producto. */
SELECT nombre, precio FROM producto;
/* 3. Lista todas las columnas de la tabla producto. */
SELECT * FROM producto;
/* 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). */
SELECT nombre, precio, precio * 1.10 AS precio_usd FROM producto;
/* 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares. */
SELECT nombre AS "nombre de producto", precio AS "euros", precio * 1.10 AS "dólares" FROM producto;
/* 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula. */
SELECT UPPER(nombre), precio FROM producto;
/* 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula. */
SELECT LOWER(nombre), precio FROM producto;
/* 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante. */
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS abreviatura FROM fabricante;
/* 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio. */
SELECT nombre, ROUND(precio) AS precio FROM producto;
/* 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal. */
SELECT nombre, TRUNCATE(precio, 0) AS precio FROM producto;

/* 11. Lista el identificador de los fabricantes que tienen productos en la tabla producto. */

/* 12. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos. */


/* 13. Lista los nombres de los fabricantes ordenados de forma ascendente. */
SELECT nombre FROM fabricante ORDER BY nombre ASC;
/* 14. Lista los nombres de los fabricantes ordenados de forma descendente. */
SELECT nombre FROM fabricante ORDER BY nombre DESC;
/* 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente. */
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
/* 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante. */
SELECT * FROM fabricante LIMIT 5;
/* 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta. */
SELECT * FROM fabricante LIMIT 3, 2;
/* 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT) */
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
/* 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT) */
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

/* 20. Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2. */


/* 21. Lista el nombre de los productos que tienen un precio menor o igual a 120€. */
SELECT nombre FROM producto WHERE precio <= 120;
/* 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€. */
SELECT nombre FROM producto WHERE precio >= 400;
/* 23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€. */
SELECT nombre FROM producto WHERE precio < 400;
/* 24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN. */
SELECT nombre FROM producto WHERE precio >= 80 AND precio <= 300;
/* 25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN. */
SELECT nombre FROM producto WHERE precio BETWEEN 60 AND 200;
/* 26. Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6. */
SELECT nombre FROM producto WHERE precio > 200 AND fabricante_id = 6;

/* 27. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN. */

/* 28. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN. */


/* 29. Lista el nombre y el precio de los productos en céntimos. Cree un alias para la columna que se llame céntimos. */
SELECT nombre, precio * 100 AS céntimos FROM producto;
/* 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S. */
SELECT nombre FROM fabricante WHERE nombre LIKE 'S%';
/* 31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e. */
SELECT nombre FROM fabricante WHERE nombre LIKE '%e';
/* 32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w. */
SELECT nombre FROM fabricante WHERE nombre LIKE '%w%';
/* 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres. */
SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;
/* 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre. */
SELECT nombre FROM producto WHERE nombre LIKE '%Portátil%';
/* 35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €. */
SELECT nombre FROM producto WHERE nombre LIKE '%Monitor%' AND precio < 215;
/* 36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente). */
SELECT nombre, precio FROM producto WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;

/** 38. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. */
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM productos p
JOIN fabricantes f ON p.id_fabricante = f.id_fabricante;

/** 39. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos, ordenado por nombre del fabricante. */
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM productos p
JOIN fabricantes f ON p.id_fabricante = f.id_fabricante
ORDER BY f.nombre;

/** 40. Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante. */
SELECT p.id_producto, p.nombre AS nombre_producto, p.id_fabricante, f.nombre AS nombre_fabricante
FROM productos p
JOIN fabricantes f ON p.id_fabricante = f.id_fabricante;

/** 41. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato. */
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM productos p
JOIN fabricantes f ON p.id_fabricante = f.id_fabricante
ORDER BY p.precio ASC
LIMIT 1;

/** 42. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro. */
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM productos p
JOIN fabricantes f ON p.id_fabricante = f.id_fabricante
ORDER BY p.precio DESC
LIMIT 1;

/** 43. Devuelve una lista de todos los productos del fabricante Lenovo. */
SELECT p.*
FROM productos p
JOIN fabricantes f ON p.id_fabricante = f.id_fabricante
WHERE f.nombre = 'Lenovo';

/** 44. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€. */
SELECT p.*
FROM productos p
JOIN fabricantes f ON p.id_fabricante = f.id_fabricante
WHERE f.nombre = 'Crucial' AND p.precio > 200;

/** 45. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate sin utilizar el operador IN. */
SELECT p.*
FROM productos p
JOIN fabricantes f ON p.id_fabricante = f.id_fabricante
WHERE (f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate');

/** 46. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate utilizando el operador IN. */
SELECT p.*
FROM productos p
JOIN fabricantes f ON p.id_fabricante = f.id_fabricante
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

/** 47. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e. */
SELECT p.nombre, p.precio
FROM productos p
JOIN fabricantes f ON p.id_fabricante = f.id_fabricante
WHERE f.nombre LIKE '%e';

/** 48. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre. */
SELECT p.nombre, p.precio
FROM productos p
JOIN fabricantes f ON p.id_fabricante = f.id_fabricante
WHERE f.nombre LIKE '%w%';

/** 49. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. */
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM productos p
JOIN fabricantes f ON p.id_fabricante = f.id_fabricante
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

/** 50. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos. */
SELECT DISTINCT f.id_fabricante, f.nombre
FROM fabricantes f
JOIN productos p ON f.id_fabricante = p.id_fabricante;

/** 51. Consultas multitabla (Composición externa) */
/** 52. Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN. */

/** 53. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. */
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto
FROM fabricantes f
LEFT JOIN productos p ON f.id_fabricante = p.id_fabricante;

/** 54. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado. */
SELECT f.nombre
FROM fabricantes f
LEFT JOIN productos p ON f.id_fabricante = p.id_fabricante
WHERE p.id_producto IS NULL;

/** 55. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta. */
/* 
Sí, pueden existir productos que no estén relacionados con un fabricante si la relación entre las tablas no está correctamente definida
o si hay registros en la tabla de productos que no tienen un identificador de fabricante válido. 
*/

/** 56. Consultas resumen */
/** 57. Calcula el número total de productos que hay en la tabla productos. */
SELECT COUNT(*) AS total_productos FROM productos;

/** 58. Calcula el número total de fabricantes que hay en la tabla fabricante. */
SELECT COUNT(*) AS total_fabricantes FROM fabricantes;

/** 59. Calcula el número de valores distintos de identificador de fabricante que aparecen en la tabla productos. */
SELECT COUNT(DISTINCT id_fabricante) AS total_fabricantes_distintos FROM productos;

/** 60. Calcula la media del precio de todos los productos. */
SELECT AVG(precio) AS precio_medio FROM productos;

/** 61. Calcula el precio más barato de todos los productos. */
SELECT MIN(precio) AS precio_minimo FROM productos;

/** 62. Calcula el precio más caro de todos los productos. */
SELECT MAX(precio) AS precio_maximo FROM productos;

/** 63. Lista el nombre y el precio del producto más barato. */
SELECT nombre, precio
FROM productos
ORDER BY precio ASC
LIMIT 1;

/** 64. Lista el nombre y el precio del producto más caro. */
SELECT nombre, precio
FROM productos
ORDER BY precio DESC
LIMIT 1;

/** 65. Calcula la suma de los precios de todos los productos. */
SELECT SUM(precio) AS suma_precios FROM productos;

/** 66. Calcula el número de productos que tiene el fabricante Asus. */
SELECT COUNT(*) AS total_productos_asus
FROM productos
WHERE id_fabricante = (SELECT id_fabricante FROM fabricantes WHERE nombre = 'Asus');

/** 67. Calcula la media del precio de todos los productos del fabricante Asus. */
SELECT AVG(precio) AS precio_medio_asus
FROM productos
WHERE id_fabricante = (SELECT id_fabricante FROM fabricantes WHERE nombre = 'Asus');

/** 68. Calcula el precio más barato de todos los productos del fabricante Asus. */
SELECT MIN(precio) AS precio_minimo_asus
FROM productos
WHERE id_fabricante = (SELECT id_fabricante FROM fabricantes WHERE nombre = 'Asus');

/** 69. Calcula el precio más caro de todos los productos del fabricante Asus. */
SELECT MAX(precio) AS precio_maximo_asus
FROM productos
WHERE id_fabricante = (SELECT id_fabricante FROM fabricantes WHERE nombre = 'Asus');

/** 70. Calcula la suma de todos los precios de los productos del fabricante Asus. */
SELECT SUM(precio) AS suma_precios_asus
FROM productos
WHERE id_fabricante = (SELECT id_fabricante FROM fabricantes WHERE nombre = 'Asus');

/** 71. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial. */
SELECT MAX(precio) AS precio_maximo, MIN(precio) AS precio_minimo, AVG(precio) AS precio_medio, COUNT(*) AS total_productos
FROM productos
WHERE id_fabricante = (SELECT id_fabricante FROM fabricantes WHERE nombre = 'Crucial');

/** 72. Muestra el número total de productos que tiene cada uno de los fabricantes, incluyendo aquellos que no tienen productos. */
SELECT f.nombre AS nombre_fabricante, COUNT(p.id_producto) AS total_productos
FROM fabricantes f
LEFT JOIN productos p ON f.id_fabricante = p.id_fabricante
GROUP BY f.nombre
ORDER BY total_productos DESC;

/** 73. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. */
SELECT f.nombre AS nombre_fabricante, MAX(p.precio) AS precio_maximo, MIN(p.precio) AS precio_minimo, AVG(p.precio) AS precio_medio
FROM fabricantes f
JOIN productos p ON f.id_fabricante = p.id_fabricante
GROUP BY f.nombre;

/** 74. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. */
SELECT id_fabricante, MAX(precio) AS precio_maximo, MIN(precio) AS precio_minimo, AVG(precio) AS precio_medio, COUNT(*) AS total_productos
FROM productos
GROUP BY id_fabricante
HAVING AVG(precio) > 200;

/** 75. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. */
SELECT f.nombre AS nombre_fabricante, MAX(p.precio) AS precio_maximo, MIN(p.precio) AS precio_minimo, AVG(p.precio) AS precio_medio, COUNT(p.id_producto) AS total_productos
FROM fabricantes f
JOIN productos p ON f.id_fabricante = p.id_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio) > 200;

/** 76. Calcula el número de productos que tienen un precio mayor o igual a 180€. */
SELECT COUNT(*) AS total_productos_mayores_180
FROM productos
WHERE precio >= 180;

/** 77. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€. */
SELECT f.nombre AS nombre_fabricante, COUNT(p.id_producto) AS total_productos_mayores_180
FROM fabricantes f
LEFT JOIN productos p ON f.id_fabricante = p.id_fabricante AND p.precio >= 180
GROUP BY f.nombre;

/** 78. Lista el precio medio de los productos de cada fabricante, mostrando solamente el identificador del fabricante. */
SELECT id_fabricante, AVG(precio) AS precio_medio
FROM productos
GROUP BY id_fabricante;

/** 79. Lista el precio medio de los productos de cada fabricante, mostrando solamente el nombre del fabricante. */
SELECT f.nombre AS nombre_fabricante, AVG(p.precio) AS precio_medio
FROM fabricantes f
JOIN productos p ON f.id_fabricante = p.id_fabricante
GROUP BY f.nombre;

/** 80. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€. */
SELECT f.nombre AS nombre_fabricante
FROM fabricantes f
JOIN productos p ON f.id_fabricante = p.id_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio) >= 150;

/** 81. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos. */
SELECT f.nombre AS nombre_fabricante
FROM fabricantes f
JOIN productos p ON f.id_fabricante = p.id_fabricante
GROUP BY f.nombre
HAVING COUNT(p.id_producto) >= 2;

/** 82. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. */
SELECT f.nombre AS nombre_fabricante, COUNT(p.id_producto) AS total_productos_mayores_220
FROM fabricantes f
LEFT JOIN productos p ON f.id_fabricante = p.id_fabricante AND p.precio >= 220
GROUP BY f.nombre;

