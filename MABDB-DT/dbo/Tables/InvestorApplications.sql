﻿CREATE TABLE [dbo].[InvestorApplications] (
	[Id]                                 INT                IDENTITY (1, 1) NOT NULL,
	[ApplicantType]                      VARCHAR (10)       NULL,
	[Primary_Title]						 VARCHAR(10)		NULL,	
	[Primary_FirstName]                  NVARCHAR (50)     NULL,
	[Primary_OtherNames]                 NVARCHAR (50)     NULL,
	[Primary_LastName]                   NVARCHAR (50)     NULL,
	[Primary_AUCitizenStat]              VARCHAR (25)       NULL,
	[Primary_Dependants]                 TINYINT            NULL,
	[Other_Title]						 VARCHAR(25)		NULL,	
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
	[Primary_Res_PostCode]               SMALLINT           NULL,
	[Primary_Res_Suburb]                 NVARCHAR (255)     NULL,
	[Primary_Res_State]                  VARCHAR (50)       NULL,
	[Primary_Res_Country]                VARCHAR (50)       NULL,
	[Primary_CurrResidStatus]            VARCHAR (25)       NULL,
	[PrevResStatus]                      VARCHAR (25)       NULL,
	[CurrOccupType]                      VARCHAR (100)      NULL,
	[CurrEmploymentStatus]               VARCHAR (100)      NULL,
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
	[Property_Suburb]                    VARCHAR (50)       NULL,
	[Property_Vendor]                    NVARCHAR (255)     NULL,
	[EstSpend]                           VARCHAR (50)       NULL,
	[EntryDate]                          DATETIME           DEFAULT (getdate()) NOT NULL,
	[Primary_DOB]                        DATETIME           NULL,
	[CreatedUTC]                         DATETIME           CONSTRAINT [DF__InvestorApplications__CreatedUTC] DEFAULT (getutcdate()) NOT NULL,
	[CondCreditDecisionDate]                       DATETIME           NULL,
	[Property_PostCode]                  SMALLINT           NULL,
	[Property_State]                     NVARCHAR (255)     NULL,
	[Property_Country]                   VARCHAR (50)       NULL,
	[Property_AgentDetails]              VARCHAR (255)      NULL,
	[HasAgreedPrivacy]                   VARCHAR (100)      NULL,
	[Primary_Gender]                     VARCHAR (10)       NULL,
	[DesiredPropertyAddr]                VARCHAR (255)      NULL,
	[Primary_MaritalStats]               VARCHAR (25)       NULL,
	[Other_MaritalStats]                 VARCHAR (25)       NULL,
	[Other_Email]                        VARCHAR (255)       NULL,
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
	[Other_Res_PostCode]                 SMALLINT           NULL,
	[Other_Res_State]                    VARCHAR (50)       NULL,
	[Other_Res_Country]                  VARCHAR (50)       NULL,
	[Other_Res_Suburb]                   NVARCHAR (255)     NULL,
	[Other_CurrResidStatus]              VARCHAR (25)       NULL,
	[PrimPrev_Res_Street1]               NVARCHAR (255)     NULL,
	[PrimPrev_Res_Street2]               NVARCHAR (255)     NULL,
	[PrimPrev_Res_Suburb]                NVARCHAR (255)     NULL,
	[PrimPrev_Res_PostCode]              SMALLINT           NULL,
	[PrimPrev_Res_State]                 VARCHAR (50)       NULL,
	[PrimPrev_Res_Country]               VARCHAR (50)       NULL,
	[OthPrev_Res_Street1]                NVARCHAR (255)     NULL,
	[OthPrev_Res_Street2]                NVARCHAR (255)     NULL,
	[OthPrev_Res_Suburb]                 NVARCHAR (255)     NULL,
	[OthPrev_Res_PostCode]               SMALLINT           NULL,
	[OthPrev_Res_State]                  VARCHAR (50)       NULL,
	[OthPrev_Res_Country]                VARCHAR (50)       NULL,
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
	[Primary_PropertyAssetsList]             VARCHAR (550)      NULL,
	[Other_PropertyAssetsList]               VARCHAR (550)      NULL,
	[Primary_PersonalLoansList]          VARCHAR (550)      NULL,
	[Other_PersonalLoansList]            VARCHAR (550)      NULL,
	[Primary_OtherAssetsList]            VARCHAR (550)      NULL,
	[Other_OtherAssetsList]              VARCHAR (550)      NULL,
	[Primary_OtherLiabilitiesList]       VARCHAR (550)      NULL,
	[Other_OtherLiabilitiesList]         VARCHAR (550)      NULL,
	[UserId]                             VARCHAR (15)       NULL,
	[TransactionId]                      VARCHAR (15)       NULL,
	[SourceURL]                          VARCHAR (255)      NULL,
	[Other_Res_Street1]                  NVARCHAR (255)     NULL,
	[CondDecisionBy]                     VARCHAR (25)       NULL,
	[HasReqestedPriority]                VARCHAR (100)      NULL,
	[HasAgreedPACLicence]                VARCHAR (100)      NULL,
	[EntryId]                            INT                DEFAULT ((-1)) NOT NULL,
	[Primary_YrsCurrAddr]                VARCHAR (120)      NULL,
	[Other_YrsCurrAddr]                  VARCHAR (120)      NULL,
	[Other_YrsPrevAddr]                  VARCHAR (120)      NULL,
	[YrsPrevAddr]                        VARCHAR (120)      NULL,
	[YrsCurrEmployer]                    VARCHAR (120)      NULL,
	[YrsPrevEmployer]                    VARCHAR (120)      NULL,
	[AppliedLimit]						 DECIMAL(10,2)	NULL,
	[AutoRejected]                       DATE               NULL,
	[AutoRejectedBy]                    VARCHAR (50)       NULL,
	[AutoAccepted]                       DATE               NULL,
	[AutoAcceptedBy]					VARCHAR(50) NULL,
	[HasReadPO6]                         VARCHAR (300)      NULL,
	[CondCreditDecision]                       CHAR(1)                NULL,
	[CondCreditDecisionInformed] DATETIME2 NULL, 
	[CondCreditDecisionInformedBy] VARCHAR(50) NULL, 
	[CondCreditDecisionBy] VARCHAR(50) NULL, 
	[AppAckLetterSent] DATETIME2 NULL, 
	[AppAckLetterSentBy] VARCHAR(50) NULL, 
	[ApplicantsNotes] VARCHAR(1200) NULL, 
	[CondDecisionOfficeNotes] VARCHAR(1200) NULL, 
	[IsCompany] VARCHAR(10) NULL, 
	[CompanyName] VARCHAR(50) NULL, 
	[CompanyABN] VARCHAR(15) NULL, 
	[CompanyACN] VARCHAR(12) NULL, 
	[Primary_CompRole] VARCHAR(100) NULL, 
	   [Property_LoanOutstanding] DECIMAL(12,2) NULL,
		[Property_Deposit] DECIMAL(12,2) NULL,
		[Broker] VARCHAR(50) NULL, 
	[BrokerDetails] VARCHAR(100) NULL
	PRIMARY KEY CLUSTERED ([Id] ASC)
);























