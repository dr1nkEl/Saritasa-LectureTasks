CREATE TABLE [dbo].[AcceptedJobsUsers] (
    [UserId]    INT      NOT NULL,
    [JobId]     BIGINT   NOT NULL,
    [CreatedAt] DATETIME NOT NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC, [JobId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_AcceptedJobsUsers_Jobs_JobId] FOREIGN KEY ([JobId]) REFERENCES [dbo].[Jobs] ([jobID]),
    CONSTRAINT [FK_AcceptedJobsUsers_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);

