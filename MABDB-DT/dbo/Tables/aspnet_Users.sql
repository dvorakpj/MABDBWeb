CREATE TABLE [dbo].[aspnet_Users] (
    [ApplicationId]    UNIQUEIDENTIFIER NOT NULL,
    [UserId]           UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [UserName]         NVARCHAR (256)   NOT NULL,
    [LoweredUserName]  NVARCHAR (256)   NOT NULL,
    [MobileAlias]      NVARCHAR (16)    DEFAULT (NULL) NULL,
    [IsAnonymous]      BIT              DEFAULT ((0)) NOT NULL,
    [LastActivityDate] DATETIME         NOT NULL,
    CONSTRAINT [PK_aspnet_Users_UserId] PRIMARY KEY NONCLUSTERED ([UserId] ASC),
    CONSTRAINT [FK_aspnet_Users_ApplicationId_aspnet_Applications_ApplicationId] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
);


GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index]
    ON [dbo].[aspnet_Users]([ApplicationId] ASC, [LoweredUserName] ASC);


GO
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2]
    ON [dbo].[aspnet_Users]([ApplicationId] ASC, [LastActivityDate] ASC);

