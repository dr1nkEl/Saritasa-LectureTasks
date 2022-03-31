CREATE TABLE [dbo].[ProjectHoursAllocations] (
    [Id]            INT      IDENTITY (1, 1) NOT NULL,
    [WorkTypeId]    INT      NOT NULL,
    [ProjectId]     INT      NOT NULL,
    [StartPeriodOn] DATE     NOT NULL,
    [Duration]      INT      NOT NULL,
    [CreatedAt]     DATETIME NOT NULL,
    [CreatedById]   INT      NOT NULL,
    [UpdatedAt]     DATETIME NULL,
    [UpdatedById]   INT      NULL,
    CONSTRAINT [PK_ProjectHoursAllocations] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_ProjectHoursAllocations_lookup_workTypes_workTypeID] FOREIGN KEY ([WorkTypeId]) REFERENCES [dbo].[lookup_workTypes] ([workTypeID]),
    CONSTRAINT [FK_ProjectHoursAllocations_projects_projectID] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID]),
    CONSTRAINT [FK_ProjectHoursAllocations_users_userID] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ProjectHoursAllocations_users_userID_2] FOREIGN KEY ([UpdatedById]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IDX_ProjectHoursAllocations_WorkTypeId]
    ON [dbo].[ProjectHoursAllocations]([WorkTypeId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IDX_ProjectHoursAllocations_ProjectId]
    ON [dbo].[ProjectHoursAllocations]([ProjectId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IDX_ProjectHoursAllocations_StartPeriodOn]
    ON [dbo].[ProjectHoursAllocations]([StartPeriodOn] ASC) WITH (FILLFACTOR = 80);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_ProjectHoursAllocations_WorkTypeIdProjectIdStartPeriodOn]
    ON [dbo].[ProjectHoursAllocations]([ProjectId] ASC, [WorkTypeId] ASC, [StartPeriodOn] ASC) WITH (FILLFACTOR = 80);

