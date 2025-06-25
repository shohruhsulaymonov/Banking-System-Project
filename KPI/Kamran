SELECT 
    a.CustomerID,
    SUM(a.Balance) AS total_deposits,
    SUM(l.Amount) AS total_loan,
    -- Decimal ratio
    SUM(a.Balance) * 1.0 / NULLIF(SUM(l.Amount), 0) AS loan_to_deposit_ratio,
    SUM(a.Balance) * 100.0 / NULLIF(SUM(l.Amount), 0) AS loan_to_deposit_percentage
FROM dbo.Accounts a
JOIN dbo.Customers c ON c.CustomerID = a.CustomerID
JOIN loans_credits.Loans l ON c.CustomerID = l.CustomerID
GROUP BY a.CustomerID;
  





