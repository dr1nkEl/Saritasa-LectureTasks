CREATE TABLE [dbo].[document_tracks] (
    [trackID]     INT      IDENTITY (1, 1) NOT NULL,
    [TrackTypeId] CHAR (3) NOT NULL,
    [TypeId]      CHAR (3) NOT NULL,
    CONSTRAINT [PK_trackID] PRIMARY KEY CLUSTERED ([trackID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_dt_ldt_typeID] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[lookup_document_types] ([typeID]),
    CONSTRAINT [FK_dt_ltt_trackTypeID] FOREIGN KEY ([TrackTypeId]) REFERENCES [dbo].[lookup_track_types] ([trackTypeID])
);


GO
CREATE NONCLUSTERED INDEX [IX_document_tracks_trackTypeID]
    ON [dbo].[document_tracks]([TrackTypeId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_document_tracks_typeID]
    ON [dbo].[document_tracks]([TypeId] ASC) WITH (FILLFACTOR = 80);

