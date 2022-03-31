CREATE TABLE [dbo].[role_permissions] (
    [permissionID] INT      IDENTITY (1, 1) NOT NULL,
    [pView]        BIT      NULL,
    [pEdit]        BIT      NULL,
    [pAdd]         BIT      NULL,
    [pDelete]      BIT      NULL,
    [RoleId]       CHAR (3) NOT NULL,
    [TypeId]       CHAR (3) NOT NULL,
    CONSTRAINT [PK_rp_permissionID] PRIMARY KEY CLUSTERED ([permissionID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_rp_ldt_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[lookup_document_types] ([typeID]),
    CONSTRAINT [FK_rp_lur_roleID] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[lookup_user_roles] ([roleID])
);


GO
CREATE NONCLUSTERED INDEX [IX_role_permissions_roleID]
    ON [dbo].[role_permissions]([RoleId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_role_permissions_typeID]
    ON [dbo].[role_permissions]([TypeId] ASC) WITH (FILLFACTOR = 80);

