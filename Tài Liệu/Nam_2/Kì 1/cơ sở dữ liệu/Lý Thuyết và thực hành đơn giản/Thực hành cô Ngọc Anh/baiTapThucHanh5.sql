-- 1. Lấy ra 50 ký tự đầu tiên của phần mô tả sản phẩm, đặt tên là ‘Title of products’
-- 2. Đưa ra mô tả về các nhân viên theo định dạng ‘Fullname, jobTitle.’
-- 3. Thay thế toàn bộ tên nhóm hàng ‘Cars’ thành ‘Automobiles’.
-- 4. Tìm 5 đơn hàng được vận chuyển sớm nhất so với ngày yêu cầu.
-- 5. Đưa ra các đơn đặt hàng trong tháng 5 năm 2005 và có ngày chuyển hàng đến chưa xác định.

use classicmodels

-- 1. Lấy ra 50 ký tự đầu tiên của phần mô tả sản phẩm, đặt tên là ‘Title of products’
select substring(productName,1,50) 'Title of products' from products

-- 2. Đưa ra mô tả về các nhân viên theo định dạng ‘Fullname, jobTitle.’
select concat(lastName,' ',firstName,', ',jobTitle) as 'Fullname, jobTitle' from employees

-- 3. Thay thế toàn bộ tên nhóm hàng ‘Cars’ thành ‘Automobiles’.

-- 4. Tìm 5 đơn hàng được vận chuyển sớm nhất so với ngày yêu cầu.
select *  from orders
where shippedDate is not null
order by (shippedDate - orderDate)
limit 5

-- 5. Đưa ra các đơn đặt hàng trong tháng 5 năm 2005 và có ngày chuyển hàng đến chưa xác định.
select *  from orders
where shippedDate is null and (year(orderDate)=2005 and month(orderDate)=5)