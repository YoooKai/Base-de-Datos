<div align="justify">

# Trabajo con procedimientos de generación de información

Dado el procedimiento base:

```sql
DELIMITER //

CREATE PROCEDURE my_loop(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

-- Llama al procedimiento 
CALL my_loop(5);
```

Y las funciones descritas en [aleatoriedad](../../aleatoriedad.md), realiza los siguientes procedimientos, que realicen las siguietes operaciones:

  1. Inserta cinco filas en la tabla empleados con nombres aleatorios generados usando la función CONCAT() junto con RAND().

      ```sql
        INSERT INTO empleados (nombre, salario)
        VALUES (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
              (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
              (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
              (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
              (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
      ```
```sql

DELIMITER //
DROP PROCEDURE IF EXISTS r1;

CREATE PROCEDURE r1(IN iterations INT, IN prefix VARCHAR(10), IN base_salary INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_user VARCHAR(100);
    DECLARE random_salary DECIMAL(10, 2);

    WHILE counter < iterations DO
        SET random_user = CONCAT(prefix, RAND());
        SET random_salary = FLOOR(RAND() * (10000 - base_salary + 1)) + base_salary;
        INSERT INTO empleados (nombre, salario) VALUES (random_user, random_salary);
        SET counter = counter + 1;
    END WHILE;
END;
//
DELIMITER ;


```
```sql
mysql> call r1(5, 'emp', 1000)
    -> ;
Query OK, 1 row affected (0,03 sec)


mysql> select * from empleados;
+----+------------------------+---------+
| id | nombre                 | salario |
+----+------------------------+---------+
|  1 | Juan                   | 3000.00 |
|  2 | María                  | 3500.00 |
|  3 | Pedro                  | 3200.00 |
|  4 | emp0.3113405129977879  | 6011.00 |
|  5 | emp0.8496803984508667  | 6204.00 |
|  6 | emp0.34186323018918113 | 9773.00 |
|  7 | emp0.8482780641394463  | 3853.00 |
|  8 | emp0.04051442354965436 | 3262.00 |
+----+------------------------+---------+
```
 2. Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función __UUID()__.

    ```sql
    INSERT INTO empleados (nombre, salario)
    VALUES (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
      ```
```sql
      DELIMITER //
DROP PROCEDURE IF EXISTS r2;

CREATE PROCEDURE r2(IN iterations INT, IN base_salary INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_user VARCHAR(100);
    DECLARE random_salary DECIMAL(10, 2);

    WHILE counter < iterations DO
        SET random_user = UUID();
        SET random_salary = FLOOR(RAND() * (10000 - base_salary + 1)) + base_salary;
        INSERT INTO empleados (nombre, salario) VALUES (random_user, random_salary);
        SET counter = counter + 1;
    END WHILE;
END;
//
DELIMITER ;

```
```sql
mysql> call r2(3,1300);
Query OK, 1 row affected (0,01 sec)

mysql> select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | emp0.3113405129977879                | 6011.00 |
|  5 | emp0.8496803984508667                | 6204.00 |
|  6 | emp0.34186323018918113               | 9773.00 |
|  7 | emp0.8482780641394463                | 3853.00 |
|  8 | emp0.04051442354965436               | 3262.00 |
|  9 | 2fbaddb8-129e-11ef-a0eb-9829a64a8d03 | 2476.00 |
| 10 | 2fbb5950-129e-11ef-a0eb-9829a64a8d03 | 9324.00 |
| 11 | 2fbbb5ca-129e-11ef-a0eb-9829a64a8d03 | 3088.00 |
+----+--------------------------------------+---------+
11 rows in set (0,00 sec)

```

  3. Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND().

      ```sql
      INSERT INTO empleados (nombre, salario)
      SELECT CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000
      FROM (SELECT 1 UNION SELECT 2) AS sub
      ORDER BY RAND()
      LIMIT 2;
      ```

```sql
DROP PROCEDURE IF EXISTS r3;
DELIMITER //

CREATE PROCEDURE r3(
    IN prefix VARCHAR(50),
    IN iterations INT,
    IN base_salary INT
)
BEGIN
    DECLARE counter INT DEFAULT 0;

    -- Crear tabla temporal
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_table (num INT);
    TRUNCATE TABLE temp_table;

    -- Llenar la tabla temporal con los números de 0 a iterations-1
    WHILE counter < iterations DO
        INSERT INTO temp_table VALUES (counter);
        SET counter = counter + 1;
    END WHILE;

    -- Insertar en la tabla empleados usando datos de la tabla temporal
    INSERT INTO empleados (nombre, salario)
    SELECT CONCAT(prefix, ROUND(RAND() * 1000000)), 
           FLOOR(RAND() * (2000 - base_salary + 1)) + base_salary
    FROM temp_table
    ORDER BY RAND()
    LIMIT iterations;

    DROP TEMPORARY TABLE IF EXISTS temp_table;
END //
DELIMITER ;

```

````sql
mysql> call r3('empl', 2, 1200);
Query OK, 0 rows affected (0.02 sec)

mysql> select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | emp0.3113405129977879                | 6011.00 |
|  5 | emp0.8496803984508667                | 6204.00 |
|  6 | emp0.34186323018918113               | 9773.00 |
|  7 | emp0.8482780641394463                | 3853.00 |
|  8 | emp0.04051442354965436               | 3262.00 |
|  9 | 2fbaddb8-129e-11ef-a0eb-9829a64a8d03 | 2476.00 |
| 10 | 2fbb5950-129e-11ef-a0eb-9829a64a8d03 | 9324.00 |
| 11 | 2fbbb5ca-129e-11ef-a0eb-9829a64a8d03 | 3088.00 |
| 12 | empl114236                           | 1938.00 |
| 13 | empl687694                           | 1725.00 |
+----+--------------------------------------+---------+
13 rows in set (0.00 sec)
```

 4. Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1).

    ```sql
    INSERT INTO empleados (nombre, salario)
    VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
    ```
 ```sql
DELIMITER //
DROP PROCEDURE IF EXISTS r4;

CREATE PROCEDURE r4(IN iterations INT, IN base_salary INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_user VARCHAR(100);
    DECLARE random_salary DECIMAL(10, 2);

    WHILE counter < iterations DO
        SET random_user = SUBSTRING_INDEX(UUID(), '-', -1);
        SET random_salary = FLOOR(RAND() * (10000 - base_salary + 1)) + base_salary;
        INSERT INTO empleados (nombre, salario) VALUES (random_user, random_salary);
        SET counter = counter + 1;
    END WHILE;
END;
//
DELIMITER ;

```

```sql
mysql> call r4(4, 1400);
Query OK, 1 row affected (0.05 sec)

mysql> select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | emp0.3113405129977879                | 6011.00 |
|  5 | emp0.8496803984508667                | 6204.00 |
|  6 | emp0.34186323018918113               | 9773.00 |
|  7 | emp0.8482780641394463                | 3853.00 |
|  8 | emp0.04051442354965436               | 3262.00 |
|  9 | 2fbaddb8-129e-11ef-a0eb-9829a64a8d03 | 2476.00 |
| 10 | 2fbb5950-129e-11ef-a0eb-9829a64a8d03 | 9324.00 |
| 11 | 2fbbb5ca-129e-11ef-a0eb-9829a64a8d03 | 3088.00 |
| 12 | empl114236                           | 1938.00 |
| 13 | empl687694                           | 1725.00 |
| 15 | 9829a64a8d03                         | 3700.00 |
| 16 | 9829a64a8d03                         | 6312.00 |
| 17 | 9829a64a8d03                         | 1858.00 |
| 18 | 9829a64a8d03                         | 6157.00 |
+----+--------------------------------------+---------+
17 rows in set (0.00 sec)
```

 5. Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.

    ```sql
    INSERT INTO empleados (nombre, salario)
    VALUES (CONCAT('Empleado', RAND(1)), FLOOR(RAND(1) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(2)), FLOOR(RAND(2) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(3)), FLOOR(RAND(3) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(4)), FLOOR(RAND(4) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(5)), FLOOR(RAND(5) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(6)), FLOOR(RAND(6) * (10000 - 2000 + 1)) + 2000);
    ```
```sql
DELIMITER //

DROP PROCEDURE IF EXISTS r5;

CREATE PROCEDURE r5(IN iterations INT, IN prefix VARCHAR (10), IN base_salary INT)
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE random_user VARCHAR(100);
    DECLARE random_salary DECIMAL(10,2);
    
    WHILE counter <= iterations DO
        SET random_user = CONCAT(prefix, ROUND(RAND(counter) * 1000000));
        SET random_salary = FLOOR(RAND(counter) * (10000 - base_salary + 1)) + base_salary;
        
        INSERT INTO empleados (nombre, salario) VALUES (random_user, random_salary);
        
        SET counter = counter + 1;
    END WHILE;
END //

DELIMITER ;

```
```sql
mysql> call r5(6, 'e', 1100);
Query OK, 1 row affected (0.06 sec)

mysql> select * from empleados;
+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | emp0.3113405129977879                | 6011.00 |
|  5 | emp0.8496803984508667                | 6204.00 |
|  6 | emp0.34186323018918113               | 9773.00 |
|  7 | emp0.8482780641394463                | 3853.00 |
|  8 | emp0.04051442354965436               | 3262.00 |
|  9 | 2fbaddb8-129e-11ef-a0eb-9829a64a8d03 | 2476.00 |
| 10 | 2fbb5950-129e-11ef-a0eb-9829a64a8d03 | 9324.00 |
| 11 | 2fbbb5ca-129e-11ef-a0eb-9829a64a8d03 | 3088.00 |
| 12 | empl114236                           | 1938.00 |
| 13 | empl687694                           | 1725.00 |
| 15 | 9829a64a8d03                         | 3700.00 |
| 16 | 9829a64a8d03                         | 6312.00 |
| 17 | 9829a64a8d03                         | 1858.00 |
| 18 | 9829a64a8d03                         | 6157.00 |
| 19 | e405404                              | 4708.00 |
| 20 | e655587                              | 6935.00 |
| 21 | e905770                              | 9162.00 |
| 22 | e155953                              | 2488.00 |
| 23 | e406136                              | 4715.00 |
| 24 | e656319                              | 6941.00 |
+----+--------------------------------------+---------+
23 rows in set (0.00 sec)
```
Crea cada uno de los procedimientos, maximixando el número de parámetros de entrada necesarios, por ejemplo: ___nombre, salario, e id__.

___Crea el procedimiento, la invocación, y el estado de la tabla después de la invocación de este___.

## Referencias

- [Apuntes sobre procedimientos y funciones](../../procedimientos.md).

</div>