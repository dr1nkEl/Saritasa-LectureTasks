
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the task_assigned table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_assigned_Get_List

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
					
				SELECT @@ROWCOUNT
			


