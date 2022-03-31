CREATE TABLE [dbo].[CalendarEvents] (
    [ceID]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [Date]       DATETIME      NOT NULL,
    [Text]       VARCHAR (MAX) NULL,
    [CreatedBy]  INT           NOT NULL,
    [DocumentId] BIGINT        NULL,
    [TypeId]     VARCHAR (3)   NOT NULL,
    [SenderList] VARCHAR (200) NULL,
    CONSTRAINT [PK_calendarID] PRIMARY KEY CLUSTERED ([ceID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_calendar_document_documentID] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_calendar_lcet_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[lookup_calendar_events_type] ([typeID]),
    CONSTRAINT [FK_calendar_user_createdBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_calendar_userID]
    ON [dbo].[CalendarEvents]([CreatedBy] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_calendar_documentID]
    ON [dbo].[CalendarEvents]([DocumentId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_calendar_date]
    ON [dbo].[CalendarEvents]([Date] ASC) WITH (FILLFACTOR = 80, ALLOW_PAGE_LOCKS = OFF);

