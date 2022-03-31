
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the project_managers table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_managers_Delete
(

	@ManagerID int   
)
AS


				DELETE FROM [dbo].[project_managers] WITH (ROWLOCK) 
				WHERE
					[managerID] = @ManagerID
					
			


