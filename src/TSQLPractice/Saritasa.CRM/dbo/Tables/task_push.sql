CREATE TABLE [dbo].[task_push] (
    [pushID]      BIGINT        IDENTITY (1, 1) NOT NULL,
    [TaskId]      BIGINT        NOT NULL,
    [InitiatorId] INT           NOT NULL,
    [RecipientId] INT           NOT NULL,
    [Created]     DATETIME      CONSTRAINT [DF_task_push_created] DEFAULT (getdate()) NOT NULL,
    [Comment]     VARCHAR (255) CONSTRAINT [DF_task_push_comment] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_task_push] PRIMARY KEY CLUSTERED ([pushID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_task_push_tasks_taskID] FOREIGN KEY ([TaskId]) REFERENCES [dbo].[Tasks] ([taskID]),
    CONSTRAINT [FK_task_push_users_initiatorID] FOREIGN KEY ([InitiatorId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_task_push_users_recipientID] FOREIGN KEY ([RecipientId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_task_push_taskID]
    ON [dbo].[task_push]([TaskId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_1497524864_4_1]
    ON [dbo].[task_push]([RecipientId], [pushID]);


GO
CREATE STATISTICS [_dta_stat_1497524864_1_2_4]
    ON [dbo].[task_push]([pushID], [TaskId], [RecipientId]);

