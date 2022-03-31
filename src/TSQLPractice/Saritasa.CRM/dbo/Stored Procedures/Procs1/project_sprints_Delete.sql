
/*
----------------------------------------------------------------------------------------------------

-- Created By:  ()
-- Purpose: Deletes a record in the project_sprints table
----------------------------------------------------------------------------------------------------
*/


CREATE PROCEDURE dbo.project_sprints_Delete
(

	@ID int   
)
AS


				DELETE FROM [dbo].[project_sprints] WITH (ROWLOCK) 
				WHERE
					[ID] = @ID
					
			


