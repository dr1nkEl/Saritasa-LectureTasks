CREATE TABLE [dbo].[CalendarPersonalPeriods] (
    [periodID]   INT      IDENTITY (1, 1) NOT NULL,
    [UserId]     INT      NOT NULL,
    [FileId]     INT      NULL,
    [Confirmed]  BIT      NULL,
    [Type]       INT      NOT NULL,
    [ApprovedBy] INT      NULL,
    [StartDate]  DATETIME NOT NULL,
    [EndDate]    DATETIME NOT NULL,
    [ApprovedAt] DATETIME NULL,
    [PaidAt]     DATETIME NULL,
    [ActualDays] INT      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_CalendarPersonalPeriods] PRIMARY KEY CLUSTERED ([periodID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_CalendarPersonalPeriods_files] FOREIGN KEY ([FileId]) REFERENCES [dbo].[Files] ([fileID]),
    CONSTRAINT [FK_CalendarPersonalPeriods_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_CalendarPersonalPeriods_usersApproved] FOREIGN KEY ([ApprovedBy]) REFERENCES [dbo].[Users] ([Id])
);

