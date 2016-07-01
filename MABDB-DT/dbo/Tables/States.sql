CREATE TABLE [dbo].[States] (
    [Id]            INT                IDENTITY (1, 1) NOT NULL,
    [Name]          NVARCHAR (255)     DEFAULT ('') NOT NULL,
    [Code]          NVARCHAR (255)     DEFAULT ('') NOT NULL,
    [ISOCode]       NVARCHAR (255)     DEFAULT ('') NOT NULL,
    [CreatedBy]     NVARCHAR (255)     NULL,
    [Created]       DATETIMEOFFSET (7) NULL,
    [ModifiedBy]    NVARCHAR (255)     NULL,
    [Modified]      DATETIMEOFFSET (7) NULL,
    [RowVersion]    ROWVERSION         NOT NULL,
    [Country_State] INT                NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [Country_State] FOREIGN KEY ([Country_State]) REFERENCES [dbo].[Countries] ([Id])
);

