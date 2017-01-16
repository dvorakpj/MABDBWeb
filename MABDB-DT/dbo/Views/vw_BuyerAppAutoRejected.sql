CREATE VIEW [dbo].[vw_NewBuyerAppAutoRejected]
	AS SELECT ba.* FROM [dbo].[vw_BuyerApplications] ba
	WHERE ba.AutoPreApprovalResult = 'R'
