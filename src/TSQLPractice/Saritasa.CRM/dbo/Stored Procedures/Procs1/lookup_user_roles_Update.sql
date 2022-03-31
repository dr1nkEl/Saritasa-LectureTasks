
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the lookup_user_roles table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_user_roles_Update
(

	@RoleID char (3)  ,

	@OriginalRoleID char (3)  ,

	@RoleName varchar (55)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[lookup_user_roles]
				SET
					[roleID] = @RoleID
					,[roleName] = @RoleName
				WHERE
[roleID] = @OriginalRoleID 
				
			


