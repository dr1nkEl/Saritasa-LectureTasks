
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the task_push table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_push_Insert
(

	@PushID bigint    OUTPUT,

	@TaskID bigint   ,

	@InitiatorID int   ,

	@RecipientID int   ,

	@Created datetime   ,

	@Comment varchar (255)  
)
AS


				
				INSERT INTO [dbo].[task_push]
					(
					[taskID]
					,[initiatorID]
					,[recipientID]
					,[created]
					,[comment]
					)
				VALUES
					(
					@TaskID
					,@InitiatorID
					,@RecipientID
					,@Created
					,@Comment
					)
				
				-- Get the identity value
				SET @PushID = SCOPE_IDENTITY()
									
							
			


