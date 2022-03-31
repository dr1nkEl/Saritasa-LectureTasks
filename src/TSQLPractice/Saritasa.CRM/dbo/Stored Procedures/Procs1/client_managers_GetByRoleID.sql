
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the client_managers table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.client_managers_GetByRoleID
(

	@RoleID char (3)  
)
AS


				SELECT
					[cmID],
					[clientID],
					[roleID],
					[employeeUserID]
				FROM
					[dbo].[client_managers]
				WHERE
					[roleID] = @RoleID
				SELECT @@ROWCOUNT
					
			


