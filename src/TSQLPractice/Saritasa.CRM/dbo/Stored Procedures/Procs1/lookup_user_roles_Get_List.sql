
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the lookup_user_roles table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_user_roles_Get_List

AS


				
				SELECT
					[roleID],
					[roleName]
				FROM
					[dbo].[lookup_user_roles]
					
				SELECT @@ROWCOUNT
			


