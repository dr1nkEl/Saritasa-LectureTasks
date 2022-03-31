CREATE TABLE [dbo].[user_supervisers] (
    [UserId]       INT NOT NULL,
    [SuperviserId] INT NOT NULL,
    CONSTRAINT [PK_user_supervisers] PRIMARY KEY CLUSTERED ([UserId] ASC, [SuperviserId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_user_supervisers_supervisers] FOREIGN KEY ([SuperviserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_user_supervisers_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);

