CREATE TABLE [dbo].[birthday_comment_ratings] (
    [BirthdayCommentId] INT NOT NULL,
    [RatedUserId]       INT NOT NULL,
    [Rating]            INT NULL,
    CONSTRAINT [PK_birthday_comment_ratings] PRIMARY KEY CLUSTERED ([BirthdayCommentId] ASC, [RatedUserId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_birthday_comment_ratings_birthdayComments] FOREIGN KEY ([BirthdayCommentId]) REFERENCES [dbo].[birthday_comments] ([commentID]),
    CONSTRAINT [FK_birthday_comment_ratings_users] FOREIGN KEY ([RatedUserId]) REFERENCES [dbo].[Users] ([Id])
);

