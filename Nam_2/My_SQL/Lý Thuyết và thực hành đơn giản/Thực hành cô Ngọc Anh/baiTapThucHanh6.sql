-- Bài tập thực hành
-- 1. Đưa ra tên các thành phố và số lượng khách hàng tại từng thành phố.
-- 2. Đưa ra số lượng các đơn đặt hàng trong tháng 3/2005.
-- 3. Đưa ra số lượng các đơn đặt hàng trong từng tháng của năm 2005
-- 4. Đưa ra 10 mã đơn đặt hàng có giá trị lớn nhất.
-- 5. Đưa ra mã nhóm hàng và tổng số lượng hàng hoá còn trong kho của nhóm hàng đó.

use classicmodels

-- 1. Đưa ra tên các thành phố và số lượng khách hàng tại từng thành phố.
select city, count(*) so_luong_khanh_hang from customers
group by city

-- 2. Đưa ra số lượng các đơn đặt hàng trong tháng 3/2005.
select orderDate, count(orderDate) as so_don_dat_hang from orders
where Extract(year from orderDate)='2005' and month(orderDate) = '3'

-- 3. Đưa ra số lượng các đơn đặt hàng trong từng tháng của năm 2005
select orderDate, count(orderDate) as so_don_dat_hang from orders
where Extract(year from orderDate)='2005'
group by month(orderDate)

-- 4. Đưa ra 10 mã đơn đặt hàng có giá trị lớn nhất.
select * from orderdetails
order by priceEach desc
limit 10

select * from products
-- 5. Đưa ra mã nhóm hàng và tổng số lượng hàng hoá còn trong kho của nhóm hàng đó.
select productLine,sum(quantityInStock) from products
group by productLine