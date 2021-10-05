
select * into BookManagement.dbo.BOOKSTOCK_HCMNoMoreThan60000 from [ROOT].BookManagement.dbo.BOOKSTOCK where BranchID = 'B1' and UnitPrice <= 60000

select * into BookManagement.dbo.ORDERS_HCMBefore2021 from [ROOT].BookManagement.dbo.ORDERS where BranchID = 'B1' and OrderDate < '1-1-2021'
select * from BookManagement.dbo.ORDERS_HCMBefore2021
select * into BookManagement.dbo.ORDERS_HanoiBefore2021 from [ROOT].BookManagement.dbo.ORDERS where BranchID = 'B0' and OrderDate < '1-1-2021'
select * from BookManagement.dbo.ORDERS_HanoiBefore2021