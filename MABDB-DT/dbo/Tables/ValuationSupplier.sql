﻿CREATE TABLE [dbo].[ValuationSupplier]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[CompanyName] varchar(100) NULL,
	[TradingName] varchar(100) NULL,
	[RegisteredName] varchar(100) NULL,
	[ABN] VARCHAR(15) NULL,
	[ACN] VARCHAR(15) NULL,
	[PrincipalName] varchar(100) NULL,
	[OfficeAdminContactName] varchar(100) NULL,
	[OfficeAdminEmail] VARCHAR(50) NULL, 
	[OfficeAdminEmailOther] VARCHAR(50) NULL,
	[OfficeAdminPhoneMobile] VARCHAR(50) NULL, 
	[OfficeAdminPhone] VARCHAR(15) NULL, 
	[OfficeAdminPhoneOther] VARCHAR(15) NULL, 	
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
	[PrincipalAddr_Street1] VARCHAR(50) NULL, 
	[PrincipalAddr_Street2] VARCHAR(50) NULL, 
	[PrincipalAddr_Street3] VARCHAR(50) NULL, 
	[PrincipalAddr_Suburb] VARCHAR(50) NULL, 
	[PrincipalAddr_Postcode] VARCHAR(10) NULL, 
	[PrincipalAddr_State] VARCHAR(50) NULL, 
	[PrincipalAddr_Country] VARCHAR(50) NULL,
	[APIMembNo] varchar(15) NULL,
	[ValuerQuals] varchar(100) NULL,
	[YearsExpResPtyVal] INT NULL,
	[Avg3YVolResPtyValsPA] int NULL,
	[FairTradingIssues] varchar(250) NULL,
	[QLDOpsDesc] varchar(550) NULL,
	[Partners] varchar(550) NULL,
	[PIInsurer] varchar(100) NULL,
	[PIInsRenewalDate] date NULL,
	[PIInsAmtEvidence] varchar(150) NULL,
	[APIMembEvidence] varchar(120) NULL,
	[RegionalOfficeId] INT NULL,
	[Created] DATETIME2 NOT NULL, 
	[CreatedBy] VARCHAR(25) NOT NULL, 
	[Updated] DATETIME2 NULL, 
	[UpdatedBy] VARCHAR(25) NULL
	
)
