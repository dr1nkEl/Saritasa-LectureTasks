
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the Projects table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.[projects_Delete]
(

	@ProjectID int   
)
AS


				DELETE FROM [dbo].[Projects] WITH (ROWLOCK) 
				WHERE
					[projectID] = @ProjectID