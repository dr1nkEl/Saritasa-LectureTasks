CREATE TABLE [dbo].[lookup_project_requisite_types] (
    [requisiteID] INT           IDENTITY (1, 1) NOT NULL,
    [Requisite]   VARCHAR (100) NULL,
    [OrderBy]     INT           NOT NULL,
    CONSTRAINT [PK_lprt_requisiteID] PRIMARY KEY CLUSTERED ([requisiteID] ASC) WITH (FILLFACTOR = 80)
);

