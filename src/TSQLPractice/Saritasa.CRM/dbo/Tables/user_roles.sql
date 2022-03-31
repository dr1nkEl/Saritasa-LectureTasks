CREATE TABLE [dbo].[user_roles] (
    [userRoleID] INT      IDENTITY (1, 1) NOT NULL,
    [RoleId]     CHAR (3) NOT NULL,
    [UserId]     INT      NOT NULL,
    [Created]    DATETIME NULL,
    CONSTRAINT [PK_userRoleID] PRIMARY KEY CLUSTERED ([userRoleID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ur_lur_roleID] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[lookup_user_roles] ([roleID]),
    CONSTRAINT [FK_ur_user_userID] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_user_roles_roleID]
    ON [dbo].[user_roles]([RoleId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_user_roles_userID]
    ON [dbo].[user_roles]([UserId] ASC) WITH (FILLFACTOR = 80);

