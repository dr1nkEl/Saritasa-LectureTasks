CREATE VIEW dbo._vProjectResources
AS
select
    dbo.ProjectResources.Id,
    dbo.ProjectResources.UserId,
    dbo.ProjectResources.ProjectId,
    ProjectResources.WorkTypeId,
    dbo.lookup_workTypes.title as 'WorkTypeName',
    dbo.ProjectResources.CreatedAt,
    dbo.ProjectResources.CreatedByUserId,
    dbo.lookup_workTypes.DepartmentId as 'ProjectDepartmentId',
    dbo.[LookupDepartments].[Name] as 'ProjectDepartmentName',
    dbo._vUsers.firstName as 'FirstName',
    dbo._vUsers.lastName as 'LastName',
    dbo._vUsers.title as 'UserTitle',
    dbo._vUsers.fullName as 'UserFullName',
    dbo._vUsers.emailID as 'UserEmailId',
    dbo._vUsers.email as 'UserEmail',
    dbo._vUsers.documentID as 'UserDocumentId',
    dbo._vUsers.typeID as 'UserTypeId',
    dbo.projects.startDate as 'StartDate',
    dbo.projects.proposedFinishDate as 'ProposedFinishDate',
    dbo.projects.devSite as 'DevelopmentSite',
    dbo.projects.actualSite as 'ActualSite',
    dbo.projects.actualFinishDate as 'ActualFinishDate',
    dbo.projects.description as 'Description',
    dbo.projects.title as 'ProjectName',
    dbo.projects.parentProjectID as 'ParentProjectId',
    dbo.projects.notes as 'Notes',
    dbo.projects.documentID AS ProjectDocumentId,
    dbo.projects.clientID as 'ClientId',
    dbo._vUsers.birthday as 'UserBirthday',
    dbo._vUsers.timeZone as 'UserTimeZone',
    dbo.projects.billable as 'Billable',
    dbo.projects.durationLimit as 'DurationLimit',
    dbo._vUsers.generalStatusID as 'UserStatusId',
    CurrentMonthHours.duration as 'CurrentMonthJobsMinutes',
    PreviousMonthHours.duration as 'PreviousMonthJobsMinutes',
    dbo.ProjectResources.IsDedicated,
    dbo.ProjectResources.UpdatedAt,
    dbo.ProjectResources.UpdatedByUserId
from
    dbo.ProjectResources
    inner join dbo._vUsers on dbo.ProjectResources.userID = dbo._vUsers.Id
    inner join dbo.projects on dbo.ProjectResources.projectID = dbo.projects.projectID
    left join dbo.lookup_workTypes on ProjectResources.WorkTypeId = lookup_workTypes.workTypeID
    left join dbo.LookupDepartments on lookup_workTypes.DepartmentId = LookupDepartments.Id
    cross apply (
        Select  DateFromParts(Year(GetDate()), Month(GetDate()), 1) As CurrentMonthStart,
                Dateadd(d, -1, Dateadd(m, Datediff(m, 0, GetDate()) + 1, 0)) As CurrentMonthEnd,
                Dateadd(m, Datediff(m, 0, GetDate()) - 1, 0) As PreviousMonthStart,
                Dateadd(d, -1, Dateadd(m, Datediff(m, 0, GetDate()), 0)) As PreviousMonthEnd
    ) Dates
    cross apply (
        select isnull(sum(duration), 0) duration
        from jobs j
        where j.projectID = dbo.ProjectResources.ProjectId
        and j.createdBy = dbo.ProjectResources.UserId
        and jobDate between Dates.CurrentMonthStart and Dates.CurrentMonthEnd
        and duration is not null
    ) CurrentMonthHours
    cross apply (
        select isnull(sum(duration), 0) duration
        from jobs j
        where j.projectID = dbo.ProjectResources.ProjectId
        and j.createdBy = dbo.ProjectResources.UserId
        and jobDate between Dates.PreviousMonthStart and Dates.PreviousMonthEnd
        and duration is not null
    ) PreviousMonthHours