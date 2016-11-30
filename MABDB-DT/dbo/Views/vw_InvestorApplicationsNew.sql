CREATE VIEW [dbo].[vw_InvestorApplicationsNew]
	AS 
	SELECT 
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
	ia.Primary_Title,
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
	ia.Other_Title,
	ia.Other_FirstName,
	ia.Other_OtherNames,
	ia.Other_LastName,
	ia.Other_DOB	,
	ia.Other_Res_Street1,
	ia.Other_Res_Street2,
	ia.Other_Res_Suburb,
	ia.Other_Res_PostCode,
	ia.Other_Res_State,
	ia.Other_Email,
	ia.Other_Mobile
	 FROM [dbo].[vw_InvestorApplications] ia
	 LEFT JOIN InvestorScoreCard isc ON isc.InvestorApplicationId = ia.ApplicationId
	WHERE ia.CondCreditDecision IS NULL AND ia.CondCreditDecisionDate IS NULL

