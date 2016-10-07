CREATE VIEW [dbo].[vw_BuyerAppsBasicWScores]
	AS 
	SELECT
	 ia.[Id],
	 ia.EntryDate,
	 ia.ApplicantType,
	 ia.Primary_FirstName,
	 ia.Primary_OtherNames,
	 ia.Primary_LastName,
	 ia.Primary_DOB, 
	 ia.Primary_Gender,
	 ia.Email,
	 ia.Primary_Res_State,
	 ia.Primary_Res_PostCode,	 
	 
	CASE WHEN ((ia.AutoAccepted IS NOT null) AND (( ia.AutoRejected IS NULL) OR ( (ia.AutoRejected IS NOT NULL) AND (ia.AutoRejected < ia.AutoAccepted) ))	) THEN 'Accept' 
	  WHEN  ( ia.AutoRejected is not null AND (( ia.AutoAccepted IS NULL) OR ( (ia.AutoAccepted IS NOT NULL) AND (ia.AutoAccepted < ia.AutoRejected) )) ) THEN 'Reject'  
	  ELSE 'Refer' END

	AS [AutoCondResult] 	 	  
	  ,[Score_Class]
	  ,[Score_Total]	
	  
	FROM  BuyerApplications ia
LEFT JOIN BuyerScoreCard sc on sc.BuyerApplicationId = ia.Id
GO