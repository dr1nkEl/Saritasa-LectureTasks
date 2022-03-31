/*
 * Remove isBugFixing, externalDBID columns from jobs table
 */
CREATE VIEW [dbo].[_vJobsReport]
AS
SELECT
    job.jobID
    ,job.targetID
    ,job.duration
    ,job.description
    ,job.billable
    ,job.jobDate
    ,job.workType
    ,dbo.clients.clientID
    ,dbo.clients.name AS clientName
    ,dbo.projects.projectID
    ,dbo.projects.title AS projectName
    ,dbo.projects.billingType AS projectBillingType
    ,dbo.projects.Frequency AS projectFrequency
    ,dbo.projects.utilization AS projectUtilization
    ,dbo.projectPriority.name AS projectPriority
    ,dbo.projectPriority.color AS projectPriotityColor
    ,docJobTarget.name AS targName
    ,docJobTarget.typeID AS targDocTypeId
    ,docJobTarget.objectID AS targetObjectId
    ,(CASE 
        WHEN vTaskAssign.durationLimit IS NOT NULL AND (vTaskAssign.duration - vTaskAssign.durationLimit) > 0 THEN (vTaskAssign.duration - vTaskAssign.durationLimit)
        ELSE NULL END
    ) AS overtime
    ,job.isError
    ,job.errorBy
    ,job.errorReason
    ,vErrorUser.firstName + ' ' + vErrorUser.lastName AS errorCreatorName
    ,errorEmployee.photo AS errorCreatorPhoto
    ,vUsers.Id AS creatorID
    ,vUsers.fullName AS creatorName
    ,vUsers.email AS creatorEmail
    ,vUsers.utilization AS creatorUtilization
    ,ISNULL(dbo.employees.branchID, 0) AS creatorBrancID
    ,COALESCE(lwt.DepartmentId, vUsers.departmentID) departmentID
    ,_job.jobType
    ,job.JobType AS WorklogType
    ,creatorDoc.created AS creatorCreated
    ,vTaskAssign.duration AS creatorTaskDuration
    ,vTaskAssign.durationLimit AS creatorTaskLimit
    ,docJobTarget.generalStatusID AS taskStatusID
    ,Null As outsorserClientID
    ,Null As outsorserName
    ,dbo.projects.billable AS projectBillable
    ,pf.name AS featureName
    ,ps.name AS sprintName
FROM dbo._vJobsType AS _job
INNER JOIN dbo.jobs AS job ON _job.jobID = job.jobID
INNER JOIN dbo.clients ON job.clientID = dbo.clients.clientID
INNER JOIN dbo.projects ON job.projectID = dbo.projects.projectID
LEFT OUTER JOIN dbo.projectPriority ON dbo.projects.priorityID = dbo.projectPriority.priorityID
INNER JOIN dbo.documents AS docJobTarget ON job.targetID = docJobTarget.documentID
INNER JOIN dbo._vUsers AS vUsers ON job.createdBy = vUsers.Id
INNER JOIN dbo.documents AS creatorDoc ON creatorDoc.documentID = vUsers.documentID
LEFT OUTER JOIN dbo.employees ON dbo.employees.Id = vUsers.Id
LEFT OUTER JOIN dbo._vucTaskAssignedListWidget AS vTaskAssign ON vTaskAssign.taskID = docJobTarget.objectID
        AND docJobTarget.typeID = 'T'
        AND vTaskAssign.userID = job.createdBy
LEFT OUTER JOIN dbo._vUsers AS vErrorUser ON vErrorUser.Id = job.errorBy
LEFT OUTER JOIN dbo.employees AS errorEmployee ON errorEmployee.Id = job.errorBy
INNER JOIN dbo.tasks AS t ON job.targetID = t.documentID
LEFT OUTER JOIN dbo.project_features AS pf ON t.featureID = pf.ID
LEFT OUTER JOIN dbo.project_sprints AS ps ON t.sprintID = ps.ID
LEFT JOIN dbo.lookup_workTypes lwt ON lwt.workTypeID = job.WorkType;