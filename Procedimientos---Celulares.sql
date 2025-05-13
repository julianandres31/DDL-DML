/*---1---*/

USE `celulares`;
DROP procedure IF EXISTS `datosp`;

DELIMITER $$
USE `celulares`$$
CREATE PROCEDURE datosp (
	in id int,
    in nombre varchar(100),
    in valor double,
    in fabricante int
)
BEGIN
	insert into productos (codigo,nombre,precio,codigo_fabricante)
    value (id,nombre,valor,fabricante);
END$$

DELIMITER ;
/*---2---*/

USE `celulares`;
DROP procedure IF EXISTS `datosf`;

DELIMITER $$
USE `celulares`$$
CREATE PROCEDURE datosf (
	in id int,
    in nombre varchar(100)
)
BEGIN
	insert into fabricante(codigo,nombre)
    value (id,nombre);
END$$

DELIMITER ;
