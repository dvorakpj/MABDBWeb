CREATE VIEW [dbo].[vw_NewInvestorAppAutoRejected]
	AS SELECT *, NULL as [CondAppliedLimit$], NULL AS [FinalApprovedLimit$], NULL AS [MthlyRent], NULL AS [MthlyDeposit] FROM [dbo].[InvestorApplications] ia
	WHERE ia.AutoRejected is not null AND (( ia.AutoAccepted IS NULL) OR ( (ia.AutoAccepted IS NOT NULL) AND (ia.AutoAccepted < ia.AutoRejected) ))

