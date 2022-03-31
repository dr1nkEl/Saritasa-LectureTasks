CREATE TABLE [dbo].[ProjectWorkAllocation] (
    [workAllocationID] INT           IDENTITY (1, 1) NOT NULL,
    [ProjectId]        INT           NOT NULL,
    [WorkTypeId]       INT           NOT NULL,
    [StartDate]        DATETIME      NOT NULL,
    [FinishDate]       DATETIME      NOT NULL,
    [Hours]            INT           NOT NULL,
    [RepeatNextMonth]  BIT           CONSTRAINT [DF_projectWorkAllocation_repeatNextMonth] DEFAULT ((0)) NOT NULL,
    [MonthSelect]      BIT           CONSTRAINT [DF_projectWorkAllocation_monthSelect] DEFAULT ((0)) NOT NULL,
    [Description]      VARCHAR (MAX) NULL,
    [CreatedBy]        INT           DEFAULT ((0)) NULL,
    [CreatedTime]      DATETIME      DEFAULT ((0)) NULL,
    [ModifiedBy]       INT           DEFAULT ((0)) NULL,
    [ModifiedTime]     DATETIME      DEFAULT ((0)) NULL,
    [RealisticHours]   INT           DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_projectWorkAllocation] PRIMARY KEY CLUSTERED ([workAllocationID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_projectWorkAllocation_lookup_workTypes] FOREIGN KEY ([WorkTypeId]) REFERENCES [dbo].[lookup_workTypes] ([workTypeID]),
    CONSTRAINT [FK_projectWorkAllocation_projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([projectID]),
    CONSTRAINT [FK_projectWorkAllocation_users] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_projectWorkAllocation_users1] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_ProjectWorkAllocation_FinishDate]
    ON [dbo].[ProjectWorkAllocation]([FinishDate] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_ProjectWorkAllocation_ProjectId]
    ON [dbo].[ProjectWorkAllocation]([ProjectId] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_ProjectWorkAllocation_StartDate]
    ON [dbo].[ProjectWorkAllocation]([StartDate] ASC) WITH (FILLFACTOR = 80);

