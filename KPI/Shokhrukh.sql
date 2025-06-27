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
--4. •	Total Loan Amount Issued Per Branch
Select BranchID, sum(Amount) TotalLoanAmount
from Core_Banking.Accounts a
join Loans_Credit.Loans l
on a.CustomerID = l.CustomerID
where l.Status = 'Ongoing'
group by BranchID
order by TotalLoanAmount desc
--5. multiple large transactions within a short time frame
with LargeTrans as(select *
from Core_Banking.Transactions
where Amount > 10000
and Status in('Completed', 'Failed')
)

SELECT l1.AccountID, l1.TransactionID AS Tx1, l1.date AS Tx1Time,
       l2.TransactionID AS Tx2, l2.date AS Tx2Time
from LargeTrans l1
join LargeTrans l2
on l1.TransactionID < l2.TransactionID
and l1.AccountID = l2.AccountID
and abs(datediff(minute, l1.date, l2.date)) <= 60
--6 Multiple transactions from different countries within 10 minutes
with LargeTrans as(select *
from Core_Banking.Transactions
where Status in('Completed', 'Failed')
)

SELECT l1.AccountID, l1.TransactionID AS Tx1, l1.date AS Tx1Time,
       l2.TransactionID AS Tx2, l2.date AS Tx2Time
from LargeTrans l1
join LargeTrans l2
on l1.TransactionID < l2.TransactionID
and l1.AccountID = l2.AccountID
and l1.Currency <> l2.Currency
and abs(datediff(minute, l1.date, l2.date)) <= 10
and l1.Status in('Completed', 'Failed')
and l2.Status in('Completed', 'Failed')
---------------------------------------------
with cte as(
select case when mt.TransactionID is not null then 1 else 0 end Isdigital
from Core_Banking.Transactions t
left join Digital_Banking_Payments.MobileBankingTransactions mt
on t.TransactionID = mt.TransactionID
)

select round(100*1.0*sum(Isdigital)/count(Isdigital), 2) as MobileTransactionRate
from cte
--------------------------------------
select LoanType, avg(Amount*(1+InterestRate)) TotalLoanAmount
from Loans_Credit.Loans
group by LoanType
order by TotalLoanAmount desc
---------------------------------------
with FraudTrans as(
select 
	case when FraudID is not null then 1 else 0 end IsFraudulent
from Core_Banking.Transactions t
left join Compliance_Risk.FraudDetection fd
on t.TransactionID = fd.TransactionID
)

SELECT 
    CAST(
        CAST(ROUND(100.0 * SUM(IsFraudulent) / COUNT(IsFraudulent), 2) AS DECIMAL(10, 2)) 
    AS VARCHAR) + '%' AS FraudRate
FROM FraudTrans;
---------------------------------------------------

with cte AS(
select 
	sum((ROI*Amount)/100) as TotalReturn,
	SUM(Amount) as TotalInvestment
from Investments_Treasury.Investments
)
select 100*1.0*(TotalReturn-TotalInvestment)/TotalInvestment as ROIPercentage
from cte
----------------------------------------------------
select sum(currentvalue) CurrentTotalValueOfInvestments
from Investments_Treasury.StockTradingAccounts
--Total amount of current investment value
select BrokerageFirm, sum(currentvalue) CurrentTotalInvestmentValue
from Investments_Treasury.StockTradingAccounts
group by BrokerageFirm
order by CurrentTotalInvestmentValue desc
--Current investment values per Brokerage firm
----------------------------------------------

select Industry, count(*) as MerchantCount
from Merchant_Services.Merchants
group by Industry
--Shows the number of merchants are from each industry
go
with Merchant as(
select 
	case when MerchantID is not null then 1 else 0 end as IsMerchant
from Core_Banking.Customers c
left join Merchant_Services.Merchants m
on c.CustomerID = m.CustomerID
)

select 100*1.0*sum(IsMerchant)/count(IsMerchant) B2B_Ratio
from Merchant
--Indicates the proportion that make up merchants among customers
	
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
with CaseCategory as(
Select distinct
	Status,
	count(*) over (Partition by status) NumOfCases,
	count(*) over() TotalCases
from Compliance_Risk.AMLCases
)

select Status, format(round(100*1.0*NumOfCases/TotalCases, 2), '0.##') as Percentage
from CaseCategory
-------------------------------------------------------------
--Calcualtes the average salary per employee
select avg(BaseSalary + Bonus - Deductions) as AvgSalaryPerEmployee
from Human_Resources.Salaries
