CREATE TABLE [dbo].[lookup_phone_types] (
    [typeID]   CHAR (3)     NOT NULL,
    [TypeName] VARCHAR (55) NULL,
    CONSTRAINT [PK_lpt_typeID] PRIMARY KEY CLUSTERED ([typeID] ASC) WITH (FILLFACTOR = 80)
);

