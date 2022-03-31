CREATE TABLE [dbo].[lookup_note_types] (
    [typeID]   CHAR (2)     NOT NULL,
    [TypeName] VARCHAR (55) NULL,
    CONSTRAINT [PK_lnt_typeID] PRIMARY KEY CLUSTERED ([typeID] ASC) WITH (FILLFACTOR = 80)
);

