CREATE TABLE [dbo].[task_assigned] (
    [taskAssignmentID] INT      IDENTITY (1, 1) NOT NULL,
    [Assigned]         DATETIME NOT NULL,
    [Accepted]         DATETIME NULL,
    [StartedWork]      DATETIME NULL,
    [TaskId]           BIGINT   NOT NULL,
    [UserId]           INT      NOT NULL,
    [AssignedBy]       INT      NOT NULL,
    [FinishedWork]     DATETIME NULL,
    [Deleted]          DATETIME NULL,
    [DurationLimit]    INT      NULL,
    [MadeOther]        BIT      CONSTRAINT [DF_task_assigned_madeother_1] DEFAULT ((0)) NOT NULL,
    [IsBugFixing]      BIT      CONSTRAINT [DF_task_assigned_isBugFixing] DEFAULT ((0)) NOT NULL,
    [ExternalId]       BIGINT   NULL,
    [ExternalDbId]     INT      NULL,
    [IsExternalCopy]   BIT      CONSTRAINT [DF_task_assigned_isExternalCopy] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_taskAssignmentID] PRIMARY KEY CLUSTERED ([taskAssignmentID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_task_assigned_tasks] FOREIGN KEY ([TaskId]) REFERENCES [dbo].[Tasks] ([taskID])
);


GO
CREATE NONCLUSTERED INDEX [IX_task_assigned_taskID]
    ON [dbo].[task_assigned]([TaskId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_task_assigned_userID]
    ON [dbo].[task_assigned]([UserId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_task_assigned_taskID_userID]
    ON [dbo].[task_assigned]([TaskId] ASC, [UserId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_1546136949_1_9]
    ON [dbo].[task_assigned]([taskAssignmentID], [Deleted]);


GO
CREATE STATISTICS [_dta_stat_1546136949_1_8]
    ON [dbo].[task_assigned]([taskAssignmentID], [FinishedWork]);


GO
CREATE STATISTICS [_dta_stat_1546136949_5_9]
    ON [dbo].[task_assigned]([TaskId], [Deleted]);


GO
CREATE STATISTICS [_dta_stat_1546136949_6_8]
    ON [dbo].[task_assigned]([UserId], [FinishedWork]);


GO
CREATE STATISTICS [_dta_stat_1546136949_1_5_9]
    ON [dbo].[task_assigned]([taskAssignmentID], [TaskId], [Deleted]);


GO
CREATE STATISTICS [_dta_stat_1546136949_1_5_6]
    ON [dbo].[task_assigned]([taskAssignmentID], [TaskId], [UserId]);


GO
CREATE STATISTICS [_dta_stat_1546136949_9_5_6]
    ON [dbo].[task_assigned]([Deleted], [TaskId], [UserId]);


GO
CREATE STATISTICS [_dta_stat_1546136949_6_1_8]
    ON [dbo].[task_assigned]([UserId], [taskAssignmentID], [FinishedWork]);


GO
CREATE STATISTICS [_dta_stat_1546136949_6_9_1]
    ON [dbo].[task_assigned]([UserId], [Deleted], [taskAssignmentID]);


GO
CREATE STATISTICS [_dta_stat_1546136949_5_1_6_9]
    ON [dbo].[task_assigned]([TaskId], [taskAssignmentID], [UserId], [Deleted]);


GO
CREATE STATISTICS [_dta_stat_1546136949_8_6_9_3]
    ON [dbo].[task_assigned]([FinishedWork], [UserId], [Deleted], [Accepted]);


GO
CREATE STATISTICS [_dta_stat_1546136949_6_1_9_8]
    ON [dbo].[task_assigned]([UserId], [taskAssignmentID], [Deleted], [FinishedWork]);


GO
CREATE STATISTICS [_dta_stat_1546136949_5_8_6_10]
    ON [dbo].[task_assigned]([TaskId], [FinishedWork], [UserId], [DurationLimit]);


GO
CREATE STATISTICS [_dta_stat_1546136949_8_5_9_1_6]
    ON [dbo].[task_assigned]([FinishedWork], [TaskId], [Deleted], [taskAssignmentID], [UserId]);


GO
CREATE STATISTICS [_dta_stat_1546136949_5_6_9_3_4]
    ON [dbo].[task_assigned]([TaskId], [UserId], [Deleted], [Accepted], [StartedWork]);


GO
CREATE STATISTICS [_dta_stat_1546136949_6_9_8_5_3]
    ON [dbo].[task_assigned]([UserId], [Deleted], [FinishedWork], [TaskId], [Accepted]);


GO
CREATE STATISTICS [_dta_stat_1546136949_8_6_10_9_5]
    ON [dbo].[task_assigned]([FinishedWork], [UserId], [DurationLimit], [Deleted], [TaskId]);


GO
CREATE STATISTICS [_dta_stat_1546136949_6_9_3_4_8_5]
    ON [dbo].[task_assigned]([UserId], [Deleted], [Accepted], [StartedWork], [FinishedWork], [TaskId]);


GO
CREATE STATISTICS [_dta_stat_1546136949_6_9_8_1_3_4_5]
    ON [dbo].[task_assigned]([UserId], [Deleted], [FinishedWork], [taskAssignmentID], [Accepted], [StartedWork], [TaskId]);


GO
CREATE TRIGGER dbo.[task_assigned_AspNet_SqlCacheNotification_Trigger] ON [task_assigned]
                       FOR INSERT, UPDATE, DELETE AS BEGIN
                       SET NOCOUNT ON
                       EXEC dbo.AspNet_SqlCacheUpdateChangeIdStoredProcedure N'task_assigned'
                       END
                       