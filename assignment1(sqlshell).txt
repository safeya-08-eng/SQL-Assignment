 \connect root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 26
Server version: 8.0.45 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:3306 ssl  SQL > DROP TABLE IF EXISTS Employees;
ERROR: 1046 (3D000): No database selected
 MySQL  localhost:3306 ssl  SQL > DROP TABLE IF EXISTS Department;
ERROR: 1046 (3D000): No database selected
 MySQL  localhost:3306 ssl  SQL > DROP DATABASE IF EXISTS joins_db;
Query OK, 0 rows affected, 1 warning (0.0287 sec)
Note (code 1008): Can't drop database 'joins_db'; database doesn't exist
 MySQL  localhost:3306 ssl  SQL > CREAT DATABASE joins_db;
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CREAT DATABASE joins_db' at line 1
 MySQL  localhost:3306 ssl  SQL > CREATE DATABASE joins_db;
Query OK, 1 row affected (0.0253 sec)
 MySQL  localhost:3306 ssl  SQL > USE joins_db;
Default schema set to `joins_db`.
Fetching global names, object names from `joins_db` for auto-completion... Press ^C to stop.
 MySQL  localhost:3306 ssl  joins_db  SQL > DROP TABLE IF EXISTS Employees;
Query OK, 0 rows affected, 1 warning (0.0292 sec)
Note (code 1051): Unknown table 'joins_db.employees'
 MySQL  localhost:3306 ssl  joins_db  SQL > DROP TABLE IF EXISTS Departments;
Query OK, 0 rows affected, 1 warning (0.0062 sec)
Note (code 1051): Unknown table 'joins_db.departments'
 MySQL  localhost:3306 ssl  joins_db  SQL > CREAT TABLE Employees(EmpID INT PRIMARY KEY,EmpName VARCHAR(50)NOT NULL,DeptID INT,Salary INT,FOREIGN KEY (DeptID) REFERENCES Departments(DeptID));
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CREAT TABLE Employees(EmpID INT PRIMARY KEY,EmpName VARCHAR(50)NOT NULL,DeptID I' at line 1
 MySQL  localhost:3306 ssl  joins_db  SQL > CREATE TABLE Employees(EmpID INT PRIMARY KEY,EmpName VARCHAR(50)NOT NULL,DeptID INT,Salary INT,FOREIGN KEY (DeptID) REFERENCES Departments(DeptID));
ERROR: 1824 (HY000): Failed to open the referenced table 'departments'
 MySQL  localhost:3306 ssl  joins_db  SQL > CREATE TABLE Employees( EmpID INT PRIMARY KEY,  EmpName VARCHAR(50) NOT NULL, DeptID INT, Salary INT, FOREIGN KEY (DeptID) REFERENCES Departments(DeptID));
                               
ERROR: 1824 (HY000): Failed to open the referenced table 'departments'
 MySQL  localhost:3306 ssl  joins_db  SQL > CREATE TABLE Departments(  DeptID INT PRIMARY KEY,  DeptName VARCHAR(50) NOT NULL);
Query OK, 0 rows affected (0.0764 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > CREATE TABLE Employees( EmpID INT PRIMARY KEY,  EmpName VARCHAR(50) NOT NULL,  DeptID INT,   Salary INT,  FOREIGN KEY (DeptID) REFERENCES Departments(DeptID));
                                      
Query OK, 0 rows affected (0.0598 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > INSERT INTO Departments(DeptID, DeptName) VALUES (101, 'Sales'), (102, 'HR'), (103, 'IT'), (105, 'Marketing');
Query OK, 4 rows affected (0.0147 sec)

Records: 4  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  joins_db  SQL > INSERT INTO Employees(EmpID, EmpName, DeptID, Salary) VALUES (1, 'Arun', 101, 45000), (2, 'Bhavya', 102, 52000), (3, 'Chitra', 101, 47000), (4, 'Dinesh', 103, 39000), (5, 'Esha', NULL, 41000), (6, 'Farhan', 104, 55000);
ERROR: 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`joins_db`.`employees`, CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `departments` (`DeptID`))
 MySQL  localhost:3306 ssl  joins_db  SQL > DELETE FROM Employees;
Query OK, 0 rows affected (0.0016 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > INSERT INTO Employees(EmpID, EmpName, DeptID, Salary) VALUES (1, 'Arun', 101, 45000), (2, 'Bhavya', 102, 52000), (3, 'Chitra', 101, 47000), (4, 'Dinesh', 103, 39000), (5, 'Esha', NULL, 41000), (6, 'Farhan', NULL, 55000);
Query OK, 6 rows affected (0.0050 sec)

Records: 6  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  joins_db  SQL > SELECT * FROM Employees;
+-------+---------+--------+--------+
| EmpID | EmpName | DeptID | Salary |
+-------+---------+--------+--------+
|     1 | Arun    |    101 |  45000 |
|     2 | Bhavya  |    102 |  52000 |
|     3 | Chitra  |    101 |  47000 |
|     4 | Dinesh  |    103 |  39000 |
|     5 | Esha    |   NULL |  41000 |
|     6 | Farhan  |   NULL |  55000 |
+-------+---------+--------+--------+
6 rows in set (0.0010 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > INSERT INTO Departments(DeptID, DeptName) VALUES (104, 'Finance');
Query OK, 1 row affected (0.0032 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > INSERT INTO Employees VALUES (6, 'Farhan', 104, 55000);
ERROR: 1062 (23000): Duplicate entry '6' for key 'employees.PRIMARY'
 MySQL  localhost:3306 ssl  joins_db  SQL > -- q1 inner join
Query OK, 0 rows affected (0.0004 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > SELECT e.EmpName, d.DeptName, e.Salary FROM Employees e INNER JOIN Departments d ON e.DeptID = d.DeptID;
+---------+----------+--------+
| EmpName | DeptName | Salary |
+---------+----------+--------+
| Arun    | Sales    |  45000 |
| Chitra  | Sales    |  47000 |
| Bhavya  | HR       |  52000 |
| Dinesh  | IT       |  39000 |
+---------+----------+--------+
4 rows in set (0.0007 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > SELECT e.EmpName, d.DeptName -> FROM Employees e-> LEFT JOIN Departments d ON e.DeptID = d.DeptID;
+---------+----------+
| EmpName | DeptName |
+---------+----------+
| Arun    | Sales    |
| Bhavya  | HR       |
| Chitra  | Sales    |
| Dinesh  | IT       |
| Esha    | NULL     |
| Farhan  | NULL     |
+---------+----------+
6 rows in set (0.0025 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > SELECT e.EmpName, d.DeptName FROM Employees e RIGHT JOIN Departments d ON e.DeptID = d.DeptID;
+---------+-----------+
| EmpName | DeptName  |
+---------+-----------+
| Arun    | Sales     |
| Chitra  | Sales     |
| Bhavya  | HR        |
| Dinesh  | IT        |
| NULL    | Finance   |
| NULL    | Marketing |
+---------+-----------+
6 rows in set (0.0007 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > SELECT e.EmpName, d.DeptName, e.Salary FROM Employees e LEFT JOIN Departments d ON e.DeptID = d.DeptID UNION SELECT e.EmpName, d.DeptName, e.Salary FROM Employees e RIGHT JOIN Departments d ON e.DeptID = d.DeptID;
+---------+-----------+--------+
| EmpName | DeptName  | Salary |
+---------+-----------+--------+
| Arun    | Sales     |  45000 |
| Bhavya  | HR        |  52000 |
| Chitra  | Sales     |  47000 |
| Dinesh  | IT        |  39000 |
| Esha    | NULL      |  41000 |
| Farhan  | NULL      |  55000 |
| NULL    | Finance   |   NULL |
| NULL    | Marketing |   NULL |
+---------+-----------+--------+
8 rows in set (0.0052 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > SELECT e.EmpName FROM Employees e LEFT JOIN Departments d ON e.DeptID = d.DeptID WHERE d.DeptID IS NULL;
+---------+
| EmpName |
+---------+
| Esha    |
| Farhan  |
+---------+
2 rows in set (0.0008 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > SELECT d.DeptName FROM Employees e RIGHT JOIN Departments d ON e.DeptID = d.DeptID WHERE e.EmpID IS NULL;
+-----------+
| DeptName  |
+-----------+
| Finance   |
| Marketing |
+-----------+
2 rows in set (0.0007 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > SELECT e.EmpName, d.DeptName, e.Salary FROM Employees e, Departments d WHERE e.DeptID = d.DeptID;
+---------+----------+--------+
| EmpName | DeptName | Salary |
+---------+----------+--------+
| Arun    | Sales    |  45000 |
| Bhavya  | HR       |  52000 |
| Chitra  | Sales    |  47000 |
| Dinesh  | IT       |  39000 |
+---------+----------+--------+
4 rows in set (0.0010 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > SELECT e.EmpName, d.DeptName FROM Departments d RIGHT JOIN Employees e ON d.DeptID = e.DeptID;
+---------+----------+
| EmpName | DeptName |
+---------+----------+
| Arun    | Sales    |
| Bhavya  | HR       |
| Chitra  | Sales    |
| Dinesh  | IT       |
| Esha    | NULL     |
| Farhan  | NULL     |
+---------+----------+
6 rows in set (0.0010 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > SELECT e.EmpName, d.DeptName FROM Employees e CROSS JOIN Departments d;
+---------+-----------+
| EmpName | DeptName  |
+---------+-----------+
| Arun    | Marketing |
| Arun    | Finance   |
| Arun    | IT        |
| Arun    | HR        |
| Arun    | Sales     |
| Bhavya  | Marketing |
| Bhavya  | Finance   |
| Bhavya  | IT        |
| Bhavya  | HR        |
| Bhavya  | Sales     |
| Chitra  | Marketing |
| Chitra  | Finance   |
| Chitra  | IT        |
| Chitra  | HR        |
| Chitra  | Sales     |
| Dinesh  | Marketing |
| Dinesh  | Finance   |
| Dinesh  | IT        |
| Dinesh  | HR        |
| Dinesh  | Sales     |
| Esha    | Marketing |
| Esha    | Finance   |
| Esha    | IT        |
| Esha    | HR        |
| Esha    | Sales     |
| Farhan  | Marketing |
| Farhan  | Finance   |
| Farhan  | IT        |
| Farhan  | HR        |
| Farhan  | Sales     |
+---------+-----------+
30 rows in set (0.0009 sec)
 MySQL  localhost:3306 ssl  joins_db  SQL > ALTER TABLE Employees ADD COLUMN ManagerID INT;
Query OK, 0 rows affected (0.0268 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  joins_db  SQL > UPDATE Employees SET ManagerID = 1 WHERE EmpID IN (2,3,4,5,6);
Query OK, 5 rows affected (0.0073 sec)

Rows matched: 5  Changed: 5  Warnings: 0
 MySQL  localhost:3306 ssl  joins_db  SQL > SELECT e.EmpName AS Employee, m.EmpName AS Manager FROM Employees e LEFT JOIN Employees m ON e.ManagerID = m.EmpID;
+----------+---------+
| Employee | Manager |
+----------+---------+
| Arun     | NULL    |
| Bhavya   | Arun    |
| Chitra   | Arun    |
| Dinesh   | Arun    |
| Esha     | Arun    |
| Farhan   | Arun    |
+----------+---------+
6 rows in set (0.0010 sec)