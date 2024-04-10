CREATE VIEW available_inventory AS
select i.inventory_id, f.title, f.rating, f.length, l.name
from inventory as i
join film as f ON i.film_id = f.film_id 
join language as l on l.language_id=f.language_id
where i.inventory_id NOT IN (SELECT inventory_id FROM rental);

+--------------+------------------+--------+--------+---------+
| inventory_id | title            | rating | length | name    |
+--------------+------------------+--------+--------+---------+
|            5 | ACADEMY DINOSAUR | PG     |     86 | English |
+--------------+------------------+--------+--------+---------+

