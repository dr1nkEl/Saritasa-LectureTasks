
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the user_supervisers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_supervisers_Get_List

AS


				
				SELECT
					[userID],
					[superviserID]
				FROM
					[dbo].[user_supervisers]
					
				SELECT @@ROWCOUNT
			


