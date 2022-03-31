
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the task_verify_stack table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_verify_stack_Delete
(

	@TaskVerifyID bigint   
)
AS


				DELETE FROM [dbo].[task_verify_stack] WITH (ROWLOCK) 
				WHERE
					[taskVerifyID] = @TaskVerifyID
					
			


