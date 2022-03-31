CREATE TABLE [dbo].[LookupDepartments] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50) NOT NULL,
    [Utilization] BIT          CONSTRAINT [DF_lookup_departments_utilization] DEFAULT ((1)) NOT NULL,
    [Deleted]     BIT          DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_lookup_departments] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 80)
);


GO

/*
 * On utilization change update users' utilizations.
 */
CREATE trigger tr_lookup_departments_update on dbo.[LookupDepartments]
after update
as
begin
    update users
    set users.utilization = inserted.[Utilization]
    from inserted
    inner join deleted on inserted.[Id] = deleted.[Id] and deleted.[Utilization] <> inserted.[Utilization]
    where users.DepartmentID = inserted.[Id]
end