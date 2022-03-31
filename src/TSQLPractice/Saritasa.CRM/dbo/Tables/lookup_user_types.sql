CREATE TABLE [dbo].[lookup_user_types] (
    [typeID]   CHAR (2)     NOT NULL,
    [TypeName] VARCHAR (45) NULL,
    CONSTRAINT [PK_lut_typeID] PRIMARY KEY CLUSTERED ([typeID] ASC) WITH (FILLFACTOR = 80)
);

