CREATE TABLE [dbo].[lookup_workTypes] (
    [workTypeID]   INT          IDENTITY (1, 1) NOT NULL,
    [Title]        VARCHAR (80) NOT NULL,
    [ParentId]     INT          NULL,
    [DepartmentId] INT          NULL,
    [Deleted]      BIT          DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_lookup_workTypes] PRIMARY KEY CLUSTERED ([workTypeID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_lookup_workTypes_lookup_departments] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[LookupDepartments] ([Id]),
    CONSTRAINT [FK_lookup_workTypes_lookup_workTypes] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[lookup_workTypes] ([workTypeID])
);

