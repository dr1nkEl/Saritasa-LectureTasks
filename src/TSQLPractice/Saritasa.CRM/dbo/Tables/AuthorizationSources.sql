CREATE TABLE [dbo].[AuthorizationSources] (
    [Id]         INT              IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (50)    NOT NULL,
    [Host]       NVARCHAR (100)   NOT NULL,
    [ExternalId] UNIQUEIDENTIFIER CONSTRAINT [DF_AuthorizationSources_ExternalId] DEFAULT (newid()) NOT NULL,
    CONSTRAINT [PK_AuthorizationSources] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80)
);

