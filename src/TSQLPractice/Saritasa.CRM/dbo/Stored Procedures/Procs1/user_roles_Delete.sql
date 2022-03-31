
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the user_roles table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_roles_Delete
(

	@UserRoleID int   
)
AS


				DELETE FROM [dbo].[user_roles] WITH (ROWLOCK) 
				WHERE
					[userRoleID] = @UserRoleID
					
			


