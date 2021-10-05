use master
go
if exists(select * from sysdatabases where name ='BookManagement')
    drop database BookManagement
go
create database BookManagement
go
use BookManagement
go
create table AUTHOR(
	AuthorID varchar(2) NOT NULL,
	AuthorName nvarchar(30) NOT NULL,
	Genre nvarchar(60),
	Sex nvarchar(20),
	Nationality nvarchar(20),
	DOB date,
	CONSTRAINT author_id PRIMARY KEY (AuthorID)
)
-- Insert Author
insert into AUTHOR(AuthorID, AuthorName, Genre, Sex, Nationality, DOB) values('00','To Hoai','Truyen ngan','Nam','Viet Nam','9-7-1920')
insert into AUTHOR(AuthorID, AuthorName, Genre, Sex, Nationality, DOB) values('01','Conan Doyle','Tieu thuyet','Nam','Scotland','5-22-1859')
insert into AUTHOR(AuthorID, AuthorName, Genre, Sex, Nationality, DOB) values('02','Joseph Brodsky','Tho','Nam','Nga','5-24-1940')
insert into AUTHOR(AuthorID, AuthorName, Genre, Sex, Nationality, DOB) values('03','Fujiko Fujio','Truyen tranh','Nam','Nhat Ban','12-1-1933')
insert into AUTHOR(AuthorID, AuthorName, Genre, Sex, Nationality, DOB) values('04','Joanne Rowling','Tieu thuyet','Nu','Ireland','7-31-1965')
select * from AUTHOR
--
create table PUBLISHINGCOMPANY(
	PublCompanyID varchar(2) NOT NULL,
	PublCompanyName nvarchar(30) NOT NULL,
	Address nvarchar(60),
	City nvarchar(20),
	FAX nvarchar(20),
	Phone nvarchar(15),
	PostalCode nvarchar(10),
	CONSTRAINT publcpn_id PRIMARY KEY (PublCompanyID)
)
-- Insert Publishing Company
insert into PUBLISHINGCOMPANY(PublCompanyID, PublCompanyName, Address, City, FAX, Phone, PostalCode) values('00','NBX Kim Dong','55 Quang Trung, Nguyen Du, Hai Ba Trung, Ha Noi', 'Ha Noi','02430454065','02439434730','100000')
insert into PUBLISHINGCOMPANY(PublCompanyID, PublCompanyName, Address, City, FAX, Phone, PostalCode) values('01','NBX Giao duc','81 Tran Hung Dao, Hoan Kiem, Ha Noi', 'Ha Noi','02439422010','024 3822 0801','100000')
insert into PUBLISHINGCOMPANY(PublCompanyID, PublCompanyName, Address, City, FAX, Phone, PostalCode) values('02','NBX Tre','161B Ly Chinh Thang, Phuong 7, Quan 3, Ho Chi Minh.', 'Ho Chi Minh','02838437450','02839316289','700000')
insert into PUBLISHINGCOMPANY(PublCompanyID, PublCompanyName, Address, City, FAX, Phone, PostalCode) values('03','NBX Lao Dong','175 Giang Vo, Đong Đa, Ha Noi', 'Ha Noi','02438515381','02438515380','100000')
insert into PUBLISHINGCOMPANY(PublCompanyID, PublCompanyName, Address, City, FAX, Phone, PostalCode) values('04','NXB Dai hoc Quoc gia Ha Noi','16 Hang Chuoi, Pham Đinh Ho, Hai Ba Trung, Ha Noi', 'Ha Noi','0439729436','02439714896','100000')
--
create table CATEGORIES(
	CategoryID varchar(2) NOT NULL,
	CategoryName nvarchar(30) NOT NULL,
	Description ntext,
	CONSTRAINT category_id PRIMARY KEY (CategoryID)
)
-- Insert Categories
INSERT INTO CATEGORIES(CategoryID, CategoryName, Description) VALUES ('00', 'Truyen ngan', 'Truyen ngan la mot the loai van hoc. No thuong la cac cau chuyen ke bang van xuoi va co xu huong ngan gon, suc tich va ham nghia hon cac cau truyen dai nhu tieu thuyet. Thong thuong truyen ngan co do dai chi tu vai dong den vai chuc trang, trong khi do tieu thuyet rat kho dung lai o con so do. Vi the, tinh huong truyen luon la van de quan trong bac nhat cua nghe thuat truyen ngan.');
INSERT INTO CATEGORIES(CategoryID, CategoryName, Description) VALUES ('01', 'Tieu thuyet', 'Tieu thuyet la mot the loai van xuoi co hu cau, thong qua nhan vat, hoan canh, su viec de phan anh buc tranh xa hoi rong lon va nhung van de cua cuoc song con nguoi, bieu hien tinh chat tuong thuat, tinh chat ke chuyen bang ngon ngu van xuoi theo nhung chu de xac dinh.');
INSERT INTO CATEGORIES(CategoryID, CategoryName, Description) VALUES ('02', 'Truyen tranh', 'Truyen tranh la mot phuong tien duoc su dung de the hien y tuong bang hinh anh,thuong ket hop voi cac van ban hoac thong tin hinh anh khac.');
INSERT INTO CATEGORIES(CategoryID, CategoryName, Description) VALUES ('03', 'Tho', 'Tho la hinh thuc nghe thuat dung tu trong ngon ngu lam chat lieu, va su chon loc tu cung nhu to hop cua chung duoc sap xep duoi hinh thuc logic nhat dinh tao nen hinh anh hay goi cam am thanh co tinh tham my cho nguoi doc, nguoi nghe.');
INSERT INTO CATEGORIES(CategoryID, CategoryName, Description) VALUES ('04', 'Truyen co tich', 'Truyen co tich la mot the loai van hoc duoc tu su dan gian sang tac co xu the hu cau, bao gom co tich than ky, co tich the su, co tich phieu luu va co tich loai vat. Day la loai truyen ngan, chu yeu ke ve cac nhan vat dan gian hu cau, nhu tien, yeu tinh, than tien, quy, nguoi lun, nguoi khong lo, nguoi ca, hay than giu cua, va thuong la co phep thuat, hay bua me.');
select * from CATEGORIES
--

create table CUSTOMERS(
	CustomerID varchar(2) NOT NULL,
	CustomerName nvarchar(30) NOT NULL,
	Address nvarchar(60),
	City nvarchar(20),
	FAX nvarchar(20),
	Phone nvarchar(15),
	CONSTRAINT cus_id PRIMARY KEY (CustomerID)
)
-- Insert Customers
insert into CUSTOMERS(CustomerID, CustomerName, Address, City, FAX, Phone) values('00','Bui Duc Toan','Giap Nhi','Hanoi','3036-6765','0888283335')
insert into CUSTOMERS(CustomerID, CustomerName, Address, City, FAX, Phone) values('01','Nguyen Dang Tu','Thinh Liet','Hanoi','3319-6076','0983645170')
insert into CUSTOMERS(CustomerID, CustomerName, Address, City, FAX, Phone) values('02','Nguyen Tuan Son','Cau Giay','Hanoi','3319-6342','0834235193')
insert into CUSTOMERS(CustomerID, CustomerName, Address, City, FAX, Phone) values('03','Trinh Hong Hoa','Hiep Hoa','Bac Ninh','3310-6469','0936215786')
insert into CUSTOMERS(CustomerID, CustomerName, Address, City, FAX, Phone) values('04','Dang Mai Lan','Binh Thanh','TP.HCM','3323-4658','0964152296')
select * from CUSTOMERS
--
go 
create table BRANCH(
	BranchID varchar(2) NOT NULL primary key,
	BranchName nvarchar(20) NOT NULL
)
-- insert branch
insert into BRANCH(BranchID, BranchName) values('B0','Hanoi')
insert into BRANCH(BranchID, BranchName) values('B1','TP.HCM')
--
go
create table BOOKSTOCK(
	BookID varchar(2) NOT NULL,
	BookName nvarchar(30) NOT NULL,
	UnitPrice money,
	UnitsInStock smallint,
	UnitsOnOrder smallint,
	AuthorID varchar(2) NOT NULL,
	PublCompanyID varchar(2) NOT NULL,
	CategoryID varchar(2) NOT NULL,
	BranchID varchar(2) NOT NULL,
	CONSTRAINT book_id PRIMARY KEY (BookID),
	CONSTRAINT branch_id FOREIGN KEY (BranchID) REFERENCES BRANCH(BranchID),
	CONSTRAINT author_book FOREIGN KEY (AuthorID) REFERENCES AUTHOR(AuthorID),
	CONSTRAINT publcpn_book FOREIGN KEY (PublCompanyID) REFERENCES PUBLISHINGCOMPANY(PublCompanyID),
	CONSTRAINT category_book FOREIGN KEY (CategoryID) REFERENCES CATEGORIES(CategoryID)
)
-- Insert Bookstock
INSERT INTO BOOKSTOCK(BookID, BookName, UnitPrice, UnitsInStock, UnitsOnOrder, AuthorID, PublCompanyID, CategoryID, BranchID) VALUES ('00', 'De Men Phieu Luu Ky', 75000, '50', '10', '00', '00', '01', 'B0');
INSERT INTO BOOKSTOCK(BookID, BookName, UnitPrice, UnitsInStock, UnitsOnOrder, AuthorID, PublCompanyID, CategoryID, BranchID) VALUES ('01', 'Sherlock Holmes', 120000, '35', '3', '01', '02', '01', 'B0');
INSERT INTO BOOKSTOCK(BookID, BookName, UnitPrice, UnitsInStock, UnitsOnOrder, AuthorID, PublCompanyID, CategoryID, BranchID) VALUES ('02', 'Ke an bam xa hoi', 60000, '10', '2', '02', '04', '03', 'B1');
INSERT INTO BOOKSTOCK(BookID, BookName, UnitPrice, UnitsInStock, UnitsOnOrder, AuthorID, PublCompanyID, CategoryID, BranchID) VALUES ('03', 'Doraemon', 25000, '50', '30', '03', '02', '02', 'B0');
INSERT INTO BOOKSTOCK(BookID, BookName, UnitPrice, UnitsInStock, UnitsOnOrder, AuthorID, PublCompanyID, CategoryID, BranchID) VALUES ('04', 'Harry Potter', 75000, '30', '3', '04', '03', '01', 'B1');
select * from BOOKSTOCK
--
go
create table ORDERS(
	OrderID varchar(2) NOT NULL,
	OrderDate datetime,
	RequiredDate datetime,
	BookID varchar(2) NOT NULL,
	CustomerID varchar(2) NOT NULL,
	BranchID varchar(2) NOT NULL,
	CONSTRAINT ord_id PRIMARY KEY (OrderID),
	CONSTRAINT obranch_id FOREIGN KEY (BranchID) REFERENCES BRANCH(BranchID),
	CONSTRAINT bookstock_orders FOREIGN KEY (BookID) REFERENCES BOOKSTOCK(BookID),
	CONSTRAINT cus_orders FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS(CustomerID)
)
-- Insert Orders
insert into ORDERS(OrderID, OrderDate, RequiredDate, BookID, CustomerID, BranchID) values ('00','11-7-2020','12-7-2020','02','01','B0')
insert into ORDERS(OrderID, OrderDate, RequiredDate, BookID, CustomerID, BranchID) values ('01','5-30-2021','6-2-2021','01','00','B1')
insert into ORDERS(OrderID, OrderDate, RequiredDate, BookID, CustomerID, BranchID) values ('02','6-1-2021','6-8-2021','00','04','B1')
insert into ORDERS(OrderID, OrderDate, RequiredDate, BookID, CustomerID, BranchID) values ('03','8-27-2020','9-7-2020','03','02','B1')
insert into ORDERS(OrderID, OrderDate, RequiredDate, BookID, CustomerID, BranchID) values ('04','6-6-2021','6-10-2021','04','03','B0')
insert into ORDERS(OrderID, OrderDate, RequiredDate, BookID, CustomerID, BranchID) values ('05','2-1-2020','3-1-2020','03','04','B1')
select * from ORDERS
