# Consultas a Realizar

# Consultas SQL sobre una tabla

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

select distinct codigo_cliente from pago where fecha_pago regexp "2008";

| codigo_cliente |
|----------------|
| 1              |
| 13             |
| 14             |
| 26             |


```


```sql
-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada. ?????
```
```sql

-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where fecha_entrega > fecha_esperada;

```
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
|---------------|----------------|----------------|---------------|
| 9             | 1              | 2008-12-27     | 2008-12-28    |
| 13            | 7              | 2009-01-14     | 2009-01-15    |
| 16            | 7              | 2009-01-07     | 2009-01-15    |
| 17            | 7              | 2009-01-09     | 2009-01-11    |
| 18            | 9              | 2009-01-06     | 2009-01-07    |
| 22            | 9              | 2009-01-11     | 2009-01-13    |
| 28            | 3              | 2009-02-17     | 2009-02-20    |
| 31            | 13             | 2008-09-30     | 2008-10-04    |
| 32            | 4              | 2007-01-19     | 2007-01-27    |
| 38            | 19             | 2009-03-06     | 2009-03-07    |
| 39            | 19             | 2009-03-07     | 2009-03-09    |
| 40            | 19             | 2009-03-10     | 2009-03-13    |
| 42            | 19             | 2009-03-23     | 2009-03-27    |
| 43            | 23             | 2009-03-26     | 2009-03-28    |
| 44            | 23             | 2009-03-27     | 2009-03-30    |
| 45            | 23             | 2009-03-04     | 2009-03-07    |
| 46            | 23             | 2009-03-04     | 2009-03-05    |
| 49            | 26             | 2008-07-22     | 2008-07-30    |
| 55            | 14             | 2009-01-10     | 2009-01-11    |
| 60            | 1              | 2008-12-27     | 2008-12-28    |
| 68            | 3              | 2009-02-17     | 2009-02-20    |
| 92            | 27             | 2009-04-30     | 2009-05-03    |
| 96            | 35             | 2008-04-12     | 2008-04-13    |
| 103           | 30             | 2009-01-20     | 2009-01-24    |
| 106           | 30             | 2009-05-15     | 2009-05-20    |
| 112           | 36             | 2009-04-06     | 2009-05-07    |
| 113           | 36             | 2008-11-09     | 2009-01-09    |
| 114           | 36             | 2009-01-29     | 2009-01-31    |
| 115           | 36             | 2009-01-26     | 2009-02-27    |
| 123           | 30             | 2009-01-20     | 2009-01-24    |
| 126           | 30             | 2009-05-15     | 2009-05-20    |
| 128           | 38             | 2008-12-10     | 2008-12-29    |


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
Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
```

```sql
select distinct c.nombre_cliente
FROM cliente AS c
LEFT JOIN pago AS p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;



```
|       nombre_cliente        |
|-----------------------------|
| Lasas S.A.                  |
| Club Golf Puerta del hierro |
| DaraDistribuciones          |
| Madrileña de riegos         |
| Flowers, S.A                |
| Naturajardin                |
| Americh Golf Management SL  |
| Aloha                       |
| El Prat                     |
| Vivero Humanes              |
| Fuenla City                 |
| Top Campo                   |
| Campohermoso                |
| france telecom              |
| Musée du Louvre             |
| Flores S.L.                 |
| The Magic Garden            |



```sql
Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
```
select distinct c.*
from cliente as c left join pago as pa on c.codigo_cliente = pa.codigo_cliente 
left join pedido as pe on c.codigo_cliente = pe.codigo_cliente where pa.codigo_cliente is null 
and pe.codigo_cliente is null;

| codigo_cliente |       nombre_cliente        | nombre_contacto | apellido_contacto |    telefono    |      fax       |     linea_direccion1     | linea_direccion2 |        ciudad        |  region   |      pais      | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|-----------------------------|-----------------|-------------------|----------------|----------------|--------------------------|------------------|----------------------|-----------|----------------|---------------|----------------------------|----------------|
| 6              | Lasas S.A.                  | Antonio         | Lasas             | 34916540145    | 34914851312    | C/Leganes 15             |                  | Fuenlabrada          | Madrid    | Spain          | 28945         | 8                          | 154310         |
| 8              | Club Golf Puerta del hierro | Paco            | Lopez             | 62456810       | 919535678      | C/sinesio delgado        | Madrid           | Madrid               | Madrid    | Spain          | 28930         | 11                         | 40000          |
| 10             | DaraDistribuciones          | David           | Serrano           | 675598001      | 916421756      | C/azores                 | Fuenlabrada      | Madrid               | Madrid    | Spain          | 28946         | 11                         | 50000          |
| 11             | Madrileña de riegos         | Jose            | Tacaño            | 655983045      | 916689215      | C/Lagañas                | Fuenlabrada      | Madrid               | Madrid    | Spain          | 28943         | 11                         | 20000          |
| 12             | Lasas S.A.                  | Antonio         | Lasas             | 34916540145    | 34914851312    | C/Leganes 15             |                  | Fuenlabrada          | Madrid    | Spain          | 28945         | 8                          | 154310         |
| 17             | Flowers, S.A                | Beatriz         | Fernandez         | 698754159      | 978453216      | C/Luis Salquillo4        |                  | Montornes del valles | Barcelona | Spain          | 24586         | 5                          | 3500           |
| 18             | Naturajardin                | Victoria        | Cruz              | 612343529      | 916548735      | Plaza Magallón 15        |                  | Madrid               | Madrid    | Spain          | 28011         | 30                         | 5050           |
| 20             | Americh Golf Management SL  | Mario           | Suarez            | 964493072      | 964493063      | C/Letardo                |                  | Barcelona            | Cataluña  | Spain          | 12320         | 12                         | 20000          |
| 21             | Aloha                       | Cristian        | Rodrigez          | 916485852      | 914489898      | C/Roman 3                |                  | Canarias             | Canarias  | Spain          | 35488         | 12                         | 50000          |
| 22             | El Prat                     | Francisco       | Camacho           | 916882323      | 916493211      | Avenida Tibidabo         |                  | Barcelona            | Cataluña  | Spain          | 12320         | 12                         | 30000          |
| 24             | Vivero Humanes              | Federico        | Gomez             | 654987690      | 916040875      | C/Miguel Echegaray 54    |                  | Humanes              | Madrid    | Spain          | 28970         | 30                         | 7430           |
| 25             | Fuenla City                 | Tony            | Muñoz Mena        | 675842139      | 915483754      | C/Callo 52               |                  | Fuenlabrada          | Madrid    | Spain          | 28574         | 5                          | 4500           |
| 29             | Top Campo                   | Joseluis        | Sanchez           | 685746512      | 974315924      | C/Ibiza 32               |                  | Humanes              | Madrid    | Spain          | 28574         | 5                          | 5500           |
| 31             | Campohermoso                | Luis            | Jimenez           | 645925376      | 916159116      | C/Peru 78                |                  | Fuenlabrada          | Madrid    | Spain          | 28945         | 30                         | 3250           |
| 32             | france telecom              | FraÃ§ois        | Toulou            | (33)5120578961 | (33)5120578961 | 6 place d Alleray 15Ã¨me |                  | Paris                |           | France         | 75010         | 16                         | 10000          |
| 33             | Musée du Louvre             | Pierre          | Delacroux         | (33)0140205050 | (33)0140205442 | Quai du Louvre           |                  | Paris                |           | France         | 75058         | 16                         | 30000          |
| 37             | The Magic Garden            | Richard         | Mcain             | 926523468      | 9364875882     | Lihgting Park            |                  | London               | London    | United Kingdom | 65930         | 18                         | 10000          |
sqlite> 



```sql
Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

select distinct e.*
from empleado as e
left join oficina as o on e.codigo_oficina = o.codigo_oficina
where e.codigo_oficina is null;

-- NO hay coincidencias, todos tienen oficina

```



```sql
Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

select e.* from empleado as e
left join cliente as c on e.codigo_empleado = c.codigo_empleado_rep_ventas
where c.codigo_empleado_rep_ventas is null;

```
| codigo_empleado |   nombre    | apellido1  | apellido2 | extension |           email           | codigo_oficina | codigo_jefe |        puesto         |
|-----------------|-------------|------------|-----------|-----------|---------------------------|----------------|-------------|-----------------------|
| 1               | Marcos      | Magaña     | Perez     | 3897      | marcos@jardineria.es      | TAL-ES         |             | Director General      |
| 2               | Ruben       | López      | Martinez  | 2899      | rlopez@jardineria.es      | TAL-ES         | 1           | Subdirector Marketing |
| 3               | Alberto     | Soria      | Carrasco  | 2837      | asoria@jardineria.es      | TAL-ES         | 2           | Subdirector Ventas    |
| 4               | Maria       | Solís      | Jerez     | 2847      | msolis@jardineria.es      | TAL-ES         | 2           | Secretaria            |
| 6               | Juan Carlos | Ortiz      | Serrano   | 2845      | cortiz@jardineria.es      | TAL-ES         | 3           | Representante Ventas  |
| 7               | Carlos      | Soria      | Jimenez   | 2444      | csoria@jardineria.es      | MAD-ES         | 3           | Director Oficina      |
| 10              | Hilario     | Rodriguez  | Huertas   | 2444      | hrodriguez@jardineria.es  | MAD-ES         | 7           | Representante Ventas  |
| 13              | David       | Palma      | Aceituno  | 2519      | dpalma@jardineria.es      | BCN-ES         | 11          | Representante Ventas  |
| 14              | Oscar       | Palma      | Aceituno  | 2519      | opalma@jardineria.es      | BCN-ES         | 11          | Representante Ventas  |
| 15              | Francois    | Fignon     |           | 9981      | ffignon@gardening.com     | PAR-FR         | 3           | Director Oficina      |
| 17              | Laurent     | Serra      |           | 9982      | lserra@gardening.com      | PAR-FR         | 15          | Representante Ventas  |
| 20              | Hilary      | Washington |           | 7565      | hwashington@gardening.com | BOS-USA        | 3           | Director Oficina      |
| 21              | Marcus      | Paxton     |           | 7565      | mpaxton@gardening.com     | BOS-USA        | 20          | Representante Ventas  |
| 23              | Nei         | Nishikori  |           | 8734      | nnishikori@gardening.com  | TOK-JP         | 3           | Director Oficina      |
| 24              | Narumi      | Riko       |           | 8734      | nriko@gardening.com       | TOK-JP         | 23          | Representante Ventas  |
| 25              | Takuma      | Nomura     |           | 8735      | tnomura@gardening.com     | TOK-JP         | 23          | Representante Ventas  |
| 26              | Amy         | Johnson    |           | 3321      | ajohnson@gardening.com    | LON-UK         | 3           | Director Oficina      |
| 27              | Larry       | Westfalls  |           | 3322      | lwestfalls@gardening.com  | LON-UK         | 26          | Representante Ventas  |
| 28              | John        | Walton     |           | 3322      | jwalton@gardening.com     | LON-UK         | 26          | Representante Ventas  |
| 29              | Kevin       | Fallmer    |           | 3210      | kfalmer@gardening.com     | SYD-AU         | 3           | Director Oficina      |

```sql
Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

select e.*, o.*
from empleado as e
left join cliente as c on e.codigo_empleado = c.codigo_empleado_rep_ventas
join oficina as o on e.codigo_oficina = o.codigo_oficina
where c.codigo_empleado_rep_ventas is null;

```
| codigo_empleado |   nombre    | apellido1  | apellido2 | extension |           email           | codigo_oficina | codigo_jefe |        puesto         | codigo_oficina |        ciudad        |    pais    |      region       | codigo_postal |    telefono     |       linea_direccion1       |  linea_direccion2   |
|-----------------|-------------|------------|-----------|-----------|---------------------------|----------------|-------------|-----------------------|----------------|----------------------|------------|-------------------|---------------|-----------------|------------------------------|---------------------|
| 1               | Marcos      | Magaña     | Perez     | 3897      | marcos@jardineria.es      | TAL-ES         |             | Director General      | TAL-ES         | Talavera de la Reina | España     | Castilla-LaMancha | 45632         | +34 925 867231  | Francisco Aguirre, 32        | 5º piso (exterior)  |
| 2               | Ruben       | López      | Martinez  | 2899      | rlopez@jardineria.es      | TAL-ES         | 1           | Subdirector Marketing | TAL-ES         | Talavera de la Reina | España     | Castilla-LaMancha | 45632         | +34 925 867231  | Francisco Aguirre, 32        | 5º piso (exterior)  |
| 3               | Alberto     | Soria      | Carrasco  | 2837      | asoria@jardineria.es      | TAL-ES         | 2           | Subdirector Ventas    | TAL-ES         | Talavera de la Reina | España     | Castilla-LaMancha | 45632         | +34 925 867231  | Francisco Aguirre, 32        | 5º piso (exterior)  |
| 4               | Maria       | Solís      | Jerez     | 2847      | msolis@jardineria.es      | TAL-ES         | 2           | Secretaria            | TAL-ES         | Talavera de la Reina | España     | Castilla-LaMancha | 45632         | +34 925 867231  | Francisco Aguirre, 32        | 5º piso (exterior)  |
| 6               | Juan Carlos | Ortiz      | Serrano   | 2845      | cortiz@jardineria.es      | TAL-ES         | 3           | Representante Ventas  | TAL-ES         | Talavera de la Reina | España     | Castilla-LaMancha | 45632         | +34 925 867231  | Francisco Aguirre, 32        | 5º piso (exterior)  |
| 7               | Carlos      | Soria      | Jimenez   | 2444      | csoria@jardineria.es      | MAD-ES         | 3           | Director Oficina      | MAD-ES         | Madrid               | España     | Madrid            | 28032         | +34 91 7514487  | Bulevar Indalecio Prieto, 32 |                     |
| 10              | Hilario     | Rodriguez  | Huertas   | 2444      | hrodriguez@jardineria.es  | MAD-ES         | 7           | Representante Ventas  | MAD-ES         | Madrid               | España     | Madrid            | 28032         | +34 91 7514487  | Bulevar Indalecio Prieto, 32 |                     |
| 13              | David       | Palma      | Aceituno  | 2519      | dpalma@jardineria.es      | BCN-ES         | 11          | Representante Ventas  | BCN-ES         | Barcelona            | España     | Barcelona         | 08019         | +34 93 3561182  | Avenida Diagonal, 38         | 3A escalera Derecha |
| 14              | Oscar       | Palma      | Aceituno  | 2519      | opalma@jardineria.es      | BCN-ES         | 11          | Representante Ventas  | BCN-ES         | Barcelona            | España     | Barcelona         | 08019         | +34 93 3561182  | Avenida Diagonal, 38         | 3A escalera Derecha |
| 15              | Francois    | Fignon     |           | 9981      | ffignon@gardening.com     | PAR-FR         | 3           | Director Oficina      | PAR-FR         | Paris                | Francia    | EMEA              | 75017         | +33 14 723 4404 | 29 Rue Jouffroy d'abbans     |                     |
| 17              | Laurent     | Serra      |           | 9982      | lserra@gardening.com      | PAR-FR         | 15          | Representante Ventas  | PAR-FR         | Paris                | Francia    | EMEA              | 75017         | +33 14 723 4404 | 29 Rue Jouffroy d'abbans     |                     |
| 20              | Hilary      | Washington |           | 7565      | hwashington@gardening.com | BOS-USA        | 3           | Director Oficina      | BOS-USA        | Boston               | EEUU       | MA                | 02108         | +1 215 837 0825 | 1550 Court Place             | Suite 102           |
| 21              | Marcus      | Paxton     |           | 7565      | mpaxton@gardening.com     | BOS-USA        | 20          | Representante Ventas  | BOS-USA        | Boston               | EEUU       | MA                | 02108         | +1 215 837 0825 | 1550 Court Place             | Suite 102           |
| 23              | Nei         | Nishikori  |           | 8734      | nnishikori@gardening.com  | TOK-JP         | 3           | Director Oficina      | TOK-JP         | Tokyo                | Japón      | Chiyoda-Ku        | 102-8578      | +81 33 224 5000 | 4-1 Kioicho                  |                     |
| 24              | Narumi      | Riko       |           | 8734      | nriko@gardening.com       | TOK-JP         | 23          | Representante Ventas  | TOK-JP         | Tokyo                | Japón      | Chiyoda-Ku        | 102-8578      | +81 33 224 5000 | 4-1 Kioicho                  |                     |
| 25              | Takuma      | Nomura     |           | 8735      | tnomura@gardening.com     | TOK-JP         | 23          | Representante Ventas  | TOK-JP         | Tokyo                | Japón      | Chiyoda-Ku        | 102-8578      | +81 33 224 5000 | 4-1 Kioicho                  |                     |
| 26              | Amy         | Johnson    |           | 3321      | ajohnson@gardening.com    | LON-UK         | 3           | Director Oficina      | LON-UK         | Londres              | Inglaterra | EMEA              | EC2N 1HN      | +44 20 78772041 | 52 Old Broad Street          | Ground Floor        |
| 27              | Larry       | Westfalls  |           | 3322      | lwestfalls@gardening.com  | LON-UK         | 26          | Representante Ventas  | LON-UK         | Londres              | Inglaterra | EMEA              | EC2N 1HN      | +44 20 78772041 | 52 Old Broad Street          | Ground Floor        |
| 28              | John        | Walton     |           | 3322      | jwalton@gardening.com     | LON-UK         | 26          | Representante Ventas  | LON-UK         | Londres              | Inglaterra | EMEA              | EC2N 1HN      | +44 20 78772041 | 52 Old Broad Street          | Ground Floor        |
| 29              | Kevin       | Fallmer    |           | 3210      | kfalmer@gardening.com     | SYD-AU         | 3           | Director Oficina      | SYD-AU         | Sydney               | Australia  | APAC              | NSW 2010      | +61 2 9264 2451 | 5-11 Wentworth Avenue        | Floor #2            |


```sql
Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

select e.* from empleado as e
left join oficina as o on e.codigo_oficina = o.codigo_oficina
left join cliente as c on e.codigo_empleado = c.codigo_empleado_rep_ventas
where o.codigo_oficina is null or c.codigo_empleado_rep_ventas is null;

```
| codigo_empleado |   nombre    | apellido1  | apellido2 | extension |           email           | codigo_oficina | codigo_jefe |        puesto         |
|-----------------|-------------|------------|-----------|-----------|---------------------------|----------------|-------------|-----------------------|
| 1               | Marcos      | Magaña     | Perez     | 3897      | marcos@jardineria.es      | TAL-ES         |             | Director General      |
| 2               | Ruben       | López      | Martinez  | 2899      | rlopez@jardineria.es      | TAL-ES         | 1           | Subdirector Marketing |
| 3               | Alberto     | Soria      | Carrasco  | 2837      | asoria@jardineria.es      | TAL-ES         | 2           | Subdirector Ventas    |
| 4               | Maria       | Solís      | Jerez     | 2847      | msolis@jardineria.es      | TAL-ES         | 2           | Secretaria            |
| 6               | Juan Carlos | Ortiz      | Serrano   | 2845      | cortiz@jardineria.es      | TAL-ES         | 3           | Representante Ventas  |
| 7               | Carlos      | Soria      | Jimenez   | 2444      | csoria@jardineria.es      | MAD-ES         | 3           | Director Oficina      |
| 10              | Hilario     | Rodriguez  | Huertas   | 2444      | hrodriguez@jardineria.es  | MAD-ES         | 7           | Representante Ventas  |
| 13              | David       | Palma      | Aceituno  | 2519      | dpalma@jardineria.es      | BCN-ES         | 11          | Representante Ventas  |
| 14              | Oscar       | Palma      | Aceituno  | 2519      | opalma@jardineria.es      | BCN-ES         | 11          | Representante Ventas  |
| 15              | Francois    | Fignon     |           | 9981      | ffignon@gardening.com     | PAR-FR         | 3           | Director Oficina      |
| 17              | Laurent     | Serra      |           | 9982      | lserra@gardening.com      | PAR-FR         | 15          | Representante Ventas  |
| 20              | Hilary      | Washington |           | 7565      | hwashington@gardening.com | BOS-USA        | 3           | Director Oficina      |
| 21              | Marcus      | Paxton     |           | 7565      | mpaxton@gardening.com     | BOS-USA        | 20          | Representante Ventas  |
| 23              | Nei         | Nishikori  |           | 8734      | nnishikori@gardening.com  | TOK-JP         | 3           | Director Oficina      |
| 24              | Narumi      | Riko       |           | 8734      | nriko@gardening.com       | TOK-JP         | 23          | Representante Ventas  |
| 25              | Takuma      | Nomura     |           | 8735      | tnomura@gardening.com     | TOK-JP         | 23          | Representante Ventas  |
| 26              | Amy         | Johnson    |           | 3321      | ajohnson@gardening.com    | LON-UK         | 3           | Director Oficina      |
| 27              | Larry       | Westfalls  |           | 3322      | lwestfalls@gardening.com  | LON-UK         | 26          | Representante Ventas  |
| 28              | John        | Walton     |           | 3322      | jwalton@gardening.com     | LON-UK         | 26          | Representante Ventas  |
| 29              | Kevin       | Fallmer    |           | 3210      | kfalmer@gardening.com     | SYD-AU         | 3           | Director Oficina      |


```sql
Devuelve un listado de los productos que nunca han aparecido en un pedido.

saelect distinct p.* from producto AS p eft join detalle_pedido AS dp ON p.codigo_producto = dp.codigo_producto
WHERE dp.codigo_producto is null;

````
| codigo_producto |                           nombre                            |     gama     | dimensiones |         proveedor         |                                                                                                                                                                                                                                                                                                                                                                 descripcion                                                                                                                                                                                                                                                                                                                                                                  | cantidad_en_stock | precio_venta | precio_proveedor |
|-----------------|-------------------------------------------------------------|--------------|-------------|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------|--------------|------------------|
| FR-104          | Olea-Olivos                                                 | Frutales     | 12/4        | Frutales Talavera S.A     | Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.                                                                                     | 50                | 49           | 39               |
| FR-14           | Calamondin Mini                                             | Frutales     |             | Frutales Talavera S.A     | Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son pequeñas, elípticas de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocas semillas, esféricos u ovales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..                                                                                                                                                                                                                      | 15                | 10           | 8                |
| FR-19           | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              | Frutales     |             | NaranjasValencianas.com   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 350               | 4            | 3                |
| FR-20           | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          | Frutales     |             | Frutales Talavera S.A     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 350               | 4            | 3                |
| FR-21           | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte | Frutales     |             | Frutales Talavera S.A     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 350               | 4            | 3                |
| FR-24           | Albaricoquero Corbato                                       | Frutales     |             | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | 400               | 8            | 6                |
| FR-25           | Albaricoquero Moniqui                                       | Frutales     |             | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | 400               | 8            | 6                |
| FR-26           | Albaricoquero Kurrot                                        | Frutales     |             | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | 400               | 8            | 6                |
| FR-27           | Cerezo Burlat                                               | Frutales     |             | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 | 400               | 8            | 6                |
| FR-28           | Cerezo Picota                                               | Frutales     |             | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 | 400               | 8            | 6                |
| FR-30           | Ciruelo R. Claudia Verde                                    | Frutales     |             | Frutales Talavera S.A     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 400               | 8            | 6                |
| FR-32           | Ciruelo Golden Japan                                        | Frutales     |             | Frutales Talavera S.A     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 400               | 8            | 6                |
| FR-35           | Ciruelo Claudia Negra                                       | Frutales     |             | Frutales Talavera S.A     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 400               | 8            | 6                |
| FR-38           | Higuera Verdal                                              | Frutales     |             | Frutales Talavera S.A     | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                    | 400               | 9            | 7                |
| FR-39           | Higuera Breva                                               | Frutales     |             | Frutales Talavera S.A     | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                    | 400               | 9            | 7                |
| FR-44           | Melocotonero Spring Crest                                   | Frutales     |             | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             | 400               | 8            | 6                |
| FR-46           | Melocotonero Federica                                       | Frutales     |             | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             | 400               | 8            | 6                |
| FR-49           | Parra Uva de Mesa                                           | Frutales     |             | Frutales Talavera S.A     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 400               | 8            | 6                |
| FR-5            | Mandarino -Plantón joven                                    | Frutales     |             | Frutales Talavera S.A     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 15                | 6            | 4                |
| FR-50           | Peral Castell                                               | Frutales     |             | Frutales Talavera S.A     | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                     | 400               | 8            | 6                |
| FR-51           | Peral Williams                                              | Frutales     |             | Frutales Talavera S.A     | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                     | 400               | 8            | 6                |
| FR-52           | Peral Conference                                            | Frutales     |             | Frutales Talavera S.A     | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                     | 400               | 8            | 6                |
| FR-55           | Olivo Cipresino                                             | Frutales     |             | Frutales Talavera S.A     | Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.                                                                                     | 400               | 8            | 6                |
| FR-59           | Albaricoquero                                               | Frutales     | 10/12       | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | 200               | 22           | 17               |
| FR-61           | Albaricoquero                                               | Frutales     | 14/16       | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | 200               | 49           | 39               |
| FR-62           | Albaricoquero                                               | Frutales     | 16/18       | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | 200               | 70           | 56               |
| FR-63           | Cerezo                                                      | Frutales     | 8/10        | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 | 300               | 11           | 8                |
| FR-65           | Cerezo                                                      | Frutales     | 12/14       | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 | 200               | 32           | 25               |
| FR-68           | Cerezo                                                      | Frutales     | 18/20       | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 | 50                | 80           | 64               |
| FR-70           | Ciruelo                                                     | Frutales     | 8/10        | Frutales Talavera S.A     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 50                | 11           | 8                |
| FR-73           | Granado                                                     | Frutales     | 8/10        | Frutales Talavera S.A     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.                                                                                                                                                                                                                                                                      | 50                | 13           | 10               |
| FR-74           | Granado                                                     | Frutales     | 10/12       | Frutales Talavera S.A     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.                                                                                                                                                                                                                                                                      | 50                | 22           | 17               |
| FR-76           | Granado                                                     | Frutales     | 14/16       | Frutales Talavera S.A     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.                                                                                                                                                                                                                                                                      | 50                | 49           | 39               |
| FR-83           | Higuera                                                     | Frutales     | 18/20       | Frutales Talavera S.A     | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                    | 50                | 80           | 64               |
| FR-88           | Manzano                                                     | Frutales     | 12/14       | Frutales Talavera S.A     | alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina                                                                                                                                                                                                                                 | 50                | 32           | 25               |
| FR-92           | Melocotonero                                                | Frutales     | 8/10        | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             | 50                | 11           | 8                |
| FR-93           | Melocotonero                                                | Frutales     | 10/12       | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             | 50                | 22           | 17               |
| FR-95           | Melocotonero                                                | Frutales     | 14/16       | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             | 50                | 49           | 39               |
| FR-96           | Membrillero                                                 | Frutales     | 8/10        | Frutales Talavera S.A     | arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 50                | 11           | 8                |
| FR-97           | Membrillero                                                 | Frutales     | 10/12       | Frutales Talavera S.A     | arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 50                | 22           | 17               |
| FR-98           | Membrillero                                                 | Frutales     | 12/14       | Frutales Talavera S.A     | arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 50                | 32           | 25               |
| FR-99           | Membrillero                                                 | Frutales     | 14/16       | Frutales Talavera S.A     | arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 50                | 49           | 39               |
| OR-001          | Arbustos Mix Maceta                                         | Ornamentales | 40-60       | Valencia Garden Service   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 25                | 5            | 4                |
| OR-100          | Mimosa Injerto CLASICA Dealbata                             | Ornamentales | 100-110     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | 100               | 12           | 9                |
| OR-103          | Mimosa Semilla Bayleyana                                    | Ornamentales | 200-225     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | 100               | 10           | 8                |
| OR-105          | Mimosa Semilla Espectabilis                                 | Ornamentales | 160-170     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | 100               | 6            | 4                |
| OR-106          | Mimosa Semilla Longifolia                                   | Ornamentales | 200-225     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | 100               | 10           | 8                |
| OR-107          | Mimosa Semilla Floribunda 4 estaciones                      | Ornamentales | 120-140     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | 100               | 6            | 4                |
| OR-108          | Abelia Floribunda                                           | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 5            | 4                |
| OR-109          | Callistemom (Mix)                                           | Ornamentales | 35-45       | Viveros EL OASIS          | Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ahí lo de \"llorón\")..                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | 100               | 5            | 4                |
| OR-110          | Callistemom (Mix)                                           | Ornamentales | 40-60       | Viveros EL OASIS          | Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ahí lo de \"llorón\")..                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | 100               | 2            | 1                |
| OR-111          | Corylus Avellana \"Contorta\"                               | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 5            | 4                |
| OR-112          | Escallonia (Mix)                                            | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 120               | 5            | 4                |
| OR-113          | Evonimus Emerald Gayeti                                     | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 120               | 5            | 4                |
| OR-114          | Evonimus Pulchellus                                         | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 120               | 5            | 4                |
| OR-117          | Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                | Ornamentales | 35-45       | Viveros EL OASIS          | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo.                                                                                                                                                                                                                                                                                                                                                                    | 120               | 7            | 5                |
| OR-118          | Hibiscus Syriacus \"Pink Giant\" Rosa                       | Ornamentales | 35-45       | Viveros EL OASIS          | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo.                                                                                                                                                                                                                                                                                                                                                                    | 120               | 7            | 5                |
| OR-121          | Lonicera Nitida \"Maigrum\"                                 | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 120               | 5            | 4                |
| OR-124          | Prunus pisardii                                             | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 120               | 5            | 4                |
| OR-126          | Weigelia \"Bristol Ruby\"                                   | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 120               | 5            | 4                |
| OR-131          | Leptospermum formado PIRAMIDE                               | Ornamentales | 80-100      | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 18           | 14               |
| OR-132          | Leptospermum COPA                                           | Ornamentales | 110/120     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 18           | 14               |
| OR-133          | Nerium oleander-CALIDAD \"GARDEN\"                          | Ornamentales | 40-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 2            | 1                |
| OR-134          | Nerium Oleander Arbusto GRANDE                              | Ornamentales | 160-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 38           | 30               |
| OR-135          | Nerium oleander COPA  Calibre 6/8                           | Ornamentales | 50-60       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 5            | 4                |
| OR-137          | ROSAL TREPADOR                                              | Ornamentales |             | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 4            | 3                |
| OR-138          | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              | Ornamentales |             | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 4            | 3                |
| OR-142          | Solanum Jazminoide                                          | Ornamentales | 150-160     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 2            | 1                |
| OR-143          | Wisteria Sinensis  azul, rosa, blanca                       | Ornamentales |             | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 9            | 7                |
| OR-144          | Wisteria Sinensis INJERTADAS DECÃ“                          | Ornamentales | 140-150     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 12           | 9                |
| OR-145          | Bougamvillea Sanderiana Tutor                               | Ornamentales | 80-100      | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 2            | 1                |
| OR-148          | Bougamvillea Sanderiana Espaldera                           | Ornamentales | 45-50       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 7            | 5                |
| OR-149          | Bougamvillea Sanderiana Espaldera                           | Ornamentales | 140-150     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 17           | 13               |
| OR-151          | Bougamvillea Sanderiana, 3 tut. piramide                    | Ornamentales |             | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 6            | 4                |
| OR-153          | Expositor Árboles clima mediterráneo                        | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 6            | 4                |
| OR-154          | Expositor Árboles borde del mar                             | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 6            | 4                |
| OR-158          | Brachychiton Acerifolius                                    | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 6            | 4                |
| OR-161          | Cassia Corimbosa                                            | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 6            | 4                |
| OR-162          | Cassia Corimbosa                                            | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 10           | 8                |
| OR-163          | Chitalpa Summer Bells                                       | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 10           | 8                |
| OR-164          | Erytrina Kafra                                              | Ornamentales | 170-180     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-166          | Eucalyptus Citriodora                                       | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-167          | Eucalyptus Ficifolia                                        | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-169          | Hibiscus Syriacus  Var. Injertadas 1 Tallo                  | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 12           | 9                |
| OR-170          | Lagunaria Patersonii                                        | Ornamentales | 140-150     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-171          | Lagunaria Patersonii                                        | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 10           | 8                |
| OR-173          | Morus Alba                                                  | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-175          | Platanus Acerifolia                                         | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 10           | 8                |
| OR-178          | Salix Babylonica  Pendula                                   | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-180          | Tamarix  Ramosissima Pink Cascade                           | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-182          | Tecoma Stands                                               | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-183          | Tecoma Stands                                               | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 10           | 8                |
| OR-184          | Tipuana Tipu                                                | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-185          | Pleioblastus distichus-Bambú enano                          | Ornamentales | 15-20       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-187          | Sasa palmata                                                | Ornamentales | 40-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 10           | 8                |
| OR-189          | Phylostachys aurea                                          | Ornamentales | 180-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 22           | 17               |
| OR-190          | Phylostachys aurea                                          | Ornamentales | 250-300     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 32           | 25               |
| OR-191          | Phylostachys Bambusa Spectabilis                            | Ornamentales | 180-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 24           | 19               |
| OR-192          | Phylostachys biseti                                         | Ornamentales | 160-170     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 22           | 17               |
| OR-194          | Pseudosasa japonica (Metake)                                | Ornamentales | 225-250     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 20           | 16               |
| OR-195          | Pseudosasa japonica (Metake)                                | Ornamentales | 30-40       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-197          | Cedrus Deodara \"Feeling Blue\" Novedad                     | Ornamentales | rastrero    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 12           | 9                |
| OR-198          | Juniperus chinensis \"Blue Alps\"                           | Ornamentales | 20-30       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 4            | 3                |
| OR-199          | Juniperus Chinensis Stricta                                 | Ornamentales | 20-30       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 4            | 3                |
| OR-201          | Juniperus squamata \"Blue Star\"                            | Ornamentales | 20-30       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 4            | 3                |
| OR-202          | Juniperus x media Phitzeriana verde                         | Ornamentales | 20-30       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 4            | 3                |
| OR-212          | Bismarckia Nobilis                                          | Ornamentales | 200 - 220   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 4                 | 217          | 173              |
| OR-215          | Brahea Armata                                               | Ornamentales | 120 - 140   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 112          | 89               |
| OR-216          | Brahea Edulis                                               | Ornamentales | 80 - 100    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 19           | 15               |
| OR-219          | Butia Capitata                                              | Ornamentales | 90 - 110    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 29           | 23               |
| OR-220          | Butia Capitata                                              | Ornamentales | 90 - 120    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 36           | 28               |
| OR-221          | Butia Capitata                                              | Ornamentales | 85 - 105    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 59           | 47               |
| OR-223          | Chamaerops Humilis                                          | Ornamentales | 40 - 45     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 4            | 3                |
| OR-224          | Chamaerops Humilis                                          | Ornamentales | 50 - 60     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 7            | 5                |
| OR-228          | Chamaerops Humilis \"Cerifera\"                             | Ornamentales | 70 - 80     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 32           | 25               |
| OR-229          | Chrysalidocarpus Lutescens -ARECA                           | Ornamentales | 130 - 150   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 22           | 17               |
| OR-230          | Cordyline Australis -DRACAENA                               | Ornamentales | 190 - 210   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 38           | 30               |
| OR-231          | Cycas Revoluta                                              | Ornamentales | 55 - 65     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 15           | 12               |
| OR-232          | Cycas Revoluta                                              | Ornamentales | 80 - 90     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 34           | 27               |
| OR-233          | Dracaena Drago                                              | Ornamentales | 60 - 70     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 1                 | 13           | 10               |
| OR-235          | Dracaena Drago                                              | Ornamentales | 150 - 175   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 2                 | 92           | 73               |
| OR-238          | Livistonia Decipiens                                        | Ornamentales | 90 - 110    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 19           | 15               |
| OR-239          | Livistonia Decipiens                                        | Ornamentales | 180 - 200   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 49           | 39               |
| OR-242          | Rhaphis Excelsa                                             | Ornamentales | 80 - 100    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 21           | 16               |
| OR-244          | Sabal Minor                                                 | Ornamentales | 60 - 75     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 11           | 8                |
| OR-245          | Sabal Minor                                                 | Ornamentales | 120 - 140   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 34           | 27               |
| OR-246          | Trachycarpus Fortunei                                       | Ornamentales | 90 - 105    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 18           | 14               |
| OR-248          | Washingtonia Robusta                                        | Ornamentales | 60 - 70     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 15                | 3            | 2                |
| OR-251          | Zamia Furfuracaea                                           | Ornamentales | 90 - 110    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 15                | 168          | 134              |


```sql

Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.


select distinct p.nombre, p.descripcion, gp.imagen from producto as p 
join detalle_pedido as dp on p.codigo_producto=dp.codigo_producto left join gama_producto as gp on p.gama=gp.gama;

```

|                           nombre                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        descripcion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | imagen |
|-------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|
| Cerezo                                                      | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                                                                                                                                                                                                                                                                                                                               |        |
| Camelia japonica                                            | Arbusto excepcional por su floración otoñal, invernal o primaveral. Flores: Las flores son solitarias, aparecen en el ápice de cada rama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos 7-12 cm de diÃ metro y tienen 5 sépalos y 5 pétalos. Estambres numerosos unidos en la mitad o en 2/3 de su longitud.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |        |
| Pitimini rojo                                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Phoenix Canariensis                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Mimosa DEALBATA Gaulois Astier                              | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente...                                                                                                                                                                                                                                                                                                               |        |
| Naranjo calibre 8/10                                        | El naranjo es un árbol pequeño, que no supera los 3-5 metros de altura, con una copa compacta, cónica, transformada en esérica gracias a la poda. Su tronco es de color gris y liso, y las hojas son perennes, coriáceas, de un verde intenso y brillante, con forma oval o elíptico-lanceolada. Poseen, en el caso del naranjo amargo, un típico peciolo alado en forma de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y menos patente.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |        |
| Manzano Starking Delicious                                  | alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |        |
| Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Brachychiton Discolor                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Chamaerops Humilis                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Trachycarpus Fortunei                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Nogal Común                                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Lonicera Pileata                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Philadelphus \"Virginal\"                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Bismarckia Nobilis                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Brahea Edulis                                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Butia Capitata                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Ciruelo Santa Rosa                                          | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |        |
| Ciruelo Reina C. De Ollins                                  | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |        |
| Expositor Árboles clima continental                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Acer Negundo                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Acer platanoides                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Acer Pseudoplatanus                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Peral                                                       | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |        |
| Limonero 30/40                                              | El limonero, pertenece al grupo de los cítricos, teniendo su origen hace unos 20 millones de años en el sudeste asiático. Fue introducido por los árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosas modificaciones debidas tanto a la selección natural mediante hibridaciones espontáneas como a las producidas por el                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |        |
| Ajedrea                                                     | Planta aromática que fresca se utiliza para condimentar carnes y ensaladas, y seca, para pastas, sopas y guisantes                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |        |
| Thymus Citriodra (Tomillo limón)                            | Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas).Origen: Región mediterránea.Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden ser verdes, verdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispas y abejas. En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada.También puede usar las ramas secas con flores para añadir aroma y textura a cestos abiertos.        |        |
| Higuera                                                     | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |        |
| Níspero                                                     | Aunque originario del Sudeste de China, el níspero llegó a Europa procedente de Japón en el siglo XVIII como árbol ornamental. En el siglo XIX se inició el consumo de los frutos en toda el área mediterránea, donde se adaptó muy bien a las zonas de cultivo de los cítricos.El cultivo intensivo comenzó a desarrollarse a finales de los años 60 y principios de los 70, cuando comenzaron a implantarse las variedades y técnicas de cultivo actualmente utilizadas.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |        |
| Dracaena Drago                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Petrosilium Hortense (Peregil)                              | Nombre científico o latino: Petroselinum hortense, Petroselinum crispum. Nombre común o vulgar: Perejil, Perejil rizado Familia: Umbelliferae (Umbelíferas). Origen: el origen del perejil se encuentra en el Mediterraneo. Esta naturalizada en casi toda Europa. Se utiliza como condimento y para adorno, pero también en ensaladas. Se suele regalar en las fruterías y verdulerías.El perejil lo hay de 2 tipos: de hojas planas y de hojas rizadas.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |        |
| Thymus Vulgaris                                             | Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas). Origen: Región mediterránea. Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden ser verdes, verdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispas y abejas.\r\n En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada. También puede usar las ramas secas con flores para añadir aroma y textura a cestos abiertos. |        |
| Sierra de Poda 400MM                                        | Gracias a la poda se consigue manipular un poco la naturaleza, dándole la forma que más nos guste. Este trabajo básico de jardinería también facilita que las plantas crezcan de un modo más equilibrado, y que las flores y los frutos vuelvan cada año con regularidad. Lo mejor es dar forma cuando los ejemplares son jóvenes, de modo que exijan pocos cuidados cuando sean adultos. Además de saber cuándo y cómo hay que podar, tener unas herramientas adecuadas para esta labor es también de vital importancia.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |        |
| Pala                                                        | Palas de acero con cresta de corte en la punta para cortar bien el terreno. Buena penetración en tierras muy compactas.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |        |
| Nectarina                                                   | Se trata de un árbol derivado por mutación de los melocotoneros comunes, y los únicos caracteres diferenciales son la ausencia de tomentosidad en la piel del fruto. La planta, si se deja crecer libremente, adopta un porte globoso con unas dimensiones medias de 4-6 metros                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Kunquat  EXTRA con FRUTA                                    | su nombre científico se origina en honor a un hoticultor escocés que recolectó especímenes en China, (\"Fortunella\"), Robert Fortune (1812-1880), y \"margarita\", del latín margaritus-a-um = perla, en alusión a sus pequeños y brillantes frutos. Se trata de un arbusto o árbol pequeño de 2-3 m de altura, inerme o con escasas espinas.Hojas lanceoladas de 4-8 (-15) cm de longitud, con el ápice redondeado y la base cuneada.Tienen el margen crenulado en su mitad superior, el haz verde brillante y el envés más pálido.Pecíolo ligeramente marginado.Flores perfumadas solitarias o agrupadas en inflorescencias axilares, blancas.El fruto es lo más característico, es el más pequeño de todos los cítricos y el único cuya cáscara se puede comer.Frutos pequeños, con semillas, de corteza fina, dulce, aromática y comestible, y de pulpa naranja amarillenta y ligeramente ácida.Sus frutos son muy pequeños y tienen un carácter principalmente ornamental.                                                                           |        |
| Kaki                                                        | De crecimiento algo lento los primeros años, llega a alcanzar hasta doce metros de altura o más, aunque en cultivo se prefiere algo más bajo (5-6). Tronco corto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte más o menos piramidal, aunque con la edad se hace más globoso.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |        |
| Expositor Mimosa Semilla Mix                                | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente...                                                                                                                                                                                                                                                                                                               |        |
| Pinus Canariensis                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Azadón                                                      | Longitud:24cm. Herramienta fabricada en acero y pintura epoxi,alargando su durabilidad y preveniendo la corrosión.Diseño pensado para el ahorro de trabajo.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |        |
| Granado Mollar de Elche                                     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |        |
| Rastrillo de Jardín                                         | Fabuloso rastillo que le ayudará a eliminar piedras, hojas, ramas y otros elementos incómodos en su jardín.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |        |
| Higuera Napolitana                                          | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |        |
| Nerium oleander ARBOL Calibre 8/10                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Rosal copa                                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Granado                                                     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |        |
| Tuja orientalis \"Aurea nana\"                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| ROSAL TREPADOR                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Peral Blanq. de Aranjuez                                    | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |        |
| Lavándula Dentata                                           | Espliego de jardín, Alhucema rizada, Alhucema dentada, Cantueso rizado. Familia: Lamiaceae.Origen: España y Portugal. Mata de unos 60 cm de alto. Las hojas son aromáticas, dentadas y de color verde grisáceas.  Produce compactas espigas de flores pequeñas, ligeramente aromáticas, tubulares,de color azulado y con brácteas púrpuras.  Frutos: nuececillas alargadas encerradas en el tubo del cáliz.  Se utiliza en jardineria y no en perfumeria como otros cantuesos, espliegos y lavandas.  Tiene propiedades aromatizantes y calmantes. Adecuadas para la formación de setos bajos. Se dice que su aroma ahuyenta pulgones y otros insectos perjudiciales para las plantas vecinas.                                                                                                                                                                                                                                                                                                                                                             |        |
| Washingtonia Robusta                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Expositor Cítricos Mix                                      |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Limonero calibre 8/10                                       | El limonero, pertenece al grupo de los cítricos, teniendo su origen hace unos 20 millones de años en el sudeste asiático. Fue introducido por los árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosas modificaciones debidas tanto a la selección natural mediante hibridaciones espontáneas como a las producidas por el                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |        |
| Melocotonero                                                | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |        |
| Calamondin Copa                                             | Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son pequeñas, elípticas de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocas semillas, esféricos u ovales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |        |
| Sasa palmata                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Mimosa Semilla Bayleyana                                    | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente...                                                                                                                                                                                                                                                                                                               |        |
| Camelia japonica ejemplar                                   | Arbusto excepcional por su floración otoñal, invernal o primaveral. Flores: Las flores son solitarias, aparecen en el ápice de cada rama, y son con una corola simple o doble, y comprendiendo varios colores. Suelen medir unos 7-12 cm de diÃ metro y tienen 5 sépalos y 5 pétalos. Estambres numerosos unidos en la mitad o en 2/3 de su longitud.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |        |
| Brachychiton Rupestris                                      |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Melissa                                                     | Es una planta perenne (dura varios años) conocida por el agradable y característico olor a limón que desprenden en verano. Nunca debe faltar en la huerta o jardín por su agradable aroma y por los variados usos que tiene: planta olorosa, condimentaria y medicinal. Su cultivo es muy fácil. Le va bien un suelo ligero, con buen drenaje y riego sin exceso. A pleno sol o por lo menos 5 horas de sol por día. Cada año, su abonado mineral correspondiente.En otoño, la melisa pierde el agradable olor a limón que desprende en verano sus flores azules y blancas. En este momento se debe cortar a unos 20 cm. del suelo. Brotará de forma densa en primavera.                                                                                                                                                                                                                                                                                                                                                                                   |        |
| Kunquat                                                     | su nombre científico se origina en honor a un hoticultor escocés que recolectó especímenes en China, (\"Fortunella\"), Robert Fortune (1812-1880), y \"margarita\", del latín margaritus-a-um = perla, en alusión a sus pequeños y brillantes frutos. Se trata de un arbusto o árbol pequeño de 2-3 m de altura, inerme o con escasas espinas.Hojas lanceoladas de 4-8 (-15) cm de longitud, con el ápice redondeado y la base cuneada.Tienen el margen crenulado en su mitad superior, el haz verde brillante y el envés más pálido.Pecíolo ligeramente marginado.Flores perfumadas solitarias o agrupadas en inflorescencias axilares, blancas.El fruto es lo más característico, es el más pequeño de todos los cítricos y el único cuya cáscara se puede comer.Frutos pequeños, con semillas, de corteza fina, dulce, aromática y comestible, y de pulpa naranja amarillenta y ligeramente ácida.Sus frutos son muy pequeños y tienen un carácter principalmente ornamental.                                                                           |        |
| Ciruelo                                                     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |        |
| Manzano                                                     | alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |        |
| Lonicera Nitida                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Olea-Olivos                                                 | Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.                                                                                                                                                                                                                                                                                                                                                                                                   |        |
| Phylostachys biseti                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Rosal bajo 1Âª -En maceta-inicio brotación                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Cerezo Napoleón                                             | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                                                                                                                                                                                                                                                                                                                               |        |
| Brahea Armata                                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Naranjo 2 años injerto                                      | El naranjo es un árbol pequeño, que no supera los 3-5 metros de altura, con una copa compacta, cónica, transformada en esérica gracias a la poda. Su tronco es de color gris y liso, y las hojas son perennes, coriáceas, de un verde intenso y brillante, con forma oval o elíptico-lanceolada. Poseen, en el caso del naranjo amargo, un típico peciolo alado en forma de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y menos patente.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |        |
| Mandarino calibre 8/10                                      |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Lagunaria patersonii  calibre 8/10                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Morus Alba  calibre 8/10                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Melocotonero Paraguayo                                      | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |        |
| Erytrina Kafra                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Tamarix  Ramosissima Pink Cascade                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Bougamvillea Sanderiana Tutor                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Kaki Rojo Brillante                                         | De crecimiento algo lento los primeros años, llega a alcanzar hasta doce metros de altura o más, aunque en cultivo se prefiere algo más bajo (5-6). Tronco corto y copa extendida. Ramifica muy poco debido a la dominancia apical. Porte más o menos piramidal, aunque con la edad se hace más globoso.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |        |
| Prunus pisardii                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Mejorana                                                    | Origanum majorana. No hay que confundirlo con el orégano. Su sabor se parece más al tomillo, pero es más dulce y aromático.Se usan las hojas frescas o secas, picadas, machacadas o en polvo, en sopas, rellenos, quiches y tartas, tortillas, platos con papas y, como aderezo, en ramilletes de hierbas.El sabor delicado de la mejorana se elimina durante la cocción, de manera que es mejor agregarla cuando el plato esté en su punto o en aquéllos que apenas necesitan cocción.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |        |
| Mentha Sativa                                               | ¿Quién no conoce la Hierbabuena? Se trata de una plantita muy aromática, agradable y cultivada extensamente por toda España. Es hierba perenne (por tanto vive varios años, no es anual). Puedes cultivarla en maceta o plantarla en la tierra del jardín o en un rincón del huerto. Lo más importante es que cuente con bastante agua. En primavera debes aportar fertilizantes minerales. Vive mejor en semisombra que a pleno sol.Si ves orugas o los agujeros en hojas consecuencia de su ataque, retíralas una a una a mano; no uses insecticidas químicos.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |        |
| Salvia Mix                                                  | La Salvia es un pequeño arbusto que llega hasta el metro de alto.Tiene una vida breve, de unos pocos años.En el jardín, como otras aromáticas, queda muy bien en una rocalla o para hacer una bordura perfumada a cada lado de un camino de Salvia. Abona después de cada corte y recorta el arbusto una vez pase la floración.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Santolina Chamaecyparys                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Limonero 2 años injerto                                     | El limonero, pertenece al grupo de los cítricos, teniendo su origen hace unos 20 millones de años en el sudeste asiático. Fue introducido por los árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosas modificaciones debidas tanto a la selección natural mediante hibridaciones espontáneas como a las producidas por el hombre, en este caso buscando las necesidades del mercado.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Nogal                                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Jubaea Chilensis                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Livistonia Australis                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Pinus Halepensis                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Pinus Pinea -Pino Piñonero                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Thuja Esmeralda                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Archontophoenix Cunninghamiana                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Beucarnea Recurvata                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Naranjo -Plantón joven 1 año injerto                        | El naranjo es un árbol pequeño, que no supera los 3-5 metros de altura, con una copa compacta, cónica, transformada en esérica gracias a la poda. Su tronco es de color gris y liso, y las hojas son perennes, coriáceas, de un verde intenso y brillante, con forma oval o elíptico-lanceolada. Poseen, en el caso del naranjo amargo, un típico peciolo alado en forma de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y menos patente.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |        |
| Hibiscus Syriacus  \"Diana\" -Blanco Puro                   | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |        |
| Eucalyptus Ficifolia                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Forsytia Intermedia \"Lynwood\"                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Rhaphis Humilis                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Callistemom COPA                                            | Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ahí lo de \"llorón\")..                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |        |
| Sesbania Punicea                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Cedrus Deodara                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Tuja Occidentalis Woodwardii                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Yucca Jewel                                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Robinia Pseudoacacia Casque Rouge                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Manzano Golden Delicious                                    | alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |        |
| Níspero Tanaca                                              | Aunque originario del Sudeste de China, el níspero llegó a Europa procedente de Japón en el siglo XVIII como árbol ornamental. En el siglo XIX se inició el consumo de los frutos en toda el área mediterránea, donde se adaptó muy bien a las zonas de cultivo de los cítricos.El cultivo intensivo comenzó a desarrollarse a finales de los años 60 y principios de los 70, cuando comenzaron a implantarse las variedades y técnicas de cultivo actualmente utilizadas.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |        |
| Albaricoquero                                               | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |        |
| Membrillero Gigante de Wranja                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Mandarino 2 años injerto                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Manzano Reineta                                             | alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |        |
| Ciruelo Friar                                               | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |        |
| Nectarina                                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Limonero -Plantón joven                                     | El limonero, pertenece al grupo de los cítricos, teniendo su origen hace unos 20 millones de años en el sudeste asiático. Fue introducido por los árabes en el área mediterránea entre los años 1.000 a 1.200, habiendo experimentando numerosas modificaciones debidas tanto a la selección natural mediante hibridaciones espontáneas como a las producidas por el                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |        |
| Melocotonero Amarillo de Agosto                             | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |        |
| Mimosa Semilla Cyanophylla                                  | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente...                                                                                                                                                                                                                                                                                                               |        |
| Laurus Nobilis Arbusto - Ramificado Bajo                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Viburnum Tinus \"Eve Price\"                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Calamondin Copa EXTRA Con FRUTA                             | Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son pequeñas, elípticas de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocas semillas, esféricos u ovales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |        |
| Juniperus horizontalis Wiltonii                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |        |
| Bougamvillea roja, naranja                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

```sql
Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

select distinct o.* from oficina as o
left join empleado as e on o.codigo_oficina = e.codigo_oficina
left join cliente as c on e.codigo_empleado = c.codigo_empleado_rep_ventas
left join pedido as pe on c.codigo_cliente = pe.codigo_cliente left join detalle_pedido as dp on pe.codigo_pedido = dp.codigo_pedido
left join producto as p on dp.codigo_producto = p.codigo_producto where p.gama = 'Frutales' and e.codigo_empleado is null;

```

```sql
Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

select distinct c.* from cliente as c left join pedido as pe on c.codigo_cliente = pe.codigo_cliente
left join pago as pa on c.codigo_cliente = pa.codigo_cliente where pe.codigo_pedido is not null and pa.codigo_pago is null;



```
| codigo_cliente | nombre_cliente | nombre_contacto | apellido_contacto | telefono  |    fax    | linea_direccion1 | linea_direccion2 | ciudad |   region    | pais  | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|----------------|-----------------|-------------------|-----------|-----------|------------------|------------------|--------|-------------|-------|---------------|----------------------------|----------------|
| 36             | Flores S.L.    | Antonio         | Romero            | 654352981 | 685249700 | Avenida España   |                  | Madrid | Fuenlabrada | Spain | 29643         | 18                         | 6000           |



```sql
Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

select e.*, jefe.nombre as nombre_jefe from empleado as e left join empleado as jefe on e.codigo_jefe = jefe.codigo_empleado
where e.codigo_empleado not in (select distinct codigo_empleado_rep_ventas from cliente where codigo_empleado_rep_ventas is not null);

```

| codigo_empleado |   nombre    | apellido1  | apellido2 | extension |           email           | codigo_oficina | codigo_jefe |        puesto         | nombre_jefe |
|-----------------|-------------|------------|-----------|-----------|---------------------------|----------------|-------------|-----------------------|-------------|
| 1               | Marcos      | Magaña     | Perez     | 3897      | marcos@jardineria.es      | TAL-ES         |             | Director General      |             |
| 2               | Ruben       | López      | Martinez  | 2899      | rlopez@jardineria.es      | TAL-ES         | 1           | Subdirector Marketing | Marcos      |
| 3               | Alberto     | Soria      | Carrasco  | 2837      | asoria@jardineria.es      | TAL-ES         | 2           | Subdirector Ventas    | Ruben       |
| 4               | Maria       | Solís      | Jerez     | 2847      | msolis@jardineria.es      | TAL-ES         | 2           | Secretaria            | Ruben       |
| 6               | Juan Carlos | Ortiz      | Serrano   | 2845      | cortiz@jardineria.es      | TAL-ES         | 3           | Representante Ventas  | Alberto     |
| 7               | Carlos      | Soria      | Jimenez   | 2444      | csoria@jardineria.es      | MAD-ES         | 3           | Director Oficina      | Alberto     |
| 10              | Hilario     | Rodriguez  | Huertas   | 2444      | hrodriguez@jardineria.es  | MAD-ES         | 7           | Representante Ventas  | Carlos      |
| 13              | David       | Palma      | Aceituno  | 2519      | dpalma@jardineria.es      | BCN-ES         | 11          | Representante Ventas  | Emmanuel    |
| 14              | Oscar       | Palma      | Aceituno  | 2519      | opalma@jardineria.es      | BCN-ES         | 11          | Representante Ventas  | Emmanuel    |
| 15              | Francois    | Fignon     |           | 9981      | ffignon@gardening.com     | PAR-FR         | 3           | Director Oficina      | Alberto     |
| 17              | Laurent     | Serra      |           | 9982      | lserra@gardening.com      | PAR-FR         | 15          | Representante Ventas  | Francois    |
| 20              | Hilary      | Washington |           | 7565      | hwashington@gardening.com | BOS-USA        | 3           | Director Oficina      | Alberto     |
| 21              | Marcus      | Paxton     |           | 7565      | mpaxton@gardening.com     | BOS-USA        | 20          | Representante Ventas  | Hilary      |
| 23              | Nei         | Nishikori  |           | 8734      | nnishikori@gardening.com  | TOK-JP         | 3           | Director Oficina      | Alberto     |
| 24              | Narumi      | Riko       |           | 8734      | nriko@gardening.com       | TOK-JP         | 23          | Representante Ventas  | Nei         |
| 25              | Takuma      | Nomura     |           | 8735      | tnomura@gardening.com     | TOK-JP         | 23          | Representante Ventas  | Nei         |
| 26              | Amy         | Johnson    |           | 3321      | ajohnson@gardening.com    | LON-UK         | 3           | Director Oficina      | Alberto     |
| 27              | Larry       | Westfalls  |           | 3322      | lwestfalls@gardening.com  | LON-UK         | 26          | Representante Ventas  | Amy         |
| 28              | John        | Walton     |           | 3322      | jwalton@gardening.com     | LON-UK         | 26          | Representante Ventas  | Amy         |
| 29              | Kevin       | Fallmer    |           | 3210      | kfalmer@gardening.com     | SYD-AU         | 3           | Director Oficina      | Alberto     |


```sql

# Consultas resumen (count,avg,...)

```sql
¿Cuántos empleados hay en la compañía?

select count(*) as total_empleados from empleado;
```
| total_empleados |
|-----------------|
| 31              |


```sql
¿Cuántos clientes tiene cada país?

select pais, count(*) as total_cliente_por_pais from cliente group by pais;
```
|      pais      | total_cliente_por_pais |
|----------------|------------------------|
| Australia      | 2                      |
| France         | 2                      |
| Spain          | 27                     |
| USA            | 4                      |
| United Kingdom | 1                      |


```sql
¿Cuál fue el pago medio en 2009?

select round(avg(total),2) as media_pagos_2009 from pago where fecha_pago regexp "2009";
```
| media_pagos_2009 |
|------------------|
| 4504.08          |

```sql
¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.

select estado, count(*) as total from pedido group by estado;

|  estado   | total |
|-----------|-------|
| Entregado | 61    |
| Pendiente | 30    |
| Rechazado | 24    |

```
```sql
Calcula el precio de venta del producto más caro y más barato en una misma consulta.

select max(precio_venta) as precio_maximo, min(precio_venta) as minimo_precio from producto;

```
| precio_maximo | minimo_precio |
|---------------|---------------|
| 462           | 1             |

```sql
Calcula el número de clientes que tiene la empresa.

select count(*) as total_clientes from cliente;
```
| total_clientes |
|----------------|
| 36             |


```sql
¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

select count(*) as  total_clientes_madrid from cliente where ciudad = "Madrid";
```
| total_clientes_madrid |
|-----------------------|
| 11                    |

```sql
¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

select count(*) as  total_clientes_m from cliente where ciudad regexp "^M";
```
| total_clientes_m |
|------------------|
| 14               |


```sql
Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

select e.nombre as nombre_representante, count(c.codigo_cliente) as num_clientes
from empleado as e join cliente as c on e.codigo_empleado = c.codigo_empleado_rep_ventas group by e.nombre;

```

| nombre_representante | num_clientes |
|----------------------|--------------|
| Alberto              | 0            |
| Amy                  | 0            |
| Carlos               | 0            |
| David                | 0            |
| Emmanuel             | 5            |
| Felipe               | 5            |
| Francois             | 0            |
| Hilario              | 0            |
| Hilary               | 0            |
| John                 | 0            |
| José Manuel          | 5            |
| Juan Carlos          | 0            |
| Julian               | 5            |
| Kevin                | 0            |
| Larry                | 0            |
| Laurent              | 0            |
| Lionel               | 2            |
| Lorena               | 2            |
| Lucio                | 2            |
| Marcos               | 0            |
| Marcus               | 0            |
| Maria                | 0            |
| Mariano              | 4            |
| Mariko               | 2            |
| Michael              | 2            |
| Narumi               | 0            |
| Nei                  | 0            |
| Oscar                | 0            |
| Ruben                | 0            |
| Takuma               | 0            |
| Walter Santiago      | 2            |

```sql
Calcula el número de clientes que no tiene asignado representante de ventas.

select count(*) as num_clientes_sin_representante from cliente where codigo_empleado_rep_ventas is null;

```

| num_clientes_sin_representante |
|--------------------------------|
| 0                              |


```sql
Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

select
  c.nombre_cliente,
  MIN(p.fecha_pago) AS primera_fecha_pago,
  MAX(p.fecha_pago) AS ultima_fecha_pago
from cliente AS c left join pago AS p ON c.codigo_cliente = p.codigo_cliente group by c.codigo_cliente, c.nombre_cliente;

```
|         nombre_cliente         | primera_fecha_pago | ultima_fecha_pago |
|--------------------------------|--------------------|-------------------|
| GoldFish Garden                | 2008-11-10         | 2008-12-10        |
| Gardening Associates           | 2009-01-16         | 2009-02-19        |
| Gerudo Valley                  | 2007-01-08         | 2007-01-08        |
| Tendo Garden                   | 2006-01-18         | 2006-01-18        |
| Lasas S.A.                     |                    |                   |
| Beragua                        | 2009-01-13         | 2009-01-13        |
| Club Golf Puerta del hierro    |                    |                   |
| Naturagua                      | 2009-01-06         | 2009-01-06        |
| DaraDistribuciones             |                    |                   |
| Madrileña de riegos            |                    |                   |
| Lasas S.A.                     |                    |                   |
| Camunas Jardines S.L.          | 2008-08-04         | 2008-08-04        |
| Dardena S.A.                   | 2008-07-15         | 2008-07-15        |
| Jardin de Flores               | 2009-01-15         | 2009-02-15        |
| Flores Marivi                  | 2009-02-16         | 2009-02-16        |
| Flowers, S.A                   |                    |                   |
| Naturajardin                   |                    |                   |
| Golf S.A.                      | 2009-03-06         | 2009-03-06        |
| Americh Golf Management SL     |                    |                   |
| Aloha                          |                    |                   |
| El Prat                        |                    |                   |
| Sotogrande                     | 2009-03-26         | 2009-03-26        |
| Vivero Humanes                 |                    |                   |
| Fuenla City                    |                    |                   |
| Jardines y Mansiones Cactus SL | 2008-03-18         | 2008-03-18        |
| Jardinerías Matías SL          | 2009-02-08         | 2009-02-08        |
| Agrojardin                     | 2009-01-13         | 2009-01-13        |
| Top Campo                      |                    |                   |
| Jardineria Sara                | 2009-01-16         | 2009-01-16        |
| Campohermoso                   |                    |                   |
| france telecom                 |                    |                   |
| Musée du Louvre                |                    |                   |
| Tutifruti S.A                  | 2007-10-06         | 2007-10-06        |
| Flores S.L.                    |                    |                   |
| The Magic Garden               |                    |                   |
| El Jardin Viviente S.L         | 2006-05-26         | 2006-05-26        |


```sql
Calcula el número de productos diferentes que hay en cada uno de los pedidos.

select count(distinct(codigo_producto)) as total_productos from producto;

```
| total_productos |
|-----------------|
| 276             |

```sql
Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

select dp.codigo_pedido, sum(dp.cantidad) as total_pedido from detalle_pedido as dp group by dp.codigo_pedido;
```

| codigo_pedido | total_pedido |
|---------------|--------------|
| 1             | 113          |
| 2             | 164          |
| 3             | 232          |
| 4             | 179          |
| 8             | 14           |
| 9             | 625          |
| 10            | 40           |
| 11            | 260          |
| 12            | 290          |
| 13            | 22           |
| 14            | 21           |
| 15            | 21           |
| 16            | 22           |
| 17            | 25           |
| 18            | 16           |
| 19            | 41           |
| 20            | 22           |
| 21            | 30           |
| 22            | 1            |
| 23            | 194          |
| 24            | 19           |
| 25            | 29           |
| 26            | 27           |
| 27            | 84           |
| 28            | 12           |
| 29            | 40           |
| 30            | 33           |
| 31            | 32           |
| 32            | 40           |
| 33            | 905          |
| 34            | 112          |
| 35            | 178          |
| 36            | 28           |
| 37            | 245          |
| 38            | 7            |
| 39            | 9            |
| 40            | 12           |
| 41            | 10           |
| 42            | 4            |
| 43            | 9            |
| 44            | 5            |
| 45            | 10           |
| 46            | 12           |
| 47            | 14           |
| 48            | 147          |
| 49            | 65           |
| 50            | 71           |
| 51            | 200          |
| 52            | 10           |
| 53            | 10           |
| 54            | 69           |
| 55            | 20           |
| 56            | 22           |
| 57            | 17           |
| 58            | 364          |
| 59            | 10           |
| 60            | 10           |
| 61            | 10           |
| 62            | 10           |
| 63            | 10           |
| 64            | 10           |
| 65            | 10           |
| 66            | 10           |
| 67            | 10           |
| 68            | 10           |
| 74            | 91           |
| 75            | 130          |
| 76            | 374          |
| 77            | 49           |
| 78            | 153          |
| 79            | 50           |
| 80            | 162          |
| 81            | 30           |
| 82            | 34           |
| 83            | 30           |
| 89            | 47           |
| 90            | 41           |
| 91            | 101          |
| 92            | 62           |
| 93            | 79           |
| 94            | 124          |
| 95            | 20           |
| 96            | 36           |
| 97            | 36           |
| 98            | 62           |
| 99            | 45           |
| 100           | 60           |
| 101           | 209          |
| 102           | 55           |
| 103           | 64           |
| 104           | 122          |
| 105           | 48           |
| 106           | 278          |
| 107           | 158          |
| 108           | 112          |
| 109           | 69           |
| 110           | 21           |
| 111           | 10           |
| 112           | 10           |
| 113           | 10           |
| 114           | 10           |
| 115           | 10           |
| 116           | 78           |
| 117           | 24           |
| 118           | 10           |
| 119           | 10           |
| 120           | 10           |
| 121           | 10           |
| 122           | 10           |
| 123           | 10           |
| 124           | 10           |
| 125           | 10           |
| 126           | 10           |
| 127           | 10           |
| 128           | 33           |


```sql
Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades ``
vendidas.


select p.nombre, sum(dp.codigo_producto) as cantidad_vendida from detalle_pedido as dp join producto as p on dp.codigo_pedido=p.codigo_producto group by dp.codigo_pedido order by cantidad_vendida desc limit 20;
```
```sql
La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IGIC y el total facturado. La base imponible se calcula sumando el coste 
del producto por el número de unidades vendidas de la tabla detalle_pedido. El IGIC es el 7 % de la base imponible, y el total la suma de los dos campos anteriores.

select SUM(dp.precio_unidad * dp.cantidad) as base_imponible,
  SUM(dp.precio_unidad * dp.cantidad * 0.07) as igic, SUM(dp.precio_unidad * dp.cantidad * 1.07) as total_precio_unidad from detalle_pedido as dp;

```
| base_imponible |   igic   | total_precio_unidad |
|----------------|----------|---------------------|
| 217738         | 15241.66 | 232979.66           |



```sql
La misma información que en la pregunta anterior, pero agrupada por código de producto.

select SUM(dp.precio_unidad * dp.cantidad) as base_imponible,
  SUM(dp.precio_unidad * dp.cantidad * 0.07) as igic, SUM(dp.precio_unidad * dp.cantidad * 1.07) as total_precio_unidad from detalle_pedido as dp group by dp.codigo_producto;

```
| base_imponible |  igic   | total_precio_unidad |
|----------------|---------|---------------------|
| 630            | 44.1    | 674.1               |
| 564            | 39.48   | 603.48              |
| 996            | 69.72   | 1065.72             |
| 2640           | 184.8   | 2824.8              |
| 135            | 9.45    | 144.45              |
| 128            | 8.96    | 136.96              |
| 17             | 1.19    | 18.19               |
| 30             | 2.1     | 32.1                |
| 21             | 1.47    | 22.47               |
| 291            | 20.37   | 311.37              |
| 9              | 0.63    | 9.63                |
| 455            | 31.85   | 486.85              |
| 986            | 69.02   | 1055.02             |
| 10             | 0.7     | 10.7                |
| 168            | 11.76   | 179.76              |
| 119            | 8.33    | 127.33              |
| 1209           | 84.63   | 1293.63             |
| 247            | 17.29   | 264.29              |
| 668            | 46.76   | 714.76              |
| 25             | 1.75    | 26.75               |
| 280            | 19.6    | 299.6               |
| 673            | 47.11   | 720.11              |
| 1100           | 77.0    | 1177.0              |
| 468            | 32.76   | 500.76              |
| 13092          | 916.44  | 14008.44            |
| 668            | 46.76   | 714.76              |
| 741            | 51.87   | 792.87              |
| 225            | 15.75   | 240.75              |
| 45             | 3.15    | 48.15               |
| 846            | 59.22   | 905.22              |
| 108            | 7.56    | 115.56              |
| 7              | 0.49    | 7.49                |
| 40             | 2.8     | 42.8                |
| 62             | 4.34    | 66.34               |
| 960            | 67.2    | 1027.2              |
| 497            | 34.79   | 531.79              |
| 96             | 6.72    | 102.72              |
| 216            | 15.12   | 231.12              |
| 336            | 23.52   | 359.52              |
| 621            | 43.47   | 664.47              |
| 45             | 3.15    | 48.15               |
| 2552           | 178.64  | 2730.64             |
| 434            | 30.38   | 464.38              |
| 96             | 6.72    | 102.72              |
| 96             | 6.72    | 102.72              |
| 48             | 3.36    | 51.36               |
| 112            | 7.84    | 119.84              |
| 440            | 30.8    | 470.8               |
| 1080           | 75.6    | 1155.6              |
| 744            | 52.08   | 796.08              |
| 351            | 24.57   | 375.57              |
| 128            | 8.96    | 136.96              |
| 1624           | 113.68  | 1737.68             |
| 561            | 39.27   | 600.27              |
| 112            | 7.84    | 119.84              |
| 352            | 24.64   | 376.64              |
| 110            | 7.7     | 117.7               |
| 245            | 17.15   | 262.15              |
| 19950          | 1396.5  | 21346.5             |
| 1911           | 133.77  | 2044.77             |
| 348            | 24.36   | 372.36              |
| 220            | 15.4    | 235.4               |
| 124            | 8.68    | 132.68              |
| 224            | 15.68   | 239.68              |
| 1035           | 72.45   | 1107.45             |
| 30             | 2.1     | 32.1                |
| 946            | 66.22   | 1012.22             |
| 108            | 7.56    | 115.56              |
| 32             | 2.24    | 34.24               |
| 147            | 10.29   | 157.29              |
| 980            | 68.6    | 1048.6              |
| 143            | 10.01   | 153.01              |
| 5320           | 372.4   | 5692.4              |
| 22             | 1.54    | 23.54               |
| 1584           | 110.88  | 1694.88             |
| 450            | 31.5    | 481.5               |
| 232            | 16.24   | 248.24              |
| 280            | 19.6    | 299.6               |
| 2250           | 157.5   | 2407.5              |
| 1649           | 115.43  | 1764.43             |
| 144            | 10.08   | 154.08              |
| 1302           | 91.14   | 1393.14             |
| 200            | 14.0    | 214.0               |
| 63             | 4.41    | 67.41               |
| 98             | 6.86    | 104.86              |
| 50             | 3.5     | 53.5                |
| 25             | 1.75    | 26.75               |
| 160            | 11.2    | 171.2               |
| 70             | 4.9     | 74.9                |
| 15             | 1.05    | 16.05               |
| 160            | 11.2    | 171.2               |
| 2900           | 203.0   | 3103.0              |
| 337            | 23.59   | 360.59              |
| 216            | 15.12   | 231.12              |
| 2286           | 160.02  | 2446.02             |
| 320            | 22.4    | 342.4               |
| 200            | 14.0    | 214.0               |
| 200            | 14.0    | 214.0               |
| 68             | 4.76    | 72.76               |
| 42             | 2.94    | 44.94               |
| 36             | 2.52    | 38.52               |
| 18             | 1.26    | 19.26               |
| 24             | 1.68    | 25.68               |
| 313            | 21.91   | 334.91              |
| 2620           | 183.4   | 2803.4              |
| 132            | 9.24    | 141.24              |
| 90             | 6.3     | 96.3                |
| 30             | 2.1     | 32.1                |
| 20             | 1.4     | 21.4                |
| 1395           | 97.65   | 1492.65             |
| 432            | 30.24   | 462.24              |
| 380            | 26.6    | 406.6               |
| 2250           | 157.5   | 2407.5              |
| 30             | 2.1     | 32.1                |
| 360            | 25.2    | 385.2               |
| 240            | 16.8    | 256.8               |
| 100            | 7.0     | 107.0               |
| 100            | 7.0     | 107.0               |
| 280            | 19.6    | 299.6               |
| 40             | 2.8     | 42.8                |
| 102            | 7.14    | 109.14              |
| 500            | 35.0    | 535.0               |
| 100            | 7.0     | 107.0               |
| 25             | 1.75    | 26.75               |
| 16             | 1.12    | 17.12               |
| 884            | 61.88   | 945.88              |
| 500            | 35.0    | 535.0               |
| 3120           | 218.4   | 3338.4              |
| 4130           | 289.1   | 4419.1              |
| 9310           | 651.7   | 9961.7              |
| 2120           | 148.4   | 2268.4              |
| 975            | 68.25   | 1043.25             |
| 950            | 66.5    | 1016.5              |
| 1239           | 86.73   | 1325.73             |
| 840            | 58.8    | 898.8               |
| 570            | 39.9    | 609.9               |
| 15104          | 1057.28 | 16161.28            |
| 3520           | 246.4   | 3766.4              |
| 2205           | 154.35  | 2359.35             |
| 950            | 66.5    | 1016.5              |
| 468            | 32.76   | 500.76              |
| 485            | 33.95   | 518.95              |
| 128            | 8.96    | 136.96              |
| 73510          | 5145.7  | 78655.7             |
| 150            | 10.5    | 160.5               |
| 30             | 2.1     | 32.1                |
| 517            | 36.19   | 553.19              |


```sql
La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.

select dp.codigo_producto, SUM(dp.precio_unidad * dp.cantidad) as base_imponible, sum(dp.precio_unidad  * dp.cantidad * 0.07) as igic,
SUM(dp.precio_unidad  * dp.cantidad * 1.07) AS total_facturado
FROM detalle_pedido AS dp WHERE dp.codigo_producto LIKE 'OR%' GROUP BY dp.codigo_producto;

```

| codigo_producto | base_imponible |  igic   | total_facturado |
|-----------------|----------------|---------|-----------------|
| OR-101          | 144            | 10.08   | 154.08          |
| OR-102          | 1302           | 91.14   | 1393.14         |
| OR-104          | 200            | 14.0    | 214.0           |
| OR-115          | 63             | 4.41    | 67.41           |
| OR-116          | 98             | 6.86    | 104.86          |
| OR-119          | 50             | 3.5     | 53.5            |
| OR-120          | 25             | 1.75    | 26.75           |
| OR-122          | 160            | 11.2    | 171.2           |
| OR-123          | 70             | 4.9     | 74.9            |
| OR-125          | 15             | 1.05    | 16.05           |
| OR-127          | 160            | 11.2    | 171.2           |
| OR-128          | 2900           | 203.0   | 3103.0          |
| OR-129          | 337            | 23.59   | 360.59          |
| OR-130          | 216            | 15.12   | 231.12          |
| OR-136          | 2286           | 160.02  | 2446.02         |
| OR-139          | 320            | 22.4    | 342.4           |
| OR-140          | 200            | 14.0    | 214.0           |
| OR-141          | 200            | 14.0    | 214.0           |
| OR-146          | 68             | 4.76    | 72.76           |
| OR-147          | 42             | 2.94    | 44.94           |
| OR-150          | 36             | 2.52    | 38.52           |
| OR-152          | 18             | 1.26    | 19.26           |
| OR-155          | 24             | 1.68    | 25.68           |
| OR-156          | 313            | 21.91   | 334.91          |
| OR-157          | 2620           | 183.4   | 2803.4          |
| OR-159          | 132            | 9.24    | 141.24          |
| OR-160          | 90             | 6.3     | 96.3            |
| OR-165          | 30             | 2.1     | 32.1            |
| OR-168          | 20             | 1.4     | 21.4            |
| OR-172          | 1395           | 97.65   | 1492.65         |
| OR-174          | 432            | 30.24   | 462.24          |
| OR-176          | 380            | 26.6    | 406.6           |
| OR-177          | 2250           | 157.5   | 2407.5          |
| OR-179          | 30             | 2.1     | 32.1            |
| OR-181          | 360            | 25.2    | 385.2           |
| OR-186          | 240            | 16.8    | 256.8           |
| OR-188          | 100            | 7.0     | 107.0           |
| OR-193          | 100            | 7.0     | 107.0           |
| OR-196          | 280            | 19.6    | 299.6           |
| OR-200          | 40             | 2.8     | 42.8            |
| OR-203          | 102            | 7.14    | 109.14          |
| OR-204          | 500            | 35.0    | 535.0           |
| OR-205          | 100            | 7.0     | 107.0           |
| OR-206          | 25             | 1.75    | 26.75           |
| OR-207          | 16             | 1.12    | 17.12           |
| OR-208          | 884            | 61.88   | 945.88          |
| OR-209          | 500            | 35.0    | 535.0           |
| OR-210          | 3120           | 218.4   | 3338.4          |
| OR-211          | 4130           | 289.1   | 4419.1          |
| OR-213          | 9310           | 651.7   | 9961.7          |
| OR-214          | 2120           | 148.4   | 2268.4          |
| OR-217          | 975            | 68.25   | 1043.25         |
| OR-218          | 950            | 66.5    | 1016.5          |
| OR-222          | 1239           | 86.73   | 1325.73         |
| OR-225          | 840            | 58.8    | 898.8           |
| OR-226          | 570            | 39.9    | 609.9           |
| OR-227          | 15104          | 1057.28 | 16161.28        |
| OR-234          | 3520           | 246.4   | 3766.4          |
| OR-236          | 2205           | 154.35  | 2359.35         |
| OR-237          | 950            | 66.5    | 1016.5          |
| OR-240          | 468            | 32.76   | 500.76          |
| OR-241          | 485            | 33.95   | 518.95          |
| OR-243          | 128            | 8.96    | 136.96          |
| OR-247          | 73510          | 5145.7  | 78655.7         |
| OR-249          | 150            | 10.5    | 160.5           |
| OR-250          | 30             | 2.1     | 32.1            |
| OR-99           | 517            | 36.19   | 553.19          |


```sql
Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (7% IGIC).

select p.nombre as nombre_producto, sum(dp.cantidad) as unidades_vendidas, sum(dp.precio_unidad * dp.cantidad) as total_facturado, sum(dp.precio_unidad * dp.cantidad * 1.07) as total_facturado_con_impuestos
from detalle_pedido as dp
join producto as p on dp.codigo_producto = p.codigo_producto
group by p.codigo_producto, p.nombre
having total_facturado > 3000;


|    nombre_producto    | unidades_vendidas | total_facturado | total_facturado_con_impuestos |
|-----------------------|-------------------|-----------------|-------------------------------|
| Limonero 30/40        | 131               | 13092           | 14008.44                      |
| Cerezo                | 285               | 19950           | 21346.5                       |
| Kaki                  | 76                | 5320            | 5692.4                        |
| Beucarnea Recurvata   | 80                | 3120            | 3338.4                        |
| Beucarnea Recurvata   | 70                | 4130            | 4419.1                        |
| Bismarckia Nobilis    | 35                | 9310            | 9961.7                        |
| Chamaerops Humilis    | 236               | 15104           | 16161.28                      |
| Dracaena Drago        | 55                | 3520            | 3766.4                        |
| Trachycarpus Fortunei | 279               | 73510           | 78655.7                       |

```
```sql
Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

select strftime('%Y', fecha_pago) as anyo, SUM(total) AS suma_total_pagos from pago group by anyo;

```
| anio | suma_total_pagos |
|------|------------------|
| 2006 | 24965            |
| 2007 | 85170            |
| 2008 | 29252            |
| 2009 | 58553            |


Subconsultas en SQL

```SQL
Devuelve el nombre del cliente con mayor límite de crédito.
select nombre_cliente, limite_credito from cliente where limite_credito = (select max(limite_credito) from cliente);
```
| nombre_cliente | limite_credito |
|----------------|----------------|
| Tendo Garden   | 600000         |

```SQL
Devuelve el nombre del producto que tenga el precio de venta más caro.

select nombre as producto_mas_caro, precio_venta  from producto where precio_venta = (SELECT MAX(precio_venta) FROM producto);

```
|   producto_mas_caro   | precio_venta |
|-----------------------|--------------|
| Trachycarpus Fortunei | 462          |

```SQL
Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a 
partir de los datos de la tabla detalle_pedido)

select nombre as mas_vendido from producto
where codigo_producto = ( select codigo_producto from detalle_pedido group by codigo_producto order by sum(cantidad) desc limit 1);

```
|   mas_vendido   |
|-----------------|
| Thymus Vulgaris |


```SQL
Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).

select nombre_cliente, limite_credito from cliente where limite_credito > (SELECT SUM(total) FROM pago WHERE pago.codigo_cliente = cliente.codigo_cliente);

```
|         nombre_cliente         | limite_credito |
|--------------------------------|----------------|
| Tendo Garden                   | 600000         |
| Beragua                        | 20000          |
| Naturagua                      | 32000          |
| Camunas Jardines S.L.          | 16481          |
| Dardena S.A.                   | 321000         |
| Jardin de Flores               | 40000          |
| Golf S.A.                      | 30000          |
| Sotogrande                     | 60000          |
| Jardines y Mansiones Cactus SL | 76000          |
| Jardinerías Matías SL          | 100500         |
| Tutifruti S.A                  | 10000          |
| El Jardin Viviente S.L         | 8000           |


```SQL
Devuelve el producto que más unidades tiene en stock.

select nombre, cantidad_en_stock from producto where cantidad_en_stock = (SELECT MAX(cantidad_en_stock) FROM producto);

```

|             nombre              | cantidad_en_stock |
|---------------------------------|-------------------|
| Rosal copa                      | 400               |
| Albaricoquero Corbato           | 400               |
| Albaricoquero Moniqui           | 400               |
| Albaricoquero Kurrot            | 400               |
| Cerezo Burlat                   | 400               |
| Cerezo Picota                   | 400               |
| Cerezo Napoleón                 | 400               |
| Ciruelo R. Claudia Verde        | 400               |
| Ciruelo Santa Rosa              | 400               |
| Ciruelo Golden Japan            | 400               |
| Ciruelo Friar                   | 400               |
| Ciruelo Reina C. De Ollins      | 400               |
| Ciruelo Claudia Negra           | 400               |
| Granado Mollar de Elche         | 400               |
| Higuera Napolitana              | 400               |
| Higuera Verdal                  | 400               |
| Higuera Breva                   | 400               |
| Manzano Starking Delicious      | 400               |
| Manzano Reineta                 | 400               |
| Manzano Golden Delicious        | 400               |
| Membrillero Gigante de Wranja   | 400               |
| Melocotonero Spring Crest       | 400               |
| Melocotonero Amarillo de Agosto | 400               |
| Melocotonero Federica           | 400               |
| Melocotonero Paraguayo          | 400               |
| Nogal Común                     | 400               |
| Parra Uva de Mesa               | 400               |
| Peral Castell                   | 400               |
| Peral Williams                  | 400               |
| Peral Conference                | 400               |
| Peral Blanq. de Aranjuez        | 400               |
| Níspero Tanaca                  | 400               |
| Olivo Cipresino                 | 400               |
| Nectarina                       | 400               |
| Kaki Rojo Brillante             | 400               |


```SQL
Devuelve el producto que menos unidades tiene en stock.

select nombre, cantidad_en_stock from producto where cantidad_en_stock = (SELECT MIN(cantidad_en_stock) FROM producto);
```
|    nombre     | cantidad_en_stock |
|---------------|-------------------|
| Brahea Armata | 0                 |


```SQL
Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.

select nombre, apellido1, apellido2, email from empleado where codigo_jefe = (select codigo_empleado from empleado where nombre = 'Alberto' and apellido1 = 'Soria');

```
|   nombre    | apellido1  | apellido2 |           email           |
|-------------|------------|-----------|---------------------------|
| Felipe      | Rosas      | Marquez   | frosas@jardineria.es      |
| Juan Carlos | Ortiz      | Serrano   | cortiz@jardineria.es      |
| Carlos      | Soria      | Jimenez   | csoria@jardineria.es      |
| Emmanuel    | Magaña     | Perez     | manu@jardineria.es        |
| Francois    | Fignon     |           | ffignon@gardening.com     |
| Michael     | Bolton     |           | mbolton@gardening.com     |
| Hilary      | Washington |           | hwashington@gardening.com |
| Nei         | Nishikori  |           | nnishikori@gardening.com  |
| Amy         | Johnson    |           | ajohnson@gardening.com    |
| Kevin       | Fallmer    |           | kfalmer@gardening.com     |


```SQL
Devuelve el nombre del cliente con mayor límite de crédito.


```
```SQL
Devuelve el nombre del producto que tenga el precio de venta más caro.


select nombre as producto_mas_caro, precio_venta  from producto where precio_venta = (SELECT MAX(precio_venta) FROM producto);

```
|   producto_mas_caro   | precio_venta |
|-----------------------|--------------|
| Trachycarpus Fortunei | 462          |

```

```SQL
Devuelve el producto que menos unidades tiene en stock.

select nombre, cantidad_en_stock from producto where cantidad_en_stock = (SELECT MIN(cantidad_en_stock) FROM producto);
```
|    nombre     | cantidad_en_stock |
|---------------|-------------------|
| Brahea Armata | 0                 |

```
```SQL
Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
```
```SQL
Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

SELECT nombre_cliente FROM cliente WHERE codigo_cliente not in (select distinct codigo_cliente FROM pago);
```

|       nombre_cliente        |
|-----------------------------|
| Lasas S.A.                  |
| Club Golf Puerta del hierro |
| DaraDistribuciones          |
| Madrileña de riegos         |
| Lasas S.A.                  |
| Flowers, S.A                |
| Naturajardin                |
| Americh Golf Management SL  |
| Aloha                       |
| El Prat                     |
| Vivero Humanes              |
| Fuenla City                 |
| Top Campo                   |
| Campohermoso                |
| france telecom              |
| Musée du Louvre             |
| Flores S.L.                 |
| The Magic Garden            |

```SQL
Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
SELECT nombre_cliente FROM cliente WHERE codigo_cliente in (select distinct codigo_cliente FROM pago);
```
|         nombre_cliente         |
|--------------------------------|
| GoldFish Garden                |
| Gardening Associates           |
| Gerudo Valley                  |
| Tendo Garden                   |
| Beragua                        |
| Naturagua                      |
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| Jardin de Flores               |
| Flores Marivi                  |
| Golf S.A.                      |
| Sotogrande                     |
| Jardines y Mansiones Cactus SL |
| Jardinerías Matías SL          |
| Agrojardin                     |
| Jardineria Sara                |
| Tutifruti S.A                  |
| El Jardin Viviente S.L         |

```SQL
Devuelve un listado de los productos que nunca han aparecido en un pedido.

select distinct nombre from producto where codigo_producto not in (select distinct codigo_producto FROM detalle_pedido);

```
|                           nombre                            |
|-------------------------------------------------------------|
| Olea-Olivos                                                 |
| Calamondin Mini                                             |
| Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
| Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
| Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
| Albaricoquero Corbato                                       |
| Albaricoquero Moniqui                                       |
| Albaricoquero Kurrot                                        |
| Cerezo Burlat                                               |
| Cerezo Picota                                               |
| Ciruelo R. Claudia Verde                                    |
| Ciruelo Golden Japan                                        |
| Ciruelo Claudia Negra                                       |
| Higuera Verdal                                              |
| Higuera Breva                                               |
| Melocotonero Spring Crest                                   |
| Melocotonero Federica                                       |
| Parra Uva de Mesa                                           |
| Mandarino -Plantón joven                                    |
| Peral Castell                                               |
| Peral Williams                                              |
| Peral Conference                                            |
| Olivo Cipresino                                             |
| Albaricoquero                                               |
| Cerezo                                                      |
| Ciruelo                                                     |
| Granado                                                     |
| Higuera                                                     |
| Manzano                                                     |
| Melocotonero                                                |
| Membrillero                                                 |
| Arbustos Mix Maceta                                         |
| Mimosa Injerto CLASICA Dealbata                             |
| Mimosa Semilla Bayleyana                                    |
| Mimosa Semilla Espectabilis                                 |
| Mimosa Semilla Longifolia                                   |
| Mimosa Semilla Floribunda 4 estaciones                      |
| Abelia Floribunda                                           |
| Callistemom (Mix)                                           |
| Corylus Avellana \"Contorta\"                               |
| Escallonia (Mix)                                            |
| Evonimus Emerald Gayeti                                     |
| Evonimus Pulchellus                                         |
| Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                |
| Hibiscus Syriacus \"Pink Giant\" Rosa                       |
| Lonicera Nitida \"Maigrum\"                                 |
| Prunus pisardii                                             |
| Weigelia \"Bristol Ruby\"                                   |
| Leptospermum formado PIRAMIDE                               |
| Leptospermum COPA                                           |
| Nerium oleander-CALIDAD \"GARDEN\"                          |
| Nerium Oleander Arbusto GRANDE                              |
| Nerium oleander COPA  Calibre 6/8                           |
| ROSAL TREPADOR                                              |
| Solanum Jazminoide                                          |
| Wisteria Sinensis  azul, rosa, blanca                       |
| Wisteria Sinensis INJERTADAS DECÃ“                          |
| Bougamvillea Sanderiana Tutor                               |
| Bougamvillea Sanderiana Espaldera                           |
| Bougamvillea Sanderiana, 3 tut. piramide                    |
| Expositor Árboles clima mediterráneo                        |
| Expositor Árboles borde del mar                             |
| Brachychiton Acerifolius                                    |
| Cassia Corimbosa                                            |
| Cassia Corimbosa                                            |
| Chitalpa Summer Bells                                       |
| Erytrina Kafra                                              |
| Eucalyptus Citriodora                                       |
| Eucalyptus Ficifolia                                        |
| Hibiscus Syriacus  Var. Injertadas 1 Tallo                  |
| Lagunaria Patersonii                                        |
| Lagunaria Patersonii                                        |
| Morus Alba                                                  |
| Platanus Acerifolia                                         |
| Salix Babylonica  Pendula                                   |
| Tamarix  Ramosissima Pink Cascade                           |
| Tecoma Stands                                               |
| Tecoma Stands                                               |
| Tipuana Tipu                                                |
| Pleioblastus distichus-Bambú enano                          |
| Sasa palmata                                                |
| Phylostachys aurea                                          |
| Phylostachys Bambusa Spectabilis                            |
| Phylostachys biseti                                         |
| Pseudosasa japonica (Metake)                                |
| Pseudosasa japonica (Metake)                                |
| Cedrus Deodara \"Feeling Blue\" Novedad                     |
| Juniperus chinensis \"Blue Alps\"                           |
| Juniperus Chinensis Stricta                                 |
| Juniperus squamata \"Blue Star\"                            |
| Juniperus x media Phitzeriana verde                         |
| Bismarckia Nobilis                                          |
| Brahea Armata                                               |
| Brahea Edulis                                               |
| Butia Capitata                                              |
| Chamaerops Humilis                                          |
| Chamaerops Humilis \"Cerifera\"                             |
| Chrysalidocarpus Lutescens -ARECA                           |
| Cordyline Australis -DRACAENA                               |
| Cycas Revoluta                                              |
| Dracaena Drago                                              |
| Livistonia Decipiens                                        |
| Rhaphis Excelsa                                             |
| Sabal Minor                                                 |
| Trachycarpus Fortunei                                       |
| Washingtonia Robusta                                        |
| Zamia Furfuracaea                                           |


```SQL
Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.


-- devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representantes de ventas de ningún cliente.
select e.nombre, e.apellido1, e.puesto, o.telefono
from empleado as e
join oficina as o on e.codigo_oficina = o.codigo_oficina
left join cliente as c on e.codigo_empleado = c.codigo_empleado_rep_ventas
where c.codigo_cliente is null;


```

|   nombre    | apellido1  |        puesto         |    telefono     |
|-------------|------------|-----------------------|-----------------|
| Marcos      | Magaña     | Director General      | +34 925 867231  |
| Ruben       | López      | Subdirector Marketing | +34 925 867231  |
| Alberto     | Soria      | Subdirector Ventas    | +34 925 867231  |
| Maria       | Solís      | Secretaria            | +34 925 867231  |
| Juan Carlos | Ortiz      | Representante Ventas  | +34 925 867231  |
| Carlos      | Soria      | Director Oficina      | +34 91 7514487  |
| Hilario     | Rodriguez  | Representante Ventas  | +34 91 7514487  |
| David       | Palma      | Representante Ventas  | +34 93 3561182  |
| Oscar       | Palma      | Representante Ventas  | +34 93 3561182  |
| Francois    | Fignon     | Director Oficina      | +33 14 723 4404 |
| Laurent     | Serra      | Representante Ventas  | +33 14 723 4404 |
| Hilary      | Washington | Director Oficina      | +1 215 837 0825 |
| Marcus      | Paxton     | Representante Ventas  | +1 215 837 0825 |
| Nei         | Nishikori  | Director Oficina      | +81 33 224 5000 |
| Narumi      | Riko       | Representante Ventas  | +81 33 224 5000 |
| Takuma      | Nomura     | Representante Ventas  | +81 33 224 5000 |
| Amy         | Johnson    | Director Oficina      | +44 20 78772041 |
| Larry       | Westfalls  | Representante Ventas  | +44 20 78772041 |
| John        | Walton     | Representante Ventas  | +44 20 78772041 |
| Kevin       | Fallmer    | Director Oficina      | +61 2 9264 2451 |



```sql
Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

select distinct o.*
from oficina as o
where codigo_oficina not in (select e.codigo_oficina from empleado as e join cliente as c on e.codigo_empleado = c.codigo_empleado_rep_ventas join pedido as pe on c.codigo_cliente = pe.codigo_cliente join detalle_pedido as dp on pe.codigo_pedido = dp.codigo_pedido join producto as p on dp.codigo_producto = p.codigo_producto where p.gama = 'Frutales');


```
| codigo_oficina | ciudad  |    pais    |   region   | codigo_postal |    telefono     |     linea_direccion1     | linea_direccion2 |
|----------------|---------|------------|------------|---------------|-----------------|--------------------------|------------------|
| LON-UK         | Londres | Inglaterra | EMEA       | EC2N 1HN      | +44 20 78772041 | 52 Old Broad Street      | Ground Floor     |
| PAR-FR         | Paris   | Francia    | EMEA       | 75017         | +33 14 723 4404 | 29 Rue Jouffroy d'abbans |                  |
| TOK-JP         | Tokyo   | Japón      | Chiyoda-Ku | 102-8578      | +81 33 224 5000 | 4-1 Kioicho              |                  |


```SQL
Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

-- devuelve clientes que han realizado algún pedido pero no han realizado ningún pago utilizando subconsulta
-- devuelve clientes que han realizado algún pedido pero no han realizado ningún pago utilizando subconsulta
select distinct c.*
from cliente as c
where c.codigo_cliente in (select distinct c2.codigo_cliente from cliente as c2 left join pedido as pe on c2.codigo_cliente = pe.codigo_cliente left join pago as pa on c2.codigo_cliente = pa.codigo_cliente where pe.codigo_pedido is not null and pa.codigo_cliente is null);


```
| codigo_cliente | nombre_cliente | nombre_contacto | apellido_contacto | telefono  |    fax    | linea_direccion1 | linea_direccion2 | ciudad |   region    | pais  | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|----------------|-----------------|-------------------|-----------|-----------|------------------|------------------|--------|-------------|-------|---------------|----------------------------|----------------|
| 36             | Flores S.L.    | Antonio         | Romero            | 654352981 | 685249700 | Avenida España   |                  | Madrid | Fuenlabrada | Spain | 29643         | 18                         | 6000           |

```SQL
Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

SELECT nombre_cliente FROM cliente WHERE codigo_cliente not in (select distinct codigo_cliente FROM pago);
```

|       nombre_cliente        |
|-----------------------------|
| Lasas S.A.                  |
| Club Golf Puerta del hierro |
| DaraDistribuciones          |
| Madrileña de riegos         |
| Lasas S.A.                  |
| Flowers, S.A                |
| Naturajardin                |
| Americh Golf Management SL  |
| Aloha                       |
| El Prat                     |
| Vivero Humanes              |
| Fuenla City                 |
| Top Campo                   |
| Campohermoso                |
| france telecom              |
| Musée du Louvre             |
| Flores S.L.                 |
| The Magic Garden            |

```SQL
Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
SELECT nombre_cliente FROM cliente WHERE codigo_cliente in (select distinct codigo_cliente FROM pago);
```
|         nombre_cliente         |
|--------------------------------|
| GoldFish Garden                |
| Gardening Associates           |
| Gerudo Valley                  |
| Tendo Garden                   |
| Beragua                        |
| Naturagua                      |
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| Jardin de Flores               |
| Flores Marivi                  |
| Golf S.A.                      |
| Sotogrande                     |
| Jardines y Mansiones Cactus SL |
| Jardinerías Matías SL          |
| Agrojardin                     |
| Jardineria Sara                |
| Tutifruti S.A                  |
| El Jardin Viviente S.L         |


```SQL
Devuelve un listado de los productos que nunca han aparecido en un pedido.

select distinct nombre from producto where codigo_producto not in (select distinct codigo_producto from detalle_pedido);


```
|                           nombre                            |
|-------------------------------------------------------------|
| Olea-Olivos                                                 |
| Calamondin Mini                                             |
| Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
| Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
| Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
| Albaricoquero Corbato                                       |
| Albaricoquero Moniqui                                       |
| Albaricoquero Kurrot                                        |
| Cerezo Burlat                                               |
| Cerezo Picota                                               |
| Ciruelo R. Claudia Verde                                    |
| Ciruelo Golden Japan                                        |
| Ciruelo Claudia Negra                                       |
| Higuera Verdal                                              |
| Higuera Breva                                               |
| Melocotonero Spring Crest                                   |
| Melocotonero Federica                                       |
| Parra Uva de Mesa                                           |
| Mandarino -Plantón joven                                    |
| Peral Castell                                               |
| Peral Williams                                              |
| Peral Conference                                            |
| Olivo Cipresino                                             |
| Albaricoquero                                               |
| Cerezo                                                      |
| Ciruelo                                                     |
| Granado                                                     |
| Higuera                                                     |
| Manzano                                                     |
| Melocotonero                                                |
| Membrillero                                                 |
| Arbustos Mix Maceta                                         |
| Mimosa Injerto CLASICA Dealbata                             |
| Mimosa Semilla Bayleyana                                    |
| Mimosa Semilla Espectabilis                                 |
| Mimosa Semilla Longifolia                                   |
| Mimosa Semilla Floribunda 4 estaciones                      |
| Abelia Floribunda                                           |
| Callistemom (Mix)                                           |
| Corylus Avellana \"Contorta\"                               |
| Escallonia (Mix)                                            |
| Evonimus Emerald Gayeti                                     |
| Evonimus Pulchellus                                         |
| Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                |
| Hibiscus Syriacus \"Pink Giant\" Rosa                       |
| Lonicera Nitida \"Maigrum\"                                 |
| Prunus pisardii                                             |
| Weigelia \"Bristol Ruby\"                                   |
| Leptospermum formado PIRAMIDE                               |
| Leptospermum COPA                                           |
| Nerium oleander-CALIDAD \"GARDEN\"                          |
| Nerium Oleander Arbusto GRANDE                              |
| Nerium oleander COPA  Calibre 6/8                           |
| ROSAL TREPADOR                                              |
| Solanum Jazminoide                                          |
| Wisteria Sinensis  azul, rosa, blanca                       |
| Wisteria Sinensis INJERTADAS DECÃ“                          |
| Bougamvillea Sanderiana Tutor                               |
| Bougamvillea Sanderiana Espaldera                           |
| Bougamvillea Sanderiana, 3 tut. piramide                    |
| Expositor Árboles clima mediterráneo                        |
| Expositor Árboles borde del mar                             |
| Brachychiton Acerifolius                                    |
| Cassia Corimbosa                                            |
| Cassia Corimbosa                                            |
| Chitalpa Summer Bells                                       |
| Erytrina Kafra                                              |
| Eucalyptus Citriodora                                       |
| Eucalyptus Ficifolia                                        |
| Hibiscus Syriacus  Var. Injertadas 1 Tallo                  |
| Lagunaria Patersonii                                        |
| Lagunaria Patersonii                                        |
| Morus Alba                                                  |
| Platanus Acerifolia                                         |
| Salix Babylonica  Pendula                                   |
| Tamarix  Ramosissima Pink Cascade                           |
| Tecoma Stands                                               |
| Tecoma Stands                                               |
| Tipuana Tipu                                                |
| Pleioblastus distichus-Bambú enano                          |
| Sasa palmata                                                |
| Phylostachys aurea                                          |
| Phylostachys Bambusa Spectabilis                            |
| Phylostachys biseti                                         |
| Pseudosasa japonica (Metake)                                |
| Pseudosasa japonica (Metake)                                |
| Cedrus Deodara \"Feeling Blue\" Novedad                     |
| Juniperus chinensis \"Blue Alps\"                           |
| Juniperus Chinensis Stricta                                 |
| Juniperus squamata \"Blue Star\"                            |
| Juniperus x media Phitzeriana verde                         |
| Bismarckia Nobilis                                          |
| Brahea Armata                                               |
| Brahea Edulis                                               |
| Butia Capitata                                              |
| Chamaerops Humilis                                          |
| Chamaerops Humilis \"Cerifera\"                             |
| Chrysalidocarpus Lutescens -ARECA                           |
| Cordyline Australis -DRACAENA                               |
| Cycas Revoluta                                              |
| Dracaena Drago                                              |
| Livistonia Decipiens                                        |
| Rhaphis Excelsa                                             |
| Sabal Minor                                                 |
| Trachycarpus Fortunei                                       |
| Washingtonia Robusta                                        |
| Zamia Furfuracaea                                           |

```SQL
Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

select distinct nombre from producto where codigo_producto in (select distinct codigo_producto from detalle_pedido);

```
|                           nombre                            |
|-------------------------------------------------------------|
| Sierra de Poda 400MM                                        |
| Pala                                                        |
| Rastrillo de Jardín                                         |
| Azadón                                                      |
| Ajedrea                                                     |
| Lavándula Dentata                                           |
| Mejorana                                                    |
| Melissa                                                     |
| Mentha Sativa                                               |
| Petrosilium Hortense (Peregil)                              |
| Salvia Mix                                                  |
| Thymus Citriodra (Tomillo limón)                            |
| Thymus Vulgaris                                             |
| Santolina Chamaecyparys                                     |
| Expositor Cítricos Mix                                      |
| Limonero 2 años injerto                                     |
| Nectarina                                                   |
| Nogal                                                       |
| Olea-Olivos                                                 |
| Peral                                                       |
| Limonero 30/40                                              |
| Kunquat                                                     |
| Kunquat  EXTRA con FRUTA                                    |
| Calamondin Copa                                             |
| Calamondin Copa EXTRA Con FRUTA                             |
| Rosal bajo 1Âª -En maceta-inicio brotación                  |
| ROSAL TREPADOR                                              |
| Naranjo -Plantón joven 1 año injerto                        |
| Pitimini rojo                                               |
| Rosal copa                                                  |
| Cerezo Napoleón                                             |
| Naranjo 2 años injerto                                      |
| Ciruelo Santa Rosa                                          |
| Ciruelo Friar                                               |
| Ciruelo Reina C. De Ollins                                  |
| Granado Mollar de Elche                                     |
| Higuera Napolitana                                          |
| Naranjo calibre 8/10                                        |
| Manzano Starking Delicious                                  |
| Manzano Reineta                                             |
| Manzano Golden Delicious                                    |
| Membrillero Gigante de Wranja                               |
| Melocotonero Amarillo de Agosto                             |
| Melocotonero Paraguayo                                      |
| Nogal Común                                                 |
| Peral Blanq. de Aranjuez                                    |
| Níspero Tanaca                                              |
| Kaki Rojo Brillante                                         |
| Albaricoquero                                               |
| Mandarino 2 años injerto                                    |
| Cerezo                                                      |
| Mandarino calibre 8/10                                      |
| Ciruelo                                                     |
| Granado                                                     |
| Higuera                                                     |
| Limonero -Plantón joven                                     |
| Kaki                                                        |
| Manzano                                                     |
| Limonero calibre 8/10                                       |
| Níspero                                                     |
| Melocotonero                                                |
| Expositor Mimosa Semilla Mix                                |
| Mimosa Semilla Bayleyana                                    |
| Mimosa Semilla Cyanophylla                                  |
| Forsytia Intermedia \"Lynwood\"                             |
| Hibiscus Syriacus  \"Diana\" -Blanco Puro                   |
| Laurus Nobilis Arbusto - Ramificado Bajo                    |
| Lonicera Nitida                                             |
| Lonicera Pileata                                            |
| Philadelphus \"Virginal\"                                   |
| Viburnum Tinus \"Eve Price\"                                |
| Camelia japonica                                            |
| Camelia japonica ejemplar                                   |
| Callistemom COPA                                            |
| Nerium oleander ARBOL Calibre 8/10                          |
| Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
| Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
| Bougamvillea Sanderiana Tutor                               |
| Bougamvillea roja, naranja                                  |
| Expositor Árboles clima continental                         |
| Acer Negundo                                                |
| Acer platanoides                                            |
| Acer Pseudoplatanus                                         |
| Brachychiton Discolor                                       |
| Brachychiton Rupestris                                      |
| Erytrina Kafra                                              |
| Eucalyptus Ficifolia                                        |
| Lagunaria patersonii  calibre 8/10                          |
| Morus Alba  calibre 8/10                                    |
| Prunus pisardii                                             |
| Robinia Pseudoacacia Casque Rouge                           |
| Sesbania Punicea                                            |
| Tamarix  Ramosissima Pink Cascade                           |
| Sasa palmata                                                |
| Phylostachys biseti                                         |
| Cedrus Deodara                                              |
| Juniperus horizontalis Wiltonii                             |
| Pinus Canariensis                                           |
| Pinus Halepensis                                            |
| Pinus Pinea -Pino Piñonero                                  |
| Thuja Esmeralda                                             |
| Tuja Occidentalis Woodwardii                                |
| Tuja orientalis \"Aurea nana\"                              |
| Archontophoenix Cunninghamiana                              |
| Beucarnea Recurvata                                         |
| Bismarckia Nobilis                                          |
| Brahea Armata                                               |
| Brahea Edulis                                               |
| Butia Capitata                                              |
| Chamaerops Humilis                                          |
| Dracaena Drago                                              |
| Jubaea Chilensis                                            |
| Livistonia Australis                                        |
| Phoenix Canariensis                                         |
| Rhaphis Humilis                                             |
| Trachycarpus Fortunei                                       |
| Washingtonia Robusta                                        |
| Yucca Jewel                                                 |
| Mimosa DEALBATA Gaulois Astier                              |


# Consultas variadas en SQL

```sql
Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.

select c.nombre_cliente, count(p.codigo_pedido) as pedidos_realizados from cliente as c left join pedido as p on c.codigo_cliente = p.codigo_cliente
group by c.nombre_cliente;

```
|         nombre_cliente         | pedidos_realizados |
|--------------------------------|--------------------|
| Agrojardin                     | 5                  |
| Aloha                          | 0                  |
| Americh Golf Management SL     | 0                  |
| Beragua                        | 5                  |
| Campohermoso                   | 0                  |
| Camunas Jardines S.L.          | 5                  |
| Club Golf Puerta del hierro    | 0                  |
| DaraDistribuciones             | 0                  |
| Dardena S.A.                   | 5                  |
| El Jardin Viviente S.L         | 5                  |
| El Prat                        | 0                  |
| Flores Marivi                  | 10                 |
| Flores S.L.                    | 5                  |
| Flowers, S.A                   | 0                  |
| Fuenla City                    | 0                  |
| Gardening Associates           | 9                  |
| Gerudo Valley                  | 5                  |
| GoldFish Garden                | 11                 |
| Golf S.A.                      | 5                  |
| Jardin de Flores               | 5                  |
| Jardineria Sara                | 10                 |
| Jardinerías Matías SL          | 5                  |
| Jardines y Mansiones Cactus SL | 5                  |
| Lasas S.A.                     | 0                  |
| Madrileña de riegos            | 0                  |
| Musée du Louvre                | 0                  |
| Naturagua                      | 5                  |
| Naturajardin                   | 0                  |
| Sotogrande                     | 5                  |
| Tendo Garden                   | 5                  |
| The Magic Garden               | 0                  |
| Top Campo                      | 0                  |
| Tutifruti S.A                  | 5                  |
| Vivero Humanes                 | 0                  |
| france telecom                 | 0                  |

```sql
Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.


select c.nombre_cliente, sum(p.total) as gasto_total
from cliente as c left join pago as p on p.codigo_cliente = c.codigo_cliente
left join pedido as pd on pd.codigo_cliente = c.codigo_cliente
where pd.codigo_pedido is not null group by c.nombre_cliente;

```
|         nombre_cliente         | gasto_total |
|--------------------------------|-------------|
| Agrojardin                     | 42445       |
| Beragua                        | 11950       |
| Camunas Jardines S.L.          | 11230       |
| Dardena S.A.                   | 20800       |
| El Jardin Viviente S.L         | 5855        |
| Flores Marivi                  | 43990       |
| Flores S.L.                    |             |
| Gardening Associates           | 98334       |
| Gerudo Valley                  | 409245      |
| GoldFish Garden                | 44000       |
| Golf S.A.                      | 1160        |
| Jardin de Flores               | 60405       |
| Jardineria Sara                | 78630       |
| Jardinerías Matías SL          | 54860       |
| Jardines y Mansiones Cactus SL | 94230       |
| Naturagua                      | 4645        |
| Sotogrande                     | 1360        |
| Tendo Garden                   | 118970      |
| Tutifruti S.A                  | 16605       |

```sql
Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.

select c.nombre_cliente, p.fecha_pedido from cliente as c join pedido as p on c.codigo_cliente=p.codigo_cliente where fecha_pedido regexp "^2008" order by fecha_pedido asc;
```
|         nombre_cliente         | fecha_pedido |
|--------------------------------|--------------|
| Tutifruti S.A                  | 2008-01-04   |
| Flores S.L.                    | 2008-03-05   |
| Gerudo Valley                  | 2008-03-10   |
| Jardines y Mansiones Cactus SL | 2008-03-17   |
| Jardines y Mansiones Cactus SL | 2008-03-17   |
| Tutifruti S.A                  | 2008-03-20   |
| Tendo Garden                   | 2008-06-20   |
| El Jardin Viviente S.L         | 2008-06-28   |
| Jardines y Mansiones Cactus SL | 2008-07-12   |
| Dardena S.A.                   | 2008-07-14   |
| Dardena S.A.                   | 2008-08-01   |
| Camunas Jardines S.L.          | 2008-08-03   |
| El Jardin Viviente S.L         | 2008-08-25   |
| Camunas Jardines S.L.          | 2008-09-04   |
| Jardines y Mansiones Cactus SL | 2008-10-01   |
| Tutifruti S.A                  | 2008-10-08   |
| Dardena S.A.                   | 2008-10-15   |
| Camunas Jardines S.L.          | 2008-10-15   |
| Flores S.L.                    | 2008-10-28   |
| Gerudo Valley                  | 2008-11-03   |
| GoldFish Garden                | 2008-11-09   |
| GoldFish Garden                | 2008-11-09   |
| El Jardin Viviente S.L         | 2008-11-10   |
| Jardin de Flores               | 2008-11-15   |
| Flores S.L.                    | 2008-11-29   |
| Jardines y Mansiones Cactus SL | 2008-12-07   |
| Dardena S.A.                   | 2008-12-10   |
| Jardin de Flores               | 2008-12-15   |
| Camunas Jardines S.L.          | 2008-12-19   |
| GoldFish Garden                | 2008-12-22   |
| GoldFish Garden                | 2008-12-22   |
| Flores Marivi                  | 2008-12-28   |
| Flores Marivi                  | 2008-12-28   |
| Tendo Garden                   | 2008-12-30   |

```sql

Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que 
no hayan realizado ningún pago.

select c.nombre_cliente, e.nombre as nombre_representante, e.apellido1 as apellido_representante, o.telefono
from cliente as c left join empleado as e on c.codigo_empleado_rep_ventas = e.codigo_empleado
left join oficina as o on e.codigo_oficina = o.codigo_oficina where c.codigo_cliente not in (select distinct codigo_cliente from pago);


```
|       nombre_cliente        | nombre_representante | apellido_representante |    telefono     |
|-----------------------------|----------------------|------------------------|-----------------|
| Lasas S.A.                  | Mariano              | López                  | +34 91 7514487  |
| Club Golf Puerta del hierro | Emmanuel             | Magaña                 | +34 93 3561182  |
| DaraDistribuciones          | Emmanuel             | Magaña                 | +34 93 3561182  |
| Madrileña de riegos         | Emmanuel             | Magaña                 | +34 93 3561182  |
| Lasas S.A.                  | Mariano              | López                  | +34 91 7514487  |
| Flowers, S.A                | Felipe               | Rosas                  | +34 925 867231  |
| Naturajardin                | Julian               | Bellinelli             | +61 2 9264 2451 |
| Americh Golf Management SL  | José Manuel          | Martinez               | +34 93 3561182  |
| Aloha                       | José Manuel          | Martinez               | +34 93 3561182  |
| El Prat                     | José Manuel          | Martinez               | +34 93 3561182  |
| Vivero Humanes              | Julian               | Bellinelli             | +61 2 9264 2451 |
| Fuenla City                 | Felipe               | Rosas                  | +34 925 867231  |
| Top Campo                   | Felipe               | Rosas                  | +34 925 867231  |
| Campohermoso                | Julian               | Bellinelli             | +61 2 9264 2451 |
| france telecom              | Lionel               | Narvaez                | +33 14 723 4404 |
| Musée du Louvre             | Lionel               | Narvaez                | +33 14 723 4404 |
| Flores S.L.                 | Michael              | Bolton                 | +1 650 219 4782 |
| The Magic Garden            | Michael              | Bolton                 | +1 650 219 4782 |

```sql
Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.

select c.nombre_cliente, e.nombre as nombre_representante, e.apellido1 as apellido_representante, o.ciudad
from cliente as c join empleado as e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina as o on e.codigo_oficina = o.codigo_oficina;
```
|         nombre_cliente         | nombre_representante | apellido_representante |        ciudad        |
|--------------------------------|----------------------|------------------------|----------------------|
| GoldFish Garden                | Walter Santiago      | Sanchez                | San Francisco        |
| Gardening Associates           | Walter Santiago      | Sanchez                | San Francisco        |
| Gerudo Valley                  | Lorena               | Paxton                 | Boston               |
| Tendo Garden                   | Lorena               | Paxton                 | Boston               |
| Lasas S.A.                     | Mariano              | López                  | Madrid               |
| Beragua                        | Emmanuel             | Magaña                 | Barcelona            |
| Club Golf Puerta del hierro    | Emmanuel             | Magaña                 | Barcelona            |
| Naturagua                      | Emmanuel             | Magaña                 | Barcelona            |
| DaraDistribuciones             | Emmanuel             | Magaña                 | Barcelona            |
| Madrileña de riegos            | Emmanuel             | Magaña                 | Barcelona            |
| Lasas S.A.                     | Mariano              | López                  | Madrid               |
| Camunas Jardines S.L.          | Mariano              | López                  | Madrid               |
| Dardena S.A.                   | Mariano              | López                  | Madrid               |
| Jardin de Flores               | Julian               | Bellinelli             | Sydney               |
| Flores Marivi                  | Felipe               | Rosas                  | Talavera de la Reina |
| Flowers, S.A                   | Felipe               | Rosas                  | Talavera de la Reina |
| Naturajardin                   | Julian               | Bellinelli             | Sydney               |
| Golf S.A.                      | José Manuel          | Martinez               | Barcelona            |
| Americh Golf Management SL     | José Manuel          | Martinez               | Barcelona            |
| Aloha                          | José Manuel          | Martinez               | Barcelona            |
| El Prat                        | José Manuel          | Martinez               | Barcelona            |
| Sotogrande                     | José Manuel          | Martinez               | Barcelona            |
| Vivero Humanes                 | Julian               | Bellinelli             | Sydney               |
| Fuenla City                    | Felipe               | Rosas                  | Talavera de la Reina |
| Jardines y Mansiones Cactus SL | Lucio                | Campoamor              | Madrid               |
| Jardinerías Matías SL          | Lucio                | Campoamor              | Madrid               |
| Agrojardin                     | Julian               | Bellinelli             | Sydney               |
| Top Campo                      | Felipe               | Rosas                  | Talavera de la Reina |
| Jardineria Sara                | Felipe               | Rosas                  | Talavera de la Reina |
| Campohermoso                   | Julian               | Bellinelli             | Sydney               |
| france telecom                 | Lionel               | Narvaez                | Paris                |
| Musée du Louvre                | Lionel               | Narvaez                | Paris                |
| Tutifruti S.A                  | Mariko               | Kishi                  | Sydney               |
| Flores S.L.                    | Michael              | Bolton                 | San Francisco        |
| The Magic Garden               | Michael              | Bolton                 | San Francisco        |
| El Jardin Viviente S.L         | Mariko               | Kishi                  | Sydney               |


```sql
Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

select e.nombre, e.apellido1, e.apellido2, e.puesto, o.telefono from empleado as e left join oficina as o on e.codigo_oficina = o.codigo_oficina
where e.codigo_empleado not in (select distinct codigo_empleado_rep_ventas from cliente where codigo_empleado_rep_ventas is not null);
```
|   nombre    | apellido1  | apellido2 |        puesto         |    telefono     |
|-------------|------------|-----------|-----------------------|-----------------|
| Marcos      | Magaña     | Perez     | Director General      | +34 925 867231  |
| Ruben       | López      | Martinez  | Subdirector Marketing | +34 925 867231  |
| Alberto     | Soria      | Carrasco  | Subdirector Ventas    | +34 925 867231  |
| Maria       | Solís      | Jerez     | Secretaria            | +34 925 867231  |
| Juan Carlos | Ortiz      | Serrano   | Representante Ventas  | +34 925 867231  |
| Carlos      | Soria      | Jimenez   | Director Oficina      | +34 91 7514487  |
| Hilario     | Rodriguez  | Huertas   | Representante Ventas  | +34 91 7514487  |
| David       | Palma      | Aceituno  | Representante Ventas  | +34 93 3561182  |
| Oscar       | Palma      | Aceituno  | Representante Ventas  | +34 93 3561182  |
| Francois    | Fignon     |           | Director Oficina      | +33 14 723 4404 |
| Laurent     | Serra      |           | Representante Ventas  | +33 14 723 4404 |
| Hilary      | Washington |           | Director Oficina      | +1 215 837 0825 |
| Marcus      | Paxton     |           | Representante Ventas  | +1 215 837 0825 |
| Nei         | Nishikori  |           | Director Oficina      | +81 33 224 5000 |
| Narumi      | Riko       |           | Representante Ventas  | +81 33 224 5000 |
| Takuma      | Nomura     |           | Representante Ventas  | +81 33 224 5000 |
| Amy         | Johnson    |           | Director Oficina      | +44 20 78772041 |
| Larry       | Westfalls  |           | Representante Ventas  | +44 20 78772041 |
| John        | Walton     |           | Representante Ventas  | +44 20 78772041 |
| Kevin       | Fallmer    |           | Director Oficina      | +61 2 9264 2451 |


```sql
Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.

select o.ciudad, count(e.codigo_empleado) as cantidad_empleados from oficina as o left join empleado as e on o.codigo_oficina = e.codigo_oficina group by o.ciudad;
```
|        ciudad        | cantidad_empleados |
|----------------------|--------------------|
| Barcelona            | 4                  |
| Boston               | 3                  |
| Londres              | 3                  |
| Madrid               | 4                  |
| Paris                | 3                  |
| San Francisco        | 2                  |
| Sydney               | 3                  |
| Talavera de la Reina | 6                  |
| Tokyo                | 3                  |


