
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the task_push table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.task_push_GetByInitiatorID
(

	@InitiatorID int   
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
					[initiatorID] = @InitiatorID
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON
			


