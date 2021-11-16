create database baiTapTuan4
use baiTapTuan4

CREATE TABLE A (a int); 
CREATE TABLE B (b int); 
INSERT INTO A VALUES (1), (2), (3), (4); 
INSERT INTO B VALUES (3), (4), (5), (6); 

/* Bài 1 */

SELECT * FROM A INNER JOIN B; 

SELECT * FROM A INNER JOIN B ON A.a=B.b;

SELECT * FROM A LEFT OUTER JOIN B ON A.a=B.b; 

SELECT * FROM A RIGHT OUTER JOIN B ON A.a=B.b; 

SELECT * FROM A FULL OUTER JOIN B ON A.a=B.b; 

SELECT * FROM A
LEFT JOIN B ON A.a=B.b
UNION
SELECT * FROM A
RIGHT JOIN B ON A.a=B.b

/* Bài 2 */

CREATE TABLE Movies ( id int, name varchar(30), budget int, gross int, rating int, year int, PRIMARY KEY (id) ); 
CREATE TABLE Actors ( id int, name varchar(30), age int, PRIMARY KEY (id) ); 
CREATE TABLE ActsIn ( mid int, aid int, FOREIGN KEY (mid) REFERENCES Movies (id), FOREIGN KEY (aid) REFERENCES Actors (id) ); 
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'Hoan@2501';

SELECT count(*), avg(rating)
FROM Movies as M, ActsIn as A, Actors as B
WHERE M.id=A.mid AND B.id=A.aid AND B.name='Patrick Stewart';

SELECT min(age)
FROM Movies as M, ActsIn as A, Actors as B
WHERE M.id=A.mid AND A.aid=B.id AND gross>1000000000;

SELECT count(gross)
FROM Movies as M, ActsIn as A, Actors as B
WHERE M.year = 2017 and B.age <= 30

/* Bài 3 */

CREATE TABLE Employees (id int, bossOf int); 