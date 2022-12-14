DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
CREATE TABLE fabricante (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);
CREATE TABLE producto (
codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
codigo_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);



-- Consultas --
#1. Lista el nombre de todos los productos que hay en la tabla producto.


SELECT nombre FROM producto;

#2. Lista los nombres y los precios de todos los productos de la tabla producto.

SELECT nombre, precio FROM producto;

#3. Lista todas las columnas de la tabla producto.

SELECT * FROM producto;

#4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).

SELECT nombre, precio, (precio * 1.06) FROM producto;

#5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.

SELECT nombre AS n, precio AS p, (precio * 1.06) AS pe FROM producto;

#6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

SELECT UPPER(nombre), precio FROM producto;

#7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

SELECT LOWER(nombre), precio FROM producto;

# 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.

SELECT nombre, UPPER(SUBSTRING(nombre,1,2)) FROM fabricante;

#9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.

SELECT nombre, ROUND(precio,2) FROM producto;

#10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.

SELECT nombre, TRUNCATE(precio,0) FROM producto;

#11. Lista el código de los fabricantes que tienen productos en la tabla producto.

SELECT codigo_fabricante AS cf FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo;

#12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.

SELECT codigo_fabricante AS cf FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo GROUP BY p.codigo_fabricante;

#13. Lista los nombres de los fabricantes ordenados de forma ascendente.

SELECT nombre FROM fabricante ORDER BY nombre ASC;

#14. Lista los nombres de los fabricantes ordenados de forma descendente.

SELECT nombre FROM fabricante ORDER BY nombre DESC;

#15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.

SELECT nombre, precio FROM producto ORDER BY nombre ASC, nombre DESC;

#16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.

SELECT * FROM fabricante LIMIT 5;

#17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.

SELECT * FROM fabricante LIMIT 3,2;

#18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

#19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

#20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.

SELECT nombre FROM producto p WHERE p.codigo_fabricante = 2;

#21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.

SELECT nombre FROM producto p WHERE p.precio <= 120;

#22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.

SELECT nombre FROM producto p WHERE p.precio >= 400;

#23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.

SELECT nombre FROM producto p WHERE NOT p.precio >= 400;

#24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

SELECT * FROM producto p WHERE p.precio >= 80 AND p.precio <= 300;

#25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.

SELECT * FROM producto p WHERE p.precio BETWEEN 60 AND 200;

#26. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.

SELECT * FROM producto p WHERE p.precio > 200 AND p.codigo_fabricante = 6;

#27. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.

SELECT * FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

#28. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.

SELECT * FROM producto WHERE codigo_fabricante IN (1,3,5);

#29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.

SELECT nombre, (precio * 100) AS centimos FROM producto;

#30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.

SELECT * FROM fabricante WHERE nombre LIKE "S%";

#31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.

SELECT * FROM fabricante WHERE nombre LIKE "%e";

#32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.

SELECT * FROM fabricante WHERE nombre LIKE "%w%";

#33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;

#34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

SELECT nombre FROM producto WHERE nombre LIKE "%Portátil%";

#35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.

SELECT nombre FROM producto WHERE nombre LIKE "%Monitor%" AND precio < 215;

#36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).

SELECT nombre, precio FROM producto WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;

-- Consultas multitabla (Composición interna)

#1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

#2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

SELECT p.nombre, p.precio , f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;

#3. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.

SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

#4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

SELECT p.nombre, p.precio , f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;

#5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

SELECT p.nombre, p.precio , f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;

#6. Devuelve una lista de todos los productos del fabricante Lenovo.

SELECT p.* FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo AND f.nombre LIKE "Lenovo";

#7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

SELECT p.* FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo AND f.nombre LIKE "Crucial" AND p.precio > 200;

#8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.

SELECT p.* FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Asus" OR  f.nombre = "Hewlett-Packard" OR f.nombre = "Seagate";

#9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.

SELECT p.* FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo AND f.nombre IN("Asus","Hewlett-Packard","Seagate");

#10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

SELECT p.nombre, p.precio , f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo AND f.nombre LIKE "%e";

#11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre defabricante contenga el carácter w en su nombre.

SELECT p.nombre, p.precio , f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo AND f.nombre LIKE "%w%";

#12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

SELECT p.nombre, p.precio , f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo AND p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;

#13. Devuelve un listado con el código y el nombre defabricante, solamente de aquellosfabricantes que tienen productos asociados en la base de datos.

SELECT distinct p.nombre, p.precio , f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- Consultas multitabla (Composición externa)
#Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

/*1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que
tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos
asociados.*/


SELECT f.*, p.* FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;


#2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

SELECT f.* FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo IS NULL;

#3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.

/* En una bbdd si puede esxistir pero si contamos con la realidad no puede existir algo que nadie haya fabricado por lo que para que exista el fabricante debe crear dicho producto */

-- Consultas resumen
#1. Calcula el número total de productos que hay en la tabla productos.

 SELECT COUNT(*) FROM producto;

#2. Calcula el número total de fabricantes que hay en la tabla fabricante.

SELECT COUNT(*) FROM fabricante;

#3. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.

SELECT COUNT(DISTINCT codigo_fabricante) FROM producto;

#4. Calcula la media del precio de todos los productos.

SELECT AVG(precio) FROM producto;

#5. Calcula el precio más barato de todos los productos.

SELECT MIN(precio) FROM producto;

#6. Calcula el precio más caro de todos los productos.

SELECT MAX(precio) FROM producto;

#7. Lista el nombre y el precio del producto más barato.

SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

#8. Lista el nombre y el precio del producto más caro.

SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

#9. Calcula la suma de los precios de todos los productos.

SELECT SUM(precio) FROM producto;

#10. Calcula el número de productos que tiene el fabricante Asus.

SELECT COUNT(precio) FROM producto p , fabricante f WHERE f.nombre LIKE "Asus";

#11. Calcula la media del precio de todos los productos del fabricante Asus.

SELECT AVG(p.precio) FROM producto p , fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre = "Asus";

#12. Calcula el precio más barato de todos los productos del fabricante Asus.

SELECT p.precio FROM producto p , fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre LIKE "Asus" ORDER BY p.precio ASC LIMIT 1;

#13. Calcula el precio más caro de todos los productos del fabricante Asus.

SELECT p.precio FROM producto p , fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre LIKE "Asus" ORDER BY p.precio DESC LIMIT 1;

#14. Calcula la suma de todos los productos del fabricante Asus.

SELECT SUM(p.precio) FROM producto p , fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre LIKE "Asus";

#15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.

SELECT MAX(p.precio), MIN(p.precio), AVG(p.precio), COUNT(*) FROM producto p , fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre LIKE "Crucial";

/*16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe
incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el
nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.*/

SELECT 

#17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
#18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
#19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el  número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
#20. Calcula el número de productos que tienen un precio mayor o igual a 180€.
#21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
#22. Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
#23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
#24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
#25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
#26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con
un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen
productos que cumplan la condición.
#27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con
un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si
hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el
listado con un valor igual a 0 en el número de productos.
#28. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos
es superior a 1000 €.
#29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe
tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar
ordenado alfabéticamente de menor a mayor por el nombre del fabricante.

# Modificaciones
/*1. Inserta un nuevo fabricante indicando su código y su nombre.
2. Inserta un nuevo fabricante indicando solamente su nombre.
3. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción debe
incluir: código, nombre, precio y código_fabricante.
4. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción debe
incluir: nombre, precio y código_fabricante.
5. Crea una nueva tabla con el nombre fabricante_productos que tenga las siguientes columnas:
nombre_fabricante, nombre_producto y precio. Una vez creada la tabla inserta todos los registros
de la base de datos tienda en esta tabla haciendo uso de única operación de inserción.
6. Crea una vista con el nombre vista_fabricante_productosque tenga las siguientes columnas:
nombre_fabricante, nombre_producto y precio.
7. Elimina el fabricante Asus. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para
que fuese posible borrarlo?
8. Elimina el fabricante Xiaomi. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar
para que fuese posible borrarlo?
9. Actualiza el código del fabricante Lenovo y asígnale el valor 20. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
10. Actualiza el código del fabricante Huawei y asígnale el valor 30. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
11. Actualiza el precio de todos los productos sumándole 5 € al precio actual.
12. Elimina todas las impresoras que tienen un precio menor de 200 €.*/


-- Subconsultas (En la cláusula WHERE)
#Con operadores básicos de comparación
/*1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
3. Lista el nombre del producto más caro del fabricante Lenovo.
4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más
caro del fabricante Lenovo.
6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus
productos.

#Subconsultas (En la cláusula HAVING)
7. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.

# Subconsultas con ALL y ANY
8. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
9. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni
LIMIT.
10. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
11. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).

#Subconsultas con IN y NOT IN
12. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
13. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).

#Subconsultas con EXISTS y NOT EXISTS
14. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
15. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

#Subconsultas correlacionadas
16. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
17. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
18. Lista el nombre del producto más caro del fabricante Lenovo.*/

-- Índices --
/*1. ¿Qué índices deberíamos de crear para estas tablas? ¿Por qué? Créalos.*/
