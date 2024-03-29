###########################################
#
# Autor: Kai Rodríguez García
#
#Nombre: EjercicioSoftware1.sh
#
#Objetivo: Debe recibir un argumento (nombre del paquete), si el usuario no lo indica, se le pedirá luego por teclado hasta que especifique un nombre.

#    Si el paquete indicado NO ESTÁ INSTALADO en el sistema, se comproborá si existe en los repositorios del sistema:
#Si el paquete SÍ EXISTE en los repositorios: se le mostrará la información del paquete y se le dará la opción de instalarlo.
#Si el paquete NO EXISTE en los repositorios: se le indicará al usuario que no hay ningún paquete que se llame como ha indicado, 
#y se le mostrará el resultado de la búsqueda que se obtiene con el argumento que ha dado el usuario 
#(puede que la búsqueda no dé ningún paquete, o puede que la búsqueda muestre paquetes que se llaman de forma similar. En cualquier caso, se mostrará el resultado).
#
#    Si el paquete indicado SÍ ESTÁ INSTALADO: se le dará la opción de:
#Mostrar su versión
#Reinstalarlo
#Actualizarlo (solo este paquete, si fuera actualizable)
#Eliminarlo (guardando la configuración)
#Eliminarlo totalmente
#
# Entradas: nombre de un paquete
# Salidas: mostrar info del paquete, reinstalarlo, actualizarlo, eliminarlo
#
#Historial: 7/02/2024 #Primer esqueleto del ejercicio
#
############################################

paquete=$1

while [ -z "$paquete" ] 
do
    error "ERROR: No ha escrito un argumento"
    read -p "Escribe el nombre del paquete: " nombre_paquete
done

if []
then
    comprobar si existe en repositorios de sistema
    if [sí existe]
    then
        mostrar info de paquete 
        opción de instalar
    else
        mensaje no hay paquete 
        mostrar resultado de la búsqueda
elif [está instalado]
then
    select opcion in:
    echo "1) Mostrar Versión"
    echo "2) Reinstalar"
    echo "3) Actualizarlo"
    echo "4) Eliminarlo (guardando la configuración"
    echo "5) Eliminarlo totalmente"
    echo ""
    read -p "Introduzca su opción: " opcion

case "$opcion" in
    1) 'dpkg -s $paquete'
    ;;
    2) 'sudo apt-get reinstall $paquete'
    ;;
    3) 'sudo apt-get update $paquete'
    ;;
    4) 'sudo apt-get remove $paquete'
    ;;
    "5") 'sudo apt-get purge $paquete'
    ;;
    *)  ECHO "Error: '$opcion' no es una opción correcta"
    ;;






# TAREA 10

1. Proporciona una consulta que muestre solo los clientes de Brasil.

```sql
select * from customers where country = Brazil;
```
| CustomerId | FirstName | LastName  |                     Company                      |             Address             |        City         | State | Country | PostalCode |       Phone        |        Fax         |             Email             | SupportRepId |
|------------|-----------|-----------|--------------------------------------------------|---------------------------------|---------------------|-------|---------|------------|--------------------|--------------------|-------------------------------|--------------|
| 1          | Luís      | Gonçalves | Embraer - Empresa Brasileira de Aeronáutica S.A. | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP    | Brazil  | 12227-000  | +55 (12) 3923-5555 | +55 (12) 3923-5566 | luisg@embraer.com.br          | 3            |
| 10         | Eduardo   | Martins   | Woodstock Discos                                 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP    | Brazil  | 01007-010  | +55 (11) 3033-5446 | +55 (11) 3033-4564 | eduardo@woodstock.com.br      | 4            |
| 11         | Alexandre | Rocha     | Banco do Brasil S.A.                             | Av. Paulista, 2022              | São Paulo           | SP    | Brazil  | 01310-200  | +55 (11) 3055-3278 | +55 (11) 3055-8131 | alero@uol.com.br              | 5            |
| 12         | Roberto   | Almeida   | Riotur                                           | Praça Pio X, 119                | Rio de Janeiro      | RJ    | Brazil  | 20040-020  | +55 (21) 2271-7000 | +55 (21) 2271-7070 | roberto.almeida@riotur.gov.br | 3            |
| 13         | Fernanda  | Ramos     |                                                  | Qe 7 Bloco G                    | Brasília            | DF    | Brazil  | 71020-677  | +55 (61) 3363-5547 | +55 (61) 3363-7855 | fernadaramos4@uol.com.br      | 4            |


2. Proporciona una consulta que muestre las facturas de clientes que son de Brasil. La tabla resultante debe mostrar el nombre completo del cliente, ID de factura, fecha de la factura y país de facturación.
```sql
select c.FirstName, c.LastName, c.Country, i.InvoiceId, i.InvoiceDate, i.BillingCountry from customers as c, invoices as i where c.CustomerId=i.CustomerId and c.country='Brazil';

select c.FirstName, c.LastName, c.Country, i.InvoiceId, i.InvoiceDate, i.BillingCountry from customers as c join invoices as i on c.CustomerId=i.CustomerId and c.country='Brazil';
```

| FirstName | LastName  | Country | InvoiceId |     InvoiceDate     | BillingCountry |
|-----------|-----------|---------|-----------|---------------------|----------------|
| Luís      | Gonçalves | Brazil  | 98        | 2010-03-11 00:00:00 | Brazil         |
| Luís      | Gonçalves | Brazil  | 121       | 2010-06-13 00:00:00 | Brazil         |
| Luís      | Gonçalves | Brazil  | 143       | 2010-09-15 00:00:00 | Brazil         |
| Luís      | Gonçalves | Brazil  | 195       | 2011-05-06 00:00:00 | Brazil         |
| Luís      | Gonçalves | Brazil  | 316       | 2012-10-27 00:00:00 | Brazil         |
| Luís      | Gonçalves | Brazil  | 327       | 2012-12-07 00:00:00 | Brazil         |
| Luís      | Gonçalves | Brazil  | 382       | 2013-08-07 00:00:00 | Brazil         |
| Eduardo   | Martins   | Brazil  | 25        | 2009-04-09 00:00:00 | Brazil         |
| Eduardo   | Martins   | Brazil  | 154       | 2010-11-14 00:00:00 | Brazil         |
| Eduardo   | Martins   | Brazil  | 177       | 2011-02-16 00:00:00 | Brazil         |
| Eduardo   | Martins   | Brazil  | 199       | 2011-05-21 00:00:00 | Brazil         |
| Eduardo   | Martins   | Brazil  | 251       | 2012-01-09 00:00:00 | Brazil         |
| Eduardo   | Martins   | Brazil  | 372       | 2013-07-02 00:00:00 | Brazil         |
| Eduardo   | Martins   | Brazil  | 383       | 2013-08-12 00:00:00 | Brazil         |
| Alexandre | Rocha     | Brazil  | 57        | 2009-09-06 00:00:00 | Brazil         |
| Alexandre | Rocha     | Brazil  | 68        | 2009-10-17 00:00:00 | Brazil         |
| Alexandre | Rocha     | Brazil  | 123       | 2010-06-17 00:00:00 | Brazil         |
| Alexandre | Rocha     | Brazil  | 252       | 2012-01-22 00:00:00 | Brazil         |
| Alexandre | Rocha     | Brazil  | 275       | 2012-04-25 00:00:00 | Brazil         |
| Alexandre | Rocha     | Brazil  | 297       | 2012-07-28 00:00:00 | Brazil         |
| Alexandre | Rocha     | Brazil  | 349       | 2013-03-18 00:00:00 | Brazil         |
| Roberto   | Almeida   | Brazil  | 34        | 2009-05-23 00:00:00 | Brazil         |
| Roberto   | Almeida   | Brazil  | 155       | 2010-11-14 00:00:00 | Brazil         |
| Roberto   | Almeida   | Brazil  | 166       | 2010-12-25 00:00:00 | Brazil         |
| Roberto   | Almeida   | Brazil  | 221       | 2011-08-25 00:00:00 | Brazil         |
| Roberto   | Almeida   | Brazil  | 350       | 2013-03-31 00:00:00 | Brazil         |
| Roberto   | Almeida   | Brazil  | 373       | 2013-07-03 00:00:00 | Brazil         |
| Roberto   | Almeida   | Brazil  | 395       | 2013-10-05 00:00:00 | Brazil         |
| Fernanda  | Ramos     | Brazil  | 35        | 2009-06-05 00:00:00 | Brazil         |
| Fernanda  | Ramos     | Brazil  | 58        | 2009-09-07 00:00:00 | Brazil         |
| Fernanda  | Ramos     | Brazil  | 80        | 2009-12-10 00:00:00 | Brazil         |
| Fernanda  | Ramos     | Brazil  | 132       | 2010-07-31 00:00:00 | Brazil         |
| Fernanda  | Ramos     | Brazil  | 253       | 2012-01-22 00:00:00 | Brazil         |
| Fernanda  | Ramos     | Brazil  | 264       | 2012-03-03 00:00:00 | Brazil         |
| Fernanda  | Ramos     | Brazil  | 319       | 2012-11-01 00:00:00 | Brazil         |


3. Proporciona una consulta que muestre solo los empleados que son Agentes de Ventas.
```sql
select * from employees where title = 'Sales Support Agent';
```

| EmployeeId | LastName | FirstName |        Title        | ReportsTo |      BirthDate      |      HireDate       |     Address      |  City   | State | Country | PostalCode |       Phone       |        Fax        |          Email           |
|------------|----------|-----------|---------------------|-----------|---------------------|---------------------|------------------|---------|-------|---------|------------|-------------------|-------------------|--------------------------|
| 3          | Peacock  | Jane      | Sales Support Agent | 2         | 1973-08-29 00:00:00 | 2002-04-01 00:00:00 | 1111 6 Ave SW    | Calgary | AB    | Canada  | T2P 5M5    | +1 (403) 262-3443 | +1 (403) 262-6712 | jane@chinookcorp.com     |
| 4          | Park     | Margaret  | Sales Support Agent | 2         | 1947-09-19 00:00:00 | 2003-05-03 00:00:00 | 683 10 Street SW | Calgary | AB    | Canada  | T2P 5G3    | +1 (403) 263-4423 | +1 (403) 263-4289 | margaret@chinookcorp.com |
| 5          | Johnson  | Steve     | Sales Support Agent | 2         | 1965-03-03 00:00:00 | 2003-10-17 00:00:00 | 7727B 41 Ave     | Calgary | AB    | Canada  | T3B 1Y7    | 1 (780) 836-9987  | 1 (780) 836-9543  | steve@chinookcorp.com    |


4. Proporciona una consulta que muestre una lista única de países de facturación de la tabla de Facturas.
```sql
select distinct(BillingCountry) from invoices;
```

| BillingCountry |
|----------------|
| Germany        |
| Norway         |
| Belgium        |
| Canada         |
| USA            |
| France         |
| Ireland        |
| United Kingdom |
| Australia      |
| Chile          |
| India          |
| Brazil         |
| Portugal       |
| Netherlands    |
| Spain          |
| Sweden         |
| Czech Republic |
| Finland        |
| Denmark        |
| Italy          |
| Poland         |
| Austria        |
| Hungary        |
| Argentina      |


5. Proporciona una consulta que muestre las facturas de clientes que son de Brasil.
```sql
select i.* from invoices as i, customers as c where c.CustomerId=i.CustomerId and c.country='Brazil';

select i.* from invoices as i join customers as c on c.CustomerId=i.CustomerId and c.country='Brazil';
```

| InvoiceId | CustomerId |     InvoiceDate     |         BillingAddress          |     BillingCity     | BillingState | BillingCountry | BillingPostalCode | Total |
|-----------|------------|---------------------|---------------------------------|---------------------|--------------|----------------|-------------------|-------|
| 98        | 1          | 2010-03-11 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 3.98  |
| 121       | 1          | 2010-06-13 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 3.96  |
| 143       | 1          | 2010-09-15 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 5.94  |
| 195       | 1          | 2011-05-06 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 0.99  |
| 316       | 1          | 2012-10-27 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 1.98  |
| 327       | 1          | 2012-12-07 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 13.86 |
| 382       | 1          | 2013-08-07 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 8.91  |
| 25        | 10         | 2009-04-09 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 8.91  |
| 154       | 10         | 2010-11-14 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 1.98  |
| 177       | 10         | 2011-02-16 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 3.96  |
| 199       | 10         | 2011-05-21 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 5.94  |
| 251       | 10         | 2012-01-09 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 0.99  |
| 372       | 10         | 2013-07-02 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 1.98  |
| 383       | 10         | 2013-08-12 00:00:00 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP           | Brazil         | 01007-010         | 13.86 |
| 57        | 11         | 2009-09-06 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 1.98  |
| 68        | 11         | 2009-10-17 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 13.86 |
| 123       | 11         | 2010-06-17 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 8.91  |
| 252       | 11         | 2012-01-22 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 1.98  |
| 275       | 11         | 2012-04-25 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 3.96  |
| 297       | 11         | 2012-07-28 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 5.94  |
| 349       | 11         | 2013-03-18 00:00:00 | Av. Paulista, 2022              | São Paulo           | SP           | Brazil         | 01310-200         | 0.99  |
| 34        | 12         | 2009-05-23 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 0.99  |
| 155       | 12         | 2010-11-14 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 1.98  |
| 166       | 12         | 2010-12-25 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 13.86 |
| 221       | 12         | 2011-08-25 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 8.91  |
| 350       | 12         | 2013-03-31 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 1.98  |
| 373       | 12         | 2013-07-03 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 3.96  |
| 395       | 12         | 2013-10-05 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 5.94  |
| 35        | 13         | 2009-06-05 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 1.98  |
| 58        | 13         | 2009-09-07 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 3.96  |
| 80        | 13         | 2009-12-10 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 5.94  |
| 132       | 13         | 2010-07-31 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 0.99  |
| 253       | 13         | 2012-01-22 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 1.98  |
| 264       | 13         | 2012-03-03 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 13.86 |
| 319       | 13         | 2012-11-01 00:00:00 | Qe 7 Bloco G                    | Brasília            | DF           | Brazil         | 71020-677         | 8.91  |

6. Proporciona una consulta que muestre las facturas asociadas con cada agente de ventas. La tabla resultante debe incluir el nombre completo del Agente de Ventas.
```sql
select i.* from invoices as i, employees as e, customers as c where e.title = 'Sales Support Agent' and c.CustomerId=i.CustomerId and 
e.EmployeeId=c.SupportRepId;

```
| InvoiceId | CustomerId |     InvoiceDate     |              BillingAddress              |     BillingCity     | BillingState | BillingCountry | BillingPostalCode | Total |
|-----------|------------|---------------------|------------------------------------------|---------------------|--------------|----------------|-------------------|-------|
| 98        | 1          | 2010-03-11 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 3.98  |
| 121       | 1          | 2010-06-13 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 3.96  |
| 143       | 1          | 2010-09-15 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 5.94  |
| 195       | 1          | 2011-05-06 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 0.99  |
| 316       | 1          | 2012-10-27 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 1.98  |
| 327       | 1          | 2012-12-07 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 13.86 |
| 382       | 1          | 2013-08-07 00:00:00 | Av. Brigadeiro Faria Lima, 2170          | São José dos Campos | SP           | Brazil         | 12227-000         | 8.91  |
| 99        | 3          | 2010-03-11 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 3.98  |
| 110       | 3          | 2010-04-21 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 13.86 |
| 165       | 3          | 2010-12-20 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 8.91  |
| 294       | 3          | 2012-07-26 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 1.98  |
| 317       | 3          | 2012-10-28 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 3.96  |
| 339       | 3          | 2013-01-30 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 5.94  |
| 391       | 3          | 2013-09-20 00:00:00 | 1498 rue Bélanger                        | Montréal            | QC           | Canada         | H2G 1A7           | 0.99  |
| 34        | 12         | 2009-05-23 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 0.99  |
| 155       | 12         | 2010-11-14 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 1.98  |
| 166       | 12         | 2010-12-25 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 13.86 |
| 221       | 12         | 2011-08-25 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 8.91  |
| 350       | 12         | 2013-03-31 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 1.98  |
| 373       | 12         | 2013-07-03 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 3.96  |
| 395       | 12         | 2013-10-05 00:00:00 | Praça Pio X, 119                         | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 5.94  |
| 36        | 15         | 2009-06-05 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 1.98  |
| 47        | 15         | 2009-07-16 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 13.86 |
| 102       | 15         | 2010-03-16 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 9.91  |
| 231       | 15         | 2011-10-21 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 1.98  |
| 254       | 15         | 2012-01-23 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 3.96  |
| 276       | 15         | 2012-04-26 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 5.94  |
| 328       | 15         | 2012-12-15 00:00:00 | 700 W Pender Street                      | Vancouver           | BC           | Canada         | V6C 1G8           | 0.99  |
| 112       | 18         | 2010-05-12 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 1.98  |
| 135       | 18         | 2010-08-14 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 3.96  |
| 157       | 18         | 2010-11-16 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 5.94  |
| 209       | 18         | 2011-07-07 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 0.99  |
| 330       | 18         | 2012-12-28 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 1.98  |
| 341       | 18         | 2013-02-07 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 13.86 |
| 396       | 18         | 2013-10-08 00:00:00 | 627 Broadway                             | New York            | NY           | USA            | 10012-2612        | 8.91  |
| 15        | 19         | 2009-03-04 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 1.98  |
| 26        | 19         | 2009-04-14 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 13.86 |
| 81        | 19         | 2009-12-13 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 8.91  |
| 210       | 19         | 2011-07-20 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 1.98  |
| 233       | 19         | 2011-10-22 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 3.96  |
| 255       | 19         | 2012-01-24 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 5.94  |
| 307       | 19         | 2012-09-13 00:00:00 | 1 Infinite Loop                          | Cupertino           | CA           | USA            | 95014             | 1.99  |
| 92        | 24         | 2010-02-08 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 1.98  |
| 103       | 24         | 2010-03-21 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 15.86 |
| 158       | 24         | 2010-11-19 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 8.91  |
| 287       | 24         | 2012-06-25 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 1.98  |
| 310       | 24         | 2012-09-27 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 7.96  |
| 332       | 24         | 2012-12-30 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 5.94  |
| 384       | 24         | 2013-08-20 00:00:00 | 162 E Superior Street                    | Chicago             | IL           | USA            | 60611             | 0.99  |
| 48        | 29         | 2009-07-24 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 0.99  |
| 169       | 29         | 2011-01-15 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 1.98  |
| 180       | 29         | 2011-02-25 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 13.86 |
| 235       | 29         | 2011-10-26 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 8.91  |
| 364       | 29         | 2013-06-01 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 1.98  |
| 387       | 29         | 2013-09-03 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 3.96  |
| 409       | 29         | 2013-12-06 00:00:00 | 796 Dundas Street West                   | Toronto             | ON           | Canada         | M6J 1V1           | 5.94  |
| 49        | 30         | 2009-08-06 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 1.98  |
| 72        | 30         | 2009-11-08 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 3.96  |
| 94        | 30         | 2010-02-10 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 5.94  |
| 146       | 30         | 2010-10-01 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 0.99  |
| 267       | 30         | 2012-03-24 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 1.98  |
| 278       | 30         | 2012-05-04 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 13.86 |
| 333       | 30         | 2013-01-02 00:00:00 | 230 Elgin Street                         | Ottawa              | ON           | Canada         | K2P 1L7           | 8.91  |
| 27        | 33         | 2009-04-22 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 0.99  |
| 148       | 33         | 2010-10-14 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 1.98  |
| 159       | 33         | 2010-11-24 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 13.86 |
| 214       | 33         | 2011-07-25 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 8.91  |
| 343       | 33         | 2013-02-28 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 1.98  |
| 366       | 33         | 2013-06-02 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 3.96  |
| 388       | 33         | 2013-09-04 00:00:00 | 5112 48 Street                           | Yellowknife         | NT           | Canada         | X1A 1N6           | 5.94  |
| 6         | 37         | 2009-01-19 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 0.99  |
| 127       | 37         | 2010-07-13 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 1.98  |
| 138       | 37         | 2010-08-23 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 13.86 |
| 193       | 37         | 2011-04-23 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 14.91 |
| 322       | 37         | 2012-11-27 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 1.98  |
| 345       | 37         | 2013-03-01 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 3.96  |
| 367       | 37         | 2013-06-03 00:00:00 | Berger Straße 10                         | Frankfurt           |              | Germany        | 60316             | 5.94  |
| 7         | 38         | 2009-02-01 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 1.98  |
| 30        | 38         | 2009-05-06 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 3.96  |
| 52        | 38         | 2009-08-08 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 5.94  |
| 104       | 38         | 2010-03-29 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 0.99  |
| 225       | 38         | 2011-09-20 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 1.98  |
| 236       | 38         | 2011-10-31 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 13.86 |
| 291       | 38         | 2012-06-30 00:00:00 | Barbarossastraße 19                      | Berlin              |              | Germany        | 10779             | 8.91  |
| 9         | 42         | 2009-02-02 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 3.96  |
| 31        | 42         | 2009-05-07 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 5.94  |
| 83        | 42         | 2009-12-26 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 0.99  |
| 204       | 42         | 2011-06-19 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 3.98  |
| 215       | 42         | 2011-07-30 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 13.86 |
| 270       | 42         | 2012-03-29 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 8.91  |
| 399       | 42         | 2013-11-03 00:00:00 | 9, Place Louis Barthou                   | Bordeaux            |              | France         | 33000             | 1.98  |
| 84        | 43         | 2010-01-08 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 1.98  |
| 107       | 43         | 2010-04-12 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 3.96  |
| 129       | 43         | 2010-07-15 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 5.94  |
| 181       | 43         | 2011-03-05 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 0.99  |
| 302       | 43         | 2012-08-26 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 1.98  |
| 313       | 43         | 2012-10-06 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 16.86 |
| 368       | 43         | 2013-06-06 00:00:00 | 68, Rue Jouvence                         | Dijon               |              | France         | 21000             | 8.91  |
| 53        | 44         | 2009-08-11 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 8.91  |
| 182       | 44         | 2011-03-18 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 1.98  |
| 205       | 44         | 2011-06-20 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 7.96  |
| 227       | 44         | 2011-09-22 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 5.94  |
| 279       | 44         | 2012-05-12 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 0.99  |
| 400       | 44         | 2013-11-03 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 1.98  |
| 411       | 44         | 2013-12-14 00:00:00 | Porthaninkatu 9                          | Helsinki            |              | Finland        | 00530             | 13.86 |
| 85        | 45         | 2010-01-08 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 1.98  |
| 96        | 45         | 2010-02-18 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 21.86 |
| 151       | 45         | 2010-10-19 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 8.91  |
| 280       | 45         | 2012-05-25 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 1.98  |
| 303       | 45         | 2012-08-27 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 3.96  |
| 325       | 45         | 2012-11-29 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 5.94  |
| 377       | 45         | 2013-07-20 00:00:00 | Erzsébet krt. 58.                        | Budapest            |              | Hungary        | H-1073            | 0.99  |
| 10        | 46         | 2009-02-03 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 5.94  |
| 62        | 46         | 2009-09-24 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 0.99  |
| 183       | 46         | 2011-03-18 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 1.98  |
| 194       | 46         | 2011-04-28 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 21.86 |
| 249       | 46         | 2011-12-27 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 8.91  |
| 378       | 46         | 2013-08-02 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 1.98  |
| 401       | 46         | 2013-11-04 00:00:00 | 3 Chatham Street                         | Dublin              | Dublin       | Ireland        |                   | 3.96  |
| 11        | 52         | 2009-02-06 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 8.91  |
| 140       | 52         | 2010-09-13 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 1.98  |
| 163       | 52         | 2010-12-16 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 3.96  |
| 185       | 52         | 2011-03-20 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 5.94  |
| 237       | 52         | 2011-11-08 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 0.99  |
| 358       | 52         | 2013-05-01 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 1.98  |
| 369       | 52         | 2013-06-11 00:00:00 | 202 Hoxton Street                        | London              |              | United Kingdom | N1 5LH            | 13.86 |
| 43        | 53         | 2009-07-06 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 1.98  |
| 54        | 53         | 2009-08-16 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 13.86 |
| 109       | 53         | 2010-04-16 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 8.91  |
| 238       | 53         | 2011-11-21 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 1.98  |
| 261       | 53         | 2012-02-23 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 3.96  |
| 283       | 53         | 2012-05-27 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 5.94  |
| 335       | 53         | 2013-01-15 00:00:00 | 113 Lupus St                             | London              |              | United Kingdom | SW1V 3EN          | 0.99  |
| 120       | 58         | 2010-06-12 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 1.98  |
| 131       | 58         | 2010-07-23 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 13.86 |
| 186       | 58         | 2011-03-23 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 8.91  |
| 315       | 58         | 2012-10-27 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 1.98  |
| 338       | 58         | 2013-01-29 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 3.96  |
| 360       | 58         | 2013-05-03 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 5.94  |
| 412       | 58         | 2013-12-22 00:00:00 | 12,Community Centre                      | Delhi               |              | India          | 110017            | 1.99  |
| 23        | 59         | 2009-04-05 00:00:00 | 3,Raj Bhavan Road                        | Bangalore           |              | India          | 560001            | 3.96  |
| 45        | 59         | 2009-07-08 00:00:00 | 3,Raj Bhavan Road                        | Bangalore           |              | India          | 560001            | 5.94  |
| 97        | 59         | 2010-02-26 00:00:00 | 3,Raj Bhavan Road                        | Bangalore           |              | India          | 560001            | 1.99  |
| 218       | 59         | 2011-08-20 00:00:00 | 3,Raj Bhavan Road                        | Bangalore           |              | India          | 560001            | 1.98  |
| 229       | 59         | 2011-09-30 00:00:00 | 3,Raj Bhavan Road                        | Bangalore           |              | India          | 560001            | 13.86 |
| 284       | 59         | 2012-05-30 00:00:00 | 3,Raj Bhavan Road                        | Bangalore           |              | India          | 560001            | 8.91  |
| 2         | 4          | 2009-01-02 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 3.96  |
| 24        | 4          | 2009-04-06 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 5.94  |
| 76        | 4          | 2009-11-25 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 0.99  |
| 197       | 4          | 2011-05-19 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 1.98  |
| 208       | 4          | 2011-06-29 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 15.86 |
| 263       | 4          | 2012-02-27 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 8.91  |
| 392       | 4          | 2013-10-03 00:00:00 | Ullevålsveien 14                         | Oslo                |              | Norway         | 0171              | 1.98  |
| 77        | 5          | 2009-12-08 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 1.98  |
| 100       | 5          | 2010-03-12 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 3.96  |
| 122       | 5          | 2010-06-14 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 5.94  |
| 174       | 5          | 2011-02-02 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 0.99  |
| 295       | 5          | 2012-07-26 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 1.98  |
| 306       | 5          | 2012-09-05 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 16.86 |
| 361       | 5          | 2013-05-06 00:00:00 | Klanova 9/506                            | Prague              |              | Czech Republic | 14700             | 8.91  |
| 3         | 8          | 2009-01-03 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 5.94  |
| 55        | 8          | 2009-08-24 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 0.99  |
| 176       | 8          | 2011-02-15 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 1.98  |
| 187       | 8          | 2011-03-28 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 13.86 |
| 242       | 8          | 2011-11-26 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 8.91  |
| 371       | 8          | 2013-07-02 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 1.98  |
| 394       | 8          | 2013-10-04 00:00:00 | Grétrystraat 63                          | Brussels            |              | Belgium        | 1000              | 3.96  |
| 56        | 9          | 2009-09-06 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 1.98  |
| 79        | 9          | 2009-12-09 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 3.96  |
| 101       | 9          | 2010-03-13 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 5.94  |
| 153       | 9          | 2010-11-01 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 0.99  |
| 274       | 9          | 2012-04-24 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 1.98  |
| 285       | 9          | 2012-06-04 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 13.86 |
| 340       | 9          | 2013-02-02 00:00:00 | Sønder Boulevard 51                      | Copenhagen          |              | Denmark        | 1720              | 8.91  |
| 25        | 10         | 2009-04-09 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 8.91  |
| 154       | 10         | 2010-11-14 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 1.98  |
| 177       | 10         | 2011-02-16 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 3.96  |
| 199       | 10         | 2011-05-21 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 5.94  |
| 251       | 10         | 2012-01-09 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 0.99  |
| 372       | 10         | 2013-07-02 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 1.98  |
| 383       | 10         | 2013-08-12 00:00:00 | Rua Dr. Falcão Filho, 155                | São Paulo           | SP           | Brazil         | 01007-010         | 13.86 |
| 35        | 13         | 2009-06-05 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 1.98  |
| 58        | 13         | 2009-09-07 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 3.96  |
| 80        | 13         | 2009-12-10 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 5.94  |
| 132       | 13         | 2010-07-31 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 0.99  |
| 253       | 13         | 2012-01-22 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 1.98  |
| 264       | 13         | 2012-03-03 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 13.86 |
| 319       | 13         | 2012-11-01 00:00:00 | Qe 7 Bloco G                             | Brasília            | DF           | Brazil         | 71020-677         | 8.91  |
| 13        | 16         | 2009-02-19 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 0.99  |
| 134       | 16         | 2010-08-13 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 1.98  |
| 145       | 16         | 2010-09-23 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 13.86 |
| 200       | 16         | 2011-05-24 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 8.91  |
| 329       | 16         | 2012-12-28 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 1.98  |
| 352       | 16         | 2013-04-01 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 3.96  |
| 374       | 16         | 2013-07-04 00:00:00 | 1600 Amphitheatre Parkway                | Mountain View       | CA           | USA            | 94043-1351        | 5.94  |
| 113       | 20         | 2010-05-12 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 1.98  |
| 124       | 20         | 2010-06-22 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 13.86 |
| 179       | 20         | 2011-02-20 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 8.91  |
| 308       | 20         | 2012-09-26 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 3.98  |
| 331       | 20         | 2012-12-29 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 3.96  |
| 353       | 20         | 2013-04-02 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 5.94  |
| 405       | 20         | 2013-11-21 00:00:00 | 541 Del Medio Avenue                     | Mountain View       | CA           | USA            | 94040-111         | 0.99  |
| 91        | 22         | 2010-02-08 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 1.98  |
| 114       | 22         | 2010-05-13 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 3.96  |
| 136       | 22         | 2010-08-15 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 5.94  |
| 188       | 22         | 2011-04-05 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 0.99  |
| 309       | 22         | 2012-09-26 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 3.98  |
| 320       | 22         | 2012-11-06 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 13.86 |
| 375       | 22         | 2013-07-07 00:00:00 | 120 S Orange Ave                         | Orlando             | FL           | USA            | 32801             | 8.91  |
| 5         | 23         | 2009-01-11 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 13.86 |
| 60        | 23         | 2009-09-11 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 8.91  |
| 189       | 23         | 2011-04-18 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 1.98  |
| 212       | 23         | 2011-07-21 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 3.96  |
| 234       | 23         | 2011-10-23 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 5.94  |
| 286       | 23         | 2012-06-12 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 0.99  |
| 407       | 23         | 2013-12-04 00:00:00 | 69 Salem Street                          | Boston              | MA           | USA            | 2113              | 1.98  |
| 70        | 26         | 2009-11-07 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 1.98  |
| 93        | 26         | 2010-02-09 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 3.96  |
| 115       | 26         | 2010-05-14 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 5.94  |
| 167       | 26         | 2011-01-02 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 0.99  |
| 288       | 26         | 2012-06-25 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 1.98  |
| 299       | 26         | 2012-08-05 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 23.86 |
| 354       | 26         | 2013-04-05 00:00:00 | 2211 W Berry Street                      | Fort Worth          | TX           | USA            | 76110             | 8.91  |
| 39        | 27         | 2009-06-10 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 8.91  |
| 168       | 27         | 2011-01-15 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 1.98  |
| 191       | 27         | 2011-04-19 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 3.96  |
| 213       | 27         | 2011-07-22 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 5.94  |
| 265       | 27         | 2012-03-11 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 0.99  |
| 386       | 27         | 2013-09-02 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 1.98  |
| 397       | 27         | 2013-10-13 00:00:00 | 1033 N Park Ave                          | Tucson              | AZ           | USA            | 85719             | 13.86 |
| 50        | 32         | 2009-08-06 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 1.98  |
| 61        | 32         | 2009-09-16 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 13.86 |
| 116       | 32         | 2010-05-17 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 8.91  |
| 245       | 32         | 2011-12-22 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 1.98  |
| 268       | 32         | 2012-03-25 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 3.96  |
| 290       | 32         | 2012-06-27 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 5.94  |
| 342       | 32         | 2013-02-15 00:00:00 | 696 Osborne Street                       | Winnipeg            | MB           | Canada         | R3L 2B9           | 0.99  |
| 28        | 34         | 2009-05-05 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 1.98  |
| 51        | 34         | 2009-08-07 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 3.96  |
| 73        | 34         | 2009-11-09 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 5.94  |
| 125       | 34         | 2010-06-30 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 0.99  |
| 246       | 34         | 2011-12-22 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 1.98  |
| 257       | 34         | 2012-02-01 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 13.86 |
| 312       | 34         | 2012-10-01 00:00:00 | Rua da Assunção 53                       | Lisbon              |              | Portugal       |                   | 10.91 |
| 126       | 35         | 2010-07-13 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 1.98  |
| 149       | 35         | 2010-10-15 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 3.96  |
| 171       | 35         | 2011-01-17 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 5.94  |
| 223       | 35         | 2011-09-07 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 0.99  |
| 344       | 35         | 2013-02-28 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 1.98  |
| 355       | 35         | 2013-04-10 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 13.86 |
| 410       | 35         | 2013-12-09 00:00:00 | Rua dos Campeões Europeus de Viena, 4350 | Porto               |              | Portugal       |                   | 8.91  |
| 105       | 39         | 2010-04-11 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 1.98  |
| 128       | 39         | 2010-07-14 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 3.96  |
| 150       | 39         | 2010-10-16 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 5.94  |
| 202       | 39         | 2011-06-06 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 1.99  |
| 323       | 39         | 2012-11-27 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 1.98  |
| 334       | 39         | 2013-01-07 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 13.86 |
| 389       | 39         | 2013-09-07 00:00:00 | 4, Rue Milton                            | Paris               |              | France         | 75009             | 8.91  |
| 8         | 40         | 2009-02-01 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 1.98  |
| 19        | 40         | 2009-03-14 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 13.86 |
| 74        | 40         | 2009-11-12 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 8.91  |
| 203       | 40         | 2011-06-19 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 2.98  |
| 226       | 40         | 2011-09-21 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 3.96  |
| 248       | 40         | 2011-12-24 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 5.94  |
| 300       | 40         | 2012-08-13 00:00:00 | 8, Rue Hanovre                           | Paris               |              | France         | 75002             | 0.99  |
| 64        | 49         | 2009-10-07 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 1.98  |
| 75        | 49         | 2009-11-17 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 13.86 |
| 130       | 49         | 2010-07-18 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 8.91  |
| 259       | 49         | 2012-02-22 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 1.98  |
| 282       | 49         | 2012-05-26 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 3.96  |
| 304       | 49         | 2012-08-28 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 5.94  |
| 356       | 49         | 2013-04-18 00:00:00 | Ordynacka 10                             | Warsaw              |              | Poland         | 00-358            | 0.99  |
| 21        | 55         | 2009-04-04 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 1.98  |
| 44        | 55         | 2009-07-07 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 3.96  |
| 66        | 55         | 2009-10-09 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 5.94  |
| 118       | 55         | 2010-05-30 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 0.99  |
| 239       | 55         | 2011-11-21 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 1.98  |
| 250       | 55         | 2012-01-01 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 13.86 |
| 305       | 55         | 2012-08-31 00:00:00 | 421 Bourke Street                        | Sidney              | NSW          | Australia      | 2010              | 8.91  |
| 119       | 56         | 2010-06-12 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 1.98  |
| 142       | 56         | 2010-09-14 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 3.96  |
| 164       | 56         | 2010-12-17 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 5.94  |
| 216       | 56         | 2011-08-07 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 0.99  |
| 337       | 56         | 2013-01-28 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 1.98  |
| 348       | 56         | 2013-03-10 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 13.86 |
| 403       | 56         | 2013-11-08 00:00:00 | 307 Macacha Güemes                       | Buenos Aires        |              | Argentina      | 1106              | 8.91  |
| 1         | 2          | 2009-01-01 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 1.98  |
| 12        | 2          | 2009-02-11 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 13.86 |
| 67        | 2          | 2009-10-12 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 8.91  |
| 196       | 2          | 2011-05-19 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 1.98  |
| 219       | 2          | 2011-08-21 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 3.96  |
| 241       | 2          | 2011-11-23 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 5.94  |
| 293       | 2          | 2012-07-13 00:00:00 | Theodor-Heuss-Straße 34                  | Stuttgart           |              | Germany        | 70174             | 0.99  |
| 46        | 6          | 2009-07-11 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 8.91  |
| 175       | 6          | 2011-02-15 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 1.98  |
| 198       | 6          | 2011-05-20 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 3.96  |
| 220       | 6          | 2011-08-22 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 5.94  |
| 272       | 6          | 2012-04-11 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 0.99  |
| 393       | 6          | 2013-10-03 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 1.98  |
| 404       | 6          | 2013-11-13 00:00:00 | Rilská 3174/6                            | Prague              |              | Czech Republic | 14300             | 25.86 |
| 78        | 7          | 2009-12-08 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 1.98  |
| 89        | 7          | 2010-01-18 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 18.86 |
| 144       | 7          | 2010-09-18 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 8.91  |
| 273       | 7          | 2012-04-24 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 1.98  |
| 296       | 7          | 2012-07-27 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 3.96  |
| 318       | 7          | 2012-10-29 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 5.94  |
| 370       | 7          | 2013-06-19 00:00:00 | Rotenturmstraße 4, 1010 Innere Stadt     | Vienne              |              | Austria        | 1010              | 0.99  |
| 57        | 11         | 2009-09-06 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 1.98  |
| 68        | 11         | 2009-10-17 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 13.86 |
| 123       | 11         | 2010-06-17 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 8.91  |
| 252       | 11         | 2012-01-22 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 1.98  |
| 275       | 11         | 2012-04-25 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 3.96  |
| 297       | 11         | 2012-07-28 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 5.94  |
| 349       | 11         | 2013-03-18 00:00:00 | Av. Paulista, 2022                       | São Paulo           | SP           | Brazil         | 01310-200         | 0.99  |
| 4         | 14         | 2009-01-06 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 8.91  |
| 133       | 14         | 2010-08-13 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 1.98  |
| 156       | 14         | 2010-11-15 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 3.96  |
| 178       | 14         | 2011-02-17 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 5.94  |
| 230       | 14         | 2011-10-08 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 0.99  |
| 351       | 14         | 2013-03-31 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 1.98  |
| 362       | 14         | 2013-05-11 00:00:00 | 8210 111 ST NW                           | Edmonton            | AB           | Canada         | T6G 2C7           | 13.86 |
| 14        | 17         | 2009-03-04 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 1.98  |
| 37        | 17         | 2009-06-06 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 3.96  |
| 59        | 17         | 2009-09-08 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 5.94  |
| 111       | 17         | 2010-04-29 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 0.99  |
| 232       | 17         | 2011-10-21 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 1.98  |
| 243       | 17         | 2011-12-01 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 13.86 |
| 298       | 17         | 2012-07-31 00:00:00 | 1 Microsoft Way                          | Redmond             | WA           | USA            | 98052-8300        | 10.91 |
| 16        | 21         | 2009-03-05 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 3.96  |
| 38        | 21         | 2009-06-07 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 5.94  |
| 90        | 21         | 2010-01-26 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 0.99  |
| 211       | 21         | 2011-07-20 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 1.98  |
| 222       | 21         | 2011-08-30 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 13.86 |
| 277       | 21         | 2012-04-29 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 8.91  |
| 406       | 21         | 2013-12-04 00:00:00 | 801 W 4th Street                         | Reno                | NV           | USA            | 89503             | 1.98  |
| 17        | 25         | 2009-03-06 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 5.94  |
| 69        | 25         | 2009-10-25 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 0.99  |
| 190       | 25         | 2011-04-18 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 1.98  |
| 201       | 25         | 2011-05-29 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 18.86 |
| 256       | 25         | 2012-01-27 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 8.91  |
| 385       | 25         | 2013-09-02 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 1.98  |
| 408       | 25         | 2013-12-05 00:00:00 | 319 N. Frances Street                    | Madison             | WI           | USA            | 53703             | 3.96  |
| 71        | 28         | 2009-11-07 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 1.98  |
| 82        | 28         | 2009-12-18 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 13.86 |
| 137       | 28         | 2010-08-18 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 8.91  |
| 266       | 28         | 2012-03-24 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 1.98  |
| 289       | 28         | 2012-06-26 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 3.96  |
| 311       | 28         | 2012-09-28 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 11.94 |
| 363       | 28         | 2013-05-19 00:00:00 | 302 S 700 E                              | Salt Lake City      | UT           | USA            | 84102             | 0.99  |
| 18        | 31         | 2009-03-09 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 8.91  |
| 147       | 31         | 2010-10-14 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 1.98  |
| 170       | 31         | 2011-01-16 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 3.96  |
| 192       | 31         | 2011-04-20 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 5.94  |
| 244       | 31         | 2011-12-09 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 0.99  |
| 365       | 31         | 2013-06-01 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 1.98  |
| 376       | 31         | 2013-07-12 00:00:00 | 194A Chain Lake Drive                    | Halifax             | NS           | Canada         | B3S 1C5           | 13.86 |
| 29        | 36         | 2009-05-05 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 1.98  |
| 40        | 36         | 2009-06-15 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 13.86 |
| 95        | 36         | 2010-02-13 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 8.91  |
| 224       | 36         | 2011-09-20 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 1.98  |
| 247       | 36         | 2011-12-23 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 3.96  |
| 269       | 36         | 2012-03-26 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 5.94  |
| 321       | 36         | 2012-11-14 00:00:00 | Tauentzienstraße 8                       | Berlin              |              | Germany        | 10789             | 0.99  |
| 106       | 41         | 2010-04-11 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 1.98  |
| 117       | 41         | 2010-05-22 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 13.86 |
| 172       | 41         | 2011-01-20 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 8.91  |
| 301       | 41         | 2012-08-26 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 1.98  |
| 324       | 41         | 2012-11-28 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 3.96  |
| 346       | 41         | 2013-03-02 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 5.94  |
| 398       | 41         | 2013-10-21 00:00:00 | 11, Place Bellecour                      | Lyon                |              | France         | 69002             | 0.99  |
| 63        | 47         | 2009-10-07 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 1.98  |
| 86        | 47         | 2010-01-09 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 3.96  |
| 108       | 47         | 2010-04-13 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 5.94  |
| 160       | 47         | 2010-12-02 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 0.99  |
| 281       | 47         | 2012-05-25 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 1.98  |
| 292       | 47         | 2012-07-05 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 13.86 |
| 347       | 47         | 2013-03-05 00:00:00 | Via Degli Scipioni, 43                   | Rome                | RM           | Italy          | 00192             | 8.91  |
| 32        | 48         | 2009-05-10 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 8.91  |
| 161       | 48         | 2010-12-15 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 1.98  |
| 184       | 48         | 2011-03-19 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 3.96  |
| 206       | 48         | 2011-06-21 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 8.94  |
| 258       | 48         | 2012-02-09 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 0.99  |
| 379       | 48         | 2013-08-02 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 1.98  |
| 390       | 48         | 2013-09-12 00:00:00 | Lijnbaansgracht 120bg                    | Amsterdam           | VV           | Netherlands    | 1016              | 13.86 |
| 41        | 50         | 2009-06-23 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 0.99  |
| 162       | 50         | 2010-12-15 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 1.98  |
| 173       | 50         | 2011-01-25 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 13.86 |
| 228       | 50         | 2011-09-25 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 8.91  |
| 357       | 50         | 2013-05-01 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 1.98  |
| 380       | 50         | 2013-08-03 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 3.96  |
| 402       | 50         | 2013-11-05 00:00:00 | C/ San Bernardo 85                       | Madrid              |              | Spain          | 28015             | 5.94  |
| 42        | 51         | 2009-07-06 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 1.98  |
| 65        | 51         | 2009-10-08 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 3.96  |
| 87        | 51         | 2010-01-10 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 6.94  |
| 139       | 51         | 2010-08-31 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 0.99  |
| 260       | 51         | 2012-02-22 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 1.98  |
| 271       | 51         | 2012-04-03 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 13.86 |
| 326       | 51         | 2012-12-02 00:00:00 | Celsiusg. 9                              | Stockholm           |              | Sweden         | 11230             | 8.91  |
| 20        | 54         | 2009-03-22 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 0.99  |
| 141       | 54         | 2010-09-13 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 1.98  |
| 152       | 54         | 2010-10-24 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 13.86 |
| 207       | 54         | 2011-06-24 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 8.91  |
| 336       | 54         | 2013-01-28 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 1.98  |
| 359       | 54         | 2013-05-02 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 3.96  |
| 381       | 54         | 2013-08-04 00:00:00 | 110 Raeburn Pl                           | Edinburgh           |              | United Kingdom | EH4 1HH           | 5.94  |
| 22        | 57         | 2009-04-04 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 1.98  |
| 33        | 57         | 2009-05-15 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 13.86 |
| 88        | 57         | 2010-01-13 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 17.91 |
| 217       | 57         | 2011-08-20 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 1.98  |
| 240       | 57         | 2011-11-22 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 3.96  |
| 262       | 57         | 2012-02-24 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 5.94  |
| 314       | 57         | 2012-10-14 00:00:00 | Calle Lira, 198                          | Santiago            |              | Chile          |                   | 0.99  |


7. Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y nombre del Agente de Ventas para todas las facturas y clientes.

    ¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?

    Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para el ID de factura 37.

    Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para cada Factura. PISTA: GROUP BY

    Proporciona una consulta que incluya el nombre de la pista con cada ítem de línea de factura.

    Proporciona una consulta que incluya el nombre de la pista comprada Y el nombre del artista con cada ítem de línea de factura.

    Proporciona una consulta que muestre el número total de pistas en cada lista de reproducción. El nombre de la lista de reproducción debe estar incluido en la tabla resultante.

    Proporciona una consulta que muestre todas las pistas, pero no muestre IDs. La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.

    Proporciona una consulta que muestre todas las facturas.

    Proporciona una consulta que muestre las ventas totales realizadas por cada agente de ventas.

    ¿Qué agente de ventas realizó más ventas en 2009?

    Escribir una consulta que muestre todas las playlists de la base de datos.

    Escribe una consulta que liste todas las canciones de una playlist.

    Escribe una consulta que liste exclusivamente el nombre de las canciones de una playlist concreta, con el nombre de su género y el nombre de tipo de medio.
