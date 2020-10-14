Use master
DROP DATABASE ShoesShop
CREATE DATABASE ShoesShop
USE ShoesShop
go
--DANH MUC SAN PHAM
CREATE TABLE Menu
(
	MenuId             INT IDENTITY (1,1) PRIMARY KEY,
	MenuName		   NVARCHAR(100),
	MenuImage		   NVARCHAR(100),
)
GO
--SAN PHAM--
CREATE TABLE Product
(
	ProductId		   INT IDENTITY (1,1) PRIMARY KEY,
	ProductName		   NVARCHAR(100),
	ProductContent     NTEXT,
	ProductImages      NVARCHAR(100),
	ProductPrice       FLOAT,
	MenuId			   INT FOREIGN KEY REFERENCES Menu(MenuId),
	Discount           FLOAT,
)
GO


--KICH THUONG--
CREATE TABLE Sizes
(
	SizeId			   INT IDENTITY (1,1) PRIMARY KEY,
	SizeName		   FLOAT,
)
GO
--KICH THUOC SAN PHAM--
CREATE TABLE ProductSize
(
	ProductSizeId		INT IDENTITY (1,1) PRIMARY KEY,
	SizeId				INT,
	ProductId			INT,
	Quantity			INT,
	FOREIGN KEY (SizeId)    REFERENCES Sizes(SizeId),
	FOREIGN KEY (ProductId) REFERENCES Product(ProductId),
)
GO
--HINH ANH CHI TIET
CREATE TABLE ImageDetail
(
	ImageId			   INT IDENTITY (1,1) PRIMARY KEY,
	ProductId          INT,
	ImageLink		   NVARCHAR(100) ,
	FOREIGN KEY (ProductId) REFERENCES Product(ProductId),
)
GO

--USERS
CREATE TABLE Users
(
	UserId			       INT IDENTITY (1,1) PRIMARY KEY,
	UserName			   VARCHAR(25),
	UserPass               VARCHAR(25),
	UserEmail			   VARCHAR(200),
	UserPhone			   VARCHAR(200),
	UserAddress		       NVARCHAR(300),
	Roles				   BIT,
)
GO
SELECT * FROM ProductSize
DELETE FROM ProductSize WHERE ProductSizeId=7
--DON HANG
CREATE TABLE Orders
(
	OrderId				INT IDENTITY (1,1) PRIMARY KEY,
	UserId				INT FOREIGN KEY REFERENCES Users(UserId),
	Addresss			NVARCHAR(300),
	Phone				VARCHAR(200),
	OrderDate			DATE,
	OrdersStatus		NTEXT,
	OrdersPayment		BIT
)
GO
CREATE TABLE OrderDetail
(
	OrderDetailId		INT IDENTITY (1,1) PRIMARY KEY,	   
	OrderId				INT,
	ProductSizeId		INT,
	Quantity			INT,
	Price				FLOAT,
	FOREIGN KEY (OrderId) REFERENCES Orders(OrderId) on delete cascade,	
	FOREIGN KEY (ProductSizeId) REFERENCES ProductSize(ProductSizeId),
)
GO


CREATE TABLE ShoppingCart
(
	ShoppingCartId	   INT IDENTITY (1,1) PRIMARY KEY,
	UserId			   INT FOREIGN KEY REFERENCES Users(UserId),
)
GO

CREATE TABLE CartItems
(
	CartItems			INT IDENTITY (1,1) PRIMARY KEY,
	ProductSizeId		INT FOREIGN KEY REFERENCES ProductSize(ProductSizeId),
	ShoppingCartId		INT FOREIGN KEY REFERENCES ShoppingCart(ShoppingCartId),
	Quantity			INT
)
GO
SELECT * FROM CartItems
DELETE FROM ShoppingCart
--INSERT MENU
INSERT INTO Menu VALUES (N'ADIDAS')
INSERT INTO Menu VALUES (N'NIKE')
INSERT INTO Menu VALUES (N'CONVERSE')
INSERT INTO Menu VALUES (N'PUMA')

--INSERT Product
insert into Product values (N'Stan Smith',N'ss by adidas','add-ss.jpg',5,1,0)
insert into Product values (N'NMD R1',N'nmd by adidas','add-nmdr1.jpg',6,1,0)
insert into Product values (N'Chuck Taylor',N'ct by cv','cv-ct.jpg',7,3,0)
insert into Product values (N'Chuck Taylor 2',N'ct by cv','cv-ct.jpg',8,3,0)
go

--INSERT Size
insert into Sizes values(37)
insert into Sizes values(38)
insert into Sizes values(39)
insert into Sizes values(40)
insert into Sizes values(41)
insert into Sizes values(42)
go

--INSERT ProductSize
insert into ProductSize values (1,1,2)
insert into ProductSize values (2,1,3)
insert into ProductSize values (3,1,3)
insert into ProductSize values (5,1,2)
go

--INSERT Users
INSERT INTO Users VALUES ('nhai3056','y86bbEt3qd32A8/Qeoy3tg==',NULL,NULL,NULL,0)
INSERT INTO Users VALUES ('nguyenminhhai','y86bbEt3qd32A8/Qeoy3tg==','nhai3056@gmail.com','01639420806','Hanoi',1)
--DELETE FROM CartItems
--DELETE FROM Sizes
--DELETE FROM ProductSize
--DELETE FROM Product
--Drop table Orders


