
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the task_verify_stack table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_verify_stack_Insert
(

	@TaskVerifyID bigint    OUTPUT,

	@TaskID bigint   ,

	@UserID bigint   ,

	@IsVerified bit   
)
AS


				
				INSERT INTO [dbo].[task_verify_stack]
					(
					[taskID]
					,[userID]
					,[IsVerified]
					)
				VALUES
					(
					@TaskID
					,@UserID
					,@IsVerified
					)
				
				-- Get the identity value
				SET @TaskVerifyID = SCOPE_IDENTITY()
									
							
			


