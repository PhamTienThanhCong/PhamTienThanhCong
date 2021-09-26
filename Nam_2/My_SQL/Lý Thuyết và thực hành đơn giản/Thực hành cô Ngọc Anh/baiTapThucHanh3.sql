/*bai 1: Đưa ra danh sách các nhân viên có trường reportsTo chưa xác định*/
use classicmodels;
SELECT * FROM employees
WHERE reportsto IS NULL

/*bai 2:Đưa ra danh sách các CustomerNumber đã có thực hiện giao dich */
SELECT * FROM customers
WHERE customernumber in(select customernumber from payments);

/*bai 3:Đưa ra danh sách các đơn hàng có ngày yêu cầu vận chuyển là ‘18/1/2003*/
SELECT * FROM orders
WHERE requiredDate = '2003/1/18';
/*bai 4:Đưa ra danh sách các đơn hàng có ngày đặt trong tháng 4 năm 2005 và có trạng
thái là ‘Shipped’*/
SELECT * FROM orders
WHERE status = 'Shipped';
/*bai 5:Đưa ra danh sách các sản phẩm thuộc nhóm ‘Classic Cars’.*/
SELECT * FROM products
WHERE productLine = 'Classic Cars';


