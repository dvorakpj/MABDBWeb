CREATE VIEW [dbo].[vw_BuyersCondAcceptedLowerLimit]
	AS SELECT * FROM [vw_BuyersCondAccepted] bca
	WHERE 
	bca.CondApprovedLimit$ < AppliedLimit$