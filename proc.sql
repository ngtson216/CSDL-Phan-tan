use BookManagement
go
-- INSERT
-- tao thu tuc insert cho bang BRANCH
create proc insert_branch(@BranchID varchar(2), @BranchName nvarchar(20))
as
begin
	if exists (select BranchID from [BRANCH] where BranchID = @BranchID)
	begin
		raiserror('Khong the them vao branchID da co',16,1);
		rollback tran
	end
	else
		insert into BRANCH(BranchID, BranchName)
		values (@BranchID, @BranchName)
	
end
go
-- tao thu tuc insert cho bang CATEGORIES
create proc insert_categories(@CategoryID varchar(2), @CategoryName nvarchar(3), @Description ntext)
as
begin
	if exists (select CategoryID from [CATEGORIES] where CategoryID = @CategoryID)
	begin
		raiserror('Khong the them vao categoryID da co',16,1);
		rollback tran
	end
	else
		insert into CATEGORIES(CategoryID, CategoryName, Description)
		values(@CategoryID, @CategoryName, @Description)
	
end
go
-- tao thu tuc insert cho bang PUBLISHINGCOMPANY
create proc insert_publCom @PublCompanyID varchar(2), @PublCompanyName nvarchar(30), @Address nvarchar(60), @City nvarchar(20), @FAX nvarchar(20), @PostalCode nvarchar(10), @Phone nvarchar(15)
as
begin
	if exists (select PublCompanyID from [PUBLISHINGCOMPANY] where PublCompanyID = @PublCompanyID)
	begin
		raiserror('Khong the them vao PublCompanyID da co',16,1);
		rollback tran
	end
	else
		insert into PUBLISHINGCOMPANY(PublCompanyID, PublCompanyName, Address, City, FAX, Phone, PostalCode)
		values(@PublCompanyID, @PublCompanyName, @Address, @City, @FAX, @PostalCode, @Phone)

end
go
-- tao thu tuc insert cho bang AUTHOR
create proc insert_author @AuthorID varchar(2), @AuthorName nvarchar(30), @Genre nvarchar(60), @Sex nvarchar(20), @Nationality nvarchar(20), @DOB date
as
begin
	if (exists (select AuthorID from [AUTHOR_No_Genre] where AuthorID = @AuthorID) 
	   or exists (select AuthorID from [LINKS1TOS2].BookManagement.dbo.AUTHOR_Genre where AuthorID = @AuthorID) 
	   or exists (select AuthorID from [LINKS1TOS3].BookManagement.dbo.AUTHOR_Genre where AuthorID = @AuthorID))  
	begin
		raiserror('Khong the them vao AuthorID da co',16,1);
		rollback
	end
	else
		begin
		insert into AUTHOR_No_Genre(AuthorID, AuthorName, Sex, Nationality, DOB)
		values(@AuthorID, @AuthorName, @Sex, @Nationality, @DOB)
		insert into [LINKS1TOS2].BookManagement.dbo.AUTHOR_Genre(AuthorID, Genre)
		values(@AuthorID, @Genre)
		insert into [LINKS1TOS3].BookManagement.dbo.AUTHOR_Genre(AuthorID, Genre)
		values(@AuthorID, @Genre)
		end
end
GO
exec insert_author '06', 'Cassana Clare', 'Truyen ngan', 'Nu', 'England', '7-31-1965'
go
SELECT * FROM [LINKS1TOS2].BookManagement.dbo.AUTHOR_Genre
SELECT * FROM [LINKS1TOS3].BookManagement.dbo.AUTHOR_Genre
SELECT * FROM AUTHOR_No_Genre
go

-- tao thu tuc insert cho bang CUSTOMERS
create proc insert_customers @CustomerID varchar(2), @CustomerName nvarchar(30), @Address nvarchar(60), @City nvarchar(20), @FAX nvarchar(20), @Phone nvarchar(15)
as
begin
	if (exists (select CustomerID from CUSTOMERS_No_Address where CustomerID = @CustomerID) 
	   or exists (select CustomerID from [LINKS1TOS2].BookManagement.dbo.CUSTOMERS_Address where CustomerID = @CustomerID) 
	   or exists (select CustomerID from [LINKS1TOS3].BookManagement.dbo.CUSTOMERS_Address where CustomerID = @CustomerID))  
	begin
		raiserror('Khong the them vao CustomerID da co',16,1);
		rollback
	end
	else
		begin
		insert into CUSTOMERS_No_Address(CustomerID, CustomerName, City, FAX, Phone)
		values(@CustomerID, @CustomerName, @City, @FAX, @Phone)
		insert into [LINKS1TOS2].BookManagement.dbo.CUSTOMERS_Address(CustomerID, Address)
		values(@CustomerID, @Address)
		insert into [LINKS1TOS3].BookManagement.dbo.CUSTOMERS_Address(CustomerID, Address)
		values(@CustomerID, @Address)
		end
end
GO
-- tao thu tuc insert cho bang BOOKSTOCK
create proc insert_bookstock @BookID varchar(2), @BookName nvarchar(30), @UnitPrice money, @UnitsInStock smallint,
							 @UnitsOnOrder smallint, @AuthorID varchar(2), @PublCompanyID varchar(2), @CategoryID varchar(2), @BranchID varchar(2)
as
begin
	if (exists (select BookID from BOOKSTOCK_HanoiMoreThan60000 where BookID = @BookID) 
	   or exists (select BookID from BOOKSTOCK_HCMMoreThan60000 where BookID = @BookID) 
	   or exists (select BookID from [LINKS1TOS2].BookManagement.dbo.BOOKSTOCK_HanoiNoMoreThan60000 where BookID = @BookID)
	   or exists (select BookID from [LINKS1TOS3].BookManagement.dbo.BOOKSTOCK_HCMNoMoreThan60000 where BookID = @BookID)
	   or not @BranchID = 'B1' or not @BranchID = 'B0') 
	begin
		raiserror('Khong the them vao BookID da co, hoac branchID khac B0-Hanoi, B1-HCM',16,1);
		rollback
	end
	else
		begin
			if (@BranchID = 'B0' AND @UnitPrice > 60000) 
				begin
					insert into BOOKSTOCK_HanoiMoreThan60000(BookID, BookName, UnitPrice, UnitsInStock, UnitsOnOrder, AuthorID, PublCompanyID, CategoryID, BranchID)
					values (@BookID, @BookName, @UnitPrice, @UnitsInStock, @UnitsOnOrder, @AuthorID, @PublCompanyID, @CategoryID, @BranchID)	
				end
			else if (@BranchID = 'B1' AND @UnitPrice > 60000)
				begin
					insert into BOOKSTOCK_HCMMoreThan60000(BookID, BookName, UnitPrice, UnitsInStock, UnitsOnOrder, AuthorID, PublCompanyID, CategoryID, BranchID)
					values (@BookID, @BookName, @UnitPrice, @UnitsInStock, @UnitsOnOrder, @AuthorID, @PublCompanyID, @CategoryID, @BranchID)	
				end
			else if (@BranchID = 'B0' AND @UnitPrice <= 60000)
				begin
					insert into [LINKS1TOS2].BookManagement.dbo.BOOKSTOCK_HanoiNoMoreThan60000(BookID, BookName, UnitPrice, UnitsInStock, UnitsOnOrder, AuthorID, PublCompanyID, CategoryID, BranchID)
					values (@BookID, @BookName, @UnitPrice, @UnitsInStock, @UnitsOnOrder, @AuthorID, @PublCompanyID, @CategoryID, @BranchID)
				end
			else if (@BranchID = 'B1' AND @UnitPrice <= 60000)
				begin
					insert into [LINKS1TOS3].BookManagement.dbo.BOOKSTOCK_HCMNoMoreThan60000(BookID, BookName, UnitPrice, UnitsInStock, UnitsOnOrder, AuthorID, PublCompanyID, CategoryID, BranchID)
					values (@BookID, @BookName, @UnitPrice, @UnitsInStock, @UnitsOnOrder, @AuthorID, @PublCompanyID, @CategoryID, @BranchID)
				end
		end
end
go
-- tao thu tuc insert cho bang ORDERS
create proc insert_order @OrderID varchar(2), @OrderDate datetime, @RequiredDate datetime, @BookID varchar(2), @CustomerID varchar(2), @BranchID varchar(2)
as
begin
	if (exists (select OrderID from ORDERS_HanoiLater2021 where OrderID = @OrderID) 
	   or exists (select OrderID from [LINKS1TOS2].BookManagement.dbo.ORDERS_HCMLater2021 where OrderID = @OrderID)
	   or exists (select OrderID from [LINKS1TOS3].BookManagement.dbo.ORDERS_HanoiBefore2021 where OrderID = @OrderID)
	   or exists (select OrderID from [LINKS1TOS3].BookManagement.dbo.ORDERS_HCMBefore2021 where OrderID = @OrderID)
	   or not @BranchID = 'B1' or not @BranchID = 'B0')
	begin
		raiserror('Khong the them vao OrderID da co, hoac branchID khac B0-Hanoi, B1-HCM',16,1);
		rollback
	end
	else 
		begin
			if (@BranchID = 'B0' AND @OrderDate >= '1-1-2021')
			begin
				insert into ORDERS_HanoiLater2021(OrderID, OrderDate, RequiredDate, BookID, CustomerID, BranchID)
				values (@OrderID, @OrderDate, @RequiredDate, @BookID, @CustomerID, @BranchID)
			end
			else if (@BranchID = 'B1' AND @OrderDate >= '1-1-2021')
			begin
				insert into [LINKS1TOS2].BookManagement.dbo.ORDERS_HCMLater2021(OrderID, OrderDate, RequiredDate, BookID, CustomerID, BranchID)
				values (@OrderID, @OrderDate, @RequiredDate, @BookID, @CustomerID, @BranchID)
			end
			else if (@BranchID = 'B0' AND @OrderDate < '1-1-2021')
			begin
				insert into [LINKS1TOS3].BookManagement.dbo.ORDERS_HanoiBefore2021(OrderID, OrderDate, RequiredDate, BookID, CustomerID, BranchID)
				values (@OrderID, @OrderDate, @RequiredDate, @BookID, @CustomerID, @BranchID)
			end
			else if (@BranchID = 'B1' AND @OrderDate < '1-1-2021')
			begin
				insert into [LINKS1TOS3].BookManagement.dbo.ORDERS_HCMBefore2021(OrderID, OrderDate, RequiredDate, BookID, CustomerID, BranchID)
				values (@OrderID, @OrderDate, @RequiredDate, @BookID, @CustomerID, @BranchID)
			end
		end
end
go

--DELETE
-- tao thu tục delete cho bang BRANCH
create proc delete_branch @BranchID varchar(2)
as
begin
	if exists (select BranchID from [BRANCH] where BranchID = @BranchID)
	delete from BRANCH
	where BranchID = @BranchID
	else
	begin
		raiserror('Khong the xoa branchID khong co',16,1);
		rollback tran
	end
end
go

exec insert_branch 'B2', 'Da Nang'
exec delete_branch 'B2'
select * from BRANCH
select * from [LINKS1TOS2].BookManagement.dbo.BRANCH
select * from [LINKS1TOS3].BookManagement.dbo.BRANCH
go
-- tao thu tuc delete cho bang CATEGORIES
create proc delete_categories @CategoryID varchar(2)
as
begin
	if exists (select CategoryID from [CATEGORIES] where CategoryID = @CategoryID)
	delete from CATEGORIES
	where CategoryID = @CategoryID
	else
	begin
		raiserror('Khong the xoa CategoryID khong co',16,1);
		rollback tran
	end
end
go
-- tao thu tuc delete cho bang PUBLISHINGCOMPANY
create proc delete_publCom @PublCompanyID varchar(2)
as
begin
	if exists (select PublCompanyID from [PUBLISHINGCOMPANY] where PublCompanyID = @PublCompanyID)
	delete from PUBLISHINGCOMPANY
	where PublCompanyID = @PublCompanyID
	else
	begin
		raiserror('Khong the xoa PublCompanyID khong co',16,1);
		rollback tran
	end
end
go
-- tao thu tuc delete cho bang AUTHOR
create proc delete_author @AuthorID varchar(2)
as
begin
	if (exists (select AuthorID from [AUTHOR_No_Genre] where AuthorID = @AuthorID) 
	   or exists (select AuthorID from [LINKS1TOS2].BookManagement.dbo.AUTHOR_Genre where AuthorID = @AuthorID) 
	   or exists (select AuthorID from [LINKS1TOS3].BookManagement.dbo.AUTHOR_Genre where AuthorID = @AuthorID))
	begin
		delete from AUTHOR_No_Genre
		where AuthorID = @AuthorID
		delete from [LINKS1TOS2].BookManagement.dbo.AUTHOR_Genre
		where AuthorID = @AuthorID
		delete from [LINKS1TOS3].BookManagement.dbo.AUTHOR_Genre
		where AuthorID = @AuthorID
	end
	else
		begin
			raiserror('Khong the xoa AuthorID khong co',16,1);
			rollback tran
		end
end
go

exec delete_author '06'
GO
-- tao thu tuc delete cho bang CUSTOMERS
create proc delete_customers @CustomerID varchar(2)
as
begin
	if (exists (select CustomerID from [CUSTOMERS_No_Address] where CustomerID = @CustomerID) 
	   or exists (select CustomerID from [LINKS1TOS2].BookManagement.dbo.CUSTOMERS_Address where CustomerID = @CustomerID) 
	   or exists (select CustomerID from [LINKS1TOS3].BookManagement.dbo.CUSTOMERS_Address where CustomerID = @CustomerID))
	begin
		delete from CUSTOMERS_No_Address
		where CustomerID = @CustomerID
		delete from [LINKS1TOS2].BookManagement.dbo.CUSTOMERS_Address
		where CustomerID = @CustomerID
		delete from [LINKS1TOS3].BookManagement.dbo.CUSTOMERS_Address
		where CustomerID = @CustomerID
	end
	else
		begin
			raiserror('Khong the xoa CustomerID khong co',16,1);
			rollback tran
		end
end
go
-- tao thu tuc delete cho bang BOOKSTOCK
create proc delete_bookstock @BookID varchar(2)
as
begin
	if (exists (select BookID from BOOKSTOCK_HanoiMoreThan60000 where BookID = @BookID) 
	   or exists (select BookID from BOOKSTOCK_HCMMoreThan60000 where BookID = @BookID) 
	   or exists (select BookID from [LINKS1TOS2].BookManagement.dbo.BOOKSTOCK_HanoiNoMoreThan60000 where BookID = @BookID)
	   or exists (select BookID from [LINKS1TOS3].BookManagement.dbo.BOOKSTOCK_HCMNoMoreThan60000 where BookID = @BookID))
	begin
		delete from BOOKSTOCK_HanoiMoreThan60000
		where BookID = @BookID
		delete from BOOKSTOCK_HCMMoreThan60000
		where BookID = @BookID
		delete from [LINKS1TOS2].BookManagement.dbo.BOOKSTOCK_HanoiNoMoreThan60000
		where BookID = @BookID
		delete from [LINKS1TOS3].BookManagement.dbo.BOOKSTOCK_HCMNoMoreThan60000
		where BookID = @BookID
	end
	else
		begin
			raiserror('Khong the xoa BookID khong co',16,1);
			rollback tran
		end
end
go
-- tao thu tuc delete cho bang ORDERS
create proc delete_orders @OrderID varchar(2)
as
begin
	if (exists (select OrderID from ORDERS_HanoiLater2021 where OrderID = @OrderID) 
		   or exists (select OrderID from [LINKS1TOS2].BookManagement.dbo.ORDERS_HCMLater2021 where OrderID = @OrderID)
		   or exists (select OrderID from [LINKS1TOS3].BookManagement.dbo.ORDERS_HanoiBefore2021 where OrderID = @OrderID)
		   or exists (select OrderID from [LINKS1TOS3].BookManagement.dbo.ORDERS_HCMBefore2021 where OrderID = @OrderID))
	begin
		delete from ORDERS_HanoiLater2021
		where OrderID = @OrderID
		delete from [LINKS1TOS2].BookManagement.dbo.ORDERS_HCMLater2021
		where OrderID = @OrderID
		delete from [LINKS1TOS3].BookManagement.dbo.ORDERS_HanoiBefore2021
		where OrderID = @OrderID
		delete from [LINKS1TOS3].BookManagement.dbo.ORDERS_HCMBefore2021
		where OrderID = @OrderID
	end
	else
		begin
			raiserror('Khong the xoa BookID khong co',16,1);
			rollback tran
		end
end
go

--UPDATE
-- tao thu tuc update cho bang BRANCH
