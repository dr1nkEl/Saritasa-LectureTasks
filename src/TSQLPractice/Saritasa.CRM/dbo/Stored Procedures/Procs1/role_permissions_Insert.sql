
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the role_permissions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.role_permissions_Insert
(

	@PermissionID int    OUTPUT,

	@PView bit   ,

	@PEdit bit   ,

	@PAdd bit   ,

	@PDelete bit   ,

	@RoleID char (3)  ,

	@TypeID char (3)  
)
AS


				
				INSERT INTO [dbo].[role_permissions]
					(
					[pView]
					,[pEdit]
					,[pAdd]
					,[pDelete]
					,[roleID]
					,[typeID]
					)
				VALUES
					(
					@PView
					,@PEdit
					,@PAdd
					,@PDelete
					,@RoleID
					,@TypeID
					)
				
				-- Get the identity value
				SET @PermissionID = SCOPE_IDENTITY()
									
							
			


