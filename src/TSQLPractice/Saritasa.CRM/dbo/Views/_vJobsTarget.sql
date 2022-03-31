CREATE view _vJobsTarget
as
  SELECT
    c.clientID,
    c.name AS clientName,
    c.documentID AS clientDocID,
    p.projectID,
    p.title AS projName,
    p.documentID AS projDocID,
    j.jobID,
    j.billable,
    j.description,
    j.JobType,
    j.duration,
    j.targetID,
    j.createdBy,
    dbo.documents.name AS targName,
    dbo.documents.typeID AS targDocTypeId,
    dbo.documents.objectID AS targetobjectId,
    vu.Id As userID,
    vu.fullName,
    vu.documentID AS userDocID,
    j.JobDate AS date,
	j.JobDate AS JobDate,
    vu.birthday,
    vu.timeZone,
    t.taskID,
    t.targetID AS TaskTargetID,
    j.isError,
    j.errorBy,
    j.errorReason,
    e.Id as 'EmployeeId',
    p.hasHosting,
    p.hostingFee,
    p.hostingStart,
    p.hostingFrequency,
    lwt.workTypeID,
    lwt.title AS workTypeName,
    p.billable AS projectBillable,
    t.billable AS taskBillable,
    c.billable AS clientBillable,
    t.makeJobsBillable,
    lwt.departmentID AS DepartmentId,
    t.featureID,
    t.sprintID,
    pf.name AS featureName,
    ps.name AS sprintName,
    Cast(IsNull(pr.IsDedicated, 0) As bit) As DedicatedResource,
	(SELECT TOP 1 Tags.Title FROM Tags LEFT OUTER JOIN tasks_tags ON Tags.tagID = tasks_tags.TagId WHERE t.taskID = tasks_tags.TaskId) AS 'TaskTagName'
FROM dbo.jobs AS j LEFT OUTER JOIN
  dbo._vUsers AS vu ON j.createdBy = vu.Id LEFT OUTER JOIN
  dbo.documents ON j.targetID = dbo.documents.documentID LEFT OUTER JOIN
  dbo.clients AS c ON j.clientID = c.clientID LEFT OUTER JOIN
  dbo.projects AS p ON j.projectID = p.projectID LEFT OUTER JOIN
  dbo.tasks AS t ON t.documentID = j.targetID AND dbo.documents.typeID LIKE 'T%' LEFT OUTER JOIN
  dbo.employees AS e ON e.Id = vu.Id LEFT OUTER JOIN
  dbo.lookup_workTypes AS lwt ON lwt.workTypeID = j.workType LEFT OUTER JOIN
  dbo.project_features AS pf ON pf.ID = t.featureID LEFT OUTER JOIN
  dbo.project_sprints AS ps ON ps.ID = t.sprintID Left Outer Join
  dbo.ProjectResources pr On j.ProjectId = pr.ProjectId And j.CreatedBy = pr.UserId