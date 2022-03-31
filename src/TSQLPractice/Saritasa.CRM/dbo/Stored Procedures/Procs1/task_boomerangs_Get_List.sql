
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the task_boomerangs table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_boomerangs_Get_List

AS


				
				SELECT
					[boomerangID],
					[taskID],
					[userID],
					[type],
					[fireTime],
					[isFired]
				FROM
					[dbo].[task_boomerangs]
					
				SELECT @@ROWCOUNT
			


