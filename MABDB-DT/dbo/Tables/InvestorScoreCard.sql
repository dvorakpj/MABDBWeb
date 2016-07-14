CREATE TABLE [dbo].[InvestorScoreCard]
(
	[Id] INT NOT NULL PRIMARY KEY, 
	[IsPrimary_AUCitizen] BIT NULL, 
	[IsAge25To55] BIT NULL, 
	[IsGrossIncomeSingle] BIT NULL, 
	[IsGrossIncomeJoint] BIT NULL, 
	[IsPrimary_EmplStat] BIT NULL, 
	[IsScorecardGt80] BIT NULL, 
	[SC_Personal] INT NULL, 
	[SC_Residential] INT NULL, 
	[SC_Employment] INT NULL, 
	[SC_Status] VARCHAR(50) NULL, 
	[InvestorApplicationId] INT NOT NULL, 
	CONSTRAINT [FK_InvestorScoreCard_InvestorApplication] FOREIGN KEY ([InvestorApplicationId]) REFERENCES [InvestorApplications]([Id])
)
