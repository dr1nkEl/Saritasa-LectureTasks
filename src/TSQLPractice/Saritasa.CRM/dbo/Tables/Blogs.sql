CREATE TABLE [dbo].[Blogs] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [UserId]          INT           NOT NULL,
    [CreatedAt]       DATETIME      NOT NULL,
    [Title]           VARCHAR (200) NULL,
    [Text]            VARCHAR (MAX) NOT NULL,
    [CommentBlogId]   INT           NULL,
    [ParentCommentId] INT           NULL,
    [RemovedAt]       DATETIME      NULL,
    CONSTRAINT [PK_blogs] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_blogs_commentBlogID] FOREIGN KEY ([CommentBlogId]) REFERENCES [dbo].[Blogs] ([Id]),
    CONSTRAINT [FK_blogs_parrentCommentID] FOREIGN KEY ([ParentCommentId]) REFERENCES [dbo].[Blogs] ([Id]),
    CONSTRAINT [FK_blogs_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [blogs_commentBlogID]
    ON [dbo].[Blogs]([CommentBlogId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_266900468_2_6]
    ON [dbo].[Blogs]([UserId], [CommentBlogId]);


GO
CREATE STATISTICS [_dta_stat_266900468_1_8]
    ON [dbo].[Blogs]([Id], [RemovedAt]);


GO
CREATE STATISTICS [_dta_stat_266900468_6_8_2]
    ON [dbo].[Blogs]([CommentBlogId], [RemovedAt], [UserId]);


GO
CREATE STATISTICS [_dta_stat_266900468_6_1_8]
    ON [dbo].[Blogs]([CommentBlogId], [Id], [RemovedAt]);


GO
CREATE STATISTICS [_dta_stat_266900468_2_1_6_8]
    ON [dbo].[Blogs]([UserId], [Id], [CommentBlogId], [RemovedAt]);

