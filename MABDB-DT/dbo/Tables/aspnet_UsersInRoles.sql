CREATE TABLE [dbo].[aspnet_UsersInRoles] (
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    [RoleId] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_aspnet_UsersInRoles_UserId] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC),
    CONSTRAINT [FK_aspnet_UsersInRoles_RoleId_aspnet_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[aspnet_Roles] ([RoleId]),
    CONSTRAINT [FK_aspnet_UsersInRoles_UserId_aspnet_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
);


GO
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index]
    ON [dbo].[aspnet_UsersInRoles]([RoleId] ASC);

