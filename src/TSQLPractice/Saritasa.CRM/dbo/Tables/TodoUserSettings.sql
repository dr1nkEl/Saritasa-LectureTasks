CREATE TABLE [dbo].[TodoUserSettings] (
    [todoWinId] INT         NOT NULL,
    [userId]    INT         NOT NULL,
    [color]     VARCHAR (6) NULL,
    [top]       INT         NULL,
    [left]      INT         NULL,
    [minimize]  BIT         NULL,
    CONSTRAINT [PK_todoUserSettings] PRIMARY KEY CLUSTERED ([todoWinId] ASC, [userId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_todoUserSettings_ToDoSettings] FOREIGN KEY ([todoWinId]) REFERENCES [dbo].[TodoSettings] ([Id]),
    CONSTRAINT [FK_todoUserSettings_users] FOREIGN KEY ([userId]) REFERENCES [dbo].[Users] ([Id])
);

