﻿CREATE TABLE [dbo].[BuildingInspector]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[FirstName] NVARCHAR(50) NULL, 
	[LastName] NVARCHAR(50) NULL, 
	[OtherNames] NVARCHAR(150) NULL, 
	[Title] VARCHAR(15) NULL, 
	[RegBusinessName] varchar(100) NULL,
	[ABN] VARCHAR(15) NULL,
	[ACN] VARCHAR(15) NULL,
	[TradingName] varchar(100) NULL,
	[Email] VARCHAR(50) NULL, 
	[EmailOther] VARCHAR(50) NULL,
	[PhoneMobile] VARCHAR(50) NULL, 
	[PhoneWork] VARCHAR(15) NULL, 
	[PhoneOther] VARCHAR(15) NULL, 
	[ContactNote] VARCHAR(1000) NULL,
	[Notes] VARCHAR(5000) NULL,
	[RegAddr_Street1] VARCHAR(50) NULL, 
	[RegAddr_Street2] VARCHAR(50) NULL, 
	[RegAddr_Street3] VARCHAR(50) NULL, 
	[RegAddr_Suburb] VARCHAR(50) NULL, 
	[RegAddr_Postcode] VARCHAR(10) NULL, 
	[RegAddr_State] VARCHAR(50) NULL, 
	[RegAddr_Country] VARCHAR(50) NULL, 
	[BillAddr_Name] VARCHAR(100) NULL,
	[BillAddr_Street1] NCHAR(10) NULL, 
	[BillAddr_Street2] VARCHAR(50) NULL, 
	[BillAddr_Street3] VARCHAR(50) NULL, 
	[BillAddr_Suburb] VARCHAR(50) NULL, 
	[BillAddr_Postcode] VARCHAR(10) NULL, 
	[BillAddr_State] VARCHAR(50) NULL, 
	[BillAddr_Country] VARCHAR(50) NULL,
)
