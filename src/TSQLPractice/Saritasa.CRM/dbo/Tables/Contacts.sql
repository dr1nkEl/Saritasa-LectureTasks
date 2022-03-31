CREATE TABLE [dbo].[Contacts] (
    [contactID] INT           IDENTITY (1, 1) NOT NULL,
    [UserId]    INT           NOT NULL,
    [ClientId]  INT           NOT NULL,
    [Notes]     VARCHAR (MAX) NULL,
    CONSTRAINT [PK_contactID] PRIMARY KEY CLUSTERED ([contactID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_contact_clients_clientID] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([clientID]),
    CONSTRAINT [FK_contact_user_userID] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_contacts_userID]
    ON [dbo].[Contacts]([UserId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_contacts_clientID]
    ON [dbo].[Contacts]([ClientId] ASC) WITH (FILLFACTOR = 80);

