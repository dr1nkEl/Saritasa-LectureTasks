
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_assigned table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_assigned_GetByTaskIDUserIDTaskAssignmentIDFinishedWork
(

	@TaskID bigint   ,

	@UserID int   ,

	@TaskAssignmentID int   ,

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
					[taskID] = @TaskID
					AND [userID] = @UserID
					AND [taskAssignmentID] = @TaskAssignmentID
					AND [finishedWork] = @FinishedWork
				SELECT @@ROWCOUNT
					
			


