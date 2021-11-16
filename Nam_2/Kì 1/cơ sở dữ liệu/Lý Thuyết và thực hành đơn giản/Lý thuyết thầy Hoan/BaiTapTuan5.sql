CREATE DATABASE baitap5tesst;
use baitap5tesst;

CREATE TABLE Class (

    dept   VARCHAR(50),

    number INT,

    title  VARCHAR(50),

    PRIMARY KEY (dept, number));

 

CREATE TABLE Instructor (

    username   VARCHAR(50) PRIMARY KEY,

    fname      VARCHAR(50),

    lname      VARCHAR(50),

    started_on CHAR(10));

 

CREATE TABLE Teaches(

    username VARCHAR(50) REFERENCES Instructor,

    dept     VARCHAR(50),

    number   INT,

    PRIMARY KEY (username, dept, number),

    FOREIGN KEY (dept, number) REFERENCES Class(dept, number));

 

INSERT INTO Class VALUES ('CSE',344,'Intro Data Mgmt');

INSERT INTO Class VALUES ('CSE',333,'Systems Prog');

INSERT INTO Class VALUES ('PHIL',242,'Medical Ethics');

INSERT INTO Class VALUES ('CSE',498,'Senior Project');

INSERT INTO Class VALUES ('BIOL',310,'Anatomy');

INSERT INTO Class VALUES ('BIOL',350,'Physiology');

 

INSERT INTO Instructor VALUES ('djw','David','Weatherall','2000');

INSERT INTO Instructor VALUES ('levy','Hank','Levy','1995');

INSERT INTO Instructor VALUES ('maas','Ryan','Maas','2017');

INSERT INTO Instructor VALUES ('self','Casey','Self','2010');

 

INSERT INTO Teaches VALUES ('levy','CSE',333);

INSERT INTO Teaches VALUES ('levy','PHIL',242);

INSERT INTO Teaches VALUES ('maas','CSE',344);

INSERT INTO Teaches VALUES ('djw','CSE',333);

INSERT INTO Teaches VALUES ('self','BIOL',310);

INSERT INTO Teaches VALUES ('self','BIOL',350);

 

SELECT * FROM Class;

SELECT * FROM Instructor;

SELECT * FROM Teaches;
/*bài1*/
select dept from class
where number >= 300 
order by dept desc ;
/*bài 2*/
select distinct dept from class
where number >=300 

/* bài 3*/
select dept, count(dept)  soluonggianvien from Teaches
group by dept
order by soluonggianvien desc
limit 1;