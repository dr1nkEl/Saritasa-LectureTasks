/*
 * Added missed field createdby.
 */
CREATE VIEW [dbo].[_vJobsByClientAndProject]
AS
SELECT
    j.jobID as 'JobId',
    j.duration AS 'JobDuration',
    j.[description] as 'JobDescription',
    ISNULL(CAST(CEILING(CAST(j.duration AS DECIMAL(9, 2)) / 30) * 30 AS int),0) AS DurationWithJobRounding,
    ISNULL(CASE WHEN j.billable = 1 THEN duration ELSE 0 END, 0) AS DurationBillable,
    ISNULL(CAST(CEILING(CAST(CASE WHEN j.billable = 1 THEN duration ELSE 0 END AS DECIMAL(9, 2)) / 30) * 30 AS int), 0) AS BillableWithJobRounding,
    ISNULL(CASE WHEN j.billable = 0 THEN duration ELSE 0 END, 0) AS DurationNonBillable,
    ISNULL(CAST(CEILING(CAST(CASE WHEN j.billable = 0 THEN duration ELSE 0 END AS DECIMAL(9, 2)) / 30) * 30 AS int), 0) AS NonBillableWithJobRounding,
    j.JobDate AS 'JobDate',
    c.clientID AS ClientId,
    projects.projectID as 'ProjectId',
    projects.title as 'ProjectName',
    projects.documentID AS ProjectDocumentId,
    projects.minHoursPerMonth as ProjectMinHoursPerMonth,
    c.minHoursPerMonth as ClientMinHoursPerMonth,
    c.name AS ClientName,
    c.billableNote as 'BillableNote',
    c.billableType as ClientBillableType,
    LookupDepartments.Id as DepartmentId,
    LookupDepartments.Name as DepartmentName,
    c.documentID AS ClientDocumentID,
    projects.hasHosting as 'HasHosting',
    projects.hostingStart as 'HostingStart',
    projects.hostingFee as 'HostingFee',
    projects.hostingFrequency as 'HostingFrequency',
    projects.billingVariable as 'BillingVariable',
    projects.billingType as 'BillingType',
    projects.Frequency as 'ProjectFrequency',
    projects.priorityID as 'ProjectPriorityId',
    projects.utilization as 'ProjectUtilization',
    j.billable AS JobBillable,
    d.name AS TargetName,
    d.typeID AS TargetDocumentTypeId,
    d.objectID AS TargetObjectId,
    users.firstName + ' ' + users.lastName as UserFullName,
    users.typeID as UserTypeId,
    (CASE WHEN c.clientID NOT IN (2, 119, 9) AND projects.billingType IN ('F', 'H') AND projects.billable = 1 THEN 1 ELSE 0 END) as Paid,
    (CASE WHEN c.clientID IN (2, 119, 9)THEN 1 ELSE 0 END) as InHouse,
    (CASE WHEN c.clientID NOT IN (2, 119, 9) AND projects.billingType = 'I' THEN 1 ELSE 0 END) as InvestmentFree,
    (CASE WHEN c.clientID NOT IN (2, 119, 9) AND projects.billingType = 'F' AND j.billable = 0 and projects.overbudget = 1 THEN 1 ELSE 0 END) as Overbudget,
    (CASE WHEN c.clientID NOT IN (2, 119, 9) AND j.billable = 0 THEN 1 ELSE 0 END) as NonBillable,
    employees.BranchId as 'BranchId',
    j.WorkType as WorkTypeId,
    lookup_workTypes.title as 'WorkTypeName',
    j.createdBy As 'JobCreatedByUserId'
from jobs as j
    inner join Documents d ON d.documentID = j.targetID
    inner join Users ON Users.Id = j.createdBy
    inner join Employees ON Users.Id = employees.Id
    left join lookup_workTypes as lookup_workTypes on j.WorkType = lookup_workTypes.workTypeID
    inner join [LookupDepartments] ON [LookupDepartments].[Id] = lookup_workTypes.DepartmentId
    inner join projects ON j.projectID = projects.projectID
    inner join clients AS c ON j.clientID = c.clientID