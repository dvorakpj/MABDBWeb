CREATE VIEW [dbo].[vw_InvestorsCreditRejected]
	AS SELECT * FROM [dbo].[vw_Investors] inv
	WHERE inv.FinalCreditDecision = 'R' AND
	inv.AssquireStatus ='I'
