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

exec sp_Employees_per_Department 'Finance'
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

--Shows total amount of loands issued for a specified branchID, othewise desplays all branches with their corresponding loan amounts

create proc sp_Branch_LoanAmount @BranchID int = Null as
if @BranchID is Null
begin
Select BranchID, sum(Amount) TotalLoanAmount
from Core_Banking.Accounts a
join Loans_Credit.Loans l
on a.CustomerID = l.CustomerID
where l.Status = 'Ongoing'
group by BranchID
order by TotalLoanAmount desc
end
else
begin
Select BranchID, sum(Amount) TotalLoanAmount
from Core_Banking.Accounts a
join Loans_Credit.Loans l
on a.CustomerID = l.CustomerID
where l.Status = 'Ongoing' and @BranchID = BranchID
group by BranchID
order by TotalLoanAmount desc
end

-----------------------------
--Shows total loan amount for a specified loan type, if no loan type is given, displays loana amount for each loan type
create proc sp_LoanAmount_per_LoanType @LoanType varchar(30) = Null as
if @LoanType is Null
begin
select LoanType, avg(Amount*(1+InterestRate)) TotalLoanAmount
from Loans_Credit.Loans
group by LoanType
order by TotalLoanAmount desc
end
else
begin
select LoanType, avg(Amount*(1+InterestRate)) TotalLoanAmount
from Loans_Credit.Loans
where LoanType = @LoanType
group by LoanType
order by TotalLoanAmount desc
end
----------------------------
--Shows the number of merchants are from each industry
create proc sp_Merchant_per_Industry @Industry varchar(50) = Null as
if @Industry is Null
begin
select Industry, count(*) as MerchantCount
from Merchant_Services.Merchants
group by Industry
end
else
begin
select Industry, count(*) as MerchantCount
from Merchant_Services.Merchants
where Industry = @Industry
group by Industry
end

--Shows the percentage of fraudulent transactions for each transaction type, if no transaction type is given. Otherwise, showa all

create proc sp_Fraudulent_Trans_Pct @Type varchar(20) = Null as
Declare @total_trans float;
set @total_trans = (select COUNT(*) 
from Core_Banking.Transactions);
if @Type is Null
begin
with RisKByType as(
select TransactionType, count(RiskLevel) as RiskCount
from Compliance_Risk.FraudDetection fd
join Core_Banking.Transactions t
on fd.TransactionID = t.TransactionID
group by TransactionType
)

select 
	TransactionType, 
	100*RiskCount/@total_trans as FraudProne
from RisKByType
end

else
begin
with RisKByType as(
select TransactionType, count(RiskLevel) as RiskCount
from Compliance_Risk.FraudDetection fd
join Core_Banking.Transactions t
on fd.TransactionID = t.TransactionID
group by TransactionType
)

select 
	TransactionType, 
	100*RiskCount/@total_trans as FraudProne
from RisKByType
where TransactionType = @Type
end
-----------------------
--Reflects the percentage of statuses of investigations
create proc sp_Investigation_Status @Status varchar(20) = Null as
if @Status is Null
begin
	with CaseCategory as(
	Select distinct
		Status,
		count(*) over (Partition by status) NumOfCases,
		count(*) over() TotalCases
	from Compliance_Risk.AMLCases
	)

	select 
		Status, 
		format(round(100*1.0*NumOfCases/TotalCases, 2), '0.##') as Percentage
	from CaseCategory
end
else
begin
	with CaseCategory as(
	Select distinct
		Status,
		count(*) over (Partition by status) NumOfCases,
		count(*) over() TotalCases
	from Compliance_Risk.AMLCases
	)

	select 
		Status, 
		format(round(100*1.0*NumOfCases/TotalCases, 2), '0.##') as Percentage
	from CaseCategory
	where Status = @Status
end
