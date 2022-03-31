--Get total billable and non-billable hours spent on projects by period. Order by billable hours (highest first).
--Do not show projects that did not have jobs for a specified period.

CREATE PROCEDURE [dbo].[__ProjectsReportByPeriod]
	@startDate DATE,
	@endDate DATE
AS
BEGIN
	SELECT Projects.projectID AS 'ProjectId',
    Projects.Title AS 'ProjectName',
    pms.Names AS PMs,
    billableJobs.DurationHours AS 'BillableHours',
    nonBillableJobs.DurationHours AS 'Nonbillable hours',
    Clients.Name as 'ClientName',
    Projects.LimitHistory as 'Limit'

    FROM Projects

    JOIN Clients
    ON Projects.ClientId = Clients.clientID

    JOIN(SELECT SUM(Jobs.Duration)/60 AS DurationHours, Jobs.ProjectId
        FROM Jobs
        WHERE Jobs.JobDate < @endDate AND Jobs.JobDate > @startDate AND Jobs.Billable = 1
        GROUP BY Jobs.ProjectId
    ) billableJobs ON billableJobs.ProjectId = Projects.projectID

    JOIN(SELECT SUM(Jobs.Duration)/60 AS DurationHours, Jobs.ProjectId
          FROM Jobs
          WHERE Jobs.JobDate < @endDate AND Jobs.JobDate > @startDate AND Jobs.Billable = 0
          GROUP BY Jobs.ProjectId) nonBillableJobs ON nonBillableJobs.ProjectId = Projects.projectID

    JOIN(SELECT allProjects.projectID, (SELECT CONCAT(Users.FirstName, ' ', Users.LastName, ',')
        FROM Users
        JOIN project_managers
        ON project_managers.ProjectId = allProjects.projectID
        WHERE project_managers.RoleId='PM' AND Users.Id = project_managers.UserId
        FOR XML PATH('')) as Names
        FROM Projects allProjects) pms ON pms.projectID = Projects.projectID

    WHERE billableJobs.DurationHours IS NOT NULL
    OR nonBillableJobs.DurationHours IS NOT NULL;
END
