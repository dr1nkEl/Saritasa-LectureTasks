CREATE TABLE [dbo].[jobs_stat] (
    [jobStatID]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [Billable]                  DECIMAL (9, 2) NOT NULL,
    [Overbudget]                DECIMAL (9, 2) NOT NULL,
    [InHouse]                   DECIMAL (9, 2) NOT NULL,
    [Unutilized]                DECIMAL (9, 2) NOT NULL,
    [Admin]                     DECIMAL (9, 2) NOT NULL,
    [CapacityTotal]             DECIMAL (9, 2) NOT NULL,
    [CapacityBillable]          DECIMAL (9, 2) NOT NULL,
    [Utilization]               DECIMAL (9, 2) NOT NULL,
    [PeriodType]                CHAR (1)       NOT NULL,
    [BranchId]                  INT            NULL,
    [DepartmentId]              INT            NULL,
    [Date]                      DATETIME       NOT NULL,
    [CapacityTotalReal]         DECIMAL (9, 2) CONSTRAINT [DF_jobs_stat_capacityTotalReal] DEFAULT ((0)) NOT NULL,
    [CapacityBillableReal]      DECIMAL (9, 2) CONSTRAINT [DF_jobs_stat_capacityBillableReal] DEFAULT ((0)) NOT NULL,
    [CapacityBillableTodayReal] DECIMAL (9, 2) CONSTRAINT [DF_jobs_stat_capacityBillableTodayReal] DEFAULT ((0)) NOT NULL,
    [WorkTypeId]                INT            NULL,
    CONSTRAINT [PK_jobs_stat] PRIMARY KEY CLUSTERED ([jobStatID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_jobs_stat_lookup_branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[LookupBranch] ([Id]),
    CONSTRAINT [FK_jobs_stat_lookup_departments] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[LookupDepartments] ([Id]),
    CONSTRAINT [FK_jobs_stat_lookup_workType] FOREIGN KEY ([WorkTypeId]) REFERENCES [dbo].[lookup_workTypes] ([workTypeID])
);


GO
CREATE NONCLUSTERED INDEX [IX_branchID]
    ON [dbo].[jobs_stat]([BranchId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_departmentID]
    ON [dbo].[jobs_stat]([DepartmentId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_date]
    ON [dbo].[jobs_stat]([Date] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_1881526232_13_12_11_10]
    ON [dbo].[jobs_stat]([Date], [DepartmentId], [BranchId], [PeriodType]);

