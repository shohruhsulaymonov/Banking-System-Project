

CREATE SCHEMA Investments_and_treasure;
GO
CREATE TABLE Investments_and_treasure.Investments (
    InvestmentID INT PRIMARY KEY,
    CustomerID INT,
    InvestmentType VARCHAR(50),
    Amount DECIMAL(18, 2),
    ROI DECIMAL(5, 2),  -- Return on Investment as a percentage, e.g., 7.25
    MaturityDate DATE
);

CREATE TABLE Investments_and_treasure.InvesStockTradingAccounts(
	AccountID INT PRIMARY KEY,
	CustomerID INT,
	BrokerageFirm VARCHAR(100),
  TotalInvested DECIMAL(18, 2),
  CurrentValue DECIMAL(18, 2)
);

CREATE TABLE Investments_and_treasure.ForeignExchange(
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

CREATE TABLE Merchant_Services. MerchantTransactions(
	TransactionID INT PRIMARY KEY,
	MerchantID INT,
	Amount DECIMAL(18,2),
	Payment_Method VARCHAR(20),
	Date DATETIME DEFAULT GETDATE()
);
-------------------------------------------------------------------
------------------------------------------------------------
ALTER TABLE Investments_and_treasure.Investments
ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
------------------------------------------------------------
ALTER TABLE Investments_and_treasure.InvesStockTradingAccounts
ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
-------------------------------------------------------------
ALTER TABLE Investments_and_treasure.ForeignExchange
ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
-------------------------------------------------------------
ALTER TABLE Merchant_Services.Merchants
ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
-------------------------------------------------------------
ALTER TABLE Merchant_Services.MerchantTransactions 
ADD FOREIGN KEY (MerchantID) REFERENCES Merchant_Services.Merchants(MerchantID);

