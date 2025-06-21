#Customers by Total Balance
SELECT TOP 3 C.FullName, SUM(A.Balance) AS TotalBalance
FROM Customers C
JOIN Accounts A ON C.CustomerID = A.CustomerID
GROUP BY C.FullName
ORDER BY TotalBalance DESC;
--------------------------------------------------------
#Customers with Multiple Active Loans
SELECT CustomerID, COUNT(*) AS LoanCount
FROM Loans
WHERE Status = 'Active'
GROUP BY CustomerID
HAVING COUNT(*) > 1;
-------------------------------------------------------
#Fraudulent Transactions
SELECT *
FROM Transactions
WHERE Status = 'Fraudulent';
------------------------------------------------------
#Total Loan Amount Issued Per Branch
SELECT A.BranchID, SUM(L.Amount) AS TotalLoanAmount
FROM Loans L
JOIN Accounts A ON L.AccountID = A.AccountID
GROUP BY A.BranchID;
-------------------------------------------------------
#High-Value Transactions Within 1 Hour
SELECT T1.AccountID, T1.TransactionID, T2.TransactionID
FROM Transactions T1
JOIN Transactions T2 ON T1.AccountID = T2.AccountID
AND T1.TransactionID <> T2.TransactionID
AND T1.Amount > 10000 AND T2.Amount > 10000
AND ABS(DATEDIFF(MINUTE, T1.Date, T2.Date)) <= 60;
-------------------------------------------------------
#Transactions from Different Countries Within 10 Minutes
SELECT T1.AccountID, T1.TransactionID, T2.TransactionID
FROM Transactions T1
JOIN Transactions T2 ON T1.AccountID = T2.AccountID
AND T1.Country <> T2.Country
AND ABS(DATEDIFF(MINUTE, T1.Date, T2.Date)) <= 10;
