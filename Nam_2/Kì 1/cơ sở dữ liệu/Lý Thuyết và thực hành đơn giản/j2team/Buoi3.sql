-- Bài tập (không nên bình luận đáp án, tránh gian lận):

-- Tạo bảng lưu thông tin điểm của sinh viên (mã, họ tên, điểm lần 1, điểm lần 2)

-- Với điều kiện:

-- điểm không được phép nhỏ hơn 0 và lớn hơn 10
-- điểm lần 1 nếu không nhập mặc định sẽ là 5
-- (*) điểm lần 2 không được nhập khi mà điểm lần 1 lớn hơn hoặc bằng 5
-- (**) tên không được phép ngắn hơn 2 ký tự
-- Điền 5 sinh viên kèm điểm
-- Lấy ra các bạn điểm lần 1 hoặc lần 2 lớn hơn 5
-- Lấy ra các bạn qua môn ngay từ lần 1
-- Lấy ra các bạn trượt môn
-- (*) Đếm số bạn qua môn sau khi thi lần 2
-- (**) Đếm số bạn cần phải thi lần 2 (tức là thi lần 1 chưa qua nhưng chưa nhập điểm lần 2)

create database My_sql_tuan3
use My_sql_tuan3

create table sinh_vien(
ma_sv int not null AUTO_INCREMENT,
ho_ten varchar(25) not null check(LENGTH(ho_ten)>=2),
diem_1 float not null default 5 check(diem_1>=0 and diem_1<=10),
diem_2 float check(diem_2>=0 and diem_2<=10),
primary key(ma_sv)
);

-- điểm không được phép nhỏ hơn 0 và lớn hơn 10
alter table sinh_vien
add check(diem_1>=0 and diem_1<=10)

alter table sinh_vien
add check(diem_2>=0 and diem_2<=10)

-- điểm lần 1 nếu không nhập mặc định sẽ là 5
alter table sinh_vien 
alter diem_1 set default 5

-- (*) điểm lần 2 không được nhập khi mà điểm lần 1 lớn hơn hoặc bằng 5
alter table sinh_vien
add constraint check_nhap_diem_lan_2 check((diem_1 >= 5 and diem_2 is null) or diem_1 < 5)

(**) tên không được phép ngắn hơn 2 ký tự
alter table sinh_vien
add check(LENGTH(ho_ten)>=2)

insert into sinh_vien(ho_ten,diem_1,diem_2)
value ('lan',0,null)

select * from sinh_vien

-- Điền 5 sinh viên kèm điểm
select * from sinh_vien
limit 5

-- Lấy ra các bạn điểm lần 1 hoặc lần 2 lớn hơn 5 
select * from sinh_vien
where diem_1 >5 or diem_2 > 5

-- Lấy ra các bạn qua môn ngay từ lần 1
select * from sinh_vien
where diem_1 >= 5

-- Lấy ra các bạn trượt môn
select * from sinh_vien
where diem_1 < 5

-- (*) Đếm số bạn qua môn sau khi thi lần 2

select count(*) diem from sinh_vien_qua_mon
where diem_2 > 5 or diem_1 > 5

select ho_ten, diem_1, diem_2 from sinh_vien
where diem_1 < 5 and diem_2 is null
where diem_2>5 or diem_1>5

-- (**) Đếm số bạn cần phải thi lần 2 (tức là thi lần 1 chưa qua nhưng chưa nhập điểm lần 2)
select ho_ten, diem_1, diem_2 from sinh_vien
where diem_1 < 5 and diem_2 is null

select count(*) Sinh_vien_thi_lai from sinh_vien
where diem_1 < 5 and diem_2 is null