CREATE TABLE [dbo].[aspnet_Applications] (
    [ApplicationName]        NVARCHAR (256)   NOT NULL,
    [LoweredApplicationName] NVARCHAR (256)   NOT NULL,
    [ApplicationId]          UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [Description]            NVARCHAR (256)   NULL,
    CONSTRAINT [FK_aspnet_Applications_ApplicationId] PRIMARY KEY NONCLUSTERED ([ApplicationId] ASC),
    UNIQUE NONCLUSTERED ([ApplicationName] ASC),
    UNIQUE NONCLUSTERED ([LoweredApplicationName] ASC)
);


GO
CREATE CLUSTERED INDEX [aspnet_Applications_Index]
    ON [dbo].[aspnet_Applications]([LoweredApplicationName] ASC);

