create database mydatabase;
use mydatabase;
CREATE TABLE persons(
id INT NOT NULL,
person_name VARCHAR(50) NOT NULL,
birth_date DATE,
Phone VARCHAR(15) NOT NULL,
CONSTRAINT pk_persons PRIMARY KEY(id)
);
DESC persons;
CREATE TABLE students(
id INT NOT NULL,
regno INT,
name VARCHAR(20),
dept VARCHAR(20),
email VARCHAR (30),
address VARCHAR (30),
mobile VARCHAR(15),
date_of_birth DATE,PRIMARY KEY (regno));
 
 
desc students;
show tables;
alter table students
change column mobile phone varchar(20);
alter table students
change column regno egno int null,
drop primary key;

alter table students
change column id  id int not null auto_increment ,
add primary key(id);

alter table student
change column regno regno int not null,
add primary key(regno);

alter table student
change column id id int  null,
drop primary key;


desc students;

ALTER TABLE students
modify id INT NOT NULL AUTO_INCREMENT,
ADD UNIQUE (id);

alter table students
change column id id int null;

alter table students
change column  id id int ,
add primary key(id);

alter table students
modify id int  unique key;

alter table students
modify id int auto_increment;

alter table students
drop index id;

/* createa a table for employee id as not null+auto /*

empno int primary key
empname ,emp_dob
address
email, adderss
*/

CREATE TABLE employees (
    empno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    empname VARCHAR(10),
    emp_dob DATE,
    address VARCHAR(25),
    email VARCHAR(15)
);
desc employees;
select * 
from employees;

alter table employees
add column phone varchar(15) after email;

alter table employees
drop column phone;

alter table employees
change column address location varchar(10);

alter table employees
modify location char(25) unique;

alter table employee
change column location address varchar(30);

show tables;

drop table students,employees

