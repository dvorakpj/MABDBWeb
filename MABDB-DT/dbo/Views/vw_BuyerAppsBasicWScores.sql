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
	 
	CASE ia.AutoPreApprovalResult WHEN 'A'	THEN 'Accept' 
	  WHEN  'F'	  THEN 'Refer' 
	  WHEN 'R' THEN 'Reject'
	  ELSE 'Unknown'
	  END

	AS [AutoCondResult]
	  ,[Score_Class]
	  ,[Score_Total]	
	  
	FROM  BuyerApplications ia
LEFT JOIN BuyerScoreCard sc on sc.BuyerApplicationId = ia.Id
GO