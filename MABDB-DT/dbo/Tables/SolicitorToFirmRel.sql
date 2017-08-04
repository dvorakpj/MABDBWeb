CREATE TABLE [dbo].[SolicitorToFirmRel]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[SolicitorId] INT NOT NULL, 
    [SolicitorFirmId] INT NOT NULL, 
    [StartDate] DATETIME NOT NULL, 
    [EndDate] INT NULL, 
    CONSTRAINT [FK_SolicitorToFirmRel_ToSolicitor] FOREIGN KEY ([SolicitorId]) REFERENCES [Solicitor]([Id]),
	CONSTRAINT [FK_SolicitorToFirmRel_ToSolicitorFirm] FOREIGN KEY ([SolicitorFirmId]) REFERENCES [SolicitorFirm]([Id]),

)
