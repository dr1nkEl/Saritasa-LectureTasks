CREATE TABLE [dbo].[ProjectPriority] (
    [priorityID] INT         IDENTITY (1, 1) NOT NULL,
    [Name]       VARCHAR (3) NOT NULL,
    [Color]      VARCHAR (6) NOT NULL,
    CONSTRAINT [PK_projectPriority] PRIMARY KEY CLUSTERED ([priorityID] ASC) WITH (FILLFACTOR = 80)
);

