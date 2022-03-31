CREATE TABLE [dbo].[Addresses] (
    [addressID] INT           IDENTITY (1, 1) NOT NULL,
    [City]      VARCHAR (50)  NULL,
    [State]     VARCHAR (30)  NULL,
    [Country]   VARCHAR (30)  NULL,
    [Zip]       CHAR (10)     NULL,
    [TargetId]  BIGINT        NOT NULL,
    [TypeId]    CHAR (2)      NOT NULL,
    [Address]   VARCHAR (300) NULL,
    [Address2]  VARCHAR (300) NULL,
    CONSTRAINT [PK_addressID] PRIMARY KEY CLUSTERED ([addressID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_address_document_targetID] FOREIGN KEY ([TargetId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_address_lat_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[LookupAddressTypes] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_addresses_targetID]
    ON [dbo].[Addresses]([TargetId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_addresses_typeID]
    ON [dbo].[Addresses]([TypeId] ASC) WITH (FILLFACTOR = 80);

