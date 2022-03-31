
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the LogIP table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[logIP_Get_List]

AS


				
				SELECT
					[logID],
					[IP],
					[Date],
					[Login],
					[UserId],
					[Reason],
					[Clear],
					[ApplicationId]
				FROM
					[dbo].[LogIP]
					
				SELECT @@ROWCOUNT