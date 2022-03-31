
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Gets all records from the role_permissions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.role_permissions_Get_List

AS


				
				SELECT
					[permissionID],
					[pView],
					[pEdit],
					[pAdd],
					[pDelete],
					[roleID],
					[typeID]
				FROM
					[dbo].[role_permissions]
					
				SELECT @@ROWCOUNT
			


