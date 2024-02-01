# TAREA 5 
## CONSULTAS EN SQLITE USANDO EXPRESIONES REGULARES

<img src="https://d7hftxdivxxvm.cloudfront.net/?quality=80&resize_to=width&src=https%3A%2F%2Fartsy-media-uploads.s3.amazonaws.com%2Fx_bSYyLA9R3orH4s0X7VHA%252FHobbit%2Bdust%2Bjacket%2Bfront%2Bstraight%2Badjusted%2Bfor%2Btext%2Bpage.jpg&width=910" height="400px">

### Selección de libros cuyo título comienza con "H".

```sql
 select titulo from libro where titulo regexp '^A';
```

### Libros escritos por autores cuyos nombres terminan con "ing".

```sql
select * from libro where titulo regexp 'ing$';
```

### Libros con títulos que contienen la palabra "and" en cualquier posición.

```sql
select * from libro where titulo regexp 'and';
```

### Libros cuyo título comienza con una vocal.

```sql
select * from libro where titulo REGEXP '^[aeiouAEIOU]';
```

```code
+--------+----------------------------------+----------+-----------------------+--------+
| codigo |              titulo              | autor_id |       editorial       | precio |
+--------+----------------------------------+----------+-----------------------+--------+
| 4      | One Hundred Years of Solitude    | 9        | Harper & Row          | 22.5   |
| 20     | Alice's Adventures in Wonderland | 22       | Macmillan             | 11.5   |
| 24     | Anna Karenina                    | 26       | The Russian Messenger | 23.99  |
+--------+----------------------------------+----------+-----------------------+--------+
```

### Libros cuyo autor tiene al menos una vocal repetida.

```sql
SELECT * FROM libro as l, autor as a where a.nombre REGEXP '[aeiouAEIOU]{2}' and l.autor_id=a.id;
```

```code
+--------+-----------------+----------+-----------------+--------+----+---------------+
| codigo |     titulo      | autor_id |    editorial    | precio | id |    nombre     |
+--------+-----------------+----------+-----------------+--------+----+---------------+
| 5      | Brave New World | 3        | Chatto & Windus | 17.99  | 3  | George Orwell |
+--------+-----------------+----------+-----------------+--------+----+---------------+
```

### Libros con precios que tienen dos dígitos decimales exactos.

```sql
SELECT * FROM libro where precio REGEXP '\.[0-9]{2}$';
```

```code
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
```

### Libros cuyos títulos tienen al menos tres palabras.

```sql
SELECT * FROM libro where titulo REGEXP '^[a-zA-Z]+ [a-zA-Z]+ [a-zA-Z]';
```

```code
+--------+-----------------------------------+----------+---------------------------+--------+
| codigo |              titulo               | autor_id |         editorial         | precio |
+--------+-----------------------------------+----------+---------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons   | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.     | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row              | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus           | 17.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin      | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles             | 28.99  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press          | 21.5   |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons   | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                    | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company   | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes             | 16.99  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri           | 20.5   |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers      | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.             | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger     | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger     | 19.99  |
+--------+-----------------------------------+----------+---------------------------+--------+
```

### Obtener todos los autores cuyo nombre empieza con la letra "A":

```sql
SELECT * FROM autor WHERE nombre REGEXP '^A';
```

```code
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 5  | Agatha Christie |
+----+-----------------+
```

### Seleccionar los libros cuyo título contiene la palabra "SQL":

```sql
select titulo from libro where titulo regexp 'SQL';
```

### Obtener todos los autores cuyo nombre termina con "ez":

```sql
SELECT * FROM autor WHERE nombre LIKE 'ez$';
```

### Obtener todos los autores cuyo nombre tiene al menos 5 caracteres:

```sql
 select * from autor where nombre regexp '.....';
```

```code
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
```

### Seleccionar los libros cuya editorial es diferente de "EditorialX":

```sql
select * from libro where editorial not REGEXP "EditorialX";
```

```code
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
```

### Obtener todos los autores cuyo nombre contiene al menos una vocal:

```sql
SELECT * FROM autor WHERE nombre REGEXP '[aeiouAEIOU]';
```

```code
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
```

### Seleccionar los libros cuyo título comienza con una letra mayúscula:

```sql
SELECT * FROM libro WHERE titulo REGEXP '^[A-Z]';
```

```code
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+

```

### Obtener todos los autores cuyo nombre no contiene la letra "r":

```sql
SELECT * from autor where nombre not REGEXP 'r';
```

```code
----+--------------+
| id |    nombre    |
+----+--------------+
| 1  | J.K. Rowling |
| 2  | Stephen King |
| 4  | Jane Austen  |
+----+--------------+
```

### Seleccionar los libros cuya editorial empieza con la letra "P":

```sql
SELECT * from libro where editorial REGEXP '^P';
```

```code
+--------+---------------------------+----------+-----------+--------+
| codigo |          titulo           | autor_id | editorial | precio |
+--------+---------------------------+----------+-----------+--------+
| 16     | The Count of Monte Cristo | 18       | Pétion    | 27.99  |
+--------+---------------------------+----------+-----------+--------+
```

### Obtener todos los autores cuyo nombre tiene exactamente 6 caracteres:

```
select * from autor where nombre regexp '^......$';

--or

SELECT * FROM autor WHERE nombre REGEXP '^.{6}$';
```

### Seleccionar los libros cuyo título contiene al menos un número:

```sql
SELECT * FROM libro WHERE titulo REGEXP '\d';
```

### Obtener todos los autores cuyo nombre inicia con una vocal:

```sql
SELECT * FROM autor WHERE nombre REGEXP '^[aeiouAEIOU]';
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 5  | Agatha Christie |
+----+-----------------+
```

### Obtener todos los autores cuyo nombre no contiene espacios en blanco:

```sql
SELECT * from autor where nombre not REGEXP '\s';
```

### Seleccionar los libros cuyo título termina con una vocal:

```sql
SELECT * FROM libro WHERE titulo REGEXP '[aeiouAEIOU]$';
```

```code
+--------+-------------------------------+----------+---------------------------+--------+
| codigo |            titulo             | autor_id |         editorial         | precio |
+--------+-------------------------------+----------+---------------------------+--------+
| 3      | The Catcher in the Rye        | 8        | Little, Brown and Company | 18.75  |
| 4      | One Hundred Years of Solitude | 9        | Harper & Row              | 22.5   |
| 8      | The Chronicles of Narnia      | 11       | Geoffrey Bles             | 28.99  |
| 15     | The Old Man and the Sea       | 17       | Charles Scribner's Sons   | 18.95  |
| 16     | The Count of Monte Cristo     | 18       | Pétion                    | 27.99  |
| 21     | The Prince                    | 23       | Niccolò Machiavelli       | 10.99  |
| 22     | Don Quixote                   | 24       | Francisco de Robles       | 26.75  |
| 24     | Anna Karenina                 | 26       | The Russian Messenger     | 23.99  |
| 28     | War and Peace                 | 26       | The Russian Messenger     | 33.25  |
+--------+-------------------------------+----------+---------------------------+--------+

```

### Obtener todos los autores cuyo nombre contiene la secuencia "er":

```sql
SELECT * FROM autor where nombre REGEXP '^er$';
```

### Seleccionar los libros cuyo título empieza con la palabra "The":

```
SELECT * FROM libro WHERE titulo REGEXP '^The';
```

```code
+--------+-----------------------------------+----------+---------------------------+--------+
| codigo |              titulo               | autor_id |         editorial         | precio |
+--------+-----------------------------------+----------+---------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons   | 20.99  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company | 18.75  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin      | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin      | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles             | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                     | 14.95  |
| 10     | The Iliad                         | 12       | Homer                     | 14.95  |
| 12     | The Road                          | 14       | Alfred A. Knopf           | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press          | 21.5   |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons   | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                    | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company   | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes             | 16.99  |
| 21     | The Prince                        | 23       | Niccolò Machiavelli       | 10.99  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri           | 20.5   |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers      | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.             | 17.5   |
+--------+-----------------------------------+----------+---------------------------+--------+
```

### Obtener todos los autores cuyo nombre tiene al menos una letra mayúscula:

```sql
SELECT * FROM autor WHERE nombre REGEXP '[A-Z]';
```

```code
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
```

### Obtener todos los autores cuyo nombre no contiene números:

```sql
SELECT * FROM autor where nombre not REGEXP '[0-9]';
```

```code
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
```

### Seleccionar los libros cuyo título contiene al menos tres vocales:

```sql
SELECT * FROM libro WHERE titulo REGEXP '[aeiouAEIOU]{3}';
-- está buggeada
```

### Obtener todos los autores cuyo nombre inicia con una consonante:

```sql
select * from autor where nombre not REGEXP '^[aeiouAEIOU]';
```

```code
+----+---------------+
| id |    nombre     |
+----+---------------+
| 1  | J.K. Rowling  |
| 2  | Stephen King  |
| 3  | George Orwell |
| 4  | Jane Austen   |
+----+---------------+
```

### Seleccionar los libros cuyo título no contiene la palabra "Science":

```sql
SELECT * FROM libro where titulo not REGEXP 'Science';
```

```code
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
```

### Obtener todos los autores cuyo nombre tiene al menos una letra repetida consecutivamente:

```sql
SELECT * FROM autor WHERE nombre REGEXP '(.)\\1+';

```

```sql
+----+-----------------+
| id | nombre          |
+----+-----------------+
| 3  | George Orwell   |
+----+-----------------+
```

### Obtener todos los autores cuyo nombre empieza con "M" o termina con "n":

```sql
SELECT * FROM autor where nombre REGEXP '^M|n$';
```

### Obtener todos los autores cuyo nombre no contiene caracteres especiales:

```sql
SELECT * FROM autor where nombre regexp '[a-zA-Z0-9]';
```

```code
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
```
