CREATE VIEW [dbo].[vw_BuyersCondAcceptedAppliedLimit]
	AS SELECT * FROM [vw_BuyersCondAccepted] b
	WHERE b.CondApprovedLimit$ >= b.AppliedLimit$
