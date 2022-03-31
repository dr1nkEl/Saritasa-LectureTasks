
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_assigned table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_assigned_GetByTaskAssignmentID
(

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
					[taskAssignmentID] = @TaskAssignmentID
				SELECT @@ROWCOUNT
					
			


