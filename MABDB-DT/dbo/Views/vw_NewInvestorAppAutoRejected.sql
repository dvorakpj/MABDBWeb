CREATE VIEW [dbo].[vw_NewInvestorAppAutoRejected]
	AS SELECT * FROM [dbo].[InvestorApplications] ia
	WHERE ia.AutoRejected is not null AND (( ia.AutoAccepted IS NULL) OR ( (ia.AutoAccepted IS NOT NULL) AND (ia.AutoAccepted < ia.AutoRejected) ))

