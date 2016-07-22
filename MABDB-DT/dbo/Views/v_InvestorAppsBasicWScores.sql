CREATE VIEW [dbo].[v_InvestorAppsBasicWScores]
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
	 ia.Primary_Res_PostCode	  
	  ,[Score_Status]
	  ,[Score_Total]	
	FROM  InvestorApplications ia
LEFT JOIN InvestorScoreCard sc on sc.InvestorApplicationId = ia.Id
GO