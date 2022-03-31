
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the role_permissions table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.role_permissions_GetByRoleID
(

	@RoleID char (3)  
)
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
				WHERE
					[roleID] = @RoleID
				SELECT @@ROWCOUNT
					
			


