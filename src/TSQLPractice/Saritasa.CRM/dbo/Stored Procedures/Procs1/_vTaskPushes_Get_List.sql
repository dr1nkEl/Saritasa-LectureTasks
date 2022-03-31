
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vTaskPushes view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vTaskPushes_Get_List

AS


				
				SELECT
					[pushID],
					[taskID],
					[recipientFirstName],
					[recipientLastName],
					[initiatorID],
					[recipientID],
					[createdBy],
					[generalStatusID],
					[finishDate],
					[projectID],
					[projectName],
					[projectDocId],
					[taskDocId],
					[taskName],
					[taskStatusName],
					[recipientEmail]
				FROM
					[dbo].[_vTaskPushes]
					
				SELECT @@ROWCOUNT			
			


