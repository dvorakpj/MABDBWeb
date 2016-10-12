CREATE VIEW [dbo].[vw_InvestorsCreditApprovedAppliedLimit]
	AS SELECT * FROM [dbo].[vw_Investors] i
	WHERE i.AppliedPrtyVal >= i.AssquireApprovedPrtyVal
	 
