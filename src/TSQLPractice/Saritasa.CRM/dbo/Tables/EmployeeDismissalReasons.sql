CREATE TABLE [dbo].[EmployeeDismissalReasons] (
    [Id]                INT IDENTITY (1, 1) NOT NULL,
    [EmployeeId]        INT NOT NULL,
    [DismissalReasonId] INT NOT NULL,
    CONSTRAINT [PK_EmployeeDismissalReasons_Id] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_EmployeeDismissalReasons_DismissalReasonId] FOREIGN KEY ([DismissalReasonId]) REFERENCES [dbo].[LookupDismissalReasons] ([Id]),
    CONSTRAINT [FK_EmployeeDismissalReasons_EmployeeId] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employees] ([Id])
);

