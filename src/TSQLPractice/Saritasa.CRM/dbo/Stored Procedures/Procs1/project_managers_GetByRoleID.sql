
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the project_managers table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_managers_GetByRoleID
(

	@RoleID char (3)  
)
AS


				SELECT
					[managerID],
					[projectID],
					[roleID],
					[userID]
				FROM
					[dbo].[project_managers]
				WHERE
					[roleID] = @RoleID
				SELECT @@ROWCOUNT
					
			


