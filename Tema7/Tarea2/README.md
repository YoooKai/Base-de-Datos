# Tarea 2. Índices.
<img src="https://res.cloudinary.com/lwgatsby/f_auto/www/uploads/2018/10/MySQLIndexing-min.png">

#### Una empresa guarda los siguientes datos de sus clientes, con los siguientes campos:
- documento char (8) not null,
- nombre varchar(30) not null,
- domicilio varchar(30),
- ciudad varchar(20),
- provincia varchar (20),
- telefono varchar(11)

Se pide: 

```sql
--crear la base de datos
create database tarea2;
use tarea2;
```
- Elimine la tabla "cliente" si existe. 
    >__Nota__:_Muestra el comando y la salida_.

```SQL

drop table if exists cliente;
```
> Query OK, 0 rows affected, 1 warning (0.01 sec)

- Cree la tabla sin clave primaria e incluye a posteriori esta.
    >__Nota__:_Muestra el comando y la salida_. 
```SQL

```sql
create table cliente (
    documento char(8) not null,
    nombre varchar(30) not null,
    domicilio varchar(30),
    ciudad varchar(20),
    provincia varchar(20),
    telefono varchar(11)
);
```

```sql
--mostrar la info de la tabla
describe cliente
```
```sql
mysql> describe cliente;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| documento | char(8)     | NO   |     | NULL    |       |
| nombre    | varchar(30) | NO   |     | NULL    |       |
| domicilio | varchar(30) | YES  |     | NULL    |       |
| ciudad    | varchar(20) | YES  |     | NULL    |       |
| provincia | varchar(20) | YES  |     | NULL    |       |
| telefono  | varchar(11) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.01 sec)
```
```sql
--ahora se debe crear la clave priamria

ALTER TABLE cliente MODIFY documento char(8) NOT NULL, ADD PRIMARY KEY(documento);
```
```sql
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| documento | char(8)     | NO   | PRI | NULL    |       |
| nombre    | varchar(30) | NO   |     | NULL    |       |
| domicilio | varchar(30) | YES  |     | NULL    |       |
| ciudad    | varchar(20) | YES  |     | NULL    |       |
| provincia | varchar(20) | YES  |     | NULL    |       |
| telefono  | varchar(11) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
```
- Define los siguientes indices:
   - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
        >__Nota__:_Muestra el comando y la salida. Justifica el tipo de indice en un comentario_. 
        ```sql
        --para documento, un índice único ya que es clave primaria
        CREATE UNIQUE INDEX idx_documento ON  cliente(documento);
        ```
        ```sql
        --para ciudad y provincia, un índice compuesto ya que utiliza dos columnas
        CREATE INDEX idx_ciudad_provincia on cliente(ciudad, provincia);
        ```

    - Vea los índices de la tabla.
        >__Nota__:_Muestra el comando y la salida __"show index"___.

```sql
 mysql> show index from cliente;

+---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name             | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | PRIMARY              |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          0 | idx_documento        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | idx_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | idx_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0.03 sec)
```

- Agregue un índice único por el campo "telefono".
    >__Nota__:_Muestra el comando y la salida_.
    ````sql
    CREATE UNIQUE INDEX idx_telefono on cliente(telefono);

    > Query OK, 0 rows affected (0.03 sec)
    > Records: 0  Duplicates: 0  Warnings: 0

    mysql> show index from cliente;
    +---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | Table   | Non_unique | Key_name             | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
    +---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | cliente |          0 | PRIMARY              |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | cliente |          0 | idx_documento        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | cliente |          0 | idx_telefono         |            1 | telefono    | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | cliente |          1 | idx_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | cliente |          1 | idx_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    +---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    5 rows in set (0.01 sec)

    ```
- Elimina los índices.
    >__Nota__:_Muestra el comando y la salida_.
   ```sql
   DROP INDEX idx_documento ON cliente;
   DROP INDEX idx_telefono ON cliente;
   DROP INDEX idx_ciudad_provincia ON cliente;
   

    mysql> SHOW INDEX from cliente;
    +---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
    +---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | cliente |          0 | PRIMARY  |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    +---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    1 row in set (0.00 sec)
   ```