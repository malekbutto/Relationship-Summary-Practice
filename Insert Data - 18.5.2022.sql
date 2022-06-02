use Shop
go
--Create a script to Insert some customers , products, orders data to the tables , all the insert should be wrapped in a try catch , transaction.

--Insert Data to Customers Table
--Delete from Customers
begin try
	begin tran
	insert into Customers Values (1,'David Joe','david@gmail.com',25)
	insert into Customers Values (2,'Malek Butto','malek@gmail.com',36)
	insert into Customers Values (3,'Massimo Sandri','massimo@gmail.com',60)
	insert into Customers Values (4,'Amnon Nesher','amnon@gmail.com',70)
	insert into Customers Values (5,'Yahia Butto','yahia@gmail.com',15)
	--insert into Customers Values (6,'Farouq Butto','yahia@gmail.com',5) //Conflict with Check constraint (Age>12)

--Insert Data to Products Table
--Delete from Products
	insert into Products Values (1,'Laptop', 5000)
	insert into Products Values (2,'IPhone', 4200)
	insert into Products Values (3,'Mouse', 320)
	insert into Products Values (4,'Tablet', 2400)
	insert into Products Values (5,'Speaker', 600)
	insert into Products Values (6,'Printer', 1200)
	--insert into Products Values (7,'Network Cable', 0.5) //Conflict with Check constraint (Price>1)

--Insert Data to OrdersCustomers Table
--Delete from OrdersCustomers
	insert into OrdersCustomers (OrderId,CustomerId) Values (1,2)
	insert into OrdersCustomers (OrderId,CustomerId) Values (2,1)
	insert into OrdersCustomers (OrderId,CustomerId) Values (3,4)
	insert into OrdersCustomers (OrderId,CustomerId) Values (4,3)
	insert into OrdersCustomers (OrderId,CustomerId) Values (5,5)
	insert into OrdersCustomers (OrderId,CustomerId) Values (6,4)
	insert into OrdersCustomers (OrderId,CustomerId) Values (7,5)
	insert into OrdersCustomers (OrderId,CustomerId) Values (8,2)

--Insert Data to OrdersProducts Table
--Delete from OrdersProducts
	insert into OrdersProducts (OrderId,ProductId,Quantity) Values (1,1,3)--laptop
	insert into OrdersProducts (OrderId,ProductId,Quantity) Values (4,2,2)--IPhone
	insert into OrdersProducts (OrderId,ProductId,Quantity) Values (3,6,0)--Printer
	insert into OrdersProducts (OrderId,ProductId,Quantity) Values (5,3,4)--Mouse
	insert into OrdersProducts (OrderId,ProductId,Quantity) Values (2,5,6)--Speaker
	insert into OrdersProducts (OrderId,ProductId,Quantity) Values (6,4,0)--Tablet
	insert into OrdersProducts (OrderId,ProductId,Quantity) Values (7,2,4)--IPhone
	insert into OrdersProducts (OrderId,ProductId,Quantity) Values (8,6,1)--Laptop
	Commit tran
	Print ('Commit tran, Transaction successed')
end try
begin catch
	Rollback Transaction
	Print ('Rollback tran, Transaction failed' + Error_Message())
end catch