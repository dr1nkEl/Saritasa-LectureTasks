CREATE TABLE [dbo].[project_features_resources] (
    [Id]               INT          IDENTITY (1, 1) NOT NULL,
    [ProjectFeatureId] INT          NOT NULL,
    [UserId]           INT          NOT NULL,
    [Role]             VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_project_features_resources] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_project_features_resources_project_features1] FOREIGN KEY ([ProjectFeatureId]) REFERENCES [dbo].[project_features] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_project_features_resources_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);

