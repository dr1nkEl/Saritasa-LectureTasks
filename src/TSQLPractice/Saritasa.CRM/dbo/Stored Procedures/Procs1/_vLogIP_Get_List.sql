
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the _vLogIP view
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo._vLogIP_Get_List

AS


				
				SELECT
					[logID],
					[IP],
					[date],
					[login],
					[userID],
					[reason],
					[clear],
					[applicationID],
					[firstName],
					[lastName],
					[fullName]
				FROM
					[dbo].[_vLogIP]
					
				SELECT @@ROWCOUNT			
			


