CREATE TABLE [dbo].[client_managers] (
    [cmID]           INT      IDENTITY (1, 1) NOT NULL,
    [ClientId]       INT      NOT NULL,
    [RoleId]         CHAR (3) NOT NULL,
    [EmployeeUserId] INT      NOT NULL,
    CONSTRAINT [PK_cmID] PRIMARY KEY CLUSTERED ([cmID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_client_managers_clients] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([clientID]),
    CONSTRAINT [FK_cm_employees_employeeUserID] FOREIGN KEY ([EmployeeUserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_cm_lur_roleID] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[lookup_user_roles] ([roleID])
);


GO
CREATE NONCLUSTERED INDEX [IX_client_managers_employeeID]
    ON [dbo].[client_managers]([EmployeeUserId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_client_managers_roleID]
    ON [dbo].[client_managers]([RoleId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_cm_clientID]
    ON [dbo].[client_managers]([ClientId] ASC) WITH (FILLFACTOR = 80);

