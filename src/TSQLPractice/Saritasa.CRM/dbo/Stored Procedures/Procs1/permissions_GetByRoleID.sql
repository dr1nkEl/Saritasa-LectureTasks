
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the Permissions table through a foreign key
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[permissions_GetByRoleID]
(

	@RoleId char (3)  
)
AS


				SET ANSI_NULLS OFF
				
				SELECT
					[permissionID],
					[RoleId],
					[RuleId]
				FROM
					[dbo].[Permissions]
				WHERE
					[RoleId] = @RoleId
				
				SELECT @@ROWCOUNT
				SET ANSI_NULLS ON