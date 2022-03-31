
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the task_verify_stack table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_verify_stack_Update
(

	@TaskVerifyID bigint   ,

	@TaskID bigint   ,

	@UserID bigint   ,

	@IsVerified bit   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[task_verify_stack]
				SET
					[taskID] = @TaskID
					,[userID] = @UserID
					,[IsVerified] = @IsVerified
				WHERE
[taskVerifyID] = @TaskVerifyID 
				
			


