<div align="justify">

# ¿El salario?

<div align="center">
<img width="400" src="https://www.gestion.org/wp-content/uploads/2017/08/que-integra-el-salario-base-de-cotizacion-768x452.jpg"/>

</div>

Una de las preguntas más comunes que se hacen las personas cuando empiezan su vida laboral, suele ser qué es el salario base. Y es que es normal que la gente ande un poco confundida ya que, si no tienes conocimientos en este campo, es fácil hacerse un lío con términos como:
- Salario base.
- Base reguladora.
- Salario bruto.
- Salario neto.
- Etc.

Teniendo en cuenta esta información se pide:
- Crea una base datos llamada __salario__.
    - [Crear BBDD en MySql](https://dev.mysql.com/doc/refman/8.0/en/creating-database.html).
- Crea una tabla llamada persona con los siguientes campos:
    - Identificador. (Texto)__(PK)__.
    - Nombre (Texto).
    - Salario_base. (__Escoge el tipo de dato__).
    - Subsidio(__Escoge el tipo de dato__).
    - Salud(__Escoge el tipo de dato__).
    - Pensión(__Escoge el tipo de dato__).
    - Bono(__Escoge el tipo de dato__).
    - Integral(__Escoge el tipo de dato__).


```sql
DROP TABLE IF EXISTS salario;
CREATE TABLE salario (
    id varchar(20) primary key,
    nombre varchar(30),
    salario_base decimal(10,2),
    subsidio DECIMAL(10, 2),
    salud DECIMAL(10, 2),
    pension DECIMAL(10, 2),
    bono DECIMAL(10, 2),
    integral DECIMAL(10, 2)
);

```

- Creación de un __procedimiento__ de forma aleatoria con las siguientes características:
    - Parámetro de entrada el número de registros (_Mínimo 10, y realiza la prueba varias veces_). 

```sql

DELIMITER //
DROP PROCEDURE IF EXISTS insertar_datos;

CREATE PROCEDURE insertar_datos(IN iterations INT, IN prefix VARCHAR(10), IN base_salario INT, IN max_salario INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_id VARCHAR(100);
    DECLARE random_nombre DECIMAL(10, 2);
    DECLARE random_salario_base
    DECLARE random_subsidio
    DECLARE random_salud
    DECLARE random_pension
    DECLARE random_bono
    DECLARE random_integral

    WHILE counter < iterations DO
        SET random_id = SUBSTRING_INDEX(UUID(), '-', -1);
        SET random_nombre = CONCAT(prefix, RAND());
        SET random_salario_base = FLOOR(RAND() * (max_salario- base_salario + 1)) + base_salario;
        SET random_subsidio = random_salario_base * 0.1182
        SET random_salud = random_salario_base * 0.04
        SET random_pension = random_salario_base * 0.04
        SET random_bono = 
        SET random_integral = 
        INSERT INTO insertar_datos(id, nombre, salaro_base, subsidio, salud, pension, bono, integral) VALUES (random_id, random_nombre, random_salario_base, random_subsidio, random_salud, random_pension, random_bono, random_integral);
        SET counter = counter + 1;
    END WHILE;
END;
//
DELIMITER ;

```

- Cree una función para cada punto teniendo en cuenta que:
    - Función __subsidio_transporte__: El subsidio de transporte equivale al __7%__ al salario básico. _Actualiza el valor en la tabla_.
    - Función __salud__: La salud que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.
    - Función __pension__: La pensión que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.
    - Función __bono__: Un bono que corresponde al __8%__ al salario básico. _Actualiza el valor en la tabla_. 
    - Función __integral__: El salario integral es la ___suma del salario básico - salud - pension + bono + sub de transporte___. _Actualiza el valor en la tabla_.
    - ___Crea cada uno de las funciones anteriores para una persona en específico___.
    - El parámetro de entrada debe de ser un identificar de la persona.
## Referencias

- [Tipos de Datos en MySql](https://dev.mysql.com/doc/refman/8.0/en/data-types.html).
- [Sentencia Update](https://dev.mysql.com/doc/refman/8.0/en/update.html)

</div>