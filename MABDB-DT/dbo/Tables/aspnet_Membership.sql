﻿CREATE TABLE [dbo].[aspnet_Membership] (
    [ApplicationId]                          UNIQUEIDENTIFIER NOT NULL,
    [UserId]                                 UNIQUEIDENTIFIER NOT NULL,
    [Password]                               NVARCHAR (128)   NOT NULL,
    [PasswordFormat]                         INT              DEFAULT ((0)) NOT NULL,
    [PasswordSalt]                           NVARCHAR (128)   NOT NULL,
    [MobilePIN]                              NVARCHAR (16)    NULL,
    [Email]                                  NVARCHAR (256)   NULL,
    [LoweredEmail]                           NVARCHAR (256)   NULL,
    [PasswordQuestion]                       NVARCHAR (256)   NULL,
    [PasswordAnswer]                         NVARCHAR (128)   NULL,
    [IsApproved]                             BIT              NOT NULL,
    [IsLockedOut]                            BIT              NOT NULL,
    [CreateDate]                             DATETIME         NOT NULL,
    [LastLoginDate]                          DATETIME         NOT NULL,
    [LastPasswordChangedDate]                DATETIME         NOT NULL,
    [LastLockoutDate]                        DATETIME         NOT NULL,
    [FailedPasswordAttemptCount]             INT              NOT NULL,
    [FailedPasswordAttemptWindowStart]       DATETIME         NOT NULL,
    [FailedPasswordAnswerAttemptCount]       INT              NOT NULL,
    [FailedPasswordAnswerAttemptWindowStart] DATETIME         NOT NULL,
    [Comment]                                NTEXT            NULL,
    CONSTRAINT [PK_aspnet_Membership_UserId] PRIMARY KEY NONCLUSTERED ([UserId] ASC),
    CONSTRAINT [FK_aspnet_Membership_ApplicationId_aspnet_Applications_ApplicationId] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]),
    CONSTRAINT [FK_aspnet_Membership_UserId_aspnet_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
);


GO
CREATE CLUSTERED INDEX [aspnet_Membership_index]
    ON [dbo].[aspnet_Membership]([ApplicationId] ASC, [LoweredEmail] ASC);

