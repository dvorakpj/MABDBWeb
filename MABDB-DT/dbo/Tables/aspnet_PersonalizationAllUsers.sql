CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers] (
    [PathId]          UNIQUEIDENTIFIER NOT NULL,
    [PageSettings]    IMAGE            NOT NULL,
    [LastUpdatedDate] DATETIME         NOT NULL,
    CONSTRAINT [PK_aspnet_PersonalizationAllUsers_PathId] PRIMARY KEY CLUSTERED ([PathId] ASC),
    CONSTRAINT [FK_aspnet_PersonalizationAllUsers_PathId_aspnet_Paths_PathId] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId])
);

