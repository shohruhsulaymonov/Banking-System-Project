-----------------------------------------------------
BULK INSERT dbo.Customers
FROM 'C:\Users\user\OneDrive\Desktop\New folder\Customers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\r\n',
    CODEPAGE = '65001',
    TABLOCK
);
------------------------------------------------------
BULK INSERT dbo.Accounts
FROM 'C:\Users\user\OneDrive\Desktop\New folder\Accounts.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\r\n',
    CODEPAGE = '65001',
    TABLOCK
);
-----------------------------------------------------
BULK INSERT dbo.Transactions
FROM 'C:\Users\user\OneDrive\Desktop\New folder\Transactions.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\r\n',
    CODEPAGE = '65001',
    TABLOCK
);
----------------------------------------------------
BULK INSERT dbo.Claims
FROM 'C:\Users\user\OneDrive\Desktop\New folder\Claims.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\r\n',
    CODEPAGE = '65001',
    TABLOCK
);
---------------------------------------------------
BULK INSERT dbo.InsurancePolicies
FROM 'C:\Users\user\OneDrive\Desktop\New folder\InsurancePolicies.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\r\n',
    CODEPAGE = '65001',
    TABLOCK
);
---------------------------------------------------
BULK INSERT dbo.Employees
FROM 'C:\Users\user\OneDrive\Desktop\New folder\Employees.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\r\n',
    CODEPAGE = '65001',
    TABLOCK
);
---------------------------------------------------
BULK INSERT dbo.Branches
FROM 'C:\Users\user\OneDrive\Desktop\New folder\Branches.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\r\n',
    CODEPAGE = '65001',
    TABLOCK
);
---------------------------------------------------
BULK INSERT dbo.CyberSecurityIncidents
FROM 'C:\Users\user\OneDrive\Desktop\New folder\CyberSecurityIncidents.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\r\n',
    CODEPAGE = '65001',
    TABLOCK
);
--------------------------------------------------
BULK INSERT dbo.UserAccessLogs
FROM 'C:\Users\user\OneDrive\Desktop\New folder\UserAccessLogs.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\r\n',
    CODEPAGE = '65001',
    TABLOCK
);
