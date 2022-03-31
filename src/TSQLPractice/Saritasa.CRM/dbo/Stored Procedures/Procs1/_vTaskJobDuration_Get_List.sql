
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vTaskJobDuration view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vTaskJobDuration_Get_List

AS


				
				SELECT
					[duration],
					[billable],
					[notBillable],
					[documentID],
					[taskID]
				FROM
					[dbo].[_vTaskJobDuration]
					
				SELECT @@ROWCOUNT			
			


