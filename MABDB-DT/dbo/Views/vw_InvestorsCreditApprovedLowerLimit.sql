CREATE VIEW [dbo].[vw_InvestorsCreditApprovedLowerLimit]
	AS SELECT * FROM [dbo].[vw_Investors] i
	WHERE i.AppliedPrtyVal < i.AssquireApprovedPrtyVal
	 
