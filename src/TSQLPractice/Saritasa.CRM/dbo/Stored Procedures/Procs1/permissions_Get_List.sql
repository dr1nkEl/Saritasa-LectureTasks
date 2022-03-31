
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the Permissions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[permissions_Get_List]

AS


				
				SELECT
					[permissionID],
					[RoleId],
					[RuleId]
				FROM
					[dbo].[Permissions]
					
				SELECT @@ROWCOUNT