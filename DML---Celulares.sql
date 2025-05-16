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