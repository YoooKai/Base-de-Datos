
```SQL

-- TABLA log_cambios_email
DROP TABLE IF EXISTS log_cambios_email;
CREATE TABLE log_cambios_email(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    fecha_hora DATETIME,
    old_email VARCHAR(100),
    new_email VARCHAR(100),
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id)
);

-- TRIGGER para actualizar emails
DROP TRIGGER IF EXISTS trigger_guardar_email_after_update;
DELIMITER //

CREATE TRIGGER trigger_guardar_email_after_update
AFTER UPDATE ON alumnos
FOR EACH ROW
BEGIN
    IF NEW.email <> OLD.email THEN
        INSERT INTO log_cambios_email(id_alumno, fecha_hora, old_email, new_email) 
        VALUES (OLD.id, NOW(), OLD.email, NEW.email);
    END IF;
END;
//

DELIMITER ;

-- TABLA alumnos_eliminados

DROP TABLE IF EXISTS log_alumnos_eliminados;
DELIMITER //
CREATE TABLE log_alumnos_eliminados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    fecha_hora DATETIME,
    nombre VARCHAR(100),
    apellido1 VARCHAR(100),
    apellido2 VARCHAR(100),
    email VARCHAR(100)
);
DELIMITER ;

-- TRIGGER para eliminación de alumnos
DROP TRIGGER IF EXISTS trigger_guardar_alumnos_eliminados;
DELIMITER //
CREATE TRIGGER trigger_guardar_alumnos_eliminados
AFTER DELETE ON alumnos
FOR EACH ROW
BEGIN
    INSERT INTO log_alumnos_eliminados(id_alumno, fecha_hora, nombre, apellido1, apellido2, email) 
    VALUES (OLD.id, NOW(), OLD.nombre, OLD.apellido1, OLD.apellido2, OLD.email);
END;
//
DELIMITER ;


--la tabla alumnos anteriormente creada
mysql> select * from alumnos;
+----+--------+-----------+-----------+----------------------+
| id | nombre | apellido1 | apellido2 | email                |
+----+--------+-----------+-----------+----------------------+
|  1 | Kai    | Rodríguez | Gómez     | krodgom@14de7bce.com |
|  2 | Jose   | Rodríguez | González  | jrodgon@14e42c8e.com |
|  3 | Kai    | Sánchez   | García    | ksangar@14e65061.com |
|  4 | Lili   | López     | Fernández | llopfer@14e6b9eb.com |
|  5 | Marina | Pérez     | Martín    | mpermar@14e8032a.com |
|  6 | Lili   | Fernández | Rodríguez | lferrod@14e9f3d1.com |
|  7 | Lili   | Pérez     | Sánchez   | lpersan@14eb171e.com |
|  8 | Jose   | Martínez  | Rodríguez | jmarrod@14eb5afa.com |
|  9 | Jesús  | Fernández | Pérez     | jferper@14eb9c45.com |
| 10 | Marina | Gómez     | González  | mgomgon@14ebde14.com |
+----+--------+-----------+-----------+----------------------+
10 rows in set (0.21 sec)

--comprobación
UPDATE alumnos SET email = 'k97rg@gmail.com' WHERE id = 1;
SELECT * FROM log_cambios_email;
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM log_cambios_email;
+----+-----------+---------------------+----------------------+-----------------+
| id | id_alumno | fecha_hora          | old_email            | new_email       |
+----+-----------+---------------------+----------------------+-----------------+
|  1 |         1 | 2024-05-23 09:18:09 | krodgom@14de7bce.com | k97rg@gmail.com |
+----+-----------+---------------------+----------------------+-----------------+
1 row in set (0.00 sec)


--comprobación
DELETE FROM alumnos WHERE id = 5;
SELECT * FROM alumnos_eliminados;
Query OK, 1 row affected (0.01 sec)

mysql> select * from log_alumnos_eliminados;
+----+-----------+---------------------+--------+-----------+-----------+----------------------+
| id | id_alumno | fecha_hora          | nombre | apellido1 | apellido2 | email                |
+----+-----------+---------------------+--------+-----------+-----------+----------------------+
|  1 |         5 | 2024-05-23 09:29:28 | Marina | Pérez     | Martín    | mpermar@14e8032a.com |
+----+-----------+---------------------+--------+-----------+-----------+----------------------+
2 rows in set (0.00 sec)

```