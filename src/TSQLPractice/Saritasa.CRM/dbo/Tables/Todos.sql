CREATE TABLE [dbo].[Todos] (
    [toDoID]      INT           IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (MAX) NOT NULL,
    [Date]        DATETIME      NOT NULL,
    [Completed]   DATETIME      NULL,
    [WinId]       INT           NOT NULL,
    CONSTRAINT [PK_todos] PRIMARY KEY CLUSTERED ([toDoID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_todos_ToDoSettings] FOREIGN KEY ([WinId]) REFERENCES [dbo].[TodoSettings] ([Id])
);


GO
CREATE STATISTICS [_dta_stat_1454380696_8_5]
    ON [dbo].[Todos]([WinId], [Date]);


GO
CREATE STATISTICS [_dta_stat_1454380696_8_6_5]
    ON [dbo].[Todos]([WinId], [Completed], [Date]);

