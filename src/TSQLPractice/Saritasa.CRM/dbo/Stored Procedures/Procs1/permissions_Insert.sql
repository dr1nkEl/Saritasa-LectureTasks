
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the Permissions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[permissions_Insert]
(

	@PermissionID int    OUTPUT,

	@RoleId char (3)  ,

	@RuleId varchar (20)  
)
AS


				
				INSERT INTO [dbo].[Permissions]
					(
					[RoleId]
					,[RuleId]
					)
				VALUES
					(
					@RoleId
					,@RuleId
					)
				
				-- Get the identity value
				SET @PermissionID = SCOPE_IDENTITY()