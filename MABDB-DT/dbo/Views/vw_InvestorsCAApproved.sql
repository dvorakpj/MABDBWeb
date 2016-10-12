CREATE VIEW [dbo].[vw_InvestorsCAApproved]
	AS SELECT * FROM [dbo].Investor inv
	WHERE inv.AssquireCreditDecision IS NOT NULL AND 
	inv.AssquireStatus = 'A'
