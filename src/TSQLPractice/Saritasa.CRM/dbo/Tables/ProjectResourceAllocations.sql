CREATE TABLE [dbo].[ProjectResourceAllocations] (
    [Id]                       BIGINT   IDENTITY (1, 1) NOT NULL,
    [ProjectHoursAllocationId] INT      NOT NULL,
    [UserId]                   INT      NOT NULL,
    [Duration]                 INT      NOT NULL,
    [CreatedAt]                DATETIME NOT NULL,
    [CreatedById]              INT      NULL,
    [UpdatedAt]                DATETIME NULL,
    [UpdatedById]              INT      NULL,
    CONSTRAINT [PK_ProjectResourceAllocations] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ProjectResourceAllocations_ProjectHoursAllocations_Id] FOREIGN KEY ([ProjectHoursAllocationId]) REFERENCES [dbo].[ProjectHoursAllocations] ([Id]),
    CONSTRAINT [FK_ProjectResourceAllocations_users_userID] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ProjectResourceAllocations_users_userID_2] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ProjectResourceAllocations_users_userID_3] FOREIGN KEY ([UpdatedById]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IDX_ProjectResourceAllocations_ProjectHoursAllocationId]
    ON [dbo].[ProjectResourceAllocations]([ProjectHoursAllocationId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IDX_ProjectResourceAllocations_UserId]
    ON [dbo].[ProjectResourceAllocations]([UserId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_ProjectResourceAllocations_ProjectHoursAllocationIdUserId]
    ON [dbo].[ProjectResourceAllocations]([ProjectHoursAllocationId] ASC, [UserId] ASC) WITH (FILLFACTOR = 80);

