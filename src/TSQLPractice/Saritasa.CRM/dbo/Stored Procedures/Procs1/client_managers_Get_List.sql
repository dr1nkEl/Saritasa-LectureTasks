
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the client_managers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.client_managers_Get_List

AS


				
				SELECT
					[cmID],
					[clientID],
					[roleID],
					[employeeUserID]
				FROM
					[dbo].[client_managers]
					
				SELECT @@ROWCOUNT
			


