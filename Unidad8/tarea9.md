# Trabajo con la BBDD Alumnos
    
    Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:
    
    - Tabla alumnos:
    
      - id (entero sin signo)
      - nombre (cadena de caracteres)
      - apellido1 (cadena de caracteres)
      - apellido2 (cadena de caracteres)
      - email (cadena de caracteres)
    
```sql
DROP TABLE IF EXISTS alumnos;
CREATE TABLE alumnos(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30),
apellido1 VARCHAR(30),
apellido2 VARCHAR(30),
email VARCHAR(100)
);
```
    1. Escribe una función llamado __crear_email__ que dados los parámetros de entrada: __nombre, apellido1, apellido2 y dominio__, cree una dirección de email y la devuelva como salida.
    
    
    - Función: crear_email
      - Entrada:
          - nombre (cadena de caracteres)
          - apellido1 (cadena de caracteres)
          - apellido2 (cadena de caracteres)
          - dominio (cadena de caracteres)
      - Salida:
          - email (cadena de caracteres)


    El email devuelve una dirección de correo electrónico con el siguiente formato:
    
    - El primer carácter del parámetro nombre.
    - Los tres primeros caracteres del parámetro apellido1.
    - Los tres primeros caracteres del parámetro apellido2.
    - El carácter @.
    - El dominio pasado como parámetro.
    - La dirección de email debe estar en minúsculas.
    
```SQL
DROP FUNCTION IF EXISTS crear_email;
DELIMITER //
CREATE FUNCTION crear_email (nombre VARCHAR(30), apellido1 VARCHAR(30), apellido2 VARCHAR(30), dominio VARCHAR(30))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE name_char VARCHAR(1);
    DECLARE apellido1_chars VARCHAR(3);
    DECLARE apellido2_chars VARCHAR(3);
    DECLARE arroba VARCHAR(1) DEFAULT '@';
    DECLARE email VARCHAR(100);

    SET name_char = SUBSTR(nombre, 1, 1);
    SET apellido1_chars = SUBSTR(apellido1, 1, 3);
    SET apellido2_chars = SUBSTR(apellido2, 1, 3);
    SET email = LCASE(CONCAT(name_char, apellido1_chars, apellido2_chars, arroba, dominio));

    RETURN eliminar_acentos(email);
END//
DELIMITER ;

```


    - También crea una función llamada __eliminar_acentos__ que reciba una cadena de caracteres y devuelva la misma cadena sin acentos. La función tendrá que reemplazar todas las vocales que tengan acento por la misma vocal pero sin acento. Por ejemplo, si la función recibe como parámetro de entrada la cadena María la función debe devolver la cadena Maria.
    
    - Función: eliminar_acentos
      - Entrada:
        - cadena (cadena de caracteres)
      - Salida:
        - (cadena de caracteres)
    
    > ___La función crear_email deberá hacer uso de la función eliminar_acentos___.
    
```sql
DROP FUNCTION IF EXISTS eliminar_acentos;
DELIMITER //
CREATE FUNCTION eliminar_acentos(cadena VARCHAR(100)) 
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
  DECLARE new_cadena VARCHAR(100);
  SET new_cadena = REPLACE(cadena, 'á', 'a');
  SET new_cadena = REPLACE(new_cadena, 'é', 'e');
  SET new_cadena = REPLACE(new_cadena, 'í', 'i');
  SET new_cadena = REPLACE(new_cadena, 'ó', 'o');
  SET new_cadena = REPLACE(new_cadena, 'ú', 'u');
  RETURN new_cadena;
END //
DELIMITER ;
```


    Una vez creada la tabla escriba un trigger con las siguientes características:
    
    - Trigger:
      - __trigger_crear_email_before_insert__. Se ejecuta sobre la tabla alumnos. Se ejecuta antes de una operación de inserción.Si el nuevo valor del email que se quiere insertar es NULL, entonces se le creará automáticamente una dirección de email y se insertará en la tabla. Si el nuevo valor del email no es NULL se guardará en la tabla el valor del email.
```sql

DROP TRIGGER IF EXISTS crear_email_before_insert;
DELIMITER //
CREATE TRIGGER crear_email_before_insert
BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
  IF NEW.email IS NULL THEN

  SET NEW.email = crear_email(NEW.nombre, NEW.apellido1, NEW.apellido2, CONCAT(SUBSTRING_INDEX(UUID(), '-', 1), '.com'));
  END IF;
END;//
DELIMITER ;

```    
    >__Nota__: Para crear la nueva dirección de email se deberá hacer uso del procedimiento crear_email.
    
    - Verificación:
      - Realiza inserciones en la tabla y verifica el correcto funcionamiento de las __funciones y triggers__.

      - Realiza un procedimiento que realice la inserción de un número de elementos que se pasa como parámetro. Incluye la máxima aleatoriedad posible.
```sql
DELIMITER //
DROP PROCEDURE IF EXISTS insertar_alumnos;
CREATE PROCEDURE insertar_alumnos(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE nombre VARCHAR(30);
    DECLARE apellido1 VARCHAR(30);
    DECLARE apellido2 VARCHAR(30);

    DECLARE nombresList TEXT;
    DECLARE apellidosList TEXT;

    SET nombresList = 'Kai,Jose,Jesús,Lili,César,Germán,Marina,Nichole,Adrián,Joseph';
    SET apellidosList = 'García,Fernández,González,Rodríguez,López,Martínez,Sánchez,Pérez,Gómez,Martín';

    WHILE counter < iterations DO
        SET nombre = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(nombresList, ',', 1 + FLOOR(RAND() * 10)), ',', -1));
        SET apellido1 = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(apellidosList, ',', 1 + FLOOR(RAND() * 10)), ',', -1));
        SET apellido2 = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(apellidosList, ',', 1 + FLOOR(RAND() * 10)), ',', -1));
        
        INSERT INTO alumnos (nombre, apellido1, apellido2) 
        VALUES (nombre, apellido1, apellido2);

        SET counter = counter + 1;
    END WHILE;
END//
DELIMITER ;

```    

```sql
CALL insertar_alumnos(10);

mysql> select * from alumnos;
+----+--------+-----------+-----------+----------------------+
| id | nombre | apellido1 | apellido2 | email                |
+----+--------+-----------+-----------+----------------------+
|  1 | Kai    | Rodríguez | Gómez     | krodgom@14de7bce.com |
|  2 | Jose   | Rodríguez | González  | jrodgon@14e42c8e.com |
|  3 | Kai    | Sánchez   | García    | ksangar@14e65061.com |
|  4 | Lili   | López     | Fernández | llopfer@14e6b9eb.com |
|  5 | Marina | Pérez     | Martín    | mpermar@14e8032a.com |
|  6 | Lili   | Fernández | Rodríguez | lferrod@14e9f3d1.com |
|  7 | Lili   | Pérez     | Sánchez   | lpersan@14eb171e.com |
|  8 | Jose   | Martínez  | Rodríguez | jmarrod@14eb5afa.com |
|  9 | Jesús  | Fernández | Pérez     | jferper@14eb9c45.com |
| 10 | Marina | Gómez     | González  | mgomgon@14ebde14.com |
+----+--------+-----------+-----------+----------------------+
10 rows in set (0.01 sec)
```



