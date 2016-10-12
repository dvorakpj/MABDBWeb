CREATE VIEW [dbo].[vw_InvestorsCreditApproved]
	AS SELECT 
	inv.Id
	
	
	FROM [dbo].[vw_Investors] inv
	WHERE inv.CreditDecision = 'A' AND
	inv.AssquireStatus ='I'
