use master
go
create database BookManagement
go
use BookManagement
go
create table AUTHOR_GENRE(
	AuthorID varchar(2) NOT NULL,
	Genre nvarchar(60),
)
insert into AUTHOR_GENRE ( AuthorID, Genre)
select AuthorID, Genre 
from [ROOT].BookManagement.dbo.AUTHOR;

select * from AUTHOR_GENRE
GO 

create table CUSTOMERS_ADDRESS(
	CustomerID varchar(2) NOT NULL,
	Address nvarchar(60),
)
insert into CUSTOMERS_ADDRESS (CustomerID, Address)
select CustomerID, Address 
from [ROOT].BookManagement.dbo.CUSTOMERS;

select * from CUSTOMERS_ADDRESS

select * into BookManagement.dbo.BOOKSTOCK from [ROOT].BookManagement.dbo.BOOKSTOCK;
select * into BookManagement.dbo.BRANCH from [ROOT].BookManagement.dbo.BRANCH;
select * into BookManagement.dbo.CATEGORIES from [ROOT].BookManagement.dbo.CATEGORIES;
select * into BookManagement.dbo.ORDERS from [ROOT].BookManagement.dbo.ORDERS;
select * into BookManagement.dbo.PUBLISHINGCOMPANY from [ROOT].BookManagement.dbo.PUBLISHINGCOMPANY;