CREATE TABLE [dbo].[ProjectRequisites] (
    [ProjectRequisiteID] INT           IDENTITY (1, 1) NOT NULL,
    [ProjectId]          INT           NOT NULL,
    [Name]               VARCHAR (255) NOT NULL,
    [Value]              VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_ProjectRequisites] PRIMARY KEY CLUSTERED ([ProjectRequisiteID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ProjectRequisites_ProjectRequisites] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID])
);

