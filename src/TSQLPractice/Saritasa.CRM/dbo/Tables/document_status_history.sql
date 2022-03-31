CREATE TABLE [dbo].[document_status_history] (
    [statusHistoryID] INT           IDENTITY (1, 1) NOT NULL,
    [DocumentId]      BIGINT        NOT NULL,
    [Created]         DATETIME      NULL,
    [CreatedBy]       INT           NOT NULL,
    [TrackId]         INT           NOT NULL,
    [StatusId]        INT           NOT NULL,
    [Comment]         VARCHAR (MAX) NULL,
    CONSTRAINT [PK_statusHistoryID] PRIMARY KEY CLUSTERED ([statusHistoryID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_dsh_document_documentID] FOREIGN KEY ([DocumentId]) REFERENCES [dbo].[Documents] ([documentID]),
    CONSTRAINT [FK_dsh_dt_trackID] FOREIGN KEY ([TrackId]) REFERENCES [dbo].[document_tracks] ([trackID]),
    CONSTRAINT [FK_dsh_lds_statusID] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[lookup_document_statuses] ([statusID]),
    CONSTRAINT [FK_dsh_user_createdBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_document_status_history_documentID]
    ON [dbo].[document_status_history]([DocumentId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_document_status_history_createdBy]
    ON [dbo].[document_status_history]([CreatedBy] ASC) WITH (FILLFACTOR = 80);


GO
CREATE STATISTICS [_dta_stat_2066106401_1_4]
    ON [dbo].[document_status_history]([statusHistoryID], [CreatedBy]);


GO
CREATE STATISTICS [_dta_stat_2066106401_1_2]
    ON [dbo].[document_status_history]([statusHistoryID], [DocumentId]);


GO
CREATE STATISTICS [_dta_stat_2066106401_2_1_4]
    ON [dbo].[document_status_history]([DocumentId], [statusHistoryID], [CreatedBy]);

