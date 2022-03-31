CREATE TABLE [dbo].[birthday_comments] (
    [commentID]       INT                IDENTITY (1, 1) NOT NULL,
    [UserID]          INT                NOT NULL,
    [Month]           INT                NOT NULL,
    [Comment]         NVARCHAR (MAX)     NULL,
    [CommentBy]       INT                NOT NULL,
    [Created]         DATETIMEOFFSET (0) NOT NULL,
    [parentCommentID] INT                NULL,
    [Deleted]         DATETIMEOFFSET (7) NULL,
    [rootCommentID]   INT                NULL,
    CONSTRAINT [PK_birthday_comment] PRIMARY KEY CLUSTERED ([commentID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_birthday_comments_root_self] FOREIGN KEY ([rootCommentID]) REFERENCES [dbo].[birthday_comments] ([commentID]),
    CONSTRAINT [FK_birthday_comments_self] FOREIGN KEY ([parentCommentID]) REFERENCES [dbo].[birthday_comments] ([commentID]),
    CONSTRAINT [FK_birthdayComments_users_commentBy] FOREIGN KEY ([CommentBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_birthdayComments_users_userID] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([Id])
);

