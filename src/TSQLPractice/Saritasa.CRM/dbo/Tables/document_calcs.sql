CREATE TABLE [dbo].[document_calcs] (
    [calcID]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [DocumentId] BIGINT        NOT NULL,
    [TypeId]     VARCHAR (20)  NOT NULL,
    [Val]        VARCHAR (300) NOT NULL,
    CONSTRAINT [PK_calcID] PRIMARY KEY CLUSTERED ([calcID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_dc_document_documentID] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_dc_lct_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[lookup_calc_types] ([typeID])
);


GO
CREATE NONCLUSTERED INDEX [IX_document_calcs_documentID]
    ON [dbo].[document_calcs]([DocumentId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_document_calcs_typeID]
    ON [dbo].[document_calcs]([TypeId] ASC) WITH (FILLFACTOR = 80);

