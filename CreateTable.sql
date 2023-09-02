CREATE TABLE DimCustomer (
	CustomerID int NOT NULL PRIMARY KEY,
	CustomerName varchar(50) NOT NULL,
	Age int NOT NULL,
	Gender varchar(50) NOT NULL,
	City varchar(50) NOT NULL,
	NoHp varchar(50) NOT NULL
	);

CREATE TABLE DimProduct (
	ProductID int NOT NULL PRIMARY KEY,
	ProductName varchar(255) NOT NULL,
	ProductCategory varchar(255) NOT NULL,
	ProductUnitPrice int NOT NULL
	);

CREATE TABLE DimStatusOrder (
	StatusID int NOT NULL PRIMARY KEY,
	StatusOrder varchar(50) NOT NULL,
	StatusOrderDesc varchar(50) NOT NULL
	);

CREATE TABLE FactSalesOrder (
	OrderID int NOT NULL PRIMARY KEY,
	CustomerID int NOT NULL FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
	ProductID int NOT NULL FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
	Quantity int NOT NULL,
	Amount int NOT NULL,
	StatusID int NOT NULL FOREIGN KEY (StatusID) REFERENCES DimStatusOrder(StatusID),
	OrderDate date NOT NULL
	);
