
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the lookup_user_roles table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.lookup_user_roles_GetByRoleName
(

	@RoleName varchar (55)  
)
AS


				SELECT
					[roleID],
					[roleName]
				FROM
					[dbo].[lookup_user_roles]
				WHERE
					[roleName] = @RoleName
				SELECT @@ROWCOUNT
					
			


