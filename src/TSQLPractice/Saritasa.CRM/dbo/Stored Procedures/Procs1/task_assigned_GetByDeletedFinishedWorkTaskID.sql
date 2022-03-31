
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_assigned table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_assigned_GetByDeletedFinishedWorkTaskID
(

	@Deleted datetime   ,

	@FinishedWork datetime   ,

	@TaskID bigint   
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
					AND [finishedWork] = @FinishedWork
					AND [taskID] = @TaskID
				SELECT @@ROWCOUNT
					
			


