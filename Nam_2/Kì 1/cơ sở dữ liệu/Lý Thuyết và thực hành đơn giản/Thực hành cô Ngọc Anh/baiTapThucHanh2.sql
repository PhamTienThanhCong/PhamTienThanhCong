CREATE DATABASE studentdb
use studentdb

CREATE TABLE class101(
id INT NOT NULL ,
name VARCHAR(50),
gpa FLOAT);

ALTER TABLE class101
ADD PRIMARY KEY(id)

INSERT INTO class101(id,name,gpa)
VALUES('1001','Tan Ah Teck ','4.5')
INSERT INTO class101(id,name,gpa)
VALUES('1002','Mohammed Ali ','4.8')
INSERT INTO class101(id,name,gpa)
VALUES('1003','Kumar ','4.6')
INSERT INTO class101(id,name,gpa)
VALUES('1004','Kevin Jones ','4.6')

select name,gpa from class101
where name LIKE 'k%' 

select name,gpa from class101
where name not LIKE 'k%'

SELECT * FROM class101 
WHERE gpa BETWEEN 4.35 AND 4.65

SELECT * FROM class101
WHERE name LIKE '%e%'

SELECT * FROM class101
WHERE name LIKE '%e%' or name LIKE '%a%' 

SELECT * FROM class101
WHERE name LIKE '%e%' and gpa > 4.5