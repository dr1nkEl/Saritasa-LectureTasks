CREATE TABLE [dbo].[ProjectHoursAllocationsNotes] (
    [Id]                        INT           IDENTITY (1, 1) NOT NULL,
    [ProjectHoursAllocationsId] INT           NOT NULL,
    [Note]                      VARCHAR (MAX) NOT NULL,
    [IsUrgent]                  BIT           DEFAULT ((0)) NOT NULL,
    [CreatedByUserId]           INT           NOT NULL,
    [UpdatedByUserId]           INT           NULL,
    [UpdatedAt]                 DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ProjectHoursAllocationsNotes_ProjectHoursAllocations] FOREIGN KEY ([ProjectHoursAllocationsId]) REFERENCES [dbo].[ProjectHoursAllocations] ([Id]),
    CONSTRAINT [FK_ProjectHoursAllocationsNotes_Users_CreatedByUserId] FOREIGN KEY ([CreatedByUserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ProjectHoursAllocationsNotes_Users_UpdatedByUserId] FOREIGN KEY ([UpdatedByUserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ProjectHoursAllocationsNotes_ProjectHoursAllocationsId]
    ON [dbo].[ProjectHoursAllocationsNotes]([ProjectHoursAllocationsId] ASC) WITH (FILLFACTOR = 80);

