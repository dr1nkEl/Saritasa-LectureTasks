CREATE TABLE [dbo].[search_results] (
    [resultID]    INT           IDENTITY (1, 1) NOT NULL,
    [Points]      INT           NULL,
    [Title]       VARCHAR (MAX) NULL,
    [Description] VARCHAR (MAX) NULL,
    [SearchId]    INT           NOT NULL,
    [DocumentId]  BIGINT        NOT NULL,
    CONSTRAINT [PK_sr_resultID] PRIMARY KEY CLUSTERED ([resultID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_sr_document_documentID] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_sr_search_searchID] FOREIGN KEY ([SearchId]) REFERENCES [dbo].[Search] ([searchID])
);


GO
CREATE NONCLUSTERED INDEX [IX_search_results_searchID]
    ON [dbo].[search_results]([SearchId] ASC) WITH (FILLFACTOR = 80);

