CREATE TABLE Planogram (
	PlanogramName VARCHAR (20),
	PlanogramDescription VARCHAR (25),
	PlanogramID INT,
	Category INT,
	PRIMARY KEY(PlanogramID)
);

CREATE TABLE Products (
	SKU INT,
	ManufacturerNbr VARCHAR (20),
	ProductDescription VARCHAR (25),
	Cost DOUBLE PRECISION,
	Price DOUBLE PRECISION,
	ProductCategory INT,
	PRIMARY KEY(SKU)
);

CREATE TABLE Stores (
	StoreName VARCHAR (20),
	StoreNbr INT,
	City VARCHAR (20),
	PRIMARY KEY (StoreNbr)
);

CREATE TABLE PlanogramProducts (
	SKU INT,
	PlanogramID INT,
	FOREIGN KEY (SKU) REFERENCES Products(SKU),
	FOREIGN KEY (PlanogramID) REFERENCES Planogram(PlanogramID)
);

CREATE TABLE Positions (
	PlanogramID INT,
	Position INT,
	MinDeep INT,
	SKU INT,
	NbrFacings Int,
	FOREIGN KEY (PlanogramID) REFERENCES Planogram(PlanogramID)
);

CREATE TABLE StorePogs (
	StoreNbr INT,
	PlanogramID INT,
	StoreTable VARCHAR (5),
	Side VARCHAR (1),
	Section INT,
	FOREIGN KEY (PlanogramID) REFERENCES Planogram(PlanogramID),
	FOREIGN KEY (StoreNbr) REFERENCES Stores(StoreNbr)
);

