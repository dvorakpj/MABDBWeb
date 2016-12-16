﻿CREATE TABLE [dbo].[ValuationSupplier]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[CompanyName] varchar(100) NULL,
	[TradingName] varchar(100) NULL,
	[RegisteredName] varchar(100) NULL,
	[ABN] VARCHAR(15) NULL,
	[ACN] VARCHAR(15) NULL,
	[MainContactName] varchar(100) NULL,
	[OtherContactName] varchar(100) NULL,
	[EmailMain] VARCHAR(50) NULL, 
	[EmailOther] VARCHAR(50) NULL,
	[MainPhoneMobile] VARCHAR(50) NULL, 
	[MainPhoneWork] VARCHAR(15) NULL, 
	[OtherPhoneMobile] VARCHAR(15) NULL, 
	[OtherPhoneWork] VARCHAR(15) NULL, 
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
    [RegionalOfficeId] INT NULL,
	[Created] DATETIME2 NOT NULL, 
	[CreatedBy] VARCHAR(25) NOT NULL, 
	[Updated] DATETIME2 NULL, 
	[UpdatedBy] VARCHAR(25) NULL, 
	
)
