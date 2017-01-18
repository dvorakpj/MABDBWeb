CREATE VIEW [dbo].[vw_InvestorsCreditApproved]
	AS SELECT 
	inv.Id	
	FROM [dbo].[vw_Investors] inv
	WHERE inv.FinalCreditDecision = 'A' AND
	inv.AssquireStatus ='I'
