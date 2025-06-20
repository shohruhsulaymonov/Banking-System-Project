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
	AttendanceID INT PRIMARY KEY,
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
	DocumentNumber VARCHAR(30),
	VerifiedBy VARCHAR(100)
);

--------------------------------------------------------

CREATE TABLE Compliance_and_RM.FraudDetection(
	FraudID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT,
	TransactionID INT,
	RiskLevel VARCHAR(20) CHECK(RiskLevel in ('Low', 'Moderate', 'High', 'Extreme')),
	ReportedDate DATETIME
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
--------------------------------------------------------------------
ALTER TABLE HR_and_Payroll.Departments
ADD FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID);
--------------------------------------------------------------------
ALTER TABLE HR_and_Payroll.Salaries
ADD FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);
--------------------------------------------------------------------
ALTER TABLE HR_and_Payroll.EmployeeAttendance
ADD FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);
--------------------------------------------------------------------
ALTER TABLE Compliance_and_RM.KYC
ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
--------------------------------------------------------------------
ALTER TABLE Compliance_and_RM.FraudDetection
ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

ALTER TABLE Compliance_and_RM.FraudDetection
ADD FOREIGN KEY (TransactionID) REFERENCES digital_banking.Transactions(TransactionID);
--------------------------------------------------------------------
ALTER TABLE Compliance_and_RM.AML_Cases
ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
