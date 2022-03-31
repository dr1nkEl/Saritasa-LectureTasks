
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the tasks_tags table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.tasks_tags_GetByTask_tagID
(

	@Task_tagID bigint   
)
AS


				SELECT
					[task_tagID],
					[tagID],
					[taskID]
				FROM
					[dbo].[tasks_tags]
				WHERE
					[task_tagID] = @Task_tagID
				SELECT @@ROWCOUNT
					
			

