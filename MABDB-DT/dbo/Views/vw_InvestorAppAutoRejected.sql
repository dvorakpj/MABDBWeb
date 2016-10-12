CREATE VIEW [dbo].[vw_InvestorAppAutoRejected]
	AS SELECT
	ia.ApplicationId,
	ia.ApplicantType,
	ia.EntryDate AS [ApplicationDate],
	ia.EntryId AS [WebformEntryId],
	ia.CondAppliedLimit$,
	ia.DesiredPropertyAddr,
	CASE WHEN (ia.AutoAccepted is not null) AND (( ia.AutoRejected IS NULL) OR ( (ia.AutoRejected IS NOT NULL) AND (ia.AutoRejected < ia.AutoAccepted) ))	THEN 'Accepted' WHEN ( ia.AutoRejected is not null) AND (( ia.AutoAccepted IS NULL) OR ( (ia.AutoAccepted IS NOT NULL) AND (ia.AutoAccepted < ia.AutoRejected) )) THEN 'Rejected' END AS [AutoDecision],	
	isc.Score_Class AS [AutoScorecardClass],
	isc.Score_Total AS [AutoScoreCardTotalPoints],
	ia.Primary_Salutation,
	ia.Primary_FirstName,
	ia.Primary_OtherNames,
	ia.Primary_LastName,
	ia.Primary_DOB,
	ia.Primary_Res_Street1,
	ia.Primary_Res_Street2,
	ia.Primary_Res_Suburb,
	ia.Primary_Res_PostCode,
	ia.Primary_Res_State,
	ia.Email,
	ia.Mobile,
	ia.Other_Salutation,
	ia.Other_FirstName,
	ia.Other_OtherNames,
	ia.Other_LastName,
	ia.Other_DOB,
	ia.AutoRejected,
	ia.AutoRejectedBy
	 --, NULL as [CondAppliedLimit$], NULL AS [FinalApprovedLimit$], NULL AS [MthlyRent], NULL AS [MthlyDeposit] 
	FROM [dbo].[vw_InvestorApplications] ia
	LEFT JOIN InvestorScoreCard isc ON isc.InvestorApplicationId = ia.ApplicationId
	WHERE ia.AutoRejected is not null AND (( ia.AutoAccepted IS NULL) OR ( (ia.AutoAccepted IS NOT NULL) AND (ia.AutoAccepted < ia.AutoRejected) ))

