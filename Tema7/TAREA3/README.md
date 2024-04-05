<div align="justify">

# Tarea 3 de trabajo con índices

<div align="center">
<img src="https://i.ytimg.com/vi/CPVKvcj5tTw/maxresdefault.jpg"/>
</div>

Se pide ejecutar cada una de las acciones necesarias para realizar las operaciones indicadas.

Las operaciones son las siguientes:

- Crea una base de datos que tendrá por nombre __Base_Indices__.
```sql
CREATE DATABASE Base_Indices;

USE Base_Indices;
```

- En la BD crea una tabla de nombre MOVIMIENTO con la siguiente estructura:

    | Nombre del campo | Tipo de dato | Propiedades                |
    |------------------|--------------|----------------------------|
    | Identificador    | int       | AUTO_INCREMENT, __Clave primaria__  |
    | Articulo         | varchar(50)  | Obligatorio                |
    | Fecha            | date         | Obligatorio                |
    | Cantidad         | int     | Obligatorio                |





```sql
DROP TABLE IF EXISTS MOVIMIENTO;

CREATE TABLE MOVIMIENTO (
    Identificador INT auto_increment PRIMARY KEY,
    Articulo VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Cantidad INT NOT NULL
);
```
- Aplica la sentencia adecuada para visualizar los índices que hay en la tabla.
  
>__Nota__: _Muestra el resultado y razona la respueta_.



```sql

SHOW INDEX FROM MOVIMIENTO;

+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| movimiento |          0 | PRIMARY  |            1 | Identificador | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
1 row in set (0.02 sec)
```
- Ejecuta la siguiente sentencia sql para generar datos de prueba:

    ```sql
    CREATE TABLE NumerosUnicos (
    Numero INT AUTO_INCREMENT PRIMARY KEY
    );

    INSERT INTO NumerosUnicos (Numero)
    SELECT NULL FROM INFORMATION_SCHEMA.COLUMNS LIMIT 5000;

    INSERT INTO MOVIMIENTO (Identificador, Articulo, Fecha, Cantidad)
    SELECT 
        n.Numero,
        CONCAT('Producto', n.Numero),
        DATE_ADD('2012-01-01', INTERVAL FLOOR(RAND() * 120) DAY),
        FLOOR(RAND() * 1000000) + 1
    FROM 
        NumerosUnicos n;

        DROP TABLE NumerosUnicos;

    ```
> Query OK, 0 rows affected (0.03 sec)

>__Nota__: _Muestra el resultado y razona la respueta. Ejecuta un count sobre la tabla_.

```SQL
--Se generaron 3557 registros

SELECT COUNT(*) FROM MOVIMIENTO;
+----------+
| COUNT(*) |
+----------+
|     3557 |
+----------+
1 row in set (0.01 sec)
```

- Crea con la sentencia CREATE TABLE…SELECT… un duplicado de la tabla MOVIMIENTO a
la que llamaremos MOVIMIENTO_BIS.

```sql
create table MOVIMIENTO_BIS select * from MOVIMIENTO;
```
>__Nota__: _Muestra el resultado y razona la respueta_.

Salida:

> Query OK, 3557 rows affected (0.16 sec)
> Records: 3557  Duplicates: 0  Warnings: 0


- Con la cláusula __DESCRIBE__ observa cuál es la situación de la tabla clonada, ¿Qué le pasa al
índice y a la propiedad __AUTO_INCREMENT__?

>__Nota__: _Compara el resultado con la tabla MOVIMIENTO_.

```sql
mysql> describe MOVIMIENTO;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| Identificador | int         | NO   | PRI | NULL    | auto_increment |
| Articulo      | varchar(50) | NO   |     | NULL    |                |
| Fecha         | date        | NO   |     | NULL    |                |
| Cantidad      | int         | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)
```
```SQL
mysql> describe MOVIMIENTO_BIS;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Identificador | int         | NO   |     | 0       |       |
| Articulo      | varchar(50) | NO   |     | NULL    |       |
| Fecha         | date        | NO   |     | NULL    |       |
| Cantidad      | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)
```

### El Identificador no es primary key en la tabla clonada, ni tampoco mantiene que se auto incremental.

- Utilizando EXPLAIN observa el plan de ejecución de la consulta que devuelve toda la información de los movimientos con identificador=3. Tanto en la tabla MOVIMIENTOS como en la tabla MOVIMIENTOS_bis. Escribe tus conclusiones al respecto.

```sql
EXPLAIN SELECT * FROM MOVIMIENTO WHERE Identificador=3;
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.01 sec)

```

```SQL
EXPLAIN SELECT * FROM MOVIMIENTO_BIS WHERE Identificador=3;
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3557 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0.00 sec)
```
### En la tabla original lo encuentra mucho más rápido al identificar la clave primaria y solo necesita un registro, mientras que en la tabla duplicada recorre 2557, siendo mucho menos eficiente.

- Supongamos que las consultas de rango que se van a hacer en nuestra tabla son frecuentes y además no por el identificador, sino por la fecha. Este es motivo suficiente para que sea la fecha un índice de tabla y así mejorar el tiempo de respuesta de nuestras consultas.
En la tabla MOVIMIENTO_BIS creamos un índice para la fecha (IX_FECHA_BIS) y otro índice para el identificador (IX_IDENTIFICADOR).

```sql
CREATE UNIQUE INDEX IX_IDENTIFICADOR on MOVIMIENTO_BIS(Identificador);

CREATE INDEX IX_FECHA_BIS on MOVIMIENTO_BIS(Fecha);
```
- 8.- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:
Consulta1

```sql
EXPLAIN select * from MOVIMIENTO where identificador=3;
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
```

consulta 2

```sql
EXPLAIN select identificador from MOVIMIENTO_BIS where identificador=3;
+----+-------------+----------------+------------+-------+------------------+------------------+---------+-------+------+----------+-------------+
| id | select_type | table          | partitions | type  | possible_keys    | key              | key_len | ref   | rows | filtered | Extra       |
+----+-------------+----------------+------------+-------+------------------+------------------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | const | IX_IDENTIFICADOR | IX_IDENTIFICADOR | 4       | const |    1 |   100.00 | Using index |
+----+-------------+----------------+------------+-------+------------------+------------------+---------+-------+------+----------+-------------+
```

Fíjata en que en la consulta 1 pedimos todos los campos. ¿A través de que indice se busca? ¿Por qué crees que lo hace así?
En la consulta 2 solo pedimos el identificador. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.
### En la primera consulta se guía utilizando la clave primaria como índice, pues es la que le hemos dado, sin embargo, en la segunda, en el clon de la tabla, ya no lo reconoce como clave primaria pero al darle un índice IX_IDENTIFICADOR utiliza este para encontrar los datos.

- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:

Consulta 1:

```sql
EXPLAIN SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN '01/01/2012' and '01/03/2012';

+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3557 |    11.11 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
```

Consulta 2

```sql
EXPLAIN SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '01/01/2012' and '01/03/2012';
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | IX_FECHA_BIS  | NULL | NULL    | NULL | 3557 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
```

Fijate que en la consulta 2 pedimos todos los campos. ¿A través de que índice busca? ¿Por qué crees que lo hace así?
### A través de IX_FECHA_BIS puede buscar la fecha pero como se han pedido todos los campos lo ignora y recorre todos los registros.

En la consulta 1 solo pedimos la fecha. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.
###  Está realizando un escaneo completo de todas las filas de la tabla porque en esta no existe un índice para la columna de fecha.

- Vamos a crear un índice por fecha (IX_FECHA) en la tabla MOVIMIENTO, puesto que no lo tenía, en este caso la tabla ya tenía un indice, la clave primaria.
```sql
CREATE INDEX IX_FECHA on MOVIMIENTO(Fecha);
```
- Visualiza los indices de las tablas MOVIMIENTO y MOVIMIENTO_BIS.

```SQL
--MOVIMIENTO
SHOW INDEX FROM MOVIMIENTO;
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| movimiento |          0 | PRIMARY  |            1 | Identificador | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| movimiento |          1 | IX_FECHA |            1 | Fecha         | A         |         120 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

--MOVIMIENTO_BIS
SHOW INDEX FROM MOVIMIENTO_BIS;
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table          | Non_unique | Key_name         | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| movimiento_bis |          0 | IX_IDENTIFICADOR |            1 | Identificador | A         |        3557 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| movimiento_bis |          1 | IX_FECHA_BIS     |            1 | Fecha         | A         |         120 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```

- - Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:
Consulta 1:

```sql
EXPLAIN SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;

+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ref  | IX_FECHA      | IX_FECHA | 3       | const |    1 |   100.00 | Using index |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
```

Consulta 2:

```sql
EXPLAIN SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;

+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ref  | IX_FECHA      | IX_FECHA | 3       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------+
```

Consulta 3:

```sql
EXPLAIN SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_FECHA_BIS  | IX_FECHA_BIS | 3       | const |    1 |   100.00 | Using index |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------------+
```

Consulta 4:

```sql
EXPLAIN SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_FECHA_BIS  | IX_FECHA_BIS | 3       | const |    1 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
```

###  Cuando se utilizan las consultas que seleccionan todos los campos con SELECT *, estas ignoran los índices creados en las columnas de fecha en ambas tablas (MOVIMIENTO y MOVIMIENTO_BIS). Por otro lado, cuando se realizan consultas que seleccionan solo la columna de fecha (SELECT fecha), se aprovechan los índices creados en la columna de fecha. Es decir que el uso de índices puede mejorar significativamente el rendimiento de las consultas, pero es importante tener en cuenta cómo se estructuran las consultas para aprovechar al máximo los índices disponibles.


</div>