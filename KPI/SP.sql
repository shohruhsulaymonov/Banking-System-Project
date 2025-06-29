--Calculates investment value of a specifies borekerage firm, if no firm is given, show all
create proc sp_Investment_value @Firm  varchar(50) = null
as
	if @Firm is not null	
		begin 
			select BrokerageFirm, sum(currentvalue) as CurrentTotalInvestmentValue
			from Investments_Treasury.StockTradingAccounts
			where BrokerageFirm = trim(@Firm)
			group by BrokerageFirm
		end
	else
		begin
			select BrokerageFirm, sum(currentvalue) as CurrentTotalInvestmentValue
			from Investments_Treasury.StockTradingAccounts
			group by BrokerageFirm
		end

exec sp_Investment_value 'Tinkoff'

--shows how many employees there are in a specified department
create proc sp_Employees_per_Department @DName varchar(50) = null
as
	if @DName is not null	
		begin 
			select Department, count(*) NumOfEmps
			from Core_Banking.Employees
			where Department = trim(@DName)
			group by Department 
		end
	else
		begin
			select Department, count(*) NumOfEmps
			from Core_Banking.Employees
			group by Department
		end

exec sp_Employees_per_Department 'FInance'
-------------------------------------------------
--shows how many employees there are in a specified Branch

create proc sp_Employees_per_Branch @BName varchar(50) = null
as
	if @BName is not null	
		begin 
			select BranchName, count(*) NumOfEmps
			from Core_Banking.Employees e
			join Core_Banking.Branches b
			on e.BranchID = b.BranchID
			where BranchName = trim(@BName)
			group by BranchName
		end
	else
		begin
			select BranchName, count(*) NumOfEmps
			from Core_Banking.Employees e
			join Core_Banking.Branches b
			on e.BranchID = b.BranchID
			group by BranchName
		end

exec sp_Employees_per_Branch 'Lake Nicole Branch'


