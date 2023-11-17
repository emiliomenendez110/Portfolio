SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$
CREATE FUNCTION `f_aleatorio` (min INT, max INT)
RETURNS INTEGER
BEGIN
DECLARE vresultado INT;
SELECT FLOOR(RAND()*(max-min+1)+min) INTO vresultado;
RETURN vresultado;
END $$ ;

DELIMITER $$
CREATE FUNCTION `f_cliente_aleatorio` ()
RETURNS VARCHAR(11)
BEGIN
DECLARE vresultado VARCHAR(11);
DECLARE vmax INT;
DECLARE valeatorio INT;
SELECT COUNT(*) INTO vmax FROM clientes;
SET valeatorio = f_aleatorio(1, vmax);
SET valeatorio = valeatorio - 1;
SELECT dni INTO vresultado FROM clientes LIMIT valeatorio, 1 ;
RETURN vresultado;
END $$ ;

DELIMITER $$
CREATE FUNCTION `f_producto_aleatorio`() RETURNS varchar(10) CHARSET utf8mb4
BEGIN
DECLARE vresultado VARCHAR(10);
DECLARE vmax INT;
DECLARE valeatorio INT;
SELECT COUNT(*) INTO vmax FROM productos;
SET valeatorio = f_aleatorio(1,vmax);
SET valeatorio = valeatorio-1;
SELECT CODIGO INTO vresultado FROM productos LIMIT valeatorio,1;
RETURN vresultado;
END$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION `f_vendedor_aleatorio`() RETURNS varchar(5) CHARSET utf8mb4
BEGIN
DECLARE vresultado VARCHAR(5);
DECLARE vmax INT;
DECLARE valeatorio INT;
SELECT COUNT(*) INTO vmax FROM vendedores;
SET valeatorio = f_aleatorio(1,vmax);
SET valeatorio = valeatorio-1;
SELECT MATRICULA INTO vresultado FROM vendedores LIMIT valeatorio,1;
RETURN vresultado;
END$$

DELIMITER ;

SELECT f_cliente_aleatorio() AS cliente,
f_producto_aleatorio() AS cliente,
f_vendedor_aleatorio() AS cliente;