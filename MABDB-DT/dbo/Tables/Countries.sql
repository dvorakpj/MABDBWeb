CREATE TABLE [dbo].[Countries] (
    [Id]         INT                IDENTITY (1, 1) NOT NULL,
    [FullName]   NVARCHAR (255)     DEFAULT ('') NOT NULL,
    [ShortName]  NVARCHAR (255)     DEFAULT ('') NOT NULL,
    [ISOCode]    NVARCHAR (255)     DEFAULT ('') NOT NULL,
    [CreatedBy]  NVARCHAR (255)     NULL,
    [Created]    DATETIMEOFFSET (7) NULL,
    [ModifiedBy] NVARCHAR (255)     NULL,
    [Modified]   DATETIMEOFFSET (7) NULL,
    [RowVersion] ROWVERSION         NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

