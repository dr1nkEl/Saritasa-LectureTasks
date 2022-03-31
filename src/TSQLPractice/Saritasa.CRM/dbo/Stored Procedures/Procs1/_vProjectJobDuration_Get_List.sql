
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vProjectJobDuration view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vProjectJobDuration_Get_List

AS


				
				SELECT
					[projectID],
					[duration],
					[currentMonthDuration]
				FROM
					[dbo].[_vProjectJobDuration]
					
				SELECT @@ROWCOUNT			
			


