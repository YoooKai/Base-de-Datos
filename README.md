# Tarea 4

```mysql

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- Crear la tabla empleados
CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

-- Insertar algunos datos de ejemplo
INSERT INTO empleados (nombre, salario) VALUES
('Juan', 3000.00),
('María', 3500.00),
('Pedro', 3200.00);
```

1. Crea un procedimiento que aumente el salario de los empleados en un porcentaje dado:

```sql
  DELIMITER //
  CREATE PROCEDURE aumentar_salarios(IN porcentaje DECIMAL(5,2))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          UPDATE empleados SET salario = salario * (1 + porcentaje / 100) WHERE id = emp_id;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;
```

2. Escribe un procedimiento almacenado que aumente los salarios de todos los empleados en un 5%, pero excluya a aquellos cuyo salario sea superior a 3200. El procedimiento debe tener parámetros de entrada.

```sql
DELIMETER //
CREATE PROCEDURE aumentar_salario (IN porcentaje DECIMAL (5,2))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_nombre VARCHAR(100);
    declare emp_salario DECIMAL (10, 2);
    DECLARE cur CURSOR FOR select id, nombre, salario FROM empleados;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur1 INTO emp_id, emp_nombre, emp_salario;
        IF done THEN
              LEAVE read_loop;
        END IF;
          IF emp_salario >= 3200 THEN
            UPDATE empleados SET salario = salario * (1 + porcentaje / 100) where id = emp_id;
        END IF;

        END LOOP
        CLOSE cur
    END //
    DELIMETER ;
          
```
```SQL
CALL aumentar_salario(5);

SELECT * FROM empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3505.25 |
|  3 | Pedro  | 3365.04 |
+----+--------+---------+
3 rows in set (0,00 sec)

```

3. Escribe un procedimiento almacenado que calcule el salario anual de cada empleado (asumiendo que trabajan todo el año) y lo imprima.

```sql
DROP PROCEDURE IF EXISTS salario_anual;

  DELIMITER //
  CREATE PROCEDURE salario_anual(IN meses INT)
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          SELECT id, nombre, salario * meses as salario_anual from empleados WHERE id = id_empleado;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;
```

```sql
call salario_anual(2);

+----+--------+---------------+
| id | nombre | salario_anual |
+----+--------+---------------+
|  2 | María  |      42063.00 |
+----+--------+---------------+
1 row in set (0,00 sec)

```

4. Escribe un procedimiento almacenado que cuente y muestre el número de empleados en cada rango de salario (por ejemplo, menos de 3000, entre 3000 y 5000, más de 5000). El procedimiento debe tener parámetros de entrada.
```sql
DROP PROCEDURE IF EXISTS rango_salario;

  DELIMITER //
  CREATE PROCEDURE rango_salario(IN min_limit INT, max_limit INT)
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE salario BETWEEN min_limit AND max_limit;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          SELECT id, nombre, salario from empleados;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;

call rango_salario(3200, 3600);

+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  2 | María  | 3505.25 |
|  3 | Pedro  | 3365.04 |
+----+--------+---------+
2 rows in set (0,00 sec)

```
