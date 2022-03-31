CREATE TABLE [dbo].[lookup_email_types] (
    [typeID]   CHAR (2)     NOT NULL,
    [TypeName] VARCHAR (55) NULL,
    CONSTRAINT [PK_let_typeID] PRIMARY KEY CLUSTERED ([typeID] ASC) WITH (FILLFACTOR = 80)
);

