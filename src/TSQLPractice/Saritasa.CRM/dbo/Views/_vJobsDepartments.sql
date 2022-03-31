CREATE VIEW [dbo].[_vJobsDepartments]
AS
SELECT dbo.jobs.projectID, dbo.[LookupDepartments].[Id] As DepartmentId, dbo.[LookupDepartments].[Name] AS departmentName, dbo.jobs.jobDate,
       SUM(ISNULL(dbo.jobs.duration, 0)) AS duration, SUM(CASE WHEN dbo.jobs.billable = 1 THEN ISNULL(dbo.jobs.duration, 0) ELSE 0 END) as billableDuration,
       SUM(CAST(CEILING(CAST(dbo.jobs.duration AS DECIMAL(9, 2)) / 30) * 30 AS int)) AS durationWithJobRounding,
       SUM(CAST(CEILING(CAST(CASE WHEN dbo.jobs.billable = 1 THEN duration ELSE 0 END AS DECIMAL(9, 2)) / 30) * 30 AS int)) AS billableWithJobRounding
FROM dbo.jobs INNER JOIN
     dbo.users ON dbo.users.Id = dbo.jobs.createdBy INNER JOIN
     dbo.[LookupDepartments] ON dbo.[LookupDepartments].[Id] = dbo.users.departmentID
GROUP BY dbo.jobs.projectID, dbo.[LookupDepartments].[Id],dbo.jobs.jobDate, dbo.[LookupDepartments].[Name]