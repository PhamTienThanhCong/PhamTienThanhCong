-- Tạo bảng lưu thông tin khách hàng (mã, họ tên, số điện thoại, địa chỉ, giới tính, ngày sinh)

-- Thêm 5 khách hàng
-- Hiển thị chỉ họ tên và số điện thoại của tất cả khách hàng
-- Cập nhật khách có mã là 2 sang tên Tuấn
-- Xoá khách hàng có mã lớn hơn 3 và giới tính là Nam
-- (*) Lấy ra khách hàng sinh tháng 1
-- (*) Lấy ra khách hàng có họ tên trong danh sách (Anh,Minh,Đức) và giới tính Nam hoặc chỉ cần năm sinh trước 2000
-- (**) Lấy ra khách hàng có tuổi lớn hơn 18
-- (**) Lấy ra 3 khách hàng mới nhất
-- (**) Lấy ra khách hàng có tên chứa chữ T
-- (***) Thay đổi bảng sao cho chỉ nhập được ngày sinh bé hơn ngày hiện tại

create database SQL_Tuan2
use SQL_Tuan2

drop table khach_hang

/*tạo bảng */
create table khach_hang(
ma_khach_hang int not null,
ten_khach_hang varchar(25),
so_dien_thoai char(15),
dia_chi varchar(40),
gioi_tinh char(4), 
ngay_sinh date CHECK(ngay_sinh<DATE('2021-09-23')),
primary key(ma_khach_hang)
)

SELECT DATE(NOW()) 
as CurrDateTime ;

select * from khach_hang 

/*Thêm 5 khách hàng */

insert into khach_hang(ma_khach_hang,ten_khach_hang,so_dien_thoai,dia_chi,gioi_tinh,ngay_sinh)
value (1,N'Đức','0396396332','Quang Ninh provice','nam','1999-02-02'),(2,N'Toàn','0396396333','Quang Nam provice','nam','1987-01-12'),
(3,'Anh','0396396222','Ha Noi provice','nu','1966-01-26'),(4,'Minh','0322226332','Quang Ninh provice','nam','2000-09-05'),
(5,N'Hạnh','0343396431','Ho Chi Minh','nu','2004-04-14'), (6,'Minh','0343396431','Ho Chi Minh','nu','2003-04-14'),
(7,N'Hòa','0343396431','Ho Chi Minh','nu','2003-09-24')


/*Hiển thị chỉ họ tên và số điện thoại của tất cả khách hàng */
select ten_khach_hang,so_dien_thoai from khach_hang

/*Cập nhật khách có mã là 2 sang tên Tuấn */
update khach_hang
set ten_khach_hang = N'Tuấn'
where ma_khach_hang = 2

/*Xoá khách hàng có mã lớn hơn 3 và giới tính là Nu */
delete from khach_hang
where ma_khach_hang > 3 and gioi_tinh='nu'

/*Trích xuất  
Lấy ra khách hàng sinh tháng 1 */
select * from khach_hang
where EXTRACT(MONTH FROM ngay_sinh) = '01'


/*Lấy ra khách hàng có họ tên trong danh sách (Anh,Minh,Đức) và giới tính Nam hoặc chỉ cần năm sinh trước 2000 */
select * from khach_hang
where (ten_khach_hang in ('Anh','Minh',N'Đức')) and (gioi_tinh='nam' or EXTRACT(YEAR from ngay_sinh)<2000)

/*Lấy ra khách hàng có tuổi lớn hơn 18 */
select * from khach_hang
where CURDATE()-ngay_sinh > 180000

select ten_khach_hang,ngay_sinh,(CURDATE()-ngay_sinh) tuoi from khach_hang

/*Lấy ra 3 khách hàng mới nhất */
select * from khach_hang
order by ma_khach_hang desc
limit 3

/*Lấy ra khách hàng có tên chứa chữ T*/
select * from khach_hang
where ten_khach_hang like '%T%'

/*Thay đổi bảng sao cho chỉ nhập được ngày sinh bé hơn ngày hiện tại*/

ALTER TABLE khach_hang
ADD CHECK (ngay_sinh<curdate);