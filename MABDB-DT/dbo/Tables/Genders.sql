CREATE TABLE [dbo].[Genders] (
    [Id]          INT                IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (255)     DEFAULT ('') NOT NULL,
    [Code]        NVARCHAR (255)     DEFAULT ('') NOT NULL,
    [CreatedBy]   NVARCHAR (255)     NULL,
    [Created]     DATETIMEOFFSET (7) NULL,
    [ModifiedBy]  NVARCHAR (255)     NULL,
    [Modified]    DATETIMEOFFSET (7) NULL,
    [RowVersion]  ROWVERSION         NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

