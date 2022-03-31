CREATE TABLE [dbo].[lookup_task_types] (
    [typeID]   CHAR (2)     NOT NULL,
    [TypeName] VARCHAR (55) NULL,
    CONSTRAINT [PK_ltt_typeID] PRIMARY KEY CLUSTERED ([typeID] ASC) WITH (FILLFACTOR = 80)
);

