
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_assigned table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_assigned_GetByTaskIDUserIDDeletedFinishedWorkTaskAssignmentID
(

	@TaskID bigint   ,

	@UserID int   ,

	@Deleted datetime   ,

	@FinishedWork datetime   ,

	@TaskAssignmentID int   
)
AS


				SELECT
					[taskAssignmentID],
					[assigned],
					[accepted],
					[startedWork],
					[taskID],
					[userID],
					[assignedBy],
					[finishedWork],
					[deleted],
					[durationLimit],
					[madeother],
					[isBugFixing],
					[externalID],
					[externalDBID],
					[isExternalCopy]
				FROM
					[dbo].[task_assigned]
				WHERE
					[taskID] = @TaskID
					AND [userID] = @UserID
					AND [deleted] = @Deleted
					AND [finishedWork] = @FinishedWork
					AND [taskAssignmentID] = @TaskAssignmentID
				SELECT @@ROWCOUNT
					
			


