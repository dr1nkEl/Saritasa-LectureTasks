
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Permissions table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[permissions_GetByPermissionID]
(

	@PermissionID int   
)
AS


				SELECT
					[permissionID],
					[RoleId],
					[RuleId]
				FROM
					[dbo].[Permissions]
				WHERE
					[permissionID] = @PermissionID
				SELECT @@ROWCOUNT