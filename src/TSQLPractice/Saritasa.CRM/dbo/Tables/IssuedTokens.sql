CREATE TABLE [dbo].[IssuedTokens] (
    [Id]                    BIGINT   IDENTITY (1, 1) NOT NULL,
    [UserId]                INT      NOT NULL,
    [AuthorizationSourceId] INT      NULL,
    [IssuedAt]              DATETIME NOT NULL,
    [RevokedAt]             DATETIME NULL,
    CONSTRAINT [PK_IssuedTokens] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_IssuedTokens_AuthorizationSource] FOREIGN KEY ([AuthorizationSourceId]) REFERENCES [dbo].[AuthorizationSources] ([Id]),
    CONSTRAINT [FK_IssuedTokens_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);

