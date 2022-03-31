
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Updates a record in the Permissions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[permissions_Update]
(

	@PermissionID int   ,

	@RoleId char (3)  ,

	@RuleId varchar (20)  
)
AS


				
				
				-- Modify the updatable columns
				UPDATE
					[dbo].[Permissions]
				SET
					[RoleId] = @RoleId
					,[RuleId] = @RuleId
				WHERE
[permissionID] = @PermissionID