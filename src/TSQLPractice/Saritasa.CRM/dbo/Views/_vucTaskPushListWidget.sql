
/*
*	drop columns isBugFixing, addTimeLimit
*/

CREATE VIEW [dbo].[_vucTaskPushListWidget]
AS
	select
		task_push.pushID,
		task_push.taskID,
		task_push.initiatorID,
		task_push.recipientID,
		task_push.created,
		task_push.comment,
		[initiator].firstName as 'initiatorFirstName',
		[initiator].lastName as 'initiatorLastName',
		recipient.firstName as 'recipientFirstName',
		recipient.lastName as 'recipientLastName',
		[initiator].departmentID as 'initiatorDepartmentID',
		recipient.departmentID as 'recipientDepartmentID',
		(case when initiatorTestRole.roleID is null then 0 else 1 end) as 'IsInitiatorTester',
		(case when recipientTestRole.roleID is null then 0 else 1 end) as 'IsRecipientTester'
	from
		task_push
		inner join users as [initiator] on task_push.initiatorID = [initiator].Id
		inner join users as recipient on task_push.recipientID = recipient.Id
		left join user_roles as initiatorTestRole on [initiator].Id = initiatorTestRole.userID and initiatorTestRole.roleID = 'TM '
		left join user_roles as recipientTestRole on recipient.Id = recipientTestRole.userID and recipientTestRole.roleID = 'TM '
