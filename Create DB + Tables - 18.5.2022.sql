--Create a script that will create Shop database that stores customers ,orders , products with foreign key constrains.
--1 customer can have  0 or multiple orders 
--1 order can have 1 customer 
--1 order can have 0 or multiple products 
--1 product can have 0 or multiple orders

--drop database Shop
create database Shop
go
use Shop
go
--drop table Customers
create table Customers
(
	CustomerId int primary Key,
	CustomerName varchar(256) not null,
	Email varchar(256) unique not null,
	Age int check (Age>12)
)

--drop table Products
create table Products
(
	ProductId int Primary Key,
	ProductName varchar(255) unique not null,
	Price money check (Price>1)
)

--drop table OrdersCustomers
create table OrdersCustomers
(
	OrderId int primary Key,
	CustomerId int not null Foreign Key References Customers(CustomerId),
	Created dateTime default Getdate()
)

--drop table OrdersProducts
create table OrdersProducts
(
	OrderId int not null Foreign Key References OrdersCustomers(OrderId),
	ProductId int not null Foreign Key References Products(ProductId),
	Quantity int not null default 1
	Constraint op Primary Key (OrderId, ProductId)
)
