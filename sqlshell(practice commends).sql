SQL SHELL COMMANDS:

\c root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 31
Server version: 8.0.46 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:3306 ssl  SQL > show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| library            |
| mysql              |
| performance_schema |
| salesdb            |
| sys                |
+--------------------+


6 rows in set (0.0016 sec)
 MySQL  localhost:3306 ssl  SQL > use mydatabase;
MySQL Error 1049: Unknown database 'mydatabase'
 MySQL  localhost:3306 ssl  SQL > use mydatabase;
Default schema set to `mydatabase`.
Fetching global names, object names from `mydatabase` for auto-completion... Press ^C to stop.
 MySQL  localhost:3306 ssl  mydatabase  SQL > create table customer(customer_id int primary key, name varchar(20),city varchar(15));
Query OK, 0 rows affected (0.0694 sec)
 MySQL  localhost:3306 ssl  mydatabase  SQL > create table customer(customer_id int primary key, name varchar(20),city varchar(15));
ERROR: 1050 (42S01): Table 'customer' already exists
 MySQL  localhost:3306 ssl  mydatabase  SQL > desc customer;


+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| customer_id | int         | NO   | PRI | NULL    |       |
| name        | varchar(20) | YES  |     | NULL    |       |
| city        | varchar(15) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.0059 sec)

ALTER TABLE customer MODIFY customer_id INT AUTO_INCREMENT;
Query OK, 0 rows affected (0.0969 sec)



Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  mydatabase  SQL > desc customer;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| customer_id | int         | NO   | PRI | NULL    | auto_increment |
| name        | varchar(20) | YES  |     | NULL    |                |
| city        | varchar(15) | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
localhost:3306 ssl  mydatabase  SQL > ALTER TABLE customer ADD mobile varchar(30)UNIQUE;
Query OK, 0 rows affected (0.0956 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  mydatabase  SQL > desc customer;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| customer_id | int         | NO   | PRI | NULL    | auto_increment |
| name        | varchar(20) | YES  |     | NULL    |                |
| city        | varchar(15) | YES  |     | NULL    |                |
| mobile      | varchar(30) | YES  | UNI | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
4 rows in set (0.0022 sec)

 MySQL  localhost:3306 ssl  mydatabase  SQL > select * from customer;
Empty set (0.0005 sec)
 MySQL  localhost:3306 ssl  mydatabase  SQL > insert into customer(customer_name,city,mobile) value('pavithra','chennai',9841536181),('safiya','madurai',8976542917),('Ram','delhi',2748775848);
ERROR: 1054 (42S22): Unknown column 'customer_name' in 'field list'
 MySQL  localhost:3306 ssl  mydatabase  SQL > INSERT INTO customer(name, city, mobile) VALUES
                                           -> ('safeya', 'chennai', '1234567890'),
                                           -> ('pavi', 'madurai', '0987654321'),
                                           -> ('raj', 'goa', '456');


Query OK, 3 rows affected (0.0243 sec)

Records: 3  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  mydatabase  SQL > select * FROM customer;
+-------------+--------+---------+------------+
| customer_id | name   | city    | mobile     |
+-------------+--------+---------+------------+
|           1 | safeya | chennai | 1234567890 |
|           2 | pavi   | madurai | 0987654321 |
|           3 | raj    | goa     | 456        |
+-------------+--------+---------+------------+
3 rows in set (0.0006 sec)

 MySQL  localhost:3306 ssl  mydatabase  SQL >

 MySQL  localhost:3306 ssl  mydatabase  SQL > desc sales_details;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| sales_id     | int           | NO   | PRI | NULL    | auto_increment |
| customer_id  | int           | NO   | MUL | NULL    |                |
| product_name | varchar(50)   | YES  |     | NULL    |                |
| quantity     | int           | YES  |     | 1       |                |
| amount       | decimal(10,2) | YES  |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
5 rows in set (0.0027 sec)
 MySQL  localhost:3306 ssl  mydatabase  SQL >


d`))
 MySQL  localhost:3306 ssl  mydatabase  SQL > INSERT INTO sales_details(customer_id, product_name, quantity, amount) VALUES
                                           -> (1, 'laptop', 1, 55000),
                                           -> (2, 'mouse', 1, 1200),
                                           -> (3, 'keyboard', 2, 18500);
Query OK, 3 rows affected (0.0067 sec)

Records: 3  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  mydatabase  SQL > desc sales_details;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| sales_id     | int           | NO   | PRI | NULL    | auto_increment |
| customer_id  | int           | NO   | MUL | NULL    |                |
| product_name | varchar(50)   | YES  |     | NULL    |                |
| quantity     | int           | YES  |     | 1       |                |
| amount       | decimal(10,2) | YES  |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
5 rows in set (0.0029 sec)
 MySQL  localhost:3306 ssl  mydatabase  SQL >
select * from sales_details;


+----------+-------------+--------------+----------+----------+
| sales_id | customer_id | product_name | quantity | amount   |
+----------+-------------+--------------+----------+----------+
|        6 |           1 | laptop       |        1 | 55000.00 |
|        7 |           2 | mouse        |        1 |  1200.00 |
|        8 |           3 | keyboard     |        2 | 18500.00 |
+----------+-------------+--------------+----------+----------+


3 rows in set (0.0006 sec)
 MySQL  localhost:3306 ssl  mydatabase  SQL >

  mydatabase  SQL > show table
                                           -> show table;


ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'show table' at line 2

 MySQL  localhost:3306 ssl  mydatabase  SQL > show tables;
+----------------------+
| Tables_in_mydatabase |
+----------------------+
| customer             |
| customers            |
| orders               |
| sales_details        |

+----------------------+

4 rows in set (0.0224 sec)
 MySQL  localhost:3306 ssl  mydatabase  SQL > show tables;
+----------------------+
| Tables_in_mydatabase |
+----------------------+
| customer             |
| customers            |
| orders               |
| sales_details        |

+----------------------+


4 rows in set (0.0027 sec)
 MySQL  localhost:3306 ssl  mydatabase  SQL > use mydatabase;
Default schema set to `mydatabase`.
Fetching global names, object names from `mydatabase` for auto-completion... Press ^C to stop.


 MySQL  localhost:3306 ssl  mydatabase  SQL > show tables;
+----------------------+
| Tables_in_mydatabase |
+----------------------+
| customer             |
| customers            |
| orders               |
| sales_details        |
+----------------------+

4 rows in set (0.0015 sec)

 MySQL  localhost:3306 ssl  mydatabase  SQL > select * from oders;
ERROR: 1146 (42S02): Table 'mydatabase.oders' doesn't exist
 MySQL  localhost:3306 ssl  mydatabase  SQL > select * from orders;
Empty set (0.0162 sec)
 MySQL  localhost:3306 ssl  mydatabase  SQL > select *from orders;
Empty set (0.0009 sec)


 MySQL  localhost:3306 ssl  mydatabase  SQL > select *from customers inner join orders on id=customer_id;
+----+------------+---------+-------+----------+-------------+------------+-------+
| id | first_name | country | score | order_id | customer_id | order_date | sales |
+----+------------+---------+-------+----------+-------------+------------+-------+
|  1 | Maria      | Germany |   350 |     1001 |           1 | 2021-01-11 |    35 |
|  2 |  John      | USA     |   900 |     1002 |           2 | 2021-04-05 |    15 |
|  3 | Georg      | UK      |   750 |     1003 |           3 | 2021-06-18 |    20 |
+----+------------+---------+-------+----------+-------------+------------+-------+
3 rows in set (0.0015 sec)

 MySQL  localhost:3306 ssl  mydatabase  SQL >



select id,first_name,orders.order_id,orders.sales from customers inner join orders on id=customer_id;
+----+------------+----------+-------+
| id | first_name | order_id | sales |
+----+------------+----------+-------+
|  1 | Maria      |     1001 |    35 |
|  2 |  John      |     1002 |    15 |
|  3 | Georg      |     1003 |    20 |
+----+------------+----------+-------+

3 rows in set (0.0010 sec)
 MySQL  localhost:3306 ssl  mydatabase  SQL >
 select *from customers left join orders on id=customer_id;

+----+------------+---------+-------+----------+-------------+------------+-------+
| id | first_name | country | score | order_id | customer_id | order_date | sales |
+----+------------+---------+-------+----------+-------------+------------+-------+
|  1 | Maria      | Germany |   350 |     1001 |           1 | 2021-01-11 |    35 |
|  2 |  John      | USA     |   900 |     1002 |           2 | 2021-04-05 |    15 |
|  3 | Georg      | UK      |   750 |     1003 |           3 | 2021-06-18 |    20 |
|  4 | Martin     | Germany |   500 |     NULL |        NULL | NULL       |  NULL |
|  5 | Peter      | USA     |     0 |     NULL |        NULL | NULL       |  NULL |
+----+------------+---------+-------+----------+-------------+------------+-------+
5 rows in set (0.0014 sec)
 MySQL  localhost:3306 ssl  mydatabase  SQL > select id,first_name,orders.order_id,orders.sales from customers left join orders on id=customer_id;


+----+------------+----------+-------+
| id | first_name | order_id | sales |
+----+------------+----------+-------+
|  1 | Maria      |     1001 |    35 |
|  2 |  John      |     1002 |    15 |
|  3 | Georg      |     1003 |    20 |
|  4 | Martin     |     NULL |  NULL |
|  5 | Peter      |     NULL |  NULL |
+----+------------+----------+-------+
5 rows in set (0.0009 sec)


MySQL  localhost:3306 ssl  mydatabase  SQL > select c.id,c.first_name,o.order_id,o.sales from orders as o right join customers as c on o.customer_id = c.id;


+----+------------+----------+-------+
| id | first_name | order_id | sales |
+----+------------+----------+-------+
|  1 | Maria      |     1001 |    35 |
|  2 |  John      |     1002 |    15 |
|  3 | Georg      |     1003 |    20 |
|  4 | Martin     |     NULL |  NULL |
|  5 | Peter      |     NULL |  NULL |

+----+------------+----------+-------+

5 rows in set (0.0011 sec)
 MySQL  localhost:3306 ssl  mydatabase  SQL >  select c.id,c.first_name,o.order_id,o.sales from orders as o left join customers as c on o.customer_id = c.id;
+------+------------+----------+-------+
| id   | first_name | order_id | sales |
+------+------------+----------+-------+
|    1 | Maria      |     1001 |    35 |
|    2 |  John      |     1002 |    15 |
|    3 | Georg      |     1003 |    20 |
| NULL | NULL       |     1004 |    10 |
+------+------------+----------+-------+
4 rows in set (0.0007 sec)
 MySQL  localhost:3306 ssl  mydatabase  SQL >

joins

 show tables;
+----------------------+
| Tables_in_mydatabase |
+----------------------+
| customer             |
| customers            |
| dept                 |
| orders               |
| persons              |
| sales_details        |
| student              |
| students             |
+----------------------+
8 rows in set (0.3095 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select * from customers;
+----+------------+---------+-------+
| id | first_name | country | score |
+----+------------+---------+-------+
|  1 | Maria      | Germany |   350 |
|  2 |  John      | USA     |   900 |
|  3 | Georg      | UK      |   750 |
|  4 | Martin     | Germany |   500 |
|  5 | Peter      | USA     |     0 |
+----+------------+---------+-------+
5 rows in set (0.0480 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > drop database mydatabase;
Query OK, 8 rows affected (0.4545 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > show databases;
+--------------------+
| Database           |
+--------------------+
| employee           |
| information_schema |
| mydatabase         |
| mysql              |
| performance_schema |
| pet_db             |
| salesdb            |
| student            |
| student_db         |
| sys                |
+--------------------+
10 rows in set (0.0089 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > use mydatabase;
Default schema set to `mydatabase`.
Fetching global names, object names from `mydatabase` for auto-completion... Press ^C to stop.
 MySQL  localhost:33060+ ssl  mydatabase  SQL > show tables;
+----------------------+
| Tables_in_mydatabase |
+----------------------+
| customers            |
| orders               |
+----------------------+
2 rows in set (0.0029 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select * from customers;
+----+------------+---------+-------+
| id | first_name | country | score |
+----+------------+---------+-------+
|  1 | Maria      | Germany |   350 |
|  2 |  John      | USA     |   900 |
|  3 | Georg      | UK      |   750 |
|  4 | Martin     | Germany |   500 |
|  5 | Peter      | USA     |     0 |
+----+------------+---------+-------+
5 rows in set (0.0039 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select * from orders;
+----------+-------------+------------+-------+
| order_id | customer_id | order_date | sales |
+----------+-------------+------------+-------+
|     1001 |           1 | 2021-01-11 |    35 |
|     1002 |           2 | 2021-04-05 |    15 |
|   ^C1003 |           3 | 2021-06-18 |    20 | select * from customers inner join orders on id=customer_idi
 MySQL  localhost:33060+ ssl  mydatabase  SQL > ^Clect * from customers inner join orders on id=customer_idi
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select * from customers inner join orders on id=customer_id
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select * from customers inner join orders on id=customer_i
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select * from customers inner join orders on id=customer_
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select * from customers inner join orders on id = customer_id;
+----+------------+---------+-------+----------+-------------+------------+-------+
| id | first_name | country | score | order_id | customer_id | order_date | sales |
+----+------------+---------+-------+----------+-------------+------------+-------+
|  1 | Maria      | Germany |   350 |     1001 |           1 | 2021-01-11 |    35 |
|  2 |  John      | USA     |   900 |     1002 |           2 | 2021-04-05 |    15 |
|  3 | Georg      | UK      |   750 |     1003 |           3 | 2021-06-18 |    20 |
+----+------------+---------+-------+----------+-------------+------------+-------+
3 rows in set (0.0075 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select id,first_name,orders.order_id,orders.sales from customers inner join orders on id=customer_id;
+----+------------+----------+-------+
| id | first_name | order_id | sales |
+----+------------+----------+-------+
|  1 | Maria      |     1001 |    35 |
|  2 |  John      |     1002 |    15 |
|  3 | Georg      |     1003 |    20 |
+----+------------+----------+-------+
3 rows in set (0.0025 sec)
 MySQL  localhost:33060+ ssl  mydatabase  SQL > select c.id,c.first_name,o.order_id,o.sales from customers AS c inner join orders AS o on c.id=o.customer_id;
+----+------------+----------+-------+
| id | first_name | order_id | sales |
+----+------------+----------+-------+
|  1 | Maria      |     1001 |    35 |
|  2 |  John      |     1002 |    15 |
|  3 | Georg      |     1003 |    20 |
+----+------------+----------+-------+


 MySQL  localhost:33060+ ssl  mydatabase  SQL > select c.id,c.first_name,o.order_id,o.sales from customers AS c left join orders AS o on c.id=o.customer_id;
+----+------------+----------+-------+
| id | first_name | order_id | sales |
+----+------------+----------+-------+
|  1 | Maria      |     1001 |    35 |
|  2 |  John      |     1002 |    15 |
|  3 | Georg      |     1003 |    20 |
|  4 | Martin     |     NULL |  NULL |
|  5 | Peter      |     NULL |  NULL |
+----+------------+----------+-------+

select c.id,c.first_name,o.order_id,o.sales from customers AS c right join orders AS o on c.id=o.customer_id;
+------+------------+----------+-------+
| id   | first_name | order_id | sales |
+------+------------+----------+-------+
|    1 | Maria      |     1001 |    35 |
|    2 |  John      |     1002 |    15 |
|    3 | Georg      |     1003 |    20 |
| NULL | NULL       |     1004 |    10 |


 select c.id,c.first_name,o.order_id,o.sales from customers AS c left join orders AS o on c.id=o.customer_id where o.order_id is null;
+----+------------+----------+-------+
| id | first_name | order_id | sales |
+----+------------+----------+-------+
|  4 | Martin     |     NULL |  NULL |
|  5 | Peter      |     NULL |  NULL |
+----+------------+----------+-------+

select c.id,c.first_name,o.order_id,o.sales from customers AS c right join orders AS o on c.id=o.customer_id where c.id is null;
+------+------------+----------+-------+
| id   | first_name | order_id | sales |
+------+------------+----------+-------+
| NULL | NULL       |     1004 |    10 |
+------+------------+----------+-------+
.
JOIN>>>>

SELECT 
    c.id, 
    c.first_name, 
    o.order_id, 
    o.sales 
FROM 
    customers AS c 
LEFT JOIN 
    orders AS o 
ON 
    c.id = o.customer_id;


SELECT 
    c.id, 
    c.first_name, 
    o.order_id, 
    o.sales 
FROM 
    customers AS c 
LEFT JOIN 
    orders AS o 
ON 
    c.id = o.customer_id 
WHERE 
    o.order_id IS NULL;



SELECT 
    c.id, 
    c.first_name, 
    o.order_id, 
    o.sales 
FROM 
    customers AS c 
RIGHT JOIN 
    orders AS o 
ON 
    c.id = o.customer_id;

SELECT 
    c.id, 
    c.first_name, 
    o.order_id, 
    o.sales 
FROM 
    customers AS c 
RIGHT JOIN 
    orders AS o 
ON 
    c.id = o.customer_id 
WHERE 
    o.order_id IS NULL;


SELECT 
    c.id, 
    c.first_name, 
    o.order_id, 
    o.sales 
FROM 
    customers AS c 
RIGHT JOIN 
    orders AS o 
ON 
    c.id = o.customer_id 
WHERE 
    c.id IS NULL;

SELECT 
    c.id, 
    c.first_name,
o.order_id, 
    o.sales 
FROM 
    customers AS c 
CROSS JOIN 
    orders AS o;

select c.id,c.first_name,o.order_id,o.sales from customers as c cross join orders as o;



create table employee1;
ERROR: 4028 (HY000): A table must have at least one visible column.
 MySQL  localhost:3306 ssl  mydatabase  SQL > create table employee1(emp_id INT PRIMARY KEY,emp_name VARCHAR(50),department VARCHAR(30),salary INT,manager_id INT);
Query OK, 0 rows affected (0.0491 sec)
 MySQL  localhost:3306 ssl  mydatabase  SQL > show tables;
+----------------------+
| Tables_in_mydatabase |
+----------------------+
| customer             |
| customers            |
| employee1            |
| orders               |
| sales_details        |
+----------------------+
5 rows in set (0.0055 sec)