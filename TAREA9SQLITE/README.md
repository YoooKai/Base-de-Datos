# TAREA 9

```sql





--ALUMNOS
+----+--------+------+-----------+
| id | nombre | edad | direccion |
+----+--------+------+-----------+
| 1  | Juan   | 20   | Calle A   |
| 2  | María  | 21   | Calle B   |
| 3  | Pedro  | 19   | Calle C   |
| 4  | Laura  | 22   | Calle D   |
| 5  | Carlos | 20   | Calle E   |
| 6  | Ana    | 19   | Calle F   |
| 7  | Sofía  | 21   | Calle G   |
| 8  | Diego  | 20   | Calle H   |
| 9  | Lucía  | 22   | Calle I   |
| 10 | Miguel | 19   | Calle J   |
+----+--------+------+-----------+

--clases
+----+------------------------+-------------+------------+
| id |         nombre         |   materia   |  profesor  |
+----+------------------------+-------------+------------+
| 1  | Matemáticas 101        | Matemáticas | Profesor X |
| 2  | Historia Antigua       | Historia    | Profesor Y |
| 3  | Literatura Moderna     | Literatura  | Profesor Z |
| 4  | Biología Avanzada      | Biología    | Profesor W |
| 5  | Química Orgánica       | Química     | Profesor V |
| 6  | Física Cuántica        | Física      | Profesor U |
| 7  | Arte Contemporáneo     | Arte        | Profesor T |
| 8  | Inglés Avanzado        | Idiomas     | Profesor S |
| 9  | Economía Internacional | Economía    | Profesor R |
| 10 | Derecho Penal          | Derecho     | Profesor Q |
+----+------------------------+-------------+------------+

--inscripciones
+----+-----------+----------+
| id | id_alumno | id_clase |
+----+-----------+----------+
| 1  | 1         | 1        |
| 2  | 1         | 2        |
| 3  | 2         | 3        |
| 4  | 2         | 4        |
| 5  | 3         | 5        |
| 6  | 3         | 6        |
| 7  | 4         | 7        |
| 8  | 4         | 8        |
| 9  | 5         | 9        |
| 10 | 6         | 10       |
+----+-----------+----------+

-- Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.

select a.nombre, c.nombre from inscripciones as i inner join alumnos as a on a.id=i.id_alumno join clases as c on c.id=i.id_clase; 
+--------+------------------------+
| nombre |         nombre         |
+--------+------------------------+
| Juan   | Matemáticas 101        |
| Juan   | Historia Antigua       |
| María  | Literatura Moderna     |
| María  | Biología Avanzada      |
| Pedro  | Química Orgánica       |
| Pedro  | Física Cuántica        |
| Laura  | Arte Contemporáneo     |
| Laura  | Inglés Avanzado        |
| Carlos | Economía Internacional |
| Ana    | Derecho Penal          |
+--------+------------------------+

-- Obtener el nombre del alumno y la materia de las clases en las que está inscrito.
select a.nombre, c.materia from inscripciones as i inner join alumnos as a on a.id=i.id_alumno join clases as c on c.id=i.id_clase; 

+--------+-------------+
| nombre |   materia   |
+--------+-------------+
| Juan   | Matemáticas |
| Juan   | Historia    |
| María  | Literatura  |
| María  | Biología    |
| Pedro  | Química     |
| Pedro  | Física      |
| Laura  | Arte        |
| Laura  | Idiomas     |
| Carlos | Economía    |
| Ana    | Derecho     |
+--------+-------------+

-- Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.
select a.nombre, a.edad, c.profesor from inscripciones as i inner join alumnos as a on a.id=i.id_alumno join clases as c on c.id=i.id_clase; 

+--------+------+------------+
| nombre | edad |  profesor  |
+--------+------+------------+
| Juan   | 20   | Profesor X |
| Juan   | 20   | Profesor Y |
| María  | 21   | Profesor Z |
| María  | 21   | Profesor W |
| Pedro  | 19   | Profesor V |
| Pedro  | 19   | Profesor U |
| Laura  | 22   | Profesor T |
| Laura  | 22   | Profesor S |
| Carlos | 20   | Profesor R |
| Ana    | 19   | Profesor Q |
+--------+------+------------+

-- Obtener el nombre del alumno, drecc de alumno y las clases en las que está inscrito.
select a.nombre, a.direccion, c.id, c.nombre from inscripciones as i inner join alumnos as a on a.id=i.id_alumno join clases as c on c.id=i.id_clase; 
+--------+-----------+----+------------------------+
| nombre | direccion | id |         nombre         |
+--------+-----------+----+------------------------+
| Juan   | Calle A   | 1  | Matemáticas 101        |
| Juan   | Calle A   | 2  | Historia Antigua       |
| María  | Calle B   | 3  | Literatura Moderna     |
| María  | Calle B   | 4  | Biología Avanzada      |
| Pedro  | Calle C   | 5  | Química Orgánica       |
| Pedro  | Calle C   | 6  | Física Cuántica        |
| Laura  | Calle D   | 7  | Arte Contemporáneo     |
| Laura  | Calle D   | 8  | Inglés Avanzado        |
| Carlos | Calle E   | 9  | Economía Internacional |
| Ana    | Calle F   | 10 | Derecho Penal          |
+--------+-----------+----+------------------------+


-- Obtener el nombre del alumno y el nombre de la clase junto con el profesor.
select a.nombre, c.nombre, c.profesor from inscripciones as i inner join alumnos as a on a.id=i.id_alumno join clases as c on c.id=i.id_clase;
+--------+------------------------+------------+
| nombre |         nombre         |  profesor  |
+--------+------------------------+------------+
| Juan   | Matemáticas 101        | Profesor X |
| Juan   | Historia Antigua       | Profesor Y |
| María  | Literatura Moderna     | Profesor Z |
| María  | Biología Avanzada      | Profesor W |
| Pedro  | Química Orgánica       | Profesor V |
| Pedro  | Física Cuántica        | Profesor U |
| Laura  | Arte Contemporáneo     | Profesor T |
| Laura  | Inglés Avanzado        | Profesor S |
| Carlos | Economía Internacional | Profesor R |
| Ana    | Derecho Penal          | Profesor Q |
+--------+------------------------+------------+


-- Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.
select a.nombre, c.materia, c.profesor from inscripciones as i inner join alumnos as a on a.id=i.id_alumno join clases as c on c.id=i.id_clase;
+--------+-------------+------------+
| nombre |   materia   |  profesor  |
+--------+-------------+------------+
| Juan   | Matemáticas | Profesor X |
| Juan   | Historia    | Profesor Y |
| María  | Literatura  | Profesor Z |
| María  | Biología    | Profesor W |
| Pedro  | Química     | Profesor V |
| Pedro  | Física      | Profesor U |
| Laura  | Arte        | Profesor T |
| Laura  | Idiomas     | Profesor S |
| Carlos | Economía    | Profesor R |
| Ana    | Derecho     | Profesor Q |
+--------+-------------+------------+

-- Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.
select a.nombre, a.edad, c.materia  from inscripciones as i inner join alumnos as a on a.id=i.id_alumno join clases as c on c.id=i.id_clase;
+--------+------+-------------+
| nombre | edad |   materia   |
+--------+------+-------------+
| Juan   | 20   | Matemáticas |
| Juan   | 20   | Historia    |
| María  | 21   | Literatura  |
| María  | 21   | Biología    |
| Pedro  | 19   | Química     |
| Pedro  | 19   | Física      |
| Laura  | 22   | Arte        |
| Laura  | 22   | Idiomas     |
| Carlos | 20   | Economía    |
| Ana    | 19   | Derecho     |
+--------+------+-------------+

-- Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.
select a.nombre, a.direccion, c.profesor from inscripciones as i inner join alumnos as a on a.id=i.id_alumno join clases as c on c.id=i.id_clase;
+--------+-----------+------------+
| nombre | direccion |  profesor  |
+--------+-----------+------------+
| Juan   | Calle A   | Profesor X |
| Juan   | Calle A   | Profesor Y |
| María  | Calle B   | Profesor Z |
| María  | Calle B   | Profesor W |
| Pedro  | Calle C   | Profesor V |
| Pedro  | Calle C   | Profesor U |
| Laura  | Calle D   | Profesor T |
| Laura  | Calle D   | Profesor S |
| Carlos | Calle E   | Profesor R |
| Ana    | Calle F   | Profesor Q |
+--------+-----------+------------+

-- Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.
select a.nombre, c.materia from inscripciones as i inner join alumnos as a on a.id=i.id_alumno join clases as c on c.id=i.id_clase order by a.nombre;
+--------+-------------+
| nombre |   materia   |
+--------+-------------+
| Ana    | Derecho     |
| Carlos | Economía    |
| Juan   | Matemáticas |
| Juan   | Historia    |
| Laura  | Arte        |
| Laura  | Idiomas     |
| María  | Literatura  |
| María  | Biología    |
| Pedro  | Química     |
| Pedro  | Física      |
+--------+-------------+

-- Contar cuántos alumnos están inscritos en cada clase.
select c.id, c.nombre, count(a.id) as total_alumnos from inscripciones as i join alumnos as a on a.id=i.id_alumno join clases as c on c.id=i.id_clase group by c.id;

+----+------------------------+---------------+
| id |         nombre         | total_alumnos |
+----+------------------------+---------------+
| 1  | Matemáticas 101        | 1             |
| 2  | Historia Antigua       | 1             |
| 3  | Literatura Moderna     | 1             |
| 4  | Biología Avanzada      | 1             |
| 5  | Química Orgánica       | 1             |
| 6  | Física Cuántica        | 1             |
| 7  | Arte Contemporáneo     | 1             |
| 8  | Inglés Avanzado        | 1             |
| 9  | Economía Internacional | 1             |
| 10 | Derecho Penal          | 1             |
+----+------------------------+---------------+


```
