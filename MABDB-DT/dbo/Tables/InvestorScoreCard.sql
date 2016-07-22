CREATE TABLE [dbo].[InvestorScoreCard] (
    [Id]                     INT           NOT NULL IDENTITY(0, 1),
    [Pass_Primary_AUCitizen] BIT           NULL,
    [Pass_Age25To55]         BIT           NULL,
    [Pass_GrossIncomeSingle] BIT           NULL,
    [Pass_GrossIncomeJoint]  BIT           NULL,
    [Pass_Primary_EmplStat]  BIT           NULL,
    [Pass_ScorecardGt80]     BIT           NULL,
    [Score_Personal]         INT           NULL,
    [Score_Residential]      INT           NULL,
    [Score_Employment]       INT           NULL,
    [Score_Status]           VARCHAR (50)  NULL,
    [InvestorApplicationId]  INT           NOT NULL,
    [Created]                DATETIME      DEFAULT (getdate()) NOT NULL,
    [CreatedBy]              VARCHAR (255) DEFAULT (suser_sname()) NOT NULL,
    [Modified]               DATETIME      NULL,
    [ModifiedBy]             VARCHAR (255) NULL,
    [Score_Total]            INT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_InvestorScoreCard_InvestorApplication] FOREIGN KEY ([InvestorApplicationId]) REFERENCES [dbo].[InvestorApplications] ([Id])
);


