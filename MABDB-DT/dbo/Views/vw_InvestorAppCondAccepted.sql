CREATE VIEW [dbo].[vw_InvestorAppCondAccepted]
	AS SELECT * FROM [dbo].[vw_InvestorApplications] ia
	WHERE	 ia.CondCreditDecisionDate IS NOT NULL AND ia.CondCreditDecision = 'A' 
	
