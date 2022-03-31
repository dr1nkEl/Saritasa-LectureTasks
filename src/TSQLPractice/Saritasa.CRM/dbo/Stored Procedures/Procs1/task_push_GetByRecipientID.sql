
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_push table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_push_GetByRecipientID
(

	@RecipientID int   
)
AS


				SET ANSI_NULLS OFF
				
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
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


