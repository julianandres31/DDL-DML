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
/*---22---*/
/*---23---*/
/*---24---*/
/*---25---*/
/*---26---*/
/*---27---*/
/*---28---*/
