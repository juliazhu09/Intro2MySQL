
/*    =================================
      === SQL Intro Using MySQL     ===
      ===      Xiaojuan Zhu         ===
	  ===      xzhu8@utk.edu        ===
      ================================= 
 
 -- === Researching Computing Support ===
    RCS typically helps UT researchers with:
	- Statistical consulting
	- Research design and implementation
	- Data collection strategies including; developing interview guides, 
	  survey construction, and LabView data acquisition
	- Data analysis using qualitative, quantitative, and GIS methods
	- Co-author manuscript methods and results sections
	- Provide specialized research software support services including:
	- Installation and licensing
	- Akindi exam scoring 
	- Provide short courses, workshops and guest lectures 
	  on supported specialized software used for research
      
	UT students get 15 hours per semester of free help:
    UT faculty get 50 hours per year of	free help:
	HelpDesk: 974-9900
	Walk-in Schedule:
	http://oit.utk.edu/research/schedule

  =========== WHAT IS DATABASE? ===========
1.	A collection of data
	- a filing cabinet full of medical records
    - list of things to buy at grocery store
    - a Rolodex full of different people's contact information
    - a phone book
  A Quick example. 
  Imagine you have a gigantic phone book and I ask you 
  to do something like,
•	Find Ned Flander‘s phone number
•	Find people with first name “Ned”
•	Find All phone numbers with area code 865
•	Find All people who have a 3-letter First name
It's not easy, and it would take a lot of time to find the information.

2.	A method for accessing and manipulating that data.
	For the phone book's example, going back to this phone book,
	We would want a way, some sort of program or code,
	that would allow us to find everybody with the first name Ned.
    or find all people who have a three letter first name.
    
Database vs Database & Management system
Database management system: have data and an interface for that data.

For example: we have a chatting app, user data, images,
		and all different information/dataset. 
For all the application to be able to do things, 
		like add a new user,
		update an address of the current user, 
        we need a database management system (DBMS).
        that allow us interface with the database.
        
Apps-> DBMS-> Database

MySQL, SQLite, Oracle Database: database management system
Database is a structured set of computerized data with an accessible interface. 

 =========== SQL vs MySQL ===========
SQL (structured query language) is the language we use to “talk” to our databases
“Find all users”, “Add a new user”, “Delete all the inactivate users” 
The code are called SQL queries, structured query language. */
-- SQL Code Example: 
SELECT first_name, last_name, phone_number 
FROM phonebook
WHERE first_name= 'Ned';

/* Working with MYSQL is primarily writing SQL. 
Rational database:
	•	MySQL
	•	SQLite
	•	Oracle Database  --> all use SQL
	•	PostgreSQL
	•	Others
comments Rational database: organizes data into one or more tables (or "relations") of 
         columns and rows, with a unique key identifying each row.
SQL is a structured query language. It exists separately from MySQL, 
and MySQL is a database management system that implements SQL. 
There is a standard for how SQL should work. 
All of these different database management systems
basically are tasked with implementing that standard
in their own database and making it work.

SQL standard: https://blog.ansi.org/sql-standard-iso-iec-9075-2023-ansi-x3-135/#gref
=========== MySQL SERVER and WORKBENCH ===========
MySql Server is a client/server system that consists of a multithreaded SQL server 
    that supports different back ends, several different client programs and libraries, 
    administrative tools, and a wide range of application programming interfaces (APIs). 
MySql workbench is a graphical user interface (GUI) or which helps us interact with MySql server database 
Definition from MySQL website: a uncommentsified visual tool for database architects, developers, and DBAs. 
MySQL Workbench provides data modeling, SQL development, and comprehensive administration tools 
for server configuration, user administration, backup, and much more. 
MySQL Workbench is available on Windows, Linux and Mac OS X.
Install MySQL on windows:https://www.youtube.com/watch?v=u96rVINbAUI&t=16s 
 */

-- ======= DOCUMENTING YOUR SQL COMMAND =======
-- Single line comments use -- 
-- Comments go from "--" to the end of the line (will not be executed).
-- Multi-line comments: use /* and */ to comment 


-- ======== CREATE, DROP, USE DATABASES ========
--  A database server may contain multiple databases, like student database, 
--  employee database, or book database. 
--  We want to save each set of data in its own space instead of mixed all the table together.

--  To list the available databases in the database server
	show databases;

-- Note: SQL commend use semicolon ";"to finish the command

--  The general command to create a database: 
--	CREATE DATABASE <database_name>;
--  A specific example:
CREATE DATABASE pet_store;
CREATE DATABASE DogApp;
CREATE DATABASE Cat store;
-- Note: can't put a space in a variable name but use underscore instead. 
-- Whether the name is captialized or not does not matter in SQL.
-- Basically, capitalized all the SQL keywords like create and 
-- database that are always the same, because it helps the key words
-- stand out from your content.
--  To Delete a database 
--  Do this to be quite careful 
--  Once you delete a database, it will remove a database entirely
--  and all of it's contents, like tables, will be removed.
--	DROP DATABASE <database-name>;
	DROP DATABASE DogAPP;
	SHOW Databases;
--  To use a database:
--  select a database and then we can work with it.
--	USE <database-name>;
    USE pet_store;

-- ===========  TABLES  ===========
--  Table is the real heart of SQL.
--  A database is just a bunch of tables in a relational database, at least.
--  Tables hold the data! 
--  “A collection of related data held in a structured format within a database”.
-- Create a Table:
-- We use CREATE TABLE statement to create a new table in a database.
CREATE TABLE table_name (
    column1 datatype constraints,
    column2 datatype,
    column3 datatype,
   ....
);
-- The column parameters specify the names of the columns of the table.
-- The datatype parameter specifies the type of data the column can hold (e.g. varchar, integer, date, Decimal, etc.).
-- Use comma ',' to separate the variables. 
-- Tip: For an overview of the available data types, go to MySQL Data Types Reference, 
--      https://dev.mysql.com/doc/refman/8.0/en/data-types.html.
-- Example1 :
	CREATE TABLE cats (
		catname VARCHAR(50),
        age INT
	);
-- Example2:
 	CREATE TABLE dogs (
		dogname VARCHAR(50),
		breed VARCHAR(50),
		age INT
	);
-- Check:
	Show tables;
	Show COLUMNS FROM cats;
	DESC cats;
-- DELETE A TABLE
-- We use DROP TABLE statement to delete a table. 
-- DROP TABLE <table-name>;
-- For example, we want to drop the cats table;
	DROP TABLE dogs;
    Show tables;
-- =========== Insert Values ===========
--  We use INSERT INTO statement to insert one or multiple values to a table. 
--  two ways to insert values
--  1. we will specify both the column names and the values to be inserted:
--  insert a cat:
	INSERT INTO cats (catname, age) 
    VALUES ('Blue', 5);
--  2. If we add values for all the columns of the table, we do not need to specify the column names.
--  However, make sure the order of the values is in the same order as the columns in the table. 
--  Here, the INSERT INTO syntax would be as follows:
	INSERT INTO cats 
    VALUES ('Jenkins', 7);
--  Check our work:
--  We use SELECT statement followed by FROM keyword to select the rows from a table or mutliple tables in the database. 
	SELECT * 
    FROM cats;
--  Note: The key words like SELECT or FROM will start a new line  
--  It will make the code easily to read in practice.

--  Insert multiple values;
	INSERT INTO cats 
	VALUES 
	  ('Meatball', 5), 
	  ('Turkey', 1), 
	  ('Potato Face', 15);
      SELECT *
      FROM cats;
-- Exercise:
--  insert a cat named 'Jaja' and her age is 7 into the cats dataset. 
--  using select statement to show it. 




--  =========== Not Null =========== 
--  Add a row without any values
	INSERT INTO cats VALUES ();
--  Check the data from cats
	Select * FROM cats;
    DESC cats; -- default value is null if the value is missing. 
--  The null data is not what we want, we can use NOT NULL and set a default value. 
    CREATE TABLE cats2  (    
    catname VARCHAR(20) NOT NULL DEFAULT 'unnamed',    
    age INT NOT NULL DEFAULT 99 
);
	DESC cats2;
    
-- =========== Primary Key =========== 
--  PRIMARY KEY uniquely identifies each record in a table.
--  It must contain UNIQUE values, and cannot contain NULL values. A table can have only ONE primary key. 
  CREATE TABLE cats3  (  
    catid INT primary key,
    catname VARCHAR(20) NOT NULL DEFAULT 'unnamed',    
    age INT NOT NULL DEFAULT 99 
);
	DESC cats3;
-- We can use AUTO_INCREMENT to define the primary key.
--  AUTO_INCREMENT will automatically generate a unique number. 
 DROP TABLE  cats, cats2;
 CREATE TABLE cats  (  
    catid INT AUTO_INCREMENT primary key,
    catname VARCHAR(100) NOT NULL DEFAULT 'unnamed',   
    breed VARCHAR(100),
    age INT NOT NULL DEFAULT 99 
);
-- add values 
INSERT INTO cats(catname, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
SELECT * 
FROM cats;

-- ===========   Foreign Key   ===========
-- Foreign key: one or multiple columns in one table, that refers to the PRIMARY KEY in another table.
-- Create a cat owner table
CREATE TABLE cat_owners (
    ID int NOT NULL auto_increment,
    first_name VARCHAR(100),
    Last_name VARCHAR(100),
    CatID int,
    PRIMARY KEY (ID),
    FOREIGN KEY (CatID) REFERENCES cats(CatID)
);

-- We can create a diagram from existing database schema to view the database structrue. 
-- This task is called reverse engineering, because we have the database already and we create the diagram from it.
-- But usually we should build a physical database from the ER diagram – this is called forward engineering.
-- To view the diagram of a database: Database --> Reverse Engineer --> ... -->Select a database 
-- More information: https://www.youtube.com/watch?v=X_umYKqKaF0 
-- =========== Where Condition ===========
--  WHERE clause will return the records which fulfill a specified condition. 
--  We want to select all the Tabby cats.
SELECT * 
FROM Cats
WHERE breed ='Tabby';
--  We want to select all the Tabby cats' name and age.
--  We just need to sepcify the column name after the select statement. 
SELECT catname, age 
FROM Cats
WHERE breed ='Tabby';
-- Exercise:
--  Select all the cats who are less than 10 years old using where condition. 



-- === TABLE OF LOGICAL OPERATORS ===

-- Equals              =
-- Less than           <
-- Greater than        >
-- Less or equal       <=
-- Greater or equal    >=
-- Not equal           <>
-- And                 &
-- Or                  |
-- exclusive OR        ^
-- ============  Like  ============
-- Like: used in where condition and search for a specified pattern in a text column.
-- Two Wildcards: % and _ used to match parts of a value.
-- %: match any number of characters, zero, one, mutiple characters. 
-- _: match a single character.
-- For example, find out all the cat's names contain letter 'o';
SELECT catname 
FROM Cats
WHERE catname like '%o%' ;

-- Find the cat whose name's second letter is 'i'
SELECT catname 
FROM Cats
WHERE catname like '_i%' ;
-- Exercise:
--  select the cat named with letter 'on' at the end;


-- =========== Update Values ===========
-- The udpate statement modify the existing records in a table
-- Update the cat named "Jackson"'s age to 9

SELECT * 
FROM cats
where catname ='Jackson';

UPDATE cats
  SET age = 9
  WHERE catname = 'Jackson';
-- Exercise:
--  select the cat named 'Jackson' and update his name to 'Jack'. 



-- =========== Delete Rows ===========
-- We use delete and where to delete rows match a criterion. 
-- Syntax: DELETE FROM table_name WHERE condition;
-- For example, delete all the cats order than 10 years old. 
DELETE FROM cats where age>10;
SELECT * FROM cats;
-- Delete all cats from cats table
DELETE FROM cats;
SELECT * FROM cats;

-- =========== AGGREGATION FUNCTIONS ===========
-- creat another table named employee.
drop tables employees;
 CREATE TABLE employees  (  
    id INT primary key,
    gender VARCHAR(20),
    age int,
    education_year int,
    job_category VARCHAR(20),
    current_salary int,
    salary_begin int,
    jobtime_month int,
    experience_month int
    );
    desc employees;
INSERT INTO employees 
VALUES (1,'m',38,15,'3',57000,27000,98,144), (2,'m',32,16,'1',40200,18750,98,36), (3,'f',61,12,'1',21450,12000,98,381), (4,'f',43,8,'1',21900,13200,98,190), (5,'m',35,15,'1',45000,21000,98,138), (6,'m',32,15,'1',32100,13500,98,67), 
(7,'m',34,15,'1',36000,18750,98,114), (8,'f',24,12,'1',21900,9750,98,0), (9,'f',44,15,'1',27900,12750,98,115), (10,'f',44,12,'1',24000,13500,98,244), (11,'f',40,16,'1',30300,16500,98,143), (12,'m',24,8,'1',28350,12000,98,26),
(13,'m',30,15,'1',27750,14250,98,34), (14,'f',41,15,'1',35100,16800,98,137), (15,'m',28,12,'1',27300,13500,97,66), (16,'m',26,12,'1',40800,15000,97,24), (17,'m',28,15,'1',46000,14250,97,48), (18,'m',34,16,'3',103750,27510,97,70),
(19,'m',28,12,'1',42300,14250,97,103), (20,'f',50,12,'1',26250,11550,97,48), (21,'f',27,16,'1',38850,15000,97,17), (22,'m',50,12,'1',21750,12750,97,315), (23,'f',25,15,'1',24000,11100,97,75), (24,'f',57,12,'1',16950,9000,97,124),
(25,'f',48,15,'1',21150,9000,97,171), (26,'m',24,15,'1',31050,12600,96,14), (27,'m',36,19,'3',60375,27480,96,96), (28,'m',27,15,'1',32550,14250,96,43), (29,'m',46,19,'3',135000,79980,96,199), (30,'m',29,15,'1',31200,14250,96,54),
(31,'m',26,12,'1',36150,14250,96,83), (32,'m',36,19,'3',110625,45000,96,120), (33,'m',29,15,'1',42000,15000,96,68), (34,'m',41,19,'3',92000,39990,96,175), (35,'m',29,17,'3',81250,30000,96,18), (36,'f',27,8,'1',31350,11250,96,52),
(37,'m',36,12,'1',29100,13500,96,113), (38,'m',28,15,'1',31350,15000,96,49), (39,'m',30,16,'1',36000,15000,96,46), (40,'f',57,15,'1',19200,9000,96,23), (41,'f',29,12,'1',23550,11550,96,52), (42,'m',30,15,'1',35100,16500,95,90),
(43,'m',26,12,'1',23250,14250,95,46), (44,'m',27,8,'1',29250,14250,95,50), (45,'m',52,12,'2',30750,13500,95,307), (46,'f',50,15,'1',22350,12750,95,165), (47,'f',52,12,'1',30000,16500,95,228), (48,'m',43,12,'2',30750,14100,94,240), (49,'m',32,15,'1',34800,16500,94,93), (50,'m',30,16,'3',60000,23730,94,59);

-- Check the table with 5 observations using LIMIT statement;
SELECT * 
FROM employees
LIMIT 5;
-- Update the job_category information
UPDATE employees
  SET job_category = 'Clerical'
  WHERE job_category = '1';
UPDATE  employees
  SET job_category = 'Custodial'
  WHERE job_category = '2';
UPDATE employees
  SET job_category = 'Manager'
  WHERE job_category = '3';
-- Check table
SELECT * 
FROM  employees
WHERE job_category = 'Clerical';

SELECT * 
FROM  employees
WHERE job_category = 'Custodial';
-- ====== Count Function =======

-- The COUNT() function returns the number of rows that matches a criterion.
-- The COUNT(*) syntax allows us to count the number of rows in a table
-- Count how many total employees in the dataset
SELECT COUNT(*) as count
FROM employees;
-- How many female employees?
SELECT COUNT(*) as count
FROM employees
WHERE gender='f';

-- Exercise:
-- Find out how many employees's age less than 40 years old;


-- ====== Average Function =======
-- Find out the average employees' salary 
SELECT AVG(current_salary) 
FROM employees;
-- Find out the average salary by gender using GROUP BY
SELECT gender, AVG(current_Salary) 
FROM employees
GROUP BY gender;

-- Find out job category's average salary and count of the employee, Show the employee ORDERY BY Count
SELECT  job_category, AVG(current_Salary), count(*) as Count 
FROM employees
GROUP BY job_category
ORDER BY Count;
-- DESC order  
SELECT  job_category, AVG(current_Salary), count(*) as Count 
FROM employees
GROUP BY job_category
ORDER BY Count DESC;

-- ====== MIN and MAX Function =======
-- FIND the max salary and min salary;
SELECT max(current_salary) as max_salary,
 min(current_salary) as min_salary
 FROM employees;


-- ====== Use Subqueries =======
-- Find the max salary's employee's information
-- Two ways to find the max salary employee's info
-- 1. Use order by salary and limit 1
SELECT * 
FROM employees
ORDER BY current_salary DESC
Limit 1; 
-- 2. Use a subquery
SELECT * 
FROM employees
WHERE current_salary =
    (SELECT MAX(current_salary) FROM employees);
    
-- Exercise:
-- Find out the employees information with longest experience (experience_month);



--  ====== Combine Aggregate Function =======

-- Find out the count, max, min, and average of each job catergory's education information. 
SELECT Job_category, Count(*) as Count, Max(education_year) as max_education, 
	Min(education_year) as min_education, AVG(Education_year) as avg_education 
FROM employees
GROUP BY job_category
ORDER BY Job_category;

-- Exercise:
-- Find out the count, max, min, and average experience by each job category;



--  ======= Having Condition =======
-- Having is used to filter the groups (aggregation functions) because WHERE cannot be used with GROUP BY function. 
-- Use the query to show the job_category with count number < 10

SELECT Job_category, Count(*) as Count, Max(education_year) as max_education, 
	Min(education_year) min_education, AVG(Education_year) as avg_education 
FROM employees
GROUP BY job_category
HAVING Count(*) < 10
ORDER BY Job_category;


-- Exercise:
-- Find out the count, max, min, and average job experience by each job category 
--     with average experience is more than 120 months (10 years);



-- ====== JOIN TABLES =======;
-- drop tables employee_names;
-- Create a employee name table;
 CREATE TABLE employee_names(  
   id INT primary key,
   first_name VARCHAR(100),
   last_name VARCHAR(100)
    );
desc employee_names;
INSERT INTO  employee_names 
Values (1,'Lauren','Peake'), (2,'Sally','Vaughan'), (3,'Christopher','Paige'), (4,'Trevor','Mathis'), (5,'Stewart','MacLeod'), (6,'William','Walsh'), (7,'Heather','Smith'), 
(8,'Phil','Jones'), (9,'Max','Gill'), (10,'Joan','Hart'), (11,'Victoria','Ferguson'), (12,'Keith','Wilkins'), (13,'Julian','Watson'),
(14,'Tracey','Arnold'), (15,'Michelle','Fraser'), (16,'Isaac','MacDonald'), (17,'Jacob','Short'), (18,'Amelia','Ellison'), (19,'Pippa','Walsh'),
(20,'Cameron','Hart'), (21,'Andrea','Stewart'), (22,'Anthony','Berry'), (23,'Ryan','Knox'), (24,'Steven','Butler'), (25,'Amy','King'),
(26,'Stephanie','Hill'), (27,'Ryan','Taylor'), (28,'Gordon','Fisher'), (29,'Audrey','Duncan'), (30,'Robert','Rutherford'), (31,'Melanie','Greene'),
(32,'Sarah','Morgan'), (33,'Katherine','Hamilton'), (34,'Lily','Grant'), (35,'John','Brown'), (36,'Andrea','Miller'), (37,'Sebastian','Roberts'),
(38,'Joseph','Miller'), (39,'Tracey','Kerr'), (40,'Penelope','Gibson'),(41,'Amanda','Davies'), (42,'Peter','Berry'), (43,'Molly','Butler'),
(44,'Sonia','Wright'), (45,'James','Paige'), (46,'Carl','Walker'), (47,'Lucas','Newman'), (48,'Leonard','Welch'), (49,'Leah','Vaughan'),
(50,'Bernadette','Mathis'), (51,'Justin','James'), (52,'Jake','Hodges'), (53,'Lillian','Scott'), (54,'Sam','Abraham'), (55,'Robert','James');
SELECT count(*) 
FROM employee_names;

-- ====== Inner Join =======;

-- inner join: selects records that have matching values in both tables by using a condition
-- Join the employee names and employees table by using ID from both tables;
SELECT * 
	FROM Employee_names 
    INNER JOIN employees
    ON employee_names.id = employees.id;
    

-- ====== Left/right Join =======;
-- Left join: returns all records from the left table (table1), and the matching records from the right table (table2). 
-- The result is 0 records from the right side, if there is no match.
-- Right join: returns all records from the right table (table2), and the matching records from the left table (table1). 
-- Simliarly, The result is 0 records from the left side, if there is no match.
-- NOTE: Instead of using where, We will use "On" for conditions. 
-- Left join example
SELECT * 
FROM Employee_names 
LEFT JOIN employees
ON employee_names.id = employees.id;

-- Right join example
SELECT * 
FROM Employees  as a
RIGHT JOIN employee_names as b
ON a.id = b.id;

 
-- Exercise:
-- Inner join the employees and employee_names table use Using (ID); 

 
  -- ======  CREATE A VIEW ======
--  CREATE VIEW command create a view which is a virtual table from a query result.
-- A view is a database object that allows generating a logical subset of data from one or more tables.
-- The advantage of a view:
-- 1. It can join data from several tables thus creating a new view of it. 
-- For example, you have a database and you need to do some complex statistical queries on it.
-- Instead of sending the complex query to the database all the time, you can save the query as a view and then SELECT * FROM view
-- 2. Views can be used as security mechanisms by letting users access data through the view, 
--   without granting the users permissions to directly access the underlying base tables of the view

-- Create a view with employee id, first, last names, employee current salary, education years, experience_month
USE PET_STORE;

CREATE VIEW Employee_info AS
SELECT  a.id, first_name, last_name, current_salary, education_year, experience_month
FROM Employees  as a
JOIN employee_names as b
on a.id = b.id;
    
SELECT * 
FROM EMPLOYEE_info;

   
-- ====== ALTER TABLE =======
-- Change a table's name
ALTER TABLE cats3 RENAME TO cat_table;
DESC cat_table;
-- Change a column's name
ALTER TABLE employee_names
RENAME COLUMN id TO employee_id;
DESC employee_names;
-- Modify a exisitng column's datatype
-- Modify the employee id to AUTO_INCREMENT
ALTER TABLE employee_names
MODIFY employee_id int(5)  zerofill auto_increment ; -- add zerofill to make 5 digits.
DESC Employee_names;
insert into employee_names (first_name, last_name) values ('Julia', 'Zhu');
SELECT * 
FROM employee_names 
WHERE first_name = 'Julia';
/*---GOOD SOURCES OF SQL LEARNING ---

 SQL Tutorial:   https://www.w3schools.com/sql/default.asp
 MySQL Tutorial: https://www.mysqltutorial.org/getting-started-with-mysql/
 SQL Practice: https://www.sql-practice.com/
 MySQL for Developers: https://planetscale.com/learn/courses/mysql-for-developers/introduction/course-introduction
 Databases and Web Programming(CS465/CS565): https://web.eecs.utk.edu/~bvanderz/teaching/cs465Sp20/
 Linkedin learning from OIT for free:   https://oit.utk.edu/training/online-training/lil/
 Stackoverflow:          https://stackoverflow.com/questions*/

  
-- ======  Final Exercise  ====== :
-- ====================================================
-- For user do not have MySQL installed
-- Go to the website: https://www.sql-practice.com/
-- 0. Open the scheme and identify the primary key and foreign key in each table?


-- 1. Show first name, last name, and gender of patients whose gender is 'M' (Q1):



-- 2. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive) 
-- hint: use WHERE weight between 100 and 120 (Q4)



-- 3.  Show the first_name, last_name, and height of the patient with the greatest height. (Q9)
-- hint: subqueries or use order by and limit 1



-- 4. Show first name, last name, and the full province name of each patient (JOIN Q1)
-- hint: join the patients and provience_names table, using province_id


-- 5. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'. (JOIN Q2)
-- Primary diagnosis is stored in the admissions table.
-- hint: join the patients and admissions table using (patient_id) and where = 'Dementia'



-- 6. Show first_name, last_name, and the total number of admissions attended for each doctor.(JOIN Q3)
-- Every admission has been attended by a doctor using count(*) 
-- hint: join doctors and admissions table


-- 7. What is that average height and average weight of the patients?
-- 


-- 8. Show the province_id(s), sum of height; 
-- where the total sum of its patient's height is greater than or equal to 7,000.
-- hint: having sum(height) > 7000




-- =====================================================================
-- Use the source command to load data into the MySQL Server:
-- Use The Sakila Database from MySQL
USE sakila;
-- 0. Open the scheme and identify the primary key and foreign key in each table?


-- 1. Find all actors whose last name is "Davis":


-- 2. Use JOIN to joing the staff and adress table and show the first name, last name, and address of each staff member;




-- 3. Use the left join to join the actor and film_actor table and group by actor_id 
--    and show actor's first and last name and number of films named count using count(*) 




-- 4. Find out the actor who has appeared in the most films?
-- Use the query from previous exercise and order by count desc and limit 1;





-- 5. Which actor's last names are not repeated?
-- Hint: using group by last_name and having count(*) = 1




-- 6. What is that average length of all the films in the sakila DB?



-- 7. How many actors distinct last names are there?
-- Hint using Count(DISTINCT last_name) .
-- DISTINCT is used to return only distinct (different) values. 




-- 8. What is the average length of films by category?
-- Hint: join the film and film_category using film_id also join film_category and category using category_id
--       group by category name






 /*---In a New Browser Tab---

 https://workshop.utk.edu/feedback.php */  

 
 
  -- ====================================================
 -- Final Exercise Answers --

-- For user do not have MySQL installed
-- Go to the website: https://www.w3schools.com/sql/trysql.asp?filename=trysql_op_or 
-- 1. Show first name, last name, and gender of patients whose gender is 'M' (Q1):
SELECT * FROM Customers
where country='USA';


-- 2. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive) 
-- hint: use WHERE weight between 100 and 120 (Q4)
SELECT first_name , last_name, weight FROM patients
WHERE weight between 100 and 120;


-- 3.  Show the first_name, last_name, and height of the patient with the greatest height. (Q9)
SELECT first_name , last_name, height FROM patients
order by HEIGHT DESC
LIMIT 1;



-- 4. Show first name, last name, and the full province name of each patient (JOIN Q1)
-- hint: join the patients and provience_names table, using province_id
select first_name, last_name,  province_name
from patients
join province_names 
on patients.province_id = province_names.province_id;

-- 5. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'. (JOIN Q2)
-- Primary diagnosis is stored in the admissions table.
select patients.patient_id, first_name, last_name from patients
join admissions
on patients.patient_id = admissions.patient_id
where diagnosis = 'Dementia';


-- 6. Show first_name, last_name, and the total number of admissions attended for each doctor.(JOIN Q3)
-- Every admission has been attended by a doctor using count(*) 
select  first_name, last_name, count(*) as count from doctors
join admissions
on doctors.doctor_id = admissions.attending_doctor_id
group by doctor_id;


-- 7. What is that average height and average weight of the patients?
select avg(height), avg(height) from patients;


-- 8. Show the province_id(s), sum of height; 
-- where the total sum of its patient's height is greater than or equal to 7,000.
-- Using having condition statement

select province_id, sum(height) as total_height from patients
group by province_id
having total_height>7000;

 -- ====================================================
 -- For MySQL user
 -- 1. Find all actors whose last name is "Davis":
select * from actor
where last_name = 'Davis';

-- 2. Use JOIN to joing the staff and adress table and show the first name, last name, and address of each staff member;
select first_name, last_name, address 
from staff join address
where staff.address_id = address.address_id;

-- 3. Use the left join to join the actor and film_actor table and group by actor_id 
--    and show actor's first and last name and number of films named count using count(*) 
select first_name, last_name, count(*) as count
from actor right join film_actor
on actor.actor_id = film_actor.actor_id
group by actor.actor_id;

-- 4. Find out the actor who has appeared in the most films?
-- Use the query from previous exercise and order by count desc and limit 1;
select first_name, last_name, count(*) as count
from actor right join film_actor
on actor.actor_id = film_actor.actor_id
group by actor.actor_id
order by count desc 
limit 5;

-- 5. Which actor's last names are not repeated?
-- Hint: using group by last_name and having count(*) = 1
select last_name from actor group by last_name having count(*) = 1;


-- 6. What is that average length of all the films in the sakila DB?
Select avg(length) from film;

-- 7. How many actors distinct last names are there?
-- Hint using Count(DISTINCT last_name) .
-- DISTINCT is used to return only distinct (different) values. 
select count(distinct last_name) from actor;
-- 8. What is the average length of films by category?
-- Hint: join the film and film_category using film_id also join film_category and category using category_id
--       group by category name
select c.name, avg(length)
from film as a
join film_category as b
on a.film_id = b.film_id  
join category as c
on  b.category_id= c.category_id
group by c.name
order by avg(length) desc;