CREATE TABLE [dbo].[project_managers] (
    [managerID] INT      IDENTITY (1, 1) NOT NULL,
    [ProjectId] INT      NOT NULL,
    [RoleId]    CHAR (3) NOT NULL,
    [UserId]    INT      NOT NULL,
    CONSTRAINT [PK_pm_managerID] PRIMARY KEY CLUSTERED ([managerID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_pm_lur_roleID] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[lookup_user_roles] ([roleID]),
    CONSTRAINT [FK_pm_project_projectID] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID]),
    CONSTRAINT [FK_pm_user_userID] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_project_managers_roleID]
    ON [dbo].[project_managers]([RoleId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_project_managers_projectID]
    ON [dbo].[project_managers]([ProjectId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_project_managers_userID]
    ON [dbo].[project_managers]([UserId] ASC) WITH (FILLFACTOR = 80);

