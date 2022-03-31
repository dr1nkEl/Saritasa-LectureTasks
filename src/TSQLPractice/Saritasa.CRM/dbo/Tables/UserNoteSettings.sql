CREATE TABLE [dbo].[UserNoteSettings] (
    [setID]       INT      IDENTITY (1, 1) NOT NULL,
    [ContentType] CHAR (2) NOT NULL,
    [UserId]      INT      NOT NULL,
    [Type]        TINYINT  NULL,
    CONSTRAINT [PK_setID] PRIMARY KEY CLUSTERED ([setID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_uns_lnt_contentType] FOREIGN KEY ([ContentType]) REFERENCES [dbo].[lookup_note_types] ([typeID]),
    CONSTRAINT [FK_uns_user_userID] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);

