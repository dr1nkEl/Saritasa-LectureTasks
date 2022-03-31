CREATE TABLE [dbo].[project_sprints] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [DocumentId]  BIGINT        NOT NULL,
    [ProjectId]   INT           NOT NULL,
    [Name]        VARCHAR (50)  NOT NULL,
    [Limit]       INT           NOT NULL,
    [StartDate]   DATETIME      NOT NULL,
    [FinishDate]  DATETIME      NOT NULL,
    [Description] VARCHAR (MAX) NULL,
    CONSTRAINT [PK_project_sprints] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_project_sprints_documents] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_project_sprints_projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID])
);

