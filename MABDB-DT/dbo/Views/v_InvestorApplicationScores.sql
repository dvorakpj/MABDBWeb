CREATE VIEW [dbo].[v_InvestorApplicationScores]
	AS 
	SELECT ia.*, 
	sc.[Id] as [SC_Id]
	  ,sc.[Primary_AUCitizen]
	  ,[Age]
	  ,[GrossIncomeSingle]
	  ,[GrossIncomeJoint]
	  ,[Primary_EmplStat]
	  ,[ScorecardLimit]
	  ,[Score_Personal]
	  ,[Score_Residential]
	  ,[Score_Employment]
	  ,[Score_Class]
	  ,[Score_Total]
	
	FROM  InvestorApplications ia
JOIN InvestorScoreCard sc on sc.InvestorApplicationId = ia.Id
GO