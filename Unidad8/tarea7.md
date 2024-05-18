<div align="justify">

# ¿El salario?

<div align="center">
<img width="400" src="https://www.gestion.org/wp-content/uploads/2017/08/que-integra-el-salario-base-de-cotizacion-768x452.jpg"/>

</div>


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
DROP TABLE IF EXISTS persona;
CREATE TABLE persona (
    id VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(30),
    salario_base DECIMAL(10,2),
    subsidio DECIMAL(10,2),
    salud DECIMAL(10,2),
    pension DECIMAL(10,2),
    bono DECIMAL(10,2),
    integral DECIMAL(10,2)
);

```

```sql
DELIMITER //
DROP PROCEDURE IF EXISTS insertar_datos;

CREATE PROCEDURE insertar_datos(IN iterations INT, IN prefix VARCHAR(10), IN base_salario INT, IN max_salario INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_id VARCHAR(20);
    DECLARE random_nombre VARCHAR(100);
    DECLARE random_salario_base DECIMAL(10,2);
    DECLARE random_subsidio DECIMAL(10,2);
    DECLARE random_salud DECIMAL(10,2);
    DECLARE random_pension DECIMAL(10,2);
    DECLARE random_bono DECIMAL(10,2);
    DECLARE random_integral DECIMAL(10,2);

    WHILE counter < iterations DO
        -- Generar un ID único
        SET random_id = SUBSTRING(UUID(), 1, 20);
        SET random_nombre = CONCAT(prefix, ROUND(RAND() * 1000));
        SET random_salario_base = FLOOR(RAND() * (max_salario - base_salario + 1)) + base_salario;
        SET random_subsidio = random_salario_base * 0.07;
        SET random_salud = random_salario_base * 0.04;
        SET random_pension = random_salario_base * 0.04;
        SET random_bono = random_salario_base * 0.08;
        SET random_integral = random_salario_base - random_salud - random_pension + random_bono + random_subsidio;
        
        INSERT INTO persona(id, nombre, salario_base, subsidio, salud, pension, bono, integral) 
        VALUES (random_id, random_nombre, random_salario_base, random_subsidio, random_salud, random_pension, random_bono, random_integral);
        
        SET counter = counter + 1;
    END WHILE;
END //
//
DELIMITER ;

-- Llamar al procedimiento
CALL insertar_datos(10, 'Empleado', 1000, 4000);
```

```sql
-- tabla resultante

mysql> select * from persona;
+----------------------+-------------+--------------+----------+--------+---------+--------+----------+
| id                   | nombre      | salario_base | subsidio | salud  | pension | bono   | integral |
+----------------------+-------------+--------------+----------+--------+---------+--------+----------+
| 3057d6d3-152d-11ef-9 | Empleado66  |      3881.00 |   271.67 | 155.24 |  155.24 | 310.48 |  4152.67 |
| 305875ec-152d-11ef-9 | Empleado605 |      1429.00 |   100.03 |  57.16 |   57.16 | 114.32 |  1529.03 |
| 3058c29b-152d-11ef-9 | Empleado901 |      1221.00 |    85.47 |  48.84 |   48.84 |  97.68 |  1306.47 |
| 30590199-152d-11ef-9 | Empleado668 |      1354.00 |    94.78 |  54.16 |   54.16 | 108.32 |  1448.78 |
| 305ad24c-152d-11ef-9 | Empleado587 |      2735.00 |   191.45 | 109.40 |  109.40 | 218.80 |  2926.45 |
| 305be820-152d-11ef-9 | Empleado132 |      3779.00 |   264.53 | 151.16 |  151.16 | 302.32 |  4043.53 |
| 305c4057-152d-11ef-9 | Empleado235 |      2182.00 |   152.74 |  87.28 |   87.28 | 174.56 |  2334.74 |
| 305c9aaa-152d-11ef-9 | Empleado267 |      1451.00 |   101.57 |  58.04 |   58.04 | 116.08 |  1552.57 |
| 305cf35b-152d-11ef-9 | Empleado953 |      1941.00 |   135.87 |  77.64 |   77.64 | 155.28 |  2076.87 |
| 305ed52e-152d-11ef-9 | Empleado709 |      2809.00 |   196.63 | 112.36 |  112.36 | 224.72 |  3005.63 |
+----------------------+-------------+--------------+----------+--------+---------+--------+----------+
10 rows in set (0.00 sec)
```

### Versión creando funciones y llamándolas en el procedimiento:

```sql
DELIMITER //

-- Función para generar un ID aleatorio
CREATE FUNCTION generar_id() RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    RETURN SUBSTRING(UUID(), 1, 20);
END //

-- Función para generar un nombre aleatorio con prefijo
CREATE FUNCTION generar_nombre(prefix VARCHAR(10)) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    RETURN CONCAT(prefix, ROUND(RAND() * 1000));
END //

-- Función para generar salario base aleatorio
CREATE FUNCTION generar_salario_base(base_salario INT, max_salario INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN FLOOR(RAND() * (max_salario - base_salario + 1)) + base_salario;
END //

-- Función para generar subsidio de transporte
CREATE FUNCTION generar_subsidio(salario_base DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salario_base * 0.07;
END //

-- Función para generar salud
CREATE FUNCTION generar_salud(salario_base DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salario_base * 0.04;
END //

-- Función para generar pensión
CREATE FUNCTION generar_pension(salario_base DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salario_base * 0.04;
END //

-- Función para generar bono
CREATE FUNCTION generar_bono(salario_base DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salario_base * 0.08;
END //

-- Función para calcular el salario integral
CREATE FUNCTION salario_integral(salario_base DECIMAL(10,2), salud DECIMAL(10,2), pension DECIMAL(10,2), bono DECIMAL(10,2), subsidio DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salario_base - salud - pension + bono + subsidio;
END //

DELIMITER ;

```

```SQL
DELIMITER //
DROP PROCEDURE IF EXISTS insertar_datos;

CREATE PROCEDURE insertar_datos(IN iterations INT, IN prefix VARCHAR(10), IN base_salario INT, IN max_salario INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE random_id VARCHAR(100);
    DECLARE random_nombre VARCHAR(100);
    DECLARE random_salario_base DECIMAL(10,2);
    DECLARE random_subsidio DECIMAL(10,2);
    DECLARE random_salud DECIMAL(10,2);
    DECLARE random_pension DECIMAL(10,2);
    DECLARE random_bono DECIMAL(10,2);
    DECLARE random_integral DECIMAL(10,2);

    WHILE counter < iterations DO
        SET random_id = generar_id();
        SET random_nombre = generar_nombre(prefix);
        SET random_salario_base = generar_salario_base(base_salario, max_salario);
        SET random_subsidio = generar_subsidio(random_salario_base);
        SET random_salud = generar_salud(random_salario_base);
        SET random_pension = generar_pension(random_salario_base);
        SET random_bono = generar_bono(random_salario_base);
        SET random_integral = salario_integral(random_salario_base, random_salud, random_pension, random_bono, random_subsidio);
        
        INSERT INTO persona(id, nombre, salario_base, subsidio, salud, pension, bono, integral) 
        VALUES (random_id, random_nombre, random_salario_base, random_subsidio, random_salud, random_pension, random_bono, random_integral);
        
        SET counter = counter + 1;
    END WHILE;
END //
//
DELIMITER ;


--llamando al procedimiento
CALL insertar_datos(10, 'Emp', 1200, 3500);

-- Resultado:

mysql> select * from persona;
+----------------------+-------------+--------------+----------+--------+---------+--------+----------+
| id                   | nombre      | salario_base | subsidio | salud  | pension | bono   | integral |
+----------------------+-------------+--------------+----------+--------+---------+--------+----------+
| 3057d6d3-152d-11ef-9 | Empleado66  |      3881.00 |   271.67 | 155.24 |  155.24 | 310.48 |  4152.67 |
| 305875ec-152d-11ef-9 | Empleado605 |      1429.00 |   100.03 |  57.16 |   57.16 | 114.32 |  1529.03 |
| 3058c29b-152d-11ef-9 | Empleado901 |      1221.00 |    85.47 |  48.84 |   48.84 |  97.68 |  1306.47 |
| 30590199-152d-11ef-9 | Empleado668 |      1354.00 |    94.78 |  54.16 |   54.16 | 108.32 |  1448.78 |
| 305ad24c-152d-11ef-9 | Empleado587 |      2735.00 |   191.45 | 109.40 |  109.40 | 218.80 |  2926.45 |
| 305be820-152d-11ef-9 | Empleado132 |      3779.00 |   264.53 | 151.16 |  151.16 | 302.32 |  4043.53 |
| 305c4057-152d-11ef-9 | Empleado235 |      2182.00 |   152.74 |  87.28 |   87.28 | 174.56 |  2334.74 |
| 305c9aaa-152d-11ef-9 | Empleado267 |      1451.00 |   101.57 |  58.04 |   58.04 | 116.08 |  1552.57 |
| 305cf35b-152d-11ef-9 | Empleado953 |      1941.00 |   135.87 |  77.64 |   77.64 | 155.28 |  2076.87 |
| 305ed52e-152d-11ef-9 | Empleado709 |      2809.00 |   196.63 | 112.36 |  112.36 | 224.72 |  3005.63 |
| aeeaa919-152d-11ef-9 | Emp889      |      2662.00 |   186.34 | 106.48 |  106.48 | 212.96 |  2848.34 |
| aeebbbf4-152d-11ef-9 | Emp512      |      2700.00 |   189.00 | 108.00 |  108.00 | 216.00 |  2889.00 |
| aeec223c-152d-11ef-9 | Emp726      |      2743.00 |   192.01 | 109.72 |  109.72 | 219.44 |  2935.01 |
| aeec6ecd-152d-11ef-9 | Emp178      |      3217.00 |   225.19 | 128.68 |  128.68 | 257.36 |  3442.19 |
| aeed8089-152d-11ef-9 | Emp851      |      2636.00 |   184.52 | 105.44 |  105.44 | 210.88 |  2820.52 |
| aef02b91-152d-11ef-9 | Emp569      |      3431.00 |   240.17 | 137.24 |  137.24 | 274.48 |  3671.17 |
| aef0b53c-152d-11ef-9 | Emp143      |      3050.00 |   213.50 | 122.00 |  122.00 | 244.00 |  3263.50 |
| aef114b2-152d-11ef-9 | Emp594      |      2479.00 |   173.53 |  99.16 |   99.16 | 198.32 |  2652.53 |
| aef16dbe-152d-11ef-9 | Emp1000     |      1958.00 |   137.06 |  78.32 |   78.32 | 156.64 |  2095.06 |
| aef1bb25-152d-11ef-9 | Emp650      |      1795.00 |   125.65 |  71.80 |   71.80 | 143.60 |  1920.65 |
+----------------------+-------------+--------------+----------+--------+---------+--------+----------+
20 rows in set (0.00 sec)

```

- Cree una función para cada punto teniendo en cuenta que:
    - Función __subsidio_transporte__: El subsidio de transporte equivale al __7%__ al salario básico. _Actualiza el valor en la tabla_.
    - Función __salud__: La salud que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.
    - Función __pension__: La pensión que corresponde al __4%__ al salario básico.  _Actualiza el valor en la tabla_.
    - Función __bono__: Un bono que corresponde al __8%__ al salario básico. _Actualiza el valor en la tabla_. 
    - Función __integral__: El salario integral es la ___suma del salario básico - salud - pension + bono + sub de transporte___. _Actualiza el valor en la tabla_.
    - ___Crea cada uno de las funciones anteriores para una persona en específico___.
    - El parámetro de entrada debe de ser un identificar de la persona.


</div>
