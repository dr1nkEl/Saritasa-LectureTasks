
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the tasks_tags table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.tasks_tags_GetByTagID
(

	@TagID bigint   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[task_tagID],
					[tagID],
					[taskID]
				FROM
					[dbo].[tasks_tags]
				WHERE
					[tagID] = @TagID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			

