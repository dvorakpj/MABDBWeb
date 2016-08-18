CREATE TABLE [dbo].[Property]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [MAId] VARCHAR(50) NULL, 
    [Type] SMALLINT NULL, 
    [UnitNum] VARCHAR(25) NULL, 
	[Street1] VARCHAR(50) NULL, 
    [Street2] VARCHAR(50) NULL, 
    [Street3] VARCHAR(50) NULL,     
    [Suburb] NCHAR(10) NULL, 
    [Postcode] SMALLINT NULL, 
	[State] VARCHAR(15) NULL,
    [PrimaryInvestorId] INT NULL, 
    [VendorId] INT NULL, 
    [ListingAgentId] INT NULL,
	[Description] VARCHAR(1250) NULL
)
