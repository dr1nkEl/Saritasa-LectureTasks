CREATE TABLE [dbo].[task_departments] (
    [Id]           INT    IDENTITY (1, 1) NOT NULL,
    [DepartmentId] INT    NOT NULL,
    [TaskId]       BIGINT NOT NULL,
    CONSTRAINT [PK_task_departments] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_task_departments_lookup_departments] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[LookupDepartments] ([Id]),
    CONSTRAINT [FK_task_departments_tasks] FOREIGN KEY ([TaskId]) REFERENCES [dbo].[Tasks] ([taskID])
);

