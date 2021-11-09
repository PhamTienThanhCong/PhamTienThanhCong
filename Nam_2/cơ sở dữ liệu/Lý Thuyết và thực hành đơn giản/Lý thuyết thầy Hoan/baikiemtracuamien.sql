create database sinhvien;
use sinhvien;


-- Tạo Bảng
create table SinhVien(
MaSV int not null primary key,
HoTenSV varchar(50) not null,
GioiTinh char(3) not null,
Ngaysinh Datetime not null,
Makhoa char(10) not null
);

create table Diem(
MaSV int not null,
MaMH char(10) not null,
Diem float(2.2) not null,
primary key (MaSV, MaMH)
);

create table MonHoc(
MaMH char(10) primary key, 
TenMH char(50) not null,
SoHocPhan int not null
);

-- Thêm dữ Liệu

insert into SinhVien
    values
        (1, 'Tran Minh Son', 'Nam','2001-03-30','CNTT'),
        (2, 'Nguyen Quoc Bao', 'Nam','2001-09-05','CNTT'),
        (3, 'Phan Anh Tung', 'Nam', '2001-08-07','QTKD'),
        (4, 'Bui Thi Anh Thu', 'Nu','2001-03-05','QTKD'),
        (5, 'Le Thi Lan', 'Nu','2001-09-15','DTVT'),
        (6, 'Nguyen Thi Lam', 'Nu','2001-08-13','DTVT')

insert into MonHoc
    values
		('AV', 'Anh Van',2),
        ('CSDL', 'Co So Du Lieu',2),
        ('KTLT', 'Ki thuat lap trinh',2),
        ('KTTC', 'Ke toan tai chinh',3),
        ('TCC', 'Toan cao cap',4),
        ('THVP', 'Tin hoc van phong',3),
        ('TTNT', 'Tri tue nhan tao',6);

insert into Diem values  (1, 'TCC', 6.5);
insert into Diem values  (2, 'CSDL', 3.6);
insert into Diem values  (3, 'KTTC', 5.5);
insert into Diem values  (4, 'AV', 8.5);
insert into Diem values  (4, 'THVP', 4.0);
insert into Diem values  (5, 'TCC', 7.6);
insert into Diem values  (5, 'AV', 7.5);
insert into Diem values  (6, 'KTLT', 6.5);
insert into Diem values  (6, 'AV', 7.5);

alter table SinhVien 
    add foreign key (MaSV) references Diem(MaSV);
alter table Diem 
    add foreign key (MaMH) references MonHoc(MaMH);
    
-- tìm các sinh vien có họ Nguyễn
select * from sinhvien
where HoTenSV like "nguyen%"

-- lấy sinh viên sinh trong 3 tháng 8-9-10 bằng betwent
select * from sinhvien
where month(Ngaysinh) between 8 and 10

-- dùng truy vấn con tìm hs có số điểm từ 6.5
SELECT * FROM sinhvien
WHERE MaSV in (SELECT MaSV FROM Diem
where Diem > 6.5
)

-- dùng truy vấn con tìm hs có số điểm từ 6.5
SELECT * FROM sinhvien
WHERE MaSV in (SELECT MaSV FROM Diem
group by MaMH
)