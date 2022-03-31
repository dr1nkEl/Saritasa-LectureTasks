
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the user_roles table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_roles_Update
(

	@UserRoleID int   ,

	@RoleID char (3)  ,

	@UserID int   ,

	@Created datetime   
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[user_roles]
				SET
					[roleID] = @RoleID
					,[userID] = @UserID
					,[created] = @Created
				WHERE
[userRoleID] = @UserRoleID 
				
			


