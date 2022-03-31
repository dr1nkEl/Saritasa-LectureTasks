
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_boomerangs table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_boomerangs_GetByBoomerangID
(

	@BoomerangID bigint   
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
					[boomerangID] = @BoomerangID
				SELECT @@ROWCOUNT
					
			


