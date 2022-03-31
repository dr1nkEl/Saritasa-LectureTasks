
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vJobWithLimit view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vJobWithLimit_Get_List

AS


				
				SELECT
					[duration],
					[finishedWork],
					[createdBy],
					[taskID],
					[isError],
					[errorBy],
					[errorReason]
				FROM
					[dbo].[_vJobWithLimit]
					
				SELECT @@ROWCOUNT			
			


