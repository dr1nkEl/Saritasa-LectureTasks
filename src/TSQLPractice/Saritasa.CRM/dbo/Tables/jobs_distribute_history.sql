CREATE TABLE [dbo].[jobs_distribute_history] (
    [JobDistributeHistoryID] INT            IDENTITY (1, 1) NOT NULL,
    [DistributedForUserID]   INT            NOT NULL,
    [ProjectId]              INT            NOT NULL,
    [Duration]               INT            NOT NULL,
    [Comment]                VARCHAR (8000) NOT NULL,
    [Created]                DATETIME       NOT NULL,
    [CreatedBy]              INT            NOT NULL,
    [DistributedForDate]     DATETIME       NOT NULL,
    CONSTRAINT [PK_jobs_distribute_history] PRIMARY KEY CLUSTERED ([JobDistributeHistoryID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_jobs_distribute_history_projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID]),
    CONSTRAINT [FK_jobs_distribute_history_users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_jobs_distribute_history_users1] FOREIGN KEY ([DistributedForUserID]) REFERENCES [dbo].[Users] ([Id])
);

