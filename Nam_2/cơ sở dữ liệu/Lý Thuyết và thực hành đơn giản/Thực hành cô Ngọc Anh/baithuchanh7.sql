use classicmodels;

-- 1. Đưa ra thông tin về các nhân viên và tên văn phòng nơi họ làm việc

SELECT concat_ws(' ',lastName,firstName) as 'full name',offices.addressLine1, offices.city from employees
inner join offices on employees.officeCode = offices.officeCode;


-- 2. Đưa ra thông tin về tên khách hàng và tên các sản phẩm họ đã mua.

SELECT customerName,productName from customers C
inner join orders O on C.customerNumber = O.customerNumber
INNER JOIN orderdetails OD on O.orderNumber = OD.orderNumber
inner join products P on OD.productCode= P.productCode
group by customerName desc;
-- 3. Đưa ra thông tin về các mặt hàng chưa có ai đặt mua.

select * from products
where productCode  not in(select productCode from orderdetails);


-- 4. Đưa ra các đơn hàng trong tháng 3/2005 (gồm orderDate, requiredDate, Status) và tổng giá trị của mỗi đơn hàng .
SELECT orderDate, requiredDate, Status,priceEach FROM orders 
inner join orderdetails on orders.orderNumber = orderdetails.orderNumber
where year(orderDate) =2005 and month(orderDate)
group by orderDate;

-- 5. Đưa ra thông tin về các dòng sản phẩm và số lượng sản phẩm của dòng sản phẩm đó. Sắp xếp theo thứ tự số lượng giảm dần.
SELECT productLine FROM  products;
order by productLine asc
inner join products on productlines.productLine  = products.productLine







