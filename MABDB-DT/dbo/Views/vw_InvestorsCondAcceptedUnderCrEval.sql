CREATE VIEW [dbo].[vw_InvestorsCondAcceptedUnderCrEval]
	AS SELECT * FROM [vw_Investors] vinv
	WHERE vinv.FinalCreditDecision IS NULL AND
	vinv.FinalCreditDecisionDate IS NULL
	AND vinv.CreditFeePaymentRefNo IS NOT NULL
	

