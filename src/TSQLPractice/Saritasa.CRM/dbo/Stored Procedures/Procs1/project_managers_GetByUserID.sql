
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the project_managers table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_managers_GetByUserID
(

	@UserID int   
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
					[userID] = @UserID
				SELECT @@ROWCOUNT
					
			


