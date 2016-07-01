CREATE TABLE [dbo].[aspnet_PersonalizationPerUser] (
    [Id]              UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [PathId]          UNIQUEIDENTIFIER NULL,
    [UserId]          UNIQUEIDENTIFIER NULL,
    [PageSettings]    IMAGE            NOT NULL,
    [LastUpdatedDate] DATETIME         NOT NULL,
    CONSTRAINT [PK_aspnet_PersonalizationPerUser_Id] PRIMARY KEY NONCLUSTERED ([Id] ASC),
    CONSTRAINT [FK_aspnet_PersonalizationPerUser_PathId_aspnet_Paths_PathId] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]),
    CONSTRAINT [FK_aspnet_PersonalizationPerUser_UserId_aspnet_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
);


GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1]
    ON [dbo].[aspnet_PersonalizationPerUser]([PathId] ASC, [UserId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2]
    ON [dbo].[aspnet_PersonalizationPerUser]([UserId] ASC, [PathId] ASC);

