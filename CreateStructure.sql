CREATE DATABASE productsdb;
GO
USE productsdb;

CREATE TABLE dbo.SKU
(
    ID INT   IDENTITY ,
    Name  VARCHAR(256),
    Code  AS 's' + ID  UNIQUE,

);

CREATE TABLE       dbo.Family
(
    ID INT   IDENTITY ,
    SurName  VARCHAR(256),
    BudgetValue  VARCHAR(256),
);
CREATE TABLE   dbo.Basket
(
    ID INT   IDENTITY ,
    ID_SKU int,
    ID_Family int,
    Quantity int,
    Value int  CHECK (Value>0),
    PurchaseDate datetime DEFAULT (getdate()),
    DiscountValue int  CHECK (DiscountValue>0),
    FOREIGN KEY (ID_SKU)  REFERENCES dbo.SKU (ID),
    FOREIGN KEY (ID_Family)  REFERENCES  dbo.Family (ID)
);

