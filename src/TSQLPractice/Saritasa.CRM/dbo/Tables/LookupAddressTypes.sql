CREATE TABLE [dbo].[LookupAddressTypes] (
    [Id]   CHAR (2)     NOT NULL,
    [Name] VARCHAR (55) NULL,
    CONSTRAINT [PK_lat_typeID] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80)
);

