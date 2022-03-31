
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Inserts a record into the lookup_user_roles table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_user_roles_Insert
(

	@RoleID char (3)  ,

	@RoleName varchar (55)  
)
AS


				
				INSERT INTO [dbo].[lookup_user_roles]
					(
					[roleID]
					,[roleName]
					)
				VALUES
					(
					@RoleID
					,@RoleName
					)
				
									
							
			


