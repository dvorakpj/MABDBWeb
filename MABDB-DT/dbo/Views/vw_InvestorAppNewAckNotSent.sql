CREATE VIEW [dbo].[vw_InvestorAppNewAckNotSent]
	AS SELECT * FROM [dbo].[vw_InvestorApplicationsNew] ian
	WHERE ian.AppAckLetterSent IS NULL
