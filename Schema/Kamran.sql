create database BankingSystem

use BankingSystem


create schema digital_banking 

create table digital_banking.credit_cards (

    CardID INT PRIMARY KEY identity(1,1),
    CustomerID INT,
    CardNumber VARCHAR(20) UNIQUE,
    CardType varchar(30),
    CVV varchar(4),               -- CVV(Card Verification Value  3-4 digit number)
    ExpiryDate DATE,
    CreditLimit DECIMAL(12,2),
    Status varchar(20),                        --CustomerID FK
	);

	alter table digital_banking.credit_cards
	add CustomerID int

	alter table digital_banking.credit_cards
	add constraint FK_CustomerID
	foreign key (CustomerID) references Customers(CustomerID)


	create table digital_banking.CreditCardTransactions (
	TransactionID int primary key identity(1,1),
	Merchant varchar (50),
	Amount decimal(12,2),
	Currency char(5),                               --CardID FK
	Date date,
	Status varchar(50)
	);


	alter table  digital_banking.CreditCardTransactions
	add CardID int

	alter table digital_banking.CreditCardTransactions
	add constraint FK_CardID
	foreign key (CardID) references digital_banking.credit_cards


	create table digital_banking.OnlineBankingUsers (
	UserID int primary key identity(1,1),
	Username varchar(50),
	PasswordHash numeric(20),                                  -- CustomerID fk
	LastLogin datetime
	);

	alter table digital_banking.OnlineBankingUsers
	add CustomerID int

	alter table digital_banking.OnlineBankingUsers
	add constraint FK_CustomerID
	foreign key (CustomerID) references Customers(CustomerID)


	create table digital_banking.BillPayments (
	PaymentID int primary key identity(1,1),
	BillerName varchar(30),
	Amount numeric(20,2),
	Date date,
	Status varchar(20)                            --CustomerID fk
	);

alter table digital_banking.BillPayments
add CustomerID int

alter table digital_banking.BillPayments
add constraint FK_CustomerID
foreign key (CustomerID) references Customers(CustomerID)	
	


	create table digital_banking.MobileBankingTransactions ( 
	TransactionId int primary key identity(1,1),
	DeviceID int,
	AppVersion varchar(20),
	TransactionType varchar(20),                                  --CustomerID
	Amount numeric(12,2),
	Date date
	);

alter table digital_banking.MobileBankingTransactions
add CustomerID int

alter table digital_banking.MobileBankingTransactions
add constraint FK_CustomerID
foreign key (CustomerID) references Customers(CustomerID)	


	create schema loans_credits


	create table loans_credits.Loans (
	LoanID int primary key identity(1,1),
	LoanType varchar(50),
	Amount numeric (15,2),
	InterestRate decimal (5,2),
	StartDate date,
	EndDate date,                                     --customerID FK
	Status varchar(50)
	);

alter table loans_credits.Loans
add CustomerID int

alter table loans_credits.Loans
add constraint FK_CustomerID
foreign key (CustomerID) references Customers(CustomerID)	


	create table loans_credits.LoanPayments (
	PaymentID int primary key identity(1,1),
	AmountPaid decimal(12,2),
	PaymentDate date,                                    --LoanID Fk
	RemainingBalance decimal(15,2)
	);

ALTER TABLE loans_credits.LoanPayments
ADD LoanID INT;

ALTER TABLE loans_credits.LoanPayments
ADD CONSTRAINT FK_LoanID
FOREIGN KEY (LoanID) REFERENCES loans_credits.Loans(LoanID)

	create table loans_credits.CreditScores (
	CreditScore int,                                  --customerID fk
	UpdateAt datetime
	);
alter table loans_credits.CreditScores
add CustomerID int

alter table loans_credits.CreditScores
add constraint FK_CustomerID
foreign key (CustomerID) references Customers(CustomerID)	

	create table loans_credits.DebtCollection (
	DebtID int primary key identity(1,1),
	AmountDue decimal(12,2),
	DueDate date,                                          -- customerId fk
	CollectorAssigned varchar(30)
	);
alter table loans_credits.DebtCollection
add CustomerID int

alter table loans_credits.DebtCollection
add constraint FK_CustomerID 
foreign key (CustomerID) references Customers(CustomerID)
