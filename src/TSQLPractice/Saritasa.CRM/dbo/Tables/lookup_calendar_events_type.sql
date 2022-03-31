CREATE TABLE [dbo].[lookup_calendar_events_type] (
    [typeID]   VARCHAR (3)   NOT NULL,
    [TypeName] VARCHAR (100) NULL,
    CONSTRAINT [PK_lcf_filterID] PRIMARY KEY CLUSTERED ([typeID] ASC) WITH (FILLFACTOR = 80)
);

