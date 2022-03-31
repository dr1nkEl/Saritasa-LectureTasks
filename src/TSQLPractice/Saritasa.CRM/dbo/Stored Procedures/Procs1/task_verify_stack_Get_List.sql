
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the task_verify_stack table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_verify_stack_Get_List

AS


				
				SELECT
					[taskVerifyID],
					[taskID],
					[userID],
					[IsVerified]
				FROM
					[dbo].[task_verify_stack]
					
				SELECT @@ROWCOUNT
			


