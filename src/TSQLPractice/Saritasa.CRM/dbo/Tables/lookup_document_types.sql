CREATE TABLE [dbo].[lookup_document_types] (
    [typeID]   CHAR (3)  NOT NULL,
    [TypeName] CHAR (60) NULL,
    CONSTRAINT [PK_ldt_typeID] PRIMARY KEY CLUSTERED ([typeID] ASC) WITH (FILLFACTOR = 80)
);

