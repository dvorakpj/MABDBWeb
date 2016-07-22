CREATE VIEW [dbo].[v_InvestorApplicationScores]
	AS 
	SELECT ia.*, 
	sc.[Id] as [SC_Id]
	  ,sc.[Pass_Primary_AUCitizen]
	  ,[Pass_Age25To55]
	  ,[Pass_GrossIncomeSingle]
	  ,[Pass_GrossIncomeJoint]
	  ,[Pass_Primary_EmplStat]
	  ,[Pass_ScorecardGt80]
	  ,[Score_Personal]
	  ,[Score_Residential]
	  ,[Score_Employment]
	  ,[Score_Status]
	  ,[Score_Total]
	
	FROM  InvestorApplications ia
JOIN InvestorScoreCard sc on sc.InvestorApplicationId = ia.Id
GO