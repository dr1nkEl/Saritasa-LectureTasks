CREATE TABLE [dbo].[Notifications] (
    [notificationID] BIGINT           IDENTITY (1, 1) NOT NULL,
    [Addressee]      BIGINT           NOT NULL,
    [Subject]        VARCHAR (MAX)    NULL,
    [Created]        DATETIME         NOT NULL,
    [CreatedBy]      INT              NOT NULL,
    [Type]           TINYINT          NOT NULL,
    [Received]       DATETIME         NULL,
    [SendEmail]      DATETIME         NULL,
    [Notes]          VARCHAR (MAX)    NULL,
    [Guid]           UNIQUEIDENTIFIER NOT NULL,
    [ContentType]    CHAR (2)         NULL,
    CONSTRAINT [PK_notificationID] PRIMARY KEY CLUSTERED ([notificationID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_notification_addressee_documentID] FOREIGN KEY ([Addressee]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_notification_user_createdBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_notifications_lnt_contentType] FOREIGN KEY ([ContentType]) REFERENCES [dbo].[lookup_note_types] ([typeID])
);


GO
CREATE STATISTICS [_dta_stat_798013974_7_11]
    ON [dbo].[Notifications]([Received], [ContentType]);


GO
CREATE STATISTICS [_dta_stat_798013974_4_6]
    ON [dbo].[Notifications]([Created], [Type]);


GO
CREATE STATISTICS [_dta_stat_798013974_1_7]
    ON [dbo].[Notifications]([notificationID], [Received]);


GO
CREATE STATISTICS [_dta_stat_798013974_4_2_6]
    ON [dbo].[Notifications]([Created], [Addressee], [Type]);


GO
CREATE STATISTICS [_dta_stat_798013974_11_1_7]
    ON [dbo].[Notifications]([ContentType], [notificationID], [Received]);


GO
CREATE STATISTICS [_dta_stat_798013974_6_1_7]
    ON [dbo].[Notifications]([Type], [notificationID], [Received]);


GO
CREATE STATISTICS [_dta_stat_798013974_7_2_1]
    ON [dbo].[Notifications]([Received], [Addressee], [notificationID]);


GO
CREATE STATISTICS [_dta_stat_798013974_1_5_7]
    ON [dbo].[Notifications]([notificationID], [CreatedBy], [Received]);


GO
CREATE STATISTICS [_dta_stat_798013974_1_5_2_7]
    ON [dbo].[Notifications]([notificationID], [CreatedBy], [Addressee], [Received]);


GO
CREATE STATISTICS [_dta_stat_798013974_1_2_7_11]
    ON [dbo].[Notifications]([notificationID], [Addressee], [Received], [ContentType]);


GO
CREATE STATISTICS [_dta_stat_798013974_7_6_1_5_4]
    ON [dbo].[Notifications]([Received], [Type], [notificationID], [CreatedBy], [Created]);

