
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the task_push table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_push_Update
(

	@PushID bigint   ,

	@TaskID bigint   ,

	@InitiatorID int   ,

	@RecipientID int   ,

	@Created datetime   ,

	@Comment varchar (255)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[task_push]
				SET
					[taskID] = @TaskID
					,[initiatorID] = @InitiatorID
					,[recipientID] = @RecipientID
					,[created] = @Created
					,[comment] = @Comment
				WHERE
[pushID] = @PushID 
				
			


