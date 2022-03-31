CREATE TABLE [dbo].[Permissions] (
    [permissionID] INT          IDENTITY (1, 1) NOT NULL,
    [RoleId]       CHAR (3)     NOT NULL,
    [RuleId]       VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_permissions_permissionID] PRIMARY KEY CLUSTERED ([permissionID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_permissions_lr_ruleID] FOREIGN KEY ([RuleId]) REFERENCES [dbo].[lookup_rules] ([ruleID]),
    CONSTRAINT [FK_permissions_lur_roleID] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[lookup_user_roles] ([roleID])
);

