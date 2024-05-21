<div align="justify">

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
id INT PRIMARY KEY,
nombre VARCHAR(30),
apellido1 VARCHAR(30),
apellido2 VARCHAR(30),
nota DECIMAL(4, 1)
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

    SET name_char = SUBSTR(nombre, 1, 1));
    SET apellido1_chars = SUBSTR(apellido1, 1, 3));
    SET apellido2_chars = SUBSTR(apellido2, 1, 3));
    SET email = LOWER(CONCAT(name_char, apellido1_chars, apellido2_chars, arroba, dominio));

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
DELIMITER//
CREATE FUNCTION eliminar_acentos(cadena VARCHAR(100))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  SET cadena = REPLACE(cadena,'á', 'a')
  SET cadena = REPLACE(cadena,'é', 'e')
  SET cadena = REPLACE(cadena,'í', 'i')
  SET cadena = REPLACE(cadena,'ó', 'o')
  SET cadena = REPLACE(cadena,'ú', 'u')
  RETURN cadena

END//
DELIMITER ;

```


    Una vez creada la tabla escriba un trigger con las siguientes características:
    
    - Trigger:
      - __trigger_crear_email_before_insert__. Se ejecuta sobre la tabla alumnos. Se ejecuta antes de una operación de inserción.Si el nuevo valor del email que se quiere insertar es NULL, entonces se le creará automáticamente una dirección de email y se insertará en la tabla. Si el nuevo valor del email no es NULL se guardará en la tabla el valor del email.
```sql
DELIMITER//
CREATE TRIGGER crear_email_before_insert
BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
  IF NEW.email IS NULL THEN

  SET NEW.email = random_email(NEW.nombre, NEW.apellido1, NEW.apellido2, 'dominiorandom.com')
  END IF;
END//
DELIMITER ;
```    
    >__Nota__: Para crear la nueva dirección de email se deberá hacer uso del procedimiento crear_email.
    
    - Verificación:
      - Realiza inserciones en la tabla y verifica el correcto funcionamiento de las __funciones y triggers__.

      - Realiza un procedimiento que realice la inserción de un número de elementos que se pasa como parámetro. Incluye la máxima aleatoriedad posible.
```sql
DROP PROCEDURE IF EXISTS insertar_elementos_random
CREATE PROCEDURE insertar_elementos_random(IN iteraciones INT);
```    
    ## Referencias
    
    - [Apuntes sobre triggers](../../trigers.md).
    - [Apuntes sobre procedimientos y funciones](../../procedimientos.md).
    - [Mysql SubString](https://dev.mysql.com/doc/refman/8.0/en/string-functions.html).
    - [Mysql Replace](https://dev.mysql.com/doc/refman/8.0/en/replace.html).
    
    </div>