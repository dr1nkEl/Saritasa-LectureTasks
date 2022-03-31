
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_push table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_push_GetByTaskIDRecipientIDPushID
(

	@TaskID bigint   ,

	@RecipientID int   ,

	@PushID bigint   
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
					AND [recipientID] = @RecipientID
					AND [pushID] = @PushID
				SELECT @@ROWCOUNT
					
			


