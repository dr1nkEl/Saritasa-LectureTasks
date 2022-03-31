
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the user_roles table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_roles_Get_List

AS


				
				SELECT
					[userRoleID],
					[roleID],
					[userID],
					[created]
				FROM
					[dbo].[user_roles]
					
				SELECT @@ROWCOUNT
			


