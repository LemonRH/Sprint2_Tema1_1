SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.06 AS precio_usd FROM producto;
SELECT nombre AS "producto", precio AS euros, precio * 1.06 AS "dolares estadounidenses" FROM producto;
SELECT UPPER(nombre) AS nombre, precio FROM producto;
SELECT LOWER(nombre) AS nombre, precio FROM producto;
SELECT nombre, UPPER(LEFT (nombre, 2)) AS dos_primeros_caracteres FROM fabricante;
SELECT nombre, ROUND(precio) AS precio FROM producto;
SELECT nombre, TRUNCATE(precio, 0) AS precio FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
/*TERMINAR EJERCICIO 12*/
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3, 2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT p.nombre AS "Nombre del producto", p.precio AS "Precio", f.nombre AS "Nombre del fabricante" FROM producto AS p INNER JOIN fabricante AS f ON p.codigo_fabricante = f.codigo; 
SELECT p.nombre AS	"Nombre del producto", p.precio AS "Precio", f.nombre AS "Nombre del fabricante" FROM producto AS p INNER JOIN fabricante AS f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre;
SELECT p.codigo AS "Código del Producto", p.nombre AS "Nombre del Producto", p.codigo_fabricante AS "Código del Fabricante", f.nombre AS "Nombre del Fabricante" FROM producto AS p INNER JOIN fabricante AS f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p INNER JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MIN(precio) FROM producto);
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p INNER JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.precio = (SELECT MAX(precio) FROM producto);
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
SELECT nombre FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Crucial') AND precio > 200;
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p INNER JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p INNER JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del fabricante" FROM producto AS p INNER JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';
SELECT p.nombre AS "Nombre del Producto", p.precio AS "Precio", f.nombre AS "Nombre del Fabricante" FROM producto AS p INNER JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%'; /*A partir de aqui dejo de renombrar las columnas para que sea mas legible las consultas*/
SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE precio >= 180 ORDER BY precio DESC, producto.nombre ASC;
SELECT fabricante.codigo, fabricante.nombre FROM fabricante WHERE fabricante.codigo IN (SELECT DISTINCT codigo_fabricante FROM producto);
SELECT fabricante.codigo, fabricante.nombre, COUNT(producto.codigo) AS "Número de productos" FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante GROUP BY fabricante.codigo, fabricante.nombre; /*Este no entiendo si pide el numero de productos de cada fabricante o mostrar todos los productos de cada fabricante con su nombre*/
SELECT fabricante.codigo, fabricante.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo_fabricante IS NULL;/*Is null para encontrar los fabricantes con productos en vacio*/
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Lenovo';
SELECT producto.* FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo AND producto.precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT producto.nombre FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Lenovo' AND producto.precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));/*sin inner join*/
SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Hewlett-Packard' ORDER BY precio ASC LIMIT 1; /*Con inner join pero sin usar MAX/MIN si no con orden ascendente y limitando solo a mostrar 1 fila*/
SELECT producto.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE precio >= (SELECT MAX (precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' AND producto.precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));


