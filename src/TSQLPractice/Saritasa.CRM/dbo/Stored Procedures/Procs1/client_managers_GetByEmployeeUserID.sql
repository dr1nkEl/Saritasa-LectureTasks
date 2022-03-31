
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the client_managers table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.client_managers_GetByEmployeeUserID
(

	@EmployeeUserID int   
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
					[employeeUserID] = @EmployeeUserID
				SELECT @@ROWCOUNT
					
			


