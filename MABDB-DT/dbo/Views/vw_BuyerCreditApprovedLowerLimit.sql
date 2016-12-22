CREATE VIEW [dbo].[vw_BuyerCreditApprovedLowerLimit]
	AS SELECT * FROM [dbo].[vw_BuyerApplications] mab
	WHERE mab.[AppliedLimit$] > mab.CondApprovedLimit$
	 
