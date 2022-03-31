CREATE TABLE [dbo].[tasks_tags] (
    [task_tagID] BIGINT IDENTITY (1, 1) NOT NULL,
    [TagId]      BIGINT NOT NULL,
    [TaskId]     BIGINT NOT NULL,
    PRIMARY KEY CLUSTERED ([task_tagID] ASC) WITH (FILLFACTOR = 80),
    FOREIGN KEY ([TagId]) REFERENCES [dbo].[Tags] ([tagID]),
    FOREIGN KEY ([TaskId]) REFERENCES [dbo].[Tasks] ([taskID])
);

