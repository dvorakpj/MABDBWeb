CREATE TABLE [dbo].[InvestorToSolicitorRel]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [InvestorId] INT NOT NULL, 
    [SolicitorId] INT NOT NULL, 
    [StartDate] SMALLDATETIME NOT NULL, 
    [EndDate] SMALLDATETIME NULL
)
