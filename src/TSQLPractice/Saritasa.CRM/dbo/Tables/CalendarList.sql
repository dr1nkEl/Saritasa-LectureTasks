CREATE TABLE [dbo].[CalendarList] (
    [cID]      INT      IDENTITY (1, 1) NOT NULL,
    [Date]     DATETIME NOT NULL,
    [BranchId] INT      CONSTRAINT [DF_calendarList_branch] DEFAULT ((1)) NOT NULL,
    [Holiday]  BIT      NULL,
    CONSTRAINT [PK_calendarList] PRIMARY KEY CLUSTERED ([cID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_calendarList_lookup_branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[LookupBranch] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_cl_date]
    ON [dbo].[CalendarList]([Date] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_1845334084_3_1]
    ON [dbo].[CalendarList]([BranchId], [cID]);


GO
CREATE STATISTICS [_dta_stat_1845334084_1_4]
    ON [dbo].[CalendarList]([cID], [Holiday]);


GO
CREATE STATISTICS [_dta_stat_1845334084_2_4_1]
    ON [dbo].[CalendarList]([Date], [Holiday], [cID]);


GO
CREATE STATISTICS [_dta_stat_1845334084_2_4_3]
    ON [dbo].[CalendarList]([Date], [Holiday], [BranchId]);


GO
CREATE STATISTICS [_dta_stat_1845334084_4_3_1]
    ON [dbo].[CalendarList]([Holiday], [BranchId], [cID]);


GO
CREATE STATISTICS [_dta_stat_1845334084_1_2_3_4]
    ON [dbo].[CalendarList]([cID], [Date], [BranchId], [Holiday]);

