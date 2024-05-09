# Tarea 5

```sql
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

INSERT INTO empleados (nombre, salario) VALUES
('Juan', 3000.00),
('María', 3500.00),
('Pedro', 3200.00);
```

```sql
mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
3 rows in set (0,00 sec)

```
1. Escribe un procedimiento almacenado que copie los nombres de todos los empleados cuyo salario sea superior a 3000 en una nueva tabla llamada 'empleados_destino'. Es necesario crear la tabla empleados_destiono

```sql
DROP PROCEDURE IF EXISTS nombres_empleados_destino;
DELIMITER //
  CREATE PROCEDURE nombres_empleados_destino()
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE salario > 3000;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      DROP TABLE IF EXISTS empleados_destino;
      CREATE TABLE empleados_destino (id int, nombre varchar(100), salario DECIMAL(10, 2));

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          INSERT INTO empleados_destino(id, nombre, salario) VALUES(emp_id, emp_nombre, emp_salario);
          
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;

```
```sql
call nombres_empleados_destino();

mysql> select * from empleados_destino;
+------+--------+---------+
| id   | nombre | salario |
+------+--------+---------+
|    2 | María  | 3500.00 |
|    3 | Pedro  | 3200.00 |
+------+--------+---------+
2 rows in set (0,00 sec)

```

2. Escribe un procedimiento almacenado que seleccione los empleados cuyos nombres contienen la letra 'a' y aumente sus salarios en un 10%.

```sql

DELIMITER //
  DROP PROCEDURE IF EXISTS aumentar_10_a;
  CREATE PROCEDURE aumentar_10_a()
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE nombre regexp 'a';
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          UPDATE empleados set salario = salario * (1 + 10 / 100) where id = emp_id;
          
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;

```

```sql
mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 3850.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
3 rows in set (0,00 sec)
```

3. Escribe un procedimiento almacenado que seleccione empleados cuyos IDs estén en un rango específico, por ejemplo, entre 2 y 3.

```sql

DELIMITER //
  DROP PROCEDURE IF EXISTS id_especifico;
  CREATE PROCEDURE id_especifico()
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE id between 2 and 4;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          select id, nombre, salario from empleados where id = emp_id;
          
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;

```
```sql

mysql> call id_especifico;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  2 | María  | 3850.00 |
+----+--------+---------+
1 row in set (0,01 sec)

+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
1 row in set (0,01 sec)

Query OK, 0 rows affected (0,01 sec)

```
4. Escribe un procedimiento almacenado que elimine todos los empleados cuyo salario esté entre 2000 y 2500.
```sql

DELIMITER //
  DROP PROCEDURE IF EXISTS elimar_empleados;
  CREATE PROCEDURE eliminar_empleados()
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE salario between 2000 and 2500;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          DELETE FROM empleados where id = emp_id;
          
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;

```
```sql
mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 3850.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
3 rows in set (0,00 sec)
```

5. Escribe un procedimiento almacenado que aumente el salario de un empleado específico cuyo nombre se pasa como parámetro en un 20%.

```sql

DELIMITER //
  DROP PROCEDURE IF EXISTS aumentar_20;
  CREATE PROCEDURE aumentar_20(IN p_nombre VARCHAR(100))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados where nombre = p_nombre;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          UPDATE empleados set salario = salario * (1 + 20 / 100) where id = emp_id;
          
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;

```

```sql
mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3600.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
3 rows in set (0,00 sec)

```