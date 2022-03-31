CREATE TABLE [dbo].[ProjectMilestones] (
    [Id]                INT          IDENTITY (1, 1) NOT NULL,
    [ProjectId]         INT          NOT NULL,
    [Name]              VARCHAR (50) DEFAULT ('') NOT NULL,
    [ReleaseVersion]    VARCHAR (50) DEFAULT ('') NOT NULL,
    [ScheduledDate]     DATETIME     NOT NULL,
    [LimitHours]        INT          DEFAULT ((0)) NOT NULL,
    [Released]          BIT          DEFAULT ((0)) NOT NULL,
    [ActualReleaseDate] DATETIME     NULL,
    [Order]             SMALLINT     DEFAULT ((0)) NOT NULL,
    [CreatedAt]         DATETIME     DEFAULT (getdate()) NOT NULL,
    [CreatedByUserId]   INT          NOT NULL,
    [UpdatedAt]         DATETIME     NULL,
    [UpdatedByUserId]   INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ProjectMilestones_Project] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID]),
    CONSTRAINT [FK_ProjectMilestones_Users_CreatedByUserId] FOREIGN KEY ([CreatedByUserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ProjectMilestones_Users_UpdatedByUserId] FOREIGN KEY ([UpdatedByUserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ProjectMilestones_ProjectId]
    ON [dbo].[ProjectMilestones]([ProjectId] ASC) WITH (FILLFACTOR = 80);

