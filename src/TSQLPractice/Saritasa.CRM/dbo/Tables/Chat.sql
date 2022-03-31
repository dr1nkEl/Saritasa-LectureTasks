CREATE TABLE [dbo].[Chat] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [LastCommentBy] INT           NULL,
    [Text]          VARCHAR (MAX) NULL,
    [Top]           INT           NULL,
    [Left]          INT           NULL,
    [Minimize]      BIT           NULL,
    CONSTRAINT [PK_chat] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_chat_users] FOREIGN KEY ([LastCommentBy]) REFERENCES [dbo].[Users] ([Id])
);

