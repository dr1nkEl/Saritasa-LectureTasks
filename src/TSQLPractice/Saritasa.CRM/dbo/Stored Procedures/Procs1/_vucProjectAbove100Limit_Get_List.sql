
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vucProjectAbove100Limit view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vucProjectAbove100Limit_Get_List

AS


				
				SELECT
					[projectID],
					[documentID],
					[title],
					[createdBy],
					[durationLimit],
					[duration]
				FROM
					[dbo].[_vucProjectAbove100Limit]
					
				SELECT @@ROWCOUNT			
			


