
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the role_permissions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.role_permissions_Delete
(

	@PermissionID int   
)
AS


				DELETE FROM [dbo].[role_permissions] WITH (ROWLOCK) 
				WHERE
					[permissionID] = @PermissionID
					
			


