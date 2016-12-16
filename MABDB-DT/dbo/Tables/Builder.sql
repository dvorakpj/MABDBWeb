CREATE TABLE [dbo].[Builder]
(
	[Id] INT NOT NULL PRIMARY KEY, 
	[CompanyName] VARCHAR(50) NULL, 
	[ACN] VARCHAR(15) NULL, 
	[ABN] VARCHAR(15) NULL, 
	[RegOffice_Street1] VARCHAR(50) NULL, 
	[RegOffice_Street2] VARCHAR(50) NULL, 
	[RegOffice_Street3] VARCHAR(50) NULL, 
	[RegOffice_Suburb] VARCHAR(50) NULL, 
	[RegOffice_City] VARCHAR(50) NULL, 
	[RegOffice_Postcode] VARCHAR(10) NULL, 
	[RegOffice_State] VARCHAR(50) NULL, 
	[RegOffice_Country] VARCHAR(50) NULL, 
	[Principal_Name] VARCHAR(100) NULL, 
	[Principal_Phone] VARCHAR(15) NULL, 
	[Principal_Email] VARCHAR(50) NULL, 
	[Principal_ContactNote] VARCHAR(150) NULL, 
	[LicenceNo] VARCHAR(20) NULL, 
	[OfficeRegion] VARCHAR(50) NULL, 
	[OfficeLevel] NCHAR(10) NULL, 
	[RELicenceNo] VARCHAR(50) NULL, 
	[SupOfficeId] INT NULL
)
