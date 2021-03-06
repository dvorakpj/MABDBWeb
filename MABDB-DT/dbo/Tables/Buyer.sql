﻿CREATE TABLE [dbo].[Buyer]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1) , 
	[MABuyerId] VARCHAR(20) NULL,
	[BuyerApplicationId] int NULL FOREIGN KEY REFERENCES [BuyerApplications] (Id),
	[PrimaryBuyerId] int NULL FOREIGN KEY REFERENCES [Buyer] (Id),
	[Title] VARCHAR(25) NULL, 
	[FirstName] NVARCHAR(50) NULL, 
	[OtherNames] NVARCHAR(150) NULL, 
	[LastName] NVARCHAR(50) NULL, 
	[DOB] DATE NULL, 
	[Gender] CHAR NOT NULL,
	[Res_UnitNum] NVARCHAR(25) NULL, 
	[Res_Street1] NVARCHAR(50) NOT NULL, 
	[Res_Street2] NVARCHAR(50) NULL, 
	[Res_Street3] NVARCHAR(50) NULL,
	[Res_Street4] NVARCHAR(50) NULL,
	[Res_Street5] NVARCHAR(50) NULL,
	[Res_Postcode] SMALLINT NULL, 
	[Res_Suburb] NVARCHAR(50) NOT NULL, 
	[Res_City] NVARCHAR(50) NULL, 
	[Res_State] NVARCHAR(50) NULL, 
	[Res_Country] VARCHAR(50) NOT NULL, 
	[Bill_UnitNum] NVARCHAR(25) NULL, 
	[Bill_Street1] NVARCHAR(50) NULL, 
	[Bill_Street2] NVARCHAR(50) NULL, 
	[Bill_Street3] NVARCHAR(50) NULL,
	[Bill_Street4] NVARCHAR(50) NULL,
	[Bill_Street5] NVARCHAR(50) NULL,
	[Bill_Postcode] VARCHAR(15) NULL, 
	[Bill_Suburb] NVARCHAR(50) NULL, 
	[Bill_City] NVARCHAR(50) NULL, 
	[Bill_State] NVARCHAR(50) NULL, 
	[Bill_Country] VARCHAR(50) NULL,         
	[Comments] VARCHAR(250) NULL, 
	[PhoneMobile] VARCHAR(15) NULL,
	[PhoneHome] VARCHAR(15) NULL,
	[PhoneWork] VARCHAR(15) NULL, 
	[PhoneOther] VARCHAR(15) NULL, 
	[Email] VARCHAR(50) NULL, 
	[EmailOther] VARCHAR(50) NULL, 
	[ContactComments] VARCHAR(50) NULL,
	[DeathCoverInsurer] VARCHAR(50) NULL,
	[DeathCoverDetail] VARCHAR(250) NULL,
	[TPDCoverInsurer] VARCHAR(50) NULL,
	[TPDCoverDetail] VARCHAR(250) NULL,
	[MAStatus] VARCHAR(25) NOT NULL, 
	[AppliedDate] DATETIME2 NOT NULL, 
	[MAApprovedDate] DATETIME2 NULL, 
	[Created] DATETIME2 NOT NULL, 
	[CreatedBy] VARCHAR(25) NOT NULL, 
	[Updated] DATETIME2 NULL, 
	[UpdatedBy] VARCHAR(25) NULL,
	[CondCreditDecisionDate]                       DATETIME           NULL,
	[CondCreditDecision] CHAR(1) NULL, 
	[CondCreditDecisionBy]     VARCHAR (25)       NULL,
	[CondCreditDecisionInformed] DATETIME2 NULL, 
	[CondCreditDecisionInformedBy] VARCHAR(50) NULL, 
	[FinalCreditDecision] CHAR(1) NULL,
	[FinalCreditDecisionDate] DATETIME2 NULL,
	[FinalCreditDecisionBy] VARCHAR(25) NULL,
	[FinalCreditDecisionComments] VARCHAR(2500) NULL, 
	[FinalCreditDecisionInformed] DATETIME2 NULL, 
	[FinalCreditDecisionInformedBy] VARCHAR(50) NULL, 
	[AppliedLimit$] Decimal(12,2) NULL,
	[CondApprovedLimit$]	Decimal(12,2) NULL,
	[FinalApprovedLimit$] Decimal(12,2) NULL
	 CONSTRAINT [UC_Buyer_MABuyerId] UNIQUE (MABuyerId),
)
