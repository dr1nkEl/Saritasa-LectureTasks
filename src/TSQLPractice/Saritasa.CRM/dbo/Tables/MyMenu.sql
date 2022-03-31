CREATE TABLE [dbo].[MyMenu] (
    [menuID]    INT           IDENTITY (1, 1) NOT NULL,
    [Created]   DATETIME      NULL,
    [LimitView] VARCHAR (MAX) NULL,
    [Title]     VARCHAR (70)  NULL,
    [Url]       VARCHAR (MAX) NULL,
    [UserId]    INT           NOT NULL,
    [ModuleId]  INT           NULL,
    CONSTRAINT [PK_menuID] PRIMARY KEY CLUSTERED ([menuID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_mymenu_user_userID] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_mymenu_moduleID]
    ON [dbo].[MyMenu]([ModuleId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_mymenu_userID]
    ON [dbo].[MyMenu]([UserId] ASC) WITH (FILLFACTOR = 80);

