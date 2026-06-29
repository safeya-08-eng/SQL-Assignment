CREATE DATABASE LibraryDB;
USE LibraryDB;
SELECT DATABASE();
-- qn0:1 create a books table

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    price DECIMAL(8,2),
    published_date DATE,
    in_stock INT DEFAULT 1
);
DESC Books;

-- qn0:2 insert 5 records
INSERT INTO Books (title, isbn, price, published_date, in_stock)
VALUES
('Java Programming','ISBN1001',650.00,'2019-05-10',5),
('Python Basics','ISBN1002',450.00,'2021-07-15',3),
('History of India','ISBN1003',550.00,'2018-09-20',0),
('Database Systems','ISBN1004',700.00,'2022-01-05',2);

INSERT INTO Books (title, isbn, price, published_date)
VALUES
('World History','ISBN1005',350.00,'2017-03-25');
SELECT * FROM Books; 

-- qn0:3 Rename colunm

ALTER TABLE Books
RENAME COLUMN title TO book_title;
DESC Books;

-- qn:04: Change datatype
ALTER TABLE Books
MODIFY COLUMN price FLOAT;
DESC Books;
-- qno:05 add new number

ALTER TABLE Books
ADD COLUMN author_name VARCHAR(50) NOT NULL DEFAULT 'Unknown';
SELECT * FROM Books;

-- qno:06 give 10% disscount 
SET SQL_SAFE_UPDATES=0;
UPDATE Books
SET price = price * 0.90
WHERE published_date < '2020-01-01';
SELECT * FROM Books;

-- QNO:07 DELETE OUT OF STACK BOOKS

DELETE FROM Books
WHERE in_stock = 0;
SELECT * FROM Books;

-- QNO:08 RESET AUTO_INCREMENT

ALTER TABLE Books
AUTO_INCREMENT = 101;

INSERT INTO Books(book_title,isbn,price,published_date,in_stock,author_name)
VALUES
('Operating Systems','ISBN1006',800,'2023-04-12',4,'Abraham Silberschatz');
SELECT * FROM Books;

-- QNO:09 DISPLAY BOOK CONTAINING HISTORY

SELECT book_title,
       price,
       published_date
FROM Books
WHERE book_title LIKE '%History%'
AND price > 300
ORDER BY price DESC;

-- QNO:10 INSERT MEMBER TABLE

CREATE TABLE Members
(
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    member_name VARCHAR(100) NOT NULL,
    join_date DATE NOT NULL DEFAULT (CURRENT_DATE)
);

DESC Members;

-- CREAT SAMPLE MEMBER

INSERT INTO Members(member_name,join_date)
VALUES
('Alice','2024-01-15'),
('Bob','2023-08-12'),
('Charlie','2024-05-20'),
('David','2025-02-10'),
('Emma','2024-11-05');

SELECT * FROM Members;

-- DISPLAY MEMBERS WHO JOINED IN 2024

SELECT *
FROM Members
WHERE YEAR(join_date)=2024
ORDER BY member_name ASC;

SELECT * FROM Books;

SELECT * FROM Members;