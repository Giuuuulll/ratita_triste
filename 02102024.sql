/*crear la bse  de datos */
create database prueba;
/*mostrar las bases de datos existentes*/
SHOW DATABASES;
/*Para
seleccionar una base de datos concreta se usa el comando USE*/
USE prueba;
/*a CREATE TABLE que sirve para crear tablas*/
CREATE TABLE gente (nombre VARCHAR(40), fecha DATE);
/*Podemos consultar cuántas tablas y qué nombres tienen en una base de datos, usando la
sentencia SHOW TABLES:*/
SHOW TABLES;
/*uando creamos una tabla la opción por defecto es que se permitan los valores nulos
(NULL) y para que no se permitan*/
CREATE TABLE ciudad1 (nombre CHAR(20) NOT NULL, poblacion INT NULL);
/*si queremos que el valor por defecto para poblacion sea 5000, podemos crear
la tabla como*/
CREATE TABLE ciudad2 (nombre CHAR(20) NOT NULL, poblacion INT NULL
DEFAULT 5000);
/*Para claves primarias también se puede definir una clave primaria sobre un atributo, usando la palabra
clave KEY o PRIMARY KEY*/
CREATE TABLE ciudad3 (nombre CHAR(20) NOT NULL PRIMARY KEY, poblacion
INT NULL DEFAULT 5000);
/*Las claves primarias compuestas se usan cuando no hay ningún atributo en la tabla que identifique
cada registro de manera única.*/
 create table ButacaCine (
  sala int not null,
 num_butaca int not null,
color varchar(50),
  primary key(sala, num_butaca)
 ); 
 /*Para columnas autoincrementadas en MySQL tenemos la posibilidad de crear una
columna autoincrementada, aunque esta columna sólo puede ser de tipo entero.*/
CREATE TABLE ciudad5 (clave INT AUTO_INCREMENT PRIMARY KEY,
 nombre CHAR(20) NOT NULL,
 poblacion INT NULL DEFAULT 5000);
 /*Para establecer un número específico del que partiren el auto_increment hay que crear la tabla de la
siguiente manera:*/
create table prueba (id int key auto_increment, name
varchar(20)) auto_increment=20;
/*Para los comentarios, adicionalmente, al crear la tabla, podemos añadir un comentario a
cada columna. */
CREATE TABLE ciudad6
 (clave INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Clave principal',
nombre CHAR(50) NOT NULL,
 poblacion INT NULL DEFAULT 5000);
 /*Para borrar una tabla usamos DROP TABLE de manera sencilla:*/
  DROP TABLE telef;
  /*ALTER TABLE:
Por ejemplo, si queremos cambiar el nombre de la tabla:*/
ALTER TABLE ciudad6 RENAME granciudad;
/*Para eliminar una columna de una tabla:*/
ALTER TABLE granciudad DROP COLUMN poblacion;
/*Para eliminar la clave primaria de una columna:
*/
ALTER TABLE granciudad DROP PRIMARY KEY;///
/*Para insertar una nueva columna al final de una tabla:*/
 ALTER TABLE granciudad ADD fecha date;
/*Para añadir una nueva columna después de otra:
*/
ALTER TABLE granciudad ADD origen VARCHAR(50) AFTER nombre;
/*Para añadir una nueva columna en la primera posición de la tabla:*/
ALTER TABLE granciudad ADD id INT FIRST;
/*Asignar como clave primaria a una columna:*/
ALTER TABLE granciudad ADD PRIMARY KEY(id);///
/*También podemos reestructurar una columna:*/
ALTER TABLE granciudad MODIFY COLUMN id INT auto_increment;///
/*En este caso le hemos dotado a la columna id de la propiedad de autoincrementarse
automáticamente.(os valores de
columna se llenan con una secuencia numérica automáticamente. )*/
alter table granciudad auto_increment = 40;
/*O también con la opción SET INSERT_ID=value*/
set insert_ID=50;
/*La forma más directa de insertar una fila nueva en una tabla es mediante una sentencia INSERT.
En la forma más simple de esta sentencia debemos indicar la tabla a la que queremos añadir filas, y
los valores de cada columna.*/
INSERT INTO granciudad VALUES (1, 1, 'barcelona', 'barcino', '524-1-5');
/*Introducir más de una fila a la vez:*/
INSERT INTO granciudad VALUES
(1, 1, 'barcelona','barcino', '524-1-5'),
(2,2, 'madrid', 'madrilus', '1210-3-4');
/*También es posible especificar la lista de columnas/atributos donde deseamos ingresar ciertos
valores.*/
INSERT INTO granciudad (id, nombre) VALUES (4, "zaragoza");
/*Además existe una alternativa que consiste en indicar un valor para cada columna:*/
INSERT INTO granciudad SET
 id = 5,
nombre = "Bilbao";
/*Con la sentencia REPLACE podemos modificar un registro anterior. Realizamos un ejemplo, si
partimos de esta tabla:*/
REPLACE INTO granciudad (id, nombre, origen) VALUES
(4,'zaragoza','caesaraugusta');
/*INSTRUCCION PARA DESACTIVAR EL MODO SEGURO DE MYSQL*/
SET SQL_SAFE_UPDATES = 0;
/*Con la sentencia UPDATE podemos actualizar los valores de las filas. Los cambios se aplicarán a
las filas y columnas que especifiquemos.*/
UPDATE granciudad SET origen='ciudad_iberica';
/*podemos usar la cláusula WHERE para
establecer un filtro de columnas donde queremos que se realicen los cambios*/
UPDATE granciudad SET origen='caesaraugusta' WHERE nombre =
'Zaragoza';
/*Con la sentencia DELETE podemos eliminar filas de la tabla:*/
DELETE FROM ciudad3;
/*Si deseamos eliminar solo determinadas filas usamos la cláusula WHERE:
filas.*/
DELETE FROM granciudad WHERE id=6;
/*También podemos usar las cláusulas LIMIT y ORDER BY en la sentencia DELETE , por ejemplo,
para eliminar los últimos o primeros registros de una tabla.*/
DELETE FROM granciudad ORDER BY nombre ASC LIMIT 2;
/*Cuando queremos eliminar todas la filas de una tabla, vimos en el punto anterior que podíamos
usar una sentencia DELETE sin condiciones. Sin embargo, existe una sentencia alternativa,
TRUNCATE, que realiza la misma tarea de una forma mucho más rápida*/
TRUNCATE granciudad;
/*Si queremos mostrar todos los registros de una tabla usaremos SELECT * FROM y el nombre
de la tabla.*/
SELECT * from granciudad;
/*Podemos realizar una consulta donde se nos muestre solo las columnas que nos interesa. Para ello
usaremos SELECT más las columnas que queremos separadas por coma:*/
SELECT id, nombre FROM granciudad;
/*También podemos operar con los valores de una columna, por ejemplo si queremos que nos
devuelvan la población en miles pondríamos lo siguiente:*/
SELECT nombre, poblacion/1000000 FROM granciudad;
/*También podríamos mostrar la misma información pero cambiando el encabezado de la columna
afectada con el comando AS:*/
SELECT nombre, poblacion/1000000 AS poblacion_en_millones FROM
granciudad;
/*En una consulta podría haber registros repetidos, si quisiéramos evitar mostrar las filas repetidas
usaríamos el comando DISTINCT.*/
SELECT DISTINCT nombre, poblacion FROM granciudad;
/*Si queremos filtrar las filas que aparecen en la consulta podemos usar la sentencia WHERE, por
ejemplo, partiendo de la tabla siguiente, queremos mostrar solo las ciudades que tienen 2 o más
millones de población:*/
SELECT * from granciudad WHERE poblacion >= 2000000;
/*Incluso anidar 2 condiciones usando el comando AND:*/
SELECT * from granciudad WHERE poblacion >= 2000000 AND id > 10;
/*La cláusula LIMIT puede usarse con 2 parámetros. Cuando se usan ambos, el primero muestra
la fila a partir de la que debemos empezar a mostrar registros, y el segundo parámetro muestra
el número de filas a mostrar (contando desde la primera):*/
select * from lista limit 1,2;
/*Podríamos agrupar el resultado de la consulta con el comando GROUP BY de modo que nos
agrupara los registros de la tabla por ciudades:*/
SELECT ciudad FROM muestras GROUP BY ciudad;
/*Pero la diferencia principal es que el uso de la cláusula GROUP BY permite usar funciones de
resumen o reunión. Por ejemplo, la función COUNT(),que sirve para contar las filas de cada
grupo*/
SELECT ciudad, COUNT(*) AS cuenta FROM muestras GROUP BY ciudad;
/*La cláusula HAVING() permite hacer selecciones con GROUP BY en columnas calculadas
con funciones de grupo, como MAX(), MIN(),AVG(),COUNT()… Se podría entender como un
WHERE para usar junto a GROUP BY()*/
 SELECT ciudad, MAX(temperatura) FROM muestras
 GROUP BY ciudad HAVING MAX(temperatura)>16;
 /*En MySQL solo existe soporte para claves ajenas en tablas de tipo InnoDB. Es decir, si no
creamos la tabla como “InnoDB”, las claves ajenas solo figurarán como documentación
pero no se aplicarán.
Las claves ajenas en tablas tipo “InnoDB” se define la clave ajena después de definir todas
las columnas.*/
  CREATE TABLE muestras (
 ciudad VARCHAR(40),
  fecha DATE,
  temperatura TINYINT);
 INSERT INTO muestras (ciudad,fecha,temperatura) VALUES
 ('Madrid', '2005-03-17', 23),
 ('París', '2005-03-17', 16),
('Berlín', '2005-03-17', 15),
 ('Madrid', '2005-03-18', 25),
('Madrid', '2005-03-19', 24);
SELECT ciudad, MAX(temperatura) FROM muestras
GROUP BY ciudad HAVING MAX(temperatura)>16;

  /*Existen 2 formas de crear variables, con la sentencia SET o dentro de la sentencia SELECT.*/
   SET @ahora= CURRENT_TIMESTAMP(); 
   /*La otra posibilidad es declarar variables en una sentencia SELECT usando “:=”*/
   SELECT @variable:="Hola mundo"; 
   SELECT @variable_numerica:=155; 
   /*Los operadores lógicos se usan para realizar operaciones de álgebra booleana. A pesar que
en el álgebra solo existen 2 tipos de variables booleanas, verdadero y falso (TRUE y
FALSE),*/
SELECT TRUE;
SELECT TRUE, 1, FALSE, 0, NULL; 
 SELECT true XOR true OR TRUE and TRUE;
 SELECT true XOR (true OR TRUE and TRUE); 
 /*Con el operador = podemos comparar dos valores.*/
  SELECT * FROM lista; 
 SELECT * FROM lista WHERE fecha="2010-03-03"; 
  SELECT 4=3; 
 SELECT 4=4; 
 /*Con el operador <=> podemos comparar dos valores entendiendo NULL como un valor
más a comparar.*/
SELECT NULL <=> 19;
SELECT NULL = 19;
/*Se dispone de 2 operadores de desigualdad que son equivalentes: <> y != .
Se nos devolverá verdadero o falso en función de si ambos valores son o no desiguales.*/
SELECT 30 <> 29; 
SELECT 30 != 30; 
/*Operadores de compaparación de magnitudes*/
	SELECT "a" < "z"; 
     SELECT 30 >= 29;
     /*Para verificar el valor NULL usamos los operadores IS NULL o IS NOT NULL*/
    SELECT * FROM lista WHERE fecha IS NULL; 
    /*Para verificar si un valor esta dentro de un rango usamos el comando BETWEEN
Para ello debemos marcar el mínimo y máximo de la expresión*/
 SELECT 15 BETWEEN 10 AND 16;
 SELECT "2018-01-01" BETWEEN "2017-01-01" AND
"2019-01-01"; 
/*Con el operador COALESCE elegimos el primer valor NO NULO de una lista.
Ejemplo de uso:*/
 SELECT COALESCE (NULL, 23, "hola"); 
 /*Con los operadores GREATEST Y LEAST elegimos el mayor y menor valor de una
lista de valores*/
 SELECT GREATEST(1,2,5);
 SELECT LEAST("a", "b", "g");
 /*Con los operadores IN y NOT IN podemos saber si un elemento está o no dentro de
una lista. Se devuelve un valor booleano (verdadero/falso, 1/0).*/
SELECT "g" IN ("u", "o", "p"); 
select fecha from lista; 
SELECT "2010-03-03" IN (select fecha from lista);
SELECT 5 NOT IN (1, 2, 3, 4); 
/*Con el operador INTERVAL podemos hallar en que intervalo está un valor. Para ello
debemos escribir tanto el valor como los límites de cada intervalo,.*/
SELECT INTERVAL (55, 30, 40, 50, 60, 70);
/*MySQL dispone de operadores aritméticos para poder operar entre valores numéricos. El
resultado siempre es un valor numérico.*/
 set @a=10, @b=2; 
SELECT @a-@b, -@a, @a*@b, @a/@b, @a%@b;

/*tabla gugador*/
CREATE TABLE jugador (
    id INT PRIMARY KEY,
    nombre VARCHAR(50)
);
CREATE TABLE pichichi (
    id INT PRIMARY KEY,
    goles INT
);
INSERT INTO jugador (id, nombre) VALUES
(1, 'Ronaldo'),
(2, 'Messi'),
(3, 'Guedes'),
(4, 'Griezmann'),
(5, 'Suarez');
INSERT INTO pichichi (id, goles) VALUES
(1, 35),
(3, 20),
(5, 15);
/*Para realizar el producto cartesiano de 2 tablas usamos el comando JOIN que puede ser
sustituido en MySQL por la coma(,)*/
 select * from jugador;
  select * from pichichi;
  SELECT * FROM jugador JOIN pichichi;
   SELECT * FROM jugador JOIN pichichi ON (jugador.id =
pichichi.id);
 SELECT * FROM jugador NATURAL JOIN pichichi;
  insert into pichichi (id, goles) VALUES (11, 6);
   insert into pichichi (id, goles) VALUES (12, 3);
 select * from pichichi;
  select * from jugador;
  /*LEFT JOIN hace referencia a que la consulta se hará por cada una de los registros de la
primera tabla. Si un registro de la primera tabla no coincide con el campo común de
cualquier registro de la segunda tabla, se usará NULL para los campos que no puedan ser
rellenados*/
 SELECT * FROM jugador LEFT JOIN pichichi ON
(jugador.id=pichichi.id);
/*Lo mismo ocurre con RIGHT JOIN, solo que en vez de crear el resultado recorriendo
cada uno de los registros de la primera tabla, se usará con los registros de la segunda*/
SELECT * FROM jugador RIGHT JOIN pichichi ON
(jugador.id=pichichi.id);
/*Al igual que en las composiciones internas, con NATURAL JOIN nos podemos ahorrar la
necesidad de indicarle a MySQL qué campo en común tienen ambas tablas.*/
SELECT * FROM jugador NATURAL RIGHT JOIN pichichi;
 SELECT * FROM jugador NATURAL LEFT JOIN pichichi;
 /*tabla piezas*/
 CREATE TABLE piezas (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(50)
);
INSERT INTO piezas (codigo, nombre) VALUES
(1, 'poliet23'),
(2, 'alum35'),
(3, 'etile53');
CREATE TABLE proveedores (
    id INT PRIMARY KEY,
    nombre VARCHAR(50)
);
INSERT INTO proveedores (id, nombre) VALUES
(1001, 'sipem'),
(1002, 'alcupla'),
(1003, 'dragados'),
(1004, 'femeval');
CREATE TABLE suministra (
    codigoPieza INT,
    idProveedor INT,
    precio int);
    INSERT INTO suministra (codigoPieza, idProveedor, precio) VALUES
(1, 1001, 28),
(1, 1002, 30),
(1, 1003, 23),
(2, 1001, 20),
(2, 1002, 21),
(3, 1002, 44),
(3, 1004, 34);
 /*Una subconsulta es una consulta dentro de otra consulta (a esta segunda la llamamos la
principal). Se suelen colocar en la cláusula WHERE de la consulta principal, pero también
pueden añadirse en el SELECT o en el FROM.*/
 select * from piezas;
 select * from proveedores;
 select * from suministra;
 SELECT nombre FROM proveedores WHERE id IN (SELECT
idProveedor from suministra WHERE codigoPieza = 1);



 


