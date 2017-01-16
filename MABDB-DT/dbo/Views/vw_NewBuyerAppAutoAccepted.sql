CREATE VIEW [dbo].[vw_NewBuyerAppAutoAccepted]
	AS 
	SELECT ba.* FROM [dbo].[vw_BuyerApplications] ba
	WHERE (ba.AutoPreApprovalResult IN ('A', 'F'))