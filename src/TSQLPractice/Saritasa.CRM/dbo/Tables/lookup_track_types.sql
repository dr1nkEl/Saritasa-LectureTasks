CREATE TABLE [dbo].[lookup_track_types] (
    [trackTypeID] CHAR (3)      NOT NULL,
    [TrackType]   VARCHAR (100) NULL,
    CONSTRAINT [PK_ltt_trackTypeID] PRIMARY KEY CLUSTERED ([trackTypeID] ASC) WITH (FILLFACTOR = 80)
);

