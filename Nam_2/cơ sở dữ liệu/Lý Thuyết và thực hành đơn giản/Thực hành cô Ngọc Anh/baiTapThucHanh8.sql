create database qldiem;
use qldiem;

create table SinhVien(
MaSV char(10) primary key,
HoSV nvarchar(50),
Ten nvarchar(50), 
Ngaysinh Datetime,
Phai nchar(3), 
Makhoa char(10));

create table Khoa(
Makhoa char(10) primary key,
 Tenkhoa nvarchar(50));
 
create table MonHoc(
MaMH char(10) primary key, 
TenMH nvarchar(50));

create table KetQua(
MaSV char(10), 
MaMH char(10), 
Lanthi int, 
Diem numeric(5,1),
primary key (MaSV,MaMH,Lanthi,Diem));

insert into Khoa(Makhoa,Tenkhoa) values 
('AVAN','Khoa Anh Van'),
('CNTT','Khoa cong nghe thong tin'),
('DTVT','Khoa dien tu vien thong'),
('QTKD','Khoa Quan Tri kinh doanh');

insert into SinhVien
    values
        ('S001', 'Tran Minh', 'Son', '19850501', 'Nam', 'CNTT'),
        ('S002', 'Nguyen Quoc', 'Bao', '19860516', 'Nam', 'CNTT'),
        ('S003', 'Phan Anh', 'Tung', '19831220', 'Nam', 'QTKD'),
        ('S004', 'Bui Thi Anh', 'Thu', '19850201', 'Nu', 'QTKD'),
        ('S005', 'Le Thi', 'Lan', '19870703', 'Nu', 'DTVT'),
        ('S006', 'Nguyen Thi','Lam','19841111', 'Nu', 'DTVT'),
        ('S007', 'Phan Thi', 'Ha', '19880703', 'Nu', 'CNTT'),
        ('S008', 'Tran The', 'Dung', '19851021', 'Nam', 'CNTT');


insert into MonHoc
    values
        ('AV', 'Anh Van'),
        ('CSDL', 'Co So Du Lieu'),
        ('KTLT', 'Ki thuat lap trinh'),
        ('KTTC', 'Ke toan tai chinh'),
        ('TCC', 'Toan cao cap'),
        ('THVP', 'Tin hoc van phong'),
        ('TTNT', 'Tri tue nhan tao');

insert into KetQua
values  ('S001', 'CSDL', 1, 4),
        ('S001', 'TCC', 1, 6),
        ('S002', 'CSDL', 1, 3),
        ('S002', 'CSDL', 2, 6),
        ('S003', 'KTTC', 1, 5),
        ('S004', 'AV', 1, 8),
        ('S004', 'THVP', 1, 4),
        ('S004', 'THVP', 2, 8),
        ('S006', 'TCC', 1, 5),
        ('S007', 'AV', 1, 2),
        ('S007', 'AV', 2, 9),
        ('S007', 'KTLT', 1, 6),
        ('S008', 'AV', 1, 7);

alter table KetQua 
    add foreign key (MaSV) references SinhVien(MaSV);
alter table KetQua 
    add foreign key (MaMH) references MonHoc(MaMH);
        
UPDATE qldiem.monhoc SET sotiet = '45' WHERE (MaMH = AV);

UPDATE qldiem.monhoc SET sotiet = '45' WHERE (MaMH = CSDL);

UPDATE qldiem.monhoc SET sotiet = '60' WHERE (MaMH = KTLT);

UPDATE qldiem.monhoc SET sotiet = '45' WHERE (MaMH = KTTC);

UPDATE qldiem.monhoc SET sotiet = '60' WHERE (MaMH = TCC);

UPDATE qldiem.monhoc SET sotiet = '30' WHERE (MaMH = THVP);

UPDATE qldiem.monhoc SET sotiet = '60' WHERE (MaMH = TTNT);