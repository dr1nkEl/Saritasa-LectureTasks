CREATE TABLE [dbo].[TodoSettings] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [CreaterId] INT           NOT NULL,
    [UserId]    INT           NOT NULL,
    [Color]     VARCHAR (6)   NULL,
    [Top]       INT           NULL,
    [Left]      INT           NULL,
    [Minimize]  BIT           NULL,
    [Closed]    DATETIME      NULL,
    [Viewed]    BIT           NULL,
    [Name]      VARCHAR (100) NULL,
    CONSTRAINT [PK_ToDoSettings] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ToDoSettings_Creator] FOREIGN KEY ([CreaterId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ToDoSettings_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);

