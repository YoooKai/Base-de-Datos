# Ejercicio Combinado de Base de Datos: Gestión de Biblioteca

## Parte 1: Creación de Base de Datos y Tablas

1. **Crea una base de datos llamada `biblioteca`:**

2. **Crea una tabla llamada `libros` con los siguientes campos:**
    - `id` (entero sin signo, clave primaria)
    - `titulo` (cadena de caracteres)
    - `autor` (cadena de caracteres)
    - `anio_publicacion` (año)
    - `genero` (cadena de caracteres)
    - `precio` (decimal)
    - `disponibilidad` (booleano, valor por defecto `TRUE`)


DROP TABLE IF EXISTS libros;
CREATE TABLE libros(
    id int unsigned PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    anio_publicacion YEAR,
    genero VARCHAR(30),
    precio DECIMAL(10,2),
    disponibilidad BOOLEAN DEFAULT TRUE
);

3. **Crea una tabla llamada `usuarios` con los siguientes campos:**
    - `id` (entero sin signo, clave primaria)
    - `nombre` (cadena de caracteres)
    - `apellido` (cadena de caracteres)
    - `email` (cadena de caracteres)
    - `fecha_nacimiento` (fecha)
    - `penalizacion` (decimal, valor por defecto `0.00`)

DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
    id int unsigned PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(100),
    fecha_nacimiento date,
    penalizacion decimal(10, 2) DEFAULT 0.00
);

4. **Crea una tabla llamada `prestamos` con los siguientes campos:**
    - `id` (entero sin signo, clave primaria)
    - `id_libro` (entero sin signo, clave foránea)
    - `id_usuario` (entero sin signo, clave foránea)
    - `fecha_prestamo` (fecha)
    - `fecha_devolucion` (fecha)
    - `estado` (cadena de caracteres, valor por defecto `pendiente`)

DROP TABLE IF EXISTS prestamos;
CREATE TABLE prestamos (
    id INT unsigned PRIMARY KEY AUTO_INCREMENT,
    id_libro INT unsigned,
    id_usuario INT unsigned,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    estado VARCHAR(20) DEFAULT 'pendiente',
    FOREIGN KEY (id_libro) REFERENCES libros(id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

## Parte 2: Funciones Almacenadas

1. **Crea una función llamada `calcular_penalizacion` que reciba `fecha_devolucion` y `fecha_actual` como parámetros y devuelva la
 penalización por retraso en la devolución de libros. La penalización es de 0.50 unidades monetarias por cada día de retraso.**

DROP FUNCTION IF EXISTS calcular_penalizacion;
DELIMITER //

CREATE FUNCTION calcular_penalizacion(input_fecha_devolucion DATE, input_fecha_actual DATE)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE dias_extra INT;
    DECLARE deuda DECIMAL(10,2);
    
    SET dias_extra = DATEDIFF(input_fecha_actual, input_fecha_devolucion);
    
    IF dias_extra > 0 THEN
        SET deuda = dias_extra * 0.50;
        RETURN deuda;
    ELSE
        RETURN 0;
    END IF;
END //

DELIMITER ;



DROP FUNCTION IF EXISTS generar_email;
DELIMITER //

CREATE FUNCTION generar_email(input_nombre VARCHAR(100), input_apellido VARCHAR(100), input_dominio VARCHAR(100))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE email VARCHAR(100);
    SET email = LCASE(CONCAT(SUBSTRING(input_nombre, 1, 1), input_apellido, '@', input_dominio));
    RETURN email;
END //

DELIMITER ;

## Parte 3: Procedimientos Almacenados

1. **Crea un procedimiento llamado `insertar_libros_aleatorios` que reciba `num_libros` como parámetro 
y permita insertar esa cantidad de libros de forma aleatoria en la tabla `libros`.**

DROP PROCEDURE IF EXISTS insertar_libros_aleatorios;
DELIMITER //
CREATE PROCEDURE insertar_libros_aleatorios(IN num_libros INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE p_titulo VARCHAR(100);
    DECLARE p_autor VARCHAR(100);
    DECLARE p_anio_publicacion YEAR;
    DECLARE p_genero VARCHAR(30);
    DECLARE p_precio DECIMAL(10,2);
    DECLARE p_disponibilidad BOOLEAN DEFAULT TRUE;

    WHILE counter < num_libros DO
        SET p_titulo = CONCAT('Titulo', ROUND(RAND() * 1000));
        SET p_autor = CONCAT('Autor', ROUND(RAND() * 1000));
        SET p_anio_publicacion = YEAR(CURDATE()) - ROUND(RAND() * 100);
        SET p_genero = SUBSTR(UUID(), 1, 8);
        SET p_precio = ROUND(RAND() * 50, 2);
        SET p_disponibilidad = RAND() > 0.5;

        INSERT INTO libros(titulo, autor, anio_publicacion, genero, precio, disponibilidad) 
        VALUES (p_titulo, p_autor, p_anio_publicacion, p_genero, p_precio, p_disponibilidad);

        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;


2. **Crea un procedimiento llamado `insertar_usuarios_aleatorios` que reciba `num_usuarios` como parámetro y 
permita insertar esa cantidad de usuarios de forma aleatoria en la tabla `usuarios`.**

DROP PROCEDURE IF EXISTS insertar_usuarios_aleatorios;
DELIMITER //
CREATE PROCEDURE insertar_usuarios_aleatorios(IN num_usuarios INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE p_nombre VARCHAR(50);
    DECLARE p_apellido VARCHAR(50);
    DECLARE p_email VARCHAR(100);
    DECLARE p_fecha_nacimiento DATE;

    WHILE counter < num_usuarios DO
        SET p_nombre = CONCAT('Nombre', ROUND(RAND() * 1000));
        SET p_apellido = CONCAT('Apellido', ROUND(RAND() * 1000));
        SET p_email = generar_email(p_nombre, p_apellido, 'biblioteca.com');
        SET p_fecha_nacimiento = CURDATE() - INTERVAL ROUND(RAND() * 10000) DAY;

        INSERT INTO usuarios (nombre, apellido, email, fecha_nacimiento)
        VALUES (p_nombre, p_apellido, p_email, p_fecha_nacimiento);

        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;


## Parte 4: Triggers

1. **Crea un trigger llamado `trigger_check_precio_before_insert` que se ejecute antes de una operación de inserción en la 
tabla `libros` y ajuste el precio a 0 si el nuevo valor es negativo.**


DROP TRIGGER IF EXISTS trigger_check_precio_before_insert;
DELIMITER //
CREATE TRIGGER trigger_check_precio_before_insert
BEFORE INSERT ON libros
FOR EACH ROW
BEGIN
    IF NEW.precio < 0 THEN
        SET NEW.precio = 0;
    END IF;
END //
DELIMITER ;

3. **Crea un trigger llamado `trigger_actualizar_disponibilidad_penalizacion_before_update` que se ejecute antes de 
una operación de actualización en la tabla `prestamos`. Este trigger debe actualizar la disponibilidad del libro y 
calcular la penalización por retraso en la devolución, actualizando el estado del préstamo y la penalización del usuario si corresponde.**

DROP TRIGGER IF EXISTS trigger_actualizar_disponibilidad_penalizacion_before_update;
DELIMITER //
CREATE TRIGGER trigger_actualizar_disponibilidad_penalizacion_before_update
BEFORE UPDATE ON prestamos
FOR EACH ROW
BEGIN
    DECLARE penalizacion DECIMAL(6,2);
    DECLARE fecha_actual DATE;

    SET fecha_actual = CURDATE();
    SET penalizacion = calcular_penalizacion(NEW.fecha_devolucion, fecha_actual);

    IF penalizacion > 0 THEN
        UPDATE usuarios SET penalizacion = penalizacion WHERE id = NEW.id_usuario;
        SET NEW.estado = 'retrasado';
    ELSE
        SET NEW.estado = 'devuelto';
    END IF;

    IF NEW.estado = 'devuelto' THEN
        UPDATE libros SET disponibilidad = TRUE WHERE id = NEW.id_libro;
    ELSE
        UPDATE libros SET disponibilidad = FALSE WHERE id = NEW.id_libro;
    END IF;
END //
DELIMITER ;



## Parte 5: Verificación

1. **Inserta libros y usuarios de forma aleatoria utilizando los procedimientos almacenados `insertar_libros_aleatorios` e `insertar_usuarios_aleatorios` para verificar su funcionamiento.**

mysql> call insertar_libros_aleatorios(10);
Query OK, 1 row affected (0.42 sec)

mysql> select * from libros;
+----+-----------+----------+------------------+----------+--------+----------------+
| id | titulo    | autor    | anio_publicacion | genero   | precio | disponibilidad |
+----+-----------+----------+------------------+----------+--------+----------------+
|  1 | Titulo248 | Autor577 |             2010 | d39ac6cb |  48.33 |              0 |
|  2 | Titulo174 | Autor624 |             1964 | d3d094d4 |   6.44 |              1 |
|  3 | Titulo827 | Autor609 |             1968 | d3d10df5 |  49.33 |              0 |
|  4 | Titulo265 | Autor590 |             2009 | d3d17378 |  49.90 |              1 |
|  5 | Titulo657 | Autor694 |             1974 | d3d1c60c |  20.98 |              1 |
|  6 | Titulo723 | Autor828 |             1927 | d3d3a3aa |  18.00 |              1 |
|  7 | Titulo391 | Autor274 |             2004 | d3d5a211 |   7.92 |              0 |
|  8 | Titulo544 | Autor107 |             1934 | d3d613c8 |   9.96 |              0 |
|  9 | Titulo820 | Autor250 |             1945 | d3d673ec |   9.83 |              1 |
| 10 | Titulo487 | Autor589 |             1976 | d3d7af10 |  32.33 |              1 |
+----+-----------+----------+------------------+----------+--------+----------------+
10 rows in set (0.00 sec)


mysql> call insertar_usuarios_aleatorios(10);
Query OK, 1 row affected (1.74 sec)

mysql> select * from usuarios;
+----+-----------+-------------+-----------------------------+------------------+--------------+
| id | nombre    | apellido    | email                       | fecha_nacimiento | penalizacion |
+----+-----------+-------------+-----------------------------+------------------+--------------+
|  1 | Nombre988 | Apellido583 | napellido583@biblioteca.com | 1998-06-02       |         0.00 |
|  2 | Nombre999 | Apellido147 | napellido147@biblioteca.com | 2004-02-27       |         0.00 |
|  3 | Nombre257 | Apellido65  | napellido65@biblioteca.com  | 2009-04-04       |         0.00 |
|  4 | Nombre573 | Apellido204 | napellido204@biblioteca.com | 2016-02-20       |         0.00 |
|  5 | Nombre898 | Apellido586 | napellido586@biblioteca.com | 2018-01-09       |         0.00 |
|  6 | Nombre409 | Apellido347 | napellido347@biblioteca.com | 2010-07-20       |         0.00 |
|  7 | Nombre491 | Apellido936 | napellido936@biblioteca.com | 2018-09-30       |         0.00 |
|  8 | Nombre227 | Apellido512 | napellido512@biblioteca.com | 2000-04-10       |         0.00 |
|  9 | Nombre871 | Apellido710 | napellido710@biblioteca.com | 1998-09-14       |         0.00 |
| 10 | Nombre564 | Apellido1   | napellido1@biblioteca.com   | 2015-10-09       |         0.00 |
+----+-----------+-------------+-----------------------------+------------------+--------------+
10 rows in set (0.00 sec)

2. **Inserta y actualiza préstamos en la tabla `prestamos` para verificar el correcto funcionamiento de los triggers.**

INSERT INTO prestamos (id_libro, id_usuario, fecha_prestamo, fecha_devolucion)
VALUES (1, 1, CURDATE(), CURDATE() - INTERVAL 5 DAY);

UPDATE prestamos SET fecha_devolucion = CURDATE() - INTERVAL 1 DAY WHERE id = 1;

mysql> select * from prestamos;
+----+----------+------------+----------------+------------------+-----------+
| id | id_libro | id_usuario | fecha_prestamo | fecha_devolucion | estado    |
+----+----------+------------+----------------+------------------+-----------+
|  1 |        1 |          1 | 2024-05-30     | 2024-05-29       | pendiente |
+----+----------+------------+----------------+------------------+-----------+
1 row in set (0.00 sec)
