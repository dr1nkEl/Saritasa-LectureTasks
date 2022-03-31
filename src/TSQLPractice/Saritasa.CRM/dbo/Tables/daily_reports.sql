CREATE TABLE [dbo].[daily_reports] (
    [dailyReportID]   INT           IDENTITY (1, 1) NOT NULL,
    [DocumentId]      BIGINT        NOT NULL,
    [UserId]          INT           NOT NULL,
    [DateCreated]     DATETIME      NOT NULL,
    [ReportDate]      DATETIME      NOT NULL,
    [ReportText]      VARCHAR (MAX) NULL,
    [QuestionsText]   VARCHAR (MAX) NULL,
    [CalendarEventId] BIGINT        NULL,
    CONSTRAINT [PK_daily_reports] PRIMARY KEY CLUSTERED ([dailyReportID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_daily_reports_documents] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_daily_reports_users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_daily_reports_7_143495740__K5_3]
    ON [dbo].[daily_reports]([ReportDate] ASC)
    INCLUDE([UserId]) WITH (FILLFACTOR = 80);

