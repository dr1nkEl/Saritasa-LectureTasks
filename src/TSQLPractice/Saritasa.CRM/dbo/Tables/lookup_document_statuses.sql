CREATE TABLE [dbo].[lookup_document_statuses] (
    [statusID]   INT          IDENTITY (1, 1) NOT NULL,
    [ColorCode]  CHAR (6)     NULL,
    [StatusName] VARCHAR (60) NULL,
    [TrackId]    INT          NOT NULL,
    [OrderBy]    INT          NULL,
    CONSTRAINT [PK_lds_statusID] PRIMARY KEY CLUSTERED ([statusID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_lds_dt_trackID] FOREIGN KEY ([TrackId]) REFERENCES [dbo].[document_tracks] ([trackID])
);


GO
CREATE NONCLUSTERED INDEX [IX_lds_trackID]
    ON [dbo].[lookup_document_statuses]([TrackId] ASC) WITH (FILLFACTOR = 80);

