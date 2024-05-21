

# Trabajo con la BBDD Alumnos

Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:

- Tabla alumnos:
  - id (entero sin signo)
  - nombre (cadena de caracteres)
  - apellido1 (cadena de caracteres)
  - apellido2 (cadena de caracteres)
  - nota (número real)

```sql
Create database test;
use test

DROP table if exists alumnos;
Create table alumnos(
    id int primary key,
    nombre VARCHAR(30),
    apellido1 VARCHAR(30),
    apellido2 VARCHAR(30),
    nota decimal(10,2)
)
```


Crea los siguientes __triggers__:
- Trigger1:_trigger_check_nota_before_insert_.
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta antes de una operación de inserción.
  - Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0.
  - Si el nuevo valor de la nota que se quiere insertar es mayor que 10, se guarda como 10.

```sql
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

```
- __Trigger2__ : _trigger_check_nota_before_update_.
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta antes de una operación de actualización.
  - Si el nuevo valor de la nota que se quiere actualizar es negativo, se guarda como 0.
  - Si el nuevo valor de la nota que se quiere actualizar es mayor que 10, se guarda como 10.
```SQL
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

```
Una vez creados los triggers escriba varias sentencias de inserción y actualización sobre la tabla alumnos y verifica que los triggers se están ejecutando correctamente.

Crea el siguiente procedimiento:
- __Procedimiento1__:
  - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre 3, y 10.
  
Realiza los procedimientos y verifica el comportamiento llamando a este con los parámetros adecuados.


```sql
DELIMITER //

DROP PROCEDURE IF EXISTS insertar_alumnos_10;
CREATE PROCEDURE insertar_alumnos_10(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_nombre VARCHAR(30);
    DECLARE random_apellido1 VARCHAR(30);
    DECLARE random_apellido2 VARCHAR(30);
    DECLARE random_nota DECIMAL(10,2);

    WHILE counter < iterations DO
        SET random_nombre = CONCAT('Nombre', counter);
        SET random_apellido1 = CONCAT('Apellido1', counter);
        SET random_apellido2 = CONCAT('Apellido2', counter);
        SET random_nota = ROUND(RAND() * (10 - 3) + 3);
        
        INSERT INTO alumnos (nombre, apellido1, apellido2, nota) 
        VALUES (random_nombre, random_apellido1, random_apellido2, random_nota);
        
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;


call insertar_alumnos_10(10);
```

- Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre -10, y 12.

````sql
DELIMITER //

DROP PROCEDURE IF EXISTS insertar_alumnos_12;
CREATE PROCEDURE insertar_alumnos_12(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_nombre VARCHAR(30);
    DECLARE random_apellido1 VARCHAR(30);
    DECLARE random_apellido2 VARCHAR(30);
    DECLARE random_nota DECIMAL(10,2);

    WHILE counter < iterations DO
        SET random_nombre = CONCAT('Nombre', counter);
        SET random_apellido1 = CONCAT('Apellido1', counter);
        SET random_apellido2 = CONCAT('Apellido2', counter);
        SET random_nota = ROUND((RAND() * (12 - -10) + -10), 2);
        
        INSERT INTO alumnos (nombre, apellido1, apellido2, nota) 
        VALUES (random_nombre, random_apellido1, random_apellido2, random_nota);
        
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;


```

