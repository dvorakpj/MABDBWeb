CREATE VIEW [dbo].[vw_NewInvestorAppAutoAccepted]
	AS 
	SELECT ia.* --, NULL AS [FinalApprovedLimit$], NULL AS [MthlyRent], NULL AS [MthlyDeposit] 
	FROM [dbo].[vw_InvestorApplications] ia
	WHERE (ia.AutoAccepted is not null) AND (( ia.AutoRejected IS NULL) OR ( (ia.AutoRejected IS NOT NULL) AND (ia.AutoRejected < ia.AutoAccepted) ))	 
