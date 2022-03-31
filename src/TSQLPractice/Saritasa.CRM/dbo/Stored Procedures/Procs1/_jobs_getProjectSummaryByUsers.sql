/*
 * Alters _jobs_getProjectSummaryByUsers procedure:
 * - return departmentID from project_resources if it is set;
 * - also return departmentName, specialization and workType fields;
 * - removes unused fields from result data set.
 */
CREATE PROCEDURE [dbo].[_jobs_getProjectSummaryByUsers]
(
    @FromDate datetime = null,
    @ToDate datetime = null,
    @ProjectId bigint = null 
)
AS
BEGIN
    set @fromDate = [dbo].[DateOnly](@fromDate);
    set @toDate = [dbo].[DateOnly](@toDate);

    select
        j.*,
        u.Id As userID,
        u.firstName,
        u.lastName,
        u.typeID,
        u.title,
        lookup_workTypes.DepartmentId,
        LookupDepartments.[Name] as 'DepartmentName',
        lookup_workTypes.title as 'ProjectWorkTypeName'
    from (
        select createdby,
            isnull(sum(case when billable = 1 then duration else 0 end), 0) billable,
            isnull(sum(duration), 0) duration
            from jobs j
        where 
            projectID = @projectID
            and jobDate between @fromDate and @toDate
        group by createdby
    ) j
    left join users u on createdby = u.Id
    left join ProjectResources pr on pr.userID = u.Id AND pr.projectID = @projectID
    left join lookup_workTypes on pr.WorkTypeId = lookup_workTypes.workTypeID
    left join LookupDepartments on lookup_workTypes.DepartmentId = LookupDepartments.Id
END