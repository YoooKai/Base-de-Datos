# Tarea 1 - Procedimientos

- 1. Crea la bbdd. _ Utilizaremos comandos SQL para crear una base de datos llamada "SimpleDB" que contendrá dos tablas: "Users" para almacenar información de usuarios y "Products" para almacenar información de productos._

  ```sql
  CREATE DATABASE IF NOT EXISTS SimpleDB;

  USE SimpleDB;

  CREATE TABLE IF NOT EXISTS Users (
      UserID INT AUTO_INCREMENT PRIMARY KEY,
      UserName VARCHAR(50) NOT NULL,
      Email VARCHAR(100) NOT NULL
  );

  CREATE TABLE IF NOT EXISTS Products (
      ProductID INT AUTO_INCREMENT PRIMARY KEY,
      ProductName VARCHAR(100) NOT NULL,
      Price DECIMAL(10, 2) NOT NULL
  );
  ```

- 2. Realiza la inserción de algunos datos de prueba.
  
  ```sql

  INSERT INTO Users (UserName, Email) VALUES ('Juan', 'juan@example.com');
  INSERT INTO Users (UserName, Email) VALUES ('María', 'maria@example.com');
  INSERT INTO Users (UserName, Email) VALUES ('Pedro', 'pedro@example.com');

  INSERT INTO Products (ProductName, Price) VALUES ('Producto 1', 10.99);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 2', 20.50);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 3', 15.75);

  ```
#### Tablas resultantes
```sql
+--------------------+
| Tables_in_SimpleDB |
+--------------------+
| Products           |
| Users              |
+--------------------+

```
#### Tabla Productos
```sql
+-----------+-------------+-------+
| ProductID | ProductName | Price |
+-----------+-------------+-------+
|         1 | Producto 1  | 10.99 |
|         2 | Producto 2  | 20.50 |
|         3 | Producto 3  | 15.75 |
+-----------+-------------+-------+


```
#### Tabla Users
```sql
+--------+----------+-------------------+
| UserID | UserName | Email             |
+--------+----------+-------------------+
|      1 | Juan     | juan@example.com  |
|      2 | María    | maria@example.com |
|      3 | Pedro    | pedro@example.com |
+--------+----------+-------------------+

```
  >__Nota__:_Realizar la inserción de al menos_ ___3 elementos___ _más en cada tabla_.

- 3. Crea __procedimientos almacenados__ para realizar operaciones como __insertar un nuevo usuario, actualizar el nombre de un usuario__, etc.
- Procedimiento para insertar un nuevo usuario.

```sql

DELIMITER $$
DROP PROCEDURE IF EXISTS add_user$$
CREATE PROCEDURE add_user
(IN uName VARCHAR(20), IN uEmail VARCHAR(30))
BEGIN
INSERT INTO Users(UserName, Email) VALUES(uName, uEmail);
END$$
DELIMITER ;

```
```SQL
CALL add_user('Roberto', 'rober87ds@gmail.com');
CALL add_user('Asuka', 'asu8316@gmail.com');
CALL add_user('Amanda', 'greensky@gmail.com');

```
```sql
+--------+----------+---------------------+
| UserID | UserName | Email               |
+--------+----------+---------------------+
|      1 | Juan     | juan@example.com    |
|      2 | María    | maria@example.com   |
|      3 | Pedro    | pedro@example.com   |
|      4 | Roberto  | rober87ds@gmail.com |
|      5 | Asuka    | asu8316@gmail.com   |
|      6 | Amanda   | greensky@gmail.com  |
+--------+----------+---------------------+

```
- Procedimiento para actualizar el nombre de un usuario.

```sql

DELIMITER $$
DROP PROCEDURE IF EXISTS update_user$$
CREATE PROCEDURE update_user
(IN usName VARCHAR(20), IN usID INTEGER)
BEGIN
UPDATE Users SET UserName = usName where UserID = usID;
END$$
DELIMITER ;

```
```sql
CALL update_user('Alberto', 1);
CALL update_user('Shakira', 3);
CALL update_user('Rafaelo', 5);
```
```sql
+--------+----------+---------------------+
| UserID | UserName | Email               |
+--------+----------+---------------------+
|      1 | Alberto  | juan@example.com    |
|      2 | María    | maria@example.com   |
|      3 | Shakira  | pedro@example.com   |
|      4 | Roberto  | rober87ds@gmail.com |
|      5 | Rafaelo  | asu8316@gmail.com   |
|      6 | Amanda   | greensky@gmail.com  |
+--------+----------+---------------------+

```


- 4. Implementa funciones para realizar cálculos o consultas:
- Función para calcular el precio total de un conjunto de productos.
```sql
DELIMITER $$
DROP FUNCTION IF EXISTS calc_total$$

CREATE FUNCTION calc_total() RETURNS FLOAT DETERMINISTIC
BEGIN
DECLARE result FLOAT;
SELECT sum(Price) as total from Products into result;
RETURN result;
END$$

DELIMITER ;
```

```sql
SELECT calc_total();

+--------------+
| calc_total() |
+--------------+
|        47.24 |
+--------------+

```
- Función para contar el número de usuarios.
```sql
DELIMITER $$
DROP FUNCTION IF EXISTS calc_users$$

CREATE FUNCTION calc_users() RETURNS INTEGER DETERMINISTIC
BEGIN
DECLARE result INTEGER;
SELECT count(UserID) as num_users from Users into result;
RETURN result;
END$$

DELIMITER ;

```
```SQL
SELECT calc_users();
+--------------+
| calc_users() |
+--------------+
|            6 |
+--------------+

```
