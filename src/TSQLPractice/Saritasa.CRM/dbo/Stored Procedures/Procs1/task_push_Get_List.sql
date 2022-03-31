
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the task_push table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_push_Get_List

AS


				
				SELECT
					[pushID],
					[taskID],
					[initiatorID],
					[recipientID],
					[created],
					[comment]
				FROM
					[dbo].[task_push]
					
				SELECT @@ROWCOUNT
			


