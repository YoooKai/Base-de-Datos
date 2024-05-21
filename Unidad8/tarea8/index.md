-- Creación de la base de datos y la tabla
CREATE DATABASE test;
USE test;

DROP TABLE IF EXISTS alumnos;
CREATE TABLE alumnos(
    id INT PRIMARY KEY,
    nombre VARCHAR(30),
    apellido1 VARCHAR(30),
    apellido2 VARCHAR(30),
    nota DECIMAL(4, 1)
);

-- Creación de los triggers
DELIMITER //
CREATE TRIGGER trigger_check_nota_before_insert
BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER trigger_check_nota_before_update
BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.nota < 0 THEN
        SET NEW.nota = 0;
    ELSEIF NEW.nota > 10 THEN
        SET NEW.nota = 10;
    END IF;
END//
DELIMITER ;

-- Procedimiento para insertar alumnos con notas entre 3 y 10
DELIMITER //

DROP PROCEDURE IF EXISTS insertar_alumnos_10;
CREATE PROCEDURE insertar_alumnos_10(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_id INT;
    DECLARE random_nombre VARCHAR(30);
    DECLARE random_apellido1 VARCHAR(30);
    DECLARE random_apellido2 VARCHAR(30);
    DECLARE random_nota DECIMAL(4, 1);

    WHILE counter < iterations DO
        SET random_id = FLOOR(RAND() * 10000) + counter;
        SET random_nombre = CONCAT('Nombre', counter);
        SET random_apellido1 = CONCAT('Apellido1', counter);
        SET random_apellido2 = CONCAT('Apellido2', counter);
        SET random_nota = ROUND(RAND() * (10 - 3) + 3, 1);
        
        INSERT INTO alumnos (id, nombre, apellido1, apellido2, nota) 
        VALUES (random_id, random_nombre, random_apellido1, random_apellido2, random_nota);
        
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

CALL insertar_alumnos_10(10);


mysql> select * from alumnos;
+-------+---------+------------+------------+------+
|   id  | nombre  | apellido1  | apellido2  | nota |
+-------+---------+------------+------------+------+
|  1234 | Nombre0 | Apellido10 | Apellido20 |  6.2 |
|  2123 | Nombre1 | Apellido11 | Apellido21 |  7.2 |
|  3762 | Nombre2 | Apellido12 | Apellido22 |  7.4 |
|  4935 | Nombre3 | Apellido13 | Apellido23 |  5.6 |
|  5245 | Nombre4 | Apellido14 | Apellido24 |  9.6 |
|  6136 | Nombre5 | Apellido15 | Apellido25 |  7.2 |
|  7741 | Nombre6 | Apellido16 | Apellido26 |  4.2 |
|  8167 | Nombre7 | Apellido17 | Apellido27 |  3.6 |
|  9223 | Nombre8 | Apellido18 | Apellido28 |  9.4 |
|  1098 | Nombre9 | Apellido19 | Apellido29 |  5.1 |
+-------+---------+------------+------------+------+
10 rows in set (0,00 sec)


-- Procedimiento para insertar alumnos con notas entre -10 y 12
DELIMITER //

DROP PROCEDURE IF EXISTS insertar_alumnos_12;
CREATE PROCEDURE insertar_alumnos_12(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_id INT;
    DECLARE random_nombre VARCHAR(30);
    DECLARE random_apellido1 VARCHAR(30);
    DECLARE random_apellido2 VARCHAR(30);
    DECLARE random_nota DECIMAL(4, 1);

    WHILE counter < iterations DO
        SET random_id = FLOOR(RAND() * 10000) + counter;
        SET random_nombre = CONCAT('Nombre', counter);
        SET random_apellido1 = CONCAT('Apellido1', counter);
        SET random_apellido2 = CONCAT('Apellido2', counter);
        SET random_nota = ROUND((RAND() * (12 - (-10)) + (-10)), 1);
        
        INSERT INTO alumnos (id, nombre, apellido1, apellido2, nota) 
        VALUES (random_id, random_nombre, random_apellido1, random_apellido2, random_nota);
        
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

CALL insertar_alumnos_12(10);

mysql> select * from alumnos;
+------+---------+------------+------------+------+
|   id | nombre  | apellido1  | apellido2  | nota |
+------+---------+------------+------------+------+
| 1234 | Nombre0 | Apellido10 | Apellido20 |  6.2 |
| 2123 | Nombre1 | Apellido11 | Apellido21 |  7.2 |
| 3762 | Nombre2 | Apellido12 | Apellido22 |  7.4 |
| 4935 | Nombre3 | Apellido13 | Apellido23 |  5.6 |
| 5245 | Nombre4 | Apellido14 | Apellido24 |  9.6 |
| 6136 | Nombre5 | Apellido15 | Apellido25 |  7.2 |
| 7741 | Nombre6 | Apellido16 | Apellido26 |  4.2 |
| 8167 | Nombre7 | Apellido17 | Apellido27 |  3.6 |
| 9223 | Nombre8 | Apellido18 | Apellido28 |  9.4 |
| 1098 | Nombre9 | Apellido19 | Apellido29 |  5.1 |
| 2463 | Nombre1 | Apellido11 | Apellido21 |  0.0 |
| 3112 | Nombre7 | Apellido17 | Apellido27 |  0.0 |
| 4534 | Nombre3 | Apellido13 | Apellido23 |  0.0 |
| 5049 | Nombre5 | Apellido15 | Apellido25 |  8.0 |
| 5574 | Nombre4 | Apellido14 | Apellido24 |  0.0 |
| 5617 | Nombre2 | Apellido12 | Apellido22 |  0.0 |
| 5716 | Nombre6 | Apellido16 | Apellido26 |  0.0 |
| 6583 | Nombre9 | Apellido19 | Apellido29 | 10.0 |
| 7614 | Nombre8 | Apellido18 | Apellido28 |  7.3 |
| 7907 | Nombre0 | Apellido10 | Apellido20 |  0.0 |
+------+---------+------------+------------+------+
20 rows in set (0,00 sec)
