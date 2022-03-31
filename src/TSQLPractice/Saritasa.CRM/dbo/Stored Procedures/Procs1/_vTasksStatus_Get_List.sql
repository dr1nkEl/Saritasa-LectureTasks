
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vTasksStatus view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vTasksStatus_Get_List

AS


				
				SELECT
					[taskID],
					[statusName],
					[Overdue],
					[targetID]
				FROM
					[dbo].[_vTasksStatus]
					
				SELECT @@ROWCOUNT			
			


