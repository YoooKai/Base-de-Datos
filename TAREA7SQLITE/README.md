```sql
-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?
select coches.id_coche, coches.marca, coches.modelo, coches.precio, clientes.nombre from clientes, coches, ventas where coches.id_coche=ventas.id_coche and clientes.id_cliente=ventas.id_cliente;

+----------+------------+----------------+---------+-----------------+
| id_coche |   marca    |     modelo     | precio  |     nombre      |
+----------+------------+----------------+---------+-----------------+
| 1        | Toyota     | Sedán 2022     | 25000.0 | Juan Pérez      |
| 2        | Honda      | Hatchback 2021 | 22000.0 | María Gómez     |
| 3        | Ford       | SUV 2023       | 30000.0 | Carlos López    |
| 4        | Chevrolet  | Coupé 2022     | 28000.0 | Ana Martínez    |
| 5        | Nissan     | Camioneta 2023 | 32000.0 | Pedro Rodríguez |
| 6        | Volkswagen | Compacto 2021  | 20000.0 | Laura Sánchez   |
| 7        | Hyundai    | Híbrido 2022   | 27000.0 | Miguel González |
| 8        | Mazda      | Deportivo 2023 | 35000.0 | Isabel Díaz     |
| 10       | Tesla      | Eléctrico 2021 | 40000.0 | Elena Torres    |
+----------+------------+----------------+---------+-----------------+


-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)
select clientes.*, coches.precio as precio_coche from clientes, ventas, coches where clientes.id_cliente = ventas.id_cliente and coches.id_coche = ventas.id_coche and coches.precio > (select avg(precio) from coches);
+------------+-----------------+------+----------------+--------------+
| id_cliente |     nombre      | edad |   direccion    | precio_coche |
+------------+-----------------+------+----------------+--------------+
| 3          | Carlos López    | 35   | Calle C #789   | 30000.0      |
| 5          | Pedro Rodríguez | 40   | Calle E #234   | 32000.0      |
| 8          | Isabel Díaz     | 38   | Avenida H #111 | 35000.0      |
| 10         | Elena Torres    | 29   | Avenida J #333 | 40000.0      |
+------------+-----------------+------+----------------+--------------+


-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:

  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas

select * from coches where id_coche not in (select id_coche from ventas); 
+----------+-------------+-------+------+---------+
| id_coche |   modelo    | marca | año  | precio  |
+----------+-------------+-------+------+---------+
| 9        | Pickup 2022 | Ram   | 2022 | 31000.0 |
+----------+-------------+-------+------+---------+


-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.
select sum(coches.precio) as suma_total from coches, ventas where coches.id_coche = ventas.id_coche;
+------------+
| suma_total |
+------------+
| 259000.0   |
+------------+

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?

select ventas.fecha_venta, clientes.id_cliente, clientes.nombre, coches.* from coches as coches, clientes, ventas where coches.id_coche = ventas.id_coche and clientes.id_cliente = ventas.id_cliente order by fecha_venta desc;
+-------------+------------+-----------------+----------+----------------+------------+------+---------+
| fecha_venta | id_cliente |     nombre      | id_coche |     modelo     |   marca    | año  | precio  |
+-------------+------------+-----------------+----------+----------------+------------+------+---------+
| 2023-10-05  | 10         | Elena Torres    | 10       | Eléctrico 2021 | Tesla      | 2021 | 40000.0 |
| 2023-08-25  | 8          | Isabel Díaz     | 8        | Deportivo 2023 | Mazda      | 2023 | 35000.0 |
| 2023-07-20  | 7          | Miguel González | 7        | Híbrido 2022   | Hyundai    | 2022 | 27000.0 |
| 2023-06-15  | 6          | Laura Sánchez   | 6        | Compacto 2021  | Volkswagen | 2021 | 20000.0 |
| 2023-05-05  | 5          | Pedro Rodríguez | 5        | Camioneta 2023 | Nissan     | 2023 | 32000.0 |
| 2023-04-10  | 4          | Ana Martínez    | 4        | Coupé 2022     | Chevrolet  | 2022 | 28000.0 |
| 2023-03-25  | 3          | Carlos López    | 3        | SUV 2023       | Ford       | 2023 | 30000.0 |
| 2023-02-20  | 2          | María Gómez     | 2        | Hatchback 2021 | Honda      | 2021 | 22000.0 |
| 2023-01-15  | 1          | Juan Pérez      | 1        | Sedán 2022     | Toyota     | 2022 | 25000.0 |
+-------------+------------+-----------------+----------+----------------+------------+------+---------+

-- Encontrar el modelo de coche más caro.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX
select coches.*, max(precio) as precio_máximo from coches;
+----------+----------------+-------+------+---------+---------------+
| id_coche |     modelo     | marca | año  | precio  | precio_máximo |
+----------+----------------+-------+------+---------+---------------+
| 10       | Eléctrico 2021 | Tesla | 2021 | 40000.0 | 40000.0       |
+----------+----------------+-------+------+---------+---------------+

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT
select clientes.*, count(ventas.id_cliente) as total_coches from clientes, 
ventas where clientes.id_cliente = ventas.id_cliente group by clientes.id_cliente;
+------------+-----------------+------+----------------+--------------+
| id_cliente |     nombre      | edad |   direccion    | total_coches |
+------------+-----------------+------+----------------+--------------+
| 1          | Juan Pérez      | 30   | Calle A #123   | 1            |
| 2          | María Gómez     | 25   | Avenida B #456 | 1            |
| 3          | Carlos López    | 35   | Calle C #789   | 1            |
| 4          | Ana Martínez    | 28   | Avenida D #101 | 1            |
| 5          | Pedro Rodríguez | 40   | Calle E #234   | 1            |
| 6          | Laura Sánchez   | 32   | Avenida F #567 | 1            |
| 7          | Miguel González | 27   | Calle G #890   | 1            |
| 8          | Isabel Díaz     | 38   | Avenida H #111 | 1            |
| 10         | Elena Torres    | 29   | Avenida J #333 | 1            |
+------------+-----------------+------+----------------+--------------+

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.
select clientes.id_cliente, clientes.nombre, coches.marca from clientes as clientes, ventas, coches
where clientes.id_cliente = ventas.id_cliente and coches.id_coche = ventas.id_coche and coches.marca = 'Toyota';
+------------+------------+--------+
| id_cliente |   nombre   | marca  |
+------------+------------+--------+
| 1          | Juan Pérez | Toyota |
+------------+------------+--------+

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 
select avg(clientes.edad) as media_edad from clientes as clientes, 
ventas as ventas, coches as coches where clientes.id_cliente = ventas.id_cliente and 
coches.id_coche = ventas.id_coche and coches.precio > 25000;
+------------------+
|    media_edad    |
+------------------+
| 32.8333333333333 |
+------------------+

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

select coches.* from coches as coches, ventas as ventas, 
clientes as clientes where coches.id_coche = ventas.id_coche and clientes.id_cliente = ventas.id_cliente 
and clientes.edad > 30;
+----------+----------------+------------+------+---------+
| id_coche |     modelo     |   marca    | año  | precio  |
+----------+----------------+------------+------+---------+
| 3        | SUV 2023       | Ford       | 2023 | 30000.0 |
| 5        | Camioneta 2023 | Nissan     | 2023 | 32000.0 |
| 6        | Compacto 2021  | Volkswagen | 2021 | 20000.0 |
| 8        | Deportivo 2023 | Mazda      | 2023 | 35000.0 |
+----------+----------------+------------+------+---------+

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.
select coches.*, count(ventas.id_coche) as venta_2022 from coches as coches, ventas as ventas where coches.id_coche = ventas.id_coche and ventas.fecha_venta regexp '2022' group by coches.id_coche;
--No hay coincidencias.

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG
select * from coches where precio > (select avg(coches.precio) from coches as coches, 
clientes as clientes, ventas as ventas where coches.id_coche = ventas.id_coche and clientes.id_cliente = ventas.id_cliente and clientes.edad < 30);

+----------+----------------+--------+------+---------+
| id_coche |     modelo     | marca  | año  | precio  |
+----------+----------------+--------+------+---------+
| 3        | SUV 2023       | Ford   | 2023 | 30000.0 |
| 5        | Camioneta 2023 | Nissan | 2023 | 32000.0 |
| 8        | Deportivo 2023 | Mazda  | 2023 | 35000.0 |
| 9        | Pickup 2022    | Ram    | 2022 | 31000.0 |
| 10       | Eléctrico 2021 | Tesla  | 2021 | 40000.0 |
+----------+----------------+--------+------+---------+
-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio

select coches.marca, count(ventas.id_coche) as ventas_totales from coches as coches, 
ventas as ventas where ventas.id_coche = coches.id_coche group by ventas.id_coche order by ventas_totales desc;
+------------+----------------+
|   marca    | ventas_totales |
+------------+----------------+
| Tesla      | 1              |
| Mazda      | 1              |
| Hyundai    | 1              |
| Volkswagen | 1              |
| Nissan     | 1              |
| Chevrolet  | 1              |
| Ford       | 1              |
| Honda      | 1              |
| Toyota     | 1              |
+------------+----------------+
```
