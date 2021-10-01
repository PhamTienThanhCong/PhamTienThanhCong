-- Bài tập (các bạn có thể bình luận đáp án ở đây hoặc trên Discord để mình chữa nhé):

-- Ban lãnh đạo thành phố yêu cầu bạn tạo bảng lưu các con vật trong sở thú

-- Với điều kiện tự bạn quy ước (hãy áp dụng check và default)

-- Sở thú hiện có 7 con
-- Thống kê có bao nhiêu con 4 chân
-- Thống kê số con tương ứng với số chân
-- Thống kê số con theo môi trường sống
-- Thống kê tuổi thọ trung bình theo môi trường sống
-- Lấy ra 3 con có tuổi thọ thọ cao nhất
-- (*) Tách những thông tin trên thành 2 bảng cho dễ quản lý (1 môi trường sống gồm nhiều con)

use my_sql_tuan3

drop table quan_ly_so_thu
create table quan_ly_so_thu(
ma_so int not null auto_increment,
Ten varchar(20) not null,
so_chan int default 4 not null,
tuoi_tho int not null,
moi_truong_song varchar(20) default N'trên cạn' not null,
constraint check_so_chan check(so_chan>=0),
constraint check_tuoi_tho check(tuoi_tho > 0),
constraint check_moi_truong check(moi_truong_song in (N'trên cạn', N'dưới nước')),
primary key(ma_so)
)

insert into quan_ly_so_thu(Ten,so_chan,tuoi_tho,moi_truong_song)
value ('voi',4,30,N'trên cạn'),(N'Rắn',0,5,N'trên cạn'),(N'Khủng Long',2,50,N'trên cạn'),(N'Sư Tử',4,15,N'trên cạn'),
(N'Hà Mã',4,25,N'dưới nước'),(N'Hải Cẩu',2,20,N'dưới nước'),(N'cáp quang',0,35,N'dưới nước')

select * from quan_ly_so_thu

-- Thống kê có bao nhiêu con 4 chân
select count(*) as 'Thu 4 chan' from quan_ly_so_thu
where so_chan = 4

-- Thống kê số con tương ứng với số chân
select so_chan as 'so chan thu',count(*) as 'So luong' from quan_ly_so_thu
group by so_chan
order by so_chan 

-- Thống kê số con theo môi trường sống
select moi_truong_song as 'moi tuong song',count(*) as 'So luong' from quan_ly_so_thu
group by moi_truong_song

-- Thống kê tuổi thọ trung bình theo môi trường sống
select moi_truong_song as 'moi tuong song',avg(tuoi_tho) as '' from quan_ly_so_thu
group by moi_truong_song

-- Lấy ra 3 con có tuổi thọ thọ cao nhất
select Ten as '3 con tuổi thọ cao', tuoi_tho from quan_ly_so_thu
order by tuoi_tho desc
limit 3