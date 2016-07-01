CREATE TABLE [dbo].[AssquireInvestors] (
    [Id]                 INT                IDENTITY (1, 1) NOT NULL,
    [Title]              NVARCHAR (255)     NULL,
    [FirstName]          NVARCHAR (255)     NULL,
    [OtherNames]         NVARCHAR (255)     NULL,
    [LastName]           NVARCHAR (255)     NULL,
    [CompanyName]        NVARCHAR (255)     NULL,
    [PersonalSalutation] NVARCHAR (255)     NULL,
    [CreatedBy]          NVARCHAR (255)     NULL,
    [Created]            DATETIMEOFFSET (7) NULL,
    [ModifiedBy]         NVARCHAR (255)     NULL,
    [Modified]           DATETIMEOFFSET (7) NULL,
    [RowVersion]         ROWVERSION         NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

