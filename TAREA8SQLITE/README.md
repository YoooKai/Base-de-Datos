```sql
-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.
-- Consulta para calcular el precio promedio de los coches vendidos.
select round(avg(coches.precio), 2) as promedio_precio from coches, ventas where coches.id_coche=ventas.id_coche;
+-----------------+
| promedio_precio |
+-----------------+
| 28777.78        |
+-----------------+

-- Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.
select coches.modelo, coches.marca from coches, ventas, clientes where clientes.edad > 30 and coches.id_coche=ventas.id_coche and ventas.id_cliente=clientes.id_cliente;
+----------------+------------+
|     modelo     |   marca    |
+----------------+------------+
| SUV 2023       | Ford       |
| Camioneta 2023 | Nissan     |
| Compacto 2021  | Volkswagen |
| Deportivo 2023 | Mazda      |
+----------------+------------+

-- Consulta para contar el número de coches vendidos de cada marca.
select coches.marca, count(coches.marca) as cantidad_marca from coches, ventas where coches.id_coche=ventas.id_coche group by marca;
+------------+----------------+
|   marca    | cantidad_marca |
+------------+----------------+
| Chevrolet  | 1              |
| Ford       | 1              |
| Honda      | 1              |
| Hyundai    | 1              |
| Mazda      | 1              |
| Nissan     | 1              |
| Tesla      | 1              |
| Toyota     | 1              |
| Volkswagen | 1              |
+------------+----------------+

-- Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.
select clientes.nombre, clientes.direccion from clientes, reparacion where clientes.id_cliente=reparacion.id_cliente and reparacion.fecha_reparación regexp '2024-';
+-----------------+----------------+
|     nombre      |   direccion    |
+-----------------+----------------+
| Francisco Ruiz  | Calle I #222   |
| Elena Torres    | Avenida J #333 |
| Juan Pérez      | Calle A #123   |
| María Gómez     | Avenida B #456 |
| Carlos López    | Calle C #789   |
| Ana Martínez    | Avenida D #101 |
| Pedro Rodríguez | Calle E #234   |
| Laura Sánchez   | Avenida F #567 |
| Miguel González | Calle G #890   |
| Isabel Díaz     | Avenida H #111 |
| Francisco Ruiz  | Calle I #222   |
| Elena Torres    | Avenida J #333 |
+-----------------+----------------+

-- Consulta para calcular el total gastado en reparaciones por cada cliente.
--No existe ningún dato de precio por reparaciones :(

-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.
select clientes.nombre, clientes.edad from clientes, ventas, coches where coches.precio > 30000 and coches.id_coche=ventas.id_coche and clientes.id_cliente=ventas.id_cliente;
+-----------------+------+
|     nombre      | edad |
+-----------------+------+
| Pedro Rodríguez | 40   |
| Isabel Díaz     | 38   |
| Elena Torres    | 29   |
+-----------------+------+

-- Consulta para calcular el precio medio de los coches vendidos en 2023.
select round(avg(coches.precio), 2) as media_precio_2023 from coches, ventas where coches.id_coche=ventas.id_coche and ventas.fecha_venta regexp '2023-';
+-------------------+
| media_precio_2023 |
+-------------------+
| 28777.78          |
+-------------------+

-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.
select clientes.nombre, clientes.direccion from clientes, coches, ventas where coches.marca='Ford' and clientes.id_cliente=ventas.id_cliente and coches.id_coche=ventas.id_coche;
+--------------+--------------+
|    nombre    |  direccion   |
+--------------+--------------+
| Carlos López | Calle C #789 |
+--------------+--------------+

-- Consulta para contar el número de coches vendidos por año.
select substr(fecha_venta, 1, 4) as año, count(id_coche) as coches_por_anyo from ventas group by año;
+------+-----------------+
| año  | coches_por_anyo |
+------+-----------------+
| 2023 | 9               |
+------+-----------------+

-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.
select clientes.nombre, clientes.edad from clientes, ventas, coches, reparacion where clientes.id_cliente = ventas.id_cliente and coches.id_coche = ventas.id_coche and coches.precio > 30000 and coches.id_coche = reparacion.id_coche and clientes.id_cliente = reparacion.id_cliente;
+--------------+------+
|    nombre    | edad |
+--------------+------+
| Isabel Díaz  | 38   |
| Elena Torres | 29   |
+--------------+------+

-- Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.
select sum(coches.precio) as total_precio from ventas, coches, clientes where clientes.edad < 30 and clientes.id_cliente=ventas.id_cliente and coches.id_coche=ventas.id_coche;
+--------------+
| total_precio |
+--------------+
| 117000.0     |
+--------------+

--Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.
select distinct(coches.modelo) from coches, ventas, reparacion where ventas.fecha_venta regexp '2023-' and coches.id_coche=ventas.id_coche=reparacion.id_coche;
+----------------+
|     modelo     |
+----------------+
| Sedán 2022     |
| Hatchback 2021 |
| SUV 2023       |
| Coupé 2022     |
| Camioneta 2023 |
| Compacto 2021  |
| Híbrido 2022   |
| Deportivo 2023 |
| Eléctrico 2021 |
+----------------+

-- Consulta para contar el número de coches vendidos por cliente.
select clientes.id_cliente, clientes.nombre, count(ventas.id_coche) as coches_vendidos from clientes, ventas where clientes.id_cliente = ventas.id_cliente group by clientes.id_cliente;
+------------+-----------------+-----------------+
| id_cliente |     nombre      | coches_vendidos |
+------------+-----------------+-----------------+
| 1          | Juan Pérez      | 1               |
| 2          | María Gómez     | 1               |
| 3          | Carlos López    | 1               |
| 4          | Ana Martínez    | 1               |
| 5          | Pedro Rodríguez | 1               |
| 6          | Laura Sánchez   | 1               |
| 7          | Miguel González | 1               |
| 8          | Isabel Díaz     | 1               |
| 10         | Elena Torres    | 1               |
+------------+-----------------+-----------------+

-- Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.
select coches.marca, coches.modelo, coches.precio from coches, clientes, ventas where coches.id_coche = ventas.id_coche and clientes.id_cliente = ventas.id_cliente and clientes.edad > 35;
+--------+----------------+---------+
| marca  |     modelo     | precio  |
+--------+----------------+---------+
| Nissan | Camioneta 2023 | 32000.0 |
| Mazda  | Deportivo 2023 | 35000.0 |
+--------+----------------+---------+

--Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).
select sum(coches.precio) as precio_total from clientes, coches, ventas where clientes.direccion regexp 'Calle' and clientes.id_cliente=ventas.id_cliente and coches.id_coche=ventas.id_coche;
+--------------+
| precio_total |
+--------------+
| 114000.0     |
+--------------+

--Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.
select clientes.nombre, clientes.direccion from clientes, coches, ventas, reparacion where coches.precio > 30000 and reparacion.fecha_reparación regexp '2024-' and coches.id_coche=ventas.id_coche=reparacion.id_coche and ventas.id_cliente=clientes.id_cliente=reparacion.id_cliente;
--No hay coincidencias.

-- Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.
select avg(coches.precio) as media_precio_coches_vendidos_2023 from clientes, coches, ventas, reparacion where clientes.edad > 30 and coches.id_coche=ventas.id_coche=reparacion.id_coche and ventas.id_cliente=clientes.id_cliente=reparacion.id_cliente;
+-----------------------------------+
| media_precio_coches_vendidos_2023 |
+-----------------------------------+
| 29250.0                           |
+-----------------------------------+

-- Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".

select coches.modelo, coches.año from clientes, coches, ventas where clientes.id_cliente=ventas.id_cliente and ventas.id_coche=coches.id_coche and clientes.direccion regexp 'Avenida';
+----------------+------+
|     modelo     | año  |
+----------------+------+
| Hatchback 2021 | 2021 |
| Coupé 2022     | 2022 |
| Compacto 2021  | 2021 |
| Deportivo 2023 | 2023 |
| Eléctrico 2021 | 2021 |
+----------------+------+

-- Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.
select clientes.id_cliente, clientes.nombre, count(reparacion.id_cliente) as cantidad_reparaciones from reparacion, clientes where clientes.id_cliente=reparacion.id_cliente group by clientes.id_cliente;
+------------+-----------------+-----------------------+
| id_cliente |     nombre      | cantidad_reparaciones |
+------------+-----------------+-----------------------+
| 1          | Juan Pérez      | 2                     |
| 2          | María Gómez     | 2                     |
| 3          | Carlos López    | 2                     |
| 4          | Ana Martínez    | 2                     |
| 5          | Pedro Rodríguez | 2                     |
| 6          | Laura Sánchez   | 2                     |
| 7          | Miguel González | 2                     |
| 8          | Isabel Díaz     | 2                     |
| 9          | Francisco Ruiz  | 2                     |
| 10         | Elena Torres    | 2                     |
+------------+-----------------+-----------------------+

```
