CREATE TABLE [dbo].[EmailTaskTargets] (
    [Id]        UNIQUEIDENTIFIER NOT NULL,
    [TaskId]    BIGINT           NOT NULL,
    [TargetId]  BIGINT           NOT NULL,
    [SprintId]  INT              DEFAULT (NULL) NULL,
    [FeatureId] INT              DEFAULT (NULL) NULL,
    CONSTRAINT [PK_emailTaskTargets] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_emailTaskTargets_documents] FOREIGN KEY ([TargetId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_emailTaskTargets_tasks] FOREIGN KEY ([TaskId]) REFERENCES [dbo].[Tasks] ([taskID])
);

