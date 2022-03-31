CREATE TABLE [dbo].[task_boomerangs] (
    [boomerangID] BIGINT   IDENTITY (1, 1) NOT NULL,
    [TaskId]      BIGINT   NOT NULL,
    [UserId]      INT      NOT NULL,
    [Type]        CHAR (2) NOT NULL,
    [FireTime]    DATETIME NOT NULL,
    [IsFired]     BIT      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_task_boomerangs] PRIMARY KEY CLUSTERED ([boomerangID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_task_boomerangs_tasks] FOREIGN KEY ([TaskId]) REFERENCES [dbo].[Tasks] ([taskID]),
    CONSTRAINT [FK_task_boomerangs_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_task_boomerangs_taskID_userID]
    ON [dbo].[task_boomerangs]([TaskId] ASC, [UserId] ASC) WITH (FILLFACTOR = 80);

