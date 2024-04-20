
# Tarea de Funciones y Procedimientos 2

## Base de Datos Jardineria

<img src="https://github.com/jpexposito/docencia/raw/master/Primero/BAE/UNIDAD-8/tareas/tarea2/img/er.png">

1. Función calcular_precio_total_pedido
- Parámetros de entrada: codigo_pedido (INT)
- Parámetros de salida: El precio total del pedido (FLOAT)

```sql
DELIMITER //

DROP FUNCTION IF EXISTS calcular_precio_total_pedido //

CREATE FUNCTION calcular_precio_total_pedido(codigo_pedido INTEGER) RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE total_precio FLOAT;
    
    SELECT SUM(cantidad * precio_unidad) INTO total_precio
    FROM detalle_pedido
    WHERE codigo_pedido = codigo_pedido;
    
    RETURN total_precio;
END //

DELIMITER ;

```
```sql
select calcular_precio_total_pedido(3);
+---------------------------------+
| calcular_precio_total_pedido(3) |
+---------------------------------+
|                          217738 |
+---------------------------------+
```
2. Función calcular_suma_pedidos_cliente

- Parámetros de entrada: codigo_cliente (INT)
- Parámetros de salida: La suma total de todos los pedidos del cliente (FLOAT)

```sql

DELIMITER //

DROP FUNCTION IF EXISTS calcular_suma_pedidos_cliente //

CREATE FUNCTION calcular_suma_pedidos_cliente(codigo_cliente INTEGER) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total_pedidos INT;

    SELECT COUNT(codigo_cliente) INTO total_pedidos
    FROM pedido
    WHERE codigo_cliente = codigo_cliente;

    RETURN total_pedidos;
END //

DELIMITER ;

```
select calcular_suma_pedidos_cliente(3);
```sql
select calcular_suma_pedidos_cliente(3);
+----------------------------------+
| calcular_suma_pedidos_cliente(3) |
+----------------------------------+
|                              115 |
+----------------------------------+
```

3. Función calcular_suma_pagos_cliente

Nota:Dado un código de cliente la función debe calcular la suma total de los pagos realizados por ese cliente.

- Parámetros de entrada: codigo_cliente (INT)
- Parámetros de salida: La suma total de todos los pagos del cliente (FLOAT)


```SQL
DELIMITER //

DROP FUNCTION IF EXISTS calcular_suma_pagos_cliente //

CREATE FUNCTION calcular_suma_pagos_cliente(codigo_cliente INTEGER) RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE total_pagado FLOAT;
    SELECT SUM(calcular_precio_total_pedido(codigo_pedido)) INTO total_pagado
    FROM pedido
    WHERE codigo_cliente = codigo_cliente;

    RETURN total_pagado;
END //

DELIMITER ;


```
select calcular_suma_pagos_cliente(3);
+--------------------------------+
| calcular_suma_pagos_cliente(3) |
+--------------------------------+
|                       25039900 |
+--------------------------------+
```sql
select calcular_suma_pagos_cliente(3);
```
4. Procedimiento calcular_pagos_pendientes

Nota:Deberá calcular los pagos pendientes de todos los clientes. Para saber si un cliente tiene algún pago pendiente deberemos calcular cuál es la cantidad de todos los pedidos y los pagos que ha realizado. Si la cantidad de los pedidos es mayor que la de los pagos entonces ese cliente tiene pagos pendientes.

```sql

DELIMITER //

DROP PROCEDURE IF EXISTS calcular_pagos_pendientes //

CREATE PROCEDURE calcular_pagos_pendientes(IN uCodigo VARCHAR(20))
BEGIN
    DECLARE total_pedidos INT;
    DECLARE total_pagos INT;
    DECLARE num_pagos_pendientes INT;

    --  de pedidos del cliente
    SET total_pedidos = calcular_suma_pedidos_cliente(uCodigo);

    -- total de pagos del cliente
    SELECT COUNT(codigo_cliente) INTO total_pagos
    FROM pago
    WHERE codigo_cliente = uCodigo;

    -- total de pagos pendientes
    IF total_pedidos > total_pagos THEN
        SET num_pagos_pendientes = total_pedidos - total_pagos;
    ELSE
        SET num_pagos_pendientes = 0; 
    END IF;

    -- devolver número de pagos pendientes
    SELECT num_pagos_pendientes AS Pagos_Pendientes;
END//

DELIMITER ;

```
```sql
CALL calcular_pagos_pendientes(3);
+------------------+
| Pagos_Pendientes |
+------------------+
|              112 |
+------------------+
```

