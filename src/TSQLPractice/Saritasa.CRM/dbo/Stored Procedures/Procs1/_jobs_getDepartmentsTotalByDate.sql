CREATE procedure [dbo].[_jobs_getDepartmentsTotalByDate]
(
	@fromDate datetime = null,
    @toDate datetime = null
)
as
begin
	select
		[LookupDepartments].[Id] As DepartmentId,
		[LookupDepartments].[Name],
		sum(case when jobs.billable = 1 then jobs.duration else 0 end) as 'billable',
		sum(case when jobs.billable = 0 then jobs.duration else 0 end) as 'nonbillable'
	from
		jobs
		inner join users on jobs.createdBy = users.Id
		inner join [LookupDepartments] on users.DepartmentId = [LookupDepartments].[Id]
	where
		jobs.jobDate between @fromDate and @toDate
	group by
		[LookupDepartments].[Id], [LookupDepartments].[Name]
end;