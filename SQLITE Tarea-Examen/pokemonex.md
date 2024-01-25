--Kai Rodríguez García

-- Actualizar el nivel de Bulbasaur.
/**
UPDATE pokemon set nivel="26" where nombre="Bulbasaur";
--comprobación:
select \* from pokemon where nombre="Bulbasaur"
**/

/**
+----+-----------+---------+-------+
| id | nombre | id_tipo | nivel |
+----+-----------+---------+-------+
| 1 | Bulbasaur | 3 | 26 |
+----+-----------+---------+-------+
**/
-- Cambiar el tipo de Pikachu a "Eléctrico/Rojo".
/**
UPDATE tipo as t set nombre="Electrico/Rojo" from pokemon as p where p.nombre="Pikachu" and p.id_tipo=t.id;
select t.nombre as tipo, p.nombre from pokemon as p, tipo as t where p.nombre="Pikachu" and p.id_tipo=t.id;
**/

/**
+----------------+---------+
| tipo | nombre |
+----------------+---------+
| Electrico/Rojo | Pikachu |
+----------------+---------+
**/

-- Incrementar el nivel de todos los Pokémon de tipo Agua.
/**
update Pokemon as p set nivel = nivel + 5 from tipo as t where t.nombre="Agua" and p.id_tipo=t.id;
**/
/**
--antes:
+----+-----------+---------+-------+
| id | nombre | id_tipo | nivel |
+----+-----------+---------+-------+
| 3 | Squirtle | 1 | 8 |
| 6 | Vaporeon | 1 | 25 |
| 11 | Gyarados | 1 | 30 |
| 18 | Blastoise | 1 | 55 |
+----+-----------+---------+-------+
**/
-- ahora:
/**
select \* from pokemon where id="1";
**/
/**
+----+-----------+---------+-------+
| id | nombre | id_tipo | nivel |
+----+-----------+---------+-------+
| 3 | Squirtle | 1 | 13 |
| 6 | Vaporeon | 1 | 30 |
| 11 | Gyarados | 1 | 35 |
| 18 | Blastoise | 1 | 60 |
+----+-----------+---------+-------+
**/

-- Eliminar a Jynx de la lista de Pokémon.
/**
DELETE from pokemon where nombre="Jynx";
**/
-- NO hay POkemon llamado así.

-- Eliminar el tipo "Hielo" de la lista de tipos de Pokémon.
/**
DELETE from tipo where nombre="Hielo";
**/
-- No hay tipo hielo.

-- Obtener todos los Pokémon.
/**
SELECT \* FROM pokemon;
**/
/**
+----+------------+---------+-------+
| id | nombre | id_tipo | nivel |
+----+------------+---------+-------+
| 1 | Bulbasaur | 3 | 10 |
| 2 | Charmander | 2 | 12 |
| 3 | Squirtle | 1 | 8 |
| 4 | Pikachu | 4 | 15 |
| 5 | Geodude | 5 | 11 |
| 6 | Vaporeon | 1 | 25 |
| 7 | Flareon | 2 | 27 |
| 8 | Ivysaur | 3 | 18 |
| 9 | Jolteon | 4 | 22 |
| 10 | Cubone | 5 | 14 |
| 11 | Gyarados | 1 | 30 |
| 12 | Arcanine | 2 | 35 |
| 13 | Exeggutor | 3 | 40 |
| 14 | Raichu | 4 | 38 |
| 15 | Sandslash | 5 | 33 |
| 16 | Venusaur | 3 | 45 |
| 17 | Charizard | 2 | 50 |
| 18 | Blastoise | 1 | 55 |
| 19 | Electabuzz | 4 | 48 |
| 20 | Rhydon | 5 | 52 |
| 21 | Dragonite | 2 | 60 |
| 22 | Flareon | 2 | 65 |
| 23 | Venusaur | 3 | 70 |
| 24 | Zapdos | 4 | 75 |
| 25 | Rhydon | 5 | 80 |
+----+------------+---------+-------+
**/

-- Obtener el nombre y nivel de los Pokémon de tipo Fuego.
/**
SELECT p.nombre, p.nivel, t.nombre from tipo as t, pokemon as p where t.nombre="Fuego" and p.id_tipo=t.id;
**/
/**
+------------+-------+--------+
| nombre | nivel | nombre |
+------------+-------+--------+
| Charmander | 12 | Fuego |
| Flareon | 27 | Fuego |
| Arcanine | 35 | Fuego |
| Charizard | 50 | Fuego |
| Dragonite | 60 | Fuego |
| Flareon | 65 | Fuego |
+------------+-------+--------+
**/
-- Obtener el nombre de los Pokémon que tienen un nivel superior a 30.
/**
SELECT nombre from pokemon where nivel > 30;
**/
/**
+------------+
| nombre |
+------------+
| Arcanine |
| Exeggutor |
| Raichu |
| Sandslash |
| Venusaur |
| Charizard |
| Blastoise |
| Electabuzz |
| Rhydon |
| Dragonite |
| Flareon |
| Venusaur |
| Zapdos |
| Rhydon |
+------------+
**/

-- Obtener el nombre de los Pokémon ordenados por nivel de forma descendente.
/**
Select nombre, nivel from pokemon order by nivel desc;
**/
/**
+------------+-------+
| nombre | nivel |
+------------+-------+
| Rhydon | 80 |
| Zapdos | 75 |
| Venusaur | 70 |
| Flareon | 65 |
| Dragonite | 60 |
| Blastoise | 55 |
| Rhydon | 52 |
| Charizard | 50 |
| Electabuzz | 48 |
| Venusaur | 45 |
| Exeggutor | 40 |
| Raichu | 38 |
| Arcanine | 35 |
| Sandslash | 33 |
| Gyarados | 30 |
| Flareon | 27 |
| Bulbasaur | 26 |
| Vaporeon | 25 |
| Jolteon | 22 |
| Ivysaur | 18 |
| Pikachu | 15 |
| Cubone | 14 |
| Charmander | 12 |
| Geodude | 11 |
| Squirtle | 8 |
+------------+-------+
**/
-- Obtener la cantidad de Pokémon por tipo.
/**
SELECT count(p.id_tipo) as cantidad, t.nombre from tipo as t, pokemon as p where t.id=p.id_tipo group by t.nombre;
+----------+----------------+
| cantidad | nombre |
+----------+----------------+
| 4 | Agua |
| 5 | Electrico/Rojo |
| 6 | Fuego |
| 5 | Planta |
| 5 | Tierra |
+----------+----------------+
**/
-- Obtener la información completa de un Pokémon específico. Selecciona el que desees.
/**
select p.\*, t.nombre as tipo_nombre from tipo as t, pokemon as p where p.nombre="Cubone" and t.id=p.id_tipo;
**/
/**
+----+--------+---------+-------+-------------+
| id | nombre | id_tipo | nivel | tipo_nombre |
+----+--------+---------+-------+-------------+
| 10 | Cubone | 5 | 14 | Tierra |
+----+--------+---------+-------+-------------+
**/
-- Obtener el promedio de niveles de todos los Pokémon.
/**
SELECT avg(nivel) as promedio_nivel from pokemon;
**/
/**
+----------------+
| promedio_nivel |
+----------------+
| 38.16 |
+----------------+
**/
-- Obtener el nombre del Pokémon de mayor nivel.
/**
select nombre, MAX(nivel) as mayor_nivel from pokemon;
**/
/**
+--------+-------------+
| nombre | mayor_nivel |
+--------+-------------+
| Rhydon | 80 |
+--------+-------------+
**/
-- Actualizar el nombre de Bulbasaur a "Bulbasaur Nv. 15":
/**
UPDATE pokemon set nombre="Bulbasaur Nv. 15" where nombre="Bulbasaur";
+----+------------------+---------+-------+
| id | nombre | id_tipo | nivel |
+----+------------------+---------+-------+
| 1 | Bulbasaur Nv. 15 | 3 | 26 |
+----+------------------+---------+-------+
**/
-- Obtener los Pokémon cuyo nivel es igual a 50.
/**
SELECT \* from pokemon where nivel="50";
**/
/**
+----+-----------+---------+-------+
| id | nombre | id_tipo | nivel |
+----+-----------+---------+-------+
| 17 | Charizard | 2 | 50 |
+----+-----------+---------+-------+
**/
-- Eliminar todos los Pokémon de nivel 40.
/**
DELETE from pokemon where nivel="40";
**/
/\*\*
+----+-----------+---------+-------+
| id | nombre | id_tipo | nivel |
+----+-----------+---------+-------+
| 13 | Exeggutor | 3 | 40 |
+----+-----------+---------+-------+

**/
/**
comprobación:
select \* from pokemon where nivel="40";

Se ha borrado.
**/
-- Obtener el tipo y nivel de Pikachu.
/**
SELECT p.nombre, p.nivel from Pokemon as p, Tipo as t where p.nombre="Pikachu" and p.id_tipo=t.id;
**/
/**
+---------+-------+
| nombre | nivel |
+---------+-------+
| Pikachu | 15 |
+---------+-------+
\*\*/

-- Obtener los Pokémon de tipo Planta con nivel superior a 20:
/**
SELECT p.\*, t.nombre from pokemon as p, tipo as t where t.nombre="Planta" and p.nivel > 20 and p.id_tipo=t.id;
**/
/**
+----+------------------+---------+-------+--------+
| id | nombre | id_tipo | nivel | nombre |
+----+------------------+---------+-------+--------+
| 1 | Bulbasaur Nv. 15 | 3 | 26 | Planta |
| 16 | Venusaur | 3 | 45 | Planta |
| 23 | Venusaur | 3 | 70 | Planta |
+----+------------------+---------+-------+--------+
**/
-- Actualizar el tipo de Pikachu a "Eléctrico/Azul":
/**
UPDATE tipo as t set nombre="Eléctrico/Azul" from pokemon as p where p.nombre="Pikachu" and p.id_tipo=t.id;
**/
/\*\*
COMPROBACIÓN

select p.\*, t.nombre from pokemon as p, tipo as t where p.nombre ="Pikachu" and p.id_tipo=t.id;

+----+---------+---------+-------+----------------+
| id | nombre | id_tipo | nivel | nombre |
+----+---------+---------+-------+----------------+
| 4 | Pikachu | 4 | 15 | Eléctrico/Azul |
+----+---------+---------+-------+----------------+
**/
-- Eliminar todos los Pokémon de tipo Planta.
/**
DELETE from pokemon where id_tipo in (select id from tipo where nombre="Planta");
**/
/**
select _ from Pokemon as p, tipo as t where t.nombre ="Planta" and p.id_tipo=t.id;
Ya no hay.
select _ from Pokemon;
+----+------------+---------+-------+
| id | nombre | id_tipo | nivel |
+----+------------+---------+-------+
| 2 | Charmander | 2 | 12 |
| 3 | Squirtle | 1 | 13 |
| 4 | Pikachu | 4 | 15 |
| 5 | Geodude | 5 | 11 |
| 6 | Vaporeon | 1 | 30 |
| 7 | Flareon | 2 | 27 |
| 9 | Jolteon | 4 | 22 |
| 10 | Cubone | 5 | 14 |
| 11 | Gyarados | 1 | 35 |
| 12 | Arcanine | 2 | 35 |
| 14 | Raichu | 4 | 38 |
| 15 | Sandslash | 5 | 33 |
| 17 | Charizard | 2 | 50 |
| 18 | Blastoise | 1 | 60 |
| 19 | Electabuzz | 4 | 48 |
| 20 | Rhydon | 5 | 52 |
| 21 | Dragonite | 2 | 60 |
| 22 | Flareon | 2 | 65 |
| 24 | Zapdos | 4 | 75 |
| 25 | Rhydon | 5 | 80 |
+----+------------+---------+-------+
**/
-- Obtener los Pokémon con nombre y tipo ordenados alfabéticamente.
/**
SELECT p.nombre, t.nombre as tipo from pokemon as p, tipo as t where p.id_tipo=t.id order by p.nombre;
**/
/**
+------------+----------------+
| nombre | tipo |
+------------+----------------+
| Arcanine | Fuego |
| Blastoise | Agua |
| Charizard | Fuego |
| Charmander | Fuego |
| Cubone | Tierra |
| Dragonite | Fuego |
| Electabuzz | Eléctrico/Azul |
| Flareon | Fuego |
| Flareon | Fuego |
| Geodude | Tierra |
| Gyarados | Agua |
| Jolteon | Eléctrico/Azul |
| Pikachu | Eléctrico/Azul |
| Raichu | Eléctrico/Azul |
| Rhydon | Tierra |
| Rhydon | Tierra |
| Sandslash | Tierra |
| Squirtle | Agua |
| Vaporeon | Agua |
| Zapdos | Eléctrico/Azul |
+------------+----------------+
**/
-- Obtén todos los Pokémon cuyos nombres contienen las letras 'sa'.
/**
Select _ from pokemon where nombre like '%sa%';
**/
/**
+----+-----------+---------+-------+
| id | nombre | id_tipo | nivel |
+----+-----------+---------+-------+
| 15 | Sandslash | 5 | 33 |
+----+-----------+---------+-------+
**/
-- Encuentra todos los Pokémon cuyo nivel es 40, 50 o 60.
/**
SELECT _ from pokemon where nivel in(40, 50, 60);
**/
/**
+----+-----------+---------+-------+
| id | nombre | id_tipo | nivel |
+----+-----------+---------+-------+
| 17 | Charizard | 2 | 50 |
| 18 | Blastoise | 1 | 60 |
| 21 | Dragonite | 2 | 60 |
+----+-----------+---------+-------+
\*\*/

-- Obtén todos los Pokémon de tipo Fuego cuyos nombres comienzan con la letra 'C'.
/**
SELECT \* from pokemon as p, tipo as t where t.nombre="Fuego" and p.nombre like "C%" and p.id_tipo=t.id;
**/
/**
+----+------------+---------+-------+----+--------+
| id | nombre | id_tipo | nivel | id | nombre |
+----+------------+---------+-------+----+--------+
| 2 | Charmander | 2 | 12 | 2 | Fuego |
| 17 | Charizard | 2 | 50 | 2 | Fuego |
+----+------------+---------+-------+----+--------+
**/

-- Encuentra los nombres y tipos de los Pokémon cuyo nivel es mayor que el promedio de todos los Pokémon en la base de datos.
/**
SELECT p.nombre, p.nivel, t.nombre from pokemon as p, tipo as t where p.id_tipo=t.id and p.nivel > (SELECT avg(nivel) from pokemon);
+------------+-------+----------------+
| nombre | nivel | nombre |
+------------+-------+----------------+
| Charizard | 50 | Fuego |
| Blastoise | 60 | Agua |
| Electabuzz | 48 | Eléctrico/Azul |
| Rhydon | 52 | Tierra |
| Dragonite | 60 | Fuego |
| Flareon | 65 | Fuego |
| Zapdos | 75 | Eléctrico/Azul |
| Rhydon | 80 | Tierra |
+------------+-------+----------------+
**/
