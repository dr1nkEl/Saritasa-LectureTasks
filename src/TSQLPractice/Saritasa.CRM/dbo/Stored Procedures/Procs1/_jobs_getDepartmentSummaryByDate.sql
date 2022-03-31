
CREATE procedure [dbo].[_jobs_getDepartmentSummaryByDate]
(
    @fromDate datetime = null,
    @toDate datetime = null,
    @departmentID int = null 
)
as
begin
	select
		projects.projectID,
		projects.utilization,
		users.Id As userID,
		[LookupDepartments].[Id] As DepartmentId,
		sum(case when jobs.billable = 1 then jobs.duration else 0 end) as 'billable',
		sum(case when jobs.billable = 0 then jobs.duration else 0 end) as 'nonbillable',
		projects.title as 'projectName',
		users.FirstName as 'userFirstName',
		users.LastName as 'userLastName'
	from
		projects
		inner join jobs on projects.projectID = jobs.projectID
		inner join users on jobs.createdBy = users.Id
		inner join [LookupDepartments] on users.DepartmentId = [LookupDepartments].[Id]
	where
		jobs.jobDate between @fromDate and @toDate and
		((@departmentID is null) or (users.DepartmentId = @departmentID))
	group by
		projects.projectID, projects.utilization, users.Id, [LookupDepartments].[Id],
		projects.title, users.FirstName, users.LastName
	order by
		projects.projectID;
end;