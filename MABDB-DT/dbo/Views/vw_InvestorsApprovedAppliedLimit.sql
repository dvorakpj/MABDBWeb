CREATE VIEW [dbo].[vw_InvestorsApprovedAppliedLimit]
	AS SELECT * FROM [dbo].[Investor] i
	WHERE i.AppliedPrtyVal <= i.AssquireApprovedPrtyVal
	 
