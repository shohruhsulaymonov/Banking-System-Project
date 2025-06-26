--1•	Top 3 Customers with the Highest Total Balance Across All Accounts 
select top 3 CustomerID, sum(Balance) as TotalBalance
from Core_Banking.Accounts
where Status = 'Active'
order by TotalBalance desc
-------------------------------------------------------
--2. •	Customers Who Have More Than One Active Loan
select CustomerID, count(*) as LoanCount
from Loans_Credit.Loans
where Status = 'Ongoing'
group by CustomerID
having count(*) > 1
--3.
select distinct 
	t.TransactionID, 
	a.AccountID
from Compliance_Risk.FraudDetection as fd
left join Core_Banking.Transactions as t
on t.TransactionID = fd.TransactionID
left join Core_Banking.Accounts a
on a.AccountID = t.AccountID




















-------------------------------------------------------------
--Shows which type of transaction is more prone to fraud
Declare @total_trans float;
set @total_trans = (select COUNT(*) 
from Core_Banking.Transactions);

with RisKByType as(
select TransactionType, count(RiskLevel) as RiskCount
from Compliance_Risk.FraudDetection fd
join Core_Banking.Transactions t
on fd.TransactionID = t.TransactionID
where RiskLevel in ('Critical', 'High', 'Medium')
group by TransactionType
)

select 
	TransactionType, 
	100*RiskCount/@total_trans as FraudProne
from RisKByType
-------------------------------------------------------------
--Reflects the proportion of statuses of investigations
select
	Status,
	round(cast(100*count(*) as float)/(select Count(*) from Compliance_Risk.AMLCases), 2) as Pct
from
Compliance_Risk.AMLCases
group by Status
order by pct desc
-------------------------------------------------------------
--Calcualtes the average salary per employee
select avg(BaseSalary + Bonus - Deductions) as AvgSalaryPerEmployee
from Human_Resources.Salaries
