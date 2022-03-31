CREATE TABLE [dbo].[BlogRatings] (
    [RatingId] INT IDENTITY (1, 1) NOT NULL,
    [BlogId]   INT NOT NULL,
    [UserId]   INT NOT NULL,
    [Point]    INT NOT NULL,
    CONSTRAINT [PK_blogRatings] PRIMARY KEY CLUSTERED ([RatingId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_blogRatings_blogs] FOREIGN KEY ([BlogId]) REFERENCES [dbo].[Blogs] ([Id]),
    CONSTRAINT [FK_blogRatings_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [blogRatings_blogID]
    ON [dbo].[BlogRatings]([BlogId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [blogRatings_userID]
    ON [dbo].[BlogRatings]([UserId] ASC) WITH (FILLFACTOR = 80);

