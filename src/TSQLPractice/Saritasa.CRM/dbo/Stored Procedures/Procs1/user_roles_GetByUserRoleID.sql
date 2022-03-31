
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the user_roles table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_roles_GetByUserRoleID
(

	@UserRoleID int   
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
					[userRoleID] = @UserRoleID
				SELECT @@ROWCOUNT
					
			


