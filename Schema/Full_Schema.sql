Create schema Core
GO
Create schema Insurance_Security
GO
CREATE TABLE Core.Accounts (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL, 
    AccountType NVARCHAR(50) NOT NULL, 
    Balance DECIMAL(18,2) NOT NULL DEFAULT 0,
    Currency NVARCHAR(10) DEFAULT 'USD',
    Status NVARCHAR(20) DEFAULT 'Active',
    BranchID INT,
    CreatedDate DATETIME
);
-----------------------------------------------------------------

GO
CREATE TABLE Insurance_Security.UserAccessLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    ActionType NVARCHAR(100),
    Timestamp DATETIME 
);
-----------------------------------------------------------------

GO
CREATE TABLE Insurance_Security.Claims (
    ClaimID INT PRIMARY KEY IDENTITY(1,1),
    PolicyID INT NOT NULL,
    ClaimAmount DECIMAL(18,2),
    Status NVARCHAR(30),
    FiledDate DATE

);
-----------------------------------------------------------------

GO

CREATE TABLE Insurance_Security.InsurancePolicies (
    PolicyID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    InsuranceType NVARCHAR(50),
    PremiumAmount DECIMAL(18,2),
    CoverageAmount DECIMAL(18,2)
);
-----------------------------------------------------------------

GO
CREATE TABLE Core.Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    BranchID INT NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(18,2),
    HireDate DATE ,
    Status NVARCHAR(20) DEFAULT 'Active'
);
---------------------------------------------------------------

GO
CREATE TABLE Core.Branches (
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

GO
CREATE TABLE Core.Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT NOT NULL,
    TransactionType NVARCHAR(50) NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    Currency NVARCHAR(10) DEFAULT 'USD',
    Date DATETIME ,
    Status NVARCHAR(20) DEFAULT 'Completed',
    ReferenceNo NVARCHAR(100)
);
---------------------------------------------------------------


CREATE TABLE Core.Customers (
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
    CreatedAt DATETIME ,
    UpdatedAt DATETIME 
);
---------------------------------------------------------------

GO
CREATE TABLE Insurance_Security.CyberSecurityIncidents (
    IncidentID INT PRIMARY KEY IDENTITY(1,1),
    AffectedSystem NVARCHAR(100),
    ReportedDate DATE,
    ResolutionStatus NVARCHAR(50)
);
---------------------------------------------------------------
---------------------------------------------------------------
---------------------------------------------------------------
go
create schema Digital_Banking
go
create table digital_banking.CreditCards (

    CardID INT PRIMARY KEY identity(1,1),
    CustomerID INT,
    CardNumber VARCHAR(20) UNIQUE,
    CardType varchar(30),
    CVV varchar(4),               -- CVV(Card Verification Value 3-4 digit number)
    ExpiryDate DATE,
    CreditLimit DECIMAL(12,2),
    Status varchar(20),
	);

--------------------------------------------------------------------



	create table digital_banking.CreditCardTransactions (
	TransactionID int primary key identity(1,1),
	CardID INT,
	Merchant varchar (50),
	Amount decimal(12,2),
	Currency char(5),                               --CardID FK
	Date date,
	Status varchar(50)
	);


--------------------------------------------------------------------


	create table digital_banking.OnlineBankingUsers (
	UserID int primary key identity(1,1),
	CustomerID int,
	Username varchar(50),
	PasswordHash numeric(20),                                  -- CustomerID fk
	LastLogin datetime
	);


--------------------------------------------------------------------


	create table digital_banking.BillPayments (
	PaymentID int primary key identity(1,1),
	CustomerID int,
	BillerName varchar(30),
	Amount numeric(20,2),
	Date date,
	Status varchar(20)                            --CustomerID fk
	);

--------------------------------------------------------------------



	create table digital_banking.MobileBankingTransactions ( 
	TransactionId int primary key identity(1,1),
	CustomerID int,
	DeviceID int,
	AppVersion varchar(20),
	TransactionType varchar(20),                                  --CustomerID
	Amount numeric(12,2),
	Date date
	);


	go
	create schema Loans_Credits
	go

	create table loans_credits.Loans (
	LoanID int primary key identity(1,1),
	CustomerID int,
	LoanType varchar(50),
	Amount numeric (15,2),
	InterestRate decimal (5,2),
	StartDate date,
	EndDate date,                                     --customerID FK
	Status varchar(50)
	);


--------------------------------------------------------------------


	create table loans_credits.LoanPayments (
	PaymentID int primary key identity(1,1),
	LoanID int,
	AmountPaid decimal(12,2),
	PaymentDate date,                                    --LoanID Fk
	RemainingBalance decimal(15,2)
	);

--------------------------------------------------------------------


	create table loans_credits.CreditScores (
	CustomerID int primary key,
	CreditScore int,                                  --customerID fk
	UpdateAt datetime
	);

--------------------------------------------------------------------


	create table loans_credits.DebtCollection (
	DebtID int primary key identity(1,1),
	CustomerID int,
	AmountDue decimal(12,2),
	DueDate date,                                          -- customerId fk
	CollectorAssigned varchar(30)
	);



--------------------------------------------------------------------------

go

	CREATE SCHEMA HR_and_Payroll;
go
CREATE TABLE HR_and_Payroll.Departments (
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(100),
	ManagerID INT
);

------------------------------------------------------------
CREATE TABLE HR_and_Payroll.Salaries (
	SalaryID INT PRIMARY KEY,
	EmployeeID INT,
	BaseSalary DECIMAL(10,2),
	Bonus DECIMAL(10,2),
	Deductions DECIMAL(10,2),
	PaymentDate DATE
);
-------------------------------------------------------
CREATE TABLE HR_and_Payroll.EmployeeAttendance(
	AttendanceID INT PRIMARY KEY IDENTITY(1,1),
	EmployeeID INT,
	CheckInTime TIME(0),
	CheckOutTime TIME(0),
	TotalHours INT
);

UPDATE HR_and_Payroll.EmployeeAttendance
SET CheckInTime = FORMAT(CheckInTime, 'hh:mm');
UPDATE HR_and_Payroll.EmployeeAttendance
SET CheckOutTime = FORMAT(CheckOutTime, 'hh:mm');
------------------------------------------------------
------------------------------------------------------

go
CREATE SCHEMA Compliance_and_RM;
go

CREATE TABLE Compliance_and_RM.KYC(
	KYCID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT,
	DocumentType VARCHAR(50),
	DocumantNumber VARCHAR(30),
	VerifiedBy VARCHAR(100)
);

--------------------------------------------------------

CREATE TABLE Compliance_and_RM.FraudDetection(
	FraudID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT,
	TransactionID INT,
	RiskLevel VARCHAR(20) CHECK(RiskLevel in ('Low', 'Moderate', 'High', 'Extreme')),
	ReportedDate DATE
);
------------------------------------------------------------
CREATE TABLE Compliance_and_RM.AML_Cases(
	CaseID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT,
	CaseType VARCHAR(50),
	[Status] VARCHAR(50),
	InvestigatorID INT
);

-------------------------------------------------------------
CREATE TABLE Compliance_and_RM.RegulatoryReports(
	ReportID INT PRIMARY KEY IDENTITY(1,1),
	ReportType VARCHAR(50),
	SubmissionDate DATETIME
);
--------------------------------------------------------------------
--------------------------------------------------------------------

CREATE SCHEMA Investments_and_treasury;
GO
CREATE TABLE Investments_and_treasury.Investments (
    InvestmentID INT PRIMARY KEY,
    CustomerID INT,
    InvestmentType VARCHAR(50),
    Amount DECIMAL(18, 2),
    ROI DECIMAL(5, 2),  -- Return on Investment as a percentage, e.g., 7.25
    MaturityDate DATE
);

CREATE TABLE Investments_and_treasury.InvesStockTradingAccounts(
	AccountID INT PRIMARY KEY,
	CustomerID INT,
	BrokerageFirm VARCHAR(100),
  TotalInvested DECIMAL(18, 2),
  CurrentValue DECIMAL(18, 2)
);

CREATE TABLE Investments_and_treasury.ForeignExchange(
	FXID INT PRIMARY KEY,
	CustomerID INT,
  CurrencyPair VARCHAR(10),            -- e.g., "USD/EUR"
  ExchangeRate DECIMAL(10, 4),         -- e.g., 1.0925
  AmountExchanged DECIMAL(18, 2)   
);

GO
CREATE SCHEMA Merchant_Services;
GO
CREATE TABLE Merchant_Services.Merchants(
	MerchantID INT PRIMARY KEY,
	MerchantName VARCHAR(55), 
	Industry VARCHAR(50),
	Location VARCHAR(100),
	CustomerID INT
);

CREATE TABLE Merchant_Services.MerchantTransactions(
	TransactionID INT PRIMARY KEY,
	MerchantID INT,
	Amount DECIMAL(18,2),
	Payment_Method VARCHAR(20),
	Date DATETIME
);
-----------------------




ALTER TABLE Core.Accounts
ADD FOREIGN KEY (CustomerID) REFERENCES Core.Customers(CustomerID)
ALTER TABLE Core.Accounts
ADD FOREIGN KEY (BranchID) REFERENCES Core.Branches(BranchID)
ALTER TABLE Core.Transactions
ADD FOREIGN KEY (AccountID) REFERENCES Core.Accounts(AccountID)
ALTER TABLE Core.Employees
ADD FOREIGN KEY (BranchID) REFERENCES Core.Branches(BranchID)
ALTER TABLE Core.Branches
ADD FOREIGN KEY (ManagerID) REFERENCES Core.Employees(EmployeeID)
ALTER TABLE Insurance_Security.InsurancePolicies
ADD FOREIGN KEY (CustomerID) REFERENCES Core.Customers(CustomerID)
ALTER TABLE Insurance_Security.Claims
ADD FOREIGN KEY (PolicyID) REFERENCES Insurance_Security.InsurancePolicies(PolicyID)
Alter table Insurance_Security.UserAccessLogs
add foreign key (UserID) references Digital_Banking.OnlineBankingUsers(UserID)
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
ALTER TABLE HR_and_Payroll.Departments
ADD FOREIGN KEY (ManagerID) REFERENCES  Core.Employees(EmployeeID);
--------------------------------------------------------------------
ALTER TABLE HR_and_Payroll.Salaries
ADD FOREIGN KEY (EmployeeID) REFERENCES Core.Employees(EmployeeID);
--------------------------------------------------------------------
ALTER TABLE HR_and_Payroll.EmployeeAttendance
ADD FOREIGN KEY (EmployeeID) REFERENCES Core.Employees(EmployeeID);
--------------------------------------------------------------------
ALTER TABLE Compliance_and_RM.KYC
ADD FOREIGN KEY (CustomerID) REFERENCES Core.Customers(CustomerID);
--------------------------------------------------------------------
ALTER TABLE Compliance_and_RM.FraudDetection
ADD FOREIGN KEY (CustomerID) REFERENCES Core.Customers(CustomerID);

ALTER TABLE Compliance_and_RM.FraudDetection
ADD FOREIGN KEY (TransactionID) REFERENCES Core.Transactions(TransactionID);
--------------------------------------------------------------------
ALTER TABLE Compliance_and_RM.AML_Cases
ADD FOREIGN KEY (CustomerID) REFERENCES Core.Customers(CustomerID)
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
	alter table digital_banking.CreditCards
	add foreign key (CustomerID) references Core.Customers(CustomerID)
--------------------------------------------------------------------

	alter table digital_banking.CreditCardTransactions
	add foreign key (CardID) references digital_banking.CreditCards(CardID)
--------------------------------------------------------------------

	alter table digital_banking.OnlineBankingUsers
	add foreign key (CustomerID) references Core.Customers(CustomerID)
--------------------------------------------------------------------
	alter table digital_banking.BillPayments
	add foreign key (CustomerID) references Core.Customers(CustomerID)	
--------------------------------------------------------------------
	alter table digital_banking.MobileBankingTransactions
	add foreign key (CustomerID) references Core.Customers(CustomerID)	
--------------------------------------------------------------------

alter table loans_credits.Loans
add foreign key (CustomerID) references Core.Customers(CustomerID)	
--------------------------------------------------------------------

ALTER TABLE loans_credits.LoanPayments
ADD FOREIGN KEY (LoanID) REFERENCES loans_credits.Loans(LoanID)
--------------------------------------------------------------------

alter table loans_credits.CreditScores
add foreign key (CustomerID) references Core.Customers(CustomerID)
--------------------------------------------------------------------

alter table loans_credits.DebtCollection
add foreign key (CustomerID) references Core.Customers(CustomerID)


-------------------------------------------------------------------
------------------------------------------------------------
ALTER TABLE Investments_and_treasury.Investments
ADD FOREIGN KEY (CustomerID) REFERENCES  Core.Customers(CustomerID);
------------------------------------------------------------
ALTER TABLE Investments_and_treasury.InvesStockTradingAccounts
ADD FOREIGN KEY (CustomerID) REFERENCES  Core.Customers(CustomerID);
-------------------------------------------------------------
ALTER TABLE Investments_and_treasury.ForeignExchange
ADD FOREIGN KEY (CustomerID) REFERENCES  Core.Customers(CustomerID);
-------------------------------------------------------------
ALTER TABLE Merchant_Services.Merchants
ADD FOREIGN KEY (CustomerID) REFERENCES  Core.Customers(CustomerID);
-------------------------------------------------------------
ALTER TABLE Merchant_Services.MerchantTransactions 
ADD FOREIGN KEY (MerchantID) REFERENCES Merchant_Services.Merchants(MerchantID);
