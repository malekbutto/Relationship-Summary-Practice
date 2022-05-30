--Select all users with orders that have products
select Customers.CustomerId,
	   Customers.CustomerName,
	   OrdersCustomers.OrderId,
	   OrdersProducts.Quantity
from Customers
join OrdersCustomers
on Customers.CustomerId = OrdersCustomers.CustomerId
join OrdersProducts
on OrdersCustomers.OrderId = OrdersProducts.ProductId
where OrdersProducts.Quantity > 0
order By Customers.CustomerId

--Select all users orders summary values (Users.Name, OrderId, Value) fields
select Customers.CustomerId,
	   Customers.CustomerName,
	   OrdersCustomers.OrderId
from OrdersProducts
join OrdersCustomers
on OrdersCustomers.OrderId = OrdersProducts.OrderId
join Customers
on Customers.CustomerId = OrdersCustomers.CustomerId
Order By Customers.CustomerId

--Select all users orders that don't have products
select Customers.CustomerId,
	   Customers.CustomerName,
	   OrdersCustomers.OrderId,
	   OrdersProducts.Quantity
from OrdersCustomers
left join OrdersProducts
on OrdersCustomers.OrderId = OrdersProducts.OrderId
join Customers
on Customers.CustomerId = OrdersProducts.OrderId
where OrdersProducts.Quantity = 0
Order By Customers.CustomerId

--top 1 count(productName) as quantity
--Select the products that been ordered the most
select top 1 count(productName) as quantity, productName
from Products
join OrdersProducts
on Products.ProductId = OrdersProducts.ProductId
group by ProductName
order by count(productName) desc
