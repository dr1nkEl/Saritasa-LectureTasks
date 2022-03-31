/*
/	Richard Popov
/
/	Create View
*/
CREATE VIEW [dbo].[_vTaskLastPushes]

AS

select 
	_vTaskPushes.pushId,
	_vTaskPushes.taskId,
	_vTaskPushes.createdBy, 
	_vTaskPushes.recipientId, 
	_vTaskPushes.recipientFirstName + ' ' + _vTaskPushes.recipientLastName as 'recipientFullName'
		
from _vTaskPushes, (select max(pushId) as 'maxPushId', taskId from _vTaskPushes group by taskId) maxPushResult

where _vTaskPushes.taskId = maxPushResult.taskId
and _vTaskPushes.PushId = maxPushResult.maxPushId
and _vTaskPushes.generalStatusID in (select StatusId from getTaskStatusesForStatusFilter('Active'))