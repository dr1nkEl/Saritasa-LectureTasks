CREATE TABLE [dbo].[UserStatistic] (
    [Id]               INT        IDENTITY (1, 1) NOT NULL,
    [UserId]           INT        NOT NULL,
    [DepartmentId]     INT        NOT NULL,
    [IsUtilized]       BIT        NOT NULL,
    [Utilization]      TINYINT    NOT NULL,
    [WorktypeId]       INT        NOT NULL,
    [OnSite]           BIT        NOT NULL,
    [BranchId]         INT        NOT NULL,
    [IsBranchHoliday]  BIT        NULL,
    [IsHoliday]        BIT        NULL,
    [Date]             DATE       NOT NULL,
    [BillableCapacity] FLOAT (53) NOT NULL,
    [TotalCapacity]    FLOAT (53) DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_UserStatistic_LookupBranch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[LookupBranch] ([Id]),
    CONSTRAINT [FK_UserStatistic_Tolookup_LookupDepartments] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[LookupDepartments] ([Id]),
    CONSTRAINT [FK_UserStatistic_Tolookup_workTypes] FOREIGN KEY ([WorktypeId]) REFERENCES [dbo].[lookup_workTypes] ([workTypeID]),
    CONSTRAINT [FK_UserStatistic_ToUsers] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserStatistic_User_Date]
    ON [dbo].[UserStatistic]([UserId] ASC, [Date] ASC) WITH (FILLFACTOR = 80);

