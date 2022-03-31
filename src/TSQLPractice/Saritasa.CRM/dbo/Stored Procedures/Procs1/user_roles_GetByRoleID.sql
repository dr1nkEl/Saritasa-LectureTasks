
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the user_roles table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_roles_GetByRoleID
(

	@RoleID char (3)  
)
AS


				SELECT
					[userRoleID],
					[roleID],
					[userID],
					[created]
				FROM
					[dbo].[user_roles]
				WHERE
					[roleID] = @RoleID
				SELECT @@ROWCOUNT
					
			


