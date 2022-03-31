CREATE TABLE [dbo].[ProjectResources] (
    [Id]              INT      IDENTITY (1, 1) NOT NULL,
    [UserId]          INT      NOT NULL,
    [ProjectId]       INT      NOT NULL,
    [CreatedAt]       DATETIME NOT NULL,
    [CreatedByUserId] INT      NOT NULL,
    [UpdatedAt]       DATETIME NULL,
    [UpdatedByUserId] INT      NULL,
    [WorkTypeId]      INT      DEFAULT ((41)) NOT NULL,
    [IsDedicated]     BIT      CONSTRAINT [DF_ProjectResources_IsDedicated] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_project_resources] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_project_resources_projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID]),
    CONSTRAINT [FK_project_resources_UpdatedByUserId] FOREIGN KEY ([UpdatedByUserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_project_resources_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_project_resources_users1] FOREIGN KEY ([CreatedByUserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ProjectResources_WorkTypeId] FOREIGN KEY ([WorkTypeId]) REFERENCES [dbo].[lookup_workTypes] ([workTypeID])
);


GO
CREATE NONCLUSTERED INDEX [I_pr_ProjectID]
    ON [dbo].[ProjectResources]([ProjectId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [I_pr_userID]
    ON [dbo].[ProjectResources]([UserId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UK_project_resources]
    ON [dbo].[ProjectResources]([UserId] ASC, [ProjectId] ASC) WITH (FILLFACTOR = 80);

