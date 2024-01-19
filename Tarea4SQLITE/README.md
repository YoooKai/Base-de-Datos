
# TAREA 4 - Funciones en BBDD
<img src="https://arthive.net/res/media/img/oy800/work/216/372644@2x.jpg" height="350px">
Con el siguente contenido creo el fickero supermercado-dump.sql.

```sql
CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    categoria TEXT,
    precio REAL
);

CREATE TABLE ventas (
    id INTEGER PRIMARY KEY,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

INSERT INTO productos (id, nombre, categoria, precio) VALUES
    (1, 'Arroz', 'Alimentos', 2.5),
    (2, 'Leche', 'Lácteos', 1.8),
    (3, 'Pan', 'Panadería', 1.2),
    (4, 'Manzanas', 'Frutas', 3.0),
    (5, 'Pollo', 'Carnes', 5.5),
    (6, 'Huevos', 'Lácteos', 1.0),
    (7, 'Yogurt', 'Lácteos', 2.0),
    (8, 'Tomates', 'Verduras', 2.2),
    (9, 'Queso', 'Lácteos', 4.0),
    (10, 'Cereal', 'Desayuno', 3.5),
    (11, 'Papel Higiénico', 'Hogar', 1.5),
    (12, 'Cepillo de Dientes', 'Higiene', 2.0),
    (13, 'Detergente', 'Limpieza', 2.8),
    (14, 'Galletas', 'Snacks', 1.7),
    (15, 'Aceite de Oliva', 'Cocina', 4.5),
    (16, 'Café', 'Bebidas', 5.0),
    (17, 'Sopa enlatada', 'Conservas', 2.3),
    (18, 'Jabón de Baño', 'Higiene', 1.2),
    (19, 'Botellas de Agua', 'Bebidas', 1.0),
    (20, 'Cerveza', 'Bebidas', 3.8);

INSERT INTO ventas (id_producto, cantidad, fecha) VALUES
    (1, 5, '2024-01-17'),
    (2, 3, '2024-01-17'),
    (4, 2, '2024-01-17'),
    (5, 1, '2024-01-17'),
    (6, 10, '2024-01-18'),
    (8, 4, '2024-01-18'),
    (10, 2, '2024-01-18'),
    (14, 7, '2024-01-19'),
    (16, 3, '2024-01-19'),
    (18, 6, '2024-01-20');
```
## Introducida la información, genera las siguientes tablas:

### Productos
```code
```
### Ventas
```code
```

# Paso 2 - 

<img src="er.drawio.png">

<img src="entirelaci.drawio.png">

# Paso 3 - Consultas.

1. Mostrar todos los productos de la categoría "Bebidas".

```sql
sqlite> select * from productos where categoria like 'Bebidas';
   ...> ;
+----+------------------+-----------+--------+
| id |      nombre      | categoria | precio |
+----+------------------+-----------+--------+
| 16 | Café             | Bebidas   | 5.0    |
| 19 | Botellas de Agua | Bebidas   | 1.0    |
| 20 | Cerveza          | Bebidas   | 3.8    |
+----+------------------+-----------+--------+

```

2. Listar los productos ordenados por precio de forma descendente.

```sql
SELECT * FROM productos ORDER BY precio desc;
```

``` code
+----+--------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+--------------------+-----------+--------+
| 5 | Pollo | Carnes | 5.5 |
| 16 | Café | Bebidas | 5.0 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 9 | Queso | Lácteos | 4.0 |
| 20 | Cerveza | Bebidas | 3.8 |
| 10 | Cereal | Desayuno | 3.5 |
| 4 | Manzanas | Frutas | 3.0 |
| 13 | Detergente | Limpieza | 2.8 |
| 1 | Arroz | Alimentos | 2.5 |
| 17 | Sopa enlatada | Conservas | 2.3 |
| 8 | Tomates | Verduras | 2.2 |
| 7 | Yogurt | Lácteos | 2.0 |
| 12 | Cepillo de Dientes | Higiene | 2.0 |
| 2 | Leche | Lácteos | 1.8 |
| 14 | Galletas | Snacks | 1.7 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 3 | Pan | Panadería | 1.2 |
| 18 | Jabón de Baño | Higiene | 1.2 |
| 6 | Huevos | Lácteos | 1.0 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
+----+--------------------+-----------+--------+
```
3. Calcular el precio total de todos los productos en la tabla "productos".
   SELECT SUM(precio) AS suma_precio FROM productos;

```sql
SELECT SUM(precio) AS suma_precio FROM productos;
```

```code
+-------------+
| suma_precio |
+-------------+
| 52.5 |
+-------------+
```

4. Encontrar los productos con un nombre que contenga la letra 'a'.

```sql
SELECT \* FROM productos WHERE nombre LIKE '%a%';
```

```code
+----+------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+------------------+-----------+--------+
| 1 | Arroz | Alimentos | 2.5 |
| 3 | Pan | Panadería | 1.2 |
| 4 | Manzanas | Frutas | 3.0 |
| 8 | Tomates | Verduras | 2.2 |
| 10 | Cereal | Desayuno | 3.5 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 14 | Galletas | Snacks | 1.7 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 16 | Café | Bebidas | 5.0 |
| 17 | Sopa enlatada | Conservas | 2.3 |
| 18 | Jabón de Baño | Higiene | 1.2 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
| 20 | Cerveza | Bebidas | 3.8 |
+----+------------------+-----------+--------+
```

5. Obtener la cantidad total de productos vendidos en todas las fechas.

```sql
SELECT SUM(cantidad) suma_producto FROM ventas;
```

```code
+---------------+
| suma_producto |
+---------------+
| 43 |
+---------------+
```

6. Encontrar el producto más caro en cada categoría.

```sql
SELECT categoria, MAX(precio) from productos group by categoria;
```

```code
+-----------+-------------+
| categoria | MAX(precio) |
+-----------+-------------+
| Alimentos | 2.5 |
| Bebidas | 5.0 |
| Carnes | 5.5 |
| Cocina | 4.5 |
| Conservas | 2.3 |
| Desayuno | 3.5 |
| Frutas | 3.0 |
| Higiene | 2.0 |
| Hogar | 1.5 |
| Limpieza | 2.8 |
| Lácteos | 4.0 |
| Panadería | 1.2 |
| Snacks | 1.7 |
| Verduras | 2.2 |
+-----------+-------------+
```

7. Listar los productos que no han sido vendidos.

```sql
 SELECT \* FROM productos where id not in (SELECT p.id from productos as p, ventas as v where p.id = v.id_producto);
```

```code
+----+--------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+--------------------+-----------+--------+
| 3 | Pan | Panadería | 1.2 |
| 7 | Yogurt | Lácteos | 2.0 |
| 9 | Queso | Lácteos | 4.0 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 12 | Cepillo de Dientes | Higiene | 2.0 |
| 13 | Detergente | Limpieza | 2.8 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 17 | Sopa enlatada | Conservas | 2.3 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
| 20 | Cerveza | Bebidas | 3.8 |
+----+--------------------+-----------+--------+
```

8. Calcular el precio promedio de los productos en la categoría "Snacks".

```sql
SELECT categoria, AVG(precio) from productos where categoria like 'Snacks';
```

```code
   +-----------+-------------+
   | categoria | AVG(precio) |
   +-----------+-------------+
   | Snacks | 1.7 |
   +-----------+-------------+
```

9. Encontrar los productos que han sido vendidos más de 5 veces.

```sql
SELECT v.cantidad, p.nombre FROM productos as p, ventas as v where p.id = v.id_producto and v.cantidad > 5;
```

```code
+----------+---------------+
| cantidad | nombre |
+----------+---------------+
| 10 | Huevos |
| 7 | Galletas |
| 6 | Jabón de Baño |
+----------+---------------+
```

10. Mostrar la fecha y la cantidad de ventas para cada producto.

```sql
SELECT p.id, p.nombre, v.fecha, v.cantidad FROM productos as p, ventas as v WHERE p.id=v.id_producto;
```

```code

```

11. Encontrar los productos que tienen un precio menor o igual a 2.

```sql
SELECT \* from productos where precio <= 2;
```

```code
+----+--------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+--------------------+-----------+--------+
| 2 | Leche | Lácteos | 1.8 |
| 3 | Pan | Panadería | 1.2 |
| 6 | Huevos | Lácteos | 1.0 |
| 7 | Yogurt | Lácteos | 2.0 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 12 | Cepillo de Dientes | Higiene | 2.0 |
| 14 | Galletas | Snacks | 1.7 |
| 18 | Jabón de Baño | Higiene | 1.2 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
+----+--------------------+-----------+--------+
```

12. Calcular la cantidad total de ventas para cada fecha.

```sql
SELECT fecha,SUM(cantidad) FROM ventas group by fecha;
```

+------------+---------------+
| fecha | SUM(cantidad) |
+------------+---------------+
| 2024-01-17 | 11 |
| 2024-01-18 | 16 |
| 2024-01-19 | 10 |
| 2024-01-20 | 6 |
+------------+---------------+

13. Listar los productos cuyo nombre comienza con la letra 'P'.

```sql
SELECT \* FROM productos WHERE nombre LIKE 'P%';
```

```code
+----+-----------------+-----------+--------+
| id | nombre          | categoria | precio |
+----+-----------------+-----------+--------+
| 3 | Pan              | Panadería | 1.2    |
| 5 | Pollo            | Carnes    | 5.5    |
| 11 | Papel Higiénico | Hogar     | 1.5    |
+----+-----------------+-----------+--------+
```

14. Obtener el producto más vendido en términos de cantidad.

```sql
SELECT p.nombre,MAX(v.cantidad) FROM ventas as v, productos as p;
```

```code
+--------+-----------------+
| nombre | MAX(v.cantidad) |
+--------+-----------------+
| Arroz | 10               |
+--------+-----------------+
```

15. Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.

```sql
SELECT p.id, p.nombre, v.fecha FROM ventas as v, productos as p where v.fecha like '2024-01-18' and p.id = v.id_producto;
```

```code
+----+---------+------------+
| id | nombre  | fecha      |
+----+---------+------------+
| 6  | Huevos  | 2024-01-18 |
| 8  | Tomates | 2024-01-18 |
| 10 | Cereal  | 2024-01-18 |
+----+---------+------------+
```

16. Calcular el total de ventas para cada producto.

```sql
SELECT p.id, p.nombre, v.cantidad as ventas FROM productos as p, ventas as v WHERE p.id = v.id_producto;
```

```code
sqlite> select p.id, p.nombre, v.cantidad as ventas from productos as p, ventas as v where p.id = v.id_producto;
+----+---------------+--------+
| id | nombre | ventas |
+----+---------------+--------+
| 1 | Arroz | 5 |
| 2 | Leche | 3 |
| 4 | Manzanas | 2 |
| 5 | Pollo | 1 |
| 6 | Huevos | 10 |
| 8 | Tomates | 4 |
| 10 | Cereal | 2 |
| 14 | Galletas | 7 |
| 16 | Café | 3 |
| 18 | Jabón de Baño | 6 |
+----+---------------+--------+
```

17. Encontrar los productos con un precio entre 3 y 4.

```
select _ from productos where precio between 3 and 4;
```

```code
+----+----------+-----------+--------+
| id | nombre   | categoria | precio |
+----+----------+-----------+--------+
| 4  | Manzanas | Frutas    | 3.0    |
| 9  | Queso    | Lácteos   | 4.0    |
| 10 | Cereal   | Desayuno  | 3.5    |
| 20 | Cerveza  | Bebidas   | 3.8    |
+----+----------+-----------+--------+
```

18. Listar los productos y sus categorías ordenados alfabéticamente por categoría.

```code
select \* from productos order by categoria;
```

```code
+----+--------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+--------------------+-----------+--------+
| 1 | Arroz | Alimentos | 2.5 |
| 16 | Café | Bebidas | 5.0 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
| 20 | Cerveza | Bebidas | 3.8 |
| 5 | Pollo | Carnes | 5.5 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 17 | Sopa enlatada | Conservas | 2.3 |
| 10 | Cereal | Desayuno | 3.5 |
| 4 | Manzanas | Frutas | 3.0 |
| 12 | Cepillo de Dientes | Higiene | 2.0 |
| 18 | Jabón de Baño | Higiene | 1.2 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 13 | Detergente | Limpieza | 2.8 |
| 2 | Leche | Lácteos | 1.8 |
| 6 | Huevos | Lácteos | 1.0 |
| 7 | Yogurt | Lácteos | 2.0 |
| 9 | Queso | Lácteos | 4.0 |
| 3 | Pan | Panadería | 1.2 |
| 14 | Galletas | Snacks | 1.7 |
| 8 | Tomates | Verduras | 2.2 |
+----+--------------------+-----------+--------+
```

19. Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.

```sql
SELECT p.id, p.nombre, p.precio\*v.cantidad as precio_total, v.fecha FROM productos as p, ventas as v WHERE p.id = v.id_producto and v.fecha LIKE "2024-01-19";
```

```code
+----+----------+--------------+------------+
| id | nombre | precio_total | fecha |
+----+----------+--------------+------------+
| 14 | Galletas | 11.9 | 2024-01-19 |
| 16 | Café | 15.0 | 2024-01-19 |
+----+----------+--------------+------------+
```

20. Mostrar los productos que no pertenecen a la categoría "Higiene".

```sql
select _ from productos where categoria not like "Higiene";
```
```code
+----+------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+------------------+-----------+--------+
| 1 | Arroz | Alimentos | 2.5 |
| 2 | Leche | Lácteos | 1.8 |
| 3 | Pan | Panadería | 1.2 |
| 4 | Manzanas | Frutas | 3.0 |
| 5 | Pollo | Carnes | 5.5 |
| 6 | Huevos | Lácteos | 1.0 |
| 7 | Yogurt | Lácteos | 2.0 |
| 8 | Tomates | Verduras | 2.2 |
| 9 | Queso | Lácteos | 4.0 |
| 10 | Cereal | Desayuno | 3.5 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 13 | Detergente | Limpieza | 2.8 |
| 14 | Galletas | Snacks | 1.7 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 16 | Café | Bebidas | 5.0 |
| 17 | Sopa enlatada | Conservas | 2.3 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
| 20 | Cerveza | Bebidas | 3.8 |
+----+------------------+-----------+--------+
```
21. Encontrar la cantidad total de productos en cada categoría.
```sql
SELECT categoria, count(categoria) as cantidad_productos FROM productos GROUP BY categoria;
```
```code
+-----------+--------------------+
| categoria | cantidad_productos |
+-----------+--------------------+
| Alimentos | 1 |
| Bebidas | 3 |
| Carnes | 1 |
| Cocina | 1 |
| Conservas | 1 |
| Desayuno | 1 |
| Frutas | 1 |
| Higiene | 2 |
| Hogar | 1 |
| Limpieza | 1 |
| Lácteos | 4 |
| Panadería | 1 |
| Snacks | 1 |
| Verduras | 1 |
+-----------+--------------------+
```
22. Listar los productos que tienen un precio igual a la media de precios.

```sql
SELECT * from productos where precio = (select avg(precio) from productos);
```

#### 2.625, es la media, no hay tabla

23. Calcular el precio total de los productos vendidos en cada fecha.

```sql
SELECT sum(p.precio\*v.cantidad) as precio_total, v.fecha FROM productos as p, ventas as v WHERE p.id = v.id_producto GROUP BY v.fecha;
```
```code
+--------------+------------+
| precio_total | fecha |
+--------------+------------+
| 29.4 | 2024-01-17 |
| 25.8 | 2024-01-18 |
| 26.9 | 2024-01-19 |
| 7.2 | 2024-01-20 |
+--------------+------------+
```

24. Mostrar los productos con un nombre que termina con la letra 'o'.
```sql
SELECT * from productos where nombre like "%o";
```
```
+----+-----------------+-----------+--------+
| id | nombre | categoria | precio |
+----+-----------------+-----------+--------+
| 5 | Pollo | Carnes | 5.5 |
| 9 | Queso | Lácteos | 4.0 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 18 | Jabón de Baño | Higiene | 1.2 |
+----+-----------------+-----------+--------+
```

25. Encontrar los productos que han sido vendidos en más de una fecha.
```sql
select p.id, p.nombre, v.fecha from productos as p, ventas as v where p.id = v.id_producto group by p.id having count(distinct fecha) > 1;
```
#### No hay productos que hayan sido vendidos en más de una fecha.

27. Listar los productos cuya categoría comienza con la letra 'L'.

```sql
SELECT * FROM productos WHERE categoria LIKE "L%";
```
```code
+----+------------+-----------+--------+
| id | nombre | categoria | precio |
+----+------------+-----------+--------+
| 2 | Leche | Lácteos | 1.8 |
| 6 | Huevos | Lácteos | 1.0 |
| 7 | Yogurt | Lácteos | 2.0 |
| 9 | Queso | Lácteos | 4.0 |
| 13 | Detergente | Limpieza | 2.8 |
+----+------------+-----------+--------+
```

28. Calcular el total de ventas para cada producto en la fecha '2024-01-17'.
```sql
select p.id, p.nombre, p.precio\*v.cantidad as ventas_totales, v.fecha from productos as p, ventas as v where p.id = v.id_producto and fecha like "2024-01-17";
```
+----+----------+--------------+------------+
| id | nombre | ventas | fecha |
+----+----------+--------------+------------+
| 1 | Arroz | 12.5 | 2024-01-17 |
| 2 | Leche | 5.4 | 2024-01-17 |
| 4 | Manzanas | 6.0 | 2024-01-17 |
| 5 | Pollo | 5.5 | 2024-01-17 |
+----+----------+--------------+------------+
```
29. Mostrar los productos cuyo nombre tiene al menos 5 caracteres.
```sql
select * from productos where length(nombre) >= 5;
```
```
+----+--------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+--------------------+-----------+--------+
| 1 | Arroz | Alimentos | 2.5 |
| 2 | Leche | Lácteos | 1.8 |
| 4 | Manzanas | Frutas | 3.0 |
| 5 | Pollo | Carnes | 5.5 |
| 6 | Huevos | Lácteos | 1.0 |
| 7 | Yogurt | Lácteos | 2.0 |
| 8 | Tomates | Verduras | 2.2 |
| 9 | Queso | Lácteos | 4.0 |
| 10 | Cereal | Desayuno | 3.5 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 12 | Cepillo de Dientes | Higiene | 2.0 |
| 13 | Detergente | Limpieza | 2.8 |
| 14 | Galletas | Snacks | 1.7 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 17 | Sopa enlatada | Conservas | 2.3 |
| 18 | Jabón de Baño | Higiene | 1.2 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
| 20 | Cerveza | Bebidas | 3.8 |
+----+--------------------+-----------+--------+
```

30. Encontrar los productos que tienen un precio superior al precio medio en la tabla "productos".
```
select * from productos where precio > (select avg(precio) from productos);
```
```
+----+-----------------+-----------+--------+
| id | nombre | categoria | precio |
+----+-----------------+-----------+--------+
| 4 | Manzanas | Frutas | 3.0 |
| 5 | Pollo | Carnes | 5.5 |
| 9 | Queso | Lácteos | 4.0 |
| 10 | Cereal | Desayuno | 3.5 |
| 13 | Detergente | Limpieza | 2.8 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 16 | Café | Bebidas | 5.0 |
| 20 | Cerveza | Bebidas | 3.8 |
+----+-----------------+-----------+--------+
````
# TAREA 4 - Funciones en BBDD

Con el siguente contenido creo el fickero supermercado-dump.sql.

```
CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    categoria TEXT,
    precio REAL
);

CREATE TABLE ventas (
    id INTEGER PRIMARY KEY,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

INSERT INTO productos (id, nombre, categoria, precio) VALUES
    (1, 'Arroz', 'Alimentos', 2.5),
    (2, 'Leche', 'Lácteos', 1.8),
    (3, 'Pan', 'Panadería', 1.2),
    (4, 'Manzanas', 'Frutas', 3.0),
    (5, 'Pollo', 'Carnes', 5.5),
    (6, 'Huevos', 'Lácteos', 1.0),
    (7, 'Yogurt', 'Lácteos', 2.0),
    (8, 'Tomates', 'Verduras', 2.2),
    (9, 'Queso', 'Lácteos', 4.0),
    (10, 'Cereal', 'Desayuno', 3.5),
    (11, 'Papel Higiénico', 'Hogar', 1.5),
    (12, 'Cepillo de Dientes', 'Higiene', 2.0),
    (13, 'Detergente', 'Limpieza', 2.8),
    (14, 'Galletas', 'Snacks', 1.7),
    (15, 'Aceite de Oliva', 'Cocina', 4.5),
    (16, 'Café', 'Bebidas', 5.0),
    (17, 'Sopa enlatada', 'Conservas', 2.3),
    (18, 'Jabón de Baño', 'Higiene', 1.2),
    (19, 'Botellas de Agua', 'Bebidas', 1.0),
    (20, 'Cerveza', 'Bebidas', 3.8);

INSERT INTO ventas (id_producto, cantidad, fecha) VALUES
    (1, 5, '2024-01-17'),
    (2, 3, '2024-01-17'),
    (4, 2, '2024-01-17'),
    (5, 1, '2024-01-17'),
    (6, 10, '2024-01-18'),
    (8, 4, '2024-01-18'),
    (10, 2, '2024-01-18'),
    (14, 7, '2024-01-19'),
    (16, 3, '2024-01-19'),
    (18, 6, '2024-01-20');
```
## Introducida la información, genera las siguientes tablas:

### Productos
```code
```
### Ventas
```code
```

# Paso 3 - Consultas.

1. Mostrar todos los productos de la categoría "Bebidas".

```sql
sqlite> select * from productos where categoria like 'Bebidas';
   ...> ;
+----+------------------+-----------+--------+
| id |      nombre      | categoria | precio |
+----+------------------+-----------+--------+
| 16 | Café             | Bebidas   | 5.0    |
| 19 | Botellas de Agua | Bebidas   | 1.0    |
| 20 | Cerveza          | Bebidas   | 3.8    |
+----+------------------+-----------+--------+

```

2. Listar los productos ordenados por precio de forma descendente.

```sql
SELECT * FROM productos ORDER BY precio desc;
```

``` code
+----+--------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+--------------------+-----------+--------+
| 5 | Pollo | Carnes | 5.5 |
| 16 | Café | Bebidas | 5.0 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 9 | Queso | Lácteos | 4.0 |
| 20 | Cerveza | Bebidas | 3.8 |
| 10 | Cereal | Desayuno | 3.5 |
| 4 | Manzanas | Frutas | 3.0 |
| 13 | Detergente | Limpieza | 2.8 |
| 1 | Arroz | Alimentos | 2.5 |
| 17 | Sopa enlatada | Conservas | 2.3 |
| 8 | Tomates | Verduras | 2.2 |
| 7 | Yogurt | Lácteos | 2.0 |
| 12 | Cepillo de Dientes | Higiene | 2.0 |
| 2 | Leche | Lácteos | 1.8 |
| 14 | Galletas | Snacks | 1.7 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 3 | Pan | Panadería | 1.2 |
| 18 | Jabón de Baño | Higiene | 1.2 |
| 6 | Huevos | Lácteos | 1.0 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
+----+--------------------+-----------+--------+
```
3. Calcular el precio total de todos los productos en la tabla "productos".
   SELECT SUM(precio) AS suma_precio FROM productos;

```sql
SELECT SUM(precio) AS suma_precio FROM productos;
```

```code
+-------------+
| suma_precio |
+-------------+
| 52.5 |
+-------------+
```

4. Encontrar los productos con un nombre que contenga la letra 'a'.

```sql
SELECT \* FROM productos WHERE nombre LIKE '%a%';
```

```code
+----+------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+------------------+-----------+--------+
| 1 | Arroz | Alimentos | 2.5 |
| 3 | Pan | Panadería | 1.2 |
| 4 | Manzanas | Frutas | 3.0 |
| 8 | Tomates | Verduras | 2.2 |
| 10 | Cereal | Desayuno | 3.5 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 14 | Galletas | Snacks | 1.7 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 16 | Café | Bebidas | 5.0 |
| 17 | Sopa enlatada | Conservas | 2.3 |
| 18 | Jabón de Baño | Higiene | 1.2 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
| 20 | Cerveza | Bebidas | 3.8 |
+----+------------------+-----------+--------+
```

5. Obtener la cantidad total de productos vendidos en todas las fechas.

```sql
SELECT SUM(cantidad) suma_producto FROM ventas;
```

```code
+---------------+
| suma_producto |
+---------------+
| 43 |
+---------------+
```

6. Encontrar el producto más caro en cada categoría.

```sql
SELECT categoria, MAX(precio) from productos group by categoria;
```

```code
+-----------+-------------+
| categoria | MAX(precio) |
+-----------+-------------+
| Alimentos | 2.5 |
| Bebidas | 5.0 |
| Carnes | 5.5 |
| Cocina | 4.5 |
| Conservas | 2.3 |
| Desayuno | 3.5 |
| Frutas | 3.0 |
| Higiene | 2.0 |
| Hogar | 1.5 |
| Limpieza | 2.8 |
| Lácteos | 4.0 |
| Panadería | 1.2 |
| Snacks | 1.7 |
| Verduras | 2.2 |
+-----------+-------------+
```

7. Listar los productos que no han sido vendidos.

```sql
 SELECT \* FROM productos where id not in (SELECT p.id from productos as p, ventas as v where p.id = v.id_producto);
```

```code
+----+--------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+--------------------+-----------+--------+
| 3 | Pan | Panadería | 1.2 |
| 7 | Yogurt | Lácteos | 2.0 |
| 9 | Queso | Lácteos | 4.0 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 12 | Cepillo de Dientes | Higiene | 2.0 |
| 13 | Detergente | Limpieza | 2.8 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 17 | Sopa enlatada | Conservas | 2.3 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
| 20 | Cerveza | Bebidas | 3.8 |
+----+--------------------+-----------+--------+
```

8. Calcular el precio promedio de los productos en la categoría "Snacks".

```sql
SELECT categoria, AVG(precio) from productos where categoria like 'Snacks';
```

```code
   +-----------+-------------+
   | categoria | AVG(precio) |
   +-----------+-------------+
   | Snacks | 1.7 |
   +-----------+-------------+
```

9. Encontrar los productos que han sido vendidos más de 5 veces.

```sql
SELECT v.cantidad, p.nombre FROM productos as p, ventas as v where p.id = v.id_producto and v.cantidad > 5;
```

```code
+----------+---------------+
| cantidad | nombre |
+----------+---------------+
| 10 | Huevos |
| 7 | Galletas |
| 6 | Jabón de Baño |
+----------+---------------+
```

10. Mostrar la fecha y la cantidad de ventas para cada producto.

```sql
SELECT p.id, p.nombre, v.fecha, v.cantidad FROM productos as p, ventas as v WHERE p.id=v.id_producto;
```

```code

```

11. Encontrar los productos que tienen un precio menor o igual a 2.

```sql
SELECT \* from productos where precio <= 2;
```

```code
+----+--------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+--------------------+-----------+--------+
| 2 | Leche | Lácteos | 1.8 |
| 3 | Pan | Panadería | 1.2 |
| 6 | Huevos | Lácteos | 1.0 |
| 7 | Yogurt | Lácteos | 2.0 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 12 | Cepillo de Dientes | Higiene | 2.0 |
| 14 | Galletas | Snacks | 1.7 |
| 18 | Jabón de Baño | Higiene | 1.2 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
+----+--------------------+-----------+--------+
```

12. Calcular la cantidad total de ventas para cada fecha.

```sql
SELECT fecha,SUM(cantidad) FROM ventas group by fecha;
```

+------------+---------------+
| fecha | SUM(cantidad) |
+------------+---------------+
| 2024-01-17 | 11 |
| 2024-01-18 | 16 |
| 2024-01-19 | 10 |
| 2024-01-20 | 6 |
+------------+---------------+

13. Listar los productos cuyo nombre comienza con la letra 'P'.

```sql
SELECT \* FROM productos WHERE nombre LIKE 'P%';
```

```code
+----+-----------------+-----------+--------+
| id | nombre          | categoria | precio |
+----+-----------------+-----------+--------+
| 3 | Pan              | Panadería | 1.2    |
| 5 | Pollo            | Carnes    | 5.5    |
| 11 | Papel Higiénico | Hogar     | 1.5    |
+----+-----------------+-----------+--------+
```

14. Obtener el producto más vendido en términos de cantidad.

```sql
SELECT p.nombre,MAX(v.cantidad) FROM ventas as v, productos as p;
```

```code
+--------+-----------------+
| nombre | MAX(v.cantidad) |
+--------+-----------------+
| Arroz | 10               |
+--------+-----------------+
```

15. Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.

```sql
SELECT p.id, p.nombre, v.fecha FROM ventas as v, productos as p where v.fecha like '2024-01-18' and p.id = v.id_producto;
```

```code
+----+---------+------------+
| id | nombre  | fecha      |
+----+---------+------------+
| 6  | Huevos  | 2024-01-18 |
| 8  | Tomates | 2024-01-18 |
| 10 | Cereal  | 2024-01-18 |
+----+---------+------------+
```

16. Calcular el total de ventas para cada producto.

```sql
SELECT p.id, p.nombre, v.cantidad as ventas FROM productos as p, ventas as v WHERE p.id = v.id_producto;
```

```code
sqlite> select p.id, p.nombre, v.cantidad as ventas from productos as p, ventas as v where p.id = v.id_producto;
+----+---------------+--------+
| id | nombre | ventas |
+----+---------------+--------+
| 1 | Arroz | 5 |
| 2 | Leche | 3 |
| 4 | Manzanas | 2 |
| 5 | Pollo | 1 |
| 6 | Huevos | 10 |
| 8 | Tomates | 4 |
| 10 | Cereal | 2 |
| 14 | Galletas | 7 |
| 16 | Café | 3 |
| 18 | Jabón de Baño | 6 |
+----+---------------+--------+
```

17. Encontrar los productos con un precio entre 3 y 4.

```
select _ from productos where precio between 3 and 4;
```

```code
+----+----------+-----------+--------+
| id | nombre   | categoria | precio |
+----+----------+-----------+--------+
| 4  | Manzanas | Frutas    | 3.0    |
| 9  | Queso    | Lácteos   | 4.0    |
| 10 | Cereal   | Desayuno  | 3.5    |
| 20 | Cerveza  | Bebidas   | 3.8    |
+----+----------+-----------+--------+
```

18. Listar los productos y sus categorías ordenados alfabéticamente por categoría.

```code
select \* from productos order by categoria;
```

```code
+----+--------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+--------------------+-----------+--------+
| 1 | Arroz | Alimentos | 2.5 |
| 16 | Café | Bebidas | 5.0 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
| 20 | Cerveza | Bebidas | 3.8 |
| 5 | Pollo | Carnes | 5.5 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 17 | Sopa enlatada | Conservas | 2.3 |
| 10 | Cereal | Desayuno | 3.5 |
| 4 | Manzanas | Frutas | 3.0 |
| 12 | Cepillo de Dientes | Higiene | 2.0 |
| 18 | Jabón de Baño | Higiene | 1.2 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 13 | Detergente | Limpieza | 2.8 |
| 2 | Leche | Lácteos | 1.8 |
| 6 | Huevos | Lácteos | 1.0 |
| 7 | Yogurt | Lácteos | 2.0 |
| 9 | Queso | Lácteos | 4.0 |
| 3 | Pan | Panadería | 1.2 |
| 14 | Galletas | Snacks | 1.7 |
| 8 | Tomates | Verduras | 2.2 |
+----+--------------------+-----------+--------+
```

19. Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.

```sql
SELECT p.id, p.nombre, p.precio\*v.cantidad as precio_total, v.fecha FROM productos as p, ventas as v WHERE p.id = v.id_producto and v.fecha LIKE "2024-01-19";
```

```code
+----+----------+--------------+------------+
| id | nombre | precio_total | fecha |
+----+----------+--------------+------------+
| 14 | Galletas | 11.9 | 2024-01-19 |
| 16 | Café | 15.0 | 2024-01-19 |
+----+----------+--------------+------------+
```

20. Mostrar los productos que no pertenecen a la categoría "Higiene".

```sql
select _ from productos where categoria not like "Higiene";
```
```code
+----+------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+------------------+-----------+--------+
| 1 | Arroz | Alimentos | 2.5 |
| 2 | Leche | Lácteos | 1.8 |
| 3 | Pan | Panadería | 1.2 |
| 4 | Manzanas | Frutas | 3.0 |
| 5 | Pollo | Carnes | 5.5 |
| 6 | Huevos | Lácteos | 1.0 |
| 7 | Yogurt | Lácteos | 2.0 |
| 8 | Tomates | Verduras | 2.2 |
| 9 | Queso | Lácteos | 4.0 |
| 10 | Cereal | Desayuno | 3.5 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 13 | Detergente | Limpieza | 2.8 |
| 14 | Galletas | Snacks | 1.7 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 16 | Café | Bebidas | 5.0 |
| 17 | Sopa enlatada | Conservas | 2.3 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
| 20 | Cerveza | Bebidas | 3.8 |
+----+------------------+-----------+--------+
```
21. Encontrar la cantidad total de productos en cada categoría.
```sql
SELECT categoria, count(categoria) as cantidad_productos FROM productos GROUP BY categoria;
```
```code
+-----------+--------------------+
| categoria | cantidad_productos |
+-----------+--------------------+
| Alimentos | 1 |
| Bebidas | 3 |
| Carnes | 1 |
| Cocina | 1 |
| Conservas | 1 |
| Desayuno | 1 |
| Frutas | 1 |
| Higiene | 2 |
| Hogar | 1 |
| Limpieza | 1 |
| Lácteos | 4 |
| Panadería | 1 |
| Snacks | 1 |
| Verduras | 1 |
+-----------+--------------------+
```
22. Listar los productos que tienen un precio igual a la media de precios.

```sql
SELECT * from productos where precio = (select avg(precio) from productos);
```

#### 2.625, es la media, no hay tabla

23. Calcular el precio total de los productos vendidos en cada fecha.

```sql
SELECT sum(p.precio\*v.cantidad) as precio_total, v.fecha FROM productos as p, ventas as v WHERE p.id = v.id_producto GROUP BY v.fecha;
```
```code
+--------------+------------+
| precio_total | fecha |
+--------------+------------+
| 29.4 | 2024-01-17 |
| 25.8 | 2024-01-18 |
| 26.9 | 2024-01-19 |
| 7.2 | 2024-01-20 |
+--------------+------------+
```

24. Mostrar los productos con un nombre que termina con la letra 'o'.
```sql
SELECT * from productos where nombre like "%o";
```
```
+----+-----------------+-----------+--------+
| id | nombre | categoria | precio |
+----+-----------------+-----------+--------+
| 5 | Pollo | Carnes | 5.5 |
| 9 | Queso | Lácteos | 4.0 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 18 | Jabón de Baño | Higiene | 1.2 |
+----+-----------------+-----------+--------+
```

25. Encontrar los productos que han sido vendidos en más de una fecha.
```sql
select p.id, p.nombre, v.fecha from productos as p, ventas as v where p.id = v.id_producto group by p.id having count(distinct fecha) > 1;
```
#### No hay productos que hayan sido vendidos en más de una fecha.

27. Listar los productos cuya categoría comienza con la letra 'L'.

```sql
SELECT * FROM productos WHERE categoria LIKE "L%";
```
```code
+----+------------+-----------+--------+
| id | nombre | categoria | precio |
+----+------------+-----------+--------+
| 2 | Leche | Lácteos | 1.8 |
| 6 | Huevos | Lácteos | 1.0 |
| 7 | Yogurt | Lácteos | 2.0 |
| 9 | Queso | Lácteos | 4.0 |
| 13 | Detergente | Limpieza | 2.8 |
+----+------------+-----------+--------+
```

28. Calcular el total de ventas para cada producto en la fecha '2024-01-17'.
```sql
select p.id, p.nombre, p.precio\*v.cantidad as ventas_totales, v.fecha from productos as p, ventas as v where p.id = v.id_producto and fecha like "2024-01-17";
```
+----+----------+--------------+------------+
| id | nombre | ventas | fecha |
+----+----------+--------------+------------+
| 1 | Arroz | 12.5 | 2024-01-17 |
| 2 | Leche | 5.4 | 2024-01-17 |
| 4 | Manzanas | 6.0 | 2024-01-17 |
| 5 | Pollo | 5.5 | 2024-01-17 |
+----+----------+--------------+------------+
```
29. Mostrar los productos cuyo nombre tiene al menos 5 caracteres.
```sql
select * from productos where length(nombre) >= 5;
```
```
+----+--------------------+-----------+--------+
| id | nombre | categoria | precio |
+----+--------------------+-----------+--------+
| 1 | Arroz | Alimentos | 2.5 |
| 2 | Leche | Lácteos | 1.8 |
| 4 | Manzanas | Frutas | 3.0 |
| 5 | Pollo | Carnes | 5.5 |
| 6 | Huevos | Lácteos | 1.0 |
| 7 | Yogurt | Lácteos | 2.0 |
| 8 | Tomates | Verduras | 2.2 |
| 9 | Queso | Lácteos | 4.0 |
| 10 | Cereal | Desayuno | 3.5 |
| 11 | Papel Higiénico | Hogar | 1.5 |
| 12 | Cepillo de Dientes | Higiene | 2.0 |
| 13 | Detergente | Limpieza | 2.8 |
| 14 | Galletas | Snacks | 1.7 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 17 | Sopa enlatada | Conservas | 2.3 |
| 18 | Jabón de Baño | Higiene | 1.2 |
| 19 | Botellas de Agua | Bebidas | 1.0 |
| 20 | Cerveza | Bebidas | 3.8 |
+----+--------------------+-----------+--------+
```

30. Encontrar los productos que tienen un precio superior al precio medio en la tabla "productos".
```
select * from productos where precio > (select avg(precio) from productos);
```
```
+----+-----------------+-----------+--------+
| id | nombre | categoria | precio |
+----+-----------------+-----------+--------+
| 4 | Manzanas | Frutas | 3.0 |
| 5 | Pollo | Carnes | 5.5 |
| 9 | Queso | Lácteos | 4.0 |
| 10 | Cereal | Desayuno | 3.5 |
| 13 | Detergente | Limpieza | 2.8 |
| 15 | Aceite de Oliva | Cocina | 4.5 |
| 16 | Café | Bebidas | 5.0 |
| 20 | Cerveza | Bebidas | 3.8 |
+----+-----------------+-----------+--------+
````
