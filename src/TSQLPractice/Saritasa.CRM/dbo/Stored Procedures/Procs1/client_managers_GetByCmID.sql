
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the client_managers table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.client_managers_GetByCmID
(

	@CmID int   
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
					[cmID] = @CmID
				SELECT @@ROWCOUNT
					
			


