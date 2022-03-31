CREATE TABLE [dbo].[Search] (
    [searchID]     INT           IDENTITY (1, 1) NOT NULL,
    [CacheTime]    INT           NULL,
    [Created]      DATETIME      NULL,
    [SearchPhrase] VARCHAR (255) NULL,
    [TypeId]       CHAR (3)      NOT NULL,
    [UserId]       INT           NOT NULL,
    CONSTRAINT [PK_searchID] PRIMARY KEY CLUSTERED ([searchID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_search_ldt_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[lookup_document_types] ([typeID]),
    CONSTRAINT [FK_search_user_userID] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_search_userID]
    ON [dbo].[Search]([UserId] ASC) WITH (FILLFACTOR = 80);

