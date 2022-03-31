CREATE TABLE [dbo].[CalendarPersonal] (
    [clId]         BIGINT        IDENTITY (1, 1) NOT NULL,
    [UserId]       INT           NOT NULL,
    [Date]         DATETIME      NOT NULL,
    [Holiday]      BIT           NOT NULL,
    [Description]  VARCHAR (MAX) NULL,
    [Vacation]     BIT           CONSTRAINT [DF_calendarPersonal_vacation] DEFAULT ((0)) NOT NULL,
    [IsVacation]   TINYINT       CONSTRAINT [DF_calendarPersonal_isVacation] DEFAULT ((0)) NOT NULL,
    [SupervisedBy] INT           NULL,
    [IsSick]       BIT           CONSTRAINT [DF_calendarPersonal_isSick] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_calendarPersonal] PRIMARY KEY CLUSTERED ([clId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_calendarPersonal_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_calendarPersonal_date]
    ON [dbo].[CalendarPersonal]([Date] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_calendarPersonal_userID]
    ON [dbo].[CalendarPersonal]([UserId] ASC) WITH (FILLFACTOR = 80);

