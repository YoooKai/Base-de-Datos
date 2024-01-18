# Realización de consultas

- Tabla completa

```sql
select * from empleados
```
```code
+----+-----------+---------+------------------+
| id |  nombre   | salario |   departamento   |
+----+-----------+---------+------------------+
| 1  | Juan      | 50000.0 | Ventas           |
| 2  | María     | 60000.0 | TI               |
| 3  | Carlos    | 55000.0 | Ventas           |
| 4  | Ana       | 48000.0 | Recursos Humanos |
| 5  | Pedro     | 70000.0 | TI               |
| 6  | Laura     | 52000.0 | Ventas           |
| 7  | Javier    | 48000.0 | Recursos Humanos |
| 8  | Carmen    | 65000.0 | TI               |
| 9  | Miguel    | 51000.0 | Ventas           |
| 10 | Elena     | 55000.0 | Recursos Humanos |
| 11 | Diego     | 72000.0 | TI               |
| 12 | Sofía     | 49000.0 | Ventas           |
| 13 | Andrés    | 60000.0 | Recursos Humanos |
| 14 | Isabel    | 53000.0 | TI               |
| 15 | Raúl      | 68000.0 | Ventas           |
| 16 | Patricia  | 47000.0 | Recursos Humanos |
| 17 | Alejandro | 71000.0 | TI               |
| 18 | Natalia   | 54000.0 | Ventas           |
| 19 | Roberto   | 49000.0 | Recursos Humanos |
| 20 | Beatriz   | 63000.0 | TI               |
+----+-----------+---------+------------------+

```
- Funciones UPPER y LOWER:

  1. Muestra el nombre de todos los empleados en mayúsculas.

```sql
SELECT UPPER(nombre) AS mayusculas, LOWER(nombre) AS minusculas FROM empleados;
```

```code
+-------------------+-------------------+
| mayusculas        | minusculas        |
+-------------------+-------------------+
| JUAN              | juan              |
| MARíA             | maría             |
| CARLOS            | carlos            |
| ANA               | ana               |
| PEDRO             | pedro             |
| LAURA             | laura             |
| JAVIER            | javier            |
| CARMEN            | carmen            |
| MIGUEL            | miguel            |
| ELENA             | elena             |
| DIEGO             | diego             |
| SOFíA             | sofía             |
| ANDRéS            | andrés            |
| ISABEL            | isabel            |
| RAúL              | raúl              |
| PATRICIA          | patricia          |
| ALEJANDRO         | alejandro         |
| NATALIA           | natalia           |
| ROBERTO           | roberto           |
| BEATRIZ           | beatriz           |
+-------------------+-------------------+
```




- Funciones Numéricas:

    2. Calcula el valor absoluto del salario de todos los empleados.
```sql
SELECT nombre, ABS(salario) AS valor_absoluto FROM empleados;

```
```code
+-----------+----------------+
|  nombre   | valor_absoluto |
+-----------+----------------+
| Juan      | 50000.0        |
| María     | 60000.0        |
| Carlos    | 55000.0        |
| Ana       | 48000.0        |
| Pedro     | 70000.0        |
| Laura     | 52000.0        |
| Javier    | 48000.0        |
| Carmen    | 65000.0        |
| Miguel    | 51000.0        |
| Elena     | 55000.0        |
| Diego     | 72000.0        |
| Sofía     | 49000.0        |
| Andrés    | 60000.0        |
| Isabel    | 53000.0        |
| Raúl      | 68000.0        |
| Patricia  | 47000.0        |
| Alejandro | 71000.0        |
| Natalia   | 54000.0        |
| Roberto   | 49000.0        |
| Beatriz   | 63000.0        |
+-----------+----------------+
```

- Funciones de Fecha y Hora:

    3. Muestra la fecha actual.
```sql
SELECT CURRENT_DATE AS fecha_actual FROM empleados LIMIT 1;
```
```code
+--------------+
| fecha_actual |
+--------------+
| 2024-01-17   |
+--------------+
```

- Funciones de Agregación:

    4. Calcula el promedio de salarios de todos los empleados.
```sql
SELECT AVG(salario) AS promedio_salario FROM empleados;
```
```code
+------------------+
| promedio_salario |
+------------------+
| 57000.0          |
+------------------+
```

    6. Convierte la cadena '123' a un valor entero.

```sql
SELECT nombre, CAST(salario AS INTEGER) as salario_entero FROM empleados;
```
```sql
---salario en entero
+-----------+----------------+
|  nombre   | salario_entero |
+-----------+----------------+
| Juan      | 50000          |
| María     | 60000          |
| Carlos    | 55000          |
| Ana       | 48000          |
| Pedro     | 70000          |
| Laura     | 52000          |
| Javier    | 48000          |
| Carmen    | 65000          |
| Miguel    | 51000          |
| Elena     | 55000          |
| Diego     | 72000          |
| Sofía     | 49000          |
| Andrés    | 60000          |
| Isabel    | 53000          |
| Raúl      | 68000          |
| Patricia  | 47000          |
| Alejandro | 71000          |
| Natalia   | 54000          |
| Roberto   | 49000          |
| Beatriz   | 63000          |
+-----------+----------------+
```
```sql
---la cadea 123 en valor entero

select cast('123' as integer) as valor_entero


┌──────────────┐
│ valor_entero │
├──────────────┤
│ 123          │
└──────────────┘
```

- Funciones de Manipulación de Cadenas:

    7. Concatena el nombre y el departamento de cada empleado.

```sql
SELECT nombre|| " " || departamento As nombre_departamento FROM empleados;
```

```code
+---------------------------+
|    nombre_departamento    |
+---------------------------+
| Juan Ventas               |
| María TI                  |
| Carlos Ventas             |
| Ana Recursos Humanos      |
| Pedro TI                  |
| Laura Ventas              |
| Javier Recursos Humanos   |
| Carmen TI                 |
| Miguel Ventas             |
| Elena Recursos Humanos    |
| Diego TI                  |
| Sofía Ventas              |
| Andrés Recursos Humanos   |
| Isabel TI                 |
| Raúl Ventas               |
| Patricia Recursos Humanos |
| Alejandro TI              |
| Natalia Ventas            |
| Roberto Recursos Humanos  |
| Beatriz TI                |
+---------------------------+
```
- Funciones de Manipulación de Cadenas (CONCAT_WS):

    8. Concatena el nombre y el departamento de cada empleado con un guion como separador.
```sql
SELECT nombre|| "-" || departamento As nombre_departamento FROM empleados;
```
```code
+---------------------------+
|    nombre_departamento    |
+---------------------------+
| Juan-Ventas               |
| María-TI                  |
| Carlos-Ventas             |
| Ana-Recursos Humanos      |
| Pedro-TI                  |
| Laura-Ventas              |
| Javier-Recursos Humanos   |
| Carmen-TI                 |
| Miguel-Ventas             |
| Elena-Recursos Humanos    |
| Diego-TI                  |
| Sofía-Ventas              |
| Andrés-Recursos Humanos   |
| Isabel-TI                 |
| Raúl-Ventas               |
| Patricia-Recursos Humanos |
| Alejandro-TI              |
| Natalia-Ventas            |
| Roberto-Recursos Humanos  |
| Beatriz-TI                |
+---------------------------+
```
- Funciones de Control de Flujo (CASE):

    9. Categoriza a los empleados según sus salarios.
```sql
SELECT nombre,CASE WHEN salario > 50000 THEN 'Alto' ELSE 'Bajo' END AS rango_salario FROM empleados;
```
```code
+-----------+---------------+
|  nombre   | rango_salario |
+-----------+---------------+
| Juan      | Bajo          |
| María     | Alto          |
| Carlos    | Alto          |
| Ana       | Bajo          |
| Pedro     | Alto          |
| Laura     | Alto          |
| Javier    | Bajo          |
| Carmen    | Alto          |
| Miguel    | Alto          |
| Elena     | Alto          |
| Diego     | Alto          |
| Sofía     | Bajo          |
| Andrés    | Alto          |
| Isabel    | Alto          |
| Raúl      | Alto          |
| Patricia  | Bajo          |
| Alejandro | Alto          |
| Natalia   | Alto          |
| Roberto   | Bajo          |
| Beatriz   | Alto          |
+-----------+---------------+
```
- Funciones de Agregación (SUM):

    10. Calcula la suma total de salarios de todos los empleados.
```sql
SELECT SUM(salario) AS suma_salario FROM empleados;
```
```code
+--------------+
| suma_salario |
+--------------+
| 1140000.0    |
+--------------+
```
- Funciones Numéricas (ROUND):

    11. Redondea el salario de todos los empleados a dos decimales.
```sql
SELECT nombre, ROUND(salario, 2) AS redondeo_salario FROM empleados;
```
```code
+-----------+--------------------+
|  nombre   | salario_redondeado |
+-----------+--------------------+
| Juan      | 50000.0            |
| María     | 60000.0            |
| Carlos    | 55000.0            |
| Ana       | 48000.0            |
| Pedro     | 70000.0            |
| Laura     | 52000.0            |
| Javier    | 48000.0            |
| Carmen    | 65000.0            |
| Miguel    | 51000.0            |
| Elena     | 55000.0            |
| Diego     | 72000.0            |
| Sofía     | 49000.0            |
| Andrés    | 60000.0            |
| Isabel    | 53000.0            |
| Raúl      | 68000.0            |
| Patricia  | 47000.0            |
| Alejandro | 71000.0            |
| Natalia   | 54000.0            |
| Roberto   | 49000.0            |
| Beatriz   | 63000.0            |
+-----------+--------------------+
```
- Funciones de Manipulación de Cadenas (LENGTH):

    12. Muestra la longitud de cada nombre de empleado.
```sql
SELECT nombre, LENGTH(nombre) as long_nombre from empleados;
```
```code
+-----------+-------------+
|  nombre   | long_nombre |
+-----------+-------------+
| Juan      | 4           |
| María     | 5           |
| Carlos    | 6           |
| Ana       | 3           |
| Pedro     | 5           |
| Laura     | 5           |
| Javier    | 6           |
| Carmen    | 6           |
| Miguel    | 6           |
| Elena     | 5           |
| Diego     | 5           |
| Sofía     | 5           |
| Andrés    | 6           |
| Isabel    | 6           |
| Raúl      | 4           |
| Patricia  | 8           |
| Alejandro | 9           |
| Natalia   | 7           |
| Roberto   | 7           |
| Beatriz   | 7           |
+-----------+-------------+
```
- Funciones de Agregación (COUNT):

    13. Cuenta el número total de empleados en cada departamento.

```sql
SELECT departamento,count(*) FROM empleados GROUP BY departamento;
```
```code
+------------------+----------+
|   departamento   | count(*) |
+------------------+----------+
| Recursos Humanos | 6        |
| TI               | 7        |
| Ventas           | 7        |
+------------------+----------+
```
- Funciones de Fecha y Hora (CURRENT_TIME):

    14. Muestra la hora actual.
```sql
SELECT current_time;
```
```code
┌──────────────┐
│ current_time │
├──────────────┤
│ 22:47:43     │
└──────────────┘
```

- Funciones de Conversión (CAST):

    15. Convierte el salario a un valor de punto flotante.
```sql
select cast(salario AS FLOAT) AS salario_flotante FROM empleados;
```
```code
+------------------+
| salario_flotante |
+------------------+
| 50000.0          |
| 60000.0          |
| 55000.0          |
| 48000.0          |
| 70000.0          |
| 52000.0          |
| 48000.0          |
| 65000.0          |
| 51000.0          |
| 55000.0          |
| 72000.0          |
| 49000.0          |
| 60000.0          |
| 53000.0          |
| 68000.0          |
| 47000.0          |
| 71000.0          |
| 54000.0          |
| 49000.0          |
| 63000.0          |
+------------------+
```
- Funciones de Manipulación de Cadenas (SUBSTR):

    16. Muestra los primeros tres caracteres de cada nombre de empleado.
```sql
SELECT substr(nombre, 1,3) AS nombre_tres_letras FROM empleados;
```
```
+----------------------+
|   nombre_tres_letras |
+----------------------+
| Jua                  |
| Mar                  |
| Car                  |
| Ana                  |
| Ped                  |
| Lau                  |
| Jav                  |
| Car                  |
| Mig                  |
| Ele                  |
| Die                  |
| Sof                  |
| And                  |
| Isa                  |
| Raú                  |
| Pat                  |
| Ale                  |
| Nat                  |
| Rob                  |
| Bea                  |
+----------------------+
```

- Order By and Like.
17. Empleados en el departamento de 'Ventas' con salarios superiores a 52000.
```sql
SELECT * FROM empleados WHERE (departamento LIKE 'Ventas') ORDER BY salario > 52000;
```
```
+----+---------+---------+--------------+
| id | nombre  | salario | departamento |
+----+---------+---------+--------------+
| 1  | Juan    | 50000.0 | Ventas       |
| 6  | Laura   | 52000.0 | Ventas       |
| 9  | Miguel  | 51000.0 | Ventas       |
| 12 | Sofía   | 49000.0 | Ventas       |
| 3  | Carlos  | 55000.0 | Ventas       |
| 15 | Raúl    | 68000.0 | Ventas       |
| 18 | Natalia | 54000.0 | Ventas       |
+----+---------+---------+--------------+
```
18. Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.
```SQL
SELECT * FROM empleados WHERE (nombre like '%a%') order by salario asc;
```
```
+----+-----------+---------+------------------+
| id |  nombre   | salario |   departamento   |
+----+-----------+---------+------------------+
| 16 | Patricia  | 47000.0 | Recursos Humanos |
| 4  | Ana       | 48000.0 | Recursos Humanos |
| 7  | Javier    | 48000.0 | Recursos Humanos |
| 12 | Sofía     | 49000.0 | Ventas           |
| 1  | Juan      | 50000.0 | Ventas           |
| 6  | Laura     | 52000.0 | Ventas           |
| 14 | Isabel    | 53000.0 | TI               |
| 18 | Natalia   | 54000.0 | Ventas           |
| 3  | Carlos    | 55000.0 | Ventas           |
| 10 | Elena     | 55000.0 | Recursos Humanos |
| 2  | María     | 60000.0 | TI               |
| 13 | Andrés    | 60000.0 | Recursos Humanos |
| 20 | Beatriz   | 63000.0 | TI               |
| 8  | Carmen    | 65000.0 | TI               |
| 15 | Raúl      | 68000.0 | Ventas           |
| 17 | Alejandro | 71000.0 | TI               |
+----+-----------+---------+------------------+
```
19. Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.
```sql
 select * from empleados where departamento = 'Recursos Humanos' and salario between 45000 and 55000 order by salario asc;
```
```
+----+----------+---------+------------------+
| id |  nombre  | salario |   departamento   |
+----+----------+---------+------------------+
| 16 | Patricia | 47000.0 | Recursos Humanos |
| 4  | Ana      | 48000.0 | Recursos Humanos |
| 7  | Javier   | 48000.0 | Recursos Humanos |
| 19 | Roberto  | 49000.0 | Recursos Humanos |
| 10 | Elena    | 55000.0 | Recursos Humanos |
+----+----------+---------+------------------+
```
20. Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.
```SQL
 select * from empleados order by salario desc limit 5;
```
```
+----+-----------+---------+--------------+
| id |  nombre   | salario | departamento |
+----+-----------+---------+--------------+
| 11 | Diego     | 72000.0 | TI           |
| 17 | Alejandro | 71000.0 | TI           |
| 5  | Pedro     | 70000.0 | TI           |
| 15 | Raúl      | 68000.0 | Ventas       |
| 8  | Carmen    | 65000.0 | TI           |
+----+-----------+---------+--------------+
```
21. Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.
```sql
select nombre, salario from empleados where (nombre like 'M%' or nombre like 'N%') and salario  > 50000;
```
```
+---------+---------+
| nombre  | salario |
+---------+---------+
| María   | 60000.0 |
| Miguel  | 51000.0 |
| Natalia | 54000.0 |
+---------+---------+
```
22. Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.
```sql
select * from empleados where (departamento like 'Ventas' or departamento like 'TI') order by nombre;
```
```code
+----+-----------+---------+--------------+
| id |  nombre   | salario | departamento |
+----+-----------+---------+--------------+
| 17 | Alejandro | 71000.0 | TI           |
| 20 | Beatriz   | 63000.0 | TI           |
| 3  | Carlos    | 55000.0 | Ventas       |
| 8  | Carmen    | 65000.0 | TI           |
| 11 | Diego     | 72000.0 | TI           |
| 14 | Isabel    | 53000.0 | TI           |
| 1  | Juan      | 50000.0 | Ventas       |
| 6  | Laura     | 52000.0 | Ventas       |
| 2  | María     | 60000.0 | TI           |
| 9  | Miguel    | 51000.0 | Ventas       |
| 18 | Natalia   | 54000.0 | Ventas       |
| 5  | Pedro     | 70000.0 | TI           |
| 15 | Raúl      | 68000.0 | Ventas       |
| 12 | Sofía     | 49000.0 | Ventas       |
+----+-----------+---------+--------------+
```
23. Empleados con salarios únicos (eliminando duplicados) en orden ascendente.
```sql
 select distinct(salario) from empleados order by salario asc;
```
```
+---------+
| salario |
+---------+
| 47000.0 |
| 48000.0 |
| 49000.0 |
| 50000.0 |
| 51000.0 |
| 52000.0 |
| 53000.0 |
| 54000.0 |
| 55000.0 |
| 60000.0 |
| 63000.0 |
| 65000.0 |
| 68000.0 |
| 70000.0 |
| 71000.0 |
| 72000.0 |
+---------+
```
24. Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.
```sql
select * from empleados where departamento like '%Ventas%' and (nombre like '%o' or nombre like '%a');
```
```
+----+---------+---------+--------------+
| id | nombre  | salario | departamento |
+----+---------+---------+--------------+
| 6  | Laura   | 52000.0 | Ventas       |
| 12 | Sofía   | 49000.0 | Ventas       |
| 18 | Natalia | 54000.0 | Ventas       |
+----+---------+---------+--------------+

```
25. Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.
```sql
select * from empleados where salario not between 55000 and 70000 order by departamento;
```
```
+----+-----------+---------+------------------+
| id |  nombre   | salario |   departamento   |
+----+-----------+---------+------------------+
| 4  | Ana       | 48000.0 | Recursos Humanos |
| 7  | Javier    | 48000.0 | Recursos Humanos |
| 16 | Patricia  | 47000.0 | Recursos Humanos |
| 19 | Roberto   | 49000.0 | Recursos Humanos |
| 11 | Diego     | 72000.0 | TI               |
| 14 | Isabel    | 53000.0 | TI               |
| 17 | Alejandro | 71000.0 | TI               |
| 1  | Juan      | 50000.0 | Ventas           |
| 6  | Laura     | 52000.0 | Ventas           |
| 9  | Miguel    | 51000.0 | Ventas           |
| 12 | Sofía     | 49000.0 | Ventas           |
| 18 | Natalia   | 54000.0 | Ventas           |
+----+-----------+---------+------------------+
```
26. Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.
```sql
select * from empleados where departamento like ‘Recursos Humanos’ and nombre not like '%e%';
```
```
+----+----------+---------+------------------+
| id |  nombre  | salario |   departamento   |
+----+----------+---------+------------------+
| 4  | Ana  	| 48000.0 | Recursos Humanos |
| 13 | Andrés   | 60000.0 | Recursos Humanos |
| 16 | Patricia | 47000.0 | Recursos Humanos |
+----+----------+---------+------------------+

```
