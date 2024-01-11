# Tarea 2 : Creación de la Base de Datos

<img src="https://www.format.com/wp-content/uploads/carlo-d-agnolo-aFxSh_l4fbY-unsplash.jpg.jpg" height="300px">

## Paso 1: Crear una tabla con un campo de cada tipo

```sql
sqlite3 tarea2.db
```

## Dentro de SQLite3, crea las siguientes tablas:

- **Propietarios:** Almacena información de los propietarios.

  - id INTEGER ENTERO clave primaria y AUTOINCREMENT.

  - nombre TEXT no nulo.

  - apellido TEXT no nulo.

  - dni TEXT Valor único.

```sql
CREATE TABLE propietarios
(id INTEGER PRIMARY KEY AUTOINCREMENT,
nombre TEXT NOT NULL,
apellido TEXT NOT NULL,
dni TEXT UNIQUE
);
```

- **Vehiculos:** Almacena información sobre los propietarios de los vehículos.

  - id INTEGER ENTERO clave primaria y AUTOINCREMENT.
  - marca TEXT no nulo.
  - modelo TEXT no nulo.
  - anio INTEGER no nulo.
  - id_propietario INTEGER, FK propietarios(id_propietario).

```sql
CREATE TABLE vehiculos
(id INTEGER PRIMARY KEY AUTOINCREMENT,
marca TEXT NOT NULL,
modelo TEXT NOT NULL,
anio INTEGER NOT NULL,
id_propietario INTEGER references propietario(id)
);
```

## Paso 2: Insertar 20 entradas

### Tabla de Propietarios

```sql
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Juan', 'Perez', '12345678A' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Maria', 'Lopez', '87654321B' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Carlos', 'Ruiz', '11111111C' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Laura', 'Gomez', '22222222D' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Pedro', 'Martinez', '33333333E' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Ana', 'Fernandez', '44444444F' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Diego', 'Sanchez', '55555555G' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Sofia', 'Torres', '66666666H' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Javier', 'Leon', '77777777I' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Lucia', 'Castillo', '88888888J' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Luis', 'Gonzalez', '99999999K' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Marta', 'Diaz', '10101010L' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Victor', 'Vargas', '11111112M' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Elena', 'Castro', '12121212N' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Roberto', 'Blanco', '13131313O' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Natalia', 'Paredes', '14141414P' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Fernando', 'Herrera', '15151515Q' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Clara', 'Soto', '16161616R' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Sergio', 'Mendoza', '17171717S' );
INSERT INTO propietarios (nombre, apellido, dni) VALUES ('Patricia', 'Navarro', '18181818T' );
```

### Tabla de Vehículos

```sql
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Ford', 'Fiesta', '2019', '1');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Toyota', 'Corolla', '2018', '2');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Nissan', 'Sentra', '2020', '3');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Chevrolet', 'Spark', '2017', '4');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Honda', 'Civic', '2016', '5');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Ford', 'Mustang', '2021', '6');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Toyota', 'Golf', '2020', '7');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Volkswagen', 'RAV4', '2019', '8');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Honda', 'CR-V', '2018', '9');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Nissan', 'Altima', '2017', '10');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Chevrolet', 'Malibu', '2019', '11');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Toyota', 'Camry', '2020', '12');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Honda', 'Accord', '2018', '13');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Ford', 'Explorer', '2021', '14');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Nissan', 'Rogue', '2017', '15');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Volkswagen', 'Jetta', '2019', '16');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Chevrolet', 'Equinox', '2018', '17');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Toyota', 'Highlander', '2020', '18');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Honda', 'Odyssey', '2016', '19');
INSERT INTO vehiculos (marca, modelo, anio, id_propietario) VALUES ('Nissan', 'Murano', '2019', '20');
```

## Paso 3: Realizar las siguientes 10 consultas de datos

- Seleccionar todos los propietarios (SELECT \* FROM propietarios);

```sql
SELECT * from propietarios;
```

```code

sqlite> SELECT * from propietarios
   ...> ;
┌────┬──────────┬───────────┬───────────┐
│ id │  nombre  │ apellido  │    dni    │
├────┼──────────┼───────────┼───────────┤
│ 1  │ Juan     │ Perez     │ 12345678A │
│ 2  │ Maria    │ Lopez     │ 87654321B │
│ 3  │ Carlos   │ Ruiz      │ 11111111C │
│ 4  │ Laura    │ Gomez     │ 22222222D │
│ 5  │ Pedro    │ Martinez  │ 33333333E │
│ 6  │ Ana      │ Fernandez │ 44444444F │
│ 7  │ Diego    │ Sanchez   │ 55555555G │
│ 8  │ Sofia    │ Torres    │ 66666666H │
│ 9  │ Javier   │ Leon      │ 77777777I │
│ 10 │ Lucia    │ Castillo  │ 88888888J │
│ 11 │ Luis     │ Gonzalez  │ 99999999K │
│ 12 │ Marta    │ Diaz      │ 10101010L │
│ 13 │ Victor   │ Vargas    │ 11111112M │
│ 14 │ Elena    │ Castro    │ 12121212N │
│ 15 │ Roberto  │ Blanco    │ 13131313O │
│ 16 │ Natalia  │ Paredes   │ 14141414P │
│ 17 │ Fernando │ Herrera   │ 15151515Q │
│ 18 │ Clara    │ Soto      │ 16161616R │
│ 19 │ Sergio   │ Mendoza   │ 17171717S │
│ 20 │ Patricia │ Navarro   │ 18181818T │
└────┴──────────┴───────────┴───────────┘

```

- Listar todos los vehículos. (SELECT \* FROM vehiculos);

```sql
SELECT * from vehiculos;
```

```code

sqlite> select * from vehiculos
   ...> ;
┌────┬────────────┬────────────┬──────┬────────────────┐
│ id │   marca    │   modelo   │ anio │ id_propietario │
├────┼────────────┼────────────┼──────┼────────────────┤
│ 1  │ Ford       │ Fiesta     │ 2019 │ 1              │
│ 2  │ Toyota     │ Corolla    │ 2018 │ 2              │
│ 3  │ Nissan     │ Sentra     │ 2020 │ 3              │
│ 4  │ Chevrolet  │ Spark      │ 2017 │ 4              │
│ 5  │ Honda      │ Civic      │ 2016 │ 5              │
│ 6  │ Ford       │ Mustang    │ 2021 │ 6              │
│ 7  │ Toyota     │ Golf       │ 2020 │ 7              │
│ 8  │ Volkswagen │ RAV4       │ 2019 │ 8              │
│ 9  │ Honda      │ CR-V       │ 2018 │ 9              │
│ 10 │ Nissan     │ Altima     │ 2017 │ 10             │
│ 11 │ Chevrolet  │ Malibu     │ 2019 │ 11             │
│ 12 │ Toyota     │ Camry      │ 2020 │ 12             │
│ 13 │ Honda      │ Accord     │ 2018 │ 13             │
│ 14 │ Ford       │ Explorer   │ 2021 │ 14             │
│ 15 │ Nissan     │ Rogue      │ 2017 │ 15             │
│ 16 │ Volkswagen │ Jetta      │ 2019 │ 16             │
│ 17 │ Chevrolet  │ Equinox    │ 2018 │ 17             │
│ 18 │ Toyota     │ Highlander │ 2020 │ 18             │
│ 19 │ Honda      │ Odyssey    │ 2016 │ 19             │
│ 20 │ Nissan     │ Murano     │ 2019 │ 20             │
└────┴────────────┴────────────┴──────┴────────────────┘

```

- Seleccionar solo los nombres y apellidos de los propietarios.

```sql
SELECT nombre, apellido FROM propietarios;
```

```code
sqlite> SELECT nombre, apellido FROM propietarios
   ...> ;
┌──────────┬───────────┐
│  nombre  │ apellido  │
├──────────┼───────────┤
│ Juan     │ Perez     │
│ Maria    │ Lopez     │
│ Carlos   │ Ruiz      │
│ Laura    │ Gomez     │
│ Pedro    │ Martinez  │
│ Ana      │ Fernandez │
│ Diego    │ Sanchez   │
│ Sofia    │ Torres    │
│ Javier   │ Leon      │
│ Lucia    │ Castillo  │
│ Luis     │ Gonzalez  │
│ Marta    │ Diaz      │
│ Victor   │ Vargas    │
│ Elena    │ Castro    │
│ Roberto  │ Blanco    │
│ Natalia  │ Paredes   │
│ Fernando │ Herrera   │
│ Clara    │ Soto      │
│ Sergio   │ Mendoza   │
│ Patricia │ Navarro   │
└──────────┴───────────┘
```

- Listar todas las marcas y modelos de los vehículos.

```sql
SELECT marca,modelo FROM vehiculos;
```

```code
sqlite> SELECT marca,modelo FROM vehiculos
   ...> ;
┌────────────┬────────────┐
│   marca    │   modelo   │
├────────────┼────────────┤
│ Ford       │ Fiesta     │
│ Toyota     │ Corolla    │
│ Nissan     │ Sentra     │
│ Chevrolet  │ Spark      │
│ Honda      │ Civic      │
│ Ford       │ Mustang    │
│ Toyota     │ Golf       │
│ Volkswagen │ RAV4       │
│ Honda      │ CR-V       │
│ Nissan     │ Altima     │
│ Chevrolet  │ Malibu     │
│ Toyota     │ Camry      │
│ Honda      │ Accord     │
│ Ford       │ Explorer   │
│ Nissan     │ Rogue      │
│ Volkswagen │ Jetta      │
│ Chevrolet  │ Equinox    │
│ Toyota     │ Highlander │
│ Honda      │ Odyssey    │
│ Nissan     │ Murano     │
└────────────┴────────────┘
```

- Seleccionar solo los propietarios con apellido "Perez".

```sql
SELECT propietarios WHERE apellido="Perez";
```

```code

sqlite> SELECT propietarios WHERE apellido="Perez"
   ...> ;
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 1  | Juan   | Perez    | 12345678A |
+----+--------+----------+-----------+

```

- Listar todos los vehículos con año 2019.

```sql
SELECT * FROM vehiculos WHERE anio="2019";
```

```code
sqlite> SELECT * FROM vehiculos WHERE anio="2019"
   ...> ;
┌────┬────────────┬────────┬──────┬────────────────┐
│ id │   marca    │ modelo │ anio │ id_propietario │
├────┼────────────┼────────┼──────┼────────────────┤
│ 1  │ Ford       │ Fiesta │ 2019 │ 1              │
│ 8  │ Volkswagen │ RAV4   │ 2019 │ 8              │
│ 11 │ Chevrolet  │ Malibu │ 2019 │ 11             │
│ 16 │ Volkswagen │ Jetta  │ 2019 │ 16             │
│ 20 │ Nissan     │ Murano │ 2019 │ 20             │
└────┴────────────┴────────┴──────┴────────────────┘

```

- Seleccionar propietarios que tienen vehículos de la marca "Toyota".

```sql
SELECT * FROM propietarios as p,vehiculos as v WHERE v.id_propietario = p.id and v.marca="Toyota";;
```

```code
SELECT * FROM propietarios as p,vehiculos as v WHERE v.id_propietario = p.id and v.marca="Toyota";
+----+--------+----------+-----------+----+--------+------------+------+----------------+
| id | nombre | apellido |    dni    | id | marca  |   modelo   | anio | id_propietario |
+----+--------+----------+-----------+----+--------+------------+------+----------------+
| 2  | Maria  | Lopez    | 87654321B | 2  | Toyota | Corolla    | 2018 | 2              |
| 7  | Diego  | Sanchez  | 55555555G | 7  | Toyota | Golf       | 2020 | 7              |
| 12 | Marta  | Diaz     | 10101010L | 12 | Toyota | Camry      | 2020 | 12             |
| 18 | Clara  | Soto     | 16161616R | 18 | Toyota | Highlander | 2020 | 18             |
+----+--------+----------+-----------+----+--------+------------+------+----------------+

```

- Listar vehículos con marca "Ford" y modelo "Fiesta".

```sql
SELECT * FROM vehiculos WHERE marca="Ford" and modelo="Fiesta";
```

```code
sqlite> SELECT * FROM vehiculos WHERE marca="Ford" and modelo="Fiesta"
   ...> ;
┌────┬───────┬────────┬──────┬────────────────┐
│ id │ marca │ modelo │ anio │ id_propietario │
├────┼───────┼────────┼──────┼────────────────┤
│ 1  │ Ford  │ Fiesta │ 2019 │ 1              │
└────┴───────┴────────┴──────┴────────────────┘
```

- Seleccionar propietarios con DNI "12345678A".

```sql
SELECT * FROM propietarios WHERE DNI="12345678A";
```

```code
sqlite> SELECT * FROM propietarios WHERE DNI="12345678A"
   ...> ;
┌────┬────────┬──────────┬───────────┐
│ id │ nombre │ apellido │    dni    │
├────┼────────┼──────────┼───────────┤
│ 1  │ Juan   │ Perez    │ 12345678A │
└────┴────────┴──────────┴───────────┘
```

- Listar vehículos que pertenecen al propietario con ID 5.

```sql
SELECT * FROM vehiculos WHERE id="5";
```

```code
sqlite> SELECT * FROM vehiculos WHERE id="5"
   ...> ;
┌────┬───────┬────────┬──────┬────────────────┐
│ id │ marca │ modelo │ anio │ id_propietario │
├────┼───────┼────────┼──────┼────────────────┤
│ 5  │ Honda │ Civic  │ 2016 │ 5              │
└────┴───────┴────────┴──────┴────────────────┘
```

## Paso 4: Realiza los siguientes updates:

- Actualizar el nombre de un propietario con DNI "12345678A".

```sql
UPDATE propietarios set nombre="Roberto" WHERE dni="12345678A";
```

```code
sqlite> UPDATE propietarios set nombre="Roberto" WHERE dni="12345678A"
   ...> ;
sqlite> select * from propietarios
   ...> ;
┌────┬──────────┬───────────┬───────────┐
│ id │  nombre  │ apellido  │    dni    │
├────┼──────────┼───────────┼───────────┤
│ 1  │ Roberto  │ Perez     │ 12345678A │
│ 2  │ Maria    │ Lopez     │ 87654321B │
│ 3  │ Carlos   │ Ruiz      │ 11111111C │
│ 4  │ Laura    │ Gomez     │ 22222222D │
│ 5  │ Pedro    │ Martinez  │ 33333333E │
│ 6  │ Ana      │ Fernandez │ 44444444F │
│ 7  │ Diego    │ Sanchez   │ 55555555G │
│ 8  │ Sofia    │ Torres    │ 66666666H │
│ 9  │ Javier   │ Leon      │ 77777777I │
│ 10 │ Lucia    │ Castillo  │ 88888888J │
│ 11 │ Luis     │ Gonzalez  │ 99999999K │
│ 12 │ Marta    │ Diaz      │ 10101010L │
│ 13 │ Victor   │ Vargas    │ 11111112M │
│ 14 │ Elena    │ Castro    │ 12121212N │
│ 15 │ Roberto  │ Blanco    │ 13131313O │
│ 16 │ Natalia  │ Paredes   │ 14141414P │
│ 17 │ Fernando │ Herrera   │ 15151515Q │
│ 18 │ Clara    │ Soto      │ 16161616R │
│ 19 │ Sergio   │ Mendoza   │ 17171717S │
│ 20 │ Patricia │ Navarro   │ 18181818T │
└────┴──────────┴───────────┴───────────┘
```

- Modificar el año de un vehículo con ID 3 a 2022.

```sql
UPDATE vehiculos set anio="2022" WHERE id="3";
sqlite> select * from vehiculos;
```

```code
sqlite> UPDATE vehiculos set anio="2022" WHERE id="3";
sqlite> select * from vehiculos
   ...> ;
┌────┬────────────┬────────────┬──────┬────────────────┐
│ id │   marca    │   modelo   │ anio │ id_propietario │
├────┼────────────┼────────────┼──────┼────────────────┤
│ 1  │ Ford       │ Fiesta     │ 2019 │ 1              │
│ 2  │ Toyota     │ Corolla    │ 2018 │ 2              │
│ 3  │ Nissan     │ Sentra     │ 2022 │ 3              │
│ 4  │ Chevrolet  │ Spark      │ 2017 │ 4              │
│ 5  │ Honda      │ Civic      │ 2016 │ 5              │
│ 6  │ Ford       │ Mustang    │ 2021 │ 6              │
│ 7  │ Toyota     │ Golf       │ 2020 │ 7              │
│ 8  │ Volkswagen │ RAV4       │ 2019 │ 8              │
│ 9  │ Honda      │ CR-V       │ 2018 │ 9              │
│ 10 │ Nissan     │ Altima     │ 2017 │ 10             │
│ 11 │ Chevrolet  │ Malibu     │ 2019 │ 11             │
│ 12 │ Toyota     │ Camry      │ 2020 │ 12             │
│ 13 │ Honda      │ Accord     │ 2018 │ 13             │
│ 14 │ Ford       │ Explorer   │ 2021 │ 14             │
│ 15 │ Nissan     │ Rogue      │ 2017 │ 15             │
│ 16 │ Volkswagen │ Jetta      │ 2019 │ 16             │
│ 17 │ Chevrolet  │ Equinox    │ 2018 │ 17             │
│ 18 │ Toyota     │ Highlander │ 2020 │ 18             │
│ 19 │ Honda      │ Odyssey    │ 2016 │ 19             │
│ 20 │ Nissan     │ Murano     │ 2019 │ 20             │
└────┴────────────┴────────────┴──────┴────────────────┘
```

- Cambiar el modelo de todos los vehículos Nissan a "Micra".

```sql
UPDATE vehiculos set modelo="Micra" WHERE marca="Nissan";
```

```code
sqlite> UPDATE vehiculos set modelo="Micra" WHERE marca="Nissan"
   ...> ;
sqlite> select * from vehiculos
   ...> ;
┌────┬────────────┬────────────┬──────┬────────────────┐
│ id │   marca    │   modelo   │ anio │ id_propietario │
├────┼────────────┼────────────┼──────┼────────────────┤
│ 1  │ Ford       │ Fiesta     │ 2019 │ 1              │
│ 2  │ Toyota     │ Corolla    │ 2018 │ 2              │
│ 3  │ Nissan     │ Micra      │ 2022 │ 3              │
│ 4  │ Chevrolet  │ Spark      │ 2017 │ 4              │
│ 5  │ Honda      │ Civic      │ 2016 │ 5              │
│ 6  │ Ford       │ Mustang    │ 2021 │ 6              │
│ 7  │ Toyota     │ Golf       │ 2020 │ 7              │
│ 8  │ Volkswagen │ RAV4       │ 2019 │ 8              │
│ 9  │ Honda      │ CR-V       │ 2018 │ 9              │
│ 10 │ Nissan     │ Micra      │ 2017 │ 10             │
│ 11 │ Chevrolet  │ Malibu     │ 2019 │ 11             │
│ 12 │ Toyota     │ Camry      │ 2020 │ 12             │
│ 13 │ Honda      │ Accord     │ 2018 │ 13             │
│ 14 │ Ford       │ Explorer   │ 2021 │ 14             │
│ 15 │ Nissan     │ Micra      │ 2017 │ 15             │
│ 16 │ Volkswagen │ Jetta      │ 2019 │ 16             │
│ 17 │ Chevrolet  │ Equinox    │ 2018 │ 17             │
│ 18 │ Toyota     │ Highlander │ 2020 │ 18             │
│ 19 │ Honda      │ Odyssey    │ 2016 │ 19             │
│ 20 │ Nissan     │ Micra      │ 2019 │ 20             │
└────┴────────────┴────────────┴──────┴────────────────┘

```

- Actualizar el apellido de un propietario con ID 7 a "Gomez".

```sql
UPDATE propietarios set apellido="Gomez" WHERE id="7";
```

```code
sqlite> UPDATE propietarios set apellido="Gomez" WHERE id="7"
   ...> ;
sqlite> select * from propietarios
   ...> ;
┌────┬──────────┬───────────┬───────────┐
│ id │  nombre  │ apellido  │    dni    │
├────┼──────────┼───────────┼───────────┤
│ 1  │ Roberto  │ Perez     │ 12345678A │
│ 2  │ Maria    │ Lopez     │ 87654321B │
│ 3  │ Carlos   │ Ruiz      │ 11111111C │
│ 4  │ Laura    │ Gomez     │ 22222222D │
│ 5  │ Pedro    │ Martinez  │ 33333333E │
│ 6  │ Ana      │ Fernandez │ 44444444F │
│ 7  │ Diego    │ Gomez     │ 55555555G │
│ 8  │ Sofia    │ Torres    │ 66666666H │
│ 9  │ Javier   │ Leon      │ 77777777I │
│ 10 │ Lucia    │ Castillo  │ 88888888J │
│ 11 │ Luis     │ Gonzalez  │ 99999999K │
│ 12 │ Marta    │ Diaz      │ 10101010L │
│ 13 │ Victor   │ Vargas    │ 11111112M │
│ 14 │ Elena    │ Castro    │ 12121212N │
│ 15 │ Roberto  │ Blanco    │ 13131313O │
│ 16 │ Natalia  │ Paredes   │ 14141414P │
│ 17 │ Fernando │ Herrera   │ 15151515Q │
│ 18 │ Clara    │ Soto      │ 16161616R │
│ 19 │ Sergio   │ Mendoza   │ 17171717S │
│ 20 │ Patricia │ Navarro   │ 18181818T │
└────┴──────────┴───────────┴───────────┘
```

- Modificar la marca de un vehículo con modelo "Fiesta" a "Renault".

```sql
UPDATE vehiculos set marca="Renault" WHERE modelo="Fiesta";
```

```code
sqlite> UPDATE vehiculos set marca="Renault" WHERE modelo="Fiesta"
   ...> ;
sqlite> select * from vehiculos
   ...> ;
┌────┬────────────┬────────────┬──────┬────────────────┐
│ id │   marca    │   modelo   │ anio │ id_propietario │
├────┼────────────┼────────────┼──────┼────────────────┤
│ 1  │ Renault    │ Fiesta     │ 2019 │ 1              │
│ 2  │ Toyota     │ Corolla    │ 2018 │ 2              │
│ 3  │ Nissan     │ Sentra     │ 2022 │ 3              │
│ 4  │ Chevrolet  │ Spark      │ 2017 │ 4              │
│ 5  │ Honda      │ Civic      │ 2016 │ 5              │
│ 6  │ Ford       │ Mustang    │ 2021 │ 6              │
│ 7  │ Toyota     │ Golf       │ 2020 │ 7              │
│ 8  │ Volkswagen │ RAV4       │ 2019 │ 8              │
│ 9  │ Honda      │ CR-V       │ 2018 │ 9              │
│ 10 │ Nissan     │ Altima     │ 2017 │ 10             │
│ 11 │ Chevrolet  │ Malibu     │ 2019 │ 11             │
│ 12 │ Toyota     │ Camry      │ 2020 │ 12             │
│ 13 │ Honda      │ Accord     │ 2018 │ 13             │
│ 14 │ Ford       │ Explorer   │ 2021 │ 14             │
│ 15 │ Nissan     │ Rogue      │ 2017 │ 15             │
│ 16 │ Volkswagen │ Jetta      │ 2019 │ 16             │
│ 17 │ Chevrolet  │ Equinox    │ 2018 │ 17             │
│ 18 │ Toyota     │ Highlander │ 2020 │ 18             │
│ 19 │ Honda      │ Odyssey    │ 2016 │ 19             │
│ 20 │ Nissan     │ Murano     │ 2019 │ 20             │
└────┴────────────┴────────────┴──────┴────────────────┘


```
