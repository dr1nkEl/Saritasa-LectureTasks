
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the role_permissions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.role_permissions_Update
(

	@PermissionID int   ,

	@PView bit   ,

	@PEdit bit   ,

	@PAdd bit   ,

	@PDelete bit   ,

	@RoleID char (3)  ,

	@TypeID char (3)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[role_permissions]
				SET
					[pView] = @PView
					,[pEdit] = @PEdit
					,[pAdd] = @PAdd
					,[pDelete] = @PDelete
					,[roleID] = @RoleID
					,[typeID] = @TypeID
				WHERE
[permissionID] = @PermissionID 
				
			


