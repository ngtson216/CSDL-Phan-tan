use BookManagement
go

-- Phan manh dan xuat PUBLISHINGCOMPANY theo BOOKSTOCK_HCMNoMoreThan60000
select * into PUBLISHINGCOMPANY_HCMNoMoreThan60000
from PUBLISHINGCOMPANY
where PublCompanyID IN (Select a.PublCompanyID 
						From PUBLISHINGCOMPANY a, BOOKSTOCK_HCMNoMoreThan60000 b
						Where a.PublCompanyID = b.PublCompanyID)

