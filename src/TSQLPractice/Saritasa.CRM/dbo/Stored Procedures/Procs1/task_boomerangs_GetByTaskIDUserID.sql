
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_boomerangs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_boomerangs_GetByTaskIDUserID
(

	@TaskID bigint   ,

	@UserID int   
)
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
				WHERE
					[taskID] = @TaskID
					AND [userID] = @UserID
				SELECT @@ROWCOUNT
					
			


