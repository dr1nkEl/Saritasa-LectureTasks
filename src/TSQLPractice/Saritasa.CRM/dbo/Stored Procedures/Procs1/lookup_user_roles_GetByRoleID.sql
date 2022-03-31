
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_user_roles table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_user_roles_GetByRoleID
(

	@RoleID char (3)  
)
AS


				SELECT
					[roleID],
					[roleName]
				FROM
					[dbo].[lookup_user_roles]
				WHERE
					[roleID] = @RoleID
				SELECT @@ROWCOUNT
					
			


