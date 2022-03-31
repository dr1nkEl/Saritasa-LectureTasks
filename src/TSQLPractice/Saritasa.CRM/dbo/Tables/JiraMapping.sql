CREATE TABLE [dbo].[JiraMapping] (
    [Id]                  BIGINT       IDENTITY (1, 1) NOT NULL,
    [TypeId]              CHAR (3)     NOT NULL,
    [SourceId]            BIGINT       NOT NULL,
    [DestinationId]       VARCHAR (50) NOT NULL,
    [Instance]            VARCHAR (20) DEFAULT ('') NOT NULL,
    [LastUpdateTimestamp] BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80)
);


GO
CREATE NONCLUSTERED INDEX [IX_SourceID]
    ON [dbo].[JiraMapping]([SourceId] ASC) WITH (FILLFACTOR = 80);

