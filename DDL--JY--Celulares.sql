create database celulares;
use celulares;

create table producto(
	codigo int primary key auto_increment,
    nombre varchar(100),
    precio double,
    codigo_fabricante int 
);

create table fabricante(
	codigo int primary key auto_increment,
    nombre varchar(100)
);

alter table producto
add foreign key (codigo_fabricante) references fabricante(codigo);