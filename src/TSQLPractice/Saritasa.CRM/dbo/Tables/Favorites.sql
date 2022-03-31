CREATE TABLE [dbo].[Favorites] (
    [favoriteID] BIGINT   IDENTITY (1, 1) NOT NULL,
    [DocumentId] BIGINT   NOT NULL,
    [UserId]     INT      NOT NULL,
    [Created]    DATETIME CONSTRAINT [DF_favorites_created] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_favorites] PRIMARY KEY CLUSTERED ([favoriteID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_favorites_documents] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_favorites_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [UIX_userID_documentID] UNIQUE NONCLUSTERED ([UserId] ASC, [DocumentId] ASC) WITH (FILLFACTOR = 80)
);


GO
CREATE NONCLUSTERED INDEX [IX_userID_documentID]
    ON [dbo].[Favorites]([UserId] ASC, [DocumentId] ASC) WITH (FILLFACTOR = 80);

