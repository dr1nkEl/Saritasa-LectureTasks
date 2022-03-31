
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_assigned table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_assigned_GetByUserIDDeletedFinishedWorkTaskIDTaskAssignmentID
(

	@UserID int   ,

	@Deleted datetime   ,

	@FinishedWork datetime   ,

	@TaskID bigint   ,

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
					[userID] = @UserID
					AND [deleted] = @Deleted
					AND [finishedWork] = @FinishedWork
					AND [taskID] = @TaskID
					AND [taskAssignmentID] = @TaskAssignmentID
				SELECT @@ROWCOUNT
					
			


