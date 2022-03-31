CREATE TABLE [dbo].[SaritasaMessages] (
    [Id]                BIGINT           IDENTITY (1, 1) NOT NULL,
    [Type]              TINYINT          NOT NULL,
    [ContentId]         UNIQUEIDENTIFIER NOT NULL,
    [ContentType]       VARCHAR (255)    NOT NULL,
    [Content]           NVARCHAR (MAX)   NOT NULL,
    [Data]              NVARCHAR (MAX)   NULL,
    [ErrorDetails]      NVARCHAR (MAX)   NULL,
    [ErrorMessage]      VARCHAR (255)    DEFAULT ('') NOT NULL,
    [ErrorType]         VARCHAR (255)    DEFAULT ('') NOT NULL,
    [CreatedAt]         DATETIME         NOT NULL,
    [ExecutionDuration] INT              NOT NULL,
    [Status]            TINYINT          NOT NULL,
    CONSTRAINT [PK_SaritasaMessages] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80)
);


GO
CREATE NONCLUSTERED INDEX [IX_SaritasaMessages_ContentType]
    ON [dbo].[SaritasaMessages]([ContentType] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_SaritasaMessages_ContentId]
    ON [dbo].[SaritasaMessages]([ContentId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_SaritasaMessages_Type]
    ON [dbo].[SaritasaMessages]([Type] ASC) WITH (FILLFACTOR = 80);

