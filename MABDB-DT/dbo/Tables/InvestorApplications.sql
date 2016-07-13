﻿CREATE TABLE [dbo].[InvestorApplications] (
    [Id]                                 INT                IDENTITY (1, 1) NOT NULL,
    [ApplicantType]                      VARCHAR (10)       NULL,
    [Primary_FirstName]                  NVARCHAR (255)     NULL,
    [Primary_OtherNames]                 NVARCHAR (255)     NULL,
    [Primary_LastName]                   NVARCHAR (255)     NULL,
    [Primary_AUCitizenStat]              VARCHAR (25)       NULL,
    [Primary_Dependants]                 TINYINT            NULL,
    [Other_FirstName]                    NVARCHAR (255)     NULL,
    [Other_OtherNames]                   NVARCHAR (255)     NULL,
    [Other_LastName]                     NVARCHAR (255)     NULL,
    [Other_DOB]                          DATETIME           NULL,
    [Other_Gender]                       VARCHAR (10)       NULL,
    [Other_AUCitizenStat]                VARCHAR (25)       NULL,
    [Other_Dependants]                   TINYINT            NULL,
    [Email]                              VARCHAR (255)      NULL,
    [Mobile]                             VARCHAR (50)       NULL,
    [Primary_Res_Street1]                NVARCHAR (255)     NULL,
    [Primary_Res_Street2]                NVARCHAR (255)     NULL,
    [Primary_Res_City]                   NVARCHAR (255)     NULL,
    [Primary_Res_PostCode]               SMALLINT           NULL,
    [Primary_Res_State]                  VARCHAR (50)       NULL,
    [Primary_Res_Country]                VARCHAR (50)       NULL,
    [Primary_YrsCurrAddr]                TINYINT            NULL,
    [Primary_CurrResidStatus]            VARCHAR (25)       NULL,
    [YrsPrevAddr]                        TINYINT            NULL,
    [PrevResStatus]                      VARCHAR (25)       NULL,
    [CurrOccupType]                      VARCHAR (100)      NULL,
    [CurrEmploymentStatus]               VARCHAR (100)      NULL,
    [YrsCurrEmployer]                    TINYINT            NULL,
    [YrsPrevEmployer]                    TINYINT            NULL,
    [IsSmoker]                           VARCHAR (10)       NULL,
    [HasPrivateHealthIns]                VARCHAR (10)       NULL,
    [CreatedBy]                          NVARCHAR (255)     NULL,
    [ModifiedBy]                         NVARCHAR (255)     NULL,
    [Modified]                           DATETIMEOFFSET (7) NULL,
    [RowVersion]                         ROWVERSION         NOT NULL,
    [InvestorApplicant_AssquireInvestor] INT                NULL,
    [InvestorApplication_Gender]         INT                NULL,
    [Primary_IncomeMoAT]                 VARCHAR (50)       NULL,
    [Other_IncomeMoAT]                   VARCHAR (50)       NULL,
    [HouseholdIncomeGrossPA]             VARCHAR (50)       NULL,
    [LookingLocation]                    VARCHAR (150)      NULL,
    [FoundLocation]                      VARCHAR (150)      NULL,
    [Property_Street1]                   NVARCHAR (255)     NULL,
    [Property_Street2]                   NVARCHAR (255)     NULL,
    [Property_City]                      VARCHAR (50)       NULL,
    [Property_Vendor]                    NVARCHAR (255)     NULL,
    [EstSpend]                           VARCHAR (50)       NULL,
    [EntryDate]                          DATETIME           DEFAULT (getdate()) NOT NULL,
    [Primary_DOB]                        DATETIME           NULL,
    [CreatedUTC]                         DATETIME           CONSTRAINT [DF__InvestorApplications__CreatedUTC] DEFAULT (getutcdate()) NOT NULL,
    [CondApproved]                       DATETIME           NULL,
    [Property_PostCode]                  SMALLINT           NULL,
    [Property_State]                     NVARCHAR (255)     NULL,
    [Property_Country]                   VARCHAR (50)       NULL,
    [Property_AgentDetails]              VARCHAR (255)      NULL,
    [HasAgreedPrivacy]                   VARCHAR (50)       NULL,
    [Primary_Gender]                     VARCHAR (10)       NULL,
    [DesiredPropertyAddr]                VARCHAR (255)      NULL,
    [Primary_MaritalStats]               VARCHAR (25)       NULL,
    [Other_MaritalStats]                 VARCHAR (25)       NULL,
    [Other_Email]                        VARCHAR (50)       NULL,
    [Primary_HomePhone]                  VARCHAR (50)       NULL,
    [Other_HomePhone]                    VARCHAR (50)       NULL,
    [Other_Mobile]                       VARCHAR (50)       NULL,
    [Primary_PassportNo]                 VARCHAR (50)       NULL,
    [Other_PassportNo]                   VARCHAR (50)       NULL,
    [Primary_PassportCountry]            VARCHAR (50)       NULL,
    [Other_PassportCountry]              VARCHAR (50)       NULL,
    [Primary_DriversLicenceNo]           VARCHAR (50)       NULL,
    [Other_DriversLicenceNo]             VARCHAR (50)       NULL,
    [Primary_DriversLicenceState]        VARCHAR (50)       NULL,
    [Other_DriversLicenceState]          VARCHAR (50)       NULL,
    [Other_Res_Street2]                  NVARCHAR (255)     NULL,
    [Other_Res_City]                     NVARCHAR (255)     NULL,
    [Other_Res_PostCode]                 SMALLINT           NULL,
    [Other_Res_State]                    VARCHAR (50)       NULL,
    [Other_Res_Country]                  VARCHAR (50)       NULL,
    [Other_YrsCurrAddr]                  TINYINT            NULL,
    [Other_CurrResidStatus]              VARCHAR (25)       NULL,
    [PrimPrev_Res_Street1]               NVARCHAR (255)     NULL,
    [PrimPrev_Res_Street2]               NVARCHAR (255)     NULL,
    [PrimPrev_Res_City]                  NVARCHAR (255)     NULL,
    [PrimPrev_Res_PostCode]              SMALLINT           NULL,
    [PrimPrev_Res_State]                 VARCHAR (50)       NULL,
    [PrimPrev_Res_Country]               VARCHAR (50)       NULL,
    [OthPrev_Res_Street1]                NVARCHAR (255)     NULL,
    [OthPrev_Res_Street2]                NVARCHAR (255)     NULL,
    [OthPrev_Res_City]                   NVARCHAR (255)     NULL,
    [OthPrev_Res_PostCode]               SMALLINT           NULL,
    [OthPrev_Res_State]                  VARCHAR (50)       NULL,
    [OthPrev_Res_Country]                VARCHAR (50)       NULL,
    [Other_YrsPrevAddr]                  TINYINT            NULL,
    [Other_PrevResStatus]                VARCHAR (25)       NULL,
    [Other_CurrOccupType]                VARCHAR (100)      NULL,
    [Primary_BusIncomeAPAYGTaxPA]        VARCHAR (50)       NULL,
    [Other_BusIncomeAPAYGTaxPA]          VARCHAR (50)       NULL,
    [Primary_OtherIncomePA]              VARCHAR (50)       NULL,
    [Other_OtherIncomePA]                VARCHAR (50)       NULL,
    [Primary_OtherIncomeType]            VARCHAR (150)      NULL,
    [Other_OtherIncomeType]              VARCHAR (150)      NULL,
    [Primary_HomeLoanList]               VARCHAR (550)      NULL,
    [Other_HomeLoanList]                 VARCHAR (550)      NULL,
    [Primary_CreditCardList]             VARCHAR (550)      NULL,
    [Other_CreditCardList]               VARCHAR (550)      NULL,
    [RentPM]                             VARCHAR (15)       NULL,
    [Primary_PropertyAssets]             VARCHAR (550)      NULL,
    [Other_PropertyAssets]               VARCHAR (550)      NULL,
    [Primary_PersonalLoansList]          VARCHAR (550)      NULL,
    [Other_PersonalLoansList]            VARCHAR (550)      NULL,
    [Primary_OtherAssetsList]            VARCHAR (50)       NULL,
    [Other_OtherAssetsList]              VARCHAR (50)       NULL,
    [Primary_OtherLiabilitiesList]       VARCHAR (550)      NULL,
    [Other_OtherLiabilitiesList]         VARCHAR (550)      NULL,
    [UserId]                             VARCHAR (15)       NULL,
    [TransactionId]                      VARCHAR (15)       NULL,
    [SourceURL]                          VARCHAR (255)      NULL,
    [Other_Res_Street1]                  NVARCHAR (255)     NULL,
    [CondApprovedBy]                     VARCHAR (25)       NULL ,
    [HasReqestedPriority]                VARCHAR (100)      NULL,
    [HasAgreedPACLicence]                VARCHAR (100)      NULL,
    [EntryId] INT NOT NULL DEFAULT -1, 
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [InvestorApplication_AssquireInvestor] FOREIGN KEY ([InvestorApplicant_AssquireInvestor]) REFERENCES [dbo].[AssquireInvestors] ([Id]) ON DELETE SET NULL
);













