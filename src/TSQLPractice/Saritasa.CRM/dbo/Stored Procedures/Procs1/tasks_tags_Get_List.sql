
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the tasks_tags table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.tasks_tags_Get_List

AS


				
				SELECT
					[task_tagID],
					[tagID],
					[taskID]
				FROM
					[dbo].[tasks_tags]
					
				SELECT @@ROWCOUNT
			

