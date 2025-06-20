BULK INSERT Compliance_and_RM.KYC
FROM 'D:\fake_data\KYC.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
)
BULK INSERT Compliance_and_RM.FraudDetection
FROM 'D:\fake_data\FraudDetection.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
)
BULK INSERT Compliance_and_RM.AML
FROM 'D:\fake_data\AML.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
)
BULK INSERT Compliance_and_RM.RegulatoryReports
FROM 'D:\fake_data\RegulatoryReports.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
)
BULK INSERT HR_and_Payroll.Departments
FROM 'D:\fake_data\departments.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
)
BULK INSERT HR_and_Payroll.EmployeeAttendance
FROM 'D:\fake_data\employee_attendance.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
)
BULK INSERT HR_and_Payroll.Salaries
FROM 'D:\fake_data\salaries.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
)
