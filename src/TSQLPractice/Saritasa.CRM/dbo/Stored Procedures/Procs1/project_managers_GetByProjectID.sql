
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Select records from the project_managers table through an index
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_managers_GetByProjectID
(

	@ProjectID int   
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
					[projectID] = @ProjectID
				SELECT @@ROWCOUNT
					
			


