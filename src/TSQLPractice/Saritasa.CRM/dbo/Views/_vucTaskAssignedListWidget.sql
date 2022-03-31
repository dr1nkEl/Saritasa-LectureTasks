/*
 * Employees related tables update.
 */

CREATE view dbo._vucTaskAssignedListWidget
as
SELECT
    dbo.task_assigned.taskAssignmentID,
    dbo.task_assigned.assigned,
    dbo.task_assigned.taskID,
    dbo.task_assigned.userID,
    dbo.task_assigned.assignedBy,
    dbo._vUsers.FirstName as FirstName,
    dbo._vUsers.FullName as FullName,
    dbo._vUsers.LastName as LastName,
    dbo._vUsers.Email,
    assingedBy.email AS AssignerEmail,
    assingedBy.firstName AS AssignerFirstName,
    assingedBy.lastName AS AssignerLastName,
    assingedBy.fullName AS AssignerFullName,
    dbo._vUsers.documentID AS UserDocID,
    assingedBy.documentID AS AssignDocID,
    dbo.task_assigned.accepted,
    dbo.task_assigned.startedWork,
    dbo.task_assigned.startedWork AS started,
    dbo.task_assigned.finishedWork,
    ISNULL(j.duration, 0) AS duration,
    dbo.task_assigned.durationLimit,
    dbo._vucTaskListWidget.taskLimit,
    dbo._vucTaskListWidget.subTaskLimit,
    dbo._vucTaskListWidget.menHours,
    dbo.task_assigned.madeother,
    dbo.task_assigned.isBugFixing,
    e.Id as 'EmployeeId'
FROM         dbo.task_assigned INNER JOIN
                      dbo._vUsers ON dbo.task_assigned.userID = dbo._vUsers.Id INNER JOIN
                      dbo._vucTaskListWidget ON dbo.task_assigned.taskID = dbo._vucTaskListWidget.taskID INNER JOIN
                      dbo._vUsers AS assingedBy ON dbo.task_assigned.assignedBy = assingedBy.Id LEFT OUTER JOIN
                      dbo.employees AS e ON dbo.task_assigned.userID = e.Id LEFT OUTER JOIN
                      dbo.tasks AS t ON t.taskID = dbo.task_assigned.taskID 
                      LEFT OUTER JOIN
                          (SELECT     targetID, createdBy, SUM(duration) AS duration
                            FROM          dbo.jobs
                            WHERE      (duration IS NOT NULL)
                            GROUP BY targetID, createdBy) AS j ON j.targetID = t.documentID AND j.createdBy = dbo.task_assigned.userID
WHERE     (dbo.task_assigned.deleted IS NULL)