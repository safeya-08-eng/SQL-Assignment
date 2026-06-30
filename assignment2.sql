-- insert 
select *
from persons;
desc persons;
insert into persons
       (id,person_name,birth_date,phone)  
values (1,'Pavithra','2000-02-09',9841536181);
truncate persons;
insert into persons
values (2,'pavi','2000-09-07',983467383),
(4,'ram','2004-04-07',983467393),
(3,'sita','2003-06-21',983466783);


/* create a table named as students 
id as auto incremetnt,
regno as primarykey,
name,dob
and perform bulk insertion without entering id
*/
create table student(
id int unique auto_increment,
regno int,
name varchar(20),
dob date,primary key (regno));
desc student;

INSERT  into student
       (regno,name,dob)  
values  (1,'Pavithra','2000-02-09'),
         (2,'Pavi','2000-02-09');

select *
from student;
delete 
from student
where name='kumar' AND regno =103;

delete 
from student 
where  regno =103 or name='Arun';

delete 
from student
where regno=104 and name is null;

select*
from student
where name is null;

select*
from student
where name is null;

update  student
  set name ='Ashok'
  where regno= 103;




