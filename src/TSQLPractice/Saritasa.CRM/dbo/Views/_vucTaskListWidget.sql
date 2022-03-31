/*
 * Remove task_links table.
 */
CREATE VIEW [dbo].[_vucTaskListWidget]
AS
SELECT
    _vTasksDocuments.documentID,
    _vTasksDocuments.taskPriority,
    _vTasksDocuments.created,
    _vTasksDocuments.deleted,
    _vTasksDocuments.lastestReestimationId,
    _vTasksDocuments.lastestReestimationLimitType,
    _vTasksDocuments.lastestReestimationDueDateType,
    _vTasksDocuments.lastestReestimationLimit,
    _vTasksDocuments.lastestReestimationDueDate,
    _vTasksDocuments.lastestReestimationStatus,
    _vTasksDocuments.lastestReestimationUserId,
    _vTasksDocuments.createdBy,
    _vTasksDocuments.taskID,
    crUsers.firstName + ' ' + crUsers.lastName AS CreateFullName,
    _vTasksDocuments.statusName,
    _vTasksDocuments.colorCode,
    _vTasksDocuments.[priority],
    _vTasksDocuments.title,
    targDoc.name AS targName,
    targDoc.typeID AS targDocTypeID,
    targDoc.generalStatusID AS targGenStatuc,
    crUsers.lastName AS createrLastName,
    crUsers.firstName AS createrFirstName,
    crUsers.firstName + ' ' + crUsers.lastName AS createrFillName,
    null as 'svLastName',
    null as 'svFirstName',
    null as 'svFillName',
    crUsers.typeID AS createrUserTypeID,
    null as 'svUserTypeID',
    _vTasksDocuments.trackType,
    CASE WHEN _vTasksDocuments.finishDate IS NULL 
        THEN 'false' WHEN _vTasksDocuments.finishDate < dateadd(dd, 0, datediff(dd, 0, getdate())) 
        THEN 'true'
        ELSE 'false'
    END AS Overdue, 
    _vTasksDocuments.taskText,
    _vTasksDocuments.finishDate,
    null as 'svDocID',
    crUsers.documentID AS CreaterDocID,
    _vTasksDocuments.startDate,
    _vTasksDocuments.taskPushDate as 'datePushed',
    targDoc.objectID AS targetObjectID,
    _vTasksDocuments.targetID AS TargDocId,
    _vTasksDocuments.updated,
    cast((CASE WHEN (_vTasksDocuments.durationLimit != 0)
        THEN (isnull(_vTasksDocuments.durationLimit, 0))
        ELSE NULL
    END) AS varchar) AS durationLimit,
    _vTasksDocuments.generalStatusID,
    _vTasksDocuments.billable,
    _vTasksDocuments.clientID,
    _vTasksDocuments.projectID,
    pDoc.documentID AS projDocID,
    _vTasksDocuments.menHours,
    null as 'locationName',
    null as 'locationUrl',
    _vTasksDocuments.projectName,
    _vTasksDocuments.testerID,
    _vTasksDocuments.isContainer,
    null as 'statusChanged', -- dsh.statusChanged, -- IVAN ??
    isnull(_vTasksDocuments.durationLimit, 0) AS taskLimit,
    0 as 'subTaskLimit',
    null as 'skype',
    null as 'email',
    e.photo AS createrPhoto,
    _vTasksDocuments.typeID AS TaskTypeID,
    devUser.Id AS developerUserID,
    null as 'developerPhone',
    null as 'developerEmail',
    de.photo AS developerPhoto,
    0 as subTasksLimitOrTaskLimit,
    _vTasksDocuments.technicalManagerID,
    CASE WHEN isnull(_vTasksDocuments.durationLimit, 0) > 0 AND 
            _vTasksDocuments.menHours - isnull(_vTasksDocuments.durationLimit, 0) > 0
        THEN CONVERT(DECIMAL(10, 2), (CONVERT(DECIMAL(10, 2), _vTasksDocuments.menHours) / (isnull(_vTasksDocuments.durationLimit, 0)) - 1) * 100) 
    ELSE 0 END AS overtime,
    _vTasksDocuments.sprintID,
    _vTasksDocuments.featureID
FROM
    _vTasksDocuments
    left join documents AS targDoc ON _vTasksDocuments.targetID = targDoc.documentID
    left join users AS crUsers ON _vTasksDocuments.createdBy = crUsers.Id
    left join employees AS e ON crUsers.Id = e.Id
    left join users AS devUser ON _vTasksDocuments.ownerID = devUser.Id
    left join employees AS de ON devUser.Id = de.Id
    left join projects AS proj ON _vTasksDocuments.projectID = proj.projectID
    left join documents AS pDoc ON proj.documentID = pDoc.documentID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'_vucTaskListWidget';

