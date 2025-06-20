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
