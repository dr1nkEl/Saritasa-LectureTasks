
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vTaskLastPushes view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vTaskLastPushes_Get_List

AS


				
				SELECT
					[pushId],
					[taskId],
					[createdBy],
					[recipientId],
					[recipientFullName]
				FROM
					[dbo].[_vTaskLastPushes]
					
				SELECT @@ROWCOUNT			
			


