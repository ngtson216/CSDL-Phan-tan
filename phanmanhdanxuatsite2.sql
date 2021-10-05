use BookManagement
go

-- Phan manh dan xuat PUBLISHINGCOMPANY theo BOOKSTOCK_HanoiNoMoreThan60000
select * into PUBLISHINGCOMPANY_HanoiNoMoreThan60000
from PUBLISHINGCOMPANY
where PublCompanyID IN (Select a.PublCompanyID 
						From PUBLISHINGCOMPANY a, BOOKSTOCK_HanoiNoMoreThan60000 b
						Where a.PublCompanyID = b.PublCompanyID)
