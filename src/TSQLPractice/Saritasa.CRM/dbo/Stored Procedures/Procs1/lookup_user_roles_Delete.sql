
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the lookup_user_roles table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_user_roles_Delete
(

	@RoleID char (3)  
)
AS


				DELETE FROM [dbo].[lookup_user_roles] WITH (ROWLOCK) 
				WHERE
					[roleID] = @RoleID
					
			


