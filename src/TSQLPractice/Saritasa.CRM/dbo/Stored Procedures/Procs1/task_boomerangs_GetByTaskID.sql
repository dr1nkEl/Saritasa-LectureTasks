
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_boomerangs table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_boomerangs_GetByTaskID
(

	@TaskID bigint   
)
AS


				SET ANSI_NULLS OFF
				
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
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


