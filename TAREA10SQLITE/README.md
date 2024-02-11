# TAREA 10

#### He recortado los resultados de varias consultas ya que si no, no podía visualizarse el documento debido a su gran tamaño.

1. Proporciona una consulta que muestre solo los clientes de Brasil.

```sql
select * from customers where country = Brazil;
```

| CustomerId | FirstName | LastName  | Company                                          | Address                         | City                | State | Country | PostalCode | Phone              | Fax                | Email                         | SupportRepId |
| ---------- | --------- | --------- | ------------------------------------------------ | ------------------------------- | ------------------- | ----- | ------- | ---------- | ------------------ | ------------------ | ----------------------------- | ------------ |
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

| FirstName | LastName  | Country | InvoiceId | InvoiceDate         | BillingCountry |
| --------- | --------- | ------- | --------- | ------------------- | -------------- |
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

| EmployeeId | LastName | FirstName | Title               | ReportsTo | BirthDate           | HireDate            | Address          | City    | State | Country | PostalCode | Phone             | Fax               | Email                    |
| ---------- | -------- | --------- | ------------------- | --------- | ------------------- | ------------------- | ---------------- | ------- | ----- | ------- | ---------- | ----------------- | ----------------- | ------------------------ |
| 3          | Peacock  | Jane      | Sales Support Agent | 2         | 1973-08-29 00:00:00 | 2002-04-01 00:00:00 | 1111 6 Ave SW    | Calgary | AB    | Canada  | T2P 5M5    | +1 (403) 262-3443 | +1 (403) 262-6712 | jane@chinookcorp.com     |
| 4          | Park     | Margaret  | Sales Support Agent | 2         | 1947-09-19 00:00:00 | 2003-05-03 00:00:00 | 683 10 Street SW | Calgary | AB    | Canada  | T2P 5G3    | +1 (403) 263-4423 | +1 (403) 263-4289 | margaret@chinookcorp.com |
| 5          | Johnson  | Steve     | Sales Support Agent | 2         | 1965-03-03 00:00:00 | 2003-10-17 00:00:00 | 7727B 41 Ave     | Calgary | AB    | Canada  | T3B 1Y7    | 1 (780) 836-9987  | 1 (780) 836-9543  | steve@chinookcorp.com    |

4. Proporciona una consulta que muestre una lista única de países de facturación de la tabla de Facturas.

```sql
select distinct(BillingCountry) from invoices;
```

| BillingCountry |
| -------------- |
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

| InvoiceId | CustomerId | InvoiceDate         | BillingAddress                  | BillingCity         | BillingState | BillingCountry | BillingPostalCode | Total |
| --------- | ---------- | ------------------- | ------------------------------- | ------------------- | ------------ | -------------- | ----------------- | ----- |
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

| InvoiceId | CustomerId | InvoiceDate         | BillingAddress                  | BillingCity         | BillingState | BillingCountry | BillingPostalCode | Total |
| --------- | ---------- | ------------------- | ------------------------------- | ------------------- | ------------ | -------------- | ----------------- | ----- |
| 98        | 1          | 2010-03-11 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 3.98  |
| 121       | 1          | 2010-06-13 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 3.96  |
| 143       | 1          | 2010-09-15 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 5.94  |
| 195       | 1          | 2011-05-06 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 0.99  |
| 316       | 1          | 2012-10-27 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 1.98  |
| 327       | 1          | 2012-12-07 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 13.86 |
| 382       | 1          | 2013-08-07 00:00:00 | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP           | Brazil         | 12227-000         | 8.91  |
| 99        | 3          | 2010-03-11 00:00:00 | 1498 rue Bélanger               | Montréal            | QC           | Canada         | H2G 1A7           | 3.98  |
| 110       | 3          | 2010-04-21 00:00:00 | 1498 rue Bélanger               | Montréal            | QC           | Canada         | H2G 1A7           | 13.86 |
| 165       | 3          | 2010-12-20 00:00:00 | 1498 rue Bélanger               | Montréal            | QC           | Canada         | H2G 1A7           | 8.91  |
| 294       | 3          | 2012-07-26 00:00:00 | 1498 rue Bélanger               | Montréal            | QC           | Canada         | H2G 1A7           | 1.98  |
| 317       | 3          | 2012-10-28 00:00:00 | 1498 rue Bélanger               | Montréal            | QC           | Canada         | H2G 1A7           | 3.96  |
| 339       | 3          | 2013-01-30 00:00:00 | 1498 rue Bélanger               | Montréal            | QC           | Canada         | H2G 1A7           | 5.94  |
| 391       | 3          | 2013-09-20 00:00:00 | 1498 rue Bélanger               | Montréal            | QC           | Canada         | H2G 1A7           | 0.99  |
| 34        | 12         | 2009-05-23 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 0.99  |
| 155       | 12         | 2010-11-14 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 1.98  |
| 166       | 12         | 2010-12-25 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 13.86 |
| 221       | 12         | 2011-08-25 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 8.91  |
| 350       | 12         | 2013-03-31 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 1.98  |
| 373       | 12         | 2013-07-03 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 3.96  |
| 395       | 12         | 2013-10-05 00:00:00 | Praça Pio X, 119                | Rio de Janeiro      | RJ           | Brazil         | 20040-020         | 5.94  |
| 36        | 15         | 2009-06-05 00:00:00 | 700 W Pender Street             | Vancouver           | BC           | Canada         | V6C 1G8           | 1.98  |
| 47        | 15         | 2009-07-16 00:00:00 | 700 W Pender Street             | Vancouver           | BC           | Canada         | V6C 1G8           | 13.86 |
| 102       | 15         | 2010-03-16 00:00:00 | 700 W Pender Street             | Vancouver           | BC           | Canada         | V6C 1G8           | 9.91  |
| 231       | 15         | 2011-10-21 00:00:00 | 700 W Pender Street             | Vancouver           | BC           | Canada         | V6C 1G8           | 1.98  |
| 254       | 15         | 2012-01-23 00:00:00 | 700 W Pender Street             | Vancouver           | BC           | Canada         | V6C 1G8           | 3.96  |
| 276       | 15         | 2012-04-26 00:00:00 | 700 W Pender Street             | Vancouver           | BC           | Canada         | V6C 1G8           | 5.94  |

7. Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y
   nombre del Agente de Ventas para todas las facturas y clientes.

```sql
select i.total as InvoiceTotal, c.CustomerId, c.FirstName || ' ' || c.LastName as CustomerName, e.Country as EmployeeCountry, e.FirstName || ' ' || e.LastName as EmployeeName from Customers as c, Employees as e, Invoices as i where c.CustomerId = i.CustomerId and e.EmployeeId = c.SupportRepId and e.Title = 'Sales Support Agent'; -- Versión WHERE

select i.total as InvoiceTotal, c.CustomerId, c.FirstName || ' ' || c.LastName as CustomerName, e.Country as EmployeeCountry, e.FirstName || ' ' || e.LastName as EmployeeName from Customers as c join Invoices as i on i.CustomerId = c.CustomerId join Employees as e on c.SupportRepId = e.EmployeeID where e.Title = 'Sales Support Agent'; -- Versión JOIN

```

| InvoiceTotal | CustomerId | CustomerName      | EmployeeCountry | EmployeeName |
| ------------ | ---------- | ----------------- | --------------- | ------------ |
| 3.98         | 1          | Luís Gonçalves    | Canada          | Jane Peacock |
| 3.96         | 1          | Luís Gonçalves    | Canada          | Jane Peacock |
| 5.94         | 1          | Luís Gonçalves    | Canada          | Jane Peacock |
| 0.99         | 1          | Luís Gonçalves    | Canada          | Jane Peacock |
| 1.98         | 1          | Luís Gonçalves    | Canada          | Jane Peacock |
| 13.86        | 1          | Luís Gonçalves    | Canada          | Jane Peacock |
| 8.91         | 1          | Luís Gonçalves    | Canada          | Jane Peacock |
| 3.98         | 3          | François Tremblay | Canada          | Jane Peacock |
| 13.86        | 3          | François Tremblay | Canada          | Jane Peacock |
| 8.91         | 3          | François Tremblay | Canada          | Jane Peacock |
| 1.98         | 3          | François Tremblay | Canada          | Jane Peacock |
| 3.96         | 3          | François Tremblay | Canada          | Jane Peacock |
| 5.94         | 3          | François Tremblay | Canada          | Jane Peacock |
| 0.99         | 3          | François Tremblay | Canada          | Jane Peacock |
| 0.99         | 12         | Roberto Almeida   | Canada          | Jane Peacock |
| 1.98         | 12         | Roberto Almeida   | Canada          | Jane Peacock |
| 13.86        | 12         | Roberto Almeida   | Canada          | Jane Peacock |
| 8.91         | 12         | Roberto Almeida   | Canada          | Jane Peacock |
| 1.98         | 12         | Roberto Almeida   | Canada          | Jane Peacock |
| 3.96         | 12         | Roberto Almeida   | Canada          | Jane Peacock |
| 5.94         | 12         | Roberto Almeida   | Canada          | Jane Peacock |
| 1.98         | 15         | Jennifer Peterson | Canada          | Jane Peacock |
| 13.86        | 15         | Jennifer Peterson | Canada          | Jane Peacock |
| 9.91         | 15         | Jennifer Peterson | Canada          | Jane Peacock |
| 1.98         | 15         | Jennifer Peterson | Canada          | Jane Peacock |
| 3.96         | 15         | Jennifer Peterson | Canada          | Jane Peacock |
| 5.94         | 15         | Jennifer Peterson | Canada          | Jane Peacock |
| 0.99         | 15         | Jennifer Peterson | Canada          | Jane Peacock |
| 1.98         | 18         | Michelle Brooks   | Canada          | Jane Peacock |
| 3.96         | 18         | Michelle Brooks   | Canada          | Jane Peacock |
| 5.94         | 18         | Michelle Brooks   | Canada          | Jane Peacock |
| 0.99         | 18         | Michelle Brooks   | Canada          | Jane Peacock |
| 1.98         | 18         | Michelle Brooks   | Canada          | Jane Peacock |
| 13.86        | 18         | Michelle Brooks   | Canada          | Jane Peacock |
| 8.91         | 18         | Michelle Brooks   | Canada          | Jane Peacock |
| 1.98         | 19         | Tim Goyer         | Canada          | Jane Peacock |
| 13.86        | 19         | Tim Goyer         | Canada          | Jane Peacock |
| 8.91         | 19         | Tim Goyer         | Canada          | Jane Peacock |
| 1.98         | 19         | Tim Goyer         | Canada          | Jane Peacock |
| 3.96         | 19         | Tim Goyer         | Canada          | Jane Peacock |
| 5.94         | 19         | Tim Goyer         | Canada          | Jane Peacock |
| 1.99         | 19         | Tim Goyer         | Canada          | Jane Peacock |
| 1.98         | 24         | Frank Ralston     | Canada          | Jane Peacock |
| 15.86        | 24         | Frank Ralston     | Canada          | Jane Peacock |
| 8.91         | 24         | Frank Ralston     | Canada          | Jane Peacock |
| 1.98         | 24         | Frank Ralston     | Canada          | Jane Peacock |
| 7.96         | 24         | Frank Ralston     | Canada          | Jane Peacock |
| 5.94         | 24         | Frank Ralston     | Canada          | Jane Peacock |
| 0.99         | 24         | Frank Ralston     | Canada          | Jane Peacock |
| 0.99         | 29         | Robert Brown      | Canada          | Jane Peacock |
| 1.98         | 29         | Robert Brown      | Canada          | Jane Peacock |
| 13.86        | 29         | Robert Brown      | Canada          | Jane Peacock |

8.  ¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?

select count(InvoiceId) as TotalInvoices, substr(InvoiceDate, 1, 4) as Year,
sum(total) as TotalSales from Invoices group by Year;

| TotalInvoices | Year | TotalSales |
| ------------- | ---- | ---------- |
| 83            | 2009 | 449.46     |
| 83            | 2010 | 481.45     |
| 83            | 2011 | 469.58     |
| 83            | 2012 | 477.53     |
| 80            | 2013 | 450.58     |

9- Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea
para el ID de factura 37.

select InvoiceId, count(InvoiceLineId) as Items from Invoice_items where InvoiceId = 37;
| InvoiceId | Items |
|-----------|-------|
| 37 | 4 |

10.Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el
número de ítems de línea para cada Factura. PISTA: GROUP BY

select InvoiceId, count(InvoiceLineId) as Items from Invoice_items group by InvoiceId;
| InvoiceId | Items |
|-----------|-------|
| 1 | 2 |
| 2 | 4 |
| 3 | 6 |
| 4 | 9 |
| 5 | 14 |
| 6 | 1 |
| 7 | 2 |
| 8 | 2 |
| 9 | 4 |
| 10 | 6 |
| 11 | 9 |
| 12 | 14 |
| 13 | 1 |
| 14 | 2 |
| 15 | 2 |
| 16 | 4 |
| 17 | 6 |
| 18 | 9 |
| 19 | 14 |
| 20 | 1 |
| 21 | 2 |
| 22 | 2 |
| 23 | 4 |
| 24 | 6 |
| 25 | 9 |
| 26 | 14 |
| 27 | 1 |
| 28 | 2 |
| 29 | 2 |
| 30 | 4 |
| 31 | 6 |
| 32 | 9 |
| 33 | 14 |
| 34 | 1 |
| 35 | 2 |
| 36 | 2 |
| 37 | 4 |
| 38 | 6 |
| 39 | 9 |
| 40 | 14 |
| 41 | 1 |
| 42 | 2 |
| 43 | 2 |
| 44 | 4 |
| 45 | 6 |
| 46 | 9 |
| 47 | 14 |
| 48 | 1 |
| 49 | 2 |
| 50 | 2 |
| 51 | 4 |
| 52 | 6 |
| 53 | 9 |
| 54 | 14 |
| 55 | 1 |
| 56 | 2 |
| 57 | 2 |
| 58 | 4 |
| 59 | 6 |
| 60 | 9 |

11. Proporciona una consulta que incluya el nombre de la pista con cada ítem de línea de factura.

```sql

select t.Name, ii.InvoiceLineId from tracks as t, invoice_items as ii where ii.trackid=t.trackid;

select t.Name, ii.InvoiceLineId from Tracks as t join Invoice_items as ii on ii.TrackId = t.TrackId;
```

| Name                                         | InvoiceLineId |
| -------------------------------------------- | ------------- |
| For Those About To Rock (We Salute You)      | 579           |
| Balls to the Wall                            | 1             |
| Balls to the Wall                            | 1154          |
| Fast As a Shark                              | 1728          |
| Restless and Wild                            | 2             |
| Princess of the Dawn                         | 580           |
| Put The Finger On You                        | 3             |
| Inject The Venom                             | 4             |
| Inject The Venom                             | 1155          |
| Snowballed                                   | 581           |
| Snowballed                                   | 1729          |
| Evil Walks                                   | 5             |
| Breaking The Rules                           | 6             |
| Night Of The Long Knives                     | 582           |
| Spellbound                                   | 1156          |
| Go Down                                      | 1730          |
| Dog Eat Dog                                  | 7             |
| Problem Child                                | 583           |
| Overdose                                     | 8             |
| Overdose                                     | 1157          |
| Hell Ain't A Bad Place To Be                 | 1731          |
| Love In An Elevator                          | 9             |
| Rag Doll                                     | 584           |
| What It Takes                                | 1158          |
| Janie's Got A Gun                            | 10            |
| Amazing                                      | 1732          |
| Blind Man                                    | 585           |
| Deuces Are Wild                              | 11            |
| Deuces Are Wild                              | 1159          |
| Angel                                        | 12            |
| Livin' On The Edge                           | 586           |
| All I Really Want                            | 1160          |
| You Oughta Know                              | 1733          |
| Right Through You                            | 13            |
| Forgiven                                     | 587           |
| You Learn                                    | 1161          |
| Not The Doctor                               | 14            |
| Not The Doctor                               | 1734          |
| Wake Up                                      | 588           |
| Sea Of Sorrow                                | 1162          |
| Bleed The Freak                              | 15            |
| I Can't Remember                             | 589           |
| It Ain't Like That                           | 1735          |
| Confusion                                    | 16            |
| I Know Somethin (Bout You)                   | 590           |
| Real Thing                                   | 1163          |
| Por Causa De Você                            | 17            |
| Por Causa De Você                            | 1736          |
| Ligia                                        | 591           |
| Falando De Amor                              | 1164          |
| Angela                                       | 18            |
| O Boto (Bôto)                                | 1737          |
| Canta, Canta Mais                            | 592           |
| Master Of Puppets                            | 19            |
| The Unforgiven                               | 1165          |
| Welcome Home (Sanitarium)                    | 20            |
| Welcome Home (Sanitarium)                    | 1738          |
| Cochise                                      | 593           |
| Like a Stone                                 | 1166          |
| Set It Off                                   | 21            |
| Exploder                                     | 1739          |
| Hypnotize                                    | 594           |
| The Last Remaining Light                     | 1167          |
| Your Time Has Come                           | 22            |
| Doesn't Remind Me                            | 1740          |
| Drown Me Slowly                              | 595           |
| Yesterday To Tomorrow                        | 1168          |
| Dandelion                                    | 23            |
| Money                                        | 1741          |
| Long Tall Sally                              | 596           |
| C'Mon Everybody                              | 1169          |
| Rock 'N' Roll Music                          | 24            |
| Carol                                        | 1742          |
| Good Golly Miss Molly                        | 597           |
| Spanish moss-"A sound portrait"-Spanish moss | 1170          |
| Moon germs                                   | 25            |
| Solo-Panhandler                              | 1743          |
| Do what cha wanna                            | 598           |
| All For You                                  | 1171          |
| Super Terrorizer                             | 26            |
| Bored To Tears                               | 1744          |
| A.N.D.R.O.T.A.Z.                             | 599           |
| The Begining... At Last                      | 1172          |
| Heart Of Gold                                | 27            |
| Blood In The Wall                            | 1745          |

12. Proporciona una consulta que incluya el nombre de la pista comprada Y el nombre del artista
    con cada ítem de línea de factura.

```sql
select t.Name as TrackName, t.Composer, i.InvoiceLineId from Tracks as t, Invoice_items as i where t.TrackId = i.TrackId;

select t.Name as TrackName, t.Composer, i.InvoiceLineId from Tracks as t join Invoice_items as i on t.TrackId = i.TrackId;
```

qlite> select t.Name as TrackName, t.Composer, i.InvoiceLineId from Tracks as t, Invoice_items as i where t.TrackId = i.TrackId;
| TrackName | Composer | InvoiceLineId |
|-----------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------|
| For Those About To Rock (We Salute You) | Angus Young, Malcolm Young, Brian Johnson | 579 |
| Balls to the Wall | | 1 |
| Balls to the Wall | | 1154 |
| Fast As a Shark | F. Baltes, S. Kaufman, U. Dirkscneider & W. Hoffman | 1728 |
| Restless and Wild | F. Baltes, R.A. Smith-Diesel, S. Kaufman, U. Dirkscneider & W. Hoffman | 2 |
| Princess of the Dawn | Deaffy & R.A. Smith-Diesel | 580 |
| Put The Finger On You | Angus Young, Malcolm Young, Brian Johnson | 3 |
| Inject The Venom | Angus Young, Malcolm Young, Brian Johnson | 4 |
| Inject The Venom | Angus Young, Malcolm Young, Brian Johnson | 1155 |
| Snowballed | Angus Young, Malcolm Young, Brian Johnson | 581 |
| Snowballed | Angus Young, Malcolm Young, Brian Johnson | 1729 |
| Evil Walks | Angus Young, Malcolm Young, Brian Johnson | 5 |
| Breaking The Rules | Angus Young, Malcolm Young, Brian Johnson | 6 |
| Night Of The Long Knives | Angus Young, Malcolm Young, Brian Johnson | 582 |
| Spellbound | Angus Young, Malcolm Young, Brian Johnson | 1156 |
| Go Down | AC/DC | 1730 |
| Dog Eat Dog | AC/DC | 7 |
| Problem Child | AC/DC | 583 |
| Overdose | AC/DC | 8 |
| Overdose | AC/DC | 1157 |
| Hell Ain't A Bad Place To Be | AC/DC | 1731 |
| Love In An Elevator | Steven Tyler, Joe Perry | 9 |
| Rag Doll | Steven Tyler, Joe Perry, Jim Vallance, Holly Knight | 584 |
| What It Takes | Steven Tyler, Joe Perry, Desmond Child | 1158 |
| Janie's Got A Gun | Steven Tyler, Tom Hamilton | 10 |
| Amazing | Steven Tyler, Richie Supa | 1732 |
| Blind Man | Steven Tyler, Joe Perry, Taylor Rhodes | 585 |
| Deuces Are Wild | Steven Tyler, Jim Vallance | 11 |
| Deuces Are Wild | Steven Tyler, Jim Vallance | 1159 |
| Angel | Steven Tyler, Desmond Child | 12 |
| Livin' On The Edge | Steven Tyler, Joe Perry, Mark Hudson | 586 |
| All I Really Want | Alanis Morissette & Glenn Ballard | 1160 |
| You Oughta Know | Alanis Morissette & Glenn Ballard | 1733 |
| Right Through You | Alanis Morissette & Glenn Ballard | 13 |
| Forgiven | Alanis Morissette & Glenn Ballard | 587 |
| You Learn | Alanis Morissette & Glenn Ballard | 1161 |
| Not The Doctor | Alanis Morissette & Glenn Ballard | 14 |
| Not The Doctor | Alanis Morissette & Glenn Ballard | 1734 |
| Wake Up | Alanis Morissette & Glenn Ballard | 588 |
| Sea Of Sorrow | Jerry Cantrell | 1162 |
| Bleed The Freak | Jerry Cantrell | 15 |
| I Can't Remember | Jerry Cantrell, Layne Staley | 589 |
| It Ain't Like That | Jerry Cantrell, Michael Starr, Sean Kinney | 1735 |
| Confusion | Jerry Cantrell, Michael Starr, Layne Staley | 16 |
| I Know Somethin (Bout You) | Jerry Cantrell | 590 |
| Real Thing | Jerry Cantrell, Layne Staley | 1163 |
| Por Causa De Você | | 17 |
| Por Causa De Você | | 1736 |
| Ligia | | 591 |
| Falando De Amor | | 1164 |

13. Proporciona una consulta que muestre el número total de pistas en cada lista de reproducción.
    El nombre de la lista de reproducción debe estar incluido en la tabla resultante.
```sql
select p.Name as PlaylistName, count(pt.TrackId) as TotalTracks from playlists as p, playlist_track as pt where p.Playlistid=pt.Playlistid group by p.playlistid, p.Name;

SELECT p.Name AS PlaylistName,
COUNT(pt.TrackId) AS TotalTracks FROM playlists AS p
JOIN playlist_track AS pt ON p.PlaylistId = pt.PlaylistId
GROUP BY
p.PlaylistId, p.Name;
```
| PlaylistName               | TotalTracks |
| -------------------------- | ----------- |
| Music                      | 3290        |
| TV Shows                   | 213         |
| 90’s Music                 | 1477        |
| Music                      | 3290        |
| Music Videos               | 1           |
| TV Shows                   | 213         |
| Brazilian Music            | 39          |
| Classical                  | 75          |
| Classical 101 - Deep Cuts  | 25          |
| Classical 101 - Next Steps | 25          |
| Classical 101 - The Basics | 25          |
| Grunge                     | 15          |
| Heavy Metal Classic        | 26          |
| On-The-Go 1                | 1           |

14. Proporciona una consulta que muestre todas las pistas, pero no muestre IDs.
    La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.

```sql
select t.Name as TrackName, g.Name as TrackGenre, a.Title as AlbumTitle, mt.MediaTYpeId from tracks as t, genres as g,
albums as a, media_types as mt where
t.MediaTypeId=mt.MediaTypeId and t.GenreId=g.GenreId and a.AlbumId=t.AlbumId;

SELECT
    t.Name AS TrackName,
    g.Name AS TrackGenre,
    a.Title AS AlbumTitle,
    mt.MediaTypeId FROM tracks AS t JOIN genres AS g ON t.GenreId = g.GenreId JOIN albums AS a ON t.AlbumId = a.AlbumId JOIN
    media_types AS mt ON t.MediaTypeId = mt.MediaTypeId;

```

| TrackName                               | TrackGenre | AlbumTitle                            | MediaTypeId |
| --------------------------------------- | ---------- | ------------------------------------- | ----------- |
| For Those About To Rock (We Salute You) | Rock       | For Those About To Rock We Salute You | 1           |
| Balls to the Wall                       | Rock       | Balls to the Wall                     | 2           |
| Fast As a Shark                         | Rock       | Restless and Wild                     | 2           |
| Restless and Wild                       | Rock       | Restless and Wild                     | 2           |
| Princess of the Dawn                    | Rock       | Restless and Wild                     | 2           |
| Put The Finger On You                   | Rock       | For Those About To Rock We Salute You | 1           |
| Let's Get It Up                         | Rock       | For Those About To Rock We Salute You | 1           |
| Inject The Venom                        | Rock       | For Those About To Rock We Salute You | 1           |
| Snowballed                              | Rock       | For Those About To Rock We Salute You | 1           |
| Evil Walks                              | Rock       | For Those About To Rock We Salute You | 1           |
| C.O.D.                                  | Rock       | For Those About To Rock We Salute You | 1           |
| Breaking The Rules                      | Rock       | For Those About To Rock We Salute You | 1           |
| Night Of The Long Knives                | Rock       | For Those About To Rock We Salute You | 1           |
| Spellbound                              | Rock       | For Those About To Rock We Salute You | 1           |
| Go Down                                 | Rock       | Let There Be Rock                     | 1           |
| Dog Eat Dog                             | Rock       | Let There Be Rock                     | 1           |
| Let There Be Rock                       | Rock       | Let There Be Rock                     | 1           |
| Bad Boy Boogie                          | Rock       | Let There Be Rock                     | 1           |
| Problem Child                           | Rock       | Let There Be Rock                     | 1           |
| Overdose                                | Rock       | Let There Be Rock                     | 1           |
| Hell Ain't A Bad Place To Be            | Rock       | Let There Be Rock                     | 1           |
| Whole Lotta Rosie                       | Rock       | Let There Be Rock                     | 1           |
| Walk On Water                           | Rock       | Big Ones                              | 1           |
| Love In An Elevator                     | Rock       | Big Ones                              | 1           |
| Rag Doll                                | Rock       | Big Ones                              | 1           |
| What It Takes                           | Rock       | Big Ones                              | 1           |
| Dude (Looks Like A Lady)                | Rock       | Big Ones                              | 1           |
| Janie's Got A Gun                       | Rock       | Big Ones                              | 1           |
| Cryin'                                  | Rock       | Big Ones                              | 1           |
| Amazing                                 | Rock       | Big Ones                              | 1           |
| Blind Man                               | Rock       | Big Ones                              | 1           |
| Deuces Are Wild                         | Rock       | Big Ones                              | 1           |
| The Other Side                          | Rock       | Big Ones                              | 1           |
| Crazy                                   | Rock       | Big Ones                              | 1           |
| Eat The Rich                            | Rock       | Big Ones                              | 1           |
| Angel                                   | Rock       | Big Ones                              | 1           |
| Livin' On The Edge                      | Rock       | Big Ones                              | 1           |
| All I Really Want                       | Rock       | Jagged Little Pill                    | 1           |
| You Oughta Know                         | Rock       | Jagged Little Pill                    | 1           |
| Perfect                                 | Rock       | Jagged Little Pill                    | 1           |
| Hand In My Pocket                       | Rock       | Jagged Little Pill                    | 1           |
| Right Through You                       | Rock       | Jagged Little Pill                    | 1           |
| Forgiven                                | Rock       | Jagged Little Pill                    | 1           |
| You Learn                               | Rock       | Jagged Little Pill                    | 1           |
| Head Over Feet                          | Rock       | Jagged Little Pill                    | 1           |
| Mary Jane                               | Rock       | Jagged Little Pill                    | 1           |
| Ironic                                  | Rock       | Jagged Little Pill                    | 1           |
| Not The Doctor                          | Rock       | Jagged Little Pill                    | 1           |
| Wake Up                                 | Rock       | Jagged Little Pill                    | 1           |
| You Oughta Know (Alternate)             | Rock       | Jagged Little Pill                    | 1           |
| We Die Young                            | Rock       | Facelift                              | 1           |
| Man In The Box                          | Rock       | Facelift                              | 1           |
| Sea Of Sorrow                           | Rock       | Facelift                              | 1           |
| Bleed The Freak                         | Rock       | Facelift                              | 1           |
| I Can't Remember                        | Rock       | Facelift                              | 1           |
| Love, Hate, Love                        | Rock       | Facelift                              | 1           |
| It Ain't Like That                      | Rock       | Facelift                              | 1           |

| Sunshine

15. Proporciona una consulta que muestre todas las facturas.

```sql
select * from invoices;
```

sqlite> select \* from invoices limit 50;
| InvoiceId | CustomerId | InvoiceDate | BillingAddress | BillingCity | BillingState | BillingCountry | BillingPostalCode | Total |
|-----------|------------|---------------------|---------------------------|----------------|--------------|----------------|-------------------|-------|
| 1 | 2 | 2009-01-01 00:00:00 | Theodor-Heuss-Straße 34 | Stuttgart | | Germany | 70174 | 1.98 |
| 2 | 4 | 2009-01-02 00:00:00 | Ullevålsveien 14 | Oslo | | Norway | 0171 | 3.96 |
| 3 | 8 | 2009-01-03 00:00:00 | Grétrystraat 63 | Brussels | | Belgium | 1000 | 5.94 |
| 4 | 14 | 2009-01-06 00:00:00 | 8210 111 ST NW | Edmonton | AB | Canada | T6G 2C7 | 8.91 |
| 5 | 23 | 2009-01-11 00:00:00 | 69 Salem Street | Boston | MA | USA | 2113 | 13.86 |
| 6 | 37 | 2009-01-19 00:00:00 | Berger Straße 10 | Frankfurt | | Germany | 60316 | 0.99 |
| 7 | 38 | 2009-02-01 00:00:00 | Barbarossastraße 19 | Berlin | | Germany | 10779 | 1.98 |
| 8 | 40 | 2009-02-01 00:00:00 | 8, Rue Hanovre | Paris | | France | 75002 | 1.98 |
| 9 | 42 | 2009-02-02 00:00:00 | 9, Place Louis Barthou | Bordeaux | | France | 33000 | 3.96 |
| 10 | 46 | 2009-02-03 00:00:00 | 3 Chatham Street | Dublin | Dublin | Ireland | | 5.94 |
| 11 | 52 | 2009-02-06 00:00:00 | 202 Hoxton Street | London | | United Kingdom | N1 5LH | 8.91 |
| 12 | 2 | 2009-02-11 00:00:00 | Theodor-Heuss-Straße 34 | Stuttgart | | Germany | 70174 | 13.86 |
| 13 | 16 | 2009-02-19 00:00:00 | 1600 Amphitheatre Parkway | Mountain View | CA | USA | 94043-1351 | 0.99 |
| 14 | 17 | 2009-03-04 00:00:00 | 1 Microsoft Way | Redmond | WA | USA | 98052-8300 | 1.98 |
| 15 | 19 | 2009-03-04 00:00:00 | 1 Infinite Loop | Cupertino | CA | USA | 95014 | 1.98 |
| 16 | 21 | 2009-03-05 00:00:00 | 801 W 4th Street | Reno | NV | USA | 89503 | 3.96 |
| 17 | 25 | 2009-03-06 00:00:00 | 319 N. Frances Street | Madison | WI | USA | 53703 | 5.94 |
| 18 | 31 | 2009-03-09 00:00:00 | 194A Chain Lake Drive | Halifax | NS | Canada | B3S 1C5 | 8.91 |
| 19 | 40 | 2009-03-14 00:00:00 | 8, Rue Hanovre | Paris | | France | 75002 | 13.86 |
| 20 | 54 | 2009-03-22 00:00:00 | 110 Raeburn Pl | Edinburgh | | United Kingdom | EH4 1HH | 0.99 |
| 21 | 55 | 2009-04-04 00:00:00 | 421 Bourke Street | Sidney | NSW | Australia | 2010 | 1.98 |
| 22 | 57 | 2009-04-04 00:00:00 | Calle Lira, 198 | Santiago | | Chile | | 1.98 |
| 23 | 59 | 2009-04-05 00:00:00 | 3,Raj Bhavan Road | Bangalore | | India | 560001 | 3.96 |
| 24 | 4 | 2009-04-06 00:00:00 | Ullevålsveien 14 | Oslo | | Norway | 0171 | 5.94 |
| 25 | 10 | 2009-04-09 00:00:00 | Rua Dr. Falcão Filho, 155 | São Paulo | SP | Brazil | 01007-010 | 8.91 |
| 26 | 19 | 2009-04-14 00:00:00 | 1 Infinite Loop | Cupertino | CA | USA | 95014 | 13.86 |
| 27 | 33 | 2009-04-22 00:00:00 | 5112 48 Street | Yellowknife | NT | Canada | X1A 1N6 | 0.99 |
| 28 | 34 | 2009-05-05 00:00:00 | Rua da Assunção 53 | Lisbon | | Portugal | | 1.98 |
| 29 | 36 | 2009-05-05 00:00:00 | Tauentzienstraße 8 | Berlin | | Germany | 10789 | 1.98 |
| 30 | 38 | 2009-05-06 00:00:00 | Barbarossastraße 19 | Berlin | | Germany | 10779 | 3.96 |
| 31 | 42 | 2009-05-07 00:00:00 | 9, Place Louis Barthou | Bordeaux | | France | 33000 | 5.94 |
| 32 | 48 | 2009-05-10 00:00:00 | Lijnbaansgracht 120bg | Amsterdam | VV | Netherlands | 1016 | 8.91 |
| 33 | 57 | 2009-05-15 00:00:00 | Calle Lira, 198 | Santiago | | Chile | | 13.86 |
| 34 | 12 | 2009-05-23 00:00:00 | Praça Pio X, 119 | Rio de Janeiro | RJ | Brazil | 20040-020 | 0.99 |
| 35 | 13 | 2009-06-05 00:00:00 | Qe 7 Bloco G | Brasília | DF | Brazil | 71020-677 | 1.98 |
| 36 | 15 | 2009-06-05 00:00:00 | 700 W Pender Street | Vancouver | BC | Canada | V6C 1G8 | 1.98 |
| 37 | 17 | 2009-06-06 00:00:00 | 1 Microsoft Way | Redmond | WA | USA | 98052-8300 | 3.96 |
| 38 | 21 | 2009-06-07 00:00:00 | 801 W 4th Street | Reno | NV | USA | 89503 | 5.94 |
| 39 | 27 | 2009-06-10 00:00:00 | 1033 N Park Ave | Tucson | AZ | USA | 85719 | 8.91 |
| 40 | 36 | 2009-06-15 00:00:00 | Tauentzienstraße 8 | Berlin | | Germany | 10789 | 13.86 |
| 41 | 50 | 2009-06-23 00:00:00 | C/ San Bernardo 85 | Madrid | | Spain | 28015 | 0.99 |
| 42 | 51 | 2009-07-06 00:00:00 | Celsiusg. 9 | Stockholm | | Sweden | 11230 | 1.98 |
| 43 | 53 | 2009-07-06 00:00:00 | 113 Lupus St | London | | United Kingdom | SW1V 3EN | 1.98 |
| 44 | 55 | 2009-07-07 00:00:00 | 421 Bourke Street | Sidney | NSW | Australia | 2010 | 3.96 |
| 45 | 59 | 2009-07-08 00:00:00 | 3,Raj Bhavan Road | Bangalore | | India | 560001 | 5.94 |
| 46 | 6 | 2009-07-11 00:00:00 | Rilská 3174/6 | Prague | | Czech Republic | 14300 | 8.91 |
| 47 | 15 | 2009-07-16 00:00:00 | 700 W Pender Street | Vancouver | BC | Canada | V6C 1G8 | 13.86 |
| 48 | 29 | 2009-07-24 00:00:00 | 796 Dundas Street West | Toronto | ON | Canada | M6J 1V1 | 0.99 |
| 49 | 30 | 2009-08-06 00:00:00 | 230 Elgin Street | Ottawa | ON | Canada | K2P 1L7 | 1.98 |
| 50 | 32 | 2009-08-06 00:00:00 | 696 Osborne Street | Winnipeg | MB | Canada | R3L 2B9 | 1.98 |

16. Proporciona una consulta que muestre las ventas totales realizadas por cada agente de ventas.

```sql
select e.employeeid, e.FirstName, e.LastName, count(i.InvoiceId) as Total_Sales
from employees as e, customers as c, invoices as i where e.employeeId=c.SupportRepId and
c.CustomerID=i.CustomerId and
e.Title = 'Sales Support Agent' group by e.employeeId;
```

| EmployeeId | FirstName | LastName | Total_Sales |
| ---------- | --------- | -------- | ----------- |
| 3          | Jane      | Peacock  | 146         |
| 4          | Margaret  | Park     | 140         |
| 5          | Steve     | Johnson  | 126         |

17. ¿Qué agente de ventas realizó más ventas en 2009?

```sql
SELECT e.EmployeeId, e.FirstName, e.LastName, COUNT(i.InvoiceId) AS total_sales FROM employees AS e, customers AS c,
invoices AS i WHERE e.EmployeeId = c.SupportRepId AND c.CustomerId = i.CustomerId AND
e.Title = 'Sales Support Agent' AND i.InvoiceDate regexp 2009 GROUP BY e.EmployeeId ORDER
BY total_sales DESC LIMIT 1;

SELECT e.EmployeeId, e.FirstName, e.LastName, COUNT(i.InvoiceId) AS total_sales FROM employees AS e JOIN customers AS c
ON e.EmployeeId = c.SupportRepId JOIN invoices AS i ON c.CustomerId = i.CustomerId WHERE
e.Title = 'Sales Support Agent' AND i.InvoiceDate regexp 2009 GROUP BY e.EmployeeId
ORDER BY total_sales DESC LIMIT 1;
```

| EmployeeId | FirstName | LastName | total_sales |
| ---------- | --------- | -------- | ----------- |
| 4          | Margaret  | Park     | 30          |

18. Escribir una consulta que muestre todas las playlists de la base de datos.

```sql
select * from playlist;
```

| PlaylistId | Name                       |
| ---------- | -------------------------- |
| 1          | Music                      |
| 2          | Movies                     |
| 3          | TV Shows                   |
| 4          | Audiobooks                 |
| 5          | 90’s Music                 |
| 6          | Audiobooks                 |
| 7          | Movies                     |
| 8          | Music                      |
| 9          | Music Videos               |
| 10         | TV Shows                   |
| 11         | Brazilian Music            |
| 12         | Classical                  |
| 13         | Classical 101 - Deep Cuts  |
| 14         | Classical 101 - Next Steps |
| 15         | Classical 101 - The Basics |
| 16         | Grunge                     |
| 17         | Heavy Metal Classic        |
| 18         | On-The-Go 1                |

19. Escribe una consulta que liste todas las canciones de una playlist.

```sql
select t.trackId, t.Name as TrackName, p.PlaylistId, p.Name as PlaylistName
from playlists as p, playlist_track as pt, tracks as t
where t.trackid=pt.trackid and pt.playlistid=p.playlistid order by p.Name;

SELECT
    t.TrackId,
    t.Name AS TrackName,
    p.PlaylistId,
    p.Name AS PlaylistName
FROM playlists AS p JOIN playlist_track AS pt ON p.PlaylistId = pt.PlaylistId JOIN tracks AS t ON pt.TrackId = t.TrackId ORDER BY p.Name;

```

| TrackId | TrackName                   | PlaylistId | PlaylistName |
| ------- | --------------------------- | ---------- | ------------ |
| 3       | Fast As a Shark             | 5          | 90’s Music   |
| 4       | Restless and Wild           | 5          | 90’s Music   |
| 5       | Princess of the Dawn        | 5          | 90’s Music   |
| 23      | Walk On Water               | 5          | 90’s Music   |
| 24      | Love In An Elevator         | 5          | 90’s Music   |
| 25      | Rag Doll                    | 5          | 90’s Music   |
| 26      | What It Takes               | 5          | 90’s Music   |
| 27      | Dude (Looks Like A Lady)    | 5          | 90’s Music   |
| 28      | Janie's Got A Gun           | 5          | 90’s Music   |
| 29      | Cryin'                      | 5          | 90’s Music   |
| 30      | Amazing                     | 5          | 90’s Music   |
| 31      | Blind Man                   | 5          | 90’s Music   |
| 32      | Deuces Are Wild             | 5          | 90’s Music   |
| 33      | The Other Side              | 5          | 90’s Music   |
| 34      | Crazy                       | 5          | 90’s Music   |
| 35      | Eat The Rich                | 5          | 90’s Music   |
| 36      | Angel                       | 5          | 90’s Music   |
| 37      | Livin' On The Edge          | 5          | 90’s Music   |
| 38      | All I Really Want           | 5          | 90’s Music   |
| 39      | You Oughta Know             | 5          | 90’s Music   |
| 40      | Perfect                     | 5          | 90’s Music   |
| 41      | Hand In My Pocket           | 5          | 90’s Music   |
| 42      | Right Through You           | 5          | 90’s Music   |
| 43      | Forgiven                    | 5          | 90’s Music   |
| 44      | You Learn                   | 5          | 90’s Music   |
| 45      | Head Over Feet              | 5          | 90’s Music   |
| 46      | Mary Jane                   | 5          | 90’s Music   |
| 47      | Ironic                      | 5          | 90’s Music   |
| 48      | Not The Doctor              | 5          | 90’s Music   |
| 49      | Wake Up                     | 5          | 90’s Music   |
| 50      | You Oughta Know (Alternate) | 5          | 90’s Music   |
| 51      | We Die Young                | 5          | 90’s Music   |
| 52      | Man In The Box              | 5          | 90’s Music   |
| 53      | Sea Of Sorrow               | 5          | 90’s Music   |
| 54      | Bleed The Freak             | 5          | 90’s Music   |
| 55      | I Can't Remember            | 5          | 90’s Music   |
| 56      | Love, Hate, Love            | 5          | 90’s Music   |
| 57      | It Ain't Like That          | 5          | 90’s Music   |
| 58      | Sunshine                    | 5          | 90’s Music   |
| 59      | Put You Down                | 5          | 90’s Music   |
| 60      | Confusion                   | 5          | 90’s Music   |
| 61      | I Know Somethin (Bout You)  | 5          | 90’s Music   |
| 62      | Real Thing                  | 5          | 90’s Music   |
| 77      | Enter Sandman               | 5          | 90’s Music   |
| 78      | Master Of Puppets           | 5          | 90’s Music   |
| 79      | Harvester Of Sorrow         | 5          | 90’s Music   |
| 80      | The Unforgiven              | 5          | 90’s Music   |
| 81      | Sad But True                | 5          | 90’s Music   |
| 82      | Creeping Death              | 5          | 90’s Music   |
| 83      | Wherever I May Roam         | 5          | 90’s Music   |
| 84      | Welcome Home (Sanitarium)   | 5          | 90’s Music   |
| 111     | Money                       | 5          | 90’s Music   |
| 112     | Long Tall Sally             | 5          | 90’s Music   |
| 113     | Bad Boy                     | 5          | 90’s Music   |
| 114     | Twist And Shout             | 5          | 90’s Music   |
| 115     | Please Mr. Postman          | 5          | 90’s Music   |
| 116     | C'Mon Everybody             | 5          | 90’s Music   |
| 117     | Rock 'N' Roll Music         | 5          | 90’s Music   |
| 118     | Slow Down                   | 5          | 90’s Music   |
| 119     | Roadrunner                  | 5          | 90’s Music   |
| 120     | Carol                       | 5          | 90’s Music   |
| 121     | Good Golly Miss Molly       | 5          | 90’s Music   |
| 122     | 20 Flight Rock              | 5          | 90’s Music   |
| 166     | Smoked Pork                 | 5          | 90’s Music   |
| 167     | Body Count's In The House   | 5          | 90’s Music   |
| 168     | Now Sports                  | 5          | 90’s Music   |
| 169     | Body Count                  | 5          | 90’s Music   |
| 170     | A Statistic                 | 5          | 90’s Music   |
| 171     | Bowels Of The Devil         | 5          | 90’s Music   |
| 172     | The Real Problem            | 5          | 90’s Music   |
| 173     | KKK Bitch                   | 5          | 90’s Music   |
| 174     | D Note                      | 5          | 90’s Music   |
| 175     | Voodoo                      | 5          | 90’s Music   |
| 176     | The Winner Loses            | 5          | 90’s Music   |
| 177     | There Goes The Neighborhood | 5          | 90’s Music   |
| 178     | Oprah                       | 5          | 90’s Music   |
| 179     | Evil Dick                   | 5          | 90’s Music   |
| 180     | Body Count Anthem           | 5          | 90’s Music   |
| 181     | Momma's Gotta Die Tonight   | 5          | 90’s Music   |
| 182     | Freedom Of Speech           | 5          | 90’s Music   |
| 183     | King In Crimson             | 5          | 90’s Music   |
| 184     | Chemical Wedding            | 5          | 90’s Music   |
| 185     | The Tower                   | 5          | 90’s Music   |
| 186     | Killing Floor               | 5          | 90’s Music   |
| 187     | Book Of Thel                | 5          | 90’s Music   |
| 188     | Gates Of Urizen             | 5          | 90’s Music   |
| 189     | Jerusalem                   | 5          | 90’s Music   |
| 190     | Trupets Of Jericho          | 5          | 90’s Music   |
| 191     | Machine Men                 | 5          | 90’s Music   |
| 192     | The Alchemist               | 5          | 90’s Music   |
| 193     | Realword                    | 5          | 90’s Music   |
| 205     | Jorge Da Capadócia          | 5          | 90’s Music   |
| 206     | Prenda Minha                | 5          | 90’s Music   |
| 207     | Meditação                   | 5          | 90’s Music   |
| 208     | Terra                       | 5          | 90’s Music   |
| 209     | Eclipse Oculto              | 5          | 90’s Music   |
| 210     | Texto "Verdade Tropical"    | 5          | 90’s Music   |
| 211     | Bem Devagar                 | 5          | 90’s Music   |
| 212     | Drão                        | 5          | 90’s Music   |
| 213     | Saudosismo                  | 5          | 90’s Music   |

20. Escribe una consulta que liste exclusivamente el nombre de las canciones de una playlist concreta,
    con el nombre de su género y el nombre de tipo de medio.

```sql
select t.trackId, t.Name as TrackName, g.Name as Genre, mt.Name as MediaType, p.PlaylistId, p.Name as PlaylistName
from playlists as p, playlist_track as pt, tracks as t, genres as g, media_types as mt
where t.trackid=pt.trackid and pt.playlistid=p.playlistid and mt.MediaTypeId=t.MediaTypeId
and t.GenreId=g.GenreID and p.Name = 'Grunge';

SELECT
    t.TrackId,
    t.Name AS TrackName,
    g.Name AS Genre,
    mt.Name AS MediaType,
    p.PlaylistId,
    p.Name AS PlaylistName FROM playlists AS p JOIN  playlist_track AS pt ON p.PlaylistId = pt.PlaylistId JOIN
    tracks AS t ON pt.TrackId = t.TrackId JOIN genres AS g ON t.GenreId = g.GenreId JOIN
    media_types AS mt ON t.MediaTypeId = mt.MediaTypeId WHERE p.Name = 'Grunge';

```

| TrackId | TrackName               | Genre       | MediaType                | PlaylistId | PlaylistName |
| ------- | ----------------------- | ----------- | ------------------------ | ---------- | ------------ |
| 52      | Man In The Box          | Rock        | MPEG audio file          | 16         | Grunge       |
| 2003    | Smells Like Teen Spirit | Rock        | MPEG audio file          | 16         | Grunge       |
| 2004    | In Bloom                | Rock        | MPEG audio file          | 16         | Grunge       |
| 2005    | Come As You Are         | Rock        | MPEG audio file          | 16         | Grunge       |
| 2007    | Lithium                 | Rock        | MPEG audio file          | 16         | Grunge       |
| 2010    | Drain You               | Rock        | MPEG audio file          | 16         | Grunge       |
| 2013    | On A Plain              | Rock        | MPEG audio file          | 16         | Grunge       |
| 2194    | Evenflow                | Rock        | MPEG audio file          | 16         | Grunge       |
| 2195    | Alive                   | Rock        | MPEG audio file          | 16         | Grunge       |
| 2198    | Jeremy                  | Rock        | MPEG audio file          | 16         | Grunge       |
| 2206    | Daughter                | Rock        | MPEG audio file          | 16         | Grunge       |
| 2512    | Outshined               | Rock        | MPEG audio file          | 16         | Grunge       |
| 2516    | Black Hole Sun          | Rock        | MPEG audio file          | 16         | Grunge       |
| 2550    | Plush                   | Rock        | MPEG audio file          | 16         | Grunge       |
| 3367    | Hunger Strike           | Alternative | Protected AAC audio file | 16         | Grunge       |
