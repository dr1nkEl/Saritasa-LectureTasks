CREATE TABLE [dbo].[project_features] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [DocumentId]  BIGINT        NOT NULL,
    [ProjectId]   INT           NOT NULL,
    [Name]        VARCHAR (255) NOT NULL,
    [Limit]       INT           CONSTRAINT [DF_project_features_limit] DEFAULT ((0)) NOT NULL,
    [Description] VARCHAR (MAX) NULL,
    CONSTRAINT [PK_project_features] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_project_features_documents] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID])
);

