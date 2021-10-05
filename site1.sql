drop database BookManagement
select * from [ROOT].BookManagement.dbo.BOOKSTOCK
create database BookManagement
go
select AuthorID, AuthorName, Sex, Nationality, DOB into BookManagement.dbo.AUTHOR_No_Genre from [ROOT].BookManagement.dbo.AUTHOR
select * from BookManagement.dbo.AUTHOR_No_Genre

select CustomerID, CustomerName, City, FAX, Phone into BookManagement.dbo.CUSTOMERS_No_Address from [ROOT].BookManagement.dbo.CUSTOMERS
select * from BookManagement.dbo.CUSTOMERS_No_Address

select * into BookManagement.dbo.BOOKSTOCK_HanoiMoreThan60000 from [ROOT].BookManagement.dbo.BOOKSTOCK where BranchID = 'B0' and UnitPrice > 60000
select * into BookManagement.dbo.BOOKSTOCK_HCMMoreThan60000 from [ROOT].BookManagement.dbo.BOOKSTOCK where BranchID = 'B1' and UnitPrice > 60000

select * into BookManagement.dbo.ORDERS_HanoiLater2021 from [ROOT].BookManagement.dbo.ORDERS where BranchID = 'B0' and OrderDate >= '1-1-2021'
select * from BookManagement.dbo.ORDERS_HanoiLater2021

select * into BookManagement.dbo.BRANCH from [ROOT].BookManagement.dbo.BRANCH
select * into BookManagement.dbo.CATEGORIES from [ROOT].BookManagement.dbo.CATEGORIES
select * into BookManagement.dbo.PUBLISHINGCOMPANY from [ROOT].BookManagement.dbo.PUBLISHINGCOMPANY
