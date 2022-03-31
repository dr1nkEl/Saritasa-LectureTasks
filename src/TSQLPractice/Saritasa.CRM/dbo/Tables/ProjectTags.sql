CREATE TABLE [dbo].[ProjectTags] (
    [Id]        BIGINT IDENTITY (1, 1) NOT NULL,
    [ProjectId] INT    NOT NULL,
    [TagId]     BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ProjectTags_Projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID]),
    CONSTRAINT [FK_ProjectTags_Tags] FOREIGN KEY ([TagId]) REFERENCES [dbo].[Tags] ([tagID])
);


GO
CREATE NONCLUSTERED INDEX [IX_ProjectTags_TagId]
    ON [dbo].[ProjectTags]([TagId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_ProjectTags_ProjectId]
    ON [dbo].[ProjectTags]([ProjectId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UIX_ProjectId_TaskTagId]
    ON [dbo].[ProjectTags]([Id] ASC, [TagId] ASC) WITH (FILLFACTOR = 80);

