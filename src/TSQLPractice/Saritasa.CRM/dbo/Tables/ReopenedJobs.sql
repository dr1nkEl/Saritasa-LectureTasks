CREATE TABLE [dbo].[ReopenedJobs] (
    [Id]           BIGINT          IDENTITY (1, 1) NOT NULL,
    [JobId]        BIGINT          NOT NULL,
    [ReopenedById] INT             NOT NULL,
    [ReopenedAt]   DATETIME        NOT NULL,
    [Reason]       VARCHAR (100)   NULL,
    [JobText]      NVARCHAR (4000) NOT NULL,
    [Billable]     BIT             NOT NULL,
    [Duration]     INT             NOT NULL,
    [UserId]       INT             NOT NULL,
    [ProjectId]    INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ReopenedJobs_Jobs_JobId] FOREIGN KEY ([JobId]) REFERENCES [dbo].[Jobs] ([jobID]),
    CONSTRAINT [FK_ReopenedJobs_Projects_ProjectId] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID]),
    CONSTRAINT [FK_ReopenedJobs_Users_ReopenedById] FOREIGN KEY ([ReopenedById]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ReopenedJobs_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ReopenedJobs_ProjectId]
    ON [dbo].[ReopenedJobs]([ProjectId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_ReopenedJobs_JobId]
    ON [dbo].[ReopenedJobs]([JobId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_ReopenedJobs_ReopenedAt]
    ON [dbo].[ReopenedJobs]([ReopenedAt] ASC) WITH (FILLFACTOR = 80);

