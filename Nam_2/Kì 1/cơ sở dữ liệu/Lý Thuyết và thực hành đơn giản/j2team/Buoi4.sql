-- Bài tập tổng hợp kiến thức (sau mỗi 3 buổi mình sẽ đăng 1 bài thế này, các bạn có thể bình luận đáp án ở đây hoặc trên Discord để xem ai có câu trả lời chính xác nhất nhé):

-- Sếp yêu cầu bạn thiết kế cơ sở dữ liệu quản lý lương nhân viên

-- Với điều kiện:

-- mã nhân viên không được phép trùng
-- lương là số nguyên dương
-- tên không được phép ngắn hơn 2 ký tự
-- tuổi phải lớn hơn 18
-- giới tính mặc định là nữ
-- ngày vào làm mặc định là hôm nay
-- (*) nghề nghiệp phải nằm trong danh sách ('IT','kế toán','doanh nhân thành đạt')
-- tất cả các cột không được để trống
-- Công ty có 5 nhân viên
-- Tháng này sinh nhật sếp, sếp tăng lương cho nhân viên sinh tháng này thành 100. (*: tăng lương cho mỗi bạn thêm 100)
-- Dịch dã khó khăn, cắt giảm nhân sự, cho nghỉ việc bạn nào lương dưới 50. (*: xoá cả bạn vừa thêm 100 nếu lương cũ dưới 50). (**: đuổi cả nhân viên mới vào làm dưới 2 tháng)
-- Lấy ra tổng tiền mỗi tháng sếp phải trả cho nhân viên. (*: theo từng nghề)
-- Lấy ra trung bình lương nhân viên. (*: theo từng nghề)
-- (*) Lấy ra các bạn mới vào làm hôm nay
-- (*) Lấy ra 3 bạn nhân viên cũ nhất
-- (**) Tách những thông tin trên thành nhiều bảng cho dễ quản lý, lương 1 nhân viên có thể nhập nhiều lần

use my_sql_tuan3

drop table nhan_vien

create table nhan_vien(
ma int not null unique auto_increment,
ten varchar(25) not null check(length(ten)>=2),
tuoi date not null check(tuoi <= '2003-09-25'),
gioi_tinh char(4) default 'nu',
nghe_nghiep varchar(50) not null, 
check(nghe_nghiep = 'IT' or nghe_nghiep = N'kế toán' or nghe_nghiep = N'doanh nhân thành đạt'),
luong int not null check(luong >= 0), 
ngay_vao_lam date not null default '2021-09-25',
primary key(ma)
)

delete from nhan_vien

insert into nhan_vien(ten,tuoi,gioi_tinh,nghe_nghiep,luong,ngay_vao_lam)
value ('Hoa','2002-09-25','nu',N'kế toán',66),('loan','2002-03-01','nu',N'kế toán',56,'2018-03-05'),(N'Hạnh','2003-04-14','nu',N'doanh nhân thành đạt',89,'2021-03-05'),
('long','1995-08-18','nam','IT',88,'2013-02-25'),(N'Công','2002-02-22','nam','IT',13,'2020-10-10'),
(N'Tuấn','1996-07-27','nam',N'doanh nhân thành đạt',69,'2014-03-05'),(N'Yên','2001-12-23','nu',N'kế toán',23,'2020-06-20')

select * from nhan_vien

update nhan_vien
set luong=luong+100
where EXTRACT(month from tuoi) = EXTRACT(month from curtime())

delete from nhan_vien
where ((EXTRACT(month from tuoi) = EXTRACT(month from curtime())) and (luong - 100 <50) ) or (luong<50)

select nghe_nghiep, sum(luong) as 'tong luong' from nhan_vien
group by nghe_nghiep

select nghe_nghiep,sum(luong)/count(*) 'trung binh' from nhan_vien
group by nghe_nghiep

select * from nhan_vien
where ngay_vao_lam = curdate()

select * from nhan_vien
limit 3
