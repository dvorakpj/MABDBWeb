CREATE VIEW [dbo].[vw_InvestorCreditApproved]
	AS SELECT * FROM [Investor] i
	WHERE AssquireStatus = 'A' AND
	AssquireCreditDecision IS NOT NULL
