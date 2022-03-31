
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_verify_stack table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_verify_stack_GetByTaskID
(

	@TaskID bigint   
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[taskVerifyID],
					[taskID],
					[userID],
					[IsVerified]
				FROM
					[dbo].[task_verify_stack]
				WHERE
					[taskID] = @TaskID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


