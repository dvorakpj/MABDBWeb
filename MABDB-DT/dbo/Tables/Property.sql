﻿CREATE TABLE [dbo].[Property]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
	[MAId] VARCHAR(50) NULL, 
	[Type] SMALLINT NULL, 
	[UnitNum] VARCHAR(25) NULL, 
	[Street1] VARCHAR(50) NULL, 
	[Street2] VARCHAR(50) NULL, 
	[Street3] VARCHAR(50) NULL, 
	[Street4] VARCHAR(50) NULL, 
	[Street5] VARCHAR(50) NULL,     
	[Suburb] NCHAR(10) NULL, 
	[Postcode] SMALLINT NULL, 
	[State] VARCHAR(15) NULL,	
	[Description] VARCHAR(1250) NULL, 
	[Country] VARCHAR(50) NULL, 
	[LocalGov] VARCHAR(50) NULL, 
	[ListPrice] DECIMAL(15, 2) NULL, 
	[AgreedPrice] DECIMAL(15, 2) NULL, 
	[PurchasePrice] DECIMAL(15, 2) NULL, 	
	[TitleType] VARCHAR(25) NULL, 
	[Lot] VARCHAR(25) NULL, 
	[Plan] VARCHAR(50) NULL, 
	[Parish] VARCHAR(50) NULL, 
	[CTVolume] VARCHAR(50) NULL, 
	[CTFolio] VARCHAR(50) NULL, 
	[AreaSqm] DECIMAL NULL, 
	[InvestorApplicationId] INT NULL, 
	[InvestorListingFeePaid] DATETIME2 NULL, 
	[BuyerListingFeePaid] DATETIME2 NULL, 
	[ListingComments] VARCHAR(250) NULL, 
	[InvestorListingAgentId] INT NULL, 
	[VendorId] INT NULL, 
	[DevelopmentId] INT NULL, 
	[PrimaryInvestorId] INT NULL, 
	[InvestorContractId] INT NULL,
	[BuyerContractId] INT NULL,
	[BuyerId] INT NULL, 
	[ManagingAgentId] INT NULL,
	[Created] DATETIME2 NULL, 
	[CreatedBy] VARCHAR(50) NULL, 
	[Updated] DATETIME2 NULL, 
	[UpdatedBy] VARCHAR(50) NULL, 

	CONSTRAINT [FK_Property_Investor] FOREIGN KEY ([PrimaryInvestorId]) REFERENCES [Investor]([Id]), 
	CONSTRAINT [FK_Property_InvestorApplications] FOREIGN KEY ([InvestorApplicationId]) REFERENCES [InvestorApplications]([Id]),
	CONSTRAINT [FK_Property_InvestorListingAgent] FOREIGN KEY ([InvestorListingAgentId]) REFERENCES Agent([Id]), 
	CONSTRAINT [FK_Property_ManagingAgent] FOREIGN KEY ([ManagingAgentId]) REFERENCES Agent([Id]), 	
	CONSTRAINT [FK_Property_Vendor] FOREIGN KEY ([VendorId]) REFERENCES Vendor([Id]), 
	CONSTRAINT [FK_Property_Buyer] FOREIGN KEY ([BuyerId]) REFERENCES Buyer([Id]), 
)
