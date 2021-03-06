﻿CREATE TABLE [dbo].[BuyerScoreCard] (
	[Id]                     INT           NOT NULL IDENTITY(0, 1),
	[Primary_AUCitizen] CHAR(1)           NULL,
	[Age]         CHAR(1)           NULL,
	[GrossIncomeSingle] CHAR(1)           NULL,
	[GrossIncomeJoint]  CHAR(1)           NULL,
	[Primary_EmplStat]  CHAR(1)           NULL,
	[ScorecardLimit]     CHAR(1)           NULL,
	[Score_Personal]         INT           NULL,
	[Score_Residential]      INT           NULL,
	[Score_Employment]       INT           NULL,
	[Score_Total]            INT           NULL,
	[Score_Class]           VARCHAR (50)  NULL,
	[BuyerApplicationId]  INT           NOT NULL,
	[Created]                DATETIME      DEFAULT (getdate()) NOT NULL,
	[CreatedBy]              VARCHAR (15) DEFAULT (suser_sname()) NOT NULL,
	[Modified]               DATETIME      NULL,
	[ModifiedBy]             VARCHAR (15) NULL
	PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [FK_BuyerScoreCard_BuyerApplications] FOREIGN KEY ([BuyerApplicationId]) REFERENCES [dbo].[BuyerApplications] ([Id])
);


