CREATE VIEW [dbo].[vw_InvestorsCreditRejected]
	AS SELECT * FROM [dbo].[vw_Investors] inv
	WHERE inv.CreditDecision = 'R' AND
	inv.AssquireStatus ='I'
