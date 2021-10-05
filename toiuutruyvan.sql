use BookManagement
go

-- Phan manh dan xuat PUBLISHINGCOMPANY theo BOOKSTOCK_HaNoiMoreThan60000
select * into PUBLISHINGCOMPANY_HanoiMoreThan60000
from PUBLISHINGCOMPANY
where PublCompanyID IN (Select a.PublCompanyID 
						From PUBLISHINGCOMPANY a, BOOKSTOCK_HanoiMoreThan60000 b
						Where a.PublCompanyID = b.PublCompanyID)

-- Phan manh dan xuat PUBLISHINGCOMPANY theo BOOKSTOCK_HCMMoreThan60000
select * into PUBLISHINGCOMPANY_HCMMoreThan60000
from PUBLISHINGCOMPANY
where PublCompanyID IN (Select a.PublCompanyID 
						From PUBLISHINGCOMPANY a, BOOKSTOCK_HCMMoreThan60000 b
						Where a.PublCompanyID = b.PublCompanyID)
go

-- Tao view cho cau truy van dau tien
CREATE VIEW PublComName_View AS
SELECT PublCompanyName
FROM PUBLISHINGCOMPANY_HanoiMoreThan60000 a, BOOKSTOCK_HanoiMoreThan60000 b
WHERE a.PublCompanyID = b.PublCompanyID AND b.UnitPrice > 70000 AND b.UnitsOnOrder > 2
UNION
SELECT PublCompanyName
FROM PUBLISHINGCOMPANY_HCMMoreThan60000 c, BOOKSTOCK_HCMMoreThan60000 d
WHERE c.PublCompanyID = d.PublCompanyID AND d.UnitPrice > 70000 AND d.UnitsOnOrder > 2
go

select * from PublComName_View
go

-- Tao view cho cau truy van thu hai 
CREATE VIEW BookName_View AS
SELECT BookName
FROM ORDERS_HanoiLater2021 a, BOOKSTOCK_HanoiMoreThan60000 b
WHERE a.BookID = b.BookID AND OrderDate >= '03-21-2021' AND UnitPrice > 70000
UNION
SELECT BookName
FROM ORDERS_HanoiLater2021 a, BOOKSTOCK_HCMMoreThan60000 b
WHERE a.BookID = b.BookID AND OrderDate >= '03-21-2021' AND UnitPrice > 70000
UNION
SELECT BookName
FROM [LINKS1TOS2].BookManagement.dbo.ORDERS_HCMLater2021 a, BOOKSTOCK_HanoiMoreThan60000 b
WHERE a.BookID = b.BookID AND OrderDate >= '03-21-2021' AND UnitPrice > 70000
UNION
SELECT BookName
FROM [LINKS1TOS2].BookManagement.dbo.ORDERS_HCMLater2021 a, BOOKSTOCK_HCMMoreThan60000 b
WHERE a.BookID = b.BookID AND OrderDate >= '03-21-2021' AND UnitPrice > 70000
go
select * from BookName_View
go

-- Tao view cho cau truy van thu ba
CREATE VIEW BookName2_View AS
SELECT BookName
FROM [LINKS1TOS2].BookManagement.dbo.PUBLISHINGCOMPANY_HanoiNoMoreThan60000 a, [LINKS1TOS2].BookManagement.dbo.BOOKSTOCK_HanoiNoMoreThan60000 b
WHERE a.PublCompanyID = b.PublCompanyID AND PostalCode = 100000 AND  UnitPrice < 45000 AND BookID IN 
   ( SELECT c.BookID
     FROM [LINKS1TOS2].BookManagement.dbo.BOOKSTOCK_HanoiNoMoreThan60000 c, [LINKS1TOS3].BookManagement.dbo.ORDERS_HanoiBefore2021 d
     WHERE c.BookID = d.BookID AND CustomerID = '04' AND OrderDate < '12-20-2020')
UNION
SELECT BookName
FROM [LINKS1TOS2].BookManagement.dbo.PUBLISHINGCOMPANY_HanoiNoMoreThan60000 a, [LINKS1TOS2].BookManagement.dbo.BOOKSTOCK_HanoiNoMoreThan60000 b
WHERE a.PublCompanyID = b.PublCompanyID AND PostalCode = 100000 AND  UnitPrice < 45000 AND BookID IN 
   ( SELECT c.BookID
     FROM [LINKS1TOS2].BookManagement.dbo.BOOKSTOCK_HanoiNoMoreThan60000 c, [LINKS1TOS3].BookManagement.dbo.ORDERS_HCMBefore2021 d
     WHERE c.BookID = d.BookID AND CustomerID ='04' AND OrderDate < '12-20-2020')
UNION
SELECT BookName
FROM [LINKS1TOS3].BookManagement.dbo.PUBLISHINGCOMPANY_HCMNoMoreThan60000 a, [LINKS1TOS3].BookManagement.dbo.BOOKSTOCK_HCMNoMoreThan60000 b
WHERE a.PublCompanyID = b.PublCompanyID AND PostalCode = 100000 AND UnitPrice < 45000 AND BookID IN 
   ( SELECT c.BookID
     FROM [LINKS1TOS3].BookManagement.dbo.BOOKSTOCK_HCMNoMoreThan60000 c, [LINKS1TOS3].BookManagement.dbo.ORDERS_HanoiBefore2021 d
     WHERE c.BookID = d.BookID AND CustomerID ='04' AND OrderDate < '12-20-2020')
UNION
SELECT BookName
FROM [LINKS1TOS3].BookManagement.dbo.PUBLISHINGCOMPANY_HCMNoMoreThan60000 a,[LINKS1TOS3].BookManagement.dbo.BOOKSTOCK_HCMNoMoreThan60000 b
WHERE a.PublCompanyID = b.PublCompanyID AND PostalCode = 100000 AND UnitPrice < 45000 AND BookID IN 
   ( SELECT c.BookID
     FROM [LINKS1TOS3].BookManagement.dbo.BOOKSTOCK_HCMNoMoreThan60000 c, [LINKS1TOS3].BookManagement.dbo.ORDERS_HCMBefore2021 d
     WHERE c.BookID = d.BookID AND CustomerID ='04' AND OrderDate < '12-20-2020')
go
Select * from BookName2_View
go
