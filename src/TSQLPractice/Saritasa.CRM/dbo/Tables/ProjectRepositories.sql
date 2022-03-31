CREATE TABLE [dbo].[ProjectRepositories] (
    [repositoryID] INT           IDENTITY (1, 1) NOT NULL,
    [ProjectId]    INT           NOT NULL,
    [Name]         VARCHAR (300) NOT NULL,
    [CloneFrom]    VARCHAR (300) NOT NULL,
    [Comments]     VARCHAR (MAX) NULL,
    [Type]         CHAR (3)      DEFAULT ('HG') NOT NULL,
    CONSTRAINT [PK_projectRepositories] PRIMARY KEY CLUSTERED ([repositoryID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_projectRepositories_projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID])
);

