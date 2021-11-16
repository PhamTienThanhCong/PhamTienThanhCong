create database kthk;

use kthk;

CREATE TABLE Person (
    pid int not null,
    name varchar(255),
    street varchar(255),
    postcode varchar(255),
    primary key (pid)
);

CREATE TABLE Car (
    cid int not null,
    year int,
    model varchar(255),
    primary key (cid)
);

CREATE TABLE OwnedBy (
	pid int not null,
    cid int not null,
    primary key (pid, cid)
);

CREATE TABLE AccidentReport (
	rid int not null,
	damage int,
    details varchar(255),
    primary key (rid)
);

CREATE TABLE ParticipatedIn (
	pid int not null,
    rid int not null,
    cid int not null,
    primary key (pid, rid, cid)
);

ALTER TABLE OwnedBy ADD FOREIGN KEY(pid) REFERENCES Person(pid);

ALTER TABLE OwnedBy ADD FOREIGN KEY(cid) REFERENCES Car(cid);

ALTER TABLE ParticipatedIn ADD FOREIGN KEY(cid) REFERENCES OwnedBy(cid);

ALTER TABLE ParticipatedIn ADD FOREIGN KEY(rid) REFERENCES AccidentReport(rid);


-- 1. Viết một truy vấn SQL trả về mã pid của những người lái xe trong ít nhất một tai nạn, mà không có sự trùng lặp
Select distinct pid 
From ParticipatedIn

-- 2. Viết một truy vấn SQL trả về tất cả các bộ (pid, c), trong đó c là số xe được sở hữu bởi người có mã pid (các bản ghi mà c=0 không cần phải tạo ra)
Select pid, count(cid) From OwnedBy
Where count(cid) not is 0
Group by pid

-- 3. Viết một lệnh SQL truy vấn tất cả các bộ (cid, c) trong đó c là số người sở hữu xe (các bản ghi c=0 không cần phải tạo ra)
Select count(pid), cid
    From OwnedBy
Where count(pid) not is 0
Group by cid

-- 4. Viết một truy vấn lồng nhau (nested) để trả về tất cả các bộ (pid,rid) trong đó pid lái xe trong vụ tai nạn được báo báo trong rid, nhưng xe được lái bởi người có mã pid không phải là xe được sở hữu bởi người có mã pid.
Select p.pid , p.rid from ParticipatedIn p
Join OwnedBy or on p.pid = o.pid
where p.cid not in ( Select cid from OwnedBy);

-- 5. Viết một truy vấn SQL trả về tất cả các bản ghi (rid,c) trong đó c là số những người lái xe có liên quan đến vụ tai nạn được báo cáo bởi rid (các bản ghi trong đó c=0 không cần phải sinh ra)
Select  AccidentReport.rid,ParticipatedIn.c 
from AccidentReport join ParticipatedIn on AccidentReport.rid = ParticipatedIn.rid
Where count(pid) = 0;

-- 6. Viết một truy vấn SQL trả về tất cả các bản ghi (rid,c), trong đó c là số ô tô có liên quan đến vụ tai nạn được báo cáo bởi rid (các bản ghi trong đó c=0 không cần phải được tạo ra)
select rid,cid as c from ParticipatedIn 
where cid != 0
