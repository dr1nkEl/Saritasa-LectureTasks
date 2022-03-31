CREATE TABLE [dbo].[lookup_calc_types] (
    [typeID]      VARCHAR (20)  NOT NULL,
    [Description] VARCHAR (300) NOT NULL,
    CONSTRAINT [PK_typeID] PRIMARY KEY CLUSTERED ([typeID] ASC) WITH (FILLFACTOR = 80)
);

