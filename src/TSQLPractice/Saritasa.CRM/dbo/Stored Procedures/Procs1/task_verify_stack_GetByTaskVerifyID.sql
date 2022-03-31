
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_verify_stack table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_verify_stack_GetByTaskVerifyID
(

	@TaskVerifyID bigint   
)
AS


				SELECT
					[taskVerifyID],
					[taskID],
					[userID],
					[IsVerified]
				FROM
					[dbo].[task_verify_stack]
				WHERE
					[taskVerifyID] = @TaskVerifyID
				SELECT @@ROWCOUNT
					
			


