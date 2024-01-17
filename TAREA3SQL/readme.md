```markdown

sqlite> select * from empleados
   ...> ;
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
sqlite> 


sqlite> SELECT UPPER(nombre) AS nombre_mayusculas, LOWER(nombre) AS nombre_minusculas FROM empleados;
+-------------------+-------------------+
| nombre_mayusculas | nombre_minusculas |
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
sqlite> 


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


sqlite> SELECT CURRENT_DATE AS fecha_actual FROM empleados LIMIT 1;
+--------------+
| fecha_actual |
+--------------+
| 2024-01-17   |
+--------------+

sqlite> SELECT AVG(salario) AS promedio_salario FROM empleados;
+------------------+
| promedio_salario |
+------------------+
| 57000.0          |
+------------------+

sqlite> SELECT nombre, CAST(salario AS INTEGER) AS salario_entero FROM empleados;
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

sqlite> SELECT nombre|| " " || departamento As nombre_y_departamento FROM empleados;
+---------------------------+
|   nombre_y_departamento   |
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


sqlite> SELECT nombre|| "-" || departamento As nombre_y_departamento FROM empleados;
+---------------------------+
|   nombre_y_departamento   |
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


sqlite> SELECT nombre,CASE WHEN salario > 50000 THEN 'Alto' ELSE 'Bajo' END AS rango_salario FROM empleados;
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

sqlite> SELECT SUM(salario) AS suma_salario FROM empleados;
+--------------+
| suma_salario |
+--------------+
| 1140000.0    |
+--------------+

sqlite> SELECT nombre, ROUND(salario, 2) AS salario_redondeado FROM empleados;
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

sqlite> SELECT nombre, LENGTH(nombre) as long_nombre from empleados;
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

sqlite> select departamento,count(*) from empleados group by departamento;
+------------------+----------+
|   departamento   | count(*) |
+------------------+----------+
| Recursos Humanos | 6        |
| TI               | 7        |
| Ventas           | 7        |
+------------------+----------+

sqlite> SELECT CURRENT_TIME from empleados;
+--------------+
| CURRENT_TIME |
+--------------+
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
| 22:41:25     |
+--------------+

sqlite> select salario, cast(salario as float) from empleados;
+---------+------------------------+
| salario | cast(salario as float) |
+---------+------------------------+
| 50000.0 | 50000.0                |
| 60000.0 | 60000.0                |
| 55000.0 | 55000.0                |
| 48000.0 | 48000.0                |
| 70000.0 | 70000.0                |
| 52000.0 | 52000.0                |
| 48000.0 | 48000.0                |
| 65000.0 | 65000.0                |
| 51000.0 | 51000.0                |
| 55000.0 | 55000.0                |
| 72000.0 | 72000.0                |
| 49000.0 | 49000.0                |
| 60000.0 | 60000.0                |
| 53000.0 | 53000.0                |
| 68000.0 | 68000.0                |
| 47000.0 | 47000.0                |
| 71000.0 | 71000.0                |
| 54000.0 | 54000.0                |
| 49000.0 | 49000.0                |
| 63000.0 | 63000.0                |
+---------+------------------------+

sqlite> select cast(salario as float) as salario_flotante from empleados;
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


sqlite> select substr(nombre, 1,3) as tres_primeras_letras from empleados;
+----------------------+
| tres_primeras_letras |
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

sqlite> select * from empleados where (departamento like 'Ventas') order by salario > 52000;
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


sqlite> select * from empleados where (nombre like '%a%') order by salario asc;
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

sqlite> select nombre, salario from empleados order by salario desc limit 5;
+-----------+---------+
|  nombre   | salario |
+-----------+---------+
| Diego     | 72000.0 |
| Alejandro | 71000.0 |
| Pedro     | 70000.0 |
| Raúl      | 68000.0 |
| Carmen    | 65000.0 |
+-----------+---------+
sqlite> select * from empleados order by salario desc limit 5;
+----+-----------+---------+--------------+
| id |  nombre   | salario | departamento |
+----+-----------+---------+--------------+
| 11 | Diego     | 72000.0 | TI           |
| 17 | Alejandro | 71000.0 | TI           |
| 5  | Pedro     | 70000.0 | TI           |
| 15 | Raúl      | 68000.0 | Ventas       |
| 8  | Carmen    | 65000.0 | TI           |
+----+-----------+---------+--------------+


sqlite> select * from empleados where (nombre like '%a%') order by salario asc;
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
sqlite> select nombre, salario from empleados where (nombre like 'M%' or nombre like 'N%') and salario  > 50000;
+---------+---------+
| nombre  | salario |
+---------+---------+
| María   | 60000.0 |
| Miguel  | 51000.0 |
| Natalia | 54000.0 |
+---------+---------+

sqlite> select * from empleados where departamento = 'Recursos Humanos' and salario between 45000 and 55000 order by salario asc;
+----+----------+---------+------------------+
| id |  nombre  | salario |   departamento   |
+----+----------+---------+------------------+
| 16 | Patricia | 47000.0 | Recursos Humanos |
| 4  | Ana      | 48000.0 | Recursos Humanos |
| 7  | Javier   | 48000.0 | Recursos Humanos |
| 19 | Roberto  | 49000.0 | Recursos Humanos |
| 10 | Elena    | 55000.0 | Recursos Humanos |
+----+----------+---------+------------------+

sqlite> select * from empleados where (nombre like 'M%' or nombre like 'N%') and salario  > 50000;
+----+---------+---------+--------------+
| id | nombre  | salario | departamento |
+----+---------+---------+--------------+
| 2  | María   | 60000.0 | TI           |
| 9  | Miguel  | 51000.0 | Ventas       |
| 18 | Natalia | 54000.0 | Ventas       |
+----+---------+---------+--------------+

sqlite> select nombre from empleados where departamento = 'Recursos Humanos' and salario between 45000 and 55000 order by salario asc;
+----------+
|  nombre  |
+----------+
| Patricia |
| Ana      |
| Javier   |
| Roberto  |
| Elena    |
+----------+
sqlite> select * from empleados where departamento = 'Recursos Humanos' and salario between 45000 and 55000 order by salario asc;
+----+----------+---------+------------------+
| id |  nombre  | salario |   departamento   |
+----+----------+---------+------------------+
| 16 | Patricia | 47000.0 | Recursos Humanos |
| 4  | Ana      | 48000.0 | Recursos Humanos |
| 7  | Javier   | 48000.0 | Recursos Humanos |
| 19 | Roberto  | 49000.0 | Recursos Humanos |
| 10 | Elena    | 55000.0 | Recursos Humanos |
+----+----------+---------+------------------+


sqlite> select distinct(salario) from empleados order by salario asc;
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



sqlite> select * from empleados where (departamento like 'Ventas' or departamento like 'TI') order by nombre;
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


sqlite> select * from empleados where departamento like '%Ventas%' and (nombre like '%o' or nombre like '%a');
+----+---------+---------+--------------+
| id | nombre  | salario | departamento |
+----+---------+---------+--------------+
| 6  | Laura   | 52000.0 | Ventas       |
| 12 | Sofía   | 49000.0 | Ventas       |
| 18 | Natalia | 54000.0 | Ventas       |
+----+---------+---------+--------------+






sqlite> select * from empleados where (departamento like 'Ventas' or departamento like 'TI') order by nombre;
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
sqlite> select distinct(salario) from empleados order by salario asc;
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
sqlite> select * from empleados where salario not between 55000 and 70000 order by departamento;
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

select * from empleados where departamento like ‘Recursos Humanos’ and nombre not like '%e%';
sqlite> select * from empleados where departamento like 'Ventas' and (nombre like '%o' or nombre like '%a');
+----+---------+---------+--------------+
| id | nombre  | salario | departamento |
+----+---------+---------+--------------+
| 6  | Laura   | 52000.0 | Ventas       |
| 12 | Sofía   | 49000.0 | Ventas       |
| 18 | Natalia | 54000.0 | Ventas       |
+----+---------+---------+--------------+


```

