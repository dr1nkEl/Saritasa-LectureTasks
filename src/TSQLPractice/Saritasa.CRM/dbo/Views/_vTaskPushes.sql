

CREATE VIEW [dbo].[_vTaskPushes]
AS
select
	task_push.pushID,
	task_push.taskID,
	_vUsers.firstName as 'recipientFirstName',
	_vUsers.lastName as 'recipientLastName',
	task_push.initiatorID,
	task_push.recipientID,
	documents.createdBy,
	documents.generalStatusID,
	tasks.finishDate,
	tasks.projectID,
	projects.title as 'projectName',
	projects.documentID as 'projectDocId',
	tasks.documentID as 'taskDocId',
	tasks.title as 'taskName',
	lookup_document_statuses.statusName as 'taskStatusName',
	_vUsers.email as 'recipientEmail'
from
	task_push
	inner join tasks on task_push.taskID = tasks.taskID
	inner join documents on tasks.documentID = documents.documentID
	inner join projects on tasks.projectID = projects.projectID
	inner join lookup_document_statuses on documents.generalStatusID = lookup_document_statuses.statusId
	inner join _vUsers on task_push.recipientID = _vUsers.Id
where
	task_push.taskID = tasks.taskID and documents.generalStatusID in (select StatusId from getTaskStatusesForStatusFilter('Active'))