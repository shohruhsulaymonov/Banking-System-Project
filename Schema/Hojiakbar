USE BankingSystem;
GO
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL, 
    AccountType NVARCHAR(50) NOT NULL, 
    Balance DECIMAL(18,2) NOT NULL DEFAULT 0,
    Currency NVARCHAR(10) DEFAULT 'USD',
    Status NVARCHAR(20) DEFAULT 'Active',
    BranchID INT,
    CreatedDate DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-----------------------------------------------------------------
USE BankingSystem;
GO
CREATE TABLE UserAccessLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    ActionType NVARCHAR(100),
    Timestamp DATETIME DEFAULT GETDATE()
);
-----------------------------------------------------------------
USE BankingSystem;
GO
CREATE TABLE Claims (
    ClaimID INT PRIMARY KEY IDENTITY(1,1),
    PolicyID INT NOT NULL,
    ClaimAmount DECIMAL(18,2),
    Status NVARCHAR(30),
    FiledDate DATE DEFAULT GETDATE(),

    FOREIGN KEY (PolicyID) REFERENCES InsurancePolicies(PolicyID)
);
-----------------------------------------------------------------
USE BankingSystem;
GO

CREATE TABLE InsurancePolicies (
    PolicyID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    InsuranceType NVARCHAR(50),
    PremiumAmount DECIMAL(18,2),
    CoverageAmount DECIMAL(18,2),

    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-----------------------------------------------------------------
USE BankingSystem;
GO
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    BranchID INT NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(18,2),
    HireDate DATE DEFAULT GETDATE(),
    Status NVARCHAR(20) DEFAULT 'Active',

    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
---------------------------------------------------------------
USE BankingSystem;
GO
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY IDENTITY(1,1),
    BranchName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Country NVARCHAR(100),
    ManagerID INT,
    ContactNumber NVARCHAR(20)
);
---------------------------------------------------------------
USE BankingSystem;
GO
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT NOT NULL,
    TransactionType NVARCHAR(50) NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    Currency NVARCHAR(10) DEFAULT 'USD',
    Date DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(20) DEFAULT 'Completed',
    ReferenceNo NVARCHAR(100),

    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
---------------------------------------------------------------
USE BankingSystem;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(20),
    Address NVARCHAR(255),
    NationalID NVARCHAR(50) UNIQUE NOT NULL,
    TaxID NVARCHAR(50),
    EmploymentStatus NVARCHAR(50),
    AnnualIncome DECIMAL(18,2),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
---------------------------------------------------------------
USE BankingSystem;
GO
CREATE TABLE CyberSecurityIncidents (
    IncidentID INT PRIMARY KEY IDENTITY(1,1),
    AffectedSystem NVARCHAR(100),
    ReportedDate DATE,
    ResolutionStatus NVARCHAR(50)
);

