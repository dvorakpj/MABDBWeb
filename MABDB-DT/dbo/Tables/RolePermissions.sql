CREATE TABLE [dbo].[RolePermissions] (
    [RoleName]     NVARCHAR (128) NOT NULL,
    [PermissionId] NVARCHAR (322) NOT NULL,
    PRIMARY KEY CLUSTERED ([RoleName] ASC, [PermissionId] ASC)
);

