CREATE VIEW [dbo].[vw_NewInvestorAppAutoAccepted]
	AS 
	SELECT ia.* FROM [dbo].[InvestorApplications] ia
	WHERE (ia.AutoAccepted is not null) AND (( ia.AutoRejected IS NULL) OR ( (ia.AutoRejected IS NOT NULL) AND (ia.AutoRejected < ia.AutoAccepted) ))	 
