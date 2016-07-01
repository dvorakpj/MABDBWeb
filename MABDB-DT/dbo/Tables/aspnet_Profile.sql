CREATE TABLE [dbo].[aspnet_Profile] (
    [UserId]               UNIQUEIDENTIFIER NOT NULL,
    [PropertyNames]        NTEXT            NOT NULL,
    [PropertyValuesString] NTEXT            NOT NULL,
    [PropertyValuesBinary] IMAGE            NOT NULL,
    [LastUpdatedDate]      DATETIME         NOT NULL,
    CONSTRAINT [PK_aspnet_Profile_UserId] PRIMARY KEY CLUSTERED ([UserId] ASC),
    CONSTRAINT [FK_aspnet_Profile_UserId_aspnet_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
);

