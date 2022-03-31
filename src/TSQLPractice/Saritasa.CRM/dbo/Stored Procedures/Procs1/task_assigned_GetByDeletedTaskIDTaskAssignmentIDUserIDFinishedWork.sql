
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_assigned table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_assigned_GetByDeletedTaskIDTaskAssignmentIDUserIDFinishedWork
(

	@Deleted datetime   ,

	@TaskID bigint   ,

	@TaskAssignmentID int   ,

	@UserID int   ,

	@FinishedWork datetime   
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
					[deleted] = @Deleted
					AND [taskID] = @TaskID
					AND [taskAssignmentID] = @TaskAssignmentID
					AND [userID] = @UserID
					AND [finishedWork] = @FinishedWork
				SELECT @@ROWCOUNT
					
			


