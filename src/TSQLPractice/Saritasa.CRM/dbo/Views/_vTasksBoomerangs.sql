/*
 * Remove superviserUserID column from tasks table.
 */ 
CREATE VIEW dbo._vTasksBoomerangs
AS
SELECT dbo.tasks.taskID, dbo.tasks.typeID, dbo.tasks.documentID, dbo.tasks.targetID, dbo.documents.created, 
	dbo.documents.updated, dbo.documents.deleted, dbo.documents.generalStatusID, dbo.documents.createdBy,
	dbo.documents.name, dbo.documents.updatedBy, dbo.lookup_document_statuses.statusName,
	dbo.tasks.title, dbo.tasks.finishDate, dbo.tasks.startDate,
	dbo.tasks.billable, dbo.tasks.clientID, dbo.tasks.projectID, 
	dbo.tasks.durationLimit, dbo.tasks.isContainer,
	dbo.task_boomerangs.boomerangID, dbo.task_boomerangs.userID, dbo.task_boomerangs.[type], dbo.task_boomerangs.fireTime,
	dbo.task_boomerangs.isFired,
	dbo.users.timeZone, dbo.users.timeZoneCode, dbo.users.firstName, dbo.users.lastName
FROM
	dbo.task_boomerangs
	inner join dbo.tasks on dbo.task_boomerangs.taskID = dbo.tasks.taskID
	inner join dbo.documents on dbo.documents.documentID = dbo.tasks.documentID
	inner join dbo.projects on dbo.projects.projectID = dbo.tasks.projectID
	inner join dbo.lookup_document_statuses on dbo.lookup_document_statuses.statusID = dbo.documents.generalStatusID
	inner join dbo.users on dbo.task_boomerangs.userID = dbo.users.Id