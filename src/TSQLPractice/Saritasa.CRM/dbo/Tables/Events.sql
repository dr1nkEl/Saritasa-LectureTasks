CREATE TABLE [dbo].[Events] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [start_date]  DATETIME       NOT NULL,
    [end_date]    DATETIME       NOT NULL,
    [Description] VARCHAR (1000) NULL,
    [CreatorId]   INT            NOT NULL,
    [EventType]   INT            NOT NULL,
    [Priority]    TINYINT        CONSTRAINT [DF_Events_priority] DEFAULT ((5)) NOT NULL,
    CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_Events_users] FOREIGN KEY ([CreatorId]) REFERENCES [dbo].[Users] ([Id])
);

