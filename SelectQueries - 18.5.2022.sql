--Select all users with orders that have products
select Customers.CustomerId,
	   Customers.CustomerName,
	   OrdersProducts.Quantity
from Customers join OrdersCustomers on Customers.CustomerId = OrdersCustomers.CustomerId
			   join OrdersProducts on OrdersCustomers.OrderId = OrdersProducts.ProductId
where OrdersProducts.Quantity > 0
order By Customers.CustomerId

--Select all users orders summary values (Users.Name, OrderId, Value) fields
select c.CustomerId, c.CustomerName, op.OrderId, Sum(p.Price*op.Quantity) as Value
from Customers c join OrdersCustomers oc on c.CustomerId = oc.CustomerId
				 join OrdersProducts op on oc.OrderId = op.OrderId
				 join Products p on p.ProductId = op.ProductId
Group By c.CustomerName, c.CustomerId, op.OrderId;

select * from OrdersProducts


--Select all users orders that don't have products
select c.CustomerId,
	   c.CustomerName,
	   oc.OrderId,
	   op.Quantity
from Customers c join OrdersCustomers oc ON c.CustomerID = oc.CustomerID
                 LEFT JOIN OrdersProducts op ON op.OrderID = oc.OrderID
				 LEFT JOIN Products p ON p.ProductID = op.ProductID
WHERE op.Quantity < 1 
Order By c.CustomerId;

--Select the products that been ordered the most
select top 2 ProductName, sum(Quantity) as OrderCount 
from Products p join OrdersProducts op on p.ProductId = op.ProductId
group by ProductName
order by OrderCount asc




