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
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
SELECT 
    a.AccountID,
    ROUND(
        (
            ISNULL(SUM(t.Amount), 0) 
            - 
            ISNULL(SUM(l.Amount), 0)
        ) * 100.0 / NULLIF(a.Balance, 0), 
    2) AS return_on_assets
FROM 
    Accounts a
LEFT JOIN dbo.Transactions t ON a.AccountID = t.AccountID AND t.Status = 'Completed'
LEFT JOIN dbo.Customers c ON a.CustomerID = c.CustomerID
LEFT JOIN loans_credits.Loans l ON c.CustomerID = l.CustomerID
GROUP BY 
    a.AccountID, a.Balance;

	--- here i calculated ROA(Return on assets) profitability indicator  which tells us how banks are using  assets (loans reserves,investments) to generate profit








