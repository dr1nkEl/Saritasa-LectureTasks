
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the user_roles table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.user_roles_Insert
(

	@UserRoleID int    OUTPUT,

	@RoleID char (3)  ,

	@UserID int   ,

	@Created datetime   
)
AS


				
				INSERT INTO [dbo].[user_roles]
					(
					[roleID]
					,[userID]
					,[created]
					)
				VALUES
					(
					@RoleID
					,@UserID
					,@Created
					)
				
				-- Get the identity value
				SET @UserRoleID = SCOPE_IDENTITY()
									
							
			


