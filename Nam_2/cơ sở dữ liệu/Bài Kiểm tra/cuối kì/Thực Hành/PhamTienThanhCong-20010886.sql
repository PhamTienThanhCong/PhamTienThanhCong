create database QLCONGTRINH;
use QLCONGTRINH;

-- Câu 1: Thiết kế CSDL QLCONGTRINH BẢNG(quản lý công trình) gồm các bảng như sau:

CREATE TABLE Donvixaydung (
  Madv VARCHAR(10) NOT NULL,
  Tendv VARCHAR(45) NULL,
  Socb INT NULL,
  PRIMARY KEY (Madv)
  );

  CREATE TABLE Congtrinh (
  Mact VARCHAR(10) NOT NULL,
  Tenct VARCHAR(45) NULL,
  Madv VARCHAR(10) NULL,
  PRIMARY KEY (Mact)
  );

  CREATE TABLE hangmuc (
  Mahm VARCHAR(10) NOT NULL,
  Tenhm VARCHAR(45) NULL,
  Capdo INT NULL,
  PRIMARY KEY (Mahm)
  );

  CREATE TABLE thicong (
  Mact VARCHAR(10) NULL,
  Mahm VARCHAR(10) NULL,
  Ngaythicong DATETIME NULL,
  Songaylam INT NULL,
  Madv VARCHAR(10) NULL
  );
  
alter table thicong add foreign key(Mact) references congtrinh(Mact);
alter table thicong add foreign key(Mahm) references hangmuc(Mahm);
alter table thicong add foreign key(Madv) references Donvixaydung(Madv);
alter table congtrinh add foreign key(Madv) references Donvixaydung(Madv);

insert into Donvixaydung(Madv,Tendv,Socb)
values ("HB","công ty địa ốc hoà bình",1000),
("SĐ","công ty Sông Đà",2000),
("SH","công ty tnhh sông hồng",1500),
("DT","công ty cổ phần Denta",3000),
("FLC","Tập đoàn FLC",5000);

insert into Hangmuc
values ("HT", "Hạ tầng", 1),
("PT", "Phần thô", 2),
("SV", "Sân vườn", 3), 
("TH", "Tầng hầm", 1), 
("BB", "Bể bơi", 1);

insert into Congtrinh(Mact, Tenct, Madv)
values ("CT01", "Toà nhà kengnam", "HB"),
("CT02", "Trung tâm thương mại tràng tiền Plaza", "DT"),
("CT03", "Sân vận động quốc gia", "HB"),
("CT04", "Toà nhà quốc hội", "HB"),
("CT05", "Bảo tàng hà nội", "DT");

insert into Thicong(Mact, Mahm,  Ngaythicong, Songaylam, Madv)
values ("CT01", "HT",  "2018/2/10", 365, "HB"),
("CT02", "PT",  "2021/2/15", 500, "SĐ"),
("CT01", "SV",  "2019/2/10", 100, "HB"),
("CT02", "TH",  "2020/1/10", 1000, "SĐ"),
("CT04", "HT",  "2018/2/10", 1000, "DT");

-- Câu 2: Dựa vào csdl trên thực hiện các truy vấn sau:
-- a.	Hãy đưa ra danh sách các công trình ở quận Hoàn kiếm biết rằng nếu công trình ở quận Tây Hồ có mã công trình “CT02”, thông tin gồm mã công trình, tên công trình (1 điểm)
select * from Congtrinh
where Mact = "CT02";

-- b.	Liệt kê đơn vị xây dựng có nhiều dự án  nhất, thông tin hiển thị gồm: Mã đơn vị, Tên đơn vị, số dự án tham gia. (1.5 điểm)
Select dv.Madv, Tendv, count(*) Soduanthamgia
from donvixaydung dv join congtrinh ct
on dv.Madv = ct.Madv
Group by Madv
Order by Soduanthamgia desc
Limit 1;

-- c.	Cho biết danh sách các công trình có ngày thi công trước trước 1/1/2020 và có số ngày làm vượt quá 365 ngày, thông tin hiển thị gồm: Mã công trình, tên công trình, ngày thi công, tên đơn vị thi công (1.5 điểm)
Select ct.Mact, Tenct, Ngaythicong, Tendv
    from congtrinh ct 
    join thicong tc on ct.Mact = tc.Mact
    join donvixaydung dv on tc.Madv = dv.Madv
    where Ngaythicong < '20200101'
        and tc.Songaylam > 365;

-- d.	Cập nhật thông tin trên bảng Công trình tên công trình “ Toà nhà quốc hội” thành “ Trung tâm hội nghị quốc gia”(1 điểm)
update congtrinh
set Tenct='Trung tâm hội nghị quốc gia'
where tenct ='Toà nhà quốc hội';

-- e.	Xoá tất cả các đơn vị xây dựng chưa từng tham gia công trình nào cả. ( 1 điểm)
delete from donvixaydung
where Madv not in (select Madv from thicong)
