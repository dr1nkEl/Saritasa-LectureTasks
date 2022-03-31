CREATE TABLE [dbo].[lookup_user_roles] (
    [roleID]   CHAR (3)     NOT NULL,
    [RoleName] VARCHAR (55) NULL,
    CONSTRAINT [PK_lur_roleID] PRIMARY KEY CLUSTERED ([roleID] ASC) WITH (FILLFACTOR = 80)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_lur_roleName]
    ON [dbo].[lookup_user_roles]([RoleName] ASC) WITH (FILLFACTOR = 80);

