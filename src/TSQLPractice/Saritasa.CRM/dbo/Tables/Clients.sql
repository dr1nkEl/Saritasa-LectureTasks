CREATE TABLE [dbo].[Clients] (
    [clientID]             INT           IDENTITY (1, 1) NOT NULL,
    [parentClientID]       INT           NULL,
    [Website]              VARCHAR (255) NULL,
    [Name]                 VARCHAR (200) NULL,
    [DocumentId]           BIGINT        NOT NULL,
    [Notes]                VARCHAR (MAX) NULL,
    [Billable]             BIT           CONSTRAINT [DF_clients_billable] DEFAULT ((1)) NOT NULL,
    [ContractTill]         DATETIME      NULL,
    [NotifiedContractTill] BIT           CONSTRAINT [DF_clients_notifiedContractTill] DEFAULT ((0)) NOT NULL,
    [MainContactUserId]    INT           NULL,
    [BillableType]         CHAR (1)      NULL,
    [BillableMethod]       CHAR (1)      NULL,
    [BillableNote]         VARCHAR (MAX) NULL,
    [MinHoursPerMonth]     INT           NULL,
    [ZohoAccountId]        BIGINT        NULL,
    [QbClientId]           BIGINT        NULL,
    CONSTRAINT [PK_clientID] PRIMARY KEY CLUSTERED ([clientID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_client_clients_parentClientID] FOREIGN KEY ([parentClientID]) REFERENCES [dbo].[Clients] ([clientID]),
    CONSTRAINT [FK_client_document_documentID] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_clients_contacts] FOREIGN KEY ([MainContactUserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_clients_parentClientID]
    ON [dbo].[Clients]([parentClientID] ASC) WITH (FILLFACTOR = 80);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_clients_documentID]
    ON [dbo].[Clients]([DocumentId] ASC) WITH (FILLFACTOR = 80);

