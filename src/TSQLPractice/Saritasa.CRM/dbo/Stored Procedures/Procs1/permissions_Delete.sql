
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Permissions table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[permissions_Delete]
(

	@PermissionID int   
)
AS


				DELETE FROM [dbo].[Permissions] WITH (ROWLOCK) 
				WHERE
					[permissionID] = @PermissionID