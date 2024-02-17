Consultas a Realizar
Consultas SQL sobre una tabla

```sql
-- Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

SELECT codigo_oficina, ciudad from oficina;

```

| codigo_oficina |        ciudad        |
|----------------|----------------------|
| BCN-ES         | Barcelona            |
| BOS-USA        | Boston               |
| LON-UK         | Londres              |
| MAD-ES         | Madrid               |
| PAR-FR         | Paris                |
| SFC-USA        | San Francisco        |
| SYD-AU         | Sydney               |
| TAL-ES         | Talavera de la Reina |
| TOK-JP         | Tokyo                |


    
    
```sql
--Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

select ciudad, telefono from oficina where pais="España";
```
|        ciudad        |    telefono    |
|----------------------|----------------|
| Barcelona            | +34 93 3561182 |
| Madrid               | +34 91 7514487 |
| Talavera de la Reina | +34 925 867231 |

```sql
--Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
select nombre, apellido1, apellido2, email from empleado where codigo_jefe="7";
```
| nombre  | apellido1 | apellido2 |          email           |
|---------|-----------|-----------|--------------------------|
| Mariano | López     | Murcia    | mlopez@jardineria.es     |
| Lucio   | Campoamor | Martín    | lcampoamor@jardineria.es |
| Hilario | Rodriguez | Huertas   | hrodriguez@jardineria.es |

```sql
--Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

select puesto, nombre, apellido1, apellido2, email from empleado where codigo_jefe NOT NULL;
```


|        puesto         |     nombre      | apellido1  | apellido2 |           email           |
|-----------------------|-----------------|------------|-----------|---------------------------|
| Subdirector Marketing | Ruben           | López      | Martinez  | rlopez@jardineria.es      |
| Subdirector Ventas    | Alberto         | Soria      | Carrasco  | asoria@jardineria.es      |
| Secretaria            | Maria           | Solís      | Jerez     | msolis@jardineria.es      |
| Representante Ventas  | Felipe          | Rosas      | Marquez   | frosas@jardineria.es      |
| Representante Ventas  | Juan Carlos     | Ortiz      | Serrano   | cortiz@jardineria.es      |
| Director Oficina      | Carlos          | Soria      | Jimenez   | csoria@jardineria.es      |
| Representante Ventas  | Mariano         | López      | Murcia    | mlopez@jardineria.es      |
| Representante Ventas  | Lucio           | Campoamor  | Martín    | lcampoamor@jardineria.es  |
| Representante Ventas  | Hilario         | Rodriguez  | Huertas   | hrodriguez@jardineria.es  |
| Director Oficina      | Emmanuel        | Magaña     | Perez     | manu@jardineria.es        |
| Representante Ventas  | José Manuel     | Martinez   | De la Osa | jmmart@hotmail.es         |
| Representante Ventas  | David           | Palma      | Aceituno  | dpalma@jardineria.es      |
| Representante Ventas  | Oscar           | Palma      | Aceituno  | opalma@jardineria.es      |
| Director Oficina      | Francois        | Fignon     |           | ffignon@gardening.com     |
| Representante Ventas  | Lionel          | Narvaez    |           | lnarvaez@gardening.com    |
| Representante Ventas  | Laurent         | Serra      |           | lserra@gardening.com      |
| Director Oficina      | Michael         | Bolton     |           | mbolton@gardening.com     |
| Representante Ventas  | Walter Santiago | Sanchez    | Lopez     | wssanchez@gardening.com   |
| Director Oficina      | Hilary          | Washington |           | hwashington@gardening.com |
| Representante Ventas  | Marcus          | Paxton     |           | mpaxton@gardening.com     |
| Representante Ventas  | Lorena          | Paxton     |           | lpaxton@gardening.com     |
| Director Oficina      | Nei             | Nishikori  |           | nnishikori@gardening.com  |
| Representante Ventas  | Narumi          | Riko       |           | nriko@gardening.com       |
| Representante Ventas  | Takuma          | Nomura     |           | tnomura@gardening.com     |
| Director Oficina      | Amy             | Johnson    |           | ajohnson@gardening.com    |
| Representante Ventas  | Larry           | Westfalls  |           | lwestfalls@gardening.com  |
| Representante Ventas  | John            | Walton     |           | jwalton@gardening.com     |
| Director Oficina      | Kevin           | Fallmer    |           | kfalmer@gardening.com     |
| Representante Ventas  | Julian          | Bellinelli |           | jbellinelli@gardening.com |
| Representante Ventas  | Mariko          | Kishi      |           | mkishi@gardening.com      |


```sql
--Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

select nombre, apellido1, apellido2, puesto from empleado where puesto != "Representante Ventas";

```
|  nombre  | apellido1  | apellido2 |        puesto         |
|----------|------------|-----------|-----------------------|
| Marcos   | Magaña     | Perez     | Director General      |
| Ruben    | López      | Martinez  | Subdirector Marketing |
| Alberto  | Soria      | Carrasco  | Subdirector Ventas    |
| Maria    | Solís      | Jerez     | Secretaria            |
| Carlos   | Soria      | Jimenez   | Director Oficina      |
| Emmanuel | Magaña     | Perez     | Director Oficina      |
| Francois | Fignon     |           | Director Oficina      |
| Michael  | Bolton     |           | Director Oficina      |
| Hilary   | Washington |           | Director Oficina      |
| Nei      | Nishikori  |           | Director Oficina      |
| Amy      | Johnson    |           | Director Oficina      |
| Kevin    | Fallmer    |           | Director Oficina      |


```sql
-- Devuelve un listado con el nombre de los todos los clientes españoles.

select nombre_cliente from cliente where pais ="Spain";
```
|         nombre_cliente         |
|--------------------------------|
| Lasas S.A.                     |
| Beragua                        |
| Club Golf Puerta del hierro    |
| Naturagua                      |
| DaraDistribuciones             |
| Madrileña de riegos            |
| Lasas S.A.                     |
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| Jardin de Flores               |
| Flores Marivi                  |
| Flowers, S.A                   |
| Naturajardin                   |
| Golf S.A.                      |
| Americh Golf Management SL     |
| Aloha                          |
| El Prat                        |
| Sotogrande                     |
| Vivero Humanes                 |
| Fuenla City                    |
| Jardines y Mansiones Cactus SL |
| Jardinerías Matías SL          |
| Agrojardin                     |
| Top Campo                      |
| Jardineria Sara                |
| Campohermoso                   |
| Flores S.L.                    |


```sql
-- Devuelve un listado con los distintos estados por los que puede pasar un pedido.

select distinct(estado) from pedido;

```
|  estado   |
|-----------|
| Entregado |
| Rechazado |
| Pendiente |

```sql
-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos.
``
```sql
-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
```
```sql
-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega where fecha_entrega regexp () 

```
```sql
-- Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE estado REGEXP 'Rechazado' AND fecha_entrega REGEXP '^2009-';

```
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
|---------------|----------------|----------------|---------------|
| 21            | 9              | 2009-01-09     | 2009-01-09    |
| 40            | 19             | 2009-03-10     | 2009-03-13    |
| 46            | 23             | 2009-03-04     | 2009-03-05    |
| 113           | 36             | 2008-11-09     | 2009-01-09    |

```sql
-- Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE fecha_entrega REGEXP '-01-';

```
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
|---------------|----------------|----------------|---------------|
| 1             | 5              | 2006-01-19     | 2006-01-19    |
| 13            | 7              | 2009-01-14     | 2009-01-15    |
| 15            | 7              | 2009-01-12     | 2009-01-11    |
| 16            | 7              | 2009-01-07     | 2009-01-15    |
| 17            | 7              | 2009-01-09     | 2009-01-11    |
| 18            | 9              | 2009-01-06     | 2009-01-07    |
| 21            | 9              | 2009-01-09     | 2009-01-09    |
| 22            | 9              | 2009-01-11     | 2009-01-13    |
| 32            | 4              | 2007-01-19     | 2007-01-27    |
| 55            | 14             | 2009-01-10     | 2009-01-11    |
| 58            | 3              | 2009-01-31     | 2009-01-30    |
| 64            | 1              | 2009-01-31     | 2009-01-30    |
| 75            | 15             | 2009-01-13     | 2009-01-13    |
| 79            | 28             | 2009-01-13     | 2009-01-13    |
| 82            | 28             | 2009-01-29     | 2009-01-29    |
| 95            | 35             | 2008-01-19     | 2008-01-19    |
| 100           | 16             | 2009-01-15     | 2009-01-15    |
| 102           | 16             | 2009-01-08     | 2009-01-08    |
| 103           | 30             | 2009-01-20     | 2009-01-24    |
| 113           | 36             | 2008-11-09     | 2009-01-09    |
| 114           | 36             | 2009-01-29     | 2009-01-31    |
| 119           | 16             | 2009-01-15     | 2009-01-15    |
| 121           | 16             | 2009-01-08     | 2009-01-08    |
| 123           | 30             | 2009-01-20     | 2009-01-24    |


```sql
-- Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

SELECT *
FROM pago
WHERE fecha_pago REGEXP '2008' AND forma_pago = 'PayPal'
ORDER BY fecha_pago DESC;


```
ORDER BY fecha_pago DESC;
| codigo_cliente | forma_pago | id_transaccion | fecha_pago | total |
|----------------|------------|----------------|------------|-------|
| 1              | PayPal     | ak-std-000002  | 2008-12-10 | 2000  |
| 1              | PayPal     | ak-std-000001  | 2008-11-10 | 2000  |
| 13             | PayPal     | ak-std-000014  | 2008-08-04 | 2246  |
| 14             | PayPal     | ak-std-000015  | 2008-07-15 | 4160  |
| 26             | PayPal     | ak-std-000020  | 2008-03-18 | 18846 |


```sql
-- Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

select distinct(forma_pago) from pago;
```
|  forma_pago   |
|---------------|
| PayPal        |
| Transferencia |
| Cheque        |

```sql
-- Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

select * from producto where gama = "Ornamentales" and cantidad_en_stock > 100 order by precio_venta desc;
```
| codigo_producto |                    nombre                    |     gama     | dimensiones |    proveedor     |                                                                                                                                                                                descripcion                                                                                                                                                                                | cantidad_en_stock | precio_venta | precio_proveedor |
|-----------------|----------------------------------------------|--------------|-------------|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------|--------------|------------------|
| OR-115          | Forsytia Intermedia \"Lynwood\"              | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           | 120               | 7            | 5                |
| OR-116          | Hibiscus Syriacus  \"Diana\" -Blanco Puro    | Ornamentales | 35-45       | Viveros EL OASIS | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo. | 120               | 7            | 5                |
| OR-117          | Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo | Ornamentales | 35-45       | Viveros EL OASIS | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo. | 120               | 7            | 5                |
| OR-118          | Hibiscus Syriacus \"Pink Giant\" Rosa        | Ornamentales | 35-45       | Viveros EL OASIS | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo. | 120               | 7            | 5                |
| OR-112          | Escallonia (Mix)                             | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           | 120               | 5            | 4                |
| OR-113          | Evonimus Emerald Gayeti                      | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           | 120               | 5            | 4                |
| OR-114          | Evonimus Pulchellus                          | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           | 120               | 5            | 4                |
| OR-119          | Laurus Nobilis Arbusto - Ramificado Bajo     | Ornamentales | 40-50       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           | 120               | 5            | 4                |
| OR-120          | Lonicera Nitida                              | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           | 120               | 5            | 4                |
| OR-121          | Lonicera Nitida \"Maigrum\"                  | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           | 120               | 5            | 4                |
| OR-122          | Lonicera Pileata                             | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           | 120               | 5            | 4                |
| OR-123          | Philadelphus \"Virginal\"                    | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           | 120               | 5            | 4                |
| OR-124          | Prunus pisardii                              | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           | 120               | 5            | 4                |
| OR-125          | Viburnum Tinus \"Eve Price\"                 | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           | 120               | 5            | 4                |
| OR-126          | Weigelia \"Bristol Ruby\"                    | Ornamentales | 35-45       | Viveros EL OASIS |                                                                                                                                                                                                                                                                                                                                                                           | 120               | 5            | 4                |


```sql
-- Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

select * from cliente where ciudad = "Madrid" and codigo_empleado_rep_ventas regexp ^(1[1-9]|2[0-9]|30)$';
```
| codigo_cliente |       nombre_cliente        | nombre_contacto | apellido_contacto | telefono  |    fax    | linea_direccion1  | linea_direccion2 | ciudad |   region    | pais  | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|-----------------------------|-----------------|-------------------|-----------|-----------|-------------------|------------------|--------|-------------|-------|---------------|----------------------------|----------------|
| 7              | Beragua                     | Jose            | Bermejo           | 654987321 | 916549872 | C/pintor segundo  | Getafe           | Madrid | Madrid      | Spain | 28942         | 11                         | 20000          |
| 8              | Club Golf Puerta del hierro | Paco            | Lopez             | 62456810  | 919535678 | C/sinesio delgado | Madrid           | Madrid | Madrid      | Spain | 28930         | 11                         | 40000          |
| 9              | Naturagua                   | Guillermo       | Rengifo           | 689234750 | 916428956 | C/majadahonda     | Boadilla         | Madrid | Madrid      | Spain | 28947         | 11                         | 32000          |
| 10             | DaraDistribuciones          | David           | Serrano           | 675598001 | 916421756 | C/azores          | Fuenlabrada      | Madrid | Madrid      | Spain | 28946         | 11                         | 50000          |
| 11             | Madrileña de riegos         | Jose            | Tacaño            | 655983045 | 916689215 | C/Lagañas         | Fuenlabrada      | Madrid | Madrid      | Spain | 28943         | 11                         | 20000          |
| 15             | Jardin de Flores            | Javier          | Villar            | 654865643 | 914538776 | C/ Oña 34         |                  | Madrid | Madrid      | Spain | 28950         | 30                         | 40000          |
| 18             | Naturajardin                | Victoria        | Cruz              | 612343529 | 916548735 | Plaza Magallón 15 |                  | Madrid | Madrid      | Spain | 28011         | 30                         | 5050           |
| 36             | Flores S.L.                 | Antonio         | Romero            | 654352981 | 685249700 | Avenida España    |                  | Madrid | Fuenlabrada | Spain | 29643         | 18                         | 6000           |
sqlite> 


# Conultas multitabla (Where para unir tablas)

```sql
Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

select c.nombre_cliente, e.nombre as nombre_representante, e.apellido1 as apellido_representante from cliente as c join empleado as e on c.codigo_empleado_rep_ventas=e.codigo_empleado; 

select c.nombre_cliente, e.nombre as nombre_representante, e.apellido1 as apellido_representante from cliente as c, empleado as e where c.codigo_empleado_rep_ventas=e.codigo_empleado; 
```
|         nombre_cliente         | nombre_representante | apellido_representante |
|--------------------------------|----------------------|------------------------|
| GoldFish Garden                | Walter Santiago      | Sanchez                |
| Gardening Associates           | Walter Santiago      | Sanchez                |
| Gerudo Valley                  | Lorena               | Paxton                 |
| Tendo Garden                   | Lorena               | Paxton                 |
| Lasas S.A.                     | Mariano              | López                  |
| Beragua                        | Emmanuel             | Magaña                 |
| Club Golf Puerta del hierro    | Emmanuel             | Magaña                 |
| Naturagua                      | Emmanuel             | Magaña                 |
| DaraDistribuciones             | Emmanuel             | Magaña                 |
| Madrileña de riegos            | Emmanuel             | Magaña                 |
| Lasas S.A.                     | Mariano              | López                  |
| Camunas Jardines S.L.          | Mariano              | López                  |
| Dardena S.A.                   | Mariano              | López                  |
| Jardin de Flores               | Julian               | Bellinelli             |
| Flores Marivi                  | Felipe               | Rosas                  |
| Flowers, S.A                   | Felipe               | Rosas                  |
| Naturajardin                   | Julian               | Bellinelli             |
| Golf S.A.                      | José Manuel          | Martinez               |
| Americh Golf Management SL     | José Manuel          | Martinez               |
| Aloha                          | José Manuel          | Martinez               |
| El Prat                        | José Manuel          | Martinez               |
| Sotogrande                     | José Manuel          | Martinez               |
| Vivero Humanes                 | Julian               | Bellinelli             |
| Fuenla City                    | Felipe               | Rosas                  |
| Jardines y Mansiones Cactus SL | Lucio                | Campoamor              |
| Jardinerías Matías SL          | Lucio                | Campoamor              |
| Agrojardin                     | Julian               | Bellinelli             |
| Top Campo                      | Felipe               | Rosas                  |
| Jardineria Sara                | Felipe               | Rosas                  |
| Campohermoso                   | Julian               | Bellinelli             |
| france telecom                 | Lionel               | Narvaez                |
| Musée du Louvre                | Lionel               | Narvaez                |
| Tutifruti S.A                  | Mariko               | Kishi                  |
| Flores S.L.                    | Michael              | Bolton                 |
| The Magic Garden               | Michael              | Bolton                 |
| El Jardin Viviente S.L         | Mariko               | Kishi                  |
sqlite> 

```sql
Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

select distinct c.nombre_cliente, e.nombre as nombre_representante from cliente as c join empleado as e on c.codigo_empleado_rep_ventas=e.codigo_empleado join pago as p on c.codigo_cliente=p.codigo_cliente;  


select distinct c.nombre_cliente, e.nombre as nombre_representante from cliente as c, empleado as e, pago as p where c.codigo_empleado_rep_ventas=e.codigo_empleado and c.codigo_cliente=p.codigo_cliente;  
```
|         nombre_cliente         | nombre_representante |
|--------------------------------|----------------------|
| GoldFish Garden                | Walter Santiago      |
| Gardening Associates           | Walter Santiago      |
| Gerudo Valley                  | Lorena               |
| Tendo Garden                   | Lorena               |
| Beragua                        | Emmanuel             |
| Naturagua                      | Emmanuel             |
| Camunas Jardines S.L.          | Mariano              |
| Dardena S.A.                   | Mariano              |
| Jardin de Flores               | Julian               |
| Flores Marivi                  | Felipe               |
| Golf S.A.                      | José Manuel          |
| Sotogrande                     | José Manuel          |
| Jardines y Mansiones Cactus SL | Lucio                |
| Jardinerías Matías SL          | Lucio                |
| Agrojardin                     | Julian               |
| Jardineria Sara                | Felipe               |
| Tutifruti S.A                  | Mariko               |
| El Jardin Viviente S.L         | Mariko               |


```sql
Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

select c.nombre_cliente, e.nombre AS nombre_representante
FROM cliente AS c
JOIN empleado AS e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);


select c.nombre_cliente, e.nombre AS nombre_representante
FROM cliente AS c, empleado AS e where c.codigo_empleado_rep_ventas = e.codigo_empleado
and c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);


```
|       nombre_cliente        | nombre_representante |
|-----------------------------|----------------------|
| Lasas S.A.                  | Mariano              |
| Club Golf Puerta del hierro | Emmanuel             |
| DaraDistribuciones          | Emmanuel             |
| Madrileña de riegos         | Emmanuel             |
| Lasas S.A.                  | Mariano              |
| Flowers, S.A                | Felipe               |
| Naturajardin                | Julian               |
| Americh Golf Management SL  | José Manuel          |
| Aloha                       | José Manuel          |
| El Prat                     | José Manuel          |
| Vivero Humanes              | Julian               |
| Fuenla City                 | Felipe               |
| Top Campo                   | Felipe               |
| Campohermoso                | Julian               |
| france telecom              | Lionel               |
| Musée du Louvre             | Lionel               |
| Flores S.L.                 | Michael              |
| The Magic Garden            | Michael              |

```sql
Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

SELECT distinct c.nombre_cliente, e.nombre AS nombre_representante, o.ciudad AS ciudad_oficina
FROM cliente AS c
JOIN empleado AS e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
JOIN pago AS p ON c.codigo_cliente = p.codigo_cliente
JOIN oficina AS o ON e.codigo_oficina = o.codigo_oficina;


SELECT distinct c.nombre_cliente, e.nombre AS nombre_representante, o.ciudad AS ciudad_oficina
FROM cliente AS c, empleado AS e, pago as p, oficina as o where c.codigo_empleado_rep_ventas = e.codigo_empleado and c.codigo_cliente = p.codigo_cliente and e.codigo_oficina = o.codigo_oficina;


```
|         nombre_cliente         | nombre_representante |    ciudad_oficina    |
|--------------------------------|----------------------|----------------------|
| GoldFish Garden                | Walter Santiago      | San Francisco        |
| Gardening Associates           | Walter Santiago      | San Francisco        |
| Gerudo Valley                  | Lorena               | Boston               |
| Tendo Garden                   | Lorena               | Boston               |
| Beragua                        | Emmanuel             | Barcelona            |
| Naturagua                      | Emmanuel             | Barcelona            |
| Camunas Jardines S.L.          | Mariano              | Madrid               |
| Dardena S.A.                   | Mariano              | Madrid               |
| Jardin de Flores               | Julian               | Sydney               |
| Flores Marivi                  | Felipe               | Talavera de la Reina |
| Golf S.A.                      | José Manuel          | Barcelona            |
| Sotogrande                     | José Manuel          | Barcelona            |
| Jardines y Mansiones Cactus SL | Lucio                | Madrid               |
| Jardinerías Matías SL          | Lucio                | Madrid               |
| Agrojardin                     | Julian               | Sydney               |
| Jardineria Sara                | Felipe               | Talavera de la Reina |
| Tutifruti S.A                  | Mariko               | Sydney               |
| El Jardin Viviente S.L         | Mariko               | Sydney               |

```sql
Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

select distinct c.nombre_cliente, e.nombre as nombre_representante, o.ciudad as ciudad_oficina
from cliente as c
join empleado as e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina as o on e.codigo_oficina = o.codigo_oficina
left join pago as p on c.codigo_cliente = p.codigo_cliente
where p.codigo_cliente is null;

```

|       nombre_cliente        | nombre_representante |    ciudad_oficina    |
|-----------------------------|----------------------|----------------------|
| Lasas S.A.                  | Mariano              | Madrid               |
| Club Golf Puerta del hierro | Emmanuel             | Barcelona            |
| DaraDistribuciones          | Emmanuel             | Barcelona            |
| Madrileña de riegos         | Emmanuel             | Barcelona            |
| Flowers, S.A                | Felipe               | Talavera de la Reina |
| Naturajardin                | Julian               | Sydney               |
| Americh Golf Management SL  | José Manuel          | Barcelona            |
| Aloha                       | José Manuel          | Barcelona            |
| El Prat                     | José Manuel          | Barcelona            |
| Vivero Humanes              | Julian               | Sydney               |
| Fuenla City                 | Felipe               | Talavera de la Reina |
| Top Campo                   | Felipe               | Talavera de la Reina |
| Campohermoso                | Julian               | Sydney               |
| france telecom              | Lionel               | Paris                |
| Musée du Louvre             | Lionel               | Paris                |
| Flores S.L.                 | Michael              | San Francisco        |
| The Magic Garden            | Michael              | San Francisco        |


```sql
Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

select distinct o.codigo_oficina, o.ciudad, o.codigo_postal
from cliente as c
join empleado as e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina as o on e.codigo_oficina = o.codigo_oficina
where c.linea_direccion2 = 'Fuenlabrada';

```
| codigo_oficina |  ciudad   | codigo_postal |
|----------------|-----------|---------------|
| BCN-ES         | Barcelona | 08019         |



```sql
Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

select c.nombre_cliente, e.nombre as nombre_representante, o.ciudad as ciudad_oficina
from cliente as c
join empleado as e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina as o on e.codigo_oficina = o.codigo_oficina;

```
|         nombre_cliente         | nombre_representante |    ciudad_oficina    |
|--------------------------------|----------------------|----------------------|
| GoldFish Garden                | Walter Santiago      | San Francisco        |
| Gardening Associates           | Walter Santiago      | San Francisco        |
| Gerudo Valley                  | Lorena               | Boston               |
| Tendo Garden                   | Lorena               | Boston               |
| Lasas S.A.                     | Mariano              | Madrid               |
| Beragua                        | Emmanuel             | Barcelona            |
| Club Golf Puerta del hierro    | Emmanuel             | Barcelona            |
| Naturagua                      | Emmanuel             | Barcelona            |
| DaraDistribuciones             | Emmanuel             | Barcelona            |
| Madrileña de riegos            | Emmanuel             | Barcelona            |
| Lasas S.A.                     | Mariano              | Madrid               |
| Camunas Jardines S.L.          | Mariano              | Madrid               |
| Dardena S.A.                   | Mariano              | Madrid               |
| Jardin de Flores               | Julian               | Sydney               |
| Flores Marivi                  | Felipe               | Talavera de la Reina |
| Flowers, S.A                   | Felipe               | Talavera de la Reina |
| Naturajardin                   | Julian               | Sydney               |
| Golf S.A.                      | José Manuel          | Barcelona            |
| Americh Golf Management SL     | José Manuel          | Barcelona            |
| Aloha                          | José Manuel          | Barcelona            |
| El Prat                        | José Manuel          | Barcelona            |
| Sotogrande                     | José Manuel          | Barcelona            |
| Vivero Humanes                 | Julian               | Sydney               |
| Fuenla City                    | Felipe               | Talavera de la Reina |
| Jardines y Mansiones Cactus SL | Lucio                | Madrid               |
| Jardinerías Matías SL          | Lucio                | Madrid               |
| Agrojardin                     | Julian               | Sydney               |
| Top Campo                      | Felipe               | Talavera de la Reina |
| Jardineria Sara                | Felipe               | Talavera de la Reina |
| Campohermoso                   | Julian               | Sydney               |
| france telecom                 | Lionel               | Paris                |
| Musée du Louvre                | Lionel               | Paris                |
| Tutifruti S.A                  | Mariko               | Sydney               |
| Flores S.L.                    | Michael              | San Francisco        |
| The Magic Garden               | Michael              | San Francisco        |
| El Jardin Viviente S.L         | Mariko               | Sydney               |


```sql
select e.nombre as nombre_empleado, j.nombre AS nombre_jefe
FROM empleado AS e
join empleado AS j ON e.codigo_jefe = j.codigo_empleado;

```
| nombre_empleado | nombre_jefe |
|-----------------|-------------|
| Ruben           | Marcos      |
| Alberto         | Ruben       |
| Maria           | Ruben       |
| Felipe          | Alberto     |
| Juan Carlos     | Alberto     |
| Carlos          | Alberto     |
| Mariano         | Carlos      |
| Lucio           | Carlos      |
| Hilario         | Carlos      |
| Emmanuel        | Alberto     |
| José Manuel     | Emmanuel    |
| David           | Emmanuel    |
| Oscar           | Emmanuel    |
| Francois        | Alberto     |
| Lionel          | Francois    |
| Laurent         | Francois    |
| Michael         | Alberto     |
| Walter Santiago | Michael     |
| Hilary          | Alberto     |
| Marcus          | Hilary      |
| Lorena          | Hilary      |
| Nei             | Alberto     |
| Narumi          | Nei         |
| Takuma          | Nei         |
| Amy             | Alberto     |
| Larry           | Amy         |
| John            | Amy         |
| Kevin           | Alberto     |
| Julian          | Kevin       |
| Mariko          | Kevin       |

```sql
Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

select e.nombre as nombre_empleado,
       j.nombre as nombre_jefe,
       jj.nombre as nombre_jefe_de_jefe
from empleado as e
join empleado as j on e.codigo_jefe = j.codigo_empleado
join empleado as jj on j.codigo_jefe = jj.codigo_empleado;

```
| nombre_empleado | nombre_jefe | nombre_jefe_de_jefe |
|-----------------|-------------|---------------------|
| Alberto         | Ruben       | Marcos              |
| Maria           | Ruben       | Marcos              |
| Felipe          | Alberto     | Ruben               |
| Juan Carlos     | Alberto     | Ruben               |
| Carlos          | Alberto     | Ruben               |
| Mariano         | Carlos      | Alberto             |
| Lucio           | Carlos      | Alberto             |
| Hilario         | Carlos      | Alberto             |
| Emmanuel        | Alberto     | Ruben               |
| José Manuel     | Emmanuel    | Alberto             |
| David           | Emmanuel    | Alberto             |
| Oscar           | Emmanuel    | Alberto             |
| Francois        | Alberto     | Ruben               |
| Lionel          | Francois    | Alberto             |
| Laurent         | Francois    | Alberto             |
| Michael         | Alberto     | Ruben               |
| Walter Santiago | Michael     | Alberto             |
| Hilary          | Alberto     | Ruben               |
| Marcus          | Hilary      | Alberto             |
| Lorena          | Hilary      | Alberto             |
| Nei             | Alberto     | Ruben               |
| Narumi          | Nei         | Alberto             |
| Takuma          | Nei         | Alberto             |
| Amy             | Alberto     | Ruben               |
| Larry           | Amy         | Alberto             |
| John            | Amy         | Alberto             |
| Kevin           | Alberto     | Ruben               |
| Julian          | Kevin       | Alberto             |
| Mariko          | Kevin       | Alberto             |


```sql
Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

select distinct c.nombre_cliente
from cliente as c
join pedido as p on c.codigo_cliente = p.codigo_cliente
where p.fecha_entrega > p.fecha_esperada;

```
|         nombre_cliente         |
|--------------------------------|
| GoldFish Garden                |
| Beragua                        |
| Naturagua                      |
| Gardening Associates           |
| Camunas Jardines S.L.          |
| Gerudo Valley                  |
| Golf S.A.                      |
| Sotogrande                     |
| Jardines y Mansiones Cactus SL |
| Dardena S.A.                   |
| Jardinerías Matías SL          |
| Tutifruti S.A                  |
| Jardineria Sara                |
| Flores S.L.                    |
| El Jardin Viviente S.L         |


```sql
Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
```

# Consultas multitabla (inner join)


```sql
Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

select distinct c.nombre from cliente as c join pago as p on p.codigo_cliente=c.codigo_cliente
where p.codigo_cliente is null;

```

```sql
Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

```sql
Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

```sql
Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

```sql
Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

```sql
Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

```sql
Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

```sql
Devuelve un listado de los productos que nunca han aparecido en un pedido.

```sql
Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

```sql
Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

```sql
Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

```sql
Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
```sql

Consultas resumen (count,avg,...)

    ¿Cuántos empleados hay en la compañía?
    ¿Cuántos clientes tiene cada país?
    ¿Cuál fue el pago medio en 2009?
    ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
    Calcula el precio de venta del producto más caro y más barato en una misma consulta.
    Calcula el número de clientes que tiene la empresa.
    ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
    ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
    Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
    Calcula el número de clientes que no tiene asignado representante de ventas.
    Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
    Calcula el número de productos diferentes que hay en cada uno de los pedidos.
    Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
    Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
    La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IGIC y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IGIC es el 7 % de la base imponible, y el total la suma de los dos campos anteriores.
    La misma información que en la pregunta anterior, pero agrupada por código de producto.
    La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
    Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (7% IGIC).
    Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

Subconsultas en SQL

    Devuelve el nombre del cliente con mayor límite de crédito.
    Devuelve el nombre del producto que tenga el precio de venta más caro.
    Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)
    Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
    Devuelve el producto que más unidades tiene en stock.
    Devuelve el producto que menos unidades tiene en stock.
    Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
    Devuelve el nombre del cliente con mayor límite de crédito.
    Devuelve el nombre del producto que tenga el precio de venta más caro.
    Devuelve el producto que menos unidades tiene en stock.
    Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
    Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
    Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
    Devuelve un listado de los productos que nunca han aparecido en un pedido.
    Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
    Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
    Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
    Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
    Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
    Devuelve un listado de los productos que nunca han aparecido en un pedido.
    Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

Consultas variadas en SQL

    Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
    Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
    Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.
    Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
    Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.
    Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
    Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
