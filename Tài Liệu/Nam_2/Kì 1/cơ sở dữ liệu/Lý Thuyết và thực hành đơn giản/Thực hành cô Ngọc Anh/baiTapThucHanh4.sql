use classicmodels;

select contactLastName,contactFirstName,phone,addressLine1,city,country
from customers
where city in ('Nantes','Lyon')

select * from orders
where shippedDate between '2003-01-10' and '2003-03-10'

select * from products
where productLine like '%CARS%'

select * from products
order by quantityInStock desc
limit 10;

select productCode, productName, (quantityInStock*buyPrice) as hangtonkho
from products