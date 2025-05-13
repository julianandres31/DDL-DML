/*---1---*/

USE `celulares`;
DROP procedure IF EXISTS `datosf`;

DELIMITER $$
USE `celulares`$$
CREATE PROCEDURE datosf (
    in nombre varchar(100)
)
BEGIN
	insert into fabricante(nombre)
    value (nombre);
END$$

DELIMITER ;


/*---2---*/

USE `celulares`;
DROP procedure IF EXISTS `datosp`;

DELIMITER $$
USE `celulares`$$
CREATE PROCEDURE datosp (
    in nombre varchar(100),
    in valor double,
    in fabricante int
)
BEGIN
	insert into producto (nombre,precio,codigo_fabricante)
    value (nombre,valor,fabricante);
END$$

DELIMITER ;

