CREATE TABLE [dbo].[project_reviews] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [ProjectId]     INT           NOT NULL,
    [Name]          VARCHAR (100) NOT NULL,
    [ScheduledDate] DATETIME      NOT NULL,
    [CreatedBy]     INT           NOT NULL,
    [Created]       DATETIME      NOT NULL,
    [ReviewTo]      INT           NOT NULL,
    [ReviewedBy]    INT           NULL,
    [ReviewDate]    DATETIME      NULL,
    [UpdatedBy]     INT           NULL,
    [Updated]       DATETIME      NULL,
    [Rating]        INT           NULL,
    [Comment]       TEXT          CONSTRAINT [DF_project_reviews_comment] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_project_reviews] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_project_reviews_projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID]),
    CONSTRAINT [FK_project_reviews_users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_project_reviews_users_reviewedBy] FOREIGN KEY ([ReviewedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_project_reviews_users_reviewTo] FOREIGN KEY ([ReviewTo]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_project_reviews_users_updatedBy] FOREIGN KEY ([UpdatedBy]) REFERENCES [dbo].[Users] ([Id])
);

