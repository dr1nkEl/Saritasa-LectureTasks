
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vJobsType view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vJobsType_Get_List

AS


				
				SELECT
					[jobID],
					[jobType]
				FROM
					[dbo].[_vJobsType]
					
				SELECT @@ROWCOUNT			
			


