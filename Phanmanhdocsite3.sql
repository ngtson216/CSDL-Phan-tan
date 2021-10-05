use master
go
create database BookManagement
go
use BookManagement
go
create table AUTHOR_NOT_GENRE(
	AuthorID varchar(2) NOT NULL,
	AuthorName nvarchar(30) NOT NULL,
	Sex nvarchar(20),
	Nationality nvarchar(20),
	DOB date,
)
insert into AUTHOR_NOT_GENRE ( AuthorID, AuthorName, Sex, Nationality, DOB)
select AuthorID, AuthorName, Sex, Nationality, DOB 
from [ROOT].BookManagement.dbo.AUTHOR;

select * from AUTHOR_NOT_GENRE
go
create table CUSTOMERS_NOT_ADDRESS(
	CustomerID varchar(2) NOT NULL,
	CustomerName nvarchar(30) NOT NULL,
	City nvarchar(20),
	FAX nvarchar(20),
	Phone nvarchar(15),
)
insert into CUSTOMERS_NOT_ADDRESS (CustomerID, CustomerName, City, FAX, Phone)
select CustomerID, CustomerName, City, FAX, Phone
from [ROOT].BookManagement.dbo.CUSTOMERS;

select * from CUSTOMERS_NOT_ADDRESS