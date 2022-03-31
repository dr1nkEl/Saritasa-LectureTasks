CREATE TABLE [dbo].[FileFolders] (
    [folderID]  INT           IDENTITY (1, 1) NOT NULL,
    [ProjectId] INT           NOT NULL,
    [Name]      VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_fileFolders] PRIMARY KEY CLUSTERED ([folderID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_fileFolders_projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID])
);

