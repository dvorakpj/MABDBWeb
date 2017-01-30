SELECT * from [dbo].[vw_InvestorAppCondRejectedNotInformed]

select count(*) from InvestorApplications
WHERE CondCreditDecision IS NOT NULL
select max(id) from InvestorApplications

UPDATE InvestorApplications
SET CondCreditDecision = 'R',
CondDecisionBy = 'dvorakpj',
CondCreditDecisionDate = getdate(),
ModifiedBy = 'dvorakpj',
Modified = GETDATE()
WHERE id = 3208
GO
