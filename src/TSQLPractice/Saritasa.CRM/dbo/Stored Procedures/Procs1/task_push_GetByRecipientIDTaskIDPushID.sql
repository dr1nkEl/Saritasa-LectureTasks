
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_push table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_push_GetByRecipientIDTaskIDPushID
(

	@RecipientID int   ,

	@TaskID bigint   ,

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
					[recipientID] = @RecipientID
					AND [taskID] = @TaskID
					AND [pushID] = @PushID
				SELECT @@ROWCOUNT
					
			


