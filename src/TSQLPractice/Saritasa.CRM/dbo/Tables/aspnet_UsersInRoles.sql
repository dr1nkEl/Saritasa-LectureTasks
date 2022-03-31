CREATE TABLE [dbo].[aspnet_UsersInRoles] (
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    [RoleId] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK__aspnet_UsersInRo__24334AAC] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK__aspnet_Us__RoleI__261B931E] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[aspnet_Roles] ([RoleId]),
    CONSTRAINT [FK__aspnet_Us__UserI__25276EE5] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
);


GO
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index]
    ON [dbo].[aspnet_UsersInRoles]([RoleId] ASC) WITH (FILLFACTOR = 80);

