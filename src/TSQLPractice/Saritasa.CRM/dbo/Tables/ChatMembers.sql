CREATE TABLE [dbo].[ChatMembers] (
    [Id]               INT IDENTITY (1, 1) NOT NULL,
    [ChatId]           INT NOT NULL,
    [UserId]           INT NOT NULL,
    [Closed]           BIT CONSTRAINT [DF_chatMembers_closed] DEFAULT ((0)) NOT NULL,
    [ViewedTextLength] INT CONSTRAINT [DF_chatMembers_viewedTextLength] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_chatMembers] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_chatMembers_chat] FOREIGN KEY ([ChatId]) REFERENCES [dbo].[Chat] ([Id]),
    CONSTRAINT [FK_chatMembers_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);

