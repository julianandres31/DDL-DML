CALL datosf("Asus");
CALL datosf("Lenovo");
CALL datosf("Hewlett-Packard");
CALL datosf("Samsung");
CALL datosf("Seagate");
CALL datosf("Crucial");
CALL datosf("Gigabyte");
CALL datosf("Huawei");
CALL datosf("Xiaomi");

call datosp("Disco duro SATA3 1TB", 86.99, 5);
call datosp("Memoria RAM DDR4 8GB ", 120, 6);
call datosp("Disco SSD 1 TB ", 150.99, 4);
call datosp("GeForce GTX 1050Ti ", 185, 7);
call datosp("GeForce GTX 1080 Xtreme ", 755, 6);
call datosp("Monitor 24 LED Full HD B", 202, 1);
call datosp("Monitor 27 LED Full HD", 245.99, 1);
call datosp("Portátil Yoga 520", 559, 2);
call datosp("Portátil Ideapd 320 ", 444, 2);
call datosp("Impresora HP Deskjet 3720", 59.99, 3);
call datosp("Impresora HP Laserjet Pro M26nw", 180, 3);

select * from fabricante;
select * from producto;
/*---Consultas sobre una tabla---*/
/*---1---*/
select nombre from producto;
/*---2---*/
select nombre,precio from producto;
/*---3---*/
select codigo,nombre,precio,codigo_fabricante from producto;
/*---4---*/
/*Round es para redondear nomeros decimales*/
SELECT 
    codigo,
    nombre,
    precio AS "precio USD",
    ROUND(precio * 0.93, 2) AS "precio en EURO"
FROM producto;
/*---5---*/
SELECT 
    codigo,
    nombre as "nombre de producto",
    ROUND(precio * 0.93, 2) AS euros,  
    precio AS dólares
FROM producto;
/*---6---*/
/*Upper es para poner todos los caracteres en mayusculas*/
select 
	upper(nombre) as "Nombre en Mayuscula", 
	precio 
from producto;
/*---7---*/
/*Lower es para poner todos los caracteres en minusculas*/
select 
	lower(nombre) as "Nombre en Minusculas", 
	precio 
from producto;
/*---8---*/
/*Concat es para concatenar cosas*/
select 
	nombre,
    concat(
	upper(SUBSTRING(nombre, 1, 2)),
    lower(SUBSTRING(nombre, 3))) as "Nombre Modificado"
from fabricante;
/*---9---*/
select
	nombre,
    ROUND(precio) as "Precio Redondeado"
from producto;
/*---10---*/
/* truncate es para truncar el valor de un precio(Osea que no quite los decimales)*/
select
	nombre,
    truncate(precio, 0) as "Precio Truncado"
from producto;
/*---11---*/
select codigo_fabricante from producto;
/*---12---*/
/*DISTINCT es para eliminar valores repetidos*/
select DISTINCT(codigo_fabricante) from producto;
/*---13---*/
/* ORDER BY ordenar el conjunto de resultados en orden ascendente o descendente*/
select codigo_fabricante from producto ORDER by codigo_fabricante ASC;
/*---14---*/
select codigo_fabricante from producto ORDER by codigo_fabricante DESC;
/*---15---*/
select nombre, precio from producto
	ORDER by nombre asc, precio desc;
/*---16---*/
select * from producto limit 5;
/*---17---*/
select * from producto limit 3,3;
/*---18---*/
select nombre, precio from producto order by precio asc limit 1;
/*---19---*/
select nombre, precio from producto order by precio desc limit 1;
/*---20---*/
select nombre from producto 
where codigo_fabricante = 2;
/*---21---*/
SELECT 
    nombre as "nombre de producto",
    ROUND(precio * 0.93, 2) AS euros
FROM producto where precio <= 120;
/*---22---*/
SELECT 
    nombre as "nombre de producto",
    ROUND(precio * 0.93, 2) AS euros
FROM producto where precio >= 400;
/*---23---*/
SELECT 
    nombre as "nombre de producto",
    ROUND(precio * 0.93, 2) AS euros
FROM producto where precio > 400;
/*---24---*/
SELECT 
    nombre as "nombre de producto",
    ROUND(precio * 0.93, 2) AS euros
FROM producto where precio >= 80 and precio <= 300;
/*---25---*/
/*BETWEEN es para filtrar entre un rango especifico de valores*/
SELECT 
    nombre as "nombre de producto",
    ROUND(precio * 0.93, 2) AS euros
FROM producto where precio >= 80 and precio <= 300;
/*---26---*/
SELECT 
    nombre as "nombre de producto",
    ROUND(precio * 0.93, 2) AS euros,
    codigo_fabricante as "codigo fabricante"
FROM producto where precio >= 80 and codigo_fabricante = 6;
/*---27---*/
select 
	nombre as "nombre de producto",
    codigo_fabricante as "codigo fabricante"
from producto where codigo_fabricante = 1 or codigo_fabricante = 3 or codigo_fabricante = 5;
/*---28---*/
select
	nombre as "nombre de producto",
    codigo_fabricante as "codigo fabricante"
from producto where codigo_fabricante in (1,3,5); 
/*---29---*/
SELECT 
    nombre as "nombre de producto",
    ROUND(precio * 0.93, 2) AS euros,
    round(precio * 100,2) as centimos
FROM producto;
/*---30---*/
SELECT 
    nombre as "nombre de producto"
from fabricante where nombre like "S%";
/*---31---*/
SELECT 
    nombre as "nombre de producto"
from fabricante where nombre like "%e";
/*---32---*/
SELECT 
    nombre as "nombre de producto"
from fabricante where nombre like "%w%";
/*---33---*/
SELECT 
    nombre as "nombre de producto"
from fabricante where LENGTH(nombre) = 4;
/*---34---*/
SELECT 
    nombre as "nombre de producto"
from producto where nombre like "%Portátil%";
/*---35---*/
SELECT 
    nombre as "nombre de producto",
     ROUND(precio * 0.93, 2) AS euros
from producto where nombre like "%Monitor%" and precio < 215;
/*1.1.4 consultas multitabla (Composición interna)*/
/*---1---*/
select
p.nombre AS "nombre producto",
p.precio,
f.nombre AS "nombre fabricante"
from
Producto p
join
Fabricante f ON p.codigo_fabricante = f.codigo;
/*---2---*/
select p.nombre AS "nombre producto",
p.precio,
f.nombre AS "nombre fabricante"
from
Producto p
join
Fabricante f ON p.codigo_fabricante = f.codigo
order by
f.nombre ASC;
/*---3---*/
select
    p.codigo_fabricante as "codigo fabricante",
    p.nombre AS "nombre producto",
    f.codigo,
    f.nombre AS "nombre fabricante"
from
    Producto p
join
    Fabricante f ON p.codigo_fabricante = f.codigo;
/*---4---*/
select nombre, precio, codigo_fabricante
from producto
order by precio ASC;
/*--5--*/
select 
	p.nombre as Producto, 
	p.precio, 
	f.nombre as fabricante
from producto p
join fabricante f on p.codigo_fabricante = f.codigo order by p.precio desc;
/*---6---*/
select p.codigo_fabricante as "codigo fabricante",
p.nombre AS "nombre producto",
f.codigo,
f.nombre AS "nombre fabricante"
from
Producto p
join
Fabricante f ON p.codigo_fabricante = f.codigo
where
f.nombre = 'Lenovo';
/*---7---*/
select
p.nombre AS "nombre producto",
p.precio,
f.nombre AS "nombre fabricante"
from
Producto p
join
Fabricante f ON p.codigo_fabricante = f.codigo
where
p.precio > 200;
/*---8---*/
select
p.nombre AS "nombre producto",
f.nombre AS "nombre fabricante"
from
Producto p
join
Fabricante f ON p.codigo_fabricante = f.codigo
where
f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

/*---9---*/
select
p.nombre AS "nombre producto",
f.nombre AS "nombre fabricante"
from
Producto p
join
Fabricante f ON p.codigo_fabricante = f.codigo
where
f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

/*---10---*/
select
p.nombre as "nombre producto",
p.precio,
f.nombre as "nombre fabricante"
from
Producto p
join
Fabricante f on p.codigo_fabricante = f.codigo
where
f.nombre like '%e';

/*---11---*/
select
p.nombre as "nombre producto",
p.precio,
f.nombre as"nombre fabricante"
from
Producto p
join
Fabricante f on p.codigo_fabricante = f.codigo
where
f.nombre LIKE '%w%';

/*---12---*/
select p.nombre AS "nombre producto",
p.precio,
f.nombre AS "nombre fabricante"
from Producto p
join Fabricante f ON p.codigo = f.codigo
where p.precio >= 180
order by p.precio desc,
p.nombre asc;

/*---13---*/
select distinct f.codigo,
f.nombre AS "nombre fabricante"
from Fabricante f
join Producto p on f.codigo = p.codigo_fabricante;
/*1.1.5 Consultas multitabla(Composicion externa)*/
/*---1---*/
select f.codigo,
f.nombre as "nombre fabricante",
p.codigo_fabricante,
p.nombre as "nombre producto"
from Fabricante f
left join
Producto p on f.codigo = p.codigo_fabricante;
select f.codigo,
f.nombre as "nombre fabricante",
p.codigo_fabricante as "codigo fabricante",
p.nombre as "nombre producto"
from Producto p
right join
Fabricante f on p.codigo_fabricante = f.codigo;
/*---2---*/
select f.codigo,
f.nombre as "nombre fabricante"
from Fabricante f
left join Producto p on f.codigo = p.codigo_fabricante
where
p.codigo_fabricante is null;
select
f.codigo,
f.nombre AS "nombre fabricante"
from
Producto p
right join Fabricante f ON p.codigo_fabricante = f.codigo
where p.codigo_fabricante IS NULL;
/*---3---*/
/*Si se puede, por que uno podria añadir lo que quiera en ese tabla pero para continuar con el mismo esquema la tabla quedaria incompleta y la db tambien*/

/*1.1.6 Consultas resumen */

/*---1---*/
SELECT COUNT(*) AS total_productos FROM producto;
/*---2---*/
SELECT COUNT(*) AS total_fabricantes FROM fabricante;
/*---3---*/
SELECT COUNT(DISTINCT codigo_fabricante) AS fabricantes_en_productos FROM producto;
/*---4---*/
SELECT AVG(precio) AS precio_medio FROM producto;
/*---5---*/
SELECT MIN(precio) AS precio_minimo FROM producto;
/*---6---*/
SELECT MAX(precio) AS precio_maximo FROM producto;
/*---7---*/
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
/*---8---*/
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
/*---9---*/
SELECT SUM(precio) AS suma_precios FROM producto;
/*---10---*/
SELECT 
COUNT(*) AS productos_asus 
FROM producto 
WHERE codigo_fabricante = (
	SELECT codigo 
    FROM fabricante 
    WHERE nombre = 'Asus'
);
/*---11---*/
SELECT 
AVG(precio) AS media_precio_asus 
FROM producto 
WHERE codigo_fabricante = (
	SELECT codigo 
	FROM fabricante 
	WHERE nombre = 'Asus'
);
/*---12---*/
SELECT 
MIN(precio) AS precio_min_asus 
FROM producto 
WHERE codigo_fabricante = (
	SELECT codigo 
	FROM fabricante 
	WHERE nombre = 'Asus'
);
/*---13---*/
SELECT 
MAX(precio) AS precio_max_asus 
FROM producto 
WHERE codigo_fabricante = (
	SELECT codigo 
    FROM fabricante 
    WHERE nombre = 'Asus'
);
/*---14---*/
SELECT 
SUM(precio) AS suma_precios_asus 
FROM producto
WHERE codigo_fabricante = (
	SELECT codigo 
	FROM fabricante 
	WHERE nombre = 'Asus'
);
/*---15---*/
SELECT 
MAX(precio) AS precio_max, 
MIN(precio) AS precio_min, 
AVG(precio) AS precio_medio, 
COUNT(*) AS total_productos 
FROM producto 
WHERE codigo_fabricante = (
	SELECT codigo 
    FROM fabricante
    WHERE nombre = 'Crucial'
);
/*---16---*/
SELECT f.nombre "nombre del fabricante", 
COUNT(p.codigo) AS total_productos
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo
ORDER BY total_productos DESC;



-- 26. Fabricantes y número de productos con precio >= 220
SELECT f.nombre, COUNT(p.codigo) AS productos_220_o_mas
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.precio >= 220
GROUP BY f.codigo;
/*---17---*/
SELECT f.nombre, MAX(p.precio) AS maximo, 
MIN(p.precio) AS minimo, 
AVG(p.precio) AS media
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo;
/*---18---*/
SELECT codigo_fabricante, 
MAX(precio) AS maximo, 
MIN(precio) AS minimo, 
AVG(precio) AS media, 
COUNT(*) AS total
FROM producto
GROUP BY codigo_fabricante
HAVING AVG(precio) > 200;
/*---19---*/
SELECT 
f.nombre, 
MAX(p.precio) AS maximo, 
MIN(p.precio) AS minimo, 
AVG(p.precio) AS media, 
COUNT(*) AS total
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo
HAVING AVG(p.precio) > 200;
/*---20---*/
SELECT 
COUNT(*) AS total_180_o_mas 
FROM producto 
WHERE precio >= 180;
/*---21---*/
SELECT 
f.nombre, 
COUNT(p.codigo) AS "productos 180 o mas"
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.precio >= 180
GROUP BY f.codigo;
/*---22---*/
SELECT codigo_fabricante as "codigo fabricante" , 
AVG(precio) AS "precio medio"
FROM producto
GROUP BY codigo_fabricante;
/*---23---*/
SELECT 
f.nombre, 
AVG(p.precio) AS "precio medio"
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo;
/*---24---*/
SELECT 
f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo
HAVING AVG(p.precio) >= 150;
/*---25---*/
SELECT 
f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo
HAVING COUNT(p.codigo) >= 2;
/*---26---*/
SELECT 
f.nombre,
COUNT(p.codigo) AS total
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.precio >= 220
GROUP BY f.codigo;
/*---27---*/
SELECT 
f.nombre, 
COUNT(p.codigo) AS total
FROM fabricante f
LEFT JOIN producto p 
  ON f.codigo = p.codigo_fabricante AND p.precio >= 220
GROUP BY f.codigo;
/*---28---*/
SELECT f.nombre, 
SUM(p.precio) AS suma_precios
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo
HAVING SUM(p.precio) > 1000;
/*---29---*/
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE p.precio = (
  SELECT MAX(p2.precio)
  FROM producto p2
  WHERE p2.codigo_fabricante = p.codigo_fabricante
)
ORDER BY f.nombre ASC;
/*1.1.7.1 Con operadores básicos de comparación */
/*---1---*/
select 
	nombre as "productos del fabricante",
    codigo_fabricante as "codigo fabricante"
from producto where codigo_fabricante = 2;
/*---2---*/
select * from producto where precio = 559;
/*---3---*/
SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2;
/*---4---*/
SELECT MIN(precio) FROM producto WHERE codigo_fabricante = 3;
/*---5---*/
select * from producto where precio >= 559;
/*---6---*/
SELECT avg(precio) FROM producto WHERE codigo_fabricante = 1;

/*1.1.7.2 Subconsultas con ALL y ANY */
/*---7---*/
SELECT *
FROM producto
WHERE precio >= ALL (
    SELECT precio
    FROM producto
);
/*---8---*/
SELECT * FROM producto
WHERE precio <= ALL (
    SELECT precio
    FROM producto
);
/*---9---*/
SELECT nombre,
codigo
FROM fabricante
WHERE codigo = ANY (
    SELECT codigo_fabricante
    FROM producto
);
/*---10---*/
SELECT nombre,
codigo
FROM fabricante
WHERE codigo <> All (
    SELECT codigo_fabricante
    FROM producto
);
/*1.1.7.3 Subconsultas con IN y NOT IN*/
/*---11---*/
SELECT nombre
FROM fabricante
WHERE codigo IN (
    SELECT codigo_fabricante
    FROM producto
);
/*---12---*/
SELECT nombre
FROM fabricante
WHERE codigo not IN (
    SELECT codigo_fabricante
    FROM producto
);
/*1.1.7.4 Subconsultas con EXISTS y NOT EXISTS */
/*---13---*/
SELECT nombre
FROM fabricante f
WHERE EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.codigo_fabricante = f.codigo
);
/*---14---*/
SELECT nombre
FROM fabricante f
WHERE not EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.codigo_fabricante = f.codigo
);
/*1.1.7.5 Subconsultas correlacionadas*/ 
/*---15---*/
SELECT f.nombre AS fabricante,
       p.nombre AS producto,
       p.precio
FROM fabricante f
JOIN producto p ON p.codigo_fabricante = f.codigo
WHERE p.precio = (
    SELECT MAX(p2.precio)
    FROM producto p2
    WHERE p2.codigo_fabricante = f.codigo
);
/*---16---*/
SELECT *
FROM producto p1
WHERE p1.precio >= (
    SELECT AVG(p2.precio)
    FROM producto p2
    WHERE p2.codigo = p1.codigo
);
/*---17---*/
SELECT nombre, precio
FROM producto
WHERE codigo_fabricante = (
    SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'
)
AND precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'
    )
);
/*1.1.8 Subconsultas (En la cláusula HAVING)*/
/*---18---*/
SELECT f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo
HAVING COUNT(p.codigo) = (
    SELECT COUNT(*)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'
    )
);
