
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the project_managers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_managers_Get_List

AS


				
				SELECT
					[managerID],
					[projectID],
					[roleID],
					[userID]
				FROM
					[dbo].[project_managers]
					
				SELECT @@ROWCOUNT
			


