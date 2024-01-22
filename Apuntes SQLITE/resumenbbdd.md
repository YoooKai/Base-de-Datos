# SQLITE

- `CREATE`: Crea la tabla
- `ALTER`: Añade o elimina objetos de la tabla

```sql
ALTER TABLE comments
ADD COLUMN username TEXT;
```

```sql
ALTER TABLE comments
RENAME TO Coms;
```

- `DROP`: Elimina la tabla

```sql
DROP TABLE if exists Coments;
```

- `TRUNCATE`: Elimina TODOS los datos de la tabla
- `SELECT`: Selecciona los datos que quieras de la tablas (indicar datos a seleccionar)
- `INSERT`: Ayuda a colocar datos en la tabla (indicar datos a colocar)

## Para crear una base de datos:

```sql
sqlite3 comment_section.db
```

## Tipos de datos:

Text

Integer (si es boleano 0(falso) o 1(true))

Real

Blob

- Se usa **NULL / NOT NULL** para indicar si valor es necesario que esté relleno o null si no hay info, por ej:

No hay información sobre precio el libro

```sql
insert into libro (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',null);
```

Se puede realizar búsqueda con ese parámetro:

```sql
 select * from libro
  where editorial is null;
```

- La PRIMARY KEY puede ser simple o compuesta, por ej:

```sql
 create table inscrito(
  documento text,
  deporte text,
  año integer,
  nombre text,
  matricula text,
  primary key(documento,deporte,año)
 );
```

- FOREIGN KEY si se trata de una tabla intermedia, se tiene que referencial el id de la tabla a la que hace referencia:

```sql
create table editorial(
	codigo integer primary key,
	nombre text
);

create table libro(
	codigo integer primary key,
	titulo text,
	autor text,
	precio real,
	codigo_editorial integer	references editorial(codigo)
);
```

- OPERACIONES ARITMÉTICAS en las consultas

Para que nos devuelva el precio con un 10% de descuento:

```sql
select titulo, precio,precio*0.1,precio-(precio*0.1)
  from libro;
```

o lo actualice:

```sql
update libro set precio=precio-(precio*0.1);
```

o concaternar:

```sql
 select titulo||'-'||autor||'-'||editorial
  from libro;
```

- Poner **valor por defecto** con default

```sql
create table libro(
	codigo integer primary key,
	titulo text,
	autor text not null default 'desconocido',
	editorial text,
	precio real,
	cantidad integer default 0
 );
```

## Crear tabla

```sql
CREATE TABLE comments (
    post_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    website_url TEXT NULL,
    comment TEXT NOT NULL );
 );
```

```sql
INSERT INTO comments (name, email, website_url, comment) VALUES ('Kai', 'kai97rg@gmail.com', 'ghustky.com', 'estoy cansado')
```

Para ver las tabla creadas:

```sql
.table
```

Para poner modo tabla:

```sql
.mode table
```

### Comentarios

```sql
/*comentario de más
de una línea */

  --comentario de una línea
```

## COMANDOS

- `DELETE` Elimina información que cumpla con la condición que pongamos

```sql
DELETE FROM comments
WHERE post_id = 9;
```

```sql
 delete from usuario where nombre='Marcelo';
```

- `SELECT` muestra la info que le pidamos (\* para mostrar todo)

```sql
select * from comments;
```

```sql
select nombre,clave from usuario;
```

- `WHERE` añadir una condición al select para especificar consulta

```sql
select nombre,clave
  from usuario
  where clave='test';
```

### Operadores

| **Operador** | **Descripción** |
| ------------ | --------------- |
| =            | igual           |
| <>           | distinto        |
| >            | mayor           |
| <            | menor           |
| >=           | mayor o igual   |
| <=           | menor o igual   |

```sql
select nombre,clave
  from usuario
  where clave<>'pedrito';
```

- `UPDATE` actualizar o modificar valores

```sql
 update usuario set nombre='Marceloduarte', clave='Marce'
  where nombre='Marcelo';
```

- `ORDER BY` ordena el resultado de select, puede indicarse valor ascendente o descendente

```sql
select codigo,titulo,autor,editorial,precio from libro order by titulo asc;
```

```sql
select codigo,titulo,autor,editorial,precio from libro order by editorial desc;
```

También por valor calculado o expresión:

```sql
select titulo, autor, editorial, precio+(precio*0.1) as preciocondescuento
  from libro
  order by preciocondescuento;
```

#### Operadores Lógicos (and, or, not, ())

Combinan condiciones

```sql
select * from libro
  where autor='Borges' and
        precio<=20;
```

```sql
select * from libro
  where (autor='Borges' or editorial='Paidos') and
        (precio<20);
```
