CREATE VIEW [dbo].[vw_BuyerAppAutoAccepted]
	AS SELECT ba.* FROM [dbo].[vw_BuyerApplications] ba
	WHERE ((ba.AutoPreApprovalResult IN ('A', 'F') ) AND (ba.AutoPreApprovalDate IS NOT NULL))	 
