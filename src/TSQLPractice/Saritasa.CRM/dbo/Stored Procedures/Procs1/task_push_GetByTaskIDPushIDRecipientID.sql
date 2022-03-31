
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_push table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_push_GetByTaskIDPushIDRecipientID
(

	@TaskID bigint   ,

	@PushID bigint   ,

	@RecipientID int   
)
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
				WHERE
					[taskID] = @TaskID
					AND [pushID] = @PushID
					AND [recipientID] = @RecipientID
				SELECT @@ROWCOUNT
					
			


